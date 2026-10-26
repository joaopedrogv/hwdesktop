unit uCalculoPISCOFINS;

interface

uses
  IBX.IBQuery,
  opfiscal_confs,
  opfiscal_model,
  opfiscal_hw,
  produtos_tmp_fb,
  hw_strings,
  IBX.IBDatabase,
  uClasseConexao;

type

  TProgressCalc = procedure(position, max: Integer) of Object;

  TConfigGlobalNF = class(TConfigGlobalNotaFiscal)
  public
    constructor Create();
    destructor Destroy; override;

    procedure ExecutarLeitura(
      con       : TConexao;
      empresa_id: Integer);
  end;

  TCalculoPISCOFINS = class(TConexao)
  private
    conf_nf       : TConfigGlobalNF;
    conf_bcnf     : TConfTributo;
    dataIni       : TDateTime;
    dataFim       : TDateTime;
    cod_empresa   : Integer;
    alterarCST4998: Boolean;
    Fprogress: TProgressCalc;
    function buildOpFiscal: TCadItensTributos;
    procedure handleBcPisCofins(modelo, natureza: string);
  public
    constructor Create(
      dtIni        : TDateTime;
      dtFim        : TDateTime;
      empresa_id   : Integer;
      alteraCST4998: Boolean;
      db           : TIBDatabase);
    procedure Calcular;

    property OnProgres: TProgressCalc read Fprogress write Fprogress;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  config_sistema_class,
  notafiscal_item_fb,
  ItemNota_Model,
  hw_progress_utils,
  hw_utils;

{ TConfigGlobalNF }

constructor TConfigGlobalNF.Create();
begin
  FConf_PIS := TConfigGlobalNF_PISCOFINS.Create;
end;

destructor TConfigGlobalNF.Destroy;
begin
  if Assigned(FConf_PIS) then
    FreeAndNil(FConf_PIS);

  inherited;
end;

procedure TConfigGlobalNF.ExecutarLeitura(
  con       : TConexao;
  empresa_id: Integer);
var
  confs: TConfig_sistema_classList;
  conf : TConfig_sistema_class;
begin
  confs := TConfig_sistema_classList.Create;
  confs.AddKey('nf_piscofins_bases')
    .AddKey('nf_piscofins_cst_05_revenda_base_zero')
    .AddKey('nf_conf_ncm_cfop_piscofins')
    .MakeAll(con.QrAux, empresa_id);

  FConf_PIS.nf_piscofins_cst_05_revenda_base_zero := True;

  for conf in confs do
  begin

    if conf.chave = 'nf_conf_ncm_cfop_piscofins' then
      FConf_PIS.dados_ncm_cfop.Make(conf.value1_b)
    else if conf.chave = 'nf_piscofins_cst_05_revenda_base_zero' then
      Self.Conf_PIS.nf_piscofins_cst_05_revenda_base_zero := conf.value1_f = 1
    else if conf.chave = 'nf_piscofins_bases' then
    begin
      Self.Conf_PIS.nf_piscofins_bases.Free;
      Self.Conf_PIS.nf_piscofins_bases := TCfg_sis(conf.Clone);
    end;
  end;

end;

{ TCalculoPISCOFINS }

procedure TCalculoPISCOFINS.handleBcPisCofins(
  modelo, natureza: string);
var
  section, str: string;
  //conf: TConfTributo;
begin
  conf_bcnf.Clear;
  //conf_bcnf.Text := TConfTributo.Create();
  section   := ReplaceText(TConfTributo.GetSectionBC(ttPISCOFINS, natureza, modelo), 'Composicao_BC_PISCOFINS_', '');
  //conf.Text := fstr('conf_bc');
  //if not conf.ini.SectionExists(section) then
  begin
    section := ReplaceText(section, 'Composicao_BC_PISCOFINS_', '');
    {
    Esse codigo causa o erro quando nao tem a Section, cria a section e o metodo de base de calculo usa a section sem nada
    conf_nf.Conf_PIS.nf_piscofins_bases.value1_b.WriteString(section, 'vaimisera', 'hjhjh');
    str := conf_nf.Conf_PIS.nf_piscofins_bases.value1_b.Text;
    if str = '' then
      str := '1';
    }
    if conf_nf.Conf_PIS.nf_piscofins_bases.value1_b.ini.SectionExists(section) then
    begin
      conf_nf.Conf_PIS.nf_piscofins_bases.value1_b.WriteBool(section, 'Habilitado', True);
      conf_nf.Conf_PIS.nf_piscofins_bases.value1_b.WriteString(section, 'Campo_Valor', 'S');
      conf_bcnf.setConfBC(ttPISCOFINS, natureza, modelo, section, conf_nf.Conf_PIS.nf_piscofins_bases.value1_b);
    end;
  end;
end;

function TCalculoPISCOFINS.buildOpFiscal: TCadItensTributos;
var
  idtmp     : string;
  notas     : TConexao_OOP;
  ops       : TCadItensTributos;
  item      : TItemTributos;
  I         : Integer;
  condFiscal: TCondicaoFiscal;
begin
  Result := TCadItensTributos.Create;

  Randomize;
  idtmp := OnlyNumber(DateTimeToStr(Now)) + IntToStr(Random(999999));

  SqlOpen('insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod)' +
    ' select distinct ''%s'' id_tmp, nfi.cod_empresa, nfi.grupo_prod, nfi.cod_prod' +
    ' from notafiscal nf' +
    ' inner join  notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
    ' where nf.data_lanc >= %s and nf.data_lanc <= %s and nf.cod_empresa = %d' +
    ' and (nf.conf_piscofins is null or nf.conf_piscofins <> ''C'')' +
    ' and (nf.status <> ''Cancelada'' and nf.status <> ''Aberta'')',
    [idtmp, date_fb(dataIni), date_fb(dataFim), cod_empresa]);

//  notas := NewClientOOP(
//    'select distinct nf.dest_cmun cidade_ibge,' +
//    ' coalesce(nf.nfe_indiedest, iif(coalesce(nf.insc_est, '''') in ('''', ''ISENTO''), ''9'', ''1'')) indiedest,' +
//    ' coalesce(nf.consumidor_final, ''S'') consumidor_final,' +
//    ' coalesce(nf.finalidadeid, 0) finalidade_id,' +
//    ' nf.dest_uf uf,' +
//    ' iif(char_length(rtrim(nf.cpfcgc)) = 14, ''PJ'', ''PF'') pessoa,' +
//    ' nfi.ncm,' +
//    ' (iif(nf.tipo_nf = ''S'', 1, 0) + iif((trim(nfv.tipo_venda) = ''N''), 2, 0) +' +
//    ' iif((trim(nfv.tipo_venda) = ''U''), 3, 0) + iif(nf.tipo_nf = ''O'', 4, 0) +' +
//    ' iif(nf.tipo_nf = ''O'', 5, 0)) tipo_nota' +
//    ' from notafiscal nf' +
//    '   inner join  notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
//    '   left join notafiscal_item_veiculo nfv on nfv.cod_nf = nfi.cod_nf and nfv.cod_empresa = nfi.cod_empresa and nfv.nitem = nfi.nitem' +
//    ' where nf.data_lanc >= %s and nf.data_lanc <= %s and nf.cod_empresa = %d' +
//    ' and nfi.ncm <> '''' and nfi.ncm <> ''00'' and nfi.ncm <> ''99''' +
//    ' and (nf.conf_piscofins is null or nf.conf_piscofins <> ''C'')' +
//    ' and nf.status = ''Fechada''',
//    [date_fb(dataIni), date_fb(dataFim), cod_empresa]);
//
//  while not notas.Eof do
//  begin
//    condFiscal.cidadeIbgeDest := notas.fint('cidade_ibge');
//    condFiscal.indIEDest      := notas.fstr('indiedest');
//    condFiscal.consumoFinal   := notas.fstr('consumidor_final');
//    condFiscal.finalidadeId   := notas.fint('finalidade_id');
//    condFiscal.ufDest         := notas.fstr('uf');
//    condFiscal.pessoa         := notas.fstr('pessoa');
//    condFiscal.ncm            := notas.fstr('ncm');
//    condFiscal.tipoNF         := TTipoNotaFiscal(notas.fint('tipo_nota'));
//
//    ops := OpFiscal.GetOperacoes(idtmp, condFiscal, cod_empresa, Self);
//
//    for item in ops do
//    begin
//      item.CopyFrom(notas.DataSet);
//      Result.Add(item);
//    end;
//
//    notas.Next;
//  end;
end;

procedure TCalculoPISCOFINS.Calcular;
var
  produtos    : TItemNotas_Model;
  prod        : TItemNota_Model;
  nfitem      : TNotafiscal_item_fb;
  itemTrib    : TItemTributos;
  itemFiscal  : TItemFiscal;
  trib        : TPisCofinsTributavel;
  conf_ad     : THw_conf_piscofins_ad_class;
  cad_opfiscal: TCadItensTributos;
  condFiscal  : TCondicaoFiscal;
  cst_merc    : string;
  idtmp       : string;
  regime      : string;
  count       : Integer;
  aliqPis     : Double;
  aliqCofins  : Double;
  sql         : string;
begin
//  PercentsUtil.Msg('Iniciando...');
  conf_nf   := TConfigGlobalNF.Create();
  conf_bcnf := TConfTributo.Create;
  try
    conf_nf.ExecutarLeitura(Self, cod_empresa);

    //cad_opfiscal := buildOpFiscal;
    cad_opfiscal := TCadItensTributos.Create;

    Randomize;
    idtmp := OnlyNumber(DateTimeToStr(Now)) + IntToStr(Random(999999));

    SqlOpen('insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod)' +
      ' select distinct ''%s'' id_tmp, nfi.cod_empresa, nfi.grupo_prod, nfi.cod_prod' +
      ' from notafiscal nf' +
      ' inner join  notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
      ' where nf.data_lanc >= %s and nf.data_lanc <= %s and nf.cod_empresa = %d' +
      ' and (nf.conf_piscofins is null or nf.conf_piscofins <> ''C'')' +
      ' and (nf.status <> ''Cancelada'' and nf.status <> ''Aberta'')',
      [idtmp, date_fb(dataIni), date_fb(dataFim), cod_empresa]);


    with NewClientOOP('select regime, pis_emp, cofins_emp from empresa where cod_empresa = %d', [cod_empresa]) do
    begin
      regime     := fstr('regime');
      aliqPis    := ffloat('pis_emp');
      aliqCofins := ffloat('cofins_emp');
    end;

    // PercentsUtil.Msg('Copiando dados');

    sql := 'select' +
      ' nf.dest_cmun cidade_ibge,' +
      ' coalesce(nf.nfe_indiedest, iif(coalesce(nf.insc_est, '''') in ('''', ''ISENTO''), 9, 1)) indiedest,' +
      ' coalesce(nf.consumidor_final, ''S'') consumidor_final,' +
      ' coalesce(nf.finalidadeid, 0) finalidade_id,' +
      ' nf.dest_uf uf, nf.natureza_nf, nf.modelo_nf, nf.nfe_iddest,' +
      ' iif(char_length(rtrim(nf.cpfcgc)) = 14, ''PJ'', ''PF'') pessoa,' +
      ' (iif(nf.tipo_nf = ''S'', 1, 0) + iif((trim(nfv.tipo_venda) = ''N''), 2, 0) +' +
      ' iif((trim(nfv.tipo_venda) = ''U''), 3, 0) + iif(nf.tipo_nf = ''O'', 4, 0) +' +
      ' iif(nf.tipo_nf = ''O'', 5, 0)) tipo_nota, nf.conf_bc, nf.frete_f_nfe, nf.freteconta_tr,' +
      ' nfi.cod_nf, nfi.cod_empresa, nfi.nitem, nfi.grupo_prod, nfi.cod_prod,  nfi.cod_servico, nfi.tipo_item,' +
      ' nfi.ncm, nfi.cest, nfi.codigo_nop, nfi.tipo_calc_pc,' +
      ' nfi.cst_pis, nfi.cst_cofins, nfi.nat_rec, nfi.valor_pis, nfi.valor_cofins,' +
      ' nfi.base_pis, nfi.base_cofins, nfi.aliq_pis, nfi.aliq_cofins, nfi.aliq_pis_quant,' +
      ' nfi.aliq_cofins_quant, nfi.quantidade, nfi.ppisdeson, nfi.pcofinsdeson, nfi.vpisdeson,' +
      ' nfi.vcofinsdeson, nfi.motdes_pc, nfi.quant_bc_pis, nfi.quant_bc_cofins,' +
      ' nfi.valor_total, nfi.rateio_desconto, nfi.rateio_seguro, nfi.rateio_outdesp, nfi.rateio_frete,' +
      ' nfi.valor_ipi, nfi.valor_icmsub, nfi.vicmdeson, nfi.valor_icm, nfi.prec_cusm_prod,' +
      ' rtrim(iif(nfi.tipo_item = ''S'', ts.cst_pis, pr.cst_pis)) cst_pis_sai,' +
      ' rtrim(iif(nfi.tipo_item = ''S'', ts.cst_pis_ent, pr.cst_pis_ent)) cst_pis_ent, rtrim(pr.nat_rec) nat_rec_prod,' +
      ' pr.tipo_item tipo_item_prod,' +
      ' pr.cst_prod, pr.aliq_pis_diferenciada, pr.aliq_cofins_diferenciada, pr.aliq_cred_pis, pr.aliq_cred_cofins,' +
      ' nfv.precocompra preco_compra_veiculo,' +
      ' cfop.devolucao_sped, cfop.tipv_veiculo, nfi.vicmsufdest' +
      ' from notafiscal nf' +
      ' inner join  notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
      ' left join notafiscal_item_veiculo nfv on nfv.cod_nf = nfi.cod_nf and nfv.cod_empresa = nfi.cod_empresa and nfv.nitem = nfi.nitem'
      +
      ' left join nat_op cfop on cfop.codigo_nop = nfi.codigo_nop' +
      ' left join produtos pr on pr.grupo_prod = nfi.grupo_prod and pr.cod_prod = nfi.cod_prod and pr.cod_empresa = nfi.cod_empresa'
      +
      ' left join tipo_servico ts on ts.cod_servico = nfi.cod_servico'
      +
      ' where nf.data_lanc >= %s and nf.data_lanc <= %s and nf.cod_empresa = %d' +
      ' and (nf.conf_piscofins is null or nf.conf_piscofins <> ''C'')' +
      ' and nf.status = ''Fechada''';

      sql := sql + ' and nf.modelo_nf not in (''O'', ''E'')' +
             ' union ' +
             StringReplace(sql, 'nf.data_lanc', 'nf.data_contabil', [rfReplaceAll, rfIgnoreCase]) + ' and nf.modelo_nf in (''O'', ''E'')';

      produtos := TItemNotas_Model.Create;
      produtos.CopyFrom(TItemNota_Model,
        SqlOpen( sql, [date_fb(dataIni), date_fb(dataFim), cod_empresa,
                       date_fb(dataIni), date_fb(dataFim), cod_empresa]));

    count := 0;
//    PercentsUtil.MaxProgress(produtos.count);
//    PercentsUtil.Msg('Calculando');

    for prod in produtos do
    begin
//      PercentsUtil.IncProgress;
      count := count + 1;
      if Assigned(Fprogress) then
        Fprogress(count, produtos.Count);

      if (prod.tipv_veiculo = 'T') and (alterarCST4998) then
      begin

        itemTrib := TItemTributos.Create; // vai zerar entao nao precisa obter

      end
      else
      begin

        condFiscal.cidadeIbgeDest := prod.cidade_ibge;
        condFiscal.indIEDest      := IntToStr(prod.indIEDest);
        condFiscal.consumoFinal   := prod.consumidor_final;
        condFiscal.icm_cst        := Copy(prod.cst_prod, 2, 2);
        condFiscal.piscofins_cst  := prod.cst_pis_sai;
        condFiscal.finalidadeId   := prod.finalidade_id;
        condFiscal.ncm            := prod.ncm;
        condFiscal.pessoa         := prod.pessoa;
        condFiscal.tipoItem       := prod.tipo_item_prod;
        condFiscal.tipoNF         := TTipoNotaFiscal(prod.tipo_nota);
        condFiscal.ufDest         := prod.uf;

        itemTrib := cad_opfiscal.GetOperacao(condFiscal);

        //if (prod.tipo_item <> 'P') and (not Assigned(itemTrib)) then
        if (itemTrib.piscofins.piscofins_id = 0) and (itemTrib.ncm = '') then
        begin
          itemTrib := OpFiscal.GetOperacao(condFiscal, cod_empresa, Self);
          cad_opfiscal.Add(itemTrib);
        end;
      end;

      if //(TTipoCalculo(VarToInt(prod.tipo_calc_pc)) = tcCompleto) and
      (prod.vpisdeson = 0) and (prod.vcofinsdeson = 0)
      then
      begin
        nfitem := TNotafiscal_item_fb.Create;
        nfitem.CopyFrom(prod);

        if (prod.tipv_veiculo = 'T') and (alterarCST4998) then
        begin
          itemTrib.piscofins.cst_pc       := IfThen(prod.natureza_nf = 'S', '49', '98');
          itemTrib.piscofins.aliq_pis     := 0;
          itemTrib.piscofins.aliq_cofins  := 0;
          itemTrib.piscofins.valiq_pis    := 0;
          itemTrib.piscofins.valiq_cofins := 0;
          itemTrib.piscofins.nat_rec      := '';
        end
        else if (not Assigned(itemTrib)) or (itemTrib.piscofins.piscofins_id = 0) then
        begin

          {$REGION 'sem operacao fiscal'}
          if MatchText(nfitem.tipo_item, ['P', 'S']) then
          begin

            cst_merc          := IfThen(prod.natureza_nf = 'S', prod.cst_pis_sai, prod.cst_pis_ent);
            nfitem.cst_pis    := IfThen(cst_merc <> '', cst_merc, IfThen(prod.natureza_nf = 'S', '01', '50'));
            nfitem.cst_cofins := nfitem.cst_pis;
            nfitem.nat_rec    := IfThen((not MatchStr(nfitem.cst_pis, ['01', '02', '03', '05'])) and (not MatchStr(Copy(nfitem.cst_pis, 1, 1), ['5', '6'])),
                                        IfThen(prod.nat_rec_prod <> '',
                                               prod.nat_rec_prod,
                                               IfThen(prod.nat_rec_ncm <> '', prod.nat_rec_ncm, nfitem.nat_rec)
                                              )
                                        );

            if MatchStr(nfitem.cst_pis, ['02', '03', '05']) then
            begin
              nfitem.aliq_pis          := IfThen(nfitem.cst_pis <> '03', prod.aliq_pis_diferenciada);
              nfitem.aliq_cofins       := IfThen(nfitem.cst_pis <> '03', prod.aliq_cofins_diferenciada);
              nfitem.aliq_pis_quant    := IfThen(nfitem.cst_pis = '03', prod.aliq_pis_diferenciada);
              nfitem.aliq_cofins_quant := IfThen(nfitem.cst_pis = '03', prod.aliq_cofins_diferenciada);
            end
            else if MatchStr(Copy(nfitem.cst_pis, 1, 1), ['5', '6']) then
            begin
              nfitem.aliq_pis          := IfThen(prod.aliq_cred_pis > 0, prod.aliq_cred_pis, aliqPis);
              nfitem.aliq_cofins       := IfThen(prod.aliq_cred_cofins > 0, prod.aliq_cred_cofins, aliqCofins);
              nfitem.aliq_pis_quant    := 0;
              nfitem.aliq_cofins_quant := 0;
            end
            else
            begin
              nfitem.aliq_pis          := IfThen(nfitem.cst_pis = '01', aliqPis);
              nfitem.aliq_cofins       := IfThen(nfitem.cst_pis = '01', aliqCofins);
              nfitem.aliq_pis_quant    := 0;
              nfitem.aliq_cofins_quant := 0;
            end;
          end
          else
          begin
            nfitem.cst_pis           := IfThen(prod.natureza_nf = 'S', '01', '50');
            nfitem.cst_cofins        := nfitem.cst_pis;
            nfitem.aliq_pis          := aliqPis;
            nfitem.aliq_cofins       := aliqCofins;
            nfitem.aliq_pis_quant    := 0;
            nfitem.aliq_cofins_quant := 0;
          end;

          {
          if simples then
          begin
            nfitem.cst_pis    := '99';
            nfitem.cst_cofins := nfitem.cst_pis;
          end
          else
          }
          if prod.devolucao_sped = 'S' then
          begin
            if (regime = 'LUCRO REAL') and (prod.natureza_nf = 'S') then
              nfitem.cst_pis    := '49'
            else if (regime = 'LUCRO PRESUMIDO') and (prod.natureza_nf = 'E') then
              nfitem.cst_pis    := '99';

            nfitem.cst_cofins := nfitem.cst_pis;
          end;

          nfitem.motdes_pc := 0;
          // não vai mexer quando existir a desoneracao, pois ja foi como desconto

          if (nfitem.cst_pis <> '49') then
          begin
            conf_ad := conf_nf.Conf_PIS.dados_ncm_cfop.get_by_ncm_cfop(nfitem.ncm, Trunc(nfitem.codigo_nop));
            if Assigned(conf_ad) then
            begin
              nfitem.cst_pis           := IfThen(conf_ad.cst <> '', conf_ad.cst, nfitem.cst_pis);
              nfitem.cst_cofins        := nfitem.cst_pis;
              nfitem.nat_rec           := IfThen(conf_ad.nat_rec <> '', conf_ad.nat_rec, nfitem.nat_rec);
              nfitem.aliq_pis          := IfThen(nfitem.cst_pis <> '03', IfThen(conf_ad.aliq_pis <> '', StrToFloatDef(conf_ad.aliq_pis, 0), nfitem.aliq_pis));
              nfitem.aliq_cofins       := IfThen(nfitem.cst_pis <> '03', IfThen(conf_ad.aliq_cofins <> '', StrToFloatDef(conf_ad.aliq_cofins, 0), nfitem.aliq_cofins));
              nfitem.aliq_pis_quant    := IfThen(nfitem.cst_pis = '03', IfThen(conf_ad.aliq_r_pis <> '', StrToFloatDef(conf_ad.aliq_r_pis, 0), nfitem.aliq_pis_quant));
              nfitem.aliq_cofins_quant := IfThen(nfitem.cst_pis = '03', IfThen(conf_ad.aliq_r_cofins <> '', StrToFloatDef(conf_ad.aliq_r_cofins, 0), nfitem.aliq_cofins_quant));
            end;
          end;

          itemTrib.piscofins.cst_pc       := IfThen(nfitem.cst_pis = '', IfThen(prod.natureza_nf = 'E', '50', '01'), nfitem.cst_pis);
          itemTrib.piscofins.aliq_pis     := IfThen(itemTrib.piscofins.cst_pc <> '03', VartoFloat(nfitem.aliq_pis));
          itemTrib.piscofins.aliq_cofins  := IfThen(itemTrib.piscofins.cst_pc <> '03', VartoFloat(nfitem.aliq_cofins));
          itemTrib.piscofins.valiq_pis    := IfThen(itemTrib.piscofins.cst_pc = '03', VartoFloat(nfitem.aliq_pis_quant));
          itemTrib.piscofins.valiq_cofins := IfThen(itemTrib.piscofins.cst_pc = '03', VartoFloat(nfitem.aliq_cofins_quant));
          itemTrib.piscofins.motdespc     := nfitem.motdes_pc;
          itemTrib.piscofins.nat_rec      := nfitem.nat_rec;

          {$ENDREGION}
        end;

        {$REGION 'preparando o calculo'}
        handleBcPisCofins(prod.modelo_nf, prod.natureza_nf);

        itemFiscal.modeloDoc    := prod.modelo_nf;
        itemFiscal.indIEDest    := IntToStr(prod.indIEDest);
        itemFiscal.iddest       := prod.nfe_iddest;
        itemFiscal.e_s          := prod.natureza_nf;
        itemFiscal.consumoFinal := prod.consumidor_final;
        itemFiscal.conf_bcnf    := TStringIni(conf_bcnf);
        itemFiscal.simples      := regime = 'SIMPLES';
        // itemFiscal.orig         := ;
        // itemFiscal.modbcST      := ;
        // itemFiscal.cprodanp     := ;
        itemFiscal.valor      := prod.valor_total;
        itemFiscal.desconto   := prod.rateio_desconto;
        itemFiscal.frete      := IfThen((prod.frete_f_nfe <> 'S') and (prod.freteconta_tr <> '9'), prod.rateio_frete);
        itemFiscal.seguro     := prod.rateio_seguro;
        itemFiscal.outras     := prod.rateio_outdesp;
        itemFiscal.vipi       := prod.valor_ipi;
        itemFiscal.vicms      := prod.valor_icm;
        itemFiscal.vicmsst    := prod.valor_icmsub;
        //itemFiscal.vicmsant   := ?;
        itemFiscal.vicmsdifal := prod.vicmsufdest;
        itemFiscal.custo      := IfThen(prod.tipo_item = 'V', prod.preco_compra_veiculo, prod.prec_cusm_prod);
        itemFiscal.quantidade := prod.quantidade;
        itemFiscal.tipoCalc   := tcCompleto;//TTipoCalculo(nfitem.tipo_calc_pc);

        itemFiscal.base   := IfThen(nfitem.cst_pis = '03', VartoFloat(nfitem.quant_bc_pis), VartoFloat(nfitem.base_pis));
        itemFiscal.baseST := 0;
        {$ENDREGION}

        {$REGION 'chamada do motor e alteracao de dados'}
        trib                     := OpFiscalMotor.CalcularPISCOFINS(itemFiscal, itemTrib.piscofins, conf_nf);
        nfitem                   := TNotafiscal_item_fb.Create;
        nfitem.CopyFrom(prod).beginChanges;

        nfitem.cst_pis           := trib.cst;
        nfitem.cst_cofins        := trib.cst;
        nfitem.quant_bc_pis      := trib.pcqtde.vbcouqtde;
        nfitem.quant_bc_cofins   := trib.pcqtde.vbcouqtde;
        nfitem.aliq_pis_quant    := trib.pcqtde.paliqpis;
        nfitem.aliq_cofins_quant := trib.pcqtde.paliqcofins;
        nfitem.base_pis          := trib.pcaliq.vbcouqtde;
        nfitem.base_cofins       := trib.pcaliq.vbcouqtde;
        nfitem.aliq_pis          := trib.pcaliq.paliqpis;
        nfitem.aliq_cofins       := trib.pcaliq.paliqcofins;
        nfitem.valor_pis         := trib.vpis;
        nfitem.valor_cofins      := trib.vcofins;
        nfitem.nat_rec           := trib.natrec;
        nfitem.motdes_pc         := 0;

        if nfitem.FoundChanges then
          SqlExec(nfitem.SQLMotor().SQLUpdate);

        if count mod 50 = 0 then
          if Transacao.InTransaction then
            Transacao.Commit;

        {$ENDREGION}
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

    end;

    SqlExec('update notafiscal_item set nat_rec = ''404''' +
            ' where tipo_item = ''V'' and cst_pis = ''05'' and ((nat_rec is null) or (nat_rec = ''''))');

    SqlExec('update notafiscal nf set ' +
      ' nf.valor_pis = coalesce((select sum(nfi.valor_pis) from notafiscal_item nfi where nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa ), 0),' +
      ' nf.valor_cofins = coalesce((select sum(nfi.valor_cofins) from notafiscal_item nfi where nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa ), 0),' +
      ' nf.conf_piscofins = ''C''' +
      ' where nf.data_lanc >= %s and nf.data_lanc <= %s and nf.cod_empresa = %d' +
      ' and coalesce(nf.conf_piscofins, '' '') <> ''C''' +
      ' and nf.status = ''Fechada''',
      [date_fb(dataIni), date_fb(dataFim), cod_empresa]).Transaction.Commit;
  finally
    conf_bcnf.Free;
    conf_nf.Free;
//    PercentsUtil.Terminate;
  end;
end;

constructor TCalculoPISCOFINS.Create(
  dtIni, dtFim : TDateTime;
  empresa_id   : Integer;
  alteraCST4998: Boolean;
  db           : TIBDatabase);
begin
  inherited Create(db);
  cod_empresa    := empresa_id;
  dataIni        := dtIni;
  dataFim        := dtFim;
  alterarCST4998 := alteraCST4998;
end;

end.
