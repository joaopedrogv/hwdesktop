unit NFSeMetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  NFSeMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

uses
  NFSeSubstMetadataUnit;

{ NFSeMetadata }

class function NFSeMetadata.GetMetadata: EntityMetadata;
begin
  // Inicializa o metadados com o nome de exibição da entidade principal
  Result := EntityMetadata.Create('NFSe');

  // =========================================================================
  // CAMPOS COM CORRESPONDÊNCIA EXATA (ATRIBUTO DA CLASSE <=> COLUNA DO BANCO)
  // =========================================================================

  // Chaves e Relacionamentos
  Result.RegisterField('Id', 'ID', 'ID da NFSe');
  Result.RegisterField('SeqId', 'SEQID', 'Codigo');
  Result.RegisterField('CodEmpresa', 'COD_EMPRESA', 'Cod. Empresa');
  Result.RegisterField('CodCliente', 'COD_CLIENTE', 'Cod. Cliente');
  Result.RegisterField('TomadorId', 'COD_CLIENTE', 'Tomador do Seriviço');
  Result.RegisterField('PrestadorId', 'COD_CLIENTE', 'Prestador do Serviço');
  Result.RegisterField('IntermediarioId', 'INTERMEDIARIO_ID', 'ID Intermediário');
  Result.RegisterField('DestIbsCbsId', 'DEST_IBSCBS_ID', 'ID Destinatário (IBS/CBS)');
  Result.RegisterField('OpInternaId', 'OP_INTERNA_ID', 'ID Op. Interna');
  Result.RegisterField('CodServico', 'COD_SERVICO', 'Codigo Serviço');

  // Identificação e Emissão
  Result.RegisterField('LayoutNFSe', 'LAYOUT_NFSE', 'Layout NFSe');
  Result.RegisterField('Situacao', 'SITUACAO', 'Situação');
  Result.RegisterField('NaturezaEmissao', 'NATUREZA_EMISSAO', 'Natureza/Emissão');
  Result.RegisterField('VerAplic', 'VERAPLIC', 'Versão Aplicativo');
  Result.RegisterField('TpAmb', 'TPAMB', 'Tipo Ambiente');
  Result.RegisterField('DhEmi', 'DHEMI', 'Data/Hora Emissão');
  Result.RegisterField('Serie', 'SERIE', 'Série');
  Result.RegisterField('NDps', 'NDPS', 'Número DPS');
  Result.RegisterField('DCompet', 'DCOMPET', 'Data serviço');
  Result.RegisterField('CLocPrestacao', 'CLOCPRESTACAO', 'Codigo Município Prestação');

  // Dados IBS/CBS e Operacionais
  Result.RegisterField('FinNFSe', 'FINNFSE', 'Finalidade NFSe');
  Result.RegisterField('CIndOp', 'CINDOP', 'Codigo Indicador Operação');
  Result.RegisterField('TpOper', 'TPOPER', 'Tipo Operação');
  Result.RegisterField('TpEnteGov', 'TPENTEGOV', 'Tipo Ente Governamental');
  Result.RegisterField('IndDest', 'INDDEST', 'Destinatário difere do Tomador');

  // Tributação e Detalhes do Serviço
  Result.RegisterField('CCNAE', 'CCNAE', 'CNAE');
  Result.RegisterField('CLC116', 'CLC116', 'Codigo LC 116');
  Result.RegisterField('CTribNac', 'CTRIBNAC', 'Codigo Tributação Nacional');
  Result.RegisterField('CTribMun', 'CTRIBMUN', 'Codigo Tributação Municipal');
  Result.RegisterField('XDescServ', 'XDESCSERV', 'Discriminação Serviço');
  Result.RegisterField('CNBS', 'CNBS', 'NBS');

  // Valores do Serviço
  Result.RegisterField('VServ', 'VSERV', 'Valor do Serviço');
  Result.RegisterField('VDescIncond', 'VDESCINCOND', 'Valor Desconto');

  // ISSQN
  Result.RegisterField('TribIssQn', 'TRIBISSQN', 'Tributação ISSQN');
  Result.RegisterField('TpRetIssQn', 'TPRETISSQN', 'Tipo Retenção ISSQN');
  Result.RegisterField('IssPAliq', 'ISS_PALIQ', 'Alíquota ISS (%)');
  Result.RegisterField('IssVBC', 'ISS_VBC', 'Base de Cálculo ISS');
  Result.RegisterField('VIss', 'VISS', 'Valor ISS');

  // PIS/COFINS
  Result.RegisterField('PCCst', 'PC_CST', 'CST PIS/COFINS');
  Result.RegisterField('PCVBcPisCofins', 'PC_VBCPISCOFINS', 'Base PIS/COFINS');
  Result.RegisterField('PCPAliqPis', 'PC_PALIQPIS', 'Alíquota PIS (%)');
  Result.RegisterField('PCPAliqCofins', 'PC_PALIQCOFINS', 'Alíquota COFINS (%)');
  Result.RegisterField('PCVPis', 'PC_VPIS', 'Valor PIS');
  Result.RegisterField('PCVCofins', 'PC_VCOFINS', 'Valor COFINS');
  Result.RegisterField('TpRetPisCofins', 'TPRETPISCOFINS', 'Tipo Retenção PIS/COFINS');

  // Retenções
  Result.RegisterField('VRetIrrf', 'VRETIRRF', 'Valor Retido IRRF');
  Result.RegisterField('VRetCsll', 'VRETCSLL', 'Valor Retido CSLL');
  Result.RegisterField('VRetCP', 'VRETCP', 'Valor Retido CP');
  Result.RegisterField('VRetPis', 'VRETPIS', 'Valor Retido PIS');
  Result.RegisterField('VRetCofins', 'VRETCOFINS', 'Valor Retido COFINS');

  // Tributos Aproximados (Lei da Transparência)
  Result.RegisterField('PTotTribFed', 'PTOTTRIBFED', 'Trib aprox % Federal');
  Result.RegisterField('PTotTribEst', 'PTOTTRIBEST', 'Trib aprox % Estadual');
  Result.RegisterField('PTotTribMun', 'PTOTTRIBMUN', 'Trib aprox % Municipal');
  Result.RegisterField('IndTotTrib', 'INDTOTTRIB', 'Trib aprox Ind Total SN');
  Result.RegisterField('PTotTribSN', 'PTOTTRIBSN', 'Trib aprox % Total SN');

  // Dados Gerados e Retorno/Processamento da Prefeitura
  Result.RegisterField('NLote', 'NLOTE', 'NFSe - Num Lote');
  Result.RegisterField('NProtocolo', 'NPROTOCOLO', 'NFSe - Num Protocolo');
  Result.RegisterField('ChaveNFSe', 'CHAVE_NFSE', 'NFSe - Chave');
  Result.RegisterField('DhProc', 'DHPROC', 'NFSe - Data processamento');
  Result.RegisterField('CCtat', 'CSTAT', 'NFSe - Codigo Status');
  Result.RegisterField('NNFSe', 'NNFSE', 'NFSe - Numero');
  Result.RegisterField('NDFSe', 'NDFSE', 'NFSe - NDFSE');
  Result.RegisterField('VLiq', 'VLIQ', 'NFSe - Valor Liq');
  Result.RegisterField('VTotNf', 'VTOTNF', 'NFSe - Valor Liq(IBSBCBS)');
  Result.RegisterField('PRedutor', 'PREDUTOR', 'NFSe - % Redutor(IBSBCBS)');
  Result.RegisterField('VTotalRet', 'VTOTALRET', 'NFSe - Total retenções');
  Result.RegisterField('CVerificacao', 'CVERIFICACAO', 'NFSe - Codigo Verificação');
  Result.RegisterField('CancOrigem', 'CANC_ORIGEM', 'NFSe - Origem Cancelamento');
  Result.RegisterField('DhCanc', 'DHCANC', 'NFSe - Data Cancelamento');

  // Atributos aninhados
  Result.RegisterDependenceAttributes('Substituida', 'Substiuição', NFSeSubstMetadata.GetMetadata());

  // =========================================================================
  // ATRIBUTOS APENAS DA CLASSE (NÃO TEM COLUNA DIRETA NA TABELA NFSE)
  // =========================================================================
  {
  Result.RegisterAttributeOnly('RefNFSe', 'Referências da NFSe');
  Result.RegisterAttributeOnly('Tomador', 'Objeto Tomador');
  Result.RegisterAttributeOnly('Prestador', 'Objeto Prestador');
  Result.RegisterAttributeOnly('Intermediario', 'Objeto Intermediário');
  Result.RegisterAttributeOnly('DestIbsCbs', 'Objeto Destinatário IBS/CBS');
  Result.RegisterAttributeOnly('Servico', 'Objeto Serviço');
  Result.RegisterAttributeOnly('Substituida', 'Objeto NFSe Substituída');
  Result.RegisterAttributeOnly('ParticipantePrincipal', 'Participante Principal');
  }

  // =========================================================================
  // COLUNAS APENAS DA TABELA / VIEWS (NÃO TEM PROPRIEDADE RAIZ NA CLASSE NFSE)
  // Utilizados pelas Grids derivadas de Views ou Joins com os participantes.
  // =========================================================================
  Result.RegisterColumnOnly('data_cadastro', 'Data cadastro');
  Result.RegisterColumnOnly('data_alteracao', 'Data alteração');
  {
  // Dados do Tomador/Prestador (Join com Participantes)
  Result.RegisterColumnOnly('t_cpfcnpj', 'Tomador/Prestador - CPF/CNPJ');
  Result.RegisterColumnOnly('t_xnome', 'Tomador/Prestador - Nome/Razão Social');
  Result.RegisterColumnOnly('t_im', 'Tomador/Prestador - Inscrição Municipal');
  Result.RegisterColumnOnly('t_nif', 'Tomador/Prestador - NIF (Estrangeiro)');
  Result.RegisterColumnOnly('t_cnaonif', 'Tomador/Prestador - País (sem NIF)');
  Result.RegisterColumnOnly('t_cmun', 'Tomador/Prestador - Codigo Município');
  Result.RegisterColumnOnly('ct_nome_municipio', 'Tomador/Prestador - Município');
  Result.RegisterColumnOnly('t_cep', 'Tomador/Prestador - CEP');
  Result.RegisterColumnOnly('t_xlgr', 'Tomador/Prestador - Logradouro');
  Result.RegisterColumnOnly('t_nro', 'Tomador/Prestador - Número');
  Result.RegisterColumnOnly('t_xcpl', 'Tomador/Prestador - Complemento');
  Result.RegisterColumnOnly('t_xbairro', 'Tomador/Prestador - Bairro');
  Result.RegisterColumnOnly('t_fone', 'Tomador/Prestador - Telefone');
  Result.RegisterColumnOnly('t_email', 'Tomador/Prestador - E-mail');
  Result.RegisterColumnOnly('cl_email', 'Cliente - E-mail');

  // Destinatário (IBS/CBS) (Join com Participantes)
  Result.RegisterColumnOnly('ds_cpfcnpj', 'Destinatário - CPF/CNPJ');
  Result.RegisterColumnOnly('ds_xnome', 'Destinatário - Nome/Razão Social');
  Result.RegisterColumnOnly('ds_im', 'Destinatário - Inscrição Municipal');
  Result.RegisterColumnOnly('ds_nif', 'Destinatário - NIF');
  Result.RegisterColumnOnly('ds_cnaonif', 'Destinatário - País (sem NIF)');
  Result.RegisterColumnOnly('ds_cmun', 'Destinatário - Codigo Município');
  Result.RegisterColumnOnly('cds_nome_municipio', 'Destinatário - Município');
  Result.RegisterColumnOnly('ds_cep', 'Destinatário - CEP');
  Result.RegisterColumnOnly('ds_xlgr', 'Destinatário - Logradouro');
  Result.RegisterColumnOnly('ds_nro', 'Destinatário - Número');
  Result.RegisterColumnOnly('ds_xcpl', 'Destinatário - Complemento');
  Result.RegisterColumnOnly('ds_xbairro', 'Destinatário - Bairro');
  Result.RegisterColumnOnly('ds_fone', 'Destinatário - Telefone');
  Result.RegisterColumnOnly('ds_email', 'Destinatário - E-mail');

  // Intermediário (Join com Participantes)
  Result.RegisterColumnOnly('i_cpfcnpj', 'Intermediário - CPF/CNPJ');
  Result.RegisterColumnOnly('i_xnome', 'Intermediário - Nome/Razão Social');
  Result.RegisterColumnOnly('i_im', 'Intermediário - Inscrição Municipal');
  Result.RegisterColumnOnly('i_nif', 'Intermediário - NIF');
  Result.RegisterColumnOnly('i_cnaonif', 'Intermediário - País (sem NIF)');
  Result.RegisterColumnOnly('i_cmun', 'Intermediário - Codigo Município');
  Result.RegisterColumnOnly('ci_nome_municipio', 'Intermediário - Município');
  Result.RegisterColumnOnly('i_cep', 'Intermediário - CEP');
  Result.RegisterColumnOnly('i_xlgr', 'Intermediário - Logradouro');
  Result.RegisterColumnOnly('i_nro', 'Intermediário - Número');
  Result.RegisterColumnOnly('i_xcpl', 'Intermediário - Complemento');
  Result.RegisterColumnOnly('i_xbairro', 'Intermediário - Bairro');
  Result.RegisterColumnOnly('i_fone', 'Intermediário - Telefone');
  Result.RegisterColumnOnly('i_email', 'Intermediário - E-mail');

  // Substituição (Join com tabela de Substituição)
  Result.RegisterColumnOnly('s_chave', 'Substituição - Chave');
  Result.RegisterColumnOnly('s_cmotivo', 'Substituição - Codigo Motivo');
  Result.RegisterColumnOnly('s_xmotivo', 'Substituição - Motivo');
  Result.RegisterColumnOnly('s_ndps', 'Substituição - Numero RPS');
  Result.RegisterColumnOnly('s_serie', 'Substituição - Serie RPS');
  Result.RegisterColumnOnly('s_nnfse', 'Substituição - Num NFSe RPS');
  Result.RegisterColumnOnly('s_nlote', 'Substituição - Num Lote');
  Result.RegisterColumnOnly('s_cverificacao', 'Substituição - Codigo Verificação');

  // Colunas de ID que as Views exibem
  Result.RegisterColumnOnly('tomador_id', 'ID Tomador');

  }
end;

end.
