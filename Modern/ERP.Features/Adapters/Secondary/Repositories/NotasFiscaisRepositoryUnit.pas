unit NotasFiscaisRepositoryUnit;

interface

uses
  INotasFiscaisRepositoryUnit,
  TipoComunsUnit, QueryResultUnit,
  ContextoDocTribPcModelUnit, UpdateDFeRedBenefPcCalcCommandsUnit, PeriodoEmpresaVOUnit, NotaFiscalResumoModelUnit,
  NotaFiscalPendenciaSefEtdUnit, UpdateNotaFiscalConverterParaContingenciaCommandUnit, ConverterParaContingenciaResultUnit,
  UpdatePendenciaSefazAvancoCommandUnit, NotaFiscalItemContextoRtcModelUnit, StringNullableUnit,
  UpdateNotaFiscalItemContextoRtcCommandUnit, NotaFiscalPendenciaSefModelUnit;

type
  NotasFiscaisRepository = class(INotasFiscaisRepository)
  private
    function CreateDocFromQuery(Q: QueryResult): ContextoDocTribPcModel;
    function CreateNotaFiscalResumoFromQuery(Q: QueryResult): NotaFiscalResumoModel;
    function CreateNotaFiscalItemContextoRtcModelFromQuery(Q: QueryResult): NotaFiscalItemContextoRtcModel;
    function CreateNotaFiscalPendenciaSefazFromQuery(Q: QueryResult): NotaFiscalPendenciaSefEtd;
    function CreatePendenciaSefazFromQuery(Q: QueryResult): NotaFiscalPendenciaSefModel;
  public
    // Nota
    function ObterNotaFiscalResumo(CodigoNF, EmpresaId: Integer): NotaFiscalResumoModel; override;
    procedure AtualizarRedBenefPcCalculado(const Input: UpdateDFeRedBenefPcCalcCommands); override;
    function ConverterParaContingencia(const Input: UpdateNotaFiscalConverterParaContingenciaCommand): ConverterParaContingenciaResult; override;
    procedure CompletarNFePendenteAutorizada(const NfContigenciaId, NfPendenteId, EmpresaId: Integer); override;

    // Itens -
    function ObterContextoTribPISCOFINS(const ChaveNFe: string; EmpresaId: Integer): ContextoDocTribPcModel; overload; override;
    function ObterContextoTribPISCOFINS(const Input: PeriodoEmpresaVO): ContextoDocTribPcModelList; overload; override;
    function ObterItensContextoRtc(CodigoNF, EmpresaId: Integer): NotaFiscalItemContextoRtcModelList; override;
    procedure AtualizarItemContextoRtc(const Input: UpdateNotaFiscalItemContextoRtcCommand); override;
    // Pendencias Sefaz
    function ObterNotaFiscalPendenciaSef(CodigoNF, EmpresaId: Integer): NotaFiscalPendenciaSefEtd; override;
    function ObterPendenciaSefaz(CodigoNF, EmpresaId: Integer): NotaFiscalPendenciaSefModel; override;
    function ObterQtdePendenciasSefazNaoResolvidas(EmpresaId: Integer): Integer; override;
    procedure InserirPendenciaSEFAZ(const Input: NotaFiscalPendenciaSefEtd); override;
    function AtualizarAvancoPendenciaSEFAZ(const Input: UpdatePendenciaSefazAvancoCommand): NotaFiscalPendenciaSefEtd; override;
  end;

implementation

uses
  SysUtils, Types,
  StringServiceUnit, ArrayServiceUnit, ParameterValueUnit, ModelosDFeEnumUnit, StatusResolucaoNFeSefEnumUnit,
  TipoEmissaoNFeEnumUnit, SituacaoNFeEnumUnit, TipoAmbienteNFeEnumUnit, ScalarResultUnit;

const
  GEN_CODIGO_TAB: array[TipoAmbienteNFeEnum] of string = ('', 'NF_VENDA', 'NF_VENDA_HOM');

{ NotasFiscaisRepository }

function NotasFiscaisRepository.AtualizarAvancoPendenciaSEFAZ(
  const Input: UpdatePendenciaSefazAvancoCommand): NotaFiscalPendenciaSefEtd;
begin
  FConnection.ExecuteCommand(
    'UPDATE NOTAFISCAL_PEND_SEFAZ SET ' +
    '  STATUS_RESOLUCAO = :STATUS_RESOLUCAO ' +
    'WHERE ' +
    '  COD_NF = :COD_NF AND COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(3)
      .ByName('COD_NF', Input.NotaFiscalId)
      .ByName('COD_EMPRESA', Input.EmpresaId)
      .ByName('STATUS_RESOLUCAO', Ord(Input.StatusResolucao))
      .Build()
  );

  Result := ObterNotaFiscalPendenciaSef(Input.NotaFiscalId, Input.EmpresaId);
end;

procedure NotasFiscaisRepository.AtualizarItemContextoRtc(const Input: UpdateNotaFiscalItemContextoRtcCommand);
begin
  FConnection.ExecuteCommand(
    'UPDATE NOTAFISCAL_ITEM SET ' + 
    'DFE_TRIB_ID = :DFE_TRIB_ID ' + 
    'WHERE COD_NF = :COD_NF AND COD_EMPRESA = :COD_EMPRESA AND NITEM = :NITEM',
    ParametersBuilder.Create(4)
      .ByName('DFE_TRIB_ID', Input.DFeTribId)
      .ByName('COD_NF', Input.CodigoNF)
      .ByName('COD_EMPRESA', Input.EmpresaId)
      .ByName('NITEM', Input.NumItem)
      .Build()
  );
end;

procedure NotasFiscaisRepository.AtualizarRedBenefPcCalculado(const Input: UpdateDFeRedBenefPcCalcCommands);
begin
  FConnection.ExecuteCommand(
    'UPDATE NOTAFISCAL SET ' +
    'REDBENEFPC_CALC = :REDBENEFPC_CALC ' +
    'WHERE COD_NF = :COD_NF AND COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(3)
      .ByName('COD_NF', Input.DFeId )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .ByName('REDBENEFPC_CALC', Ord(Input.RedBenefCalculado))
      .Build()
  );
end;

function NotasFiscaisRepository.ObterContextoTribPISCOFINS(const ChaveNFe: string;
  EmpresaId: Integer): ContextoDocTribPcModel;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' +
    '  n.cod_nf, n.cod_empresa, n.chave_nfe, n.data_lanc, n.modelo_nf, n.redbenefpc_calc, ' +
    '  ni.cst_pis, ni.nat_rec, ni.ncm, ' +
    '  sum( ' +
    '    ni.valor_total - ni.rateio_desconto + ni.rateio_seguro + ni.rateio_outdesp ' +
    '    + iif(n.frete_f_nfe = ''S'', 0, ni.rateio_frete) ' +
    '  ) valor_liquido, ' +
    '  sum(ni.valor_ipi) valor_ipi, ' +
    '  sum(ni.valor_icm) valor_icms ' +
    'from notafiscal n ' +
    'inner join notafiscal_item ni on ni.cod_nf = n.cod_nf and ni.cod_empresa = n.cod_empresa ' +
    'where n.chave_nfe = :chave_nfe and n.cod_empresa = :cod_empresa ' +
    'group by cod_nf, cod_empresa, chave_nfe, data_lanc, modelo_nf, redbenefpc_calc, cst_pis, nat_rec, ncm ',
    ParametersBuilder.Create(2)
      .ByName('CHAVE_NFE', ChaveNFe)
      .ByName('COD_EMPRESA', EmpresaId)
      .Build()
  );
  try
    if Q.IsEmpty then
    begin
      Result := nil;
      Exit;
    end;

    Result := CreateDocFromQuery(Q);

    while not Q.Eof do
    begin
      Result.SomaPorCstNcmNatRec(
        Q.FieldAsString('cst_pis'),
        Q.FieldAsString('ncm'),
        Q.FieldAsString('nat_rec'),
        Q.FieldAsCurrency('valor_liquido'),
        Q.FieldAsCurrency('valor_ipi'),
        Q.FieldAsCurrency('valor_icms')
      );
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

procedure NotasFiscaisRepository.CompletarNFePendenteAutorizada(const NfContigenciaId, NfPendenteId,
  EmpresaId: Integer);
const
  TABELAS_NF: array[0..21] of string = (
    'NOTAFISCAL_CARTA_CORRECAO',
    'NOTAFISCAL_COLETA_ENTREGA',
    'NOTAFISCAL_COMPRAGOV',
    'NOTAFISCAL_DUP',
    'NOTAFISCAL_GUIATRANSITO',
    'NOTAFISCAL_ITEM',
    'NOTAFISCAL_ITEM_DI',
    'NOTAFISCAL_ITEM_ADI',
    'NOTAFISCAL_ITEM_DETEXPORT',
    'NOTAFISCAL_ITEM_EXPORTIND',
    'NOTAFISCAL_ITEM_VEICULO',
    'NOTAFISCAL_ITEM_VFE',
    'NOTAFISCAL_OBSCONT',
    'NOTAFISCAL_PAG',
    'NOTAFISCAL_PAG_ANTEC',
    'NOTAFISCAL_PROTOCOLO',
    'NOTAFISCAL_SPED_C110',
    'NOTAFISCAL_SPED_C111',
    'NOTAFISCAL_SPED_C112',
    'NOTAFISCAL_SPED_C113',
    'NOTAFISCAL_SPED_C120',
    'NOTAFISCAL_SPED_C195_C197'
  );
var
  Tab: string;
begin
  // Tabelas NF que tem o COD_NF como chave
  for Tab in TABELAS_NF do
    FConnection.ExecuteCommand(
      'execute block ' +
      'as ' +
      'begin ' +
      '  execute statement ''INSERT INTO %s ('' ' +
      '    || ''COD_NF,'' ' +
      '    || (select LIST(NAME) from spdb_fields_all(''%s'') t where t.name not in (''COD_NF'',''GUIDT'', ''DFE_TRIB_ID'')) ' +
      '    || '') SELECT %d, '' ' +
      '    || (select LIST(NAME) from spdb_fields_all(''%s'') t where t.name not in (''COD_NF'',''GUIDT'', ''DFE_TRIB_ID'')) ' +
      '    || '' FROM %s WHERE COD_NF = %d AND COD_EMPRESA = %d'' ' +
      '    || '' AND NOT EXISTS(SELECT 1 FROM %s WHERE COD_NF = %d AND COD_EMPRESA = %d)''; ' +
      'end ',
      [ Tab, Tab, NfPendenteId, Tab, Tab, NfContigenciaId, EmpresaId, Tab, NfPendenteId, EmpresaId ]
    );

  // Tabela com ID como chave
  FConnection.ExecuteCommand(
    'execute block ' +
    'as ' +
    'begin ' +
    '  execute statement ''INSERT INTO NOTAFISCAL_DEFENSIVO ('' ' +
    '    || ''COD_NF, ID,'' ' +
    '    || (select LIST(NAME) from spdb_fields_all(''NOTAFISCAL_DEFENSIVO'') t where t.name not in (''COD_NF'',''ID'')) ' +
    '    || '') SELECT %d, ''''' +
    '    || (SELECT GUID FROM spdb_guid) ' +
    '    || '''', '' ' +
    '    || (select LIST(NAME) from spdb_fields_all(''NOTAFISCAL_DEFENSIVO'') t where t.name not in (''COD_NF'',''ID'')) ' +
    '    || '' FROM NOTAFISCAL_DEFENSIVO WHERE COD_NF = %d AND COD_EMPRESA = %d''; ' +
    'end ',
    [ NfPendenteId, NfContigenciaId, EmpresaId ]
  );
end;

function NotasFiscaisRepository.ConverterParaContingencia(
  const Input: UpdateNotaFiscalConverterParaContingenciaCommand
): ConverterParaContingenciaResult;
const
  CAMPOS_NF: array[0..6] of string = (
    'COD_NF', 'NUM_NF', 'GUIDT', 'SITUACAO_NFE', 'NFE_TPEMIS', 'NFE_DHCONT', 'NFE_XJUST'
  );
var
  Q: QueryResult;
  nfId, nfNum: Integer;
  nfTpEmis, Campos, Tab: string;
begin

  // Obtendo dados da nota original antes do update, obtendo tambem o nov CODIGO
  Q := FConnection.CreateQuery(
    'select ' +
    '  NUM_NF, NFE_TPEMIS, ' +
    '  ( SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, ''NOTAFISCAL'')) COD_NF ' +
    'from NOTAFISCAL ' +
    'WHERE COD_NF = :COD_NF AND COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(2)
      .ByName('COD_NF', Input.CodNf)
      .ByName('COD_EMPRESA', Input.EmpresaId)
      .Build()
  );
  try
    nfId := Q.FieldAsInteger('COD_NF');
    nfNum := Q.FieldAsInteger('NUM_NF');
    nfTpEmis := Q.FieldAsString('NFE_TPEMIS');
  finally
    Q.Free();
  end;

  // Executando o update na nota original ajustando o novo numero de nota
  FConnection.ExecuteCommand(
    'UPDATE NOTAFISCAL SET ' +
    '  NUM_NF = (SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, :TABELA )), ' +
    '  LOTE_NFE = (SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, ''LOTENFE'' )), ' +
    '  NFE_CSTAT = NULL, ' +
    //'  SERIE = SERIE, ' +
    '  SITUACAO_NFE = :SITUACAO_NFE , ' +
    '  NFE_TPEMIS = :NFE_TPEMIS, ' +
    '  NFE_DHCONT = :NFE_DHCONT, ' +
    '  NFE_XJUST = :NFE_XJUST ' +
    'WHERE COD_NF = :COD_NF AND COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(7)
      .ByName('COD_NF', Input.CodNf)
      .ByName('COD_EMPRESA', Input.EmpresaId)
      .ByName('TABELA', GEN_CODIGO_TAB[Input.Ambiente])
      .ByName('SITUACAO_NFE', SituacaoNFeEnumStr[stEmContingencia])
      .ByName('NFE_TPEMIS', IntToStr(Ord(tenContingencia)))
      .ByName('NFE_DHCONT', Input.DhCont)
      .ByName('NFE_XJUST', Input.XJustCont, 256)
      .Build()
  );

  // Ajustando lista de campos que nao serao preenchidos na copia
  Campos := StringService.Join(',', ArrayService.QuoteArrayString(CAMPOS_NF));

  // Executando insert com base na nota original
  FConnection.ExecuteCommand(
    'execute block ' +
    'as ' +
    'begin ' +
    '  execute statement ''INSERT INTO NOTAFISCAL ('' ' +
    '    || ''COD_NF,NUM_NF,SITUACAO_NFE,NFE_TPEMIS,'' ' +
    '    || (select LIST(NAME) from spdb_fields_all(''NOTAFISCAL'') t where t.name not in (%s)) ' +
    '    || '') SELECT %d, %d, ''''%s'''', ''''%s'''', '' ' +
    '    || (select LIST(NAME) from spdb_fields_all(''NOTAFISCAL'') t where t.name not in (%s)) ' +
    '    || '' FROM NOTAFISCAL WHERE COD_NF = %d AND COD_EMPRESA = %d''; ' +
    'end ',
    [ Campos, nfId, nfNum, sitAInutilizar, nfTpEmis, Campos, Input.CodNf, Input.EmpresaId ]
  );

  Result := ConverterParaContingenciaResult.Create(nfId);
end;

function NotasFiscaisRepository.CreateDocFromQuery(Q: QueryResult): ContextoDocTribPcModel;
begin
  Result := ContextoDocTribPcModel.Create(
    Q.FieldAsString('chave_nfe'),
    Q.FieldAsDate('data_lanc'),
    Q.FieldAsInteger('cod_empresa'),
    mdNFe,
    Q.FieldAsInteger('cod_nf'),
    Q.FieldAreEquals('redbenefpc_calc', Ord(ynYes))
  );
end;

function NotasFiscaisRepository.CreateNotaFiscalResumoFromQuery(Q: QueryResult): NotaFiscalResumoModel;
begin
  Result := NotaFiscalResumoModel.Create(
    Q.FieldAsInteger('cod_nf'),
    Q.FieldAsInteger('cod_empresa'),
    Q.FieldAsString('natureza_nf'),
    Q.FieldAsString('tipo_nf'),
    Q.FieldAsStringNullable('status'),
    Q.FieldAsStringNullable('situacao_nfe'),
    Q.FieldAsString('serie'),
    Q.FieldAsInteger('num_nf'),
    Q.FieldAsInteger('cod_cliente'),
    Q.FieldAsDateTimeNullable('data_contabil'),
    Q.FieldAsStringNullable('hora_emissao'),
    Q.FieldAsDateTimeNullable('data_lanc'),
    Q.FieldAsStringNullable('nfe_tpemis'),
    Q.FieldAsStringNullable('chave_nfe'),
    Q.FieldAsStringNullable('xml_nfe'),
    Q.FieldAsStringNullable('descricaoerro'),
    Q.FieldAsIntNullable('tpimp'),
    Q.FieldAsStringNullable('nfe_tpamb')
  );
end;

function NotasFiscaisRepository.CreatePendenciaSefazFromQuery(Q: QueryResult): NotaFiscalPendenciaSefModel;
begin
  Result := NotaFiscalPendenciaSefModel.Create(
    Q.FieldAsInteger('cod_nf'),
    Q.FieldAsInteger('cod_empresa'),
    Q.FieldAsDateTime('dhemi'),
    StatusResolucaoNFeSefEnum(Q.FieldAsInteger('status_resolucao')),
    Q.FieldAsInteger('cod_nf_pend'),
    Q.FieldAsInteger('num_nf_cont'),
    Q.FieldAsString('situacao_cont'),
    Q.FieldAsInteger('num_nf_pend'),
    Q.FieldAsString('situacao_pend')
  );
end;

function NotasFiscaisRepository.CreateNotaFiscalItemContextoRtcModelFromQuery(Q: QueryResult): NotaFiscalItemContextoRtcModel;
begin
  Result := NotaFiscalItemContextoRtcModel.Create(
    Q.FieldAsInteger('cod_nf'),
    Q.FieldAsInteger('cod_empresa'),
    Q.FieldAsInteger('nitem'),
    StringNullable.Create(Q.FieldAsString('dfe_trib_id'))
  );
end;

function NotasFiscaisRepository.CreateNotaFiscalPendenciaSefazFromQuery(Q: QueryResult): NotaFiscalPendenciaSefEtd;
begin
  Result := NotaFiscalPendenciaSefEtd.Create(
    Q.FieldAsInteger('cod_nf'),
    Q.FieldAsInteger('cod_empresa'),
    Q.FieldAsDateTime('dhemi'),
    StatusResolucaoNFeSefEnum(Q.FieldAsInteger('status_resolucao')),
    Q.FieldAsInteger('COD_NF_PEND')
  );
end;

procedure NotasFiscaisRepository.InserirPendenciaSEFAZ(const Input: NotaFiscalPendenciaSefEtd);
begin
  FConnection.ExecuteCommand(
    'INSERT INTO NOTAFISCAL_PEND_SEFAZ ( ' +
    '  COD_NF, COD_EMPRESA, DHEMI, STATUS_RESOLUCAO, COD_NF_PEND ) ' +
    'VALUES ' +
    '  ( :COD_NF, :COD_EMPRESA, :DHEMI, :STATUS_RESOLUCAO, :COD_NF_PEND )',
    ParametersBuilder.Create(5)
      .ByName('COD_NF', Input.CodNf)
      .ByName('COD_EMPRESA', Input.CodEmpresa)
      .ByName('DHEMI', Input.Dhemi)
      .ByName('STATUS_RESOLUCAO', Ord(Input.StatusResolucao))
      .ByName('COD_NF_PEND', Input.CodNfPend)
      .Build()
  );
end;

function NotasFiscaisRepository.ObterContextoTribPISCOFINS(
  const Input: PeriodoEmpresaVO
): ContextoDocTribPcModelList;
var
  Q: QueryResult;
  R: ContextoDocTribPcModel;
  C: Integer;
begin
  Q := FConnection.CreateQuery(
    'select ' +
    '  n.cod_nf, n.cod_empresa, n.chave_nfe, n.data_lanc, n.modelo_nf, n.redbenefpc_calc, ' +
    '  ni.cst_pis, ni.nat_rec, ni.ncm, ' +
    '  sum( ' +
    '    ni.valor_total - ni.rateio_desconto + ni.rateio_seguro + ni.rateio_outdesp ' +
    '    + iif(n.frete_f_nfe = ''S'', 0, ni.rateio_frete) ' +
    '  ) valor_liquido, ' +
    '  sum(ni.valor_ipi) valor_ipi, ' +
    '  sum(ni.valor_icm) valor_icms ' +
    'from notafiscal n ' +
    'inner join notafiscal_item ni on ni.cod_nf = n.cod_nf and ni.cod_empresa = n.cod_empresa ' +
    'where n.situacao_nfe = ''Autorizada'' ' +
    'and n.cod_empresa = :cod_empresa ' +
    'and n.data_lanc between :dataini and :datafim ' +
    'group by cod_nf, cod_empresa, chave_nfe, data_lanc, modelo_nf, redbenefpc_calc, cst_pis, nat_rec, ncm ',
    ParametersBuilder.Create(3)
      .ByName('DATAINI', Input.DataInicial)
      .ByName('DATAFIM', Input.DataFinal)
      .ByName('COD_EMPRESA', Input.EmpresaId)
      .Build()
  );
  try
    Result := ContextoDocTribPcModelList.Create();

    C := -1;
    R := nil;
    while not Q.Eof do
    begin
      if C <> Q.FieldAsInteger('cod_nf') then
      begin
        R := CreateDocFromQuery(Q);
        C := R.CodigoDoc;
        Result.Add(R);
      end;

      R.SomaPorCstNcmNatRec(
        Q.FieldAsString('cst_pis'),
        Q.FieldAsString('ncm'),
        Q.FieldAsString('nat_rec'),
        Q.FieldAsCurrency('valor_liquido'),
        Q.FieldAsCurrency('valor_ipi'),
        Q.FieldAsCurrency('valor_icms')
      );

      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function NotasFiscaisRepository.ObterItensContextoRtc(CodigoNF, EmpresaId: Integer): NotaFiscalItemContextoRtcModelList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' +
    '   cod_nf, cod_empresa, nitem, dfe_trib_id ' +
    ' from notafiscal_item' +
    ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa',
    ParametersBuilder.Create(2)
      .Add(CodigoNF)
      .Add(EmpresaId)
      .Build()
  );
  try
    Result := NotaFiscalItemContextoRtcModelList.Create();

    while not Q.Eof do
    begin
      Result.Add(CreateNotaFiscalItemContextoRtcModelFromQuery(Q));
      Q.Next();
    end;
  finally
    Q.Free();
  end;

end;

function NotasFiscaisRepository.ObterNotaFiscalPendenciaSef(CodigoNF, EmpresaId: Integer): NotaFiscalPendenciaSefEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' +
    '   cod_nf, cod_empresa, dhemi, status_resolucao, cod_nf_pend ' +
    ' from notafiscal_pend_sefaz ' +
    ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa',
    ParametersBuilder.Create(2)
      .Add(CodigoNF)
      .Add(EmpresaId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil
    else
      Result := CreateNotaFiscalPendenciaSefazFromQuery(Q);
  finally
    Q.Free();
  end;
end;

function NotasFiscaisRepository.ObterNotaFiscalResumo(CodigoNF, EmpresaId: Integer): NotaFiscalResumoModel;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' +
    '  cod_nf, cod_empresa, natureza_nf, tipo_nf, status, situacao_nfe, serie, num_nf, cod_cliente, data_contabil, ' +
    '  data_lanc, hora_emissao, nfe_tpemis, chave_nfe, xml_nfe, descricaoerro, tpimp, nfe_tpamb ' +
    ' from notafiscal ' +
    ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa',
    ParametersBuilder.Create(2)
      .Add(CodigoNF)
      .Add(EmpresaId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateNotaFiscalResumoFromQuery( Q );

  finally
    Q.Free();
  end;
end;

function NotasFiscaisRepository.ObterPendenciaSefaz(CodigoNF, EmpresaId: Integer): NotaFiscalPendenciaSefModel;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' +
    '  sef.cod_nf, sef.cod_empresa, sef.dhemi, sef.status_resolucao, sef.cod_nf_pend, ' +
    '  nc.num_nf num_nf_cont, nc.situacao_nfe situacao_cont, ' + //nc.data_lanc data_lanc_cont, ' +
    '  np.num_nf num_nf_pend, np.situacao_nfe situacao_pend ' + //, np.data_lanc data_lanc_pend ' +
    'from notafiscal_pend_sefaz sef ' +
    'left join notafiscal nc on nc.cod_nf = sef.cod_nf and nc.cod_empresa = sef.cod_empresa ' +
    'left join notafiscal np on np.cod_nf = sef.cod_nf_pend and np.cod_empresa = sef.cod_empresa ' +
    'where sef.cod_nf = :cod_nf and sef.cod_empresa = :cod_empresa',
    ParametersBuilder.Create(2)
      .Add(CodigoNF)
      .Add(EmpresaId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil
    else
      Result := CreatePendenciaSefazFromQuery(Q);
  finally
    Q.Free();
  end;
end;

function NotasFiscaisRepository.ObterQtdePendenciasSefazNaoResolvidas(EmpresaId: Integer): Integer;
begin
  with FConnection.ExecuteScalar(
    'select count(cod_nf) from notafiscal_pend_sefaz ' +
    ' where cod_empresa = %d' +
    ' and status_resolucao not in (%d, %d) ',
    [EmpresaId, Ord(srsResolvida), Ord(srsResolvidaManual) ]
  ) do
  begin
    if IsNull then
      Result := 0
    else
      Result := AsInteger;
  end;
end;

end.
