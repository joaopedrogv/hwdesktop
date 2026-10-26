inherited frmReestruturaVersao20: TfrmReestruturaVersao20
  Caption = 'frmReestruturaVersao20'
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
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO336'#39', :COD_EMPRESA, '#39'BT' +
          ' HABILITAR ALTERACAO ESTOQUE'#39', 10, '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', '#39'N'#39 +
          ', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW PRODISENTO_PISCOFINS('
        '    TIPO,'
        '    DATA_LANC,'
        '    NUM_NF_CUMPOM,'
        '    NSERIEECF,'
        '    COD_TERMINAL,'
        '    NITEM,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    NUM_FAB_PROD,'
        '    NBM,'
        '    DESCR_PROD,'
        '    QUANTIDADE,'
        '    VALOR_UNITARIO,'
        '    VALOR_TOTAL,'
        '    NCM,'
        '    COD_EMPRESA,'
        '    CST_PIS)'
        'AS'
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
        'inf.cod_empresa,'
        
          'case when (p.isento_pis = '#39'S'#39') then '#39'07'#39' else p.cst_pis end cst_' +
          'pis'
        'from notafiscal nf'
        
          'inner join notafiscal_item inf on nf.cod_nf=inf.cod_nf and nf.co' +
          'd_empresa=inf.cod_empresa'
        
          'inner join produtos p on inf.grupo_prod=p.grupo_prod and inf.cod' +
          '_prod=p.cod_prod and inf.cod_empresa=p.cod_empresa'
        'where p.nbm is not null and p.nbm<>'#39#39' and p.ativo=1'
        
          'and case when (p.isento_pis = '#39'S'#39') then '#39'07'#39' else p.cst_pis end ' +
          'in ('#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'07'#39')'
        'and nf.status ='#39'Fechada'#39' and nf.situacao_nfe='#39'Autorizada'#39
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
        'c2.cod_empresa,'
        
          'case when (p.isento_pis = '#39'S'#39') then '#39'07'#39' else p.cst_pis end cst_' +
          'pis'
        'from cupom c'
        
          'inner join cupom2 c2 on c.cod_terminal=c2.cod_terminal and c.nse' +
          'rieecf=c2.nserieecf and c.cupom = c2.cupom and c.registro=c2.ord' +
          'em and c.cod_empresa =c2.cod_empresa'
        
          'inner join produtos p on c2.grupo_prod=p.grupo_prod and c2.cod_p' +
          'rod=p.cod_prod and c2.cod_empresa=p.cod_empresa'
        'where p.nbm is not null and p.nbm<>'#39#39' and p.ativo=1'
        
          'and case when (p.isento_pis = '#39'S'#39') then '#39'07'#39' else p.cst_pis end ' +
          'in ('#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'07'#39')'
        'and (c.status_cp is null or (c.status_cp<>'#39'CANCELADO'#39'))'
        'union'
        'select '#39'NFD'#39' tipo,'
        'nd.dataemissao,'
        'nd.numeronota,'
        'null as nserieecf,'
        'null as cod_terminal,'
        'ndi.nitem,'
        'p.grupo_prod,'
        'p.cod_prod, '
        'p.num_fab_prod,'
        'p.nbm,'
        'p.descr_prod,'
        'ndi.quantid_item,'
        'coalesce(ndi.vl_tot_item,0) VALOR_TOTAL,'
        'coalesce(ndi.vl_tot_item,0) VALOR_LIQUIDO,'
        #39#39' as NCM,'
        'ndi.cod_empresa,'
        
          'case when (p.isento_pis = '#39'S'#39') then '#39'07'#39' else p.cst_pis end cst_' +
          'pis '
        'from nf_serie_d_itens ndi'
        
          'inner join nf_serie_d nd on nd.numeronota = ndi.numeronota and n' +
          'd.cod_empresa = ndi.cod_empresa'
        
          'inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod' +
          '_prod = ndi.cod_prod and p.cod_empresa = ndi.cod_empresa'
        'where p.nbm is not null and p.nbm<>'#39#39' and p.ativo=1'
        'and nd.status = '#39'FECHADA'#39
        
          'and case when (p.isento_pis = '#39'S'#39') then '#39'07'#39' else p.cst_pis end ' +
          'in ('#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'07'#39')'
        'union'
        'select '#39'NFC'#39' tipo,'
        'nfc.data_lanc,'
        'nfc.num_nf,'
        'null as nserieecf,'
        'null as cod_terminal,'
        'nfci.nitem,'
        'p.grupo_prod,'
        'p.cod_prod,'
        'p.num_fab_prod,'
        'p.nbm,'
        'p.descr_prod,'
        'nfci.qcom,'
        'coalesce(nfci.vuncom, 0) as valor_unitario,'
        'coalesce(nfci.vprod, 0) as valor_total,'
        #39#39' as NCM,'
        'nfci.cod_empresa,'
        
          'case when (p.isento_pis = '#39'S'#39') then '#39'07'#39' else p.cst_pis end cst_' +
          'pis from nfce nfc'
        
          'inner join nfce_item nfci on nfci.cod_nfce = nfc.cod_nfce and nf' +
          'ci.cod_empresa = nfc.cod_empresa'
        
          'inner join produtos p on nfci.grupo_prod=p.grupo_prod and nfci.c' +
          'od_prod=p.cod_prod and nfci.cod_empresa=p.cod_empresa'
        'where p.nbm is not null and p.nbm<>'#39#39' and p.ativo=1'
        'and nfc.status = '#39'Fechada'#39' and nfc.situacao_nfce = '#39'Autorizada'#39
        
          'and case when (p.isento_pis = '#39'S'#39') then '#39'07'#39' else p.cst_pis end ' +
          'in ('#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'07'#39')'
        'order by 1,2;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW SPED_PRESUMIDO*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW PROD_PISCOFINS('
        '    TIPO,'
        '    NATUREZA_NF,'
        '    DATA_LANC,'
        '    NUM_NF_CUMPOM,'
        '    NSERIEECF,'
        '    COD_TERMINAL,'
        '    NITEM,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    NUM_FAB_PROD,'
        '    NBM,'
        '    DESCR_PROD,'
        '    QUANTIDADE,'
        '    VALOR_UNITARIO,'
        '    VALOR_TOTAL,'
        '    NCM,'
        '    COD_EMPRESA,'
        '    VALOR_PIS,'
        '    VALOR_COFINS,'
        '    TOTPIS_COFINS)'
        'AS'
        'select'
        #39'NF'#39' as Tipo,'
        'nf.natureza_nf,'
        'nf.data_lanc,'
        'nf.num_nf,'
        'null as nserieecf,'
        '0 as cod_terminal,'
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
        'inf.cod_empresa,'
        'coalesce(inf.valor_pis,0) as valor_pis,'
        'coalesce(inf.valor_cofins,0) as valor_cofins,'
        'coalesce((inf.valor_pis + inf.valor_cofins),0) as totPIS_COFINS'
        'from notafiscal nf'
        
          'inner join notafiscal_item inf on nf.cod_nf=inf.cod_nf and nf.co' +
          'd_empresa=inf.cod_empresa'
        
          'inner join produtos p on inf.grupo_prod=p.grupo_prod and inf.cod' +
          '_prod=p.cod_prod and inf.cod_empresa=p.cod_empresa'
        'where p.ativo=1 and (nf.status ='#39'Fechada'#39')'
        'union'
        'select'
        #39'ECF'#39' as Tipo,'
        #39'S'#39' as natureza_nf,'
        'c.data,'
        'c.cupom, '
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
        'c2.cod_empresa,'
        'coalesce(c2.valor_pis,0) as valor_pis,'
        'coalesce(c2.valor_cofins,0) as valor_cofins,'
        'coalesce((c2.valor_pis + c2.valor_cofins),0) as totPIS_COFINS'
        'from cupom c'
        
          'inner join cupom2 c2 on c.cod_terminal=c2.cod_terminal and c.nse' +
          'rieecf=c2.nserieecf and c.cupom = c2.cupom and c.cod_empresa =c2' +
          '.cod_empresa and c.registro = c2.ordem'
        
          'inner join produtos p on c2.grupo_prod=p.grupo_prod and c2.cod_p' +
          'rod=p.cod_prod and c2.cod_empresa=p.cod_empresa'
        
          'where p.ativo=1 and (c.status_cp is null or c.status_cp<>'#39'CANCEL' +
          'ADO'#39')'
        'union'
        'select '#39'NFD'#39' as Tipo,'
        #39'S'#39' as natureza_nf,'
        'nd.dataemissao,'
        'nd.numeronota,'
        'null as nserieecf,'
        '0 as cod_terminal,'
        'ndi.nitem,'
        'p.grupo_prod,'
        'p.cod_prod,'
        'p.num_fab_prod,'
        'p.nbm,'
        'p.descr_prod,'
        'coalesce(ndi.quantid_item, 0) as quantidade,'
        'coalesce(ndi.vl_un_item,0) valor_unitario,'
        'coalesce(ndi.vl_tot_item,0) valor_total,'
        #39#39' as NCM,'
        'nd.cod_empresa,'
        '0 valor_pis,'
        '0 valor_cofins,'
        '0 totPIS_COFINS'
        'from nf_serie_d_itens ndi'
        
          'inner join nf_serie_d nd on nd.numeronota = ndi.numeronota and n' +
          'd.cod_empresa = ndi.cod_empresa'
        
          'inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod' +
          '_prod = ndi.cod_prod and p.cod_empresa = ndi.cod_empresa'
        'where p.ativo = 1 and nd.status = '#39'FECHADA'#39
        'union'
        'select '#39'NFC'#39' tipo,'
        #39'S'#39' as natureza_nf,'
        'nfc.data_lanc,'
        'nfc.num_nf,'
        'null as nserieecf,'
        '0 as cod_terminal,'
        'nfci.nitem,'
        'p.grupo_prod,'
        'p.cod_prod,'
        'p.num_fab_prod,'
        'p.nbm,'
        'p.descr_prod,'
        'coalesce(nfci.qcom, 0) quantidade,'
        'coalesce(nfci.vuncom, 0) valor_unitario,'
        'coalesce(nfci.vprod, 0) valor_total,'
        #39#39' as NCM,'
        'nfc.cod_empresa,'
        '0 valor_pis,'
        '0 valor_cofins,'
        '0 totPIS_COFINS'
        'from nfce nfc'
        
          'inner join nfce_item nfci on nfci.cod_nfce = nfc.cod_nfce and nf' +
          'ci.cod_empresa = nfc.cod_empresa'
        
          'inner join produtos p on nfci.grupo_prod=p.grupo_prod and nfci.c' +
          'od_prod=p.cod_prod and nfci.cod_empresa=p.cod_empresa'
        
          'where p.ativo = 1 and nfc.status = '#39'Fechada'#39' and nfc.situacao_nf' +
          'ce = '#39'Autorizada'#39
        'order by 1,2;'
        '|/BLOCO|'
        ''
        'ALTER TABLE FORMPAGAMENTO ADD DEB_CRED CHAR(1);'
        'ALTER TABLE FORMPAGAMENTO ADD QTDE_PARC INTEGER;'
        'ALTER TABLE FORMPAGAMENTO ADD COD_BANDEIRA_ADM INTEGER;'
        'ALTER TABLE FORMPAGAMENTO ADD DESC_BANDEIRA VARCHAR(50);'
        'ALTER TABLE CONTROLE_CREDITOS ADD DEB_CRED CHAR(1);'
        'ALTER TABLE ADM_CARTAO ADD TAXA_POR_CONTROLE_BANDEIRA CHAR(1);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW TP_RECCONTAB('
        '    TIPO,'
        '    NUM_NF,'
        '    SERIE,'
        '    TIPO_PED,'
        '    NPED,'
        '    NOME_CTRL,'
        '    DATA_LANC,'
        '    VALOR,'
        '    CFOP,'
        '    FATURAMENTO,'
        '    SEQFORM,'
        '    N_DOC,'
        '    N_NF_SERV,'
        '    N_CUPOM,'
        '    COD_EMPRESA,'
        '    CLIENTE,'
        '    VALOR_NF_SERV,'
        '    NRECIBO)'
        'AS'
        
          'select '#39'NFPR'#39' as tipo,nf.num_nf,nf.serie,pd.tipo as tipo_ped,pd.' +
          'nped,ctrl.nome_contabil,nf.data_lanc,'
        
          'fr.valor_contabil,nf.codigo_nop,nat.faturamento,fr.seqform,fr.nd' +
          'oc,cast(pd.num_nfeext as integer),0,nf.cod_empresa,fr.cliente,pd' +
          '.valor_nfext,fr.REC_NUMVEND'
        'from notafiscal nf'
        
          'left join pedvenda pd on nf.num_nf = pd.num_nf and nf.serie = pd' +
          '.serie_nf and nf.cod_empresa = pd.cod_empresa'
        
          'left join formpagamento fr on pd.tipo = fr.tpdocs and pd.nped = ' +
          'fr.nrequisicao and fr.recibo is null'
        
          'left join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl a' +
          'nd fr.cod_empresa = ctrl.codigo_emp'
        'left join nat_op nat on nat.codigo_nop = nf.codigo_nop'
        
          'where (pd.tipo <> '#39'MOT'#39' and pd.tipo <> '#39'ORC'#39') and  nf.data_lanc ' +
          '>= '#39'02/01/2011'#39
        'and (not ctrl.nome_contabil is null) and  nf.natureza_nf = '#39'S'#39
        
          'and ((nf.modelo_nf = '#39'55'#39' and coalesce(nf.situacao_nfe,'#39#39') = '#39'Au' +
          'torizada'#39')'
        'or (nf.emissao_propria = '#39'S'#39' and nf.modelo_nf <> '#39'55'#39'))'
        '/* and nf.status = '#39'Fechada'#39' */'
        'union'
        
          'select '#39'RECR'#39' as tipo,nf.num_nf,nf.serie,pd.tipo as tipo_ped,pd.' +
          'nped,'
        'case when (select first 1 ctrl.nome_contabil from controles ctrl'
        
          '           inner join formpagamento rc on rc.cod_controle = ctrl' +
          '.codigo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '           where rc.nrequisicao = fr.rec_numvend and rc.cod_empr' +
          'esa = fr.cod_empresa and rc.tpdocs ='#39'REC'#39
        '           order by valordoc asc) is null then'
        '             ctrl.nome_contabil'
        '           else'
        
          '             (select first 1 ctrl.nome_contabil from controles c' +
          'trl'
        
          '             inner join formpagamento rc on rc.cod_controle = ct' +
          'rl.codigo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '             where rc.nrequisicao = fr.rec_numvend and rc.cod_em' +
          'presa = fr.cod_empresa and rc.tpdocs ='#39'REC'#39
        '             order by valordoc asc) end as nome_contabil,'
        
          'nf.data_lanc,fr.valor_contabil,nf.codigo_nop,nat.faturamento,fr.' +
          'seqform,fr.ndoc,cast(pd.num_nfeext as integer),0,nf.cod_empresa,' +
          'fr.cliente,pd.valor_nfext,fr.REC_NUMVEND'
        'from notafiscal nf'
        
          'inner join pedvenda pd on nf.num_nf = pd.num_nf and nf.serie = p' +
          'd.serie_nf and nf.cod_empresa = pd.cod_empresa'
        
          'inner join formpagamento fr on pd.tipo = fr.tpdocs and pd.nped =' +
          ' fr.nrequisicao and (not fr.recibo is null)'
        
          'inner join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl ' +
          'and fr.cod_empresa = ctrl.codigo_emp'
        'left join nat_op nat on nat.codigo_nop = nf.codigo_nop'
        
          'where (pd.tipo <> '#39'MOT'#39' and pd.tipo <> '#39'ORC'#39') and  nf.data_lanc ' +
          '>= '#39'04/01/2011'#39
        'and nf.natureza_nf = '#39'S'#39' and'
        
          '((nf.modelo_nf = '#39'55'#39' and coalesce(nf.situacao_nfe,'#39#39') = '#39'Autori' +
          'zada'#39')'
        'or (nf.emissao_propria = '#39'S'#39' and nf.modelo_nf <> '#39'55'#39'))'
        '/*and nf.status = '#39'Fechada'#39'*/'
        'union'
        
          'select '#39'NFMM'#39' as tipo,nf.num_nf,nf.serie,'#39'MOT'#39' as tipo_ped,nf.n_' +
          'comando as nped,ctrl.nome_contabil,nf.data_lanc,'
        
          'fr.valor_contabil,nf.codigo_nop,nat.faturamento,fr.seqform,fr.nd' +
          'oc,0,0,nf.cod_empresa,fr.cliente,0,0'
        'from notafiscal nf'
        
          'left join formpagamento fr on fr.tpdocs = '#39'MOT'#39' and fr.nrequisic' +
          'ao = nf.n_comando'
        
          'left join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl a' +
          'nd fr.cod_empresa = ctrl.codigo_emp'
        'left join nat_op nat on nat.codigo_nop = nf.codigo_nop'
        'where nf.data_lanc >= '#39'02/01/2011'#39
        
          'and (not ctrl.nome_contabil is null) and (not nf.n_comando is nu' +
          'll) and (fr.recibo is null)'
        'and nf.natureza_nf = '#39'S'#39' and'
        
          '((nf.modelo_nf = '#39'55'#39' and coalesce(nf.situacao_nfe,'#39#39') = '#39'Autori' +
          'zada'#39')'
        'or (nf.emissao_propria = '#39'S'#39' and nf.modelo_nf <> '#39'55'#39'))'
        '/*nf.status = '#39'Fechada'#39'*/'
        'union'
        
          'select '#39'RECM'#39' as tipo,nf.num_nf,nf.serie,'#39'MOT'#39' as tipo_ped,nf.n_' +
          'comando,'
        'case when (select first 1 ctrl.nome_contabil from controles ctrl'
        
          '          inner join formpagamento rc on rc.cod_controle = ctrl.' +
          'codigo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '          where rc.nrequisicao = fr.rec_numvend and rc.cod_empre' +
          'sa = fr.cod_empresa and rc.tpdocs ='#39'REC'#39' order by valordoc asc) ' +
          'is null then'
        '            ctrl.nome_contabil'
        '          else'
        
          '            (select first 1 ctrl.nome_contabil from controles ct' +
          'rl'
        
          '            inner join formpagamento rc on rc.cod_controle = ctr' +
          'l.codigo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '            where rc.nrequisicao = fr.rec_numvend and rc.cod_emp' +
          'resa = fr.cod_empresa and'
        
          '            rc.tpdocs ='#39'REC'#39' order by valordoc asc) end as nome_' +
          'contabil,'
        
          'nf.data_lanc, fr.valor_contabil,nf.codigo_nop,nat.faturamento,fr' +
          '.seqform,fr.ndoc,0,0,nf.cod_empresa,fr.cliente,0,fr.REC_NUMVEND'
        'from notafiscal nf'
        
          'inner join formpagamento fr on fr.tpdocs = '#39'MOT'#39' and NF.n_comand' +
          'o = fr.nrequisicao and (not fr.recibo is null)'
        
          'inner join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl ' +
          'and fr.cod_empresa = ctrl.codigo_emp'
        'left join nat_op nat on nat.codigo_nop = nf.codigo_nop'
        
          'where (not nf.n_comando is null) and  nf.data_lanc >= '#39'02/01/201' +
          '1'#39
        'and nf.natureza_nf = '#39'S'#39' and'
        
          '((nf.modelo_nf = '#39'55'#39' and coalesce(nf.situacao_nfe,'#39#39') = '#39'Autori' +
          'zada'#39')'
        'or (nf.emissao_propria = '#39'S'#39' and nf.modelo_nf <> '#39'55'#39'))'
        '/*nf.status = '#39'Fechada'#39'*/'
        'union'
        
          'select '#39'RCCP'#39' as tipo,0 as num_nf,0,pd.tipo as tipo_ped,pd.nped,' +
          'ctrl.nome_contabil,'
        
          'case when pd.ncupom is null then pd.data_nfext else pd.data_cupo' +
          'm end as data_cupomnf,'
        
          'fr.valor_contabil,0,'#39'S'#39',fr.seqform,fr.ndoc,cast(pd.num_nfeext as' +
          ' integer),pd.ncupom,pd.cod_empresa,fr.cliente,pd.valor_nfext,fr.' +
          'REC_NUMVEND'
        'from pedvenda pd'
        
          'left join formpagamento fr on pd.tipo = fr.tpdocs and pd.nped = ' +
          'fr.nrequisicao and fr.recibo is null'
        
          'left join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl a' +
          'nd fr.cod_empresa = ctrl.codigo_emp'
        
          'where (pd.tipo <> '#39'MOT'#39' and pd.tipo <> '#39'ORC'#39') and  pd.data_fech ' +
          '>= '#39'02/01/2011'#39' /*and (pd.num_nf is null or pd.num_nf = 0)*/'
        'and (not ctrl.nome_contabil is null) and pd.valor_total <> 0'
        'and ((pd.ncupom <> 0 and (not pd.ncupom is null)) /*or'
        '(pd.num_nfeext <> 0 and (not pd.num_nfeext is null))*/)'
        'union'
        
          'select '#39'RCRC'#39' as tipo,0 as num_nf,'#39'0'#39',pd.tipo as tipo_ped,pd.npe' +
          'd,'
        'case when (select first 1 ctrl.nome_contabil from controles ctrl'
        
          '          inner join formpagamento rc on rc.cod_controle = ctrl.' +
          'codigo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '          where rc.nrequisicao = fr.rec_numvend and rc.cod_empre' +
          'sa = fr.cod_empresa and'
        '          rc.tpdocs ='#39'REC'#39' order by valordoc asc) is null then'
        '            ctrl.nome_contabil'
        '          else'
        
          '            (select first 1 ctrl.nome_contabil from controles ct' +
          'rl'
        
          '            inner join formpagamento rc on rc.cod_controle = ctr' +
          'l.codigo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '            where rc.nrequisicao = fr.rec_numvend and rc.cod_emp' +
          'resa = fr.cod_empresa and'
        
          '            rc.tpdocs ='#39'REC'#39' order by valordoc asc) end as nome_' +
          'contabil,'
        'case when pd.ncupom is null then'
        '         pd.data_nfext'
        '     else'
        '         pd.data_cupom end as data_cupomnf,'
        
          'fr.valor_contabil,0,'#39'S'#39',fr.seqform,fr.ndoc,cast(pd.num_nfeext as' +
          ' integer),pd.ncupom,pd.cod_empresa,fr.cliente,pd.valor_nfext,fr.' +
          'REC_NUMVEND'
        'from pedvenda pd'
        
          'inner join formpagamento fr on pd.tipo = fr.tpdocs and pd.nped =' +
          ' fr.nrequisicao and (not fr.recibo is null)'
        
          'inner join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl ' +
          'and fr.cod_empresa = ctrl.codigo_emp'
        
          'where (pd.tipo <> '#39'MOT'#39' and pd.tipo <> '#39'ORC'#39') and  pd.data_fech ' +
          '>= '#39'04/01/2011'#39
        
          '/*and (pd.num_nf is null or pd.num_nf = 0)*/ and pd.valor_total ' +
          '<> 0'
        'and ((pd.ncupom <> 0 and (not pd.ncupom is null)) /*or'
        '(pd.num_nfeext <> 0 and (not pd.num_nfeext is null))*/)'
        'union'
        
          'select '#39'NFSE'#39' as tipo,0 as num_nf,0,pd.tipo as tipo_ped,pd.nped,' +
          'ctrl.nome_contabil,'
        
          'case when pd.ncupom is null then pd.data_nfext else pd.data_cupo' +
          'm end as data_cupomnf,'
        
          'fr.valor_contabil,0,'#39'S'#39',fr.seqform,fr.ndoc,cast(pd.num_nfeext as' +
          ' integer),pd.ncupom,pd.cod_empresa,fr.cliente,'
        
          '(coalesce(pd.valor_nfext,0)+coalesce((select sum(coalesce(ps.irr' +
          'f_servico,0)+coalesce(ps.pisrf_servico,0)+'
        
          'coalesce(ps.cofinsrf_servico,0)+coalesce(ps.csslrf_servico,0)) f' +
          'rom pedvenda_serv ps'
        
          'where ps.nped = pd.nped and ps.tipo = pd.tipo and ps.cod_empresa' +
          ' = pd.cod_empresa),0)) as valor_nfext,fr.REC_NUMVEND'
        'from pedvenda pd'
        
          'left join formpagamento fr on pd.tipo = fr.tpdocs and pd.nped = ' +
          'fr.nrequisicao and fr.recibo is null'
        
          'left join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl a' +
          'nd fr.cod_empresa = ctrl.codigo_emp'
        
          'where (pd.tipo <> '#39'MOT'#39' and pd.tipo <> '#39'ORC'#39') and  pd.data_fech ' +
          '>= '#39'02/01/2011'#39' and (pd.num_nf is null or pd.num_nf = 0)'
        'and (not ctrl.nome_contabil is null) and pd.valor_total <> 0'
        
          'and (pd.ncupom = 0 or (pd.ncupom is null)) and (pd.num_nfeext <>' +
          ' 0 and (not pd.num_nfeext is null))'
        'union'
        
          'select '#39'NFSR'#39' as tipo,0 as num_nf,'#39'0'#39',pd.tipo as tipo_ped,pd.npe' +
          'd,'
        
          'case when (select first 1 ctrl.nome_contabil from controles ctrl' +
          ' inner join formpagamento rc'
        
          '        on rc.cod_controle = ctrl.codigo_ctrl and rc.cod_empresa' +
          ' = ctrl.codigo_emp'
        
          '        where rc.nrequisicao = fr.rec_numvend and rc.cod_empresa' +
          ' = fr.cod_empresa and'
        '        rc.tpdocs ='#39'REC'#39' order by valordoc asc) is null then'
        '            ctrl.nome_contabil'
        '     else'
        '        (select first 1 ctrl.nome_contabil from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.nrequisicao = fr.rec_numvend and rc.cod_empresa' +
          ' = fr.cod_empresa and'
        
          '        rc.tpdocs ='#39'REC'#39' order by valordoc asc) end as nome_cont' +
          'abil,'
        'case when pd.ncupom is null then'
        '        pd.data_nfext'
        '     else'
        '        pd.data_cupom end as data_cupomnf,'
        
          'fr.valor_contabil,0,'#39'S'#39',fr.seqform,fr.ndoc,cast(pd.num_nfeext as' +
          ' integer),pd.ncupom,pd.cod_empresa,fr.cliente,(coalesce(pd.valor' +
          '_nfext,0)+coalesce((select sum(coalesce(ps.irrf_servico,0)+coale' +
          'sce(ps.pisrf_servico,0)+'
        
          'coalesce(ps.cofinsrf_servico,0)+coalesce(ps.csslrf_servico,0)) f' +
          'rom pedvenda_serv ps'
        
          'where ps.nped = pd.nped and ps.tipo = pd.tipo and ps.cod_empresa' +
          ' = pd.cod_empresa),0)) as valor_nfext,fr.REC_NUMVEND'
        'from pedvenda pd'
        
          'inner join formpagamento fr on pd.tipo = fr.tpdocs and pd.nped =' +
          ' fr.nrequisicao and (not fr.recibo is null)'
        
          'inner join controles ctrl on fr.cod_controle = ctrl.codigo_ctrl ' +
          'and fr.cod_empresa = ctrl.codigo_emp'
        
          'where (pd.tipo <> '#39'MOT'#39' and pd.tipo <> '#39'ORC'#39') and  pd.data_fech ' +
          '>= '#39'04/01/2011'#39
        'and (pd.num_nf is null or pd.num_nf = 0) and pd.valor_total <> 0'
        'and (pd.ncupom = 0 or (pd.ncupom is null)) and'
        '(pd.num_nfeext <> 0 and (not pd.num_nfeext is null));'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW TP_RECFINCONTAB('
        '    NOME_CTRL,'
        '    NUM_NF,'
        '    DATA_LANC,'
        '    NCUPOM,'
        '    N_NF_SERV,'
        '    DATA_NF_SERV,'
        '    VALOR_NF_SERV,'
        '    NOME_CLIENTE,'
        '    N_DOC,'
        '    NOME_TERC,'
        '    VALOR_DOC,'
        '    HISTORICO_BAIXA,'
        '    DATA_BAIXA,'
        '    NRECIBO,'
        '    COD_EMPRESA,'
        '    SEQCREDITO,'
        '    DATA_REAL_BX,'
        '    DATA_VENC,'
        '    TP_BAIXA)'
        'AS'
        '/* direto dos creditos para o pedvenda */'
        
          'select ctrl.nome_contabil,pd.num_nf,pd.data_nf,pd.ncupom,cast(pd' +
          '.num_nfeext as integer),pd.data_nfext,pd.valor_nfext,'
        
          'cr.nome_c,cr.n_doc_c,cr.nome_terc,cr.valor_c,(select first 1 l.h' +
          'istorico_l from'
        
          'lancamentos l where l.lote_ent = cr.lote_quit and l.codigo_emp =' +
          ' cr.codigo_emp order by l.lote_ent desc) as historico_baixa,'
        
          'cr.datq_c,0 as nrecibo,cr.codigo_emp,cr.cod_cred,cr.data_baixa,c' +
          'r.data_venc_c,coalesce(cr.tip_baixa,'#39#39') from controle_creditos c' +
          'r'
        
          'inner join pedvenda pd on rtrim(cr.tp_doc_v) = rtrim(pd.tipo) an' +
          'd cr.N_DOC_V ='
        'pd.nped and cr.codigo_emp = pd.cod_empresa'
        
          'inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl a' +
          'nd cr.codigo_emp = ctrl.codigo_emp'
        'where'
        
          'cr.data_venc_c >= '#39'01/01/2011'#39' and (not cr.datq_c is null) and r' +
          'trim(cr.tp_doc_v) in ('#39'OS'#39','#39'REQ'#39')'
        'union'
        
          'select ctrl.nome_contabil,pd.num_nota_v,pd.data_ven,0 as ncupom,' +
          '0 as num_nfeext,null as data_nfext,0 as valor_nfext,'
        
          'cr.nome_c,cr.n_doc_c,cr.nome_terc,cr.valor_c,(select first 1 l.h' +
          'istorico_l from'
        
          'lancamentos l where l.lote_ent = cr.lote_quit and l.codigo_emp =' +
          ' cr.codigo_emp order by l.lote_ent desc) as historico_baixa,'
        
          'cr.datq_c,0 as nrecibo,cr.codigo_emp,cr.cod_cred,cr.data_baixa,c' +
          'r.data_venc_c,coalesce(cr.tip_baixa,'#39#39') from controle_creditos c' +
          'r'
        
          'inner join com_fat pd on cr.N_DOC_V = pd.n_comando and cr.codigo' +
          '_emp = pd.cod_empresa'
        
          'inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl a' +
          'nd cr.codigo_emp = ctrl.codigo_emp'
        'where'
        
          'cr.data_venc_c >= '#39'01/01/2011'#39' and (not cr.datq_c is null) and r' +
          'trim(cr.tp_doc_v) = '#39'MOT'#39
        'and ((not pd.num_nota_v is null) or pd.num_nota_v <> 0)'
        'union'
        
          'select ctrl.nome_contabil,pd.num_nf,pd.data_nf,pd.ncupom,cast(pd' +
          '.num_nfeext as integer),pd.data_nfext,pd.valor_nfext,'
        
          'cr.nome_ch,cr.n_ch,cr.nome_terc,cr.valor_ch,(select first 1 l.hi' +
          'storico_l from'
        
          'lancamentos l where l.lote_ent = cr.lote_quit and l.codigo_emp =' +
          ' cr.codigo_emp order by l.lote_ent desc) as historico_baixa,'
        
          'cr.datq_ch,0 as nrecibo,cr.codigo_emp,cr.codigo_ch,cr.datq_ch,cr' +
          '.data_venc,coalesce(cr.tip_baixa,'#39#39') from controle_cheque cr'
        
          'inner join pedvenda pd on rtrim(cr.tp_doc_v) = rtrim(pd.tipo) an' +
          'd cr.N_DOC_V ='
        'pd.nped and cr.codigo_emp = pd.cod_empresa'
        
          'inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl a' +
          'nd cr.codigo_emp = ctrl.codigo_emp'
        'where'
        
          'cr.data_venc >= '#39'01/01/2011'#39' and (not cr.datq_ch is null) and rt' +
          'rim(cr.tp_doc_v) in ('#39'OS'#39','#39'REQ'#39')'
        'union'
        
          'select ctrl.nome_contabil,pd.num_nota_v,pd.data_ven,0 as ncupom,' +
          '0 as num_nfeext,null as data_nfext,0 as valor_nfext,'
        
          'cr.nome_ch,cr.n_ch,cr.nome_terc,cr.valor_ch,(select first 1 l.hi' +
          'storico_l from'
        
          'lancamentos l where l.lote_ent = cr.lote_quit and l.codigo_emp =' +
          ' cr.codigo_emp order by l.lote_ent desc) as historico_baixa,'
        
          'cr.datq_ch,0 as nrecibo,cr.codigo_emp,cr.codigo_ch,cr.datq_ch,cr' +
          '.data_venc,coalesce(cr.tip_baixa,'#39#39') from controle_cheque cr'
        
          'inner join com_fat pd on cr.N_DOC_V = pd.n_comando and cr.codigo' +
          '_emp = pd.cod_empresa'
        
          'inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl a' +
          'nd cr.codigo_emp = ctrl.codigo_emp'
        'where'
        
          'cr.data_venc >= '#39'01/01/2011'#39' and (not cr.datq_ch is null) and rt' +
          'rim(cr.tp_doc_v) = '#39'MOT'#39
        'and ((not pd.num_nota_v is null) or pd.num_nota_v <> 0)'
        'union'
        'select ctrl.nome_contabil,'
        
          'case when (select first 1 pd.num_nf from hist_rec h inner join p' +
          'edvenda pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) is ' +
          'null then'
        
          '(select first 1 pd.num_nota_v from hist_rec h inner join com_fat' +
          ' pd on'
        
          'h.ndocant = pd.n_comando and h.cod_empresa = pd.cod_empresa and ' +
          'pd.situacao_nfe = '#39'Autorizada'#39' where h.nrecibo = cr.N_DOC_V'
        'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc)'
        'else'
        
          '(select first 1 pd.num_nf from hist_rec h inner join pedvenda pd' +
          ' on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) end' +
          '  as num_nf,'
        
          'case when (select first 1 pd.data_nf from hist_rec h inner join ' +
          'pedvenda pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) is ' +
          'null then'
        
          '(select first 1 pd.data_ven from hist_rec h inner join com_fat p' +
          'd on'
        
          'h.ndocant = pd.n_comando and h.cod_empresa = pd.cod_empresa and ' +
          'pd.situacao_nfe = '#39'Autorizada'#39' where h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) els' +
          'e'
        
          '(select first 1 pd.data_nf from hist_rec h inner join pedvenda p' +
          'd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) end' +
          ' as data_nf,'
        
          '(select first 1 pd.ncupom from hist_rec h inner join pedvenda pd' +
          ' on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) as ' +
          'ncupom,'
        
          'cast((select first 1 pd.num_nfeext from hist_rec h inner join pe' +
          'dvenda pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) as ' +
          'integer) as num_nfeext,'
        
          '(select first 1 pd.data_nfext from hist_rec h inner join pedvend' +
          'a pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) as ' +
          'data_nfext,'
        
          '(select first 1 pd.valor_nfext from hist_rec h inner join pedven' +
          'da pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) as ' +
          'valor_nfext,'
        
          'cr.nome_ch,cr.n_ch,cr.nome_terc,cr.valor_ch,(select first 1 l.hi' +
          'storico_l from'
        
          'lancamentos l where l.lote_ent = cr.lote_quit and l.codigo_emp =' +
          ' cr.codigo_emp order by l.lote_ent desc) as historico_baixa,cr.d' +
          'atq_ch,'
        
          'cr.n_doc_v as nrecibo,cr.codigo_emp,cr.codigo_ch,cr.datq_ch,cr.d' +
          'ata_venc,coalesce(cr.tip_baixa,'#39#39')'
        
          'from controle_cheque cr inner join controles ctrl on cr.codigo_c' +
          'trl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp'
        
          'where cr.data_venc >= '#39'01/01/2011'#39' and (not cr.datq_ch is null) ' +
          'and rtrim(cr.TP_DOC_V) = '#39'REC'#39' and'
        '(cr.tip_baixa is null or cr.tip_baixa = '#39#39')'
        'union'
        'select ctrl.nome_contabil,'
        
          'case when (select first 1 pd.num_nf from hist_rec h inner join p' +
          'edvenda pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) is ' +
          'null then'
        
          '(select first 1 pd.num_nota_v from hist_rec h inner join com_fat' +
          ' pd on'
        
          'h.ndocant = pd.n_comando and h.cod_empresa = pd.cod_empresa and ' +
          'pd.situacao_nfe = '#39'Autorizada'#39' where h.nrecibo = cr.N_DOC_V'
        'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc)'
        'else'
        
          '(select first 1 pd.num_nf from hist_rec h inner join pedvenda pd' +
          ' on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) end' +
          '  as num_nf,'
        
          'case when (select first 1 pd.data_nf from hist_rec h inner join ' +
          'pedvenda pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) is ' +
          'null then'
        
          '(select first 1 pd.data_ven from hist_rec h inner join com_fat p' +
          'd on'
        
          'h.ndocant = pd.n_comando and h.cod_empresa = pd.cod_empresa and ' +
          'pd.situacao_nfe = '#39'Autorizada'#39' where h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) els' +
          'e'
        
          '(select first 1 pd.data_nf from hist_rec h inner join pedvenda p' +
          'd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) end' +
          ' as data_nf,'
        
          '(select first 1 pd.ncupom from hist_rec h inner join pedvenda pd' +
          ' on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) as ' +
          'ncupom,'
        
          'cast((select first 1 pd.num_nfeext from hist_rec h inner join pe' +
          'dvenda pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) as ' +
          'integer) as num_nfeext,'
        
          '(select first 1 pd.data_nfext from hist_rec h inner join pedvend' +
          'a pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) as ' +
          'data_nfext,'
        
          '(select first 1 pd.valor_nfext from hist_rec h inner join pedven' +
          'da pd on h.tp_doc_baixa = pd.tipo'
        
          'and h.ndocant = pd.nped and h.cod_empresa = pd.cod_empresa where' +
          ' h.nrecibo = cr.N_DOC_V'
        
          'and h.cod_empresa = cr.codigo_emp order by valor_baixa desc) as ' +
          'valor_nfext,'
        
          'cr.nome_c,cr.n_doc_c,cr.nome_terc,cr.valor_c,(select first 1 l.h' +
          'istorico_l from'
        
          'lancamentos l where l.lote_ent = cr.lote_quit and l.codigo_emp =' +
          ' cr.codigo_emp order by l.lote_ent desc) as historico_baixa,cr.d' +
          'atq_c,'
        
          'cr.n_doc_v as nrecibo,cr.codigo_emp,cr.cod_cred,cr.data_baixa,cr' +
          '.data_venc_c,coalesce(cr.tip_baixa,'#39#39')'
        
          'from controle_creditos cr inner join controles ctrl on cr.codigo' +
          '_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp'
        
          'where cr.data_venc_c >= '#39'01/01/2011'#39' and (not cr.datq_c is null)' +
          ' and rtrim(cr.TP_DOC_V) = '#39'REC'#39
        'and (cr.tip_baixa is null or cr.tip_baixa = '#39#39');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure RESUMO_FINANCEIRO_UNIFICADO ('
        '    PDTINI date,'
        '    PDTFIM date,'
        '    PCOD_EMPRESA integer,'
        '    PREGIMECAIXA char(1),'
        '    PTODASCONTAS char(1),'
        '    PAGRUPARUNIFADA char(1),'
        '    PCODEMPUNIFICADA integer)'
        'returns ('
        '    TPDTQUIT_DTREF integer,'
        '    TIPO_DESP varchar(10),'
        '    TIPO varchar(11),'
        '    COD_EMPRESA integer,'
        '    COD_EMP_MULT integer,'
        '    N_CONTA_PLC double precision,'
        '    DTQUIT_DTREF timestamp,'
        '    NDOC varchar(50),'
        '    VALOR double precision,'
        '    HISTORICO varchar(200),'
        '    DATA timestamp,'
        '    COD_LANC integer,'
        '    VALOR_PAGO double precision,'
        '    DESC_PADR varchar(50),'
        '    DESC_SUB_CT varchar(50),'
        '    FORNECEDOR varchar(100),'
        '    NOME_CTRL varchar(50),'
        '    EXIBIR_RESUMO_FINANCEIRO char(1),'
        '    DATA_INI timestamp,'
        '    DATA_FIM timestamp,'
        '    ATIVO integer,'
        '    ORDEM integer,'
        '    DESC_GR varchar(50),'
        '    DESC_DEP varchar(50))'
        'as'
        'declare variable VCAMPO varchar(15);'
        'declare variable VTEMP varchar(100);'
        'declare variable VTEMPCODEMP varchar(100);'
        'declare variable VTEMPTODAS varchar(2000);'
        'declare variable VFINANCEIRO_UNIFICADO char(1);'
        'declare variable VEMP_UNIFICADA integer;'
        'begin'
        '  /* Procedure Text */'
        '  VCAMPO = '#39'COD_EMPRESA'#39';'
        '  VTEMP = '#39#39';'
        '  VTEMPCODEMP = '#39#39';'
        '  VTEMPTODAS = '#39#39';'
        ''
        '  VFINANCEIRO_UNIFICADO = '#39#39';'
        '  VEMP_UNIFICADA = 0;'
        ''
        '  select codigo_unificadora, financeiro_unificado from empresa'
        
          '  where cod_empresa = :pcod_empresa into :vemp_unificada, :vfina' +
          'nceiro_unificado;'
        ''
        
          '  if ((coalesce(vfinanceiro_unificado, '#39'N'#39') = '#39'S'#39') and (vemp_uni' +
          'ficada > 0) and (pcodempunificada > 0)) then'
        '  begin'
        '    if (vemp_unificada = pcod_empresa) then'
        '      VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcodempunificada;'
        '    else'
        '      VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcod_empresa;  '
        '     VCAMPO = '#39'COD_EMP_MULT'#39';'
        '  end'
        '  else'
        '    VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcod_empresa;'
        '    '
        '  if (pregimecaixa = '#39'S'#39') then'
        '    VTEMP = '#39' and tpdtquit_dtref = 1'#39';'
        '  else'
        '    VTEMP = '#39' and tpdtquit_dtref = 2'#39';'
        ''
        '  if (ptodascontas <> '#39'S'#39') then'
        '    VTEMP = VTEMP || '#39' and trim(tipo) <> '#39#39'TODAS'#39#39' '#39';'
        ''
        '  FOR EXECUTE STATEMENT'
        '  '#39' select cod_empresa from empresa'
        '    where ativo = 1 '#39' || VTEMPCODEMP into :cod_empresa  do'
        '  begin'
        '    IF (COALESCE(PTODASCONTAS, '#39#39') = '#39'S'#39') THEN'
        '       VTEMPTODAS = '#39' union'
        
          '        select distinct 1, '#39#39'LANC'#39#39', '#39#39'TODAS'#39#39', cast('#39'||:cod_emp' +
          'resa||'#39' as integer), cast('#39'||:cod_empresa||'#39' as integer),'
        
          '        p.n_conta_plc, null datq_l, '#39#39#39#39' ndoc_l, 0 valor_l, '#39#39#39#39 +
          ' historico_l, null data, 0 cod_lanc, 0 valor_l,'
        
          '        case when trim(coalesce(p.desc_padr, '#39#39#39#39')) = '#39#39#39#39' then ' +
          'p.desc_plc else p.desc_padr end desc_padr,'
        '        s.desc_sub_ct, p.tipo_ctp, '#39#39'S'#39#39', '#39#39#39#39' nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        p.ativo, 1 ordem, c.desc_gr, ct.desc_dep from p_contas p'
        
          '        inner join grupos_ct c on p.grup_ct = c.grup_ct and c.ti' +
          'po_gr = '#39#39'S'#39#39
        '        left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct'
        '        left join depart_ct ct on ct.cod_dep = c.cod_dep'
        '        UNION'
        
          '        select distinct 2, '#39#39'LANC'#39#39', '#39#39'TODAS'#39#39', cast('#39'||:cod_emp' +
          'resa||'#39' as integer), cast('#39'||:cod_empresa||'#39' as integer),'
        
          '        p.n_conta_plc, null dtreferencia, '#39#39#39#39' ndoc_l, 0 valor_l' +
          ', '#39#39#39#39' historico_l, null data, 0 cod_lanc, 0 valor_l,'
        
          '        case when trim(coalesce(p.desc_padr, '#39#39#39#39')) = '#39#39#39#39' then ' +
          'p.desc_plc else p.desc_padr end desc_padr,'
        '        s.desc_sub_ct, p.tipo_ctp, '#39#39'S'#39#39', '#39#39#39#39' nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        p.ativo, 1 ordem, c.desc_gr, ct.desc_dep from p_contas p'
        
          '        inner join grupos_ct c on p.grup_ct = c.grup_ct and c.ti' +
          'po_gr = '#39#39'S'#39#39
        '        left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct'
        '        left join depart_ct ct on ct.cod_dep = c.cod_dep '#39';'
        ''
        '    FOR EXECUTE STATEMENT'
        
          '    '#39' select tpdtquit_dtref, tipo_desp, tipo, cod_empresa, cod_e' +
          'mp_mult,'
        '        n_conta_plc, dtquit_dtref, ndoc, valor, historico, data,'
        
          '        cod_lanc, valor_pago, desc_padr, desc_sub_ct, fornecedor' +
          ','
        '        exibir_resumo_financeiro, nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        ativo, ordem, desc_gr, desc_dep from resumo_financeiro'
        '        where ((dtquit_dtref  >= '#39#39#39'||:pdtini||'#39#39#39
        '        and dtquit_dtref <= '#39#39#39'||:pdtfim||'#39#39#39'))'
        
          '        and '#39' || :vcampo || '#39' = '#39'||:cod_empresa|| vtemp || vtemp' +
          'todas'
        ''
        
          '    into :tpdtquit_dtref, :tipo_desp, :tipo, :cod_empresa, cod_e' +
          'mp_mult,'
        
          '        :n_conta_plc, :dtquit_dtref, :ndoc, :valor, :historico, ' +
          ':data,'
        
          '        :cod_lanc, :valor_pago, :desc_padr, :desc_sub_ct, :forne' +
          'cedor,'
        '        :exibir_resumo_financeiro, :nome_ctrl,'
        
          '        :data_ini, :data_fim, :ativo, :ordem, :desc_gr, :desc_de' +
          'p do'
        '     begin'
        '        if (trim(coalesce(pagruparunifada, '#39#39')) = '#39'S'#39') then '
        '          cod_empresa = pcod_empresa;'
        ''
        '        if (tpdtquit_dtref is not null) then'
        '          suspend;'
        '     end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW SPED_PRESUMIDO*/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG100'#39', :COD_EMPRESA, '#39'BT CONSUL' +
          'TA BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DA' +
          'TE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG101'#39', :COD_EMPRESA, '#39'BT NOVO B' +
          'ANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG102'#39', :COD_EMPRESA, '#39'BT ALTERA' +
          'R BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DAT' +
          'E);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG103'#39', :COD_EMPRESA, '#39'BT ENVIAR' +
          ' PARA LIXEIRA BANDEIRAS CARTAO'#39', 5, '#39'S'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG104'#39', :COD_EMPRESA, '#39'BT EXCLUI' +
          'R DEFINITIVO BANDEIRAS CARTAO'#39', 10, '#39'S'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG105'#39', :COD_EMPRESA, '#39'BT SALVAR' +
          ' BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DATE' +
          ');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG106'#39', :COD_EMPRESA, '#39'BT CANCEL' +
          'A BANDEIRAS CARTAO'#39', 1, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DAT' +
          'E);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG107'#39', :COD_EMPRESA, '#39'BT VER LI' +
          'XEIRA BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG108'#39', :COD_EMPRESA, '#39'BT RESTAU' +
          'RAR REGISTRO BANDERIA CARTAO'#39', 5, '#39'S'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG109'#39', :COD_EMPRESA, '#39'BT CONSUL' +
          'TA TAXAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG110'#39', :COD_EMPRESA, '#39'BT NOVO T' +
          'AXAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG111'#39', :COD_EMPRESA, '#39'BT ALTERA' +
          'R TAXAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG112'#39', :COD_EMPRESA, '#39'BT EXCLUI' +
          'R DEFINITIVO TAXAS CARTAO'#39', 10, '#39'S'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG113'#39', :COD_EMPRESA, '#39'BT SALVAR' +
          ' TAXAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, GRAVAR_AUD' +
          'ITORIA, DATA_MOD_CAD) VALUES ('#39'CXG114'#39', :COD_EMPRESA, '#39'BT CANCEL' +
          'A TAXAS CARTAO'#39', 1, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE CEST_VERSAO ('
        '    ID             INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    VERSAO         VARCHAR(16) NOT NULL,'
        '    DATA_VERSAO    TIMESTAMP,'
        '    DATA_CADASTRO  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,'
        '    TIPO_CADASTRO  SMALLINT DEFAULT 1,'
        '    ATIVO          SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CEST_VERSAO ADD CONSTRAINT PK_CEST_VERSAO PRIMARY KE' +
          'Y (ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CEST_ITEM ('
        '    ITEM         INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DESCRICAO    VARCHAR(128) NOT NULL,'
        '    VERSAO       VARCHAR(16)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CEST_ITEM ADD CONSTRAINT PK_CEST_ITEM PRIMARY KEY (I' +
          'TEM, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CEST_AMBITO ('
        '    ITEM         INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    AMBITO       INTEGER NOT NULL,'
        '    DESCRICAO    BLOB SUB_TYPE 1 SEGMENT SIZE 512,'
        '    VERSAO       VARCHAR(16)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CEST_AMBITO ADD CONSTRAINT PK_CEST_AMBITO PRIMARY KE' +
          'Y (ITEM, COD_EMPRESA, AMBITO);'
        
          'ALTER TABLE CEST_AMBITO ADD CONSTRAINT FK_CEST_AMBITO FOREIGN KE' +
          'Y (ITEM, COD_EMPRESA) REFERENCES CEST_ITEM (ITEM, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CEST_VARIANTE ('
        '    ID                    INTEGER NOT NULL,'
        '    COD_EMPRESA           INTEGER NOT NULL,'
        '    DESCRICAO             VARCHAR(64),'
        '    TIPO                  SMALLINT,'
        '    TIPO_VALOR            SMALLINT,'
        '    ALIQ_ICMS_ESPECIFICA  T_N_GERAL,'
        '    DESCRICAO_ORIGINAL    BLOB SUB_TYPE 1 SEGMENT SIZE 32,'
        '    VERSAO                VARCHAR(16)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CEST_VARIANTE ADD CONSTRAINT PK_CEST_VARIANTE PRIMAR' +
          'Y KEY (ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CEST_ ('
        '    ID                INTEGER NOT NULL,'
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    CEST              VARCHAR(7) NOT NULL,'
        '    AMBITO            INTEGER NOT NULL,'
        '    DESCRICAO         BLOB SUB_TYPE 1 SEGMENT SIZE 128,'
        '    VERSAO            VARCHAR(16),'
        '    DATA_CADASTRO     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,'
        '    DATA_MODIFICACAO  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,'
        '    ATIVO             SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CEST_ ADD CONSTRAINT PK_CEST_ PRIMARY KEY (ID, COD_E' +
          'MPRESA);'
        
          'CREATE UNIQUE INDEX IDX_UNQ_CEST_AMBITO ON CEST_ (CEST, AMBITO, ' +
          'COD_EMPRESA, ATIVO);'
        ''
        '|BLOCO|'
        'CREATE TABLE CEST_NCM ('
        '    CEST_ID        INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    NCM            VARCHAR(8) NOT NULL,'
        '    TIPO_CADASTRO  SMALLINT DEFAULT 1,'
        '    DATA_CADASTRO  TIMESTAMP DEFAULT CURRENT_TIMESTAMP'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CEST_NCM ADD CONSTRAINT PK_CEST_NCM PRIMARY KEY (CES' +
          'T_ID, COD_EMPRESA, NCM);'
        
          'ALTER TABLE CEST_NCM ADD CONSTRAINT FK_CEST_NCM FOREIGN KEY (CES' +
          'T_ID, COD_EMPRESA) REFERENCES CEST_ (ID, COD_EMPRESA) ON UPDATE ' +
          'CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE CEST_MVA ('
        '    ID                INTEGER NOT NULL,'
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    CEST_ID           INTEGER NOT NULL,'
        '    CEST_VARIANTE_ID  INTEGER,'
        '    MVA               T_N_GERAL,'
        '    NCM_EXCECAO       BLOB SUB_TYPE 1 SEGMENT SIZE 8,'
        '    VERSAO            VARCHAR(16),'
        '    DATA_CADASTRO     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,'
        '    DATA_MODIFICACAO  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,'
        '    TIPO_CADASTRO     SMALLINT DEFAULT 1,'
        '    ATIVO             SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CEST_MVA ADD CONSTRAINT PK_CEST_MVA PRIMARY KEY (ID,' +
          ' COD_EMPRESA);'
        
          'ALTER TABLE CEST_MVA ADD CONSTRAINT FK_CEST_MVA FOREIGN KEY (CES' +
          'T_ID, COD_EMPRESA) REFERENCES CEST_ (ID, COD_EMPRESA) ON UPDATE ' +
          'CASCADE;'
        
          'ALTER TABLE CEST_MVA ADD CONSTRAINT FK_CEST_MVA_VAR FOREIGN KEY ' +
          '(CEST_VARIANTE_ID, COD_EMPRESA) REFERENCES CEST_VARIANTE (ID, CO' +
          'D_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CEST_MVA_UF ('
        '    CEST_MVA_ID  INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    UF           CHAR(2) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CEST_MVA_UF ADD CONSTRAINT PK_CEST_MVA_UF PRIMARY KE' +
          'Y (CEST_MVA_ID, COD_EMPRESA, UF);'
        
          'ALTER TABLE CEST_MVA_UF ADD CONSTRAINT FK_CEST_MVA_UF FOREIGN KE' +
          'Y (CEST_MVA_ID, COD_EMPRESA) REFERENCES CEST_MVA (ID, COD_EMPRES' +
          'A) ON DELETE CASCADE ON UPDATE CASCADE;'
        'ALTER TABLE PRODUTOS ADD CEST_VARIANTE_ID INTEGER;'
        
          'ALTER TABLE PRODUTOS ADD CONSTRAINT FK_PRODUTOS_CEST_VARIANTE FO' +
          'REIGN KEY(CEST_VARIANTE_ID, COD_EMPRESA) REFERENCES CEST_VARIANT' +
          'E (ID, COD_EMPRESA);'
        'ALTER TABLE CLIENTES ADD RAMO_ATIVIDADE SMALLINT;'
        ''
        '|BLOCO|'
        'create or alter procedure SP_SQL_SINGLE_RECORD ('
        '    SQL varchar(1024),'
        '    SEPARATOR varchar(16) = '#39', '#39')'
        'returns ('
        '    TEXT blob sub_type 1 segment size 64)'
        'as'
        '  declare variable field_value blob sub_type 1 segment size 64;'
        'begin'
        '  text = '#39#39';'
        '  for execute statement SQL'
        '      into :field_value'
        '  do'
        '  begin'
        '    if (coalesce(trim(field_value), '#39#39') <> '#39#39') then'
        '    begin'
        '      if (text = '#39#39') then'
        '        text = trim(field_value);'
        '      else'
        '        text = text || separator || trim(field_value);'
        '    end'
        '  end'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_AJUSTAR_MVA ('
        '    MVA double precision,'
        '    ALIQINTER double precision,'
        '    ALIQINTRA double precision)'
        'returns ('
        '    MVA_AJ double precision)'
        'as'
        'begin'
        
          '  mva_aj = (( (1 + (mva / 100)) * ((1 - (aliqinter / 100)) / (1 ' +
          '- (aliqintra / 100))) ) - 1 ) * 100;'
        '  mva_aj = round(mva_aj,  2);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO337'#39', :COD_EMPRESA, '#39'BT' +
          ' INCLUIR MVA CEST'#39', 4, '#39'N'#39', '#39'FRMCADCEST_V2'#39', 1, '#39'S'#39', CURRENT_DAT' +
          'E);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO338'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR MVA CEST'#39', 6, '#39'S'#39', '#39'FRMCADCEST_V2'#39', 1, '#39'S'#39', CURRENT_DAT' +
          'E);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO339'#39', :COD_EMPRESA, '#39'BT' +
          ' EDITAR MVA CEST'#39', 4, '#39'N'#39', '#39'FRMCADCEST_V2'#39', 1, '#39'S'#39', CURRENT_DATE' +
          ');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO340'#39', :COD_EMPRESA, '#39'BT' +
          ' INCLUIR NCM CEST'#39', 4, '#39'N'#39', '#39'FRMCADCEST_V2'#39', 1, '#39'S'#39', CURRENT_DAT' +
          'E);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO341'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR NCM CEST'#39', 6, '#39'S'#39', '#39'FRMCADCEST_V2'#39', 1, '#39'S'#39', CURRENT_DAT' +
          'E);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO342'#39', :COD_EMPRESA, '#39'BT' +
          ' RESTAURAR CEST'#39', 6, '#39'FRMCADCEST_V2'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE)' +
          ';'
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
        
          '      new.iss_vissret = 0;                                     n' +
          'ew.iss_retido = '#39'N'#39';'
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
        'ALTER TABLE FORMULA_PRODUCAO ADD UNIDADE VARCHAR(3);'
        'ALTER TABLE FORMULA_PRODUCAO ADD TIPO_CONVERSAO CHAR(1);'
        'ALTER TABLE PRODUCAO ADD TIPO_CONVERSAO CHAR(1);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR099'#39', :COD_EMPRESA, '#39'BT' +
          ' GERAR BOLETOS PELO CREDITO'#39', 5, '#39'.'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE)' +
          ';'
        
          'ALTER TABLE CLIENTES_COM_CONTRATO ADD OBS BLOB SUB_TYPE 1 SEGMEN' +
          'T SIZE 80;'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 128, RDB$CHARACTER_LENG' +
          'TH = 128 where RDB$FIELD_NAME = (select rdb$field_source from rd' +
          'b$relation_fields where rdb$relation_name = '#39'BOLETAS'#39' and rdb$fi' +
          'eld_name = '#39'OBS_BOL1'#39');'
        'ALTER TABLE PEDVENDA ADD EMAIL VARCHAR(60);'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 4,' +
          ' RDB$CHARACTER_LENGTH = 4, RDB$COLLATION_ID = 0 where RDB$FIELD_' +
          'NAME = (select trim(f.rdb$field_name) from rdb$relation_fields r' +
          ' join rdb$fields f on f.rdb$field_name = rdb$field_source where ' +
          '(r.rdb$relation_name = '#39'SERVICO_TRANSPORTE'#39') and (r.rdb$field_na' +
          'me='#39'SERIE'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 3,' +
          ' RDB$CHARACTER_LENGTH = 3, RDB$COLLATION_ID = 0 where RDB$FIELD_' +
          'NAME = (select trim(f.rdb$field_name) from rdb$relation_fields r' +
          ' join rdb$fields f on f.rdb$field_name = rdb$field_source where ' +
          '(r.rdb$relation_name = '#39'SERVICO_TRANSPORTE'#39') and (r.rdb$field_na' +
          'me='#39'SUB_SERIE'#39'));'
        'ALTER TABLE HIST_REC ADD OP_CXL INTEGER;'
        
          'CMD:REPL|UPDATE HIST_REC SET OP_CXL = COD_US WHERE OP_CXL IS NUL' +
          'L;'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'PERM FECHA' +
          'R FINANC SEM IMPORT FORMAS DE PAGAMENTO'#39' WHERE COD_PROCESSO = '#39'L' +
          'ANC027'#39';'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET COD_PROCESSO = '#39'HW479'#39' WHER' +
          'E NOME_PROCESSO = '#39'PERM FECHAR CAIXA AUXILIAR COM DIFERENCA'#39';'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET COD_PROCESSO = '#39'HW539'#39' WHER' +
          'E NOME_PROCESSO = '#39'PERM FECHAR CAIXA AUXILIAR DOCUMENTO SEM RECE' +
          'BER'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC047'#39', :COD_EMPRESA, '#39'P' +
          'ERM FECHAR FINANC COM DOCUMENTO SEM RECEBIMENTO'#39', 1, '#39'...'#39', 1, '#39 +
          'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'PERM FECHA' +
          'R FINANCEIRO COM DIFERENCA'#39' WHERE COD_PROCESSO = '#39'LANC021'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0219'#39', :COD_EMPRESA, '#39'IM' +
          'PORTAR XML DE NF-E SAIDA'#39', 100, '#39'S'#39', '#39'...'#39', 1, '#39'S'#39', CURRENT_DATE' +
          ');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0220'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR IMPORTACAO XML DE NF-E SAIDA'#39', 100, '#39'N'#39', '#39'...'#39', 1, '#39'S'#39', ' +
          'CURRENT_DATE);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS4*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS*/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'EMITIR CUP' +
          'OM FISCAL REQ'#39' WHERE COD_PROCESSO = '#39'VND136'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND252'#39', :COD_EMPRESA, '#39'EM' +
          'ITIR CUPOM FISCAL OS'#39', 10, '#39'N'#39', '#39'FRMCADPEDVENDA'#39', 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        'ALTER TABLE CONTAS_A_PAGAR ADD COD_CONTRAPARTIDA_CTP INTEGER;'
        'ALTER TABLE CONTROLE_CREDITOS ADD COD_CONTRAPARTIDA_CTP INTEGER;'
        'ALTER TABLE CONTROLE_CHEQUE ADD COD_CONTRAPARTIDA_CTP INTEGER;'
        'ALTER TABLE BAIXA_CREDITOS ADD COD_CONTRAPARTIDA_CTP INTEGER;'
        'ALTER TABLE LANCAMENTOS ADD COD_CONTRAPARTIDA_CTP INTEGER;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR099'#39', :COD_EMPRESA, '#39'BT' +
          ' GERAR BOLETOS PELO CREDITO'#39', 5, '#39'FRMCADCONTASARECEBER'#39', 1, '#39'S'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'ALTER TABLE CLIENTES_COM_CONTRATO ADD OBS BLOB SUB_TYPE 1 SEGMEN' +
          'T SIZE 80;'
        ''
        '|BLOCO|'
        'CREATE TABLE PROD_SIMILARES_GRUPOS ('
        '    COD_GRUPO_SIM   INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    DESCR_GRUPO     VARCHAR(75),'
        '    ATIVO           INTEGER default 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PROD_SIMILARES_GRUPOS ADD CONSTRAINT PK_PROD_SIMILAR' +
          'ES_GRUPOS PRIMARY KEY (COD_GRUPO_SIM, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE PROD_SIMILARES_GRUPOS_ITENS ('
        '    COD_GRUPO_SIM   INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    GRUPO_PROD      INTEGER NOT NULL,'
        '    COD_PROD        CHAR(6) NOT NULL,'
        '    PRINCIPAL       CHAR(1) DEFAULT '#39'N'#39
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PROD_SIMILARES_GRUPOS_ITENS ADD CONSTRAINT PK_PROD_S' +
          'IMILARES_GRUPOS_ITENS PRIMARY KEY (COD_GRUPO_SIM, COD_EMPRESA, G' +
          'RUPO_PROD, COD_PROD);'
        
          'ALTER TABLE PROD_SIMILARES_GRUPOS_ITENS ADD CONSTRAINT FK_PROD_S' +
          'IM_GRUPOS_ITENS_GRUPO FOREIGN KEY (COD_GRUPO_SIM, COD_EMPRESA) R' +
          'EFERENCES PROD_SIMILARES_GRUPOS (COD_GRUPO_SIM, COD_EMPRESA) ON ' +
          'DELETE CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE PROD_SIMILARES_GRUPOS_ITENS ADD CONSTRAINT FK_PROD_S' +
          'IM_GRUPOS_ITENS_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPR' +
          'ESA) REFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON ' +
          'DELETE CASCADE ON UPDATE CASCADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO344'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA PRODUTOS/GRUPO DE SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES' +
          #39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO345'#39', :COD_EMPRESA, '#39'BT' +
          ' PROCURAR GRUPO DE SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES'#39', 1, '#39'N' +
          #39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO346'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO GRUPO DE SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO347'#39', :COD_EMPRESA, '#39'BT' +
          ' EDITAR GRUPO DE SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO348'#39', :COD_EMPRESA, '#39'BT' +
          ' DELETAR GRUPO DE SIMILARES - EXCLUIR PERMANENT'#39', 5, '#39'FRMCADGRUP' +
          'ROSIMILARES'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO349'#39', :COD_EMPRESA, '#39'BT' +
          ' DELETAR GRUPO DE SIMILARES - ENVIAR P/ LIXEIRA'#39', 5, '#39'FRMCADGRUP' +
          'ROSIMILARES'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO350'#39', :COD_EMPRESA, '#39'BT' +
          ' ABRIR LIXEIRA DE GRUPO SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES'#39', ' +
          '1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO351'#39', :COD_EMPRESA, '#39'BT' +
          ' RESTAURAR GRUPO DE SIMILARES'#39', 5, '#39'FRMCADGRUPROSIMILARES'#39', 1, '#39 +
          'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO352'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR GRUPO DE SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO354'#39', :COD_EMPRESA, '#39'BT' +
          ' IMPRIMIR REL. GRUPO DE SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES'#39', ' +
          '1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO355'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO PRODUTO - GRUPO DE SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES'#39',' +
          ' 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO356'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR PRODUTO - GRUPO DE SIMILARES'#39', 3, '#39'FRMCADGRUPROSIMILARES' +
          #39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO357'#39', :COD_EMPRESA, '#39'BT' +
          ' DELETAR PRODUTO - GRUPO DE SIMILARES'#39', 5, '#39'FRMCADGRUPROSIMILARE' +
          'S'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO358'#39', :COD_EMPRESA, '#39'PE' +
          'RM INCLUIR PROD SIMILAR EM OUTRO GRUPO SIMILAR'#39', 10, '#39'FRMCADGRUP' +
          'ROSIMILARES'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO359'#39', :COD_EMPRESA, '#39'AL' +
          'TER PRODUTO PRINCIPAL - GRUPO DE SIMILARES'#39', 5, '#39'FRMCADGRUPROSIM' +
          'ILARES'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_PROD_SIMILARES_ORDEM FOR PROD_SIMILAR' +
          'ES_GRUPOS_ITENS'
        'ACTIVE AFTER DELETE POSITION 0'
        'AS'
        ' declare variable vgrupo_prod integer;'
        ' declare variable vcod_prod char(6);'
        ' declare variable vdescr_grupo varchar(75);'
        'begin'
        '  /* Trigger text */'
        '  if (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        '  if (coalesce(old.principal, '#39'N'#39') <> '#39'S'#39') then'
        '    exit;'
        ''
        
          '  select first 1 pr.descr_prod, ps.grupo_prod, ps.cod_prod from ' +
          'prod_similares_grupos_itens ps'
        
          '  inner join produtos pr on pr.grupo_prod = ps.grupo_prod and pr' +
          '.cod_prod = ps.cod_prod and pr.cod_empresa = ps.cod_empresa'
        
          '  inner join prod_similares_grupos gr on gr.cod_grupo_sim = ps.c' +
          'od_grupo_sim'
        '    and gr.cod_empresa = ps.cod_empresa'
        '  where ps.cod_grupo_sim = old.cod_grupo_sim'
        '  and ps.cod_empresa = old.cod_empresa'
        '  and ps.principal <> '#39'S'#39
        
          '  and not (ps.grupo_prod = old.grupo_prod and ps.cod_prod = old.' +
          'cod_prod)'
        '     into :vdescr_grupo, :vgrupo_prod, :vcod_prod;'
        '  begin'
        
          '     update prod_similares_grupos_itens ps set ps.principal = '#39'S' +
          #39
        '     where ps.cod_grupo_sim = old.cod_grupo_sim'
        '     and ps.cod_empresa = old.cod_empresa'
        '     and ps.grupo_prod = :vgrupo_prod'
        '     and ps.cod_prod = :vcod_prod;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|update or insert into config_sistema (chave, cod_empres' +
          'a, display_, type1_, value1_f, value1_b, ordem) values ('#39'prodsim' +
          'ilar_agrupamento_hab'#39', :cod_empresa, '#39'Habilitar agrupamento de p' +
          'rodutos similar'#39', '#39'boolean'#39', (CASE WHEN ((SELECT COUNT(*) FROM P' +
          'ROD_SIMILARES PR WHERE PR.COD_EMPRESA = :COD_EMPRESA) = 0) THEN ' +
          '1 ELSE 0 END), null, gen_id(inc_ord_config_sistema, 1)) matching' +
          ' (chave, cod_empresa);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR100'#39', :COD_EMPRESA, '#39'MO' +
          'NTAR BOLETO A PARTIR DE CREDITO'#39', 100, '#39'FRMCADCONTASARECEBER'#39', 1' +
          ', '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR101'#39', :COD_EMPRESA, '#39'EM' +
          'ITIR BOLETO DE CREDITO NA CONFIRMACAO'#39', 100, '#39'FRMCADCONTASARECEB' +
          'ER'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE FORMPAGAMENTO ADD COD_COBREBEM INTEGER;'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 40, RDB$CHARACTER_LENGT' +
          'H = 40 where RDB$FIELD_NAME = (select rdb$field_source from rdb$' +
          'relation_fields where rdb$relation_name = '#39'TIPO_VENDAS'#39' and rdb$' +
          'field_name = '#39'TIPO_OS'#39');'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 40, RDB$CHARACTER_LENGT' +
          'H = 40 where RDB$FIELD_NAME = (select rdb$field_source from rdb$' +
          'relation_fields where rdb$relation_name = '#39'GERADOR_OSBOL'#39' and rd' +
          'b$field_name = '#39'STATUS_TMO'#39');'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 40' +
          ', RDB$CHARACTER_LENGTH = 40, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select rdb$field_source from rdb$relation_fields where' +
          ' rdb$relation_name = '#39'PEDVENDA'#39' and rdb$field_name = '#39'ST_TERM_SE' +
          'RV'#39');'
        ''
        '|BLOCO|'
        'create or alter procedure EXISTE_FORMAS ('
        '    PNDOC integer,'
        '    PTIPODOC varchar(6),'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    NDOC integer,'
        '    TIPODOC varchar(6),'
        '    VALOR_TOTAL double precision,'
        '    ENTRADA double precision,'
        '    CREDIARIO char(1),'
        '    VALOR_VALE double precision,'
        '    JUROS double precision,'
        '    PRCSS char(1))'
        'as'
        '  declare variable VSQL varchar(600);'
        '  declare variable VCONFFORMPAGAMENTO varchar(3);'
        '  declare variable VNF integer;'
        '  declare variable VSERIE integer;'
        '  declare variable VTEMP varchar(400);'
        'begin'
        '  VSQL = '#39#39';'
        '  VTEMP = '#39#39';'
        '  /* Procedure Text */'
        
          '  select conf_formpagamento from empresa where cod_empresa = 1 i' +
          'nto :vconfformpagamento;'
        
          '  if ((trim(coalesce(vconfformpagamento, '#39'PED'#39')) = '#39'PED'#39') or (tr' +
          'im(coalesce(ptipodoc, '#39#39')) = '#39'PRE'#39')) then'
        '  begin'
        '    select first 1 fp.nrequisicao, fp.tpdocs,'
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
        
          '    into :ndoc, :tipodoc, :valor_total, :entrada, :crediario, :v' +
          'alor_vale, :prcss, :juros;'
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
        '        '#39' select first 1 fp.nrequisicao, fp.tpdocs,'
        
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
        
          '          into :ndoc, :tipodoc, :valor_total, :entrada, :crediar' +
          'io, :valor_vale, :prcss, :juros;'
        '      end'
        '  end'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE LANCAMENTOS ADD DATA_VENC_CHEQ_L TIMESTAMP;'
        ''
        '|BLOCO|'
        'create or alter procedure DEVOLUCAO_NPED ('
        '    PNPED integer,'
        '    PTIPO_VENDA char(3),'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    TIPO char(3),'
        '    NPED integer,'
        '    TIPO_VENDA char(3),'
        '    COD_EMPRESA integer,'
        '    VALOR_DEV double precision,'
        '    QUANT_DEV double precision)'
        'as'
        'begin'
        '  /* Procedure Text */'
        '  select '#39'DEV'#39' as tipo,'
        
          '  coalesce(dev.cod_venda, 0) nped, coalesce(dev.tipo_venda, '#39#39') ' +
          'tipo_venda, dev.cod_empresa, --dev.data,'
        '  sum((-1)*coalesce((dev.valor * dev.quant), 0)) valor_dev,'
        '  count(distinct(dev.sequencia)) quant_dev from devolucao dev'
        
          '  WHERE dev.cod_venda = :pnped and dev.tipo_venda = :ptipo_venda' +
          ' and dev.cod_empresa = :pcod_empresa'
        '  group by 1, 2, 3, 4'
        
          '  into :tipo, :nped, :tipo_venda, :cod_empresa, :valor_dev, :qua' +
          'nt_dev;'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE NFCE ADD COD_EMISSOR INTEGER NOT NULL;'
        'ALTER TABLE NFCE ADD HASHNFC VARCHAR(32);'
        'ALTER TABLE NFCE ADD NORC INTEGER;'
        'ALTER TABLE NFCE ADD OPERADOR INTEGER;'
        'ALTER TABLE NFCE ADD MOV_ID INTEGER;'
        'ALTER TABLE NFCE ADD MOV_SEQ INTEGER;'
        
          'ALTER TABLE NFCE ADD CONSTRAINT FK_NFCE_OPERADOR FOREIGN KEY (OP' +
          'ERADOR, COD_EMPRESA) REFERENCES COLABORADOR (COD_VENDEDOR, COD_E' +
          'MPRESA) ON UPDATE CASCADE;'
        'ALTER TABLE NFCE_ITEM ADD NITEM_ORC INTEGER;'
        
          'ALTER TABLE NFCE_PAGAMENTO ADD CONSTRAINT FK_NFCE_PAGAMENTO FORE' +
          'IGN KEY (COD_NFCE, COD_EMPRESA) REFERENCES NFCE (COD_NFCE, COD_E' +
          'MPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE INDEX IDX_NFCE_PAGAMENTO ON NFCE_PAGAMENTO (COD_NFCE, COD' +
          '_EMPRESA);'
        'ALTER TABLE NFCE_CONFIG ADD EMAIL_USA_TLS CHAR(1);'
        'ALTER TABLE NFCE_CONFIG ADD WS_LIB_SSL SMALLINT;'
        'ALTER TABLE NFCE_CONFIG ADD XJUST_AUTO VARCHAR(256);'
        
          'ALTER TABLE NFCE_CONFIG ADD CERT_DADOSPFX BLOB SUB_TYPE 1 SEGMEN' +
          'T SIZE 1024;'
        'ALTER TABLE NFC_EMISSOR ADD DH_LAST_ACTIVE TIMESTAMP;'
        'ALTER TABLE NFC_EMISSOR ADD CLIENT_OR_SERVER CHAR(1);'
        'ALTER TABLE NFC_EMISSOR ADD SERVER_AUTORIZACAO CHAR(1);'
        'ALTER TABLE NFC_EMISSOR ADD SERVER_IMPRESSAO CHAR(1);'
        'ALTER TABLE NFC_EMISSOR ADD SERVER_EMAIL CHAR(1);    '
        'ALTER TABLE NFC_EMISSOR ADD LIB_SSL SMALLINT;'
        'ALTER TABLE NFC_EMISSOR ADD LIB_SSLCRYPTLIB SMALLINT;'
        'ALTER TABLE NFC_EMISSOR ADD LIB_SSLHTTPLIB SMALLINT;'
        'ALTER TABLE NFC_EMISSOR ADD LIB_SSLXMLSIGNLIB SMALLINT;'
        
          'ALTER TABLE NFC_CENTRAL_ACOES ADD MSGCOMPLETA BLOB SUB_TYPE 1 SE' +
          'GMENT SIZE 512;'
        
          'ALTER TABLE NFC_CENTRAL_ACOES ADD ID_ADICIONAL  BLOB SUB_TYPE 1 ' +
          'SEGMENT SIZE 128;'
        
          'CREATE INDEX IDX_NFC_CENTRAL_ACOES ON NFC_CENTRAL_ACOES (COD_EMP' +
          'RESA, COD_EMISS_SERV, THREADID, ACAO);'
        'CREATE GENERATOR SEQ_STATUS_SERVICO;'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE_STATUS_SERVICO ('
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    COD_EMISSOR  INTEGER NOT NULL,'
        '    SERVICO      VARCHAR(64),'
        '    MENSAGEM     VARCHAR(256),'
        '    DATAHORA     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,'
        '    STATUS       SMALLINT NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE_STATUS_SERVICO ADD CONSTRAINT PK_NFCE_STATUS_SE' +
          'RVICO PRIMARY KEY (ID);'
        
          'CREATE INDEX IDX_NFCE_STATUS_SERVICO ON NFCE_STATUS_SERVICO (DAT' +
          'AHORA, COD_EMPRESA, STATUS);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NFCE_STATUS_SERVICO_BI_ID FOR NFCE_STATU' +
          'S_SERVICO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (coalesce(new.ID, 0) <= 0) then'
        '    new.ID = next value for SEQ_STATUS_SERVICO;'
        ''
        '  if (new.ID > 99999999) then'
        
          '    execute statement '#39'ALTER SEQUENCE SEQ_STATUS_SERVICO RESTART' +
          ' WITH 0'#39';'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure DATE_OF ('
        '    DATAHORA timestamp)'
        'returns ('
        '    DATA timestamp)'
        'as'
        '  declare variable Y varchar(4);'
        '  declare variable M varchar(2);'
        '  declare variable D varchar(2);'
        'begin'
        
          '  y = substring( (select result from strzero( extract ( YEAR  fr' +
          'om :datahora ), 4)) from  1 for 4);'
        
          '  m = substring( (select result from strzero( extract ( MONTH fr' +
          'om :datahora ), 2)) from  1 for 2);'
        
          '  d = substring( (select result from strzero( extract ( DAY   fr' +
          'om :datahora ), 2)) from  1 for 2);'
        '  data = cast(y ||'#39'-'#39'||m||'#39'-'#39'||d as timestamp);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure DATE_OF_MONTH ('
        '    DATAHORA timestamp)'
        'returns ('
        '    START_DATE timestamp,'
        '    END_DATE timestamp)'
        'as'
        'begin'
        
          '  select dateadd(-extract(day from :DATAHORA) + 1 day to :DATAHO' +
          'RA),'
        
          '         dateadd(+ 30 day to dateadd(-extract(day from :DATAHORA' +
          ') + 1 day to :DATAHORA))'
        '  from RDB$DATABASE'
        '    into :START_DATE, :END_DATE;'
        ''
        
          '  while (extract ( month from :start_date) < extract ( month fro' +
          'm :end_date)) do'
        '  begin'
        '    end_date = dateadd(-1 day to :end_date);'
        '  end'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NFCE_BU_DATA_LANC FOR NFCE'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        '  declare variable dataemissao timestamp;'
        '  declare variable dataini timestamp;'
        '  declare variable datafim timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        
          '  if ((new.situacao_nfce in ('#39'Autorizada'#39', '#39'Denegada'#39', '#39'Cancelad' +
          'a'#39')) and (new.dhemi is not null)) then'
        '  begin'
        '    select start_date, end_date from date_of_month(new.dhemi)'
        '      into :dataini, :datafim;'
        ''
        
          '    if ((new.data_lanc < :dataini) or (new.data_lanc > :datafim)' +
          ') then'
        '    begin'
        '      select data from date_of(new.dhemi) into :dataemissao;'
        ''
        '      if (:dataemissao is not null) then'
        '        new.data_lanc = :dataemissao;'
        '    end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NFCE_BU_NORC FOR NFCE'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (coalesce(old.norc, 0) <> coalesce(new.norc, 0)) then'
        '  begin'
        '    if (coalesce(old.norc, 0) > 0) then'
        
          '      update pedvenda set cod_nfce = null where nped = old.norc ' +
          'and tipo = '#39'ORC'#39' and cod_empresa = old.cod_empresa and cod_nfce ' +
          '= old.cod_nfce;'
        '      '
        '    if (coalesce(new.norc, 0) > 0) then'
        
          '      update pedvenda set cod_nfce = new.norc where nped = new.n' +
          'orc and tipo = '#39'ORC'#39' and cod_empresa = new.cod_empresa and cod_n' +
          'fce is null;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE_MOVIMENTO ('
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DIA_MOV      TIMESTAMP NOT NULL,'
        '    COD_EMISSOR  INTEGER NOT NULL,'
        '    OPERADOR     INTEGER NOT NULL,'
        '    DIA_FECH     TIMESTAMP,'
        '    COUNT_OP     INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE_MOVIMENTO ADD CONSTRAINT PK_NFCE_MOVIMENTO PRIM' +
          'ARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE NFCE_MOVIMENTO ADD CONSTRAINT FK_NFCE_EMISSOR FOREIG' +
          'N KEY (COD_EMISSOR, COD_EMPRESA) REFERENCES NFC_EMISSOR (COD_EMI' +
          'SSOR, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE NFCE_MOVIMENTO ADD CONSTRAINT FK_NFCE_MOVIMENTO_OPER' +
          'ADOR FOREIGN KEY (OPERADOR, COD_EMPRESA) REFERENCES COLABORADOR ' +
          '(COD_VENDEDOR, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE NFCE ADD CONSTRAINT FK_NFCE_MOVIMENTO FOREIGN KEY (M' +
          'OV_ID, COD_EMPRESA) REFERENCES NFCE_MOVIMENTO (ID, COD_EMPRESA) ' +
          'ON UPDATE CASCADE;'
        
          'CREATE EXCEPTION EXC_NFCE_MOVIMENTO '#39'Nao foi possivel abrir movi' +
          'mento para o operador'#39';'
        
          'CREATE EXCEPTION EXC_NFCE_MOV_ABRT_OUT '#39'Emissor com movimento ab' +
          'erto para outro operador'#39';'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NFCE_BI_MOV_OPERADOR FOR NFCE'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        '  declare variable movid integer;'
        '  declare variable operadorid integer;'
        'begin       '
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        
          '  -- mov_id = 0, o sistema preencheu "0" para a trigger obter o ' +
          'id do movimento'
        '  if ((new.mov_id = 0) and (coalesce(new.operador, 0) > 0)) then'
        '  begin'
        '    select first 1 mov.operador, mov.id from nfce_movimento mov'
        
          '      where mov.cod_emissor = new.cod_emissor and mov.cod_empres' +
          'a = new.cod_empresa and mov.dia_fech is null'
        '        order by mov.dia_mov asc'
        '      into :operadorid, :movid;'
        ''
        '    if (coalesce(operadorid, 0) > 0) then'
        
          '      if (coalesce(operadorid, 0) <> coalesce(new.operador, 0)) ' +
          'then'
        '        exception exc_nfce_mov_abrt_out;'
        ''
        '    if (movid is null) then'
        
          '      insert into nfce_movimento (dia_mov, cod_empresa, cod_emis' +
          'sor, operador) values (current_date, new.cod_empresa, new.cod_em' +
          'issor, new.operador)'
        '        returning id into :movid;'
        ''
        '    if (movid is null) then'
        '      exception exc_nfce_movimento;'
        ''
        '    new.mov_id = movid;'
        '  end'
        ''
        '  if ((new.mov_id > 0) and (coalesce(new.mov_seq, 0) = 0)) then'
        '  begin'
        
          '    update nfce_movimento mov set mov.count_op = coalesce(mov.co' +
          'unt_op, 0) + 1'
        
          '      where mov.id = new.mov_id and mov.cod_empresa = new.cod_em' +
          'presa'
        '        returning mov.count_op into new.mov_seq;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NFCE_MOVIMENTO_BI_ID FOR NFCE_MOVIMENTO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (coalesce(new.id, 0) = 0) then'
        '  begin'
        
          '    select max(mov.id) from nfce_movimento mov where mov.cod_emp' +
          'resa = new.cod_empresa'
        '      into new.id;'
        '    new.id = coalesce(new.id, 0) + 1;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE_MOVIMENTO_LANC ('
        '    MOV_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    MOV_SEQ      INTEGER NOT NULL,'
        '    VALOR        T_VL_TODOS,'
        '    HISTORICO    VARCHAR(128)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE_MOVIMENTO_LANC ADD CONSTRAINT PK_NFCE_MOVIMENTO' +
          '_LANC PRIMARY KEY (MOV_ID, COD_EMPRESA, MOV_SEQ);'
        
          'ALTER TABLE NFCE_MOVIMENTO_LANC ADD CONSTRAINT FK_NFCE_MOVIMENTO' +
          '_LANC FOREIGN KEY (MOV_ID, COD_EMPRESA) REFERENCES NFCE_MOVIMENT' +
          'O (ID, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NFCE_MOVIMENTO_LANC_BI_ID FOR NFCE_MOVIM' +
          'ENTO_LANC'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'BEGIN   '
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (coalesce(new.mov_seq, 0) = 0) then'
        '  begin'
        
          '    update nfce_movimento mov set mov.count_op = coalesce(mov.co' +
          'unt_op, 0) + 1'
        
          '      where mov.id = new.mov_id and mov.cod_empresa = new.cod_em' +
          'presa'
        '        returning mov.count_op into new.mov_seq;'
        '  end'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NFCE_TAB_TPAG ('
        '    TPAGID integer)'
        'returns ('
        '    TPAG integer,'
        '    XPAG varchar(32))'
        'as'
        'begin'
        '  if (tpagid = 1) then'
        '  begin'
        '    tpag = 1;'
        '    xpag = '#39'Dinheiro'#39';'
        '  end'
        '  else if (tpagid = 2) then'
        '  begin'
        '    tpag = 2;'
        '    xpag = '#39'Cheque'#39';'
        '  end'
        '  else if (tpagid = 3) then'
        '  begin'
        '    tpag = 3;'
        '    xpag = '#39'Cartao de Credito'#39';'
        '  end'
        '  else if (tpagid = 4) then'
        '  begin'
        '    tpag = 4;'
        '    xpag = '#39'Cartao de Debito'#39';'
        '  end'
        '  else if (tpagid = 5) then'
        '  begin'
        '    tpag = 5;'
        '    xpag = '#39'Credito Loja'#39';'
        '  end'
        '  else if (tpagid = 10) then'
        '  begin'
        '    tpag = 10;'
        '    xpag = '#39'Vale Alimentacao'#39';'
        '  end'
        '  else if (tpagid = 1) then'
        '  begin'
        '    tpag = 11;'
        '    xpag = '#39'Vale Refeicao'#39';'
        '  end'
        '  else if (tpagid = 1) then'
        '  begin'
        '    tpag = 12;'
        '    xpag = '#39'Vale Presente'#39';'
        '  end'
        '  else if (tpagid = 1) then'
        '  begin'
        '    tpag = 13;'
        '    xpag = '#39'Vale Combustivel'#39';'
        '  end'
        '  else if (tpagid = 1) then'
        '  begin'
        '    tpag = 99;'
        '    xpag = '#39'Outros'#39';'
        '  end'
        '  else'
        '  begin     '
        '    tpag = null;'
        '    xpag = null;'
        '  end'
        ''
        '  if (tpag is not null) then'
        '    suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW VW_NFCE_MOVIMENTO'
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
        'END;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC031'#39', :COD_EMPRESA, '#39'HA' +
          'B VISUALIZAR NFCE OUTROS EMISSORES'#39', 1, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'N' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC032'#39', :COD_EMPRESA, '#39'BT' +
          ' ABRIR DIA DE MOVIMENTO NFCE'#39', 4, '#39'S'#39', '#39'FRMCADNFCE'#39', 1, '#39'N'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC033'#39', :COD_EMPRESA, '#39'BT' +
          ' FECHAR DIA DE MOVIMENTO NFCE'#39', 4, '#39'S'#39', '#39'FRMCADNFCE'#39', 1, '#39'N'#39', CU' +
          'RRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC034'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR NFCE MOV.OP. FECHADO'#39', 10, '#39'S'#39', '#39'FRMCADNFCE'#39', 1, '#39'N'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC035'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR PESQUISA DIVERSA MOV.OP'#39', 10, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'N'#39',' +
          ' CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC036'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR ALTERAR LIB SSL'#39', 10, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'N'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|DELETE FROM CONFIG_SISTEMA C WHERE C.CHAVE = '#39'nfc_nfce_' +
          'versao_qrcode'#39' AND COD_EMPRESA = :COD_EMPRESA;'
        
          'CMD:REPL|DELETE FROM CONFIG_SISTEMA C WHERE C.CHAVE = '#39'nfc_nfce_' +
          'tag_nt_2018_005'#39' AND COD_EMPRESA = :COD_EMPRESA;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC037'#39', :COD_EMPRESA, '#39'BT' +
          ' NFCE ABRIR GAVETA'#39', 10, '#39'S'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_DATE' +
          ');'
        ''
        '|BLOCO|'
        'create or alter procedure FORMAS_PROG_FID_DET ('
        '    PDTINI timestamp,'
        '    PDTFIM timestamp,'
        '    PCOD_CLIENTE integer,'
        '    PCOD_EMPRESA integer,'
        '    PREGRA varchar(60),'
        '    PNDOC integer,'
        '    PTIPO char(3),'
        '    PSIMULACAO char(1))'
        'returns ('
        '    NREQUISICAO integer,'
        '    TPDOCS varchar(3),'
        '    DATA_FECH timestamp,'
        '    COD_EMPRESA integer,'
        '    VALORENTRADA double precision,'
        '    VALORTOTAL double precision,'
        '    DEV double precision,'
        '    CRED char(1),'
        '    FP_REGRA_FIDELIDADE varchar(20),'
        '    PERC_DIA_REAL double precision,'
        '    PONTOS double precision)'
        'as'
        'declare variable VTEMP varchar(100);'
        'declare variable VTEMP2 varchar(100);'
        'declare variable VTEMP3 varchar(100);'
        'declare variable VTEMP_REQOS varchar(100);'
        'declare variable VTEMP_MOT varchar(100);'
        'declare variable VPERC_ENT double precision;'
        'begin'
        '  VTEMP = '#39#39';'
        '  VTEMP2 = '#39#39';'
        '  VTEMP3 = '#39#39';'
        '  VTEMP_REQOS = '#39#39';'
        '  VTEMP_MOT = '#39#39';'
        ''
        '  if (COALESCE(PNDOC, 0) > 0) then'
        '  begin'
        
          '    VTEMP = '#39' and pd.nped = '#39'||:pndoc||'#39' and pd.tipo = '#39#39#39'||:pti' +
          'po||'#39#39#39' '#39';'
        '    VTEMP2 = '#39' and cf.n_comando = '#39'||:pndoc||'#39' '#39';'
        '  end'
        '  else'
        '  begin'
        
          '    VTEMP = '#39' and pd.data_fech >= '#39#39#39'||:pdtini||'#39#39#39' and pd.data_' +
          'fech <= '#39#39#39'||:pdtfim||'#39#39#39' '#39';'
        
          '    VTEMP2 = '#39' and cf.data_fech >= '#39#39#39'||:pdtini||'#39#39#39' and cf.data' +
          '_fech <= '#39#39#39'||:pdtfim||'#39#39#39' '#39';'
        '  end'
        ''
        '  if (COALESCE(psimulacao,  '#39'N'#39') = '#39'S'#39') then'
        '  begin'
        
          '    VTEMP3 = '#39' and (select ndev from existe_dev_nf_v(cf.cod_nf, ' +
          'cf.cod_empresa)) = 0 '#39';'
        
          '    VTEMP_REQOS  = '#39' and coalesce(tv.venda, '#39#39'N'#39#39') = '#39#39'S'#39#39' and c' +
          'oalesce(tv.gerar_pontos, '#39#39'N'#39#39') = '#39#39'S'#39#39' '#39';'
        
          '    VTEMP_MOT = '#39' and coalesce(tv.venda, '#39#39'N'#39#39') = '#39#39'S'#39#39' and coal' +
          'esce(tv.gerar_pontos, '#39#39'N'#39#39') = '#39#39'S'#39#39' '#39';'
        '  end'
        '  else'
        '  begin'
        
          '    VTEMP_REQOS  = '#39' and coalesce(pd.tp_venda, tv.venda) = '#39#39'S'#39#39 +
          ' and coalesce(pd.tp_gerar_pontos, tv.gerar_pontos) = '#39#39'S'#39#39' '#39';'
        
          '    VTEMP_MOT = '#39' and coalesce(cf.tp_venda, tv.venda) = '#39#39'S'#39#39' an' +
          'd coalesce(cf.tp_gerar_pontos, tv.gerar_pontos) = '#39#39'S'#39#39' '#39';'
        '  end'
        ''
        '  for execute statement    '
        '  '#39' select pd.nped, pd.tipo, pd.cod_empresa, pd.data_fech,'
        
          '    coalesce((select coalesce(fp3.entrada, 0) from existe_formas' +
          '(pd.nped, pd.tipo, pd.cod_empresa) fp3), 0) entrada,'
        
          '    coalesce((select coalesce(fp2.valor_total, 0) from existe_fo' +
          'rmas(pd.nped, pd.tipo, pd.cod_empresa) fp2), 0) valor_total,'
        
          '    coalesce((select coalesce(fp1.crediario, '#39#39'N'#39#39') from existe_' +
          'formas'
        '      (pd.nped, pd.tipo, pd.cod_empresa) fp1), '#39#39'N'#39#39') crediario,'
        
          '    coalesce((select coalesce(dp.valor_dev, 0) from devolucao_np' +
          'ed (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) dev from pedvenda ' +
          'pd'
        
          '    inner join clientes cl on cl.cod_cliente = pd.cod_cliente an' +
          'd cl.cod_empresa = pd.cod_empresa'
        
          '    left join tipo_faturamento tf on tf.codigo_faturamento = cl.' +
          'codigo_faturamento and tf.ativo = 1'
        
          '    inner join tipo_vendas tv on pd.tipo = tv.tipo and pd.tipv =' +
          ' tv.sigla'
        '        '#39'||VTEMP_REQOS||'#39
        
          '    where trim(pd.tipo) = '#39#39'REQ'#39#39' and coalesce(pd.status_ped, '#39#39 +
          #39#39') = '#39#39'FECHADA'#39#39
        '    '#39'||VTEMP||'#39' and pd.cod_empresa = '#39'||:pcod_empresa||'#39
        '    and (coalesce(pd.valor_total, 0) >'
        
          '        coalesce((select coalesce(abs(dp.valor_dev), 0) from dev' +
          'olucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0))'
        '    and (coalesce(pd.valor_total, 0) >'
        
          '        coalesce((select coalesce(abs(vl.valor_vale), 0) from va' +
          'le_doc_prg (pd.nped, pd.tipo, pd.cod_empresa) vl), 0))'
        '    and coalesce(cl.cl_gerar_pontos, '#39#39'S'#39#39') <> '#39#39'N'#39#39
        '    and coalesce(tf.status_f, '#39#39#39#39') <> '#39#39'BARRADO'#39#39
        '    and pd.cod_cliente <> '#39'||:pcod_cliente||'#39
        '    '
        '    union'
        ''
        '    select pd.nped, pd.tipo, pd.cod_empresa, pd.data_fech,'
        
          '    coalesce((select coalesce(fp3.entrada, 0) from existe_formas' +
          '(pd.nped, pd.tipo, pd.cod_empresa) fp3), 0) entrada,'
        
          '    coalesce((select coalesce(fp2.valor_total, 0) from existe_fo' +
          'rmas(pd.nped, pd.tipo, pd.cod_empresa) fp2), 0) valor_total,'
        
          '    coalesce((select coalesce(fp1.crediario, '#39#39'N'#39#39') from existe_' +
          'formas'
        '      (pd.nped, pd.tipo, pd.cod_empresa) fp1), '#39#39'N'#39#39') crediario,'
        
          '     coalesce((select coalesce(dp.valor_dev, 0) from devolucao_n' +
          'ped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) dev from pedvenda' +
          ' pd'
        
          '    inner join clientes cl on cl.cod_cliente = pd.cod_cliente an' +
          'd cl.cod_empresa = pd.cod_empresa'
        
          '    left join tipo_faturamento tf on tf.codigo_faturamento = cl.' +
          'codigo_faturamento and tf.ativo = 1'
        
          '    inner join tipo_vendas tv on pd.tipo = tv.tipo and pd.tipo_o' +
          's = tv.tipo_os'
        '        '#39'||VTEMP_REQOS||'#39
        
          '    where trim(pd.tipo) = '#39#39'OS'#39#39' and coalesce(pd.status_ped, '#39#39#39 +
          #39') = '#39#39'FECHADA'#39#39
        '    '#39'||VTEMP||'#39' and pd.cod_empresa = '#39'||:pcod_empresa||'#39
        
          '    and coalesce(pd.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos' +
          ', '#39#39'S'#39#39')) <> '#39#39'N'#39#39
        '    and (coalesce(pd.valor_total, 0) >'
        
          '        coalesce((select coalesce(abs(dp.valor_dev), 0) from dev' +
          'olucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0))'
        '    and (coalesce(pd.valor_total, 0) >'
        
          '        coalesce((select coalesce(abs(vl.valor_vale), 0) from va' +
          'le_doc_prg (pd.nped, pd.tipo, pd.cod_empresa) vl), 0))'
        '    and coalesce(cl.cl_gerar_pontos, '#39#39'S'#39#39') <> '#39#39'N'#39#39
        '    and coalesce(tf.status_f, '#39#39#39#39') <> '#39#39'BARRADO'#39#39
        '    and pd.cod_cliente <> '#39'||:pcod_cliente||'#39
        '    '
        '    union'
        
          '    select cf.n_comando, '#39#39'MOT'#39#39' as tipo, cf.cod_empresa, cf.dat' +
          'a_fech,'
        ''
        
          '    coalesce((select coalesce(fp3.entrada, 0) from existe_formas' +
          '(cf.n_comando, '#39#39'MOT'#39#39', cf.cod_empresa) fp3), 0) entrada,'
        
          '    coalesce((select coalesce(fp2.valor_total, 0) from existe_fo' +
          'rmas(cf.n_comando, '#39#39'MOT'#39#39', cf.cod_empresa) fp2), 0) valor_total' +
          ','
        
          '    coalesce((select coalesce(fp1.crediario, '#39#39'N'#39#39') from existe_' +
          'formas'
        
          '      (cf.n_comando, '#39#39'MOT'#39#39', cf.cod_empresa) fp1), '#39#39'N'#39#39') credi' +
          'ario,'
        '    0 dev from com_fat cf'
        
          '    inner join clientes cl on cl.cod_cliente = cf.clientes_v and' +
          ' cl.cod_empresa = cf.cod_empresa'
        
          '    left join tipo_faturamento tf on tf.codigo_faturamento = cl.' +
          'codigo_faturamento and tf.ativo = 1 '
        
          '    inner join tipo_vendas tv on tv.tipo = '#39#39'VEI'#39#39' and tv.tipo_o' +
          's = cf.tipo_v'
        '        '#39'||VTEMP_MOT||'#39
        '    where cf.status_v = '#39#39'FECHADO'#39#39' and cf.natureza = '#39#39'S'#39#39
        '    '#39'||VTEMP2||'#39' and cf.cod_empresa = '#39'||:pcod_empresa||'#39
        '    and coalesce(cl.cl_gerar_pontos, '#39#39'S'#39#39') <> '#39#39'N'#39#39
        '    and coalesce(tf.status_f, '#39#39#39#39') <> '#39#39'BARRADO'#39#39
        '    '#39'||VTEMP3||'#39
        '    and (coalesce(cf.valtot_v, 0) >'
        
          '        coalesce((select coalesce(abs(vl.valor_vale), 0) from va' +
          'le_doc_prg (cf.n_comando, '#39#39'MOT'#39#39', cf.cod_empresa) vl), 0))'
        '    and cf.clientes_v <> '#39'||:pcod_cliente'
        ''
        
          '  into: nrequisicao, :tpdocs, :cod_empresa, :data_fech, :valoren' +
          'trada, :valortotal, :cred, :dev DO'
        '  begin'
        '     vperc_ent = 0;'
        '     if (coalesce(valortotal, 0) > 0) then'
        '       vperc_ent = ((valorentrada / valortotal) * 100);'
        '     fp_regra_fidelidade = '#39#39';'
        '     perc_dia_real = 0;'
        '     pontos = 0;'
        ''
        '     if (coalesce(valortotal, 0) > 0) then'
        '     begin'
        '       if ((coalesce(cred, '#39'N'#39') = '#39'N'#39')'
        
          '         and (coalesce(valorentrada, 0) = coalesce(valortotal, 0' +
          '))) then'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.pontos, 0) from regras_prog_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         inner join controles ctr on trim(ctr.fp_regra_fidelidad' +
          'e) = trim(crf.valor_vc) and ctr.codigo_emp = crf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39
        
          '         and crf.valor_vc = '#39'DIN'#39' and rf.cod_empresa = :cod_empr' +
          'esa'
        '         order by crf.pontos asc'
        '          into :fp_regra_fidelidade, :pontos;'
        '         if (coalesce(fp_regra_fidelidade, '#39#39') <> '#39#39') then'
        '           suspend;'
        '       end'
        '       else if (coalesce(cred, '#39'N'#39') = '#39'N'#39') then'
        '       begin'
        
          '         select first 1 trim(coalesce(ctr.fp_regra_fidelidade, '#39 +
          #39')), coalesce(crf.pontos, 0) from formpagamento fp'
        
          '         inner join controles ctr on ctr.codigo_ctrl = fp.cod_co' +
          'ntrole and ctr.codigo_emp = fp.cod_empresa'
        
          '         inner join config_regras_prog_fidelidade crf on crf.val' +
          'or_vc = ctr.fp_regra_fidelidade and crf.cod_empresa = ctr.codigo' +
          '_emp'
        
          '         inner join regras_prog_fidelidade rf on rf.cod_tp_regra' +
          ' = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.' +
          'descricao_regra = :pregra'
        
          '         where fp.nrequisicao = :nrequisicao and fp.tpdocs = :tp' +
          'docs and fp.cod_empresa = :cod_empresa'
        '         order by crf.pontos asc'
        '          into :fp_regra_fidelidade, :pontos;'
        '         if (coalesce(fp_regra_fidelidade, '#39#39') <> '#39#39') then'
        '           suspend;'
        '       end'
        '       else if (coalesce(vperc_ent, 0) > 0) then'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.perc_dia_real, 0), coalesce(crf.pontos, 0) from regras_pr' +
          'og_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         inner join controles ctr on trim(ctr.fp_regra_fidelidad' +
          'e) = '#39'CR'#39' and ctr.codigo_emp = crf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39
        
          '         and crf.valor_vc = '#39'CRX'#39' and rf.cod_empresa = :cod_empr' +
          'esa'
        '         and crf.perc_dia_real <= :vperc_ent'
        '         order by crf.perc_dia_real desc'
        '          into :fp_regra_fidelidade, :perc_dia_real, :pontos;'
        '         if (trim(coalesce(fp_regra_fidelidade, '#39#39')) = '#39#39') then'
        '         begin'
        
          '           select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coal' +
          'esce(crf.perc_dia_real, 0), coalesce(crf.pontos, 0) from regras_' +
          'prog_fidelidade rf'
        
          '           inner join config_regras_prog_fidelidade crf on crf.c' +
          'od_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empre' +
          'sa'
        
          '           inner join controles ctr on trim(ctr.fp_regra_fidelid' +
          'ade) = '#39'CR'#39' and ctr.codigo_emp = crf.cod_empresa'
        
          '           where rf.descricao_regra = :pregra and rf.situacao = ' +
          #39'ATIVA'#39
        
          '           and crf.valor_vc = '#39'CRC'#39' and rf.cod_empresa = :cod_em' +
          'presa'
        '             into :fp_regra_fidelidade, :perc_dia_real, :pontos;'
        '         end'
        '         if (trim(coalesce(fp_regra_fidelidade, '#39#39')) = '#39#39') then'
        '         begin'
        
          '           select first 1 trim(coalesce(ctr.fp_regra_fidelidade,' +
          ' '#39#39')), coalesce(crf.pontos, 0) from formpagamento fp'
        
          '           inner join controles ctr on ctr.codigo_ctrl = fp.cod_' +
          'controle and ctr.codigo_emp = fp.cod_empresa'
        
          '           inner join config_regras_prog_fidelidade crf on crf.v' +
          'alor_vc = ctr.fp_regra_fidelidade and crf.cod_empresa = ctr.codi' +
          'go_emp'
        
          '           inner join regras_prog_fidelidade rf on rf.cod_tp_reg' +
          'ra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and r' +
          'f.descricao_regra = :pregra'
        
          '           where fp.nrequisicao = :nrequisicao and fp.tpdocs = :' +
          'tpdocs and fp.cod_empresa = :cod_empresa'
        '           order by crf.pontos asc'
        '            into :fp_regra_fidelidade, :pontos;'
        '         end'
        '         if (coalesce(fp_regra_fidelidade, '#39#39') <> '#39#39') then'
        '           suspend;'
        '       end'
        '       else'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.perc_dia_real, 0), coalesce(crf.pontos, 0) from regras_pr' +
          'og_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         inner join controles ctr on trim(ctr.fp_regra_fidelidad' +
          'e) = '#39'CR'#39' and ctr.codigo_emp = crf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39
        
          '         and crf.valor_vc = '#39'CRS'#39' and rf.cod_empresa = :cod_empr' +
          'esa'
        '          into :fp_regra_fidelidade, :perc_dia_real, :pontos;'
        '         if (trim(coalesce(fp_regra_fidelidade, '#39#39')) = '#39#39') then'
        '         begin'
        
          '           select first 1 trim(coalesce(ctr.fp_regra_fidelidade,' +
          ' '#39#39')), coalesce(crf.pontos, 0) from formpagamento fp'
        
          '           inner join controles ctr on ctr.codigo_ctrl = fp.cod_' +
          'controle and ctr.codigo_emp = fp.cod_empresa'
        
          '           inner join config_regras_prog_fidelidade crf on crf.v' +
          'alor_vc = ctr.fp_regra_fidelidade and crf.cod_empresa = ctr.codi' +
          'go_emp'
        
          '           inner join regras_prog_fidelidade rf on rf.cod_tp_reg' +
          'ra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and r' +
          'f.descricao_regra = :pregra'
        
          '           where fp.nrequisicao = :nrequisicao and fp.tpdocs = :' +
          'tpdocs and fp.cod_empresa = :cod_empresa'
        '           order by crf.pontos asc'
        '            into :fp_regra_fidelidade, :pontos;'
        '         end'
        '         if (coalesce(fp_regra_fidelidade, '#39#39') <> '#39#39') then'
        '           suspend;'
        '       end'
        '     end'
        '     if (coalesce(fp_regra_fidelidade, '#39#39') = '#39#39') then'
        '       suspend;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure REC_PREST_PROG_FID_DET ('
        '    PDTINI timestamp,'
        '    PDTFIM timestamp,'
        '    PCODCLIENTE integer,'
        '    PCOD_EMPRESA integer,'
        '    PREGRA varchar(60),'
        '    PCOD_CRED integer,'
        '    PSIMULACAO char(1))'
        'returns ('
        '    COD_CRED integer,'
        '    DATQ_C timestamp,'
        '    DATA_VENC_C timestamp,'
        '    COD_EMPRESA integer,'
        '    DIAS double precision,'
        '    TIPO varchar(10),'
        '    PERC_DIA_REAL double precision,'
        '    CARENCIA double precision)'
        'as'
        'declare variable VCARENCIA integer;'
        'declare variable VPERC_ENT double precision;'
        'declare variable VCRED integer;'
        'declare variable VTEMP varchar(100);'
        'declare variable VTEMP2 varchar(1000);'
        'begin'
        '  VTEMP = '#39#39';'
        '  VTEMP2 = '#39#39';'
        ''
        '  if (COALESCE(PCOD_CRED, 0) > 0) then'
        '  begin'
        '    VTEMP = '#39' cr.cod_cred = '#39'||:pcod_cred||'#39' '#39';'
        '  end'
        '  else'
        '  begin'
        
          '    VTEMP = '#39' cr.dia_cxl >= '#39#39#39'||:pdtini||'#39#39#39' and cr.dia_cxl <= ' +
          #39#39#39'||:pdtfim||'#39#39#39' '#39';'
        '  end'
        ''
        '  if (COALESCE(psimulacao,  '#39'N'#39') = '#39'S'#39') then'
        '  begin'
        '    VTEMP2 = '#39'  and (case when (cr.tp_doc_v = '#39#39'MOT'#39#39') then'
        '                coalesce(tpv.venda, '#39#39'N'#39#39')'
        '              else'
        '                case when (pd.tipo = '#39#39'REQ'#39#39') then'
        '                       coalesce(tpreq.venda, '#39#39'N'#39#39')'
        '                     else'
        '                       coalesce(tpord.venda, '#39#39'N'#39#39')'
        '                end'
        '        end) = '#39#39'S'#39#39
        '    and (case when (cr.tp_doc_v = '#39#39'MOT'#39#39') then'
        '                 coalesce(tpv.gerar_pontos, '#39#39'N'#39#39')'
        '               else'
        '                 case when (pd.tipo = '#39#39'REQ'#39#39') then'
        '                        coalesce(tpreq.gerar_pontos, '#39#39'N'#39#39')'
        '                      else'
        '                        coalesce(tpord.gerar_pontos, '#39#39'N'#39#39')'
        '                 end'
        '         end) = '#39#39'S'#39#39' '#39';'
        '  end'
        '  else'
        '  begin'
        '    VTEMP2 = '#39'  and (case when (cr.tp_doc_v = '#39#39'MOT'#39#39') then'
        
          '                coalesce(cf.tp_venda, coalesce(tpv.venda, '#39#39'N'#39#39')' +
          ')'
        '              else'
        '                case when (pd.tipo = '#39#39'REQ'#39#39') then'
        
          '                       coalesce(pd.tp_venda, coalesce(tpreq.vend' +
          'a, '#39#39'N'#39#39'))'
        '                     else'
        
          '                       coalesce(pd.tp_venda, coalesce(tpord.vend' +
          'a, '#39#39'N'#39#39'))'
        '                end'
        '        end) = '#39#39'S'#39#39
        '    and (case when (cr.tp_doc_v = '#39#39'MOT'#39#39') then'
        
          '                 coalesce(cf.tp_gerar_pontos, coalesce(tpv.gerar' +
          '_pontos, '#39#39'N'#39#39'))'
        '               else'
        '                 case when (pd.tipo = '#39#39'REQ'#39#39') then'
        
          '                        coalesce(pd.tp_gerar_pontos, coalesce(tp' +
          'req.gerar_pontos, '#39#39'N'#39#39'))'
        '                      else'
        
          '                        coalesce(pd.tp_gerar_pontos, coalesce(tp' +
          'ord.gerar_pontos, '#39#39'N'#39#39'))'
        '                 end'
        '         end) = '#39#39'S'#39#39' '#39';'
        '  end'
        ''
        '  for execute statement'
        
          '   '#39' select cr.cod_cred, cr.dia_cxl, cr.data_venc_c, cr.codigo_e' +
          'mp, emp.dias_car_juros from controle_creditos cr'
        
          '    inner join clientes cl on cr.cod_cliente = cl.cod_cliente an' +
          'd cr.cod_emp_mult = cl.cod_empresa'
        
          '    inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ct' +
          'rl and cr.codigo_emp = ctrl.codigo_emp'
        '    inner join empresa emp on emp.cod_empresa = cr.codigo_emp'
        
          '    left join pedvenda pd on cr.n_doc_v = pd.nped and cr.tp_doc_' +
          'v = pd.tipo and cr.codigo_emp = pd.cod_empresa'
        
          '    left join tipo_vendas tpreq on trim(tpreq.tipo) = '#39#39'REQ'#39#39' an' +
          'd tpreq.sigla = pd.tipv'
        
          '    left join tipo_vendas tpord on trim(tpord.tipo) = '#39#39'OS'#39#39' and' +
          ' tpord.tipo_os = pd.tipo_os'
        
          '    left join com_fat cf on cr.n_doc_v = cf.n_comando and cr.tp_' +
          'doc_v = '#39#39'MOT'#39#39' and cr.codigo_emp = cf.cod_empresa'
        
          '    left join tipo_vendas tpv on trim(tpv.tipo) = '#39#39'VEI'#39#39' and tp' +
          'v.tipo_os = cf.tipo_v'
        
          '    left join tipo_faturamento tf on tf.codigo_faturamento = cl.' +
          'codigo_faturamento and tf.ativo = 1 '
        '    where '#39'||VTEMP||'#39
        '    and ctrl.entra_prest_cxl = '#39#39'S'#39#39
        '    and cr.codigo_emp = '#39'||:pcod_empresa||'#39
        '    and cr.tp_doc_v in ('#39#39'REQ'#39#39', '#39#39'OS'#39#39', '#39#39'MOT'#39#39')'
        '    and (coalesce((select count(*) from formpagamento fp'
        
          '    where fp.nrequisicao = cr.lote_cxl and fp.tpdocs = '#39#39'PRE'#39#39' a' +
          'nd fp.cod_empresa = cr.codigo_emp), 0) > 0)'
        '    and (case when (cr.tp_doc_v = '#39#39'MOT'#39#39') then'
        
          '                coalesce(cf.tp_venda, coalesce(tpv.venda, '#39#39'N'#39#39')' +
          ')'
        '              else'
        '                case when (pd.tipo = '#39#39'REQ'#39#39') then'
        
          '                       coalesce(pd.tp_venda, coalesce(tpreq.vend' +
          'a, '#39#39'N'#39#39'))'
        '                     else'
        
          '                       coalesce(pd.tp_venda, coalesce(tpord.vend' +
          'a, '#39#39'N'#39#39'))'
        '                end'
        '        end) = '#39#39'S'#39#39
        '    and (case when (cr.tp_doc_v = '#39#39'MOT'#39#39') then'
        
          '                 coalesce(cf.tp_gerar_pontos, coalesce(tpv.gerar' +
          '_pontos, '#39#39'N'#39#39'))'
        '               else'
        '                 case when (pd.tipo = '#39#39'REQ'#39#39') then'
        
          '                        coalesce(pd.tp_gerar_pontos, coalesce(tp' +
          'req.gerar_pontos, '#39#39'N'#39#39'))'
        '                      else'
        
          '                        coalesce(pd.tp_gerar_pontos, coalesce(tp' +
          'ord.gerar_pontos, '#39#39'N'#39#39'))'
        '                 end'
        '         end) = '#39#39'S'#39#39
        '    and coalesce(cl.cl_gerar_pontos, '#39#39'S'#39#39') <> '#39#39'N'#39#39
        '    and coalesce(tf.status_f, '#39#39#39#39') <> '#39#39'BARRADO'#39#39
        '    and cr.cod_cliente <> '#39'||:pcodcliente'
        
          '  into :cod_cred, :datq_c, :data_venc_c, :cod_empresa, :carencia' +
          ' do'
        '  begin'
        '     dias = abs(:datq_c - :data_venc_c);'
        '     tipo = '#39#39';'
        ''
        
          '     if ((coalesce(:carencia, 0) > 0) and (:datq_c > :data_venc_' +
          'c) and ((:datq_c - :data_venc_c) <= coalesce(:vcarencia, 0))) th' +
          'en'
        '     begin'
        
          '       select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coalesce' +
          '(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '       inner join config_regras_prog_fidelidade crf on crf.cod_t' +
          'p_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '       where rf.descricao_regra = :pregra and rf.cod_empresa = :' +
          'pcod_empresa'
        '       and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PC'#39
        '         into :tipo, :perc_dia_real;'
        '     end'
        '     else if (:datq_c = :data_venc_c) then'
        '     begin'
        
          '       select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coalesce' +
          '(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '       inner join config_regras_prog_fidelidade crf on crf.cod_t' +
          'p_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '       where rf.descricao_regra = :pregra and rf.situacao = '#39'ATI' +
          'VA'#39' and rf.cod_empresa = :pcod_empresa'
        '       and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PDV'#39
        '         into :tipo, :perc_dia_real;'
        '     end'
        '     else if (:datq_c > :data_venc_c) then'
        '     begin'
        
          '       select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coalesce' +
          '(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '       inner join config_regras_prog_fidelidade crf on crf.cod_t' +
          'p_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '       where rf.descricao_regra = :pregra and rf.situacao = '#39'ATI' +
          'VA'#39' and rf.cod_empresa = :pcod_empresa'
        
          '       and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PTX'#39' and coalesce' +
          '(crf.perc_dia_real, 0) <= :dias'
        '       order by crf.perc_dia_real desc'
        '         into :tipo, :perc_dia_real;'
        ''
        '       if (trim(coalesce(tipo, '#39#39')) = '#39#39') then'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39' and rf.cod_empresa = :pcod_empresa'
        '         and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PT'#39
        '          into :tipo, :perc_dia_real;'
        '       end'
        '     end'
        '     else'
        '     begin'
        
          '       select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coalesce' +
          '(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '       inner join config_regras_prog_fidelidade crf on crf.cod_t' +
          'p_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '       where rf.descricao_regra = :pregra and rf.situacao = '#39'ATI' +
          'VA'#39' and rf.cod_empresa = :pcod_empresa'
        
          '       and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PAX'#39' and coalesce' +
          '(crf.perc_dia_real, 0) <= :dias'
        '       order by crf.perc_dia_real desc'
        '         into :tipo, :perc_dia_real;'
        ''
        '       if (trim(coalesce(tipo, '#39#39')) = '#39#39') then'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39' and rf.cod_empresa = :pcod_empresa'
        '         and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PA'#39
        '          into :tipo, :perc_dia_real;'
        '       end'
        '     end'
        '     if (trim(coalesce(tipo, '#39#39')) <> '#39#39') then'
        '       suspend;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE NOTAFISCAL_OBSCONT ('
        '    COD_NF       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    SEQID        INTEGER NOT NULL,'
        '    XCAMPO       VARCHAR(20),'
        '    XTEXTO       VARCHAR(20)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NOTAFISCAL_OBSCONT ADD CONSTRAINT PK_NOTAFISCAL_OBSC' +
          'ONT PRIMARY KEY (COD_NF, COD_EMPRESA, SEQID);'
        
          'ALTER TABLE NOTAFISCAL_OBSCONT ADD CONSTRAINT FK_NOTAFISCAL_OBSC' +
          'ONT FOREIGN KEY (COD_NF, COD_EMPRESA) REFERENCES NOTAFISCAL (COD' +
          '_NF, COD_EMPRESA);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NOTAFISCAL_OBSCONT_BI_SEQID FOR NOTAFISC' +
          'AL_OBSCONT'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        '  declare variable ACODIGO integer;'
        'begin                  '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        '  if (coalesce(new.seqid, 0) <= 0) then'
        '  begin'
        
          '    select COD from INCREMENTA_CODIGO(new.COD_EMPRESA, '#39'NOTAFISC' +
          'AL_OBSCONT'#39')'
        '      into :ACODIGO;'
        '    new.SEQID = ACODIGO;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC048'#39', :COD_EMPRESA, '#39'E' +
          'DITAR LANCAMENTO REALIZADO PELO SISTEMA'#39', 100, '#39'S'#39', '#39'...'#39', 1, '#39'S' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND105'#39', :COD_EMPRESA, '#39'LI' +
          'BERAR VENDA FECHANDO'#39', 10, NULL, 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND106'#39', :COD_EMPRESA, '#39'CO' +
          'NFIRMAR ATENDIMENTO'#39', 10, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND107'#39', :COD_EMPRESA, '#39'RE' +
          'MOVER ATENDIMENTO'#39', 10, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND108'#39', :COD_EMPRESA, '#39'RE' +
          'LATORIO DE ATENDIMENTOS'#39', 3, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND109'#39', :COD_EMPRESA, '#39'PE' +
          'SQUISAR TIPO VENDA PERDIDA'#39', 3, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE)' +
          ';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND110'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO TIPO VENDA PERDIDA'#39', 3, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND111'#39', :COD_EMPRESA, '#39'BT' +
          ' OK TIPO DE VENDA PERDIDA'#39', 3, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND112'#39', :COD_EMPRESA, '#39'BT' +
          ' EDITAR TIPO DE VENDA PERDIDA'#39', 3, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DA' +
          'TE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND113'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR TIPO VENDA PERDIDA'#39', 10, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DAT' +
          'E);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND114'#39', :COD_EMPRESA, '#39'AC' +
          'ESSAR LIXEIRA TIPO VENDA PERDIDA'#39', 10, NULL, 1, '#39'N'#39', '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND115'#39', :COD_EMPRESA, '#39'RE' +
          'STAURAR TIPO VENDA PERDIDA'#39', 10, NULL, 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE' +
          ');'
        'ALTER TABLE MOVIMENTO_CIAP ADD NUM_DA VARCHAR(128);'
        'ALTER TABLE MOVIMENTO_CIAP ADD QTDE T_VL_TODOS;'
        'ALTER TABLE MOVIMENTO_CIAP ADD UNID VARCHAR(6);'
        'ALTER TABLE MOVIMENTO_CIAP ADD VL_ICMS_OP_APLICADO T_VL_TODOS;'
        'ALTER TABLE MOVIMENTO_CIAP ADD VL_ICMS_ST_APLICADO T_VL_TODOS;'
        'ALTER TABLE MOVIMENTO_CIAP ADD VL_ICMS_FRT_APLICADO T_VL_TODOS;'
        'ALTER TABLE MOVIMENTO_CIAP ADD VL_ICMS_DIF_APLICADO T_VL_TODOS;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RESUMO_FINANCEIRO('
        '    TPDTQUIT_DTREF,'
        '    TIPO_DESP,'
        '    TIPO,'
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    N_CONTA_PLC,'
        '    DTQUIT_DTREF,'
        '    NDOC,'
        '    VALOR,'
        '    HISTORICO,'
        '    DATA,'
        '    COD_LANC,'
        '    VALOR_PAGO,'
        '    DESC_PADR,'
        '    DESC_SUB_CT,'
        '    FORNECEDOR,'
        '    NOME_CTRL,'
        '    EXIBIR_RESUMO_FINANCEIRO,'
        '    ATIVO,'
        '    ORDEM,'
        '    DESC_GR,'
        '    DESC_DEP)'
        'AS'
        '-- VIEW EXIBE OS PAGAMENTOS DESPESAS E PAGAMENTOS FORNECEDOR '
        '-- RELATORIO "RESUMO FINANCEIRO" EXIBIDO NA PARTE DAS DESPESAS'
        'SELECT 1, '#39'LANC'#39', '#39'DESPLANC'#39','
        
          '(CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIGO_UNIFI' +
          'CADORA ELSE L.CODIGO_EMP END),'
        'L.COD_EMP_MULT,'
        
          'L.N_CONTA_PLC, L.DATQ_L, L.NDOC_L, L.VALOR_L, L.HISTORICO_L, L.D' +
          'ATA, L.COD_LANC, L.VALOR_L,'
        
          'CASE WHEN TRIM(COALESCE(P.DESC_PADR, '#39#39')) = '#39#39' THEN P.DESC_PLC E' +
          'LSE P.DESC_PADR END DESC_PADR,'
        'S.DESC_SUB_CT, P.TIPO_CTP, CC.NOME_CTRL,'
        
          'COALESCE(CC.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') EXIBIR_RESUMO_FINANCE' +
          'IRO,'
        'P.ATIVO, 1 ORDEM, C.DESC_GR, CT.DESC_DEP FROM P_CONTAS P'
        
          'INNER JOIN GRUPOS_CT C ON P.GRUP_CT = C.GRUP_CT AND C.TIPO_GR = ' +
          #39'S'#39
        'LEFT JOIN SUB_GRUP_CT S ON P.COD_SUB_CT = S.COD_SUB_CT'
        'INNER JOIN LANCAMENTOS L ON P.N_CONTA_PLC = L.N_CONTA_PLC'
        'INNER JOIN EMPRESA EMP ON L.CODIGO_EMP = EMP.COD_EMPRESA'
        
          'INNER JOIN CONTROLES CC ON L.CODIGO_CTRL = CC.CODIGO_CTRL AND L.' +
          'CODIGO_EMP = CC.CODIGO_EMP'
        'LEFT JOIN DEPART_CT CT ON CT.COD_DEP = C.COD_DEP'
        
          'WHERE --L.DATQ_L >= :VDAT1 AND L.DATQ_L <= :VDAT2 AND L.CODIGO_E' +
          'MP = 5'
        'L.LOTE IS NULL AND COALESCE(P.TIPO_CTP, '#39#39') <> '#39'F'#39
        'UNION'
        'SELECT 2, '#39'LANC'#39', '#39'DESPLANC'#39','
        
          '(CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIGO_UNIFI' +
          'CADORA ELSE L.CODIGO_EMP END),'
        'L.COD_EMP_MULT,'
        
          'L.N_CONTA_PLC, L.DTREFERENCIA, L.NDOC_L, L.VALOR_L, L.HISTORICO_' +
          'L, L.DATA, L.COD_LANC, L.VALOR_L,'
        
          'CASE WHEN TRIM(COALESCE(P.DESC_PADR, '#39#39')) = '#39#39' THEN P.DESC_PLC E' +
          'LSE P.DESC_PADR END DESC_PADR,'
        'S.DESC_SUB_CT, P.TIPO_CTP, CC.NOME_CTRL,'
        
          'COALESCE(CC.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') EXIBIR_RESUMO_FINANCE' +
          'IRO,'
        'P.ATIVO, 1 ORDEM, C.DESC_GR, CT.DESC_DEP FROM P_CONTAS P'
        
          'INNER JOIN GRUPOS_CT C ON P.GRUP_CT = C.GRUP_CT AND C.TIPO_GR = ' +
          #39'S'#39
        'LEFT JOIN SUB_GRUP_CT S ON P.COD_SUB_CT = S.COD_SUB_CT'
        'INNER JOIN LANCAMENTOS L ON P.N_CONTA_PLC = L.N_CONTA_PLC'
        'INNER JOIN EMPRESA EMP ON L.CODIGO_EMP = EMP.COD_EMPRESA'
        
          'INNER JOIN CONTROLES CC ON L.CODIGO_CTRL = CC.CODIGO_CTRL AND L.' +
          'CODIGO_EMP = CC.CODIGO_EMP'
        'LEFT JOIN DEPART_CT CT ON CT.COD_DEP = C.COD_DEP'
        
          'WHERE -- L.DTREFERENCIA >= :VDAT1 AND L.DTREFERENCIA <= :VDAT2 A' +
          'ND L.CODIGO_EMP = 5'
        'L.LOTE IS NULL AND COALESCE(P.TIPO_CTP, '#39#39') <> '#39'F'#39
        'UNION'
        'SELECT 1, '#39'CTP'#39', '#39'DESPCTP'#39','
        
          '(CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIGO_UNIFI' +
          'CADORA ELSE CTR.CODIGO_EMP END),'
        'CTR.COD_EMP_MULT,'
        'CTR.N_CONTA_PLC, CTR.DATQ_CTP, CTR.N_DOC_CTP, CTR.VALOR_CTP,'
        'TRIM(CTR.HISTORICO_CTP) || '#39' - '#39'|| TRIM(CTR.NOME_FOR_CTP),'
        'CTR.DATQ_CTP, CTR.COD_CONTRP, CTR.VALOR_PAGO,'
        
          'CASE WHEN TRIM(COALESCE(P.DESC_PADR, '#39#39')) = '#39#39' THEN P.DESC_PLC E' +
          'LSE P.DESC_PADR END DESC_PADR,'
        'S.DESC_SUB_CT, P.TIPO_CTP, CC.NOME_CTRL,'
        
          'COALESCE(CC.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') EXIBIR_RESUMO_FINANCE' +
          'IRO,'
        'P.ATIVO, 1 ORDEM, C.DESC_GR, CT.DESC_DEP FROM P_CONTAS P'
        
          'INNER JOIN GRUPOS_CT C ON P.GRUP_CT = C.GRUP_CT AND C.TIPO_GR = ' +
          #39'S'#39
        'LEFT JOIN SUB_GRUP_CT S ON P.COD_SUB_CT = S.COD_SUB_CT'
        'LEFT JOIN CONTAS_A_PAGAR CTR ON P.N_CONTA_PLC = CTR.N_CONTA_PLC'
        'LEFT JOIN EMPRESA EMP ON CTR.CODIGO_EMP = EMP.COD_EMPRESA'
        
          'LEFT JOIN CONTROLES CC ON CTR.CODIGO_CTRL = CC.CODIGO_CTRL AND C' +
          'TR.CODIGO_EMP = CC.CODIGO_EMP'
        'LEFT JOIN DEPART_CT CT ON CT.COD_DEP = C.COD_DEP'
        
          'WHERE -- CTR.DATQ_CTP >= :VDAT1 AND CTR.DATQ_CTP <= :VDAT2 AND C' +
          'TR.CODIGO_EMP = 5'
        'CTR.LOTE IS NOT NULL AND COALESCE(P.TIPO_CTP, '#39#39') <> '#39'F'#39
        'UNION'
        'SELECT 2, '#39'CTP'#39', '#39'DESPCTP'#39','
        
          '(CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIGO_UNIFI' +
          'CADORA ELSE CTR.CODIGO_EMP END),'
        'CTR.COD_EMP_MULT,'
        'CTR.N_CONTA_PLC, CTR.DTREFERENCIA, CTR.N_DOC_CTP, CTR.VALOR_CTP,'
        'TRIM(CTR.HISTORICO_CTP) || '#39' - '#39' || TRIM(CTR.NOME_FOR_CTP),'
        'CTR.DATQ_CTP, CTR.COD_CONTRP, CTR.VALOR_PAGO,'
        
          'CASE WHEN TRIM(COALESCE(P.DESC_PADR, '#39#39')) = '#39#39' THEN P.DESC_PLC E' +
          'LSE P.DESC_PADR END DESC_PADR,'
        'S.DESC_SUB_CT, P.TIPO_CTP, CC.NOME_CTRL,'
        
          'COALESCE(CC.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') EXIBIR_RESUMO_FINANCE' +
          'IRO,'
        'P.ATIVO, 1 ORDEM, C.DESC_GR, CT.DESC_DEP FROM P_CONTAS P'
        
          'INNER JOIN GRUPOS_CT C ON P.GRUP_CT = C.GRUP_CT AND C.TIPO_GR = ' +
          #39'S'#39
        'LEFT JOIN SUB_GRUP_CT S ON P.COD_SUB_CT = S.COD_SUB_CT'
        'INNER JOIN CONTAS_A_PAGAR CTR ON P.N_CONTA_PLC = CTR.N_CONTA_PLC'
        'INNER JOIN EMPRESA EMP ON CTR.CODIGO_EMP = EMP.COD_EMPRESA'
        
          'INNER JOIN CONTROLES CC ON CTR.CODIGO_CTRL = CC.CODIGO_CTRL AND ' +
          'CTR.CODIGO_EMP = CC.CODIGO_EMP'
        'LEFT JOIN DEPART_CT CT ON CT.COD_DEP = C.COD_DEP'
        
          'WHERE -- CTR.DTREFERENCIA >= :VDAT1 AND CTR.DTREFERENCIA <= :VDA' +
          'T2 AND CTR.CODIGO_EMP = 5'
        'CTR.LOTE IS NOT NULL AND COALESCE(P.TIPO_CTP, '#39#39') <> '#39'F'#39
        'UNION'
        'SELECT 1, '#39'LANC'#39', '#39'DESPLANCFOR'#39','
        
          '(CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIGO_UNIFI' +
          'CADORA ELSE L.CODIGO_EMP END),'
        'L.COD_EMP_MULT,'
        
          'L.N_CONTA_PLC, L.DATQ_L, L.NDOC_L, L.VALOR_L, L.HISTORICO_L, L.D' +
          'ATA, L.COD_LANC, L.VALOR_L,'
        
          'CASE WHEN TRIM(COALESCE(P.DESC_PADR, '#39#39')) = '#39#39' THEN P.DESC_PLC E' +
          'LSE P.DESC_PADR END DESC_PADR,'
        #39'PAGAMENTOS FORNECEDOR'#39', P.TIPO_CTP, CC.NOME_CTRL,'
        
          'COALESCE(CC.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') EXIBIR_RESUMO_FINANCE' +
          'IRO,'
        'P.ATIVO, 2 ORDEM, C.DESC_GR, CT.DESC_DEP FROM P_CONTAS P'
        'INNER JOIN GRUPOS_CT C ON P.GRUP_CT = C.GRUP_CT'
        'LEFT JOIN SUB_GRUP_CT S ON P.COD_SUB_CT = S.COD_SUB_CT'
        'INNER JOIN LANCAMENTOS L ON P.N_CONTA_PLC = L.N_CONTA_PLC'
        'INNER JOIN EMPRESA EMP ON L.CODIGO_EMP = EMP.COD_EMPRESA'
        
          'INNER JOIN CONTROLES CC ON L.CODIGO_CTRL = CC.CODIGO_CTRL AND L.' +
          'CODIGO_EMP = CC.CODIGO_EMP'
        'LEFT JOIN DEPART_CT CT ON CT.COD_DEP = C.COD_DEP'
        
          'WHERE --L.DATQ_L >= :VDAT1 AND L.DATQ_L <= :VDAT2 AND L.CODIGO_E' +
          'MP = 5'
        'L.LOTE IS NULL AND P.TIPO_CTP = '#39'F'#39
        'UNION'
        'SELECT 2, '#39'LANC'#39', '#39'DESPLANCFOR'#39','
        
          '(CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIGO_UNIFI' +
          'CADORA ELSE L.CODIGO_EMP END),'
        'L.COD_EMP_MULT,'
        
          'L.N_CONTA_PLC, L.DTREFERENCIA, L.NDOC_L, L.VALOR_L, L.HISTORICO_' +
          'L, L.DATA, L.COD_LANC, L.VALOR_L,'
        
          'CASE WHEN TRIM(COALESCE(P.DESC_PADR, '#39#39')) = '#39#39' THEN P.DESC_PLC E' +
          'LSE P.DESC_PADR END DESC_PADR,'
        #39'PAGAMENTOS FORNECEDOR'#39', P.TIPO_CTP, CC.NOME_CTRL,'
        
          'COALESCE(CC.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') EXIBIR_RESUMO_FINANCE' +
          'IRO,'
        'P.ATIVO, 2 ORDEM, C.DESC_GR, CT.DESC_DEP FROM P_CONTAS P'
        'INNER JOIN GRUPOS_CT C ON P.GRUP_CT = C.GRUP_CT'
        'LEFT JOIN SUB_GRUP_CT S ON P.COD_SUB_CT = S.COD_SUB_CT'
        'INNER JOIN LANCAMENTOS L ON P.N_CONTA_PLC = L.N_CONTA_PLC'
        'INNER JOIN EMPRESA EMP ON L.CODIGO_EMP = EMP.COD_EMPRESA'
        
          'INNER JOIN CONTROLES CC ON L.CODIGO_CTRL = CC.CODIGO_CTRL AND L.' +
          'CODIGO_EMP = CC.CODIGO_EMP'
        'LEFT JOIN DEPART_CT CT ON CT.COD_DEP = C.COD_DEP'
        
          'WHERE -- L.DTREFERENCIA >= :VDAT1 AND L.DTREFERENCIA <= :VDAT2 A' +
          'ND L.CODIGO_EMP = 5'
        'L.LOTE IS NULL AND P.TIPO_CTP = '#39'F'#39
        'UNION'
        'SELECT 1, '#39'CTP'#39', '#39'DESPCTPFOR'#39','
        
          '(CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIGO_UNIFI' +
          'CADORA ELSE CTR.CODIGO_EMP END),'
        'CTR.COD_EMP_MULT,'
        'CTR.N_CONTA_PLC, CTR.DATQ_CTP, CTR.N_DOC_CTP, CTR.VALOR_CTP,'
        'TRIM(CTR.HISTORICO_CTP) || '#39' - '#39' || TRIM(CTR.NOME_FOR_CTP),'
        'CTR.DATQ_CTP, CTR.COD_CONTRP, CTR.VALOR_PAGO,'
        
          'CASE WHEN TRIM(COALESCE(P.DESC_PADR, '#39#39')) = '#39#39' THEN P.DESC_PLC E' +
          'LSE P.DESC_PADR END DESC_PADR,'
        #39'PAGAMENTOS FORNECEDOR'#39', P.TIPO_CTP, CC.NOME_CTRL,'
        
          'COALESCE(CC.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') EXIBIR_RESUMO_FINANCE' +
          'IRO,'
        'P.ATIVO, 2 ORDEM, C.DESC_GR, CT.DESC_DEP FROM P_CONTAS P'
        'INNER JOIN GRUPOS_CT C ON P.GRUP_CT = C.GRUP_CT'
        'LEFT JOIN SUB_GRUP_CT S ON P.COD_SUB_CT = S.COD_SUB_CT'
        'INNER JOIN CONTAS_A_PAGAR CTR ON P.N_CONTA_PLC = CTR.N_CONTA_PLC'
        'INNER JOIN EMPRESA EMP ON CTR.CODIGO_EMP = EMP.COD_EMPRESA'
        
          'INNER JOIN CONTROLES CC ON CTR.CODIGO_CTRL = CC.CODIGO_CTRL AND ' +
          'CTR.CODIGO_EMP = CC.CODIGO_EMP'
        'LEFT JOIN DEPART_CT CT ON CT.COD_DEP = C.COD_DEP'
        
          'WHERE -- CTR.DATQ_CTP >= :VDAT1 AND CTR.DATQ_CTP <= :VDAT2 AND C' +
          'TR.CODIGO_EMP = 5'
        'CTR.LOTE IS NOT NULL AND P.TIPO_CTP = '#39'F'#39
        'UNION'
        'SELECT 2, '#39'CTP'#39', '#39'DESPCTPFOR'#39','
        
          '(CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIGO_UNIFI' +
          'CADORA ELSE CTR.CODIGO_EMP END),'
        'CTR.COD_EMP_MULT,'
        'CTR.N_CONTA_PLC, CTR.DTREFERENCIA, CTR.N_DOC_CTP, CTR.VALOR_CTP,'
        'TRIM(CTR.HISTORICO_CTP) || '#39' - '#39' || TRIM(CTR.NOME_FOR_CTP),'
        'CTR.DATQ_CTP, CTR.COD_CONTRP, CTR.VALOR_PAGO,'
        
          'CASE WHEN TRIM(COALESCE(P.DESC_PADR, '#39#39')) = '#39#39' THEN P.DESC_PLC E' +
          'LSE P.DESC_PADR END DESC_PADR,'
        #39'PAGAMENTOS FORNECEDOR'#39', P.TIPO_CTP, CC.NOME_CTRL,'
        
          'COALESCE(CC.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') EXIBIR_RESUMO_FINANCE' +
          'IRO,'
        'P.ATIVO, 2 ORDEM, C.DESC_GR, CT.DESC_DEP FROM P_CONTAS P'
        'INNER JOIN GRUPOS_CT C ON P.GRUP_CT = C.GRUP_CT'
        'LEFT JOIN SUB_GRUP_CT S ON P.COD_SUB_CT = S.COD_SUB_CT'
        'INNER JOIN CONTAS_A_PAGAR CTR ON P.N_CONTA_PLC = CTR.N_CONTA_PLC'
        'INNER JOIN EMPRESA EMP ON CTR.CODIGO_EMP = EMP.COD_EMPRESA'
        
          'INNER JOIN CONTROLES CC ON CTR.CODIGO_CTRL = CC.CODIGO_CTRL AND ' +
          'CTR.CODIGO_EMP = CC.CODIGO_EMP'
        'LEFT JOIN DEPART_CT CT ON CT.COD_DEP = C.COD_DEP'
        
          'WHERE -- CTR.DTREFERENCIA >= :VDAT1 AND CTR.DTREFERENCIA <= :VDA' +
          'T2 AND CTR.CODIGO_EMP = 5'
        'CTR.LOTE IS NOT NULL AND P.TIPO_CTP = '#39'F'#39';'
        '|/BLOCO|'
        ''
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 300, RDB$CHARACTER_LENG' +
          'TH = 300 where RDB$FIELD_NAME = (select rdb$field_source from rd' +
          'b$relation_fields where rdb$relation_name = '#39'ITENS_CARTA'#39' and rd' +
          'b$field_name = '#39'COD_CONTROLE'#39');'
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
        
          '      update produtos set est_f = coalesce(est_f, 0) + :pqtde_en' +
          'trada, dt_ult_vnd = dt_ult_vnda'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa;'
        '    end'
        '    else'
        '    begin'
        
          '      update produtos set est_f = coalesce(est_f, 0) + :pqtde_en' +
          'trada'
        
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
        
          '        update cod_grade_prod set qtde = coalesce(qtde, 0) + :pq' +
          'tde_entrada'
        
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
        
          '      update produtos set est_f = coalesce(est_f, 0) - :pqtde_sa' +
          'ida, dt_ult_vnda = dt_ult_vnd, dt_ult_vnd = current_date'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa;'
        '    end'
        '    else'
        '    begin'
        
          '      update produtos set est_f = coalesce(est_f, 0) - :pqtde_sa' +
          'ida'
        
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
        
          '        update cod_grade_prod set qtde = coalesce(qtde, 0) - :pq' +
          'tde_saida'
        
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS4*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS('
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    TP_REL,'
        '    TP_RECEBIMENTO,'
        '    TP_RECEBIMENTO2,'
        '    ORDEM,'
        '    TIPO,'
        '    NUM_DOC,'
        '    NUM_DOC2,'
        '    DATA_DOC,'
        '    DATA_CONF,'
        '    VALOR_A_RECEBER,'
        '    OBS_CXL,'
        '    LOTEREC,'
        '    OP_CXL,'
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
        '    QTDE_PREST)'
        'AS'
        
          '-- VIEW EXIBE OS RECEBIMENTOS DAS VENDAS (REQUISICAO, ORDEM DE S' +
          'ERVICO, COMANDOS), RECIBO ANTECIPADOS E  CREDIARIO (CREDITOS/CHE' +
          'QUES)'
        '-- RELATORIO "RECEBIMENTO FINANCEIRO"'
        '    --- REQ, OS'
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        '    coalesce(rq.cod_cliente, 0) cod_cliente, cl.nome_cliente,'
        
          '    '#39'SAIDAS'#39' tp_rel, '#39'DIRETO'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebi' +
          'mento2,'
        
          '    1 ordem, rq.tipo,  coalesce(rq.nped, 0) as Num_doc, coalesce' +
          '(fp.ndoc, coalesce(rq.nped, 0), 0) Num_doc2, rq.data_ped as data' +
          '_doc,'
        
          '    rq.data_fech as data_Conf, coalesce(rq.valor_total, 0) as va' +
          'lor_total, rq.obs_cxl_rq, rq.nped as loterec,'
        '    coalesce(rq.op_cxl, 0) op_cxl, rq.cod_vendedor,'
        
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
        '    1 qtde_prest'
        ''
        '    from pedvenda rq'
        '    left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    left join tipo_vendas tp on tp.tipo = rq.tipo and (tp.sigla ' +
          '= rq.tipv or (tp.tipo_os = rq.tipo_os))'
        
          '    left join clientes cl on cl.cod_cliente = rq.cod_cliente and' +
          ' cl.cod_empresa = rq.cod_empresa'
        
          '--    inner join formpagamento fp on fp.nrequisicao = rq.nped an' +
          'd fp.tpdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa and fp' +
          '.recibo is null'
        
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
        '    '
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        '    coalesce(rq.cod_cliente, 0) cod_cliente, cl.nome_cliente,'
        
          '    '#39'SAIDAS'#39' tp_rel, '#39'RECIBO'#39' tp_recebimento, '#39'RECIBO'#39' tp_recebi' +
          'mento2, 1 ordem, rq.tipo,'
        
          '    coalesce(rq.nped, 0) as Num_doc, coalesce(fp.ndoc, coalesce(' +
          'rq.nped, 0), 0) Num_doc2, rq.data_ped as data_doc,'
        
          '    rq.data_fech as data_Conf, coalesce(rq.valor_total, 0) as va' +
          'lor_total, rq.obs_cxl_rq, rq.nped as loterec,'
        '    coalesce(rq.op_cxl, 0) op_cxl, rq.cod_vendedor,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0) valordoc' +
          ', fp.data_venc, fp.terceiros,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc' +
          ') is null then'
        '        0'
        '    else'
        '       (select first 1 ctrl.codigo_ctrl from controles ctrl'
        
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
        '    else'
        '        (select first 1 ctrl.nome_ctrl from controles ctrl'
        
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
        '    1 qtde_prest'
        ''
        '    from pedvenda rq'
        '    left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
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
        '    '
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        '    coalesce(rq.cod_cliente, 0) cod_cliente, cl.nome_cliente,'
        
          '    '#39'SAIDAS'#39' tp_rel, '#39'TROCO'#39' tp_recebimento, '#39'TROCO'#39' tp_recebime' +
          'nto2, 1 ordem, rq.tipo,'
        
          '    coalesce(rq.nped, 0) as Num_doc, coalesce(fp.ndoc, coalesce(' +
          'rq.nped, 0), 0) Num_doc2, rq.data_ped as data_doc,'
        
          '    rq.data_fech as data_Conf, coalesce(rq.valor_total, 0) as va' +
          'lor_total, rq.obs_cxl_rq, rq.nped as loterec,'
        '    coalesce(rq.op_cxl, 0) op_cxl, rq.cod_vendedor,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0) valordoc' +
          ', fp.data_venc, fp.terceiros,'
        
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
        '    1 qtde_prest'
        ''
        '    from pedvenda rq'
        '    left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
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
        '    '
        '    union'
        '    '
        '    --- CF'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else mt.cod_empresa end) cod_empresa,'
        '    mt.cod_empresa,'
        '    coalesce(mt.clientes_v, 0) clientes_v, cl.nome_cliente,'
        
          '    '#39'SAIDAS'#39' tp_rel, '#39'DIRETO'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebi' +
          'mento2, 1 ordem, '#39'MOT'#39' as tipo,'
        
          '    coalesce(mt.n_comando, 0) as Num_doc, coalesce(fp.ndoc, coal' +
          'esce(mt.n_comando, 0), 0) Num_doc2, mt.data_ven as Data_Doc,'
        
          '    mt.data_fech as Data_Conf, coalesce(mt.valor_a_rec, 0) as va' +
          'lor_total, '#39' '#39' as obs_cxl_rq, mt.n_comando as loterec,'
        '    coalesce(mt.op_cxl, 0) op_cxl, mt.covend_v,'
        
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
        '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 1 qtde_prest from com_fat mt'
        '    left join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          '    left join tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os =' +
          ' mt.tipo_v'
        
          '    left join clientes cl on cl.cod_cliente = mt.clientes_v and ' +
          'cl.cod_empresa = mt.cod_empresa'
        
          '--    inner join formpagamento fp on fp.nrequisicao = mt.n_coman' +
          'do and fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa  an' +
          'd fp.recibo is null'
        
          '    left join formpagamento fp on fp.nrequisicao = mt.n_comando ' +
          'and fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa  and f' +
          'p.recibo is null'
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl'
        
          '    where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.n' +
          'atureza = '#39'S'#39
        
          '    /* where coalesce((select count(*) from formpagamento frc wh' +
          'ere frc.nrequisicao = mt.n_comando and'
        
          '        frc.tpdocs = '#39'MOT'#39' and frc.cod_empresa = mt.cod_empresa ' +
          'and (not frc.recibo is null)),0) <= 0*/'
        '    '
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else mt.cod_empresa end) cod_empresa,'
        '    mt.cod_empresa,'
        '    coalesce(mt.clientes_v, 0) clientes_v, cl.nome_cliente,'
        
          '    '#39'SAIDAS'#39' tp_rel, '#39'RECIBO'#39' tp_recebimento, '#39'RECIBO'#39' tp_recebi' +
          'mento2, 1 ordem, '#39'MOT'#39' as tipo,'
        
          '    coalesce(mt.n_comando, 0) as Num_doc, coalesce(fp.ndoc, coal' +
          'esce(mt.n_comando, 0), 0) Num_doc2, mt.data_ven as Data_Doc,'
        
          '    mt.data_fech as Data_Conf, coalesce(mt.valor_a_rec, 0) as va' +
          'lor_total, '#39' '#39' as obs_cxl_rq, mt.n_comando as loterec,'
        '    coalesce(mt.op_cxl, 0) op_cxl, mt.covend_v,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0), fp.data' +
          '_venc, fp.terceiros,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc as' +
          'c) is null then'
        '        0'
        '    else'
        '       (select first 1 ctrl.codigo_ctrl from controles ctrl'
        
          '       inner join formpagamento rc on rc.cod_controle = ctrl.cod' +
          'igo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '       where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa ' +
          '= fp.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc' +
          ' asc)'
        '    end as codigo_ctrl,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc as' +
          'c) is null then'
        '        '#39'SEM FORMA'#39
        '    else'
        '        (select first 1 ctrl.nome_ctrl from controles ctrl'
        
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
        '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 1 qtde_prest from com_fat mt'
        '    left join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
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
        '    '
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else mt.cod_empresa end) cod_empresa,'
        '    mt.cod_empresa,'
        '    coalesce(mt.clientes_v, 0) clientes_v, cl.nome_cliente,'
        
          '    '#39'SAIDAS'#39' tp_rel, '#39'TROCO'#39' tp_recebimento, '#39'TROCO'#39' tp_recebime' +
          'nto2, 1 ordem, '#39'MOT'#39' as tipo,'
        
          '    coalesce(mt.n_comando, 0) as Num_doc, coalesce(fp.ndoc, coal' +
          'esce(mt.n_comando, 0), 0) Num_doc2, mt.data_ven as Data_Doc,'
        
          '    mt.data_fech as Data_Conf, coalesce(mt.valor_a_rec, 0) as va' +
          'lor_total, '#39' '#39' as obs_cxl_rq, mt.n_comando as loterec,'
        '    coalesce(mt.op_cxl, 0) op_cxl, mt.covend_v,'
        
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
        '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 1 qtde_prest from com_fat mt'
        '    left join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
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
        '    -- Cred'
        ''
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente,'
        
          '    case when (cl.nome_cliente is null) then pr.nome_c else cl.n' +
          'ome_cliente end nome_cliente,'
        '    '#39'CREDIARIO'#39' tp_rel, '#39'CREDIARIO'#39' tp_recebimento,'
        
          '    coalesce((case when (((select count(*) from hist_rec hist wh' +
          'ere hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codi' +
          'go_emp) > 0)'
        '        and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39')) then'
        '        '#39'RECIBO'#39
        '    else'
        '        '#39'DIRETO'#39
        '    end), '#39'DIRETO'#39') tp_recebimento2, 3 ordem,'
        
          '    case when (ctr1.nome_ctrl is null) then pr.tipo_doc_c else c' +
          'tr1.nome_ctrl end tipo,'
        
          '    coalesce(pr.n_doc_c, 0) Num_doc, coalesce(l.ndoc_l, coalesce' +
          '(pr.n_doc_c, 0)) Num_doc2, pr.data_venc_c as Data_Doc,'
        '    pr.datq_c as Data_Conf,'
        
          '    coalesce(pr.valor_quitado, 0) as valor_total, '#39' '#39' as obs_cxl' +
          '_rq, coalesce(pr.lote_quit, pr.seq_bxcred) as loterec,'
        
          '    coalesce(pr.op_cxl, 0) op_cxl, pr.codigo_vend, l.data, l.his' +
          'torico_l,'
        
          '    case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1)' +
          ' else coalesce(l.valor_l, 0) end valor_pago, l.data, '#39' '#39' terceir' +
          'os,'
        ''
        
          '    coalesce((case when (((select count(*) from hist_rec hist wh' +
          'ere hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codi' +
          'go_emp) > 0)'
        
          '    and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39') and (l.tipo' +
          '_l = '#39'S'#39')) then'
        '        0'
        '    else'
        
          '        case when ctr.codigo_ctrl is null then 0 else ctr.codigo' +
          '_ctrl end'
        '    end), 0) codigo_ctrl,'
        '    '
        
          '    coalesce((case when (((select count(*) from hist_rec hist wh' +
          'ere hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codi' +
          'go_emp) > 0)'
        '        and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39')) then'
        
          '        case when (l.tipo_l = '#39'S'#39') then '#39'SEM FORMA'#39' else '#39'RECIBO' +
          #39' end'
        '    else'
        
          '        case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ct' +
          'r.nome_ctrl end'
        '    end), '#39'SEM FORMA'#39') nome_ctrl,'
        ''
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
          'e 0 end nparcela, pr.seq_bxcred, coalesce(l.cod_lanc, pr.seq_bxc' +
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
        '    pr.tp_doc_v as tipo_doc,'
        
          '    coalesce((case when ((select count(*) from baixa_creditos bc' +
          ' where bc.lote_quit = pr.lote_quit and bc.codigo_emp = pr.codigo' +
          '_emp) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from baixa_creditos bc where bc.lote_qu' +
          'it = pr.lote_quit and bc.codigo_emp = pr.codigo_emp) '
        '    end), 1) qtde_prest'
        ''
        '    from baixa_creditos pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.codigo_emp = pr.codigo_emp'
        
          '--    inner join lancamentos l on l.lote_ent = pr.lote_quit and ' +
          'l.codigo_emp = pr.codigo_emp and l.data = pr.datq_c'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp and l.data = pr.datq_c'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        
          '    where coalesce(pr.tip_baixa, '#39#39') <> '#39'C'#39' and pr.datq_c is not' +
          ' null'
        ''
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente,'
        
          '    case when (cl.nome_cliente is null) then pr.nome_c else cl.n' +
          'ome_cliente end nome_cliente,'
        
          '    '#39'CREDIARIO'#39' tp_rel, '#39'CREDIARIO'#39' tp_recebimento, '#39'DIRETO'#39' tp_' +
          'recebimento2, 3 ordem,'
        
          '    case when (ctr1.nome_ctrl is null) then pr.tipo_doc_c else c' +
          'tr1.nome_ctrl end tipo,'
        
          '    coalesce(pr.n_doc_c, 0) Num_doc, coalesce(pr.lote, 0) Num_do' +
          'c2, pr.data_venc_c as Data_Doc,'
        '    pr.datq_c as Data_Conf,'
        
          '    coalesce(pr.valor_quitado, 0) as valor_total, '#39' '#39' as obs_cxl' +
          '_rq, coalesce(pr.lote_quit, pr.seq_bxcred) as loterec,'
        '    coalesce(pr.op_cxl, 0) op_cxl, pr.codigo_vend,'
        '    pr.datq_c, ('#39'LOTE CTP '#39' || pr.lote) historico_ctp,'
        '    --ctp.historico_ctp,'
        '    coalesce(pr.valor_quitado, 0) valor_pago,'
        '    --coalesce(ctp.valor_pago , 0) valor_pag,'
        '    pr.datq_c, '#39' '#39' terceiros,'
        '    999999 codigo_ctrl, '#39'CONTAS A PAGAR'#39' nome_ctrl,'
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
          'e 0 end nparcela, pr.seq_bxcred, coalesce(pr.seq_bxcred, 0),'
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
        '    pr.tp_doc_v as tipo_doc,'
        
          '    coalesce((case when ((select count(*) from baixa_creditos bc' +
          ' where bc.lote_quit = pr.lote_quit and bc.codigo_emp = pr.codigo' +
          '_emp) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from baixa_creditos bc where bc.lote_qu' +
          'it = pr.lote_quit and bc.codigo_emp = pr.codigo_emp) '
        '    end), 1) qtde_prest'
        ''
        '    from baixa_creditos pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.codigo_emp = pr.codigo_emp'
        
          '   -- inner join contas_a_pagar ctp on ctp.lote = pr.lote and ct' +
          'p.codigo_emp = pr.codigo_emp'
        
          '   -- left join CONTROLES ctr on ctr.codigo_ctrl = ctp.codigo_ct' +
          'rl and ctr.codigo_emp = ctp.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.tip_baixa = '#39'C'#39' and pr.datq_c is not null'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente,'
        
          '    case when (cl.nome_cliente is null) then pr.nome_c else cl.n' +
          'ome_cliente end nome_cliente,'
        
          '    '#39'CREDIARIO'#39' tp_rel, '#39'CREDIARIO'#39' tp_recebimento, '#39'DIRETO'#39' tp_' +
          'recebimento2, 3 ordem,'
        
          '    case when (ctr1.nome_ctrl is null) then pr.tipo_doc_c else c' +
          'tr1.nome_ctrl end tipo,'
        
          '    coalesce(pr.n_doc_c, 0) Num_doc, coalesce(l.ndoc_l, coalesce' +
          '(pr.n_doc_c, 0)) Num_doc2, pr.data_venc_c as Data_Doc,'
        '    pr.data_rec_c as Data_Conf,'
        
          '    coalesce(pr.valor_c, 0) as valor_total, '#39' '#39' as obs_cxl_rq, c' +
          'oalesce(pr.lote_quit, cod_cred) as loterec,'
        
          '    coalesce(pr.op_cxl, 0) op_cxl, pr.codigo_vend, l.data, l.his' +
          'torico_l,'
        
          '    case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1)' +
          ' else coalesce(l.valor_l, 0) end valor_pago, l.data, '#39' '#39' terceir' +
          'os,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
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
        
          '    0 as nparcela, pr.cod_cred, coalesce(l.cod_lanc, pr.cod_cred' +
          '),'
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
        '    pr.tp_doc_v as tipo_doc, 1 qtde_prest'
        ''
        '    from controle_creditos pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp and l.data = pr.data_rec_c'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        ''
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente,'
        
          '    case when (cl.nome_cliente is null) then pr.nome_ch else cl.' +
          'nome_cliente end nome_cliente,'
        '    '#39'CREDIARIO'#39' tp_rel, '#39'CREDIARIO'#39' tp_recebimento,'
        ''
        
          '    coalesce((case when (((select count(*) from hist_rec hist wh' +
          'ere hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codi' +
          'go_emp) > 0)'
        '        and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39')) then'
        '        '#39'RECIBO'#39
        '    else'
        '        '#39'DIRETO'#39' end), '#39'DIRETO'#39') tp_recebimento2, 3 ordem,'
        
          '    case when (ctr1.nome_ctrl is null) then '#39#39' else ctr1.nome_ct' +
          'rl end tipo,'
        
          '    trim(coalesce(pr.n_ch, 0)) Num_doc, coalesce(l.ndoc_l, coale' +
          'sce(pr.n_ch, 0)) Num_doc2, pr.data_venc as Data_Doc,'
        '    pr.datq_ch as Data_Conf,'
        
          '    coalesce(pr.valor_ch, 0) as valor_total, '#39' '#39' as obs_cxl_rq, ' +
          'coalesce(pr.lote_quit, pr.codigo_ch) as loterec,'
        '    coalesce(pr.op_cxl, 0) op_cxl, pr.codigo_vend,'
        '    l.data, l.historico_l,'
        
          '    case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1)' +
          ' else coalesce(l.valor_l, 0) end valor_pago, l.data, '#39' '#39' terceir' +
          'os,'
        ''
        
          '    coalesce((case when (((select count(*) from hist_rec hist wh' +
          'ere hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codi' +
          'go_emp) > 0)'
        
          '    and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39') and (l.tipo' +
          '_l = '#39'S'#39')) then'
        '        0'
        '    else'
        
          '        case when ctr.codigo_ctrl is null then 0 else ctr.codigo' +
          '_ctrl end'
        '    end), 0) codigo_ctrl,'
        '    '
        
          '    coalesce((case when (((select count(*) from hist_rec hist wh' +
          'ere hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codi' +
          'go_emp) > 0)'
        '        and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39')) then'
        
          '        case when (l.tipo_l = '#39'S'#39') then '#39'SEM FORMA'#39' else '#39'RECIBO' +
          #39' end'
        '    else'
        
          '        case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ct' +
          'r.nome_ctrl end'
        '    end), '#39'SEM FORMA'#39') nome_ctrl,'
        ''
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
        
          '    0 nparcela, pr.codigo_ch, coalesce(l.cod_lanc, pr.codigo_ch)' +
          ','
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
        '    pr.tp_doc_v as tipo_doc,'
        
          '    coalesce((case when ((select count(*) from controle_cheque c' +
          'h where ch.lote_quit = pr.lote_quit and ch.codigo_emp = pr.codig' +
          'o_emp) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from controle_cheque ch where ch.lote_q' +
          'uit = pr.lote_quit and ch.codigo_emp = pr.codigo_emp)'
        '    end), 1) qtde_prest'
        ''
        '    from controle_cheque pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '--    inner join lancamentos l on l.lote_ent = pr.lote_quit and ' +
          'l.codigo_emp = pr.codigo_emp and l.data = pr.datq_ch'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp and l.data = pr.datq_ch'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        
          '    where coalesce(pr.tip_baixa, '#39#39') <> '#39'C'#39' and pr.datq_ch is no' +
          't null'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente,'
        
          '    case when (cl.nome_cliente is null) then pr.nome_ch else cl.' +
          'nome_cliente end nome_cliente,'
        
          '    '#39'CREDIARIO'#39' tp_rel, '#39'CREDIARIO'#39' tp_recebimento, '#39'DIRETO'#39' tp_' +
          'recebimento2, 3 ordem,'
        
          '    case when (ctr1.nome_ctrl is null) then '#39#39' else ctr1.nome_ct' +
          'rl end tipo,'
        
          '    trim(coalesce(pr.n_ch, 0)) Num_doc, coalesce(pr.lote, 0) Num' +
          '_doc2, pr.data_venc as Data_Doc,'
        '    pr.datq_ch as Data_Conf,'
        
          '    coalesce(pr.valor_ch, 0) as valor_total, '#39' '#39' as obs_cxl_rq, ' +
          'coalesce(pr.lote_quit, pr.codigo_ch) as loterec,'
        '    coalesce(pr.op_cxl, 0) op_cxl, pr.codigo_vend,'
        '    --ctp.datq_ctp,'
        '    pr.datq_ch,'
        '    --ctp.historico_ctp,'
        '    ('#39'LOTE CTP '#39'|| pr.lote) as historico_ctp,'
        '    coalesce(pr.valor_ch, 0) valor_pago,'
        '    pr.datq_ch, '#39' '#39' terceiros,'
        '    999999 codigo_ctrl, '#39'CONTAS A PAGAR'#39' nome_ctrl,'
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
        '    0 nparcela, pr.codigo_ch, coalesce(pr.codigo_ch, 0),'
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
        '    pr.tp_doc_v as tipo_doc,'
        
          '    coalesce((case when ((select count(*) from controle_cheque c' +
          'h where ch.lote_quit = pr.lote_quit and ch.codigo_emp = pr.codig' +
          'o_emp) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from controle_cheque ch where ch.lote_q' +
          'uit = pr.lote_quit and ch.codigo_emp = pr.codigo_emp)'
        '    end), 1) qtde_prest'
        ''
        '    from controle_cheque pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    --inner join contas_a_pagar ctp on ctp.lote = pr.lote and ct' +
          'p.codigo_emp = pr.codigo_emp'
        
          '    -- left join CONTROLES ctr on ctr.codigo_ctrl = ctp.codigo_c' +
          'trl and ctr.codigo_emp = ctp.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.tip_baixa = '#39'C'#39' and pr.datq_ch is not null'
        ''
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente,'
        
          '    case when (cl.nome_cliente is null) then pr.nome_ch else cl.' +
          'nome_cliente end nome_cliente,'
        
          '    '#39'CREDIARIO'#39' tp_rel, '#39'CREDIARIO'#39' tp_recebimento, '#39'DIRETO'#39' tp_' +
          'recebimento, 3 ordem,'
        
          '    case when (ctr1.nome_ctrl is null) then '#39#39' else ctr1.nome_ct' +
          'rl end tipo,'
        
          '    trim(coalesce(pr.n_ch, 0)) Num_doc, coalesce(l.ndoc_l, coale' +
          'sce(pr.n_ch, 0)) Num_doc2, pr.data_venc as Data_Doc,'
        '    pr.data_rec as Data_Conf,'
        
          '    coalesce(pr.valor_ch, 0) as valor_total, '#39' '#39' as obs_cxl_rq, ' +
          'coalesce(pr.lote_quit, pr.codigo_ch) as loterec,'
        '    coalesce(pr.op_cxl, 0) op_cxl, pr.codigo_vend,'
        '    l.data, l.historico_l,'
        
          '    case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1)' +
          ' else coalesce(l.valor_l, 0) end valor_pago, l.data, '#39' '#39' terceir' +
          'os,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
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
        
          '    0 nparcela, pr.codigo_ch, coalesce(l.cod_lanc, pr.codigo_ch)' +
          ','
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
        '    pr.tp_doc_v as tipo_doc,'
        
          '    coalesce((case when ((select count(*) from controle_cheque c' +
          'h where ch.lote_quit = pr.lote_quit and ch.codigo_emp = pr.codig' +
          'o_emp) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from controle_cheque ch where ch.lote_q' +
          'uit = pr.lote_quit and ch.codigo_emp = pr.codigo_emp)'
        '    end), 1) qtde_prest'
        ''
        '    from controle_cheque pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp  and l.data = pr.data_rec'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_ch, '#39#39') = '#39#39' and pr.datq_ch is null'
        '    '
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rq.cod_empresa end) cod_empresa,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then coalesce(rq.' +
          'cod_emp_mult, rq.cod_empresa) else rq.cod_empresa end) cod_emp_m' +
          'ult,'
        '    coalesce(rq.cod_devedor, 0) cod_cliente, cl.nome_cliente,'
        
          '    '#39'RECIBO ANTECIPADO'#39' tp_rel, '#39'DIRETO'#39' tp_recebimento, '#39'DIRETO' +
          #39' tp_recebimento2,'
        '    2 ordem, '#39'REC'#39',  coalesce(rq.nrecibo, 0) as Num_doc,'
        
          '     coalesce(fp.ndoc, coalesce(rq.nrecibo, 0), 0) Num_doc2, rq.' +
          'data_rec as data_doc,'
        
          '    rq.data_rec as data_Conf, coalesce(rq.valor_orig, 0) as valo' +
          'r_total,'
        '    (trim(rq.referencia1) || ascii_char(13) || ascii_char(10) ||'
        '    trim(rq.referencia2) || ascii_char(13) || ascii_char(10) ||'
        '    trim(rq.referencia3) || ascii_char(13) || ascii_char(10) ||'
        '    trim(rq.referencia4)) referencia, rq.nrecibo as loterec,'
        '    coalesce(rq.op_cxl, 0) op_cxl, rq.cod_us,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0) valordoc' +
          ', fp.data_venc, fp.terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    case when (rq.num_rec_dep <> '#39#39') then rq.num_rec_dep else co' +
          'alesce(fp.rec_numvend,0) end as num_recibo, 0 as valor_recibo,'
        '    0 ncupom, 0 num_nf,'
        
          '    case when (fp.nrequisicao > 0) then coalesce(fp.nparcela, 0)' +
          ' else 0 end nparcela,'
        
          '    coalesce(fp.seqform, rq.nrecibo), coalesce(fp.seqform, rq.nr' +
          'ecibo), '#39'N'#39' venda, '#39#39' tipv, '#39'REC'#39' as tipo_doc,'
        '    1 qtde_prest'
        '    '
        '    from recibos rq'
        '    left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = rq.cod_devedor and' +
          ' cl.cod_empresa = rq.cod_empresa'
        
          '    --    inner join formpagamento fp on fp.nrequisicao = rq.npe' +
          'd and fp.tpdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa an' +
          'd fp.recibo is null'
        
          '    left join formpagamento fp on fp.nrequisicao = rq.nrecibo an' +
          'd fp.tpdocs = '#39'REC'#39' and fp.cod_empresa = rq.cod_empresa and fp.r' +
          'ecibo is null'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        '    where rq.recant = '#39'S'#39
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rq.cod_empresa end) cod_empresa,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then coalesce(rq.' +
          'cod_emp_mult, rq.cod_empresa) else rq.cod_empresa end) cod_emp_m' +
          'ult,'
        '    coalesce(rq.cod_devedor, 0) cod_cliente, cl.nome_cliente,'
        
          '    '#39'RECIBO ANTECIPADO'#39' tp_rel, '#39'TROCO'#39' tp_recebimento, '#39'TROCO'#39' ' +
          'tp_recebimento2,'
        '    2 ordem, '#39'REC'#39',  coalesce(rq.nrecibo, 0) as Num_doc,'
        
          '     coalesce(fp.ndoc, coalesce(rq.nrecibo, 0), 0) Num_doc2, rq.' +
          'data_rec as data_doc,'
        
          '    rq.data_rec as data_Conf, coalesce(rq.valor_orig, 0) as valo' +
          'r_total,'
        '    (trim(rq.referencia1) || ascii_char(13) || ascii_char(10) ||'
        '    trim(rq.referencia2) || ascii_char(13) || ascii_char(10) ||'
        '    trim(rq.referencia3) || ascii_char(13) || ascii_char(10) ||'
        '    trim(rq.referencia4)) referencia, rq.nrecibo as loterec,'
        '    coalesce(rq.op_cxl, 0) op_cxl, rq.cod_us,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0) valordoc' +
          ', fp.data_venc, fp.terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    case when (rq.num_rec_dep <> '#39#39') then rq.num_rec_dep else co' +
          'alesce(fp.rec_numvend,0) end as num_recibo, 0 as valor_recibo,'
        '    0 ncupom, 0 num_nf,'
        
          '    case when (fp.nrequisicao > 0) then coalesce(fp.nparcela, 0)' +
          ' else 0 end nparcela,'
        
          '    coalesce(fp.seqform, rq.nrecibo), coalesce(fp.seqform, rq.nr' +
          'ecibo), '#39'N'#39' venda, '#39#39' tipv, '#39'REC'#39' as tipo_doc,'
        '    1 qtde_prest'
        '    '
        '    from recibos rq'
        '    left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = rq.cod_devedor and' +
          ' cl.cod_empresa = rq.cod_empresa'
        
          '    inner join formpagamento fp on fp.rec_numvend = rq.nrecibo a' +
          'nd fp.rec_tipvend = '#39'REC'#39' and fp.cod_empresa = rq.cod_empresa an' +
          'd fp.tpdocs = '#39'TRC'#39
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        '    where rq.recant = '#39'S'#39
        ';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS2('
        '    TP_RECEBIMENTO,'
        '    ORDEM,'
        '    TIPO,'
        '    TIPO2,'
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    DATA_CONF,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    VALOR_PAGO,'
        '    DATA_MOV,'
        '    DATA_VENC,'
        '    SEQID,'
        '    SEQID2)'
        'AS'
        
          '-- VIEW EXIBE OS RECEBIMENTOS DETALHADOS DAS VENDAS (REQUISICAO,' +
          ' ORDEM DE SERVICO, COMANDOS), RECIBO ANTECIPADOS E  CREDIARIO (C' +
          'REDITOS/CHEQUES)'
        '-- RELATORIO "RECEBIMENTO FINANCEIRO"'
        '--- REQ, OS'
        'select '#39'DIRETO'#39', 1, rq.tipo, rq.tipo,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else rq.cod_empresa end) cod_empresa,'
        'rq.cod_empresa,'
        'rq.data_fech,'
        
          'case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end ' +
          'codigo_ctrl,'
        
          'case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_c' +
          'trl end nome_ctrl,'
        'coalesce(fp.valordoc, 0) valordoc, fp.data_mov, fp.data_venc,'
        'coalesce(fp.seqform, rq.nped), coalesce(fp.seqform, rq.nped)'
        'from pedvenda rq'
        'left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '--inner join formpagamento fp on fp.nrequisicao = rq.nped and fp' +
          '.tpdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa and fp.rec' +
          'ibo is null'
        
          'left join formpagamento fp on fp.nrequisicao = rq.nped and fp.tp' +
          'docs = rq.tipo and fp.cod_empresa = rq.cod_empresa and fp.recibo' +
          ' is null'
        
          'left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and' +
          ' fp.cod_empresa = ctr.codigo_emp'
        
          'where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.tipo ' +
          'in ('#39'REQ'#39', '#39'OS'#39')'
        
          '/*where coalesce((select count(*) from formpagamento frc where f' +
          'rc.nrequisicao = rq.nped and'
        
          '        frc.tpdocs = rq.tipo and frc.cod_empresa = rq.cod_empres' +
          'a and (not frc.recibo is null)),0) <= 0*/'
        ''
        'union'
        ''
        'select '#39'RECIBO'#39', 1, rq.tipo, rq.tipo,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else rq.cod_empresa end) cod_empresa,'
        'rq.cod_empresa,'
        'rq.data_fech,'
        'case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          'inner join formpagamento rc on rc.cod_controle = ctrl.codigo_ctr' +
          'l and rc.cod_empresa = ctrl.codigo_emp'
        
          'where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = fp.co' +
          'd_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc) is' +
          ' null then'
        '    0'
        'else (select first 1 ctrl.codigo_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc' +
          ')'
        'end as codigo_ctrl,'
        'case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          'inner join formpagamento rc on rc.cod_controle = ctrl.codigo_ctr' +
          'l and rc.cod_empresa = ctrl.codigo_emp'
        
          'where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = fp.co' +
          'd_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc) is' +
          ' null then'
        '    '#39'SEM FORMA'#39
        'else'
        '    (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc' +
          ')'
        'end as nome_ctrl,'
        
          'coalesce(fp.valordoc, 0) valordoc, fp.data_mov, fp.data_venc, co' +
          'alesce(fp.seqform, rq.nped), coalesce(fp.seqform, rq.nped)'
        ''
        'from pedvenda rq'
        'left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          'inner join formpagamento fp on fp.nrequisicao = rq.nped and fp.t' +
          'pdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa and (not fp.' +
          'recibo is null)'
        
          'left join recibos rec on rec.nrecibo = fp.rec_numvend and rec.co' +
          'd_empresa = fp.cod_empresa'
        
          'where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.tipo ' +
          'in ('#39'REQ'#39', '#39'OS'#39')'
        ''
        'union'
        ''
        'select '#39'TROCO'#39', 1, rq.tipo, rq.tipo,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else rq.cod_empresa end) cod_empresa,'
        'rq.cod_empresa,'
        'rq.data_fech,'
        
          'case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end ' +
          'codigo_ctrl,'
        
          'case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_c' +
          'trl end nome_ctrl,'
        
          'coalesce(fp.valordoc, 0) valordoc, fp.data_mov, fp.data_venc, co' +
          'alesce(fp.seqform, rq.nped), coalesce(fp.seqform, rq.nped)'
        'from pedvenda rq'
        'left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          'inner join formpagamento fp on fp.rec_numvend = rq.nped and fp.r' +
          'ec_tipvend = rq.tipo and fp.cod_empresa = rq.cod_empresa and fp.' +
          'tpdocs = '#39'TRC'#39
        
          'left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and' +
          ' fp.cod_empresa = ctr.codigo_emp'
        
          'where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.tipo ' +
          'in ('#39'REQ'#39', '#39'OS'#39')'
        ''
        'union'
        ''
        '--- CF'
        ''
        'select '#39'DIRETO'#39', 1, '#39'MOT'#39',  '#39'MOT'#39','
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else mt.cod_empresa end) cod_empresa,'
        'mt.cod_empresa,'
        'mt.data_fech,'
        
          'case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end ' +
          'codigo_ctrl,'
        
          'case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_c' +
          'trl end nome_ctrl,'
        'coalesce(fp.valordoc, 0) valordoc, fp.data_mov, fp.data_venc,'
        
          'coalesce(fp.seqform, mt.n_comando), coalesce(fp.seqform, mt.n_co' +
          'mando) from com_fat mt'
        'left join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          '--inner join formpagamento fp on fp.nrequisicao = mt.n_comando a' +
          'nd fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa  and fp' +
          '.recibo is null'
        
          'left join formpagamento fp on fp.nrequisicao = mt.n_comando and ' +
          'fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa  and fp.re' +
          'cibo is null'
        'inner join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl'
        
          'where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.natur' +
          'eza = '#39'S'#39
        
          '/* where coalesce((select count(*) from formpagamento frc where ' +
          'frc.nrequisicao = mt.n_comando and'
        
          '    frc.tpdocs = '#39'MOT'#39' and frc.cod_empresa = mt.cod_empresa and ' +
          '(not frc.recibo is null)),0) <= 0*/'
        ''
        'union'
        ''
        'select '#39'RECIBO'#39', 1, '#39'MOT'#39',  '#39'MOT'#39','
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else mt.cod_empresa end) cod_empresa,'
        'mt.cod_empresa,'
        'mt.data_fech,'
        'case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          'inner join formpagamento rc on rc.cod_controle = ctrl.codigo_ctr' +
          'l and rc.cod_empresa = ctrl.codigo_emp'
        
          'where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = fp.co' +
          'd_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc asc) i' +
          's null then'
        '    0'
        'else (select first 1 ctrl.codigo_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc as' +
          'c)'
        'end as codigo_ctrl,'
        'case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          'inner join formpagamento rc on rc.cod_controle = ctrl.codigo_ctr' +
          'l and rc.cod_empresa = ctrl.codigo_emp'
        
          'where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = fp.co' +
          'd_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc asc) i' +
          's null then'
        '    '#39'SEM FORMA'#39
        'else'
        '    (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc as' +
          'c)'
        'end as nome_ctrl,'
        'coalesce(fp.valordoc, 0) valordoc, fp.data_mov, fp.data_venc,'
        
          'coalesce(fp.seqform, mt.n_comando), coalesce(fp.seqform, mt.n_co' +
          'mando) from com_fat mt'
        'left join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          'inner join formpagamento fp on fp.nrequisicao = mt.n_comando and' +
          ' fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa and (not ' +
          'fp.recibo is null)'
        
          'left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and' +
          ' fp.cod_empresa = ctr.codigo_emp'
        
          'where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.natur' +
          'eza = '#39'S'#39
        ''
        'union'
        ''
        'select '#39'TROCO'#39', 1, '#39'MOT'#39',  '#39'MOT'#39','
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else mt.cod_empresa end) cod_empresa,'
        'mt.cod_empresa,'
        'mt.data_fech,'
        
          'case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end ' +
          'codigo_ctrl,'
        
          'case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_c' +
          'trl end nome_ctrl,'
        'coalesce(fp.valordoc, 0) valordoc, fp.data_mov, fp.data_venc,'
        
          'coalesce(fp.seqform, mt.n_comando), coalesce(fp.seqform, mt.n_co' +
          'mando)'
        'from com_fat mt'
        'left join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          'inner join formpagamento fp on fp.rec_numvend = mt.n_comando and' +
          ' fp.rec_tipvend = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa and ' +
          'fp.tpdocs = '#39'TRC'#39
        
          'left join recibos rec on rec.nrecibo = fp.rec_numvend and rec.co' +
          'd_empresa = fp.cod_empresa'
        
          'left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and' +
          ' fp.cod_empresa = ctr.codigo_emp'
        
          'where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.natur' +
          'eza = '#39'S'#39
        ''
        '-- Cred'
        ''
        'union'
        ''
        
          'select coalesce((case when (((select count(*) from hist_rec hist' +
          ' where hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.c' +
          'odigo_emp) > 0)'
        '    and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39')) then'
        '    '#39'RECIBO'#39
        'else'
        '    '#39'DIRETO'#39
        'end), '#39'DIRETO'#39'),'
        
          '3, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is null) then pr.tipo_' +
          'doc_c else ctr1.nome_ctrl end tipo2,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pr.codigo_emp end) cod_empresa,'
        'pr.cod_emp_mult, pr.datq_c,'
        ''
        
          'coalesce((case when (((select count(*) from hist_rec hist where ' +
          'hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codigo_e' +
          'mp) > 0)'
        
          '    and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39') and (l.tipo' +
          '_l = '#39'S'#39')) then'
        '    0'
        'else'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end'
        'end), 0) codigo_ctrl,'
        ''
        
          'coalesce((case when (((select count(*) from hist_rec hist where ' +
          'hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codigo_e' +
          'mp) > 0)'
        '    and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39')) then'
        
          '    case when (l.tipo_l = '#39'S'#39') then '#39'SEM FORMA'#39' else '#39'RECIBO'#39' en' +
          'd'
        'else'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end'
        'end), '#39'SEM FORMA'#39') nome_ctrl,'
        ''
        
          'case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1) els' +
          'e coalesce(l.valor_l, 0) end valor_pago,'
        'pr.datq_c, pr.data_venc_c,'
        'coalesce(l.cod_lanc, pr.seq_bxcred), 0'
        'from baixa_creditos pr'
        'left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          'left join controle_creditos cc on cc.cod_cred = pr.cod_cred and ' +
          'cc.codigo_emp = pr.codigo_emp'
        
          '--inner join lancamentos l on l.lote_ent = pr.lote_quit and l.co' +
          'digo_emp = pr.codigo_emp and l.data = pr.datq_c'
        
          'left join lancamentos l on l.lote_ent = pr.lote_quit and l.codig' +
          'o_emp = pr.codigo_emp and l.data = pr.datq_c'
        
          'left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl and c' +
          'tr.codigo_emp = l.codigo_emp'
        
          'left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctrl an' +
          'd ctr1.codigo_emp = pr.codigo_emp'
        
          'where coalesce(pr.tip_baixa, '#39#39') <> '#39'C'#39' and pr.datq_c is not nul' +
          'l'
        ''
        'union'
        ''
        
          'select '#39'DIRETO'#39', 3, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is nu' +
          'll) then pr.tipo_doc_c else ctr1.nome_ctrl end tipo2,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pr.codigo_emp end) cod_empresa,'
        'pr.cod_emp_mult, pr.datq_c,'
        '999999 codigo_ctrl, '#39'CONTAS A PAGAR'#39' nome_ctrl,'
        'coalesce(pr.valor_quitado, 0) valor_pago,'
        'pr.datq_c, pr.data_venc_c,'
        'coalesce(pr.seq_bxcred, 0), 0'
        'from baixa_creditos pr'
        'left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          'left join controle_creditos cc on cc.cod_cred = pr.cod_cred and ' +
          'cc.codigo_emp = pr.codigo_emp'
        
          '--inner join contas_a_pagar ctp on ctp.lote = pr.lote and ctp.co' +
          'digo_emp = pr.codigo_emp'
        
          '--left join lancamentos l on l.lote_ent = pr.lote_quit and l.cod' +
          'igo_emp = pr.codigo_emp and l.data = pr.datq_c'
        
          '--left join CONTROLES ctr on ctr.codigo_ctrl = ctp.codigo_ctrl a' +
          'nd ctr.codigo_emp = ctp.codigo_emp'
        
          'left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctrl an' +
          'd ctr1.codigo_emp = pr.codigo_emp'
        'where pr.tip_baixa = '#39'C'#39' and pr.datq_c is not null'
        ''
        'union'
        ''
        
          'select '#39'DIRETO'#39', 3, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is nu' +
          'll) then '#39#39' else ctr1.nome_ctrl end tipo2,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pr.codigo_emp end) cod_empresa,'
        'pr.cod_emp_mult, pr.data_rec_c,'
        
          'case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end ' +
          'codigo_ctrl,'
        
          'case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_c' +
          'trl end nome_ctrl,'
        
          'case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1) els' +
          'e coalesce(l.valor_l, 0) end valor_pago,'
        'pr.datq_c, pr.data_venc_c,'
        'coalesce(l.cod_lanc, pr.cod_cred), 0'
        'from controle_creditos pr'
        'left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          'left join lancamentos l on l.lote_ent = pr.lote_quit and l.codig' +
          'o_emp = pr.codigo_emp and l.data = pr.data_rec_c'
        
          'left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl and c' +
          'tr.codigo_emp = l.codigo_emp'
        
          'left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctrl an' +
          'd ctr1.codigo_emp = pr.codigo_emp'
        'where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        ''
        'union'
        ''
        
          'select coalesce((case when (((select count(*) from hist_rec hist' +
          ' where hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.c' +
          'odigo_emp) > 0)'
        '    and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39')) then'
        '    '#39'RECIBO'#39
        'else'
        '    '#39'DIRETO'#39' end), '#39'DIRETO'#39'),'
        
          '3, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is null) then '#39#39' else ' +
          'ctr1.nome_ctrl end tipo2,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pr.codigo_emp end) cod_empresa,'
        'pr.cod_emp_mult, pr.datq_ch,'
        ''
        
          'coalesce((case when (((select count(*) from hist_rec hist where ' +
          'hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codigo_e' +
          'mp) > 0)'
        
          '    and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39') and (l.tipo' +
          '_l = '#39'S'#39')) then'
        '    0'
        'else'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end'
        'end), 0) codigo_ctrl,'
        ''
        
          'coalesce((case when (((select count(*) from hist_rec hist where ' +
          'hist.lote_quit = pr.lote_quit and hist.cod_empresa = pr.codigo_e' +
          'mp) > 0)'
        '    and (l.historico_l like '#39'%RECIBOS ATENCIPADOS%'#39')) then'
        
          '    case when (l.tipo_l = '#39'S'#39') then '#39'SEM FORMA'#39' else '#39'RECIBO'#39' en' +
          'd'
        'else'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end'
        'end), '#39'SEM FORMA'#39') nome_ctrl,'
        ''
        
          'case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1) els' +
          'e coalesce(l.valor_l, 0) end valor_pago,'
        'pr.datq_ch, pr.data_venc,'
        'coalesce(l.cod_lanc, pr.codigo_ch), 0 from controle_cheque pr'
        'left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = pr.cod_cliente and cl.' +
          'cod_empresa = pr.codigo_emp'
        
          'inner join lancamentos l on l.lote_ent = pr.lote_quit and l.codi' +
          'go_emp = pr.codigo_emp and l.data = pr.datq_ch'
        
          '--left join lancamentos l on l.lote_ent = pr.lote_quit and l.cod' +
          'igo_emp = pr.codigo_emp and l.data = pr.datq_ch'
        
          'left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl and c' +
          'tr.codigo_emp = l.codigo_emp'
        
          'left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctrl an' +
          'd ctr1.codigo_emp = pr.codigo_emp'
        
          'where coalesce(pr.tip_baixa, '#39#39') <> '#39'C'#39' and pr.datq_ch is not nu' +
          'll'
        ''
        'union'
        ''
        
          'select '#39'DIRETO'#39', 3, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is nu' +
          'll) then '#39#39' else ctr1.nome_ctrl end tipo2,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pr.codigo_emp end) cod_empresa,'
        'pr.cod_emp_mult, pr.datq_ch,'
        '999999 codigo_ctrl, '#39'CONTAS A PAGAR'#39' nome_ctrl,'
        'coalesce(pr.valor_ch, 0) valor_pago,'
        'pr.datq_ch, pr.data_venc,'
        'coalesce(pr.codigo_ch, 0), 0 from controle_cheque pr'
        'left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = pr.cod_cliente and cl.' +
          'cod_empresa = pr.codigo_emp'
        
          '--inner join contas_a_pagar ctp on ctp.lote = pr.lote and ctp.co' +
          'digo_emp = pr.codigo_emp'
        
          '--left join lancamentos l on l.lote_ent = pr.lote_quit and l.cod' +
          'igo_emp = pr.codigo_emp and l.data = pr.datq_ch'
        
          '--left join CONTROLES ctr on ctr.codigo_ctrl = ctp.codigo_ctrl a' +
          'nd ctr.codigo_emp = ctp.codigo_emp'
        
          'left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctrl an' +
          'd ctr1.codigo_emp = pr.codigo_emp'
        'where pr.tip_baixa = '#39'C'#39' and pr.datq_ch is not null'
        ''
        'union'
        ''
        
          'select '#39'DIRETO'#39', 3, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is nu' +
          'll) then '#39#39' else ctr1.nome_ctrl end tipo2,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pr.codigo_emp end) cod_empresa,'
        'pr.cod_emp_mult, pr.data_rec,'
        
          'case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end ' +
          'codigo_ctrl,'
        
          'case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_c' +
          'trl end nome_ctrl,'
        
          'case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1) els' +
          'e coalesce(l.valor_l, 0) end valor_pago,'
        'pr.datq_ch, pr.data_venc,'
        'coalesce(l.cod_lanc, pr.codigo_ch), 0'
        'from controle_cheque pr'
        'left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = pr.cod_cliente and cl.' +
          'cod_empresa = pr.codigo_emp'
        
          'left join lancamentos l on l.lote_ent = pr.lote_quit and l.codig' +
          'o_emp = pr.codigo_emp and l.data = pr.data_rec'
        
          'left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl and c' +
          'tr.codigo_emp = l.codigo_emp'
        
          'left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctrl an' +
          'd ctr1.codigo_emp = pr.codigo_emp'
        'where coalesce(pr.status_ch, '#39#39') = '#39#39' and pr.datq_ch is null'
        ''
        'union'
        ''
        'select '#39'DIRETO'#39', 2, '#39'REC'#39', '#39'REC'#39','
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else rq.cod_empresa end) cod_empresa,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then coalesce(rq.cod_' +
          'emp_mult, rq.cod_empresa) else rq.cod_empresa end) cod_empresa,'
        'rq.data_rec,'
        
          'case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end ' +
          'codigo_ctrl,'
        
          'case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_c' +
          'trl end nome_ctrl,'
        'coalesce(fp.valordoc, 0) valordoc, fp.data_mov, fp.data_venc,'
        
          'coalesce(fp.seqform, rq.nrecibo), coalesce(fp.seqform, rq.nrecib' +
          'o)'
        'from recibos rq'
        'left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = rq.cod_devedor and cl.' +
          'cod_empresa = rq.cod_empresa'
        
          '--    inner join formpagamento fp on fp.nrequisicao = rq.nped an' +
          'd fp.tpdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa and fp' +
          '.recibo is null'
        
          'left join formpagamento fp on fp.nrequisicao = rq.nrecibo and fp' +
          '.tpdocs = '#39'REC'#39' and fp.cod_empresa = rq.cod_empresa and fp.recib' +
          'o is null'
        
          'left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and' +
          ' fp.cod_empresa = ctr.codigo_emp'
        'where rq.recant = '#39'S'#39
        ''
        'union'
        ''
        'select '#39'TROCO'#39', 2, '#39'REC'#39', '#39'REC'#39','
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else rq.cod_empresa end) cod_empresa,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then coalesce(rq.cod_' +
          'emp_mult, rq.cod_empresa) else rq.cod_empresa end) cod_empresa,'
        'rq.data_rec,'
        
          'case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end ' +
          'codigo_ctrl,'
        
          'case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_c' +
          'trl end nome_ctrl,'
        'coalesce(fp.valordoc, 0) valordoc, fp.data_mov, fp.data_venc,'
        
          'coalesce(fp.seqform, rq.nrecibo), coalesce(fp.seqform, rq.nrecib' +
          'o)'
        'from recibos rq'
        'left join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = rq.cod_devedor and cl.' +
          'cod_empresa = rq.cod_empresa'
        
          'inner join formpagamento fp on fp.rec_numvend = rq.nrecibo and f' +
          'p.rec_tipvend = '#39'REC'#39' and fp.cod_empresa = rq.cod_empresa and fp' +
          '.tpdocs = '#39'TRC'#39
        
          'left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and' +
          ' fp.cod_empresa = ctr.codigo_emp'
        'where rq.recant = '#39'S'#39
        ';'
        '|/BLOCO|'
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
        
          '    case when (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVICOS'#39' en' +
          'd tp_recebimento, '#39'DIRETO'#39' tp_recebimento2,'
        
          '    case when (rq.tipo = '#39'REQ'#39') then 2 else 3 end ordem, rq.tipo' +
          ', coalesce(rq.nped, 0) as Num_doc,'
        
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
        
          '    case when (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVICOS'#39' en' +
          'd tp_recebimento, '#39'RECIBO'#39' tp_recebimento2,'
        
          '    case when (rq.tipo = '#39'REQ'#39') then 2 else 3 end ordem, rq.tipo' +
          ', coalesce(rq.nped, 0) as Num_doc,'
        
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
        
          '    case when (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVICOS'#39' en' +
          'd tp_recebimento, '#39'TROCO'#39' tp_recebimento2,'
        
          '    case when (rq.tipo = '#39'REQ'#39') then 2 else 3  end ordem, rq.tip' +
          'o, coalesce(rq.nped, 0) as Num_doc,'
        
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
        '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 1 qtde_prest from com_fat mt'
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
        '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 1 qtde_prest from com_fat mt'
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
        '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 1 qtde_prest from com_fat mt'
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
        '    '#39'N'#39' venda,'
        '    '#39#39' tipv,'
        '    '#39'REC'#39' as tipo_doc, 1 qtde_prest'
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
        '    '#39'N'#39' venda,'
        '    '#39#39' tipv,'
        '    '#39'REC'#39' as tipo_doc, 1 qtde_prest'
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
        '    pr.tp_doc_v as tipo_doc,'
        
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
        '    pr.tp_doc_v as tipo_doc,'
        
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
        '    pr.tp_doc_v as tipo_doc,'
        
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
        '    pr.tp_doc_v as tipo_doc,'
        
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
        '    pr.tp_doc_v as tipo_doc,'
        
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
        '    pr.tp_doc_v as tipo_doc,'
        
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
        
          '    '#39'N'#39' venda, '#39#39' tipv, '#39'LANCCXL'#39' tipo_doc, 1 qtde_prest from la' +
          'nccxl lanc'
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
        
          '    select case when (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVI' +
          'COS'#39' end tp_recebimento, '#39'DIRETO'#39' tp_recebimento2,'
        
          '    case when (rq.tipo = '#39'REQ'#39') then 2 else 3 end ordem, rq.tipo' +
          ', rq.tipo,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        '    rq.data_fech, rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl,'
        
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
        
          '    case when (rq.tipo = '#39'REQ'#39') then 2 else 3 end ordem, rq.tipo' +
          ', rq.tipo,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        '    rq.data_fech, rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl,'
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
        
          '    select case when (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVI' +
          'COS'#39' end tp_recebimento, '#39'TROCO'#39' tp_recebimento2,'
        
          '    case when (rq.tipo = '#39'REQ'#39') then 2 else 3 end ordem, rq.tipo' +
          ', rq.tipo,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        '    rq.data_fech, rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl,'
        
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
        '    mt.data_fech, mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl,'
        
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
        '    mt.data_fech, mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl,'
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
        '    mt.data_fech, mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl,'
        
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
        '    rec.data_rec, rec.dia_cxl, coalesce(rec.op_cxl, 0) op_cxl,'
        
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
        '    rec.data_rec, rec.dia_cxl, coalesce(rec.op_cxl, 0) op_cxl,'
        
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
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, '
        
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
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, '
        
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
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, '
        
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
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl,'
        
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
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl,'
        
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
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl,'
        
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
          'e(lanc.op_cxl, 0) op_cxl,'
        
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
        'CREATE OR ALTER VIEW CRED_JUR('
        '    N_CONTA_PLC,'
        '    NOME,'
        '    DATA_REC,'
        '    TIPO_DOC,'
        '    N_DOC,'
        '    HISTORICO,'
        '    DATA_VENC,'
        '    VALOR,'
        '    TERCEIRO,'
        '    CONTROLE,'
        '    DATA_QUITACAO,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    TIPODOC_V,'
        '    DATA_VENDA,'
        '    NDOC_V,'
        '    LOTE_QUIT,'
        '    CODIGO_VEND,'
        '    CODSEQ,'
        '    TPDOC,'
        '    COD_CLIENTE,'
        '    STATUS_C,'
        '    VALOR_CORR,'
        '    VALOR_LIQ,'
        '    NOME_CTRL,'
        '    EXIBIR_RESUMO_FINANCEIRO)'
        'AS'
        '-- VIEW EXIBE OS CREDITOS E CHEQUES'
        
          '-- RELATORIO "RESUMO FINANCEIRO" EXIBIDO NA PARTE DAS CONTAS A R' +
          'ECEBER VENCIDAS'
        
          'select c.n_conta_plc,c.nome_c,c.data_rec_c,c.tipo_doc_c,c.n_doc_' +
          'c,'
        '       c.historico_c,c.data_venc_c,c.valor_c,c.nome_terc,'
        '       c.codigo_ctrl,c.datq_c,'
        
          '       (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codig' +
          'o_unificadora else c.codigo_emp end) cod_empresa,'
        '       c.cod_emp_mult,c.TP_DOC_V,'
        '       c.DATA_VENDA,c.n_doc_v,c.lote_quit,c.codigo_vend,'
        
          '       c.cod_cred,'#39'CRED'#39',c.cod_cliente,c.status_c,c.valor_corr,c' +
          '.valor_liquido,ctr.nome_ctrl, coalesce(ctr.exibir_resumo_finance' +
          'iro, '#39'S'#39')'
        '       from controle_creditos c'
        '       left join empresa emp on c.codigo_emp = emp.cod_empresa'
        
          '       inner join controles ctr on ctr.codigo_ctrl = c.codigo_ct' +
          'rl and ctr.codigo_emp = c.codigo_emp'
        'union'
        
          'select ch.n_conta_plc,ch.nome_ch,ch.data_rec,CAST('#39'CHQ          ' +
          '  '#39' as CHAR(15)),ch.n_ch,'
        
          '       ch.historico_ch,ch.data_venc,ch.valor_ch,CAST(ch.nome_ter' +
          'c AS CHAR(35)),'
        '       ch.codigo_ctrl,ch.datq_ch,'
        
          '       (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codig' +
          'o_unificadora else ch.codigo_emp end) cod_empresa,'
        '       ch.cod_emp_mult,ch.TP_DOC_V,'
        '       ch.DATA_VENDA,ch.n_doc_v,ch.lote_quit,ch.codigo_vend,'
        
          '       ch.codigo_ch,'#39'CHQ '#39',ch.cod_cliente,ch.status_ch,ch.valor_' +
          'corr,ch.valor_ch,ctr.nome_ctrl, coalesce(ctr.exibir_resumo_finan' +
          'ceiro, '#39'S'#39')'
        '       from controle_cheque ch'
        '       left join empresa emp on ch.codigo_emp = emp.cod_empresa'
        
          '       inner join controles ctr on ctr.codigo_ctrl = ch.codigo_c' +
          'trl and ctr.codigo_emp = ch.codigo_emp;'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_FORMPAG_NPROC ON FORMPAGAMENTO (N_PROCESSAMENTO' +
          ', COD_EMPRESA);'
        
          'CREATE INDEX IDX_DATA_REF ON LANCAMENTOS (DTREFERENCIA, CODIGO_E' +
          'MP);'
        
          'CREATE INDEX IDX_DTREF_MULT ON LANCAMENTOS (DTREFERENCIA, COD_EM' +
          'P_MULT);'
        'CREATE INDEX IDX_DT_MULT ON LANCAMENTOS (DATA, COD_EMP_MULT);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW SPED_PRESUMIDO*/'
        '|/BLOCO|')
    end
  end
end
