unit NFSeDataSet;

interface

uses
  DataSetGrid, DB, uDataSet_OOP, FieldsConfigUnit, hw_audit_utils, hw_filters;

type
  TNFSeDataSet = class(TDataSetGrid)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder);
    function GetAuditorFill(const AProcesso: string; const Additional: string = ''): TAudit_OOP; override;
    function RunSQLMaker(): TDataSet_OOP; override;
    procedure HandleFilterField(const Field: TFilterProps; var CondSet: FilterConditionEnumSet);
  end;

implementation

uses
  SysUtils, StrUtils,
  NFSeTypesUnit, NFSeTypesDisplayUnit, DFeTypesUnit, TipoComunsUnit, MasksConstsUnit,
  TipoRegraTributoDFeEnumUnit, EValidacaoNegocioUnit;

{ TNFSeDataSet }       

function TNFSeDataSet.GetAuditorFill(const AProcesso, Additional: string): TAudit_OOP;
begin
  Result := Auditor.Processo(
    AProcesso,
    Format('Seq %d - Dps %s/%s - NF %s', [ fint('seqid'), fstr('ndps'), fstr('serie'), fstr('nnfse') ])
      + IfThen(Additional <> '', ' - ' + Additional),
    fstr('seqid')
  );
end;

procedure TNFSeDataSet.GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := ''
  else if Sender.FieldName = 'SITUACAO' then
    Text := SituacaoNFSeEnumGridStr[SituacaoNFSeEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'NATUREZA_EMISSAO' then
    Text := NaturezaEmissaoNFSeEnumGridStr[NaturezaEmissaoNFSeEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'TRIBISSQN' then
    Text := TributacaoISSQNEnumStr[TributacaoISSQNEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'TPRETISSQN' then
    Text := TipoRetencaoISSQNEnumStr[TipoRetencaoISSQNEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'TPRETPISCOFINS' then
    Text := TipoRetencaoPisCofinsEnumStr[TipoRetencaoPisCofinsEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'INDTOTTRIB' then
    Text := YesNoEnumGridStr[YesNoEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'IC_TPOPER' then
    Text := TipoOperEnteGovEnumStr[TipoOperEnteGovEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'IC_TPENTEGOV' then
    Text := TipoEnteGovEnumStr[TipoEnteGovEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'INDDEST' then
    Text := YesNoEnumGridStr[YesNoEnum(Sender.AsInteger)]
//  else if Sender.FieldName = 'IC_TIPO_REGRA_FISCAL' then
//    Text := TipoRegraTributoDFeEnumStr[TipoRegraTributoDFeEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'LAYOUT_NFSE' then
    Text := LayoutNFSeEnumGridStr[LayoutNFSeEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'CANC_ORIGEM' then
    Text := OrigemCancelamentoNFSeEnumGridStr[OrigemCancelamentoNFSeEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'ORDENS_SERVICO' then
    Text := Sender.AsString;
end;

procedure TNFSeDataSet.HandleFilterField(const Field: TFilterProps; var CondSet: FilterConditionEnumSet);
begin
  if Field.field = 'ORDENS_SERVICO' then
    CondSet := [ feEquals, feBetween ];
end;

function TNFSeDataSet.RunSQLMaker: TDataSet_OOP;
var
  I: Integer;
  nOS: Integer;
  sCond: string;
  eCond: FilterConditionEnum;
begin
  for I := 0 to High(SQLMaker.FilterMk.Items) do
    if SQLMaker.FilterMk.Items[I].field = 'ORDENS_SERVICO' then
    begin
      eCond := SQLMaker.FilterMk.Items[I].GetCondition();

      case eCond of
        feBetween:
          begin
            if not TryStrToInt(SQLMaker.FilterMk.Items[I].between1, nOS) then
              raise EValidacaoNegocio.Create('Número inicial de O.S inválido');

            sCond := Format( ' nped between %d and ', [ nOS ] );

            if not TryStrToInt(SQLMaker.FilterMk.Items[I].between2, nOS) then
              raise EValidacaoNegocio.Create('Número final de O.S inválido');

            sCond := sCond + IntToStr(nOS);
          end;

        else
        begin
          if not TryStrToInt(SQLMaker.FilterMk.Items[I].value, nOS) then
            raise EValidacaoNegocio.Create('Número de O.S inválido');

          sCond := Format( ' nped %s %d ', [ COND_SQL[eCond], nOS ]);
        end;
      end;

      SQLMaker.FilterMk.Items[I].condition := 'exists';
      SQLMaker.FilterMk.Items[I].value := Format(
        '(select first 1 1 from nfse_os ' +
        'where nfse_id = n.id and cod_empresa = n.cod_empresa and tipo = ''OS'' ' +
        ' and %s)',
        [ sCond ]
      );
      SQLMaker.FilterMk.Items[I].isHandled := True;
    end;

  Result := inherited RunSQLMaker();
end;

constructor TNFSeDataSet.Create;
begin
  inherited Create( 'CDS_DPS', 'NFSE' );

  SQLMaker.Build( TableName, 'n',
    // 'select
    'n.id, n.seqid, n.cod_empresa, n.cod_cliente, n.intermediario_id, n.dest_ibscbs_id, n.op_interna_id, n.cod_servico, ' +
    'n.layout_nfse, n.situacao, n.natureza_emissao, n.tpamb, n.dhemi, n.veraplic, n.serie, n.ndps, n.dcompet, ' +
    'n.nlote, n.nprotocolo, n.chave_nfse, n.dhproc, n.cstat, n.nnfse, n.ndfse, n.vliq, n.vtotnf, n.predutor, ' +
    'n.vtotalret, n.cverificacao, n.clocprestacao, n.finnfse, n.cindop, n.tpoper, n.tpentegov, n.inddest, n.ccnae, ' +
    'n.clc116, n.ctribnac, n.ctribmun, n.xdescserv, n.cnbs, n.vserv, n.vdescincond, n.tribissqn, n.tpretissqn, ' +
    'n.iss_paliq, n.iss_vbc, n.viss, n.pc_cst, n.pc_vbcpiscofins, n.pc_paliqpis, n.pc_paliqcofins, n.pc_vpis, ' +
    'n.pc_vcofins, n.tpretpiscofins, n.vretirrf, n.vretcsll, n.vretcp, n.vretpis, n.vretcofins, n.ptottribfed, ' +
    'n.ptottribest, n.ptottribmun, n.indtottrib, n.ptottribsn, n.canc_origem, n.dhcanc, ' +
    't.id t_id, t.tipo_part t_tipo_part, t.cpfcnpj t_cpfcnpj, t.nif t_nif, t.cnaonif t_cnaonif, t.im t_im, ' +
    't.xnome t_xnome, t.fone t_fone, t.email t_email, t.cmun t_cmun, t.cep t_cep, t.xlgr t_xlgr, t.nro t_nro, ' +
    't.xcpl t_xcpl, t.xbairro t_xbairro, ct.nome_municipio ct_nome_municipio, n.data_cadastro, n.data_alteracao, ' +
    'i.id i_id, i.tipo_part i_tipo_part, i.cpfcnpj i_cpfcnpj, i.nif i_nif, i.cnaonif i_cnaonif, i.im i_im, ' +
    'i.xnome i_xnome, i.fone i_fone, i.email i_email, i.cmun i_cmun, i.cep i_cep, i.xlgr i_xlgr, i.nro i_nro, ' + 
    'i.xcpl i_xcpl, i.xbairro i_xbairro, ci.nome_municipio ci_nome_municipio, ' + 
    'ds.id ds_id, ds.tipo_part ds_tipo_part, ds.cpfcnpj ds_cpfcnpj, ds.nif ds_nif, ds.cnaonif ds_cnaonif, ds.im ds_im, ' + 
    'ds.xnome ds_xnome, ds.fone ds_fone, ds.email ds_email, ds.cmun ds_cmun, ds.cep ds_cep, ds.xlgr ds_xlgr, ' + 
    'ds.nro ds_nro, ds.xcpl ds_xcpl, ds.xbairro ds_xbairro, cds.nome_municipio cds_nome_municipio, ' + 
//    'ic.id ic_id, ic.finnfse ic_finnfse, ic.cindop ic_cindop, ic.tpoper ic_tpoper, ic.tpentegov ic_tpentegov, ' +
//    'ic.inddest ic_inddest, ic.tipo_regra_fiscal ic_tipo_regra_fiscal, ic.regra_fiscal_id ic_regra_fiscal_id, ' +
//    'ic.cst ic_cst, ic.cclasstrib ic_cclasstrib, ic.ccredpres ic_ccredpres, ic.cstreg ic_cstreg, ' +
//    'ic.cclasstribreg ic_cclasstribreg, ic.pdifuf ic_pdifuf, ic.pdifmun ic_pdifmun, ic.pdifcbs ic_pdifcbs, ' +
    's.id s_id, s.subst_id s_subst_id, s.chave s_chave, s.cmotivo s_cmotivo, s.xmotivo s_xmotivo, s.serie s_serie, ' +
    's.ndps s_ndps, s.nnfse s_nnfse, s.nlote s_nlote, s.cverificacao s_cverificacao, ' +
    'cl.email cl_email, ' +
    '(select list(nped, '','') from nfse_os where nfse_id = n.id) ordens_servico ',
//    'ts.cod_servico ts_cod_servico, ts.desc_servico ts_desc_servico, ts.aliq_iss ts_aliq_iss, ts.ativo ts_ativo, ' +
//    'ts.nfs_servico ts_nfs_servico, ts.cnae_serv ts_cnae_serv, ts.iss_retido ts_iss_retido, ts.ctribnac ts_ctribnac, ' +
//    'ts.ctribmun ts_ctribmun, ts.cnbs ts_cnbs, ts.isento_serv ts_isento_serv, ts.n_incidencia_serv ts_n_incidencia_serv, ' +
//    'ts.cst_pis ts_cst_pis, ts.grupo_fiscal_ibscbs ts_grupo_fiscal_ibscbs, ' +
//    'te.irrf_servico ts_irrf_servico, ts.vl_teto_irrf ts_vl_teto_irrf, te.aliq_pis_ret ts_aliq_pis_ret, ' +
//    'te.aliq_cofins_ret ts_aliq_cofins_ret, te.aliq_cssl_ret ts_aliq_cssl_ret, te.vl_teto_contrib ts_vl_teto_contrib ',
    //'from dps d ' +
    'left join nfse_part t on t.id = n.id and t.tipo_part = iif(n.natureza_emissao in (0,1), 2, 1) /*1=prestador;2=tomador*/ ' +
    'left join nfse_part i on i.id = n.id and i.tipo_part = 3    /*3=intermediario*/ ' +
    'left join nfse_part ds on ds.id = n.id and ds.tipo_part = 4 /*4=dest ibscbs*/ ' +
//    'left join nfse_ibscbs ic on ic.id = n.id ' +
    'left join nfse_subst s on s.id = n.id ' +
    'left join clientes cl on cl.cod_cliente = n.cod_cliente and cl.cod_empresa = n.cod_empresa ' +
//    'left join tipo_servico ts on ts.cod_servico = n.cod_servico ' +
//    'left join tiposerviconfse te on te.cod_tpservico = ts.nfs_servico ' +
    'left join cidades_ibge ct on ct.codigo_mun_ibge = t.cmun ' +
    'left join cidades_ibge ci on ci.codigo_mun_ibge = i.cmun ' +
    'left join cidades_ibge cds on cds.codigo_mun_ibge = ds.cmun ',
    '',
    'cast(coalesce(n.dhemi, n.data_alteracao) as date) desc, n.situacao, n.seqid desc' //'n.dcompet desc, n.dhemi desc, n.situacao' //
  );
end;

procedure TNFSeDataSet.Setup(const Builder: IFieldsConfigBuilder);
var
  S: string;
begin
  // Cuidado com esse builder, ele é usado no DAtaset, porem quem destro
  ConfigFields( Builder
    .Add(
      'id,cod_empresa,op_interna_id,veraplic,t_id,t_tipo_part,i_id,ds_id,ic_id,ts_cod_servico,ic_regra_fiscal_id,' +
      's_id,s_subst_id',
      fvInvisivel
    )
    .Add('sel', '..', fvSempreVisivel)
    // Campos de dados e NFSe
    .Add('seqid', 'Codigo', fvSempreVisivel)
    .Add('dhemi', 'Data/Hora Emissão')
    .Add('ndps', 'Numero DPS')
    .Add('serie', 'Série')
    .Add('situacao', 'Situação', GetText).Width(100)
    .Add('natureza_emissao', 'Natureza/Emissão', GetText).Width( 160 )
    .Add('NNFSE', 'Numero NFSe')
    .Add('VLIQ', 'Valor Liq NFSe', '', MSK_DEC_00)
    .Add('dcompet', 'Data serviço')
    .Add('cod_servico', 'Codigo Serviço')
    .Add('xdescserv', 'Discriminação Serviço').Width(300)
    .Add('vserv', 'Valor Serviço', '', MSK_DEC_00)
    .Add('vdescincond', 'Valor Desconto', '', MSK_DEC_00)
    .Add('ordens_servico', 'Numero O.S.', GetText)

    // Campos da NFSe gerada
    .Add('DHPROC', 'Data processamento')
    .Add('CHAVE_NFSE', 'Chave NFSe')
    .Add('CSTAT', 'NFSe - Codigo Status')
    .Add('NDFSE', 'NDFSE')
    .Add('VTOTNF', 'Valor Liq(IBSBCBS)', '', MSK_DEC_00)
    .Add('PREDUTOR', 'NFSe - % Redutor(IBSBCBS)', '', MSK_DEC_00)
    .Add('VTOTALRET', 'Valor Total retenções', '', MSK_DEC_00)
    .Add('CVERIFICACAO', 'Codigo Verificação')
    .Add('NLOTE', 'Numero Lote')
    .Add('NPROTOCOLO', 'Num Protocolo')
    .Add('CANC_ORIGEM', 'Origem Cancelamento', GetText)
    .Add('DHCANC', 'Data Cancelamento')

    // Mais campos de dados
    .Add('viss', 'Valor ISS', '', MSK_DEC_00)
    .Add('iss_vbc', 'Base de Cálculo ISS', '', MSK_DEC_00)
    .Add('iss_paliq', 'Aliquota ISS (%)', '', MSK_DEC_00)
    .Add('tribissqn', 'Tributação ISSQN', GetText).Width( 150 )
    .Add('tpretissqn', 'Tipo Retenção ISSQN', GetText)
    .Add('pc_vpis', 'Valor PIS', '', MSK_DEC_00)
    .Add('pc_vcofins', 'Valor COFINS', '', MSK_DEC_00)
    .Add('pc_vbcpiscofins', 'Base PIS/COFINS', '', MSK_DEC_00)
    .Add('pc_paliqpis', 'Aliquota PIS (%)', '', MSK_DEC_00)
    .Add('pc_paliqcofins', 'Aliquota COFINS (%)', '', MSK_DEC_00)
    .Add('tpretpiscofins', 'Tipo Retenção PIS/COFINS', GetText).Width( 230 )
    .Add('vretirrf', 'Valor Retido IRRF', '', MSK_DEC_00)
    .Add('vretcsll', 'Valor Retido CSLL', '', MSK_DEC_00)
    .Add('vretcp', 'Valor Retido CP', '', MSK_DEC_00)
    .Add('vretpis', 'Valor Retido PIS', '', MSK_DEC_00)
    .Add('vretcofins', 'Valor Retido COFINS', '', MSK_DEC_00)
    .Add('ccnae', 'CNAE', '0000-0/00;0;_').Width( 65 )
    .Add('clc116', 'Codigo LC 116', '00.00;1;_')
    .Add('ctribnac', 'Codigo Tributação Nacional', '00.00.00;0;_')
    .Add('ctribmun', 'Codigo Tributação Municipal')
    .Add('cnbs', 'NBS', '0.0000.00.00;0;_').Width( 900 )
    .Add('clocprestacao', 'Codigo Município Prestação')

    // Dados do Tomador/Prestador
    .Add('t_cpfcnpj', 'CPF/CNPJ - Tomador/Prestador')
    .Add('t_xnome', 'Nome/Razão - Tomador/Prestador')
    .Add('t_im', 'Inscrição Municipal - Tomador/Prestador')
    .Add('t_nif', 'NIF (Estrangeiro) - TomaTomador/Prestadordor')
    .Add('t_cnaonif', 'País (sem NIF) - Tomador/Prestador')
    .Add('t_cmun', 'Codigo Município - Tomador/Prestador')
    .Add('ct_nome_municipio', 'Município - Tomador/Prestador')
    .Add('t_cep', 'CEP - Tomador/Prestador')
    .Add('t_xlgr', 'Logradouro - Tomador/Prestador')
    .Add('t_nro', 'Numero - Tomador/Prestador')
    .Add('t_xcpl', 'Complemento - Tomador/Prestador')
    .Add('t_xbairro', 'Bairro - Tomador/Prestador')
    .Add('t_fone', 'Telefone - Tomador/Prestador')
    .Add('t_email', 'E-mail - Tomador/Prestador')
    .Add('cl_email', 'E-mail - Cadastro Cliente ')

    // Destinatário (IBS/CBS)
    .Add('ds_cpfcnpj', 'Destinatário - CPF/CNPJ')
    .Add('ds_xnome', 'Destinatário - Nome/Razão Social')
    .Add('ds_im', 'Destinatário - Inscrição Municipal')
    .Add('ds_nif', 'Destinatário - NIF')
    .Add('ds_cnaonif', 'Destinatário - País (sem NIF)')
    .Add('ds_cmun', 'Destinatário - Código Município')
    .Add('cds_nome_municipio', 'Destinatário - Município')
    .Add('ds_cep', 'Destinatário - CEP')
    .Add('ds_xlgr', 'Destinatário - Logradouro')
    .Add('ds_nro', 'Destinatário - Numero')
    .Add('ds_xcpl', 'Destinatário - Complemento')
    .Add('ds_xbairro', 'Destinatário - Bairro')
    .Add('ds_fone', 'Destinatário - Telefone')
    .Add('ds_email', 'Destinatário - E-mail')

    // Intermediário
    .Add('i_cpfcnpj', 'Intermediário - CPF/CNPJ')
    .Add('i_xnome', 'Intermediário - Nome/Razão Social')
    .Add('i_im', 'Intermediário - Inscrição Municipal')
    .Add('i_nif', 'Intermediário - NIF')
    .Add('i_cnaonif', 'Intermediário - País (sem NIF)')
    .Add('i_cmun', 'Intermediário - Código Município')
    .Add('ci_nome_municipio', 'Intermediário - Município')
    .Add('i_cep', 'Intermediário - CEP')
    .Add('i_xlgr', 'Intermediário - Logradouro')
    .Add('i_nro', 'Intermediário - Numero')
    .Add('i_xcpl', 'Intermediário - Complemento')
    .Add('i_xbairro', 'Intermediário - Bairro')
    .Add('i_fone', 'Intermediário - Telefone')
    .Add('i_email', 'Intermediário - E-mail')

    // Valores aproximados dos tribuutos
    .Add('ptottribfed', 'Trib aprox % Federal', '', MSK_DEC_00)
    .Add('ptottribest', 'Trib aprox % Estadual', '', MSK_DEC_00)
    .Add('ptottribmun', 'Trib aprox % Municipal', '', MSK_DEC_00)
    .Add('ptottribsn', 'Trib aprox % Total SN', '', MSK_DEC_00)
    .Add('indtottrib', 'Trib aprox Ind Total SN', GetText)

    // Campos IBS/CBS
    .Add('finnfse', 'Finalidade NFSe')
    .Add('cindop', 'Codigo Indicador Operação')
    .Add('tpoper', 'Tipo Operação', GetText)
    .Add('tpentegov', 'Tipo Ente Governamental', GetText)
    .Add('inddest', 'Destinatário difere do Tomador', GetText)
//    .Add('ic_finnfse', 'Finalidade NFSe')
//    .Add('ic_cindop', 'Código Indicador Operação')
//    .Add('ic_tpoper', 'Tipo Operação', GetText)
//    .Add('ic_tpentegov', 'Tipo Ente Governamental', GetText)
//    .Add('ic_inddest', 'Destinatário difere do Tomador', GetText)
//    .Add('ic_tipo_regra_fiscal', 'Tipo Regra Fiscal', GetText)
//    .Add('ic_cst', 'CST')
//    .Add('ic_cclasstrib', 'Classe Tributária')
//    .Add('ic_ccredpres', 'Crédito Presumido')
//    .Add('ic_cstreg', 'CST Regime')
//    .Add('ic_cclasstribreg', 'Classe Tributária Regime')
//    .Add('ic_pdifuf', '% Diferencial UF', '', MSK_DEC_0000)
//    .Add('ic_pdifmun', '% Diferencial Município', '', MSK_DEC_0000)
//    .Add('ic_pdifcbs', '% Diferencial CBS', '', MSK_DEC_0000)

    // Metadados e controle
    .Add('layout_nfse', 'Layout NFSe', GetText).Width( 150 )
    .Add('tpamb', 'Tipo Ambiente')

    .Add('s_chave', 'Substituição - Chave')
    .Add('s_cmotivo', 'Substituição - Código Motivo')
    .Add('s_xmotivo', 'Substituição - Motivo')
    .Add('s_ndps', 'Substituição - Numero RPS')
    .Add('s_serie', 'Substituição - Serie RPS')
    .Add('s_nnfse', 'Substituição - Num NFSe RPS')
    .Add('s_nlote', 'Substituição - Num Lote')
    .Add('s_cverificacao', 'Substituição - Codigo Verificação')

    .Add('tomador_id', 'ID Tomador')
    .Add('intermediario_id', 'ID Intermediário')
    .Add('dest_ibscbs_id', 'ID Destinatário (IBS/CBS)')
    .Add('data_cadastro', 'Data cadastro')
    .Add('data_alteracao', 'Data alteração')
    .ReorderAndSync( Self.GetSavedGrid().List )
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('id', True);

  S := SQLMaker.GetSQL();

  CreateFieldsBySQL( S );

  CreateSelectionField('SEL');

  RunSQLMaker();
end;

end.
