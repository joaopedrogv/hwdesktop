unit NFSeRepositoryUnit;

interface      

uses
  SysUtils, Classes,
  INFSeRepositoryUnit, NFSeEtdUnit, NFSeParticipanteEtdUnit, NFSeSubstEtdUnit, NFSeTypesUnit, TipoComunsUnit,
  QueryResultUnit, NFSeAtualizarSituacaoTypesUnit, NFSeDocEtdUnit, NFSeHistoricoEtdUnit, NFSeEventoEtdUnit,
  NFSeDocModelUnit, NFSeEventoModelUnit, NFSeResumoModelUnit, NFSeEventoResumoModelUnit,
  NFSeAtualizarSituacaoEventoTypesUnit, NFSeHistoricoTypesUnit, ParameterValueUnit, NFSeOSEtdUnit;

type
  NFSeRepository = class(INFSeRepository)
  private
    {$REGION 'Nao Usados, excluir?'}
    function GerProximoNDPS(EmpresaId: Integer): Integer; //override;
    // NFSe Documentos
    function GetDocNFSe(const Id: string; EmpresaId: Integer; TipoDoc: TipoDocNFSeEnumSet): NFSeDocModel; //override;
    // NFSe Historicos
    procedure PostNFSeHistorico(Input: NFSeHistoricoEtd); overload; //override;
    {$ENDREGION}
    //function CreateItemFromQuery(Q: QueryResult; const E: TArrayInteger): GrupoFiscalEtd;
    function CreateItemFromQuery(Q: QueryResult; const RefNFSe: TArrayString): NFSeEtd;
    function CreateNFSeEventoModelFromQuery(Q: QueryResult): NFSeEventoModel;
    function GetSqlNFSe(): string;
    procedure ExecuteUpserttDPSParticipante(const Id: string; Input: NFSeParticipanteEtd);
//    procedure ExecuteUpsertNFSeIbsCbs(const Id: string; Input: NFSeIbsCbsEtd);
    procedure ExecuteUpsertNFSeSubstituida(const Id: string; Input: NFSeSubstEtd);
    procedure ExecuteDeleteNFSeParticipante(const Id: string; Tipo: TipoPartDpesEnum);
    procedure ExecuteSqlNFSe(const NFSeId, SQL: string; Input: NFSeEtd);
    procedure AplicarParametrosNFSeParaEmissao(const NFSeId: string; Input: NFSeEtd; Parameters: IParametersBuilder);
    procedure AplicarParametrosNFSeEmitidaNoPortal(Input: NFSeEtd; Parameters: IParametersBuilder);
    procedure AtualizarDocNFSe(const Input: NFSeDocEtd); //override;
    function AtualizarNFSe(const Input: NFSeAtualizarSituacaoModel; Situacao: SituacaoNFSeEnum): NFSeResumoModel; overload;
    function CriarSqlInsertNFSe(ComEmissaoPortal: Boolean): string;
    function CriarSqlUpdateNFSe(ComEmissaoPortal: Boolean): string;
    function CriarNFSe(Input: NFSeEtd; const Sql, RecordId: string; Parameters: IParametersBuilder): NFSeEtd;
    function AlterarNFSe(Input: NFSeEtd; const Sql: string; Parameters: IParametersBuilder): NFSeEtd;
  public
    // NFSe
    function CriarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd; override;
    function CriarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd; override;
    function AlterarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd; override;
    function AlterarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd; override;
    function GetNFSe(const Id: string; EmpresaId: Integer): NFSeEtd; override;
    function GetResumoNFSe(const Id: string): NFSeResumoModel; overload; override;
    function GetResumoNFSe(const Id: string; TipoDoc: TipoDocNFSeEnumSet): NFSeResumoModel; overload; override;
    function ListarSituacaoNFSes(const Ids: TArrayString; EmpresaId: Integer): NFSeSitacaoModelArray; override;
    function AtualizarNFSe(const Input: NFSeAtualizarExcluirRascunhoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarEmEmissaoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarRejeicaoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarEmProcessamentoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarAutorizacaoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarAutorizadaNoPortalModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarCancelamentoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarCancPorSubstuicaoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterCancelamentoPortalModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterAutorizacaoPortalModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterSubstituicaoPortalModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarNumeroRPSModel): NFSeEtd; overload; override;
    // NFSe Eventos
    function PostNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd; override;
    function PutNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd; override;
    function GetNFSeEvento(const EventoId: string): NFSeEventoEtd; override;
    function GetEventoNFSe(const NFSeId: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoModel; overload; override;
    function GetEventoNFSe(const EventoId: string): NFSeEventoModel; overload; override;
    function GetResumoEventoNFSe(const NFSeId, EventoId: string): NFSeEventoResumoModel; overload; override;
    function GetResumoEventoNFSe(const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarSituacaoEventoModel; Situacao: SituacaoNFSeEnum): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmEmissaoModel): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoRejeicaoModel): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmProcessamentoModel): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoFalhaModel): NFSeEventoResumoModel; overload; override;
    // NFSe Historicos
    function GetLastHistorico(const NFSeId: string; TipoHistorico: TipoHistoricoNFSeEnum): NFSeHistoricoEtd; override;
    procedure PostNFSeHistorico(const Input: NFSeHistoricoModel); overload; override;
    procedure PutNFSeHistorico(const Input: NFSeUltimoHistoricoModel); override;
    // NFSe Relacionamento OrdemServico
    procedure CriarRelacionamento(const Input: NFSeOSEtd); override;
    procedure RemoverRelacionamento(const Input: NFSeOSEtd); override;
    function ListarRelacionamento(const NFSeId: string): NFSeOSEtdList; overload; override;
    function ListarRelacionamento(const NumeroOS: Integer): NFSeOSEtdList; overload; override;
    procedure AtualizarRetencoesNFSeOS(const Input: NFSeOSEtdList); override;
  end;

implementation

uses
  StrUtils, //Math,
  TipoServicoEtdUnit,
  DFeTypesUnit, TipoRegraTributoDFeEnumUnit, TipoServicoFactoryUnit, BaseRepositoryUnit, IntegerNullableUnit,
  NumberServiceUnit, StringNullableUnit, DateAndTimeNullableUnit, StringServiceUnit, EnumServiceUnit;

const
  SituacaoNFSeEnumStr: array[SituacaoNFSeEnum] of string = (
    'Excluído', 'Rascunho', 'Rejeição', 'Emissão', 'EmProcessamento', 'Autorizada', 'Cancelada', 'Substituída'
  );
  TipoEventoNFSeEnumStr: array[TipoEventoNFSeEnum] of string = ('Cancelamento');

function CreateParticipante(Q: QueryResult; const Alias: string): NFSeParticipanteEtd;
  function G(const FieldName: string): string;
  begin
    Result := Alias + FieldName;
  end;
var
  sEmail: string;
begin
  if Q.FieldIsNull(G('id')) then
    Result := nil
  else
  begin
    Result := NFSeParticipanteEtd.Create(
      Q.FieldAsString(G('id')),
      TipoPartDpesEnum(Q.FieldAsInteger(G('tipo_part'))),
      Q.FieldAsStringNullable(G('cpfcnpj')),
      Q.FieldAsStringNullable(G('nif')),
      Q.FieldAsIntNullable(G('cnaonif')),
      Q.FieldAsStringNullable(G('im')),
      Q.FieldAsString(G('xnome')),
      Q.FieldAsStringNullable(G('fone')),
      Q.FieldAsStringNullable(G('email')),
      Q.FieldAsIntNullable(G('cmun')),
      Q.FieldAsStringNullable(G('cep')),
      Q.FieldAsStringNullable(G('xlgr')),
      Q.FieldAsStringNullable(G('nro')),
      Q.FieldAsStringNullable(G('xcpl')),
      Q.FieldAsStringNullable(G('xbairro'))
    );

    sEmail := StringReplace( Q.FieldAsString('cl_email'), ';', ',', [ rfReplaceAll ]);
    sEmail := StringReplace( sEmail, ' ', ',', [rfReplaceAll]);

    Result.ListaEmails := StringService.Split([','], sEmail);
  end;
end;

function CreateSubstituida(Q: QueryResult): NFSeSubstEtd;
begin
  if Q.FieldIsNull('s_id') then
    Result := nil
  else
    Result := NFSeSubstEtd.Create(
      Q.FieldAsString('s_id'),
      Q.FieldAsStringNullable('s_subst_id'),
      Q.FieldAsStringNullable('s_chave'),
      Q.FieldAsStringNullable('s_cmotivo'),
      Q.FieldAsStringNullable('s_xmotivo'),
      Q.FieldAsStringNullable('s_serie'),
      Q.FieldAsIntNullable('s_ndps'),
      Q.FieldAsInt64Nullable('s_nnfse'),
      Q.FieldAsStringNullable('s_nlote'),
      Q.FieldAsStringNullable('s_cverificacao')
    );
end;

{ NFSeRepository }

procedure NFSeRepository.ExecuteDeleteNFSeParticipante(const Id: string; Tipo: TipoPartDpesEnum);
begin
  FConnection.ExecuteCommand(
    'DELETE FROM NFSE_PART ' +
    'WHERE ID = :ID AND TIPO_PART = :TIPO_PART',
    ParametersBuilder.Create(2)
      .Add( Id )
      .Add( Ord( Tipo ))
      .Build()
  );
end;

procedure NFSeRepository.AplicarParametrosNFSeEmitidaNoPortal(Input: NFSeEtd; Parameters: IParametersBuilder);
begin
  Parameters
    .ByName( 'NNFSE', Input.NNFSe )
    .ByName( 'CHAVE_NFSE', Input.ChaveNFSe )
    .ByName( 'DHPROC', Input.DhProc );
end;

procedure NFSeRepository.AplicarParametrosNFSeParaEmissao(
  const NFSeId: string; Input: NFSeEtd; Parameters: IParametersBuilder
);
begin
  Parameters
    .ByName( 'ID', NFSeId )
    .ByName( 'COD_EMPRESA', Input.CodEmpresa )
    .ByName( 'COD_CLIENTE', Input.CodCliente )
    .ByName( 'INTERMEDIARIO_ID', Input.IntermediarioId )
    .ByName( 'DEST_IBSCBS_ID', Input.DestIbsCbsId )
    .ByName( 'OP_INTERNA_ID', Input.OpInternaId )
    .ByName( 'COD_SERVICO', Input.CodServico )
    .ByName( 'LAYOUT_NFSE', Ord( Input.LayoutNFSe ))
    .ByName( 'SITUACAO', Ord( Input.Situacao ))
    .ByName( 'NATUREZA_EMISSAO', Ord( Input.NaturezaEmissao ))
    .ByName( 'TPAMB', IntegerNullable.CreateOrNull( Ord( Input.TpAmb )))
    .ByName( 'DHEMI', Input.DhEmi )
    .ByName( 'VERAPLIC', Input.VerAplic )
    .ByName( 'SERIE', Input.Serie )
    .ByName( 'NDPS', Input.Ndps )
    .ByName( 'DCOMPET', Input.DCompet )
    .ByName( 'CLOCPRESTACAO', Input.CLocPrestacao )
    .ByName( 'FINNFSE', Input.FinNFSe )
    .ByName( 'CINDOP', Input.CIndOp )
    .ByName( 'TPOPER', IntegerNullable.CreateOrNull( Ord( Input.TpOper )))
    .ByName( 'TPENTEGOV', IntegerNullable.CreateOrNull( Ord( Input.TpEnteGov )))
    .ByName( 'INDDEST', Input.IndDest )
    .ByName( 'CCNAE', Input.CCNAE )
    .ByName( 'CLC116', Input.CLC116 )
    .ByName( 'CTRIBNAC', Input.CTribNac )
    .ByName( 'CTRIBMUN', Input.CTribMun )
    .ByName( 'XDESCSERV', Input.XDescServ )
    .ByName( 'CNBS', Input.CNBS )
    .ByName( 'VSERV', Input.VServ )
    .ByName( 'VDESCINCOND', Input.VDescIncond )
    .ByName( 'TRIBISSQN', IntegerNullable.CreateOrNull( Ord( Input.TribIssQn )))
    .ByName( 'TPRETISSQN', IntegerNullable.CreateOrNull( Ord( Input.TpRetIssQn )))
    .ByName( 'ISS_PALIQ', Input.IssPAliq )
    .ByName( 'ISS_VBC', Input.IssVBC )
    .ByName( 'VISS', Input.VIss )
    .ByName( 'PC_CST', Input.PCCst )
    .ByName( 'PC_VBCPISCOFINS', Input.PCVBcPisCofins )
    .ByName( 'PC_PALIQPIS', Input.PCPAliqPis )
    .ByName( 'PC_PALIQCOFINS', Input.PCPAliqCofins )
    .ByName( 'PC_VPIS', Input.PCVPis )
    .ByName( 'PC_VCOFINS', Input.PCVCofins )
    .ByName( 'TPRETPISCOFINS', Ord( Input.TpRetPisCofins ))
    .ByName( 'VRETIRRF', Input.VRetIrrf )
    .ByName( 'VRETCSLL', Input.VRetCsll )
    .ByName( 'VRETCP', Input.VRetCP )
    .ByName( 'VRETPIS', Input.VRetPis )
    .ByName( 'VRETCOFINS', Input.VRetCofins )
    .ByName( 'PTOTTRIBFED', Input.PTotTribFed )
    .ByName( 'PTOTTRIBEST', Input.PTotTribEst )
    .ByName( 'PTOTTRIBMUN', Input.PTotTribMun )
    .ByName( 'INDTOTTRIB', Ord( Input.IndTotTrib ))
    .ByName( 'PTOTTRIBSN', Input.PTotTribSN )
    .ByName( 'VLIQ', Input.VLiq )
    .ByName( 'VTOTNF', Input.VTotNf )
    .ByName( 'VTOTALRET', Input.VTotalRet )
end;

procedure NFSeRepository.ExecuteSqlNFSe(const NFSeId, SQL: string; Input: NFSeEtd);
begin
  FConnection.ExecuteCommand( SQL, ParametersBuilder.Create(59)
    .ByName( 'ID', NFSeId )
    .ByName( 'COD_EMPRESA', Input.CodEmpresa )
    .ByName( 'COD_CLIENTE', Input.CodCliente )
    .ByName( 'INTERMEDIARIO_ID', Input.IntermediarioId )
    .ByName( 'DEST_IBSCBS_ID', Input.DestIbsCbsId )
    .ByName( 'OP_INTERNA_ID', Input.OpInternaId )
    .ByName( 'COD_SERVICO', Input.CodServico )
    .ByName( 'LAYOUT_NFSE', Ord( Input.LayoutNFSe ))
    .ByName( 'SITUACAO', Ord( Input.Situacao ))
    .ByName( 'NATUREZA_EMISSAO', Ord( Input.NaturezaEmissao ))
    .ByName( 'TPAMB', IntegerNullable.CreateOrNull( Ord( Input.TpAmb )))
    .ByName( 'DHEMI', Input.DhEmi )
    .ByName( 'VERAPLIC', Input.VerAplic )
    .ByName( 'SERIE', Input.Serie )
    .ByName( 'NDPS', Input.Ndps )
    .ByName( 'DCOMPET', Input.DCompet )
    .ByName( 'CLOCPRESTACAO', Input.CLocPrestacao )
    .ByName( 'FINNFSE', Input.FinNFSe )
    .ByName( 'CINDOP', Input.CIndOp )
    .ByName( 'TPOPER', IntegerNullable.CreateOrNull( Ord( Input.TpOper )))
    .ByName( 'TPENTEGOV', IntegerNullable.CreateOrNull( Ord( Input.TpEnteGov )))
    .ByName( 'INDDEST', Input.IndDest )
    .ByName( 'CCNAE', Input.CCNAE )
    .ByName( 'CLC116', Input.CLC116 )
    .ByName( 'CTRIBNAC', Input.CTribNac )
    .ByName( 'CTRIBMUN', Input.CTribMun )
    .ByName( 'XDESCSERV', Input.XDescServ )
    .ByName( 'CNBS', Input.CNBS )
    .ByName( 'VSERV', Input.VServ )
    .ByName( 'VDESCINCOND', Input.VDescIncond )
    .ByName( 'TRIBISSQN', IntegerNullable.CreateOrNull( Ord( Input.TribIssQn )))
    .ByName( 'TPRETISSQN', IntegerNullable.CreateOrNull( Ord( Input.TpRetIssQn )))
    .ByName( 'ISS_PALIQ', Input.IssPAliq )
    .ByName( 'ISS_VBC', Input.IssVBC )
    .ByName( 'VISS', Input.VIss )
    .ByName( 'PC_CST', Input.PCCst )
    .ByName( 'PC_VBCPISCOFINS', Input.PCVBcPisCofins )
    .ByName( 'PC_PALIQPIS', Input.PCPAliqPis )
    .ByName( 'PC_PALIQCOFINS', Input.PCPAliqCofins )
    .ByName( 'PC_VPIS', Input.PCVPis )
    .ByName( 'PC_VCOFINS', Input.PCVCofins )
    .ByName( 'TPRETPISCOFINS', Ord( Input.TpRetPisCofins ))
    .ByName( 'VRETIRRF', Input.VRetIrrf )
    .ByName( 'VRETCSLL', Input.VRetCsll )
    .ByName( 'VRETCP', Input.VRetCP )
    .ByName( 'VRETPIS', Input.VRetPis )
    .ByName( 'VRETCOFINS', Input.VRetCofins )
    .ByName( 'PTOTTRIBFED', Input.PTotTribFed )
    .ByName( 'PTOTTRIBEST', Input.PTotTribEst )
    .ByName( 'PTOTTRIBMUN', Input.PTotTribMun )
    .ByName( 'INDTOTTRIB', Ord( Input.IndTotTrib ))
    .ByName( 'PTOTTRIBSN', Input.PTotTribSN )
    .Build()
  );
end;

procedure NFSeRepository.ExecuteUpsertNFSeSubstituida(const Id: string; Input: NFSeSubstEtd);
begin
  FConnection.ExecuteCommand(
    'UPDATE OR INSERT INTO NFSE_SUBST ' +
    '(ID, SUBST_ID, CHAVE, CMOTIVO, XMOTIVO, SERIE, NDPS, NNFSE, NLOTE, CVERIFICACAO) ' +
    'VALUES ' +
    '(:ID, :SUBST_ID, :CHAVE, :CMOTIVO, :XMOTIVO, :SERIE, :NDPS, :NNFSE, :NLOTE, :CVERIFICACAO) ' +
    'MATCHING (ID)',
    ParametersBuilder.Create(10)
      .ByName( 'ID', Id )
      .ByName( 'SUBST_ID', Input.SubstituidaId )
      .ByName( 'CHAVE', Input.Chave, 50 )
      .ByName( 'CMOTIVO', Input.CMotivo, 16 )
      .ByName( 'XMOTIVO', Input.XMotivo, 255 )
      .ByName( 'SERIE', Input.Serie, 5 )
      .ByName( 'NDPS', Input.Ndps )
      .ByName( 'NNFSE', Input.NNFSe )
      .ByName( 'NLOTE', Input.NLote, 16 )
      .ByName( 'CVERIFICACAO', Input.CVerificacao, 16 )
      .Build()
  );
end;

procedure NFSeRepository.ExecuteUpserttDPSParticipante(const Id: string;
  Input: NFSeParticipanteEtd);
begin
  FConnection.ExecuteCommand(
    'UPDATE OR INSERT INTO NFSE_PART ' +
    '(ID, TIPO_PART, CPFCNPJ, NIF, CNAONIF, IM, XNOME, FONE, EMAIL, CMUN, CEP, XLGR, NRO, XCPL, ' +
    'XBAIRRO) ' +
    'VALUES ' +
    '(:ID, :TIPO_PART, :CPFCNPJ, :NIF, :CNAONIF, :IM, :XNOME, :FONE, :EMAIL, :CMUN, :CEP, :XLGR, ' +
    ':NRO, :XCPL, :XBAIRRO) ' +
    'MATCHING (ID, TIPO_PART)',
    ParametersBuilder.Create(15)
      .ByName( 'ID', Id )
      .ByName( 'TIPO_PART', Ord( Input.TipoPart ))
      .ByName( 'CPFCNPJ', Input.Cpfcnpj )
      .ByName( 'NIF', Input.Nif )
      .ByName( 'CNAONIF', Input.Cnaonif )
      .ByName( 'IM', Input.Im )
      .ByName( 'XNOME', Input.Xnome )
      .ByName( 'FONE', Input.Fone )
      .ByName( 'EMAIL', Input.Email )
      .ByName( 'CMUN', Input.Cmun )
      .ByName( 'CEP', Input.Cep )
      .ByName( 'XLGR', Input.Xlgr )
      .ByName( 'NRO', Input.Nro )
      .ByName( 'XCPL', Input.Xcpl )
      .ByName( 'XBAIRRO', Input.Xbairro )
      .Build()
  );
end;

function NFSeRepository.GerProximoNDPS(EmpresaId: Integer): Integer;
begin
  with FConnection.ExecuteScalar(
    'SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, :TABELA )',
    ParametersBuilder.Create(2)
      .Add(EmpresaId)
      .Add('RPS')
      .Build()
  ) do
    Result := AsInteger;
end;

function NFSeRepository.GetDocNFSe(const Id: string; EmpresaId: Integer; TipoDoc: TipoDocNFSeEnumSet): NFSeDocModel;
var
  Q: QueryResult;
  Doc: NFSeDocEtd;
  DocList: NFSeDocEtdList;
  sTipos: string;
begin
  sTipos := StringService.Default( StringService.Join(',',
    EnumService.SetAsArrayString(TypeInfo(TipoDocNFSeEnumSet), TipoDoc)
  ), '-1');

  Q := FConnection.CreateQuery( Format(
      'SELECT ' +
      'N.SITUACAO, N.SERIE, N.NDPS, N.DHEMI, ' +
      'D.ID, D.TIPO_DOC, D.DATA_EVENTO, D.DOC ' +
      'FROM NFSE N ' +
      'LEFT JOIN NFSE_DOC D ON D.ID = N.ID AND D.TIPO_DOC in (%s) ' +
      'WHERE N.ID = :ID AND N.COD_EMPRESA = :COD_EMPRESA ', [ sTipos ]
    ),
    ParametersBuilder.Create(2)
      .ByName('ID', Id)
      .ByName('COD_EMPRESA', EmpresaId)
      .Build()
  );
  try
    if Q.IsEmpty then
    begin
      Result := nil;
      Exit;
    end;

    if not Q.FieldIsNull('ID') then
    begin
      DocList := NFSeDocEtdList.Create;

      while not Q.Eof do
      begin
        Doc := NFSeDocEtd.Create(
          Q.FieldAsString('ID'),
          TipoDocNFSeEnum(Q.FieldAsInteger('TIPO_DOC')),
          Q.FieldAsDateTimeNullable('DATA_EVENTO'),
          Q.FieldAsString('DOC')
        );

        DocList.Add( Doc );

        Q.Next();
      end;
    end;

    Result := NFSeDocModel.Create(
      SituacaoNFSeEnum(Q.FieldAsInteger('situacao')),
      Q.FieldAsStringNullable('serie'),
      Q.FieldAsIntNullable('ndps'),
      Q.FieldAsDateTimeNullable('dhemi'),
      DocList
    );
  finally
    Q.Free()
  end;
end;

function NFSeRepository.GetEventoNFSe(const EventoId: string): NFSeEventoModel;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT ' +
    'N.ID, N.COD_EMPRESA, N.SITUACAO, N.SERIE, N.NDPS, N.DHEMI, N.DHCANC, N.CANC_ORIGEM, N.LAYOUT_NFSE, ' +
    'D.ID D_ID, D.TIPO_DOC D_TIPO_DOC, D.DATA_EVENTO D_DATA_EVENTO, D.DOC D_DOC, ' +
    'E.ID E_ID, E.NFSE_ID E_NFSE_ID, E.TIPO_EVENTO E_TIPO_EVENTO, E.DATA_EVENTO E_DATA_EVENTO, E.SITUACAO E_SITUACAO, ' +
    'E.VERAPLIC E_VERAPLIC, E.CMOTIVO E_CMOTIVO, E.XMOTIVO E_XMOTIVO, E.DH_PROC E_DH_PROC, E.NSEQEVENTO E_NSEQEVENTO ' +
    'FROM NFSE_EVENTOS E ' +                                           
    'INNER JOIN NFSE N ON E.NFSE_ID = N.ID AND E.SITUACAO <> :SITUACAO ' +
    'LEFT JOIN NFSE_DOC D ON D.ID = N.ID AND D.TIPO_DOC = :TIPO_DOC ' +
    'WHERE E.ID = :ID ',
    ParametersBuilder.Create(4)
      .ByName('ID', EventoId )
      .ByName('TIPO_DOC', Ord( tdocXmlAutorizacao ))
      .ByName('SITUACAO', Ord( sdpsExcluido ))
      .Build()
  );
  try
    Result := CreateNFSeEventoModelFromQuery( Q );
  finally
    Q.Free();
  end;
end;

function NFSeRepository.GetLastHistorico(const NFSeId: string; TipoHistorico: TipoHistoricoNFSeEnum): NFSeHistoricoEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT FIRST 1 ' +
    'H.NFSE_ID, H.SEQID, H.DATA_EVENTO, H.SITUACAO, H.TIPO_EVENTO, H.DESCRICAO ' +
    'FROM NFSE_HISTORICO H ' +
    'WHERE H.NFSE_ID = :NFSE_ID AND H.TIPO_EVENTO = :TIPO_EVENTO ' +
    'ORDER BY H.DATA_EVENTO DESC ',
    ParametersBuilder.Create(2)
      .Add(NFSeId)
      .Add(Ord(TipoHistorico))
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil
    else
      Result := NFSeHistoricoEtd.Create(
        Q.FieldAsString('NFSE_ID'),
        Q.FieldAsInteger('SEQID'),
        Q.FieldAsDateTimeNullable('DATA_EVENTO'),
        SituacaoNFSeEnum(Q.FieldAsInteger('SITUACAO')),
        TipoHistoricoNFSeEnum(Q.FieldAsInteger('TIPO_EVENTO')),
        Q.FieldAsStringNullable('DESCRICAO')
      );
  finally
    Q.Free();
  end;
end;

function NFSeRepository.GetEventoNFSe(
  const NFSeId: string;
  EmpresaId: Integer;
  TipoEvento: TipoEventoNFSeEnum
): NFSeEventoModel;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT ' +
    'N.ID, N.COD_EMPRESA, N.SITUACAO, N.SERIE, N.NDPS, N.DHEMI, N.DHCANC, N.CANC_ORIGEM, N.LAYOUT_NFSE, ' +
    'D.ID D_ID, D.TIPO_DOC D_TIPO_DOC, D.DATA_EVENTO D_DATA_EVENTO, D.DOC D_DOC, ' +
    'E.ID E_ID, E.NFSE_ID E_NFSE_ID, E.TIPO_EVENTO E_TIPO_EVENTO, E.DATA_EVENTO E_DATA_EVENTO, E.SITUACAO E_SITUACAO, ' +
    'E.VERAPLIC E_VERAPLIC, E.CMOTIVO E_CMOTIVO, E.XMOTIVO E_XMOTIVO, E.DH_PROC E_DH_PROC, E.NSEQEVENTO E_NSEQEVENTO ' +
    'FROM NFSE N ' +
    'LEFT JOIN NFSE_DOC D ON D.ID = N.ID AND D.TIPO_DOC = :TIPO_DOC ' +
    'LEFT JOIN NFSE_EVENTOS E ON E.NFSE_ID = N.ID AND E.TIPO_EVENTO = :TIPO_EVENTO AND E.SITUACAO <> :SITUACAO ' +
    'WHERE N.ID = :ID AND N.COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(4)
      .ByName('ID', NFSeId)
      .ByName('COD_EMPRESA', EmpresaId)
      .ByName('TIPO_DOC', Ord( tdocXmlAutorizacao ))
      .ByName('TIPO_EVENTO', Ord( TipoEvento ))
      .ByName('SITUACAO', Ord( sdpsExcluido ))
      .Build()
  );
  try
    Result := CreateNFSeEventoModelFromQuery( Q );
  finally
    Q.Free();
  end;
end;

function NFSeRepository.GetNFSe(const Id: string; EmpresaId: Integer): NFSeEtd;
var
  Q: QueryResult;
  RefNFSe: TArrayString;
begin
  Q := FConnection.CreateQuery( GetSqlNFSe +
    ' where n.id = %s and n.cod_empresa = %d',
    [ QuotedStr(Id), EmpresaId ]
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
    begin

      if Q.FieldIsNull('r_chave') then
        SetLength(RefNFSe, 0)
      else
      begin
        SetLength(RefNFSe, 99);
        while not Q.Eof do
        begin
          RefNFSe[ Q.DataSet.RecNo - 1 ] := Q.FieldAsString('r_chave');

          Q.Next();
        end;
        SetLength(RefNFSe, Q.DataSet.RecNo);
      end;

      Result := CreateItemFromQuery( Q, RefNFSe );
    end;

  finally
    Q.Free();
  end;
end;

function NFSeRepository.GetNFSeEvento(const EventoId: string): NFSeEventoEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT ID, NFSE_ID, TIPO_EVENTO, DATA_EVENTO, SITUACAO, VERAPLIC, CMOTIVO, XMOTIVO, DH_PROC, NSEQEVENTO ' +
    'FROM NFSE_EVENTOS ' +
    'WHERE ID = %s ',
    [ QuotedStr(EventoId) ]
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := NFSeEventoEtd.Create(
        Q.FieldAsString('ID'),
        Q.FieldAsString('NFSE_ID'),
        TipoEventoNFSeEnum( Q.FieldAsInteger('TIPO_EVENTO') ),
        Q.FieldAsDateTime('DATA_EVENTO'),
        SituacaoNFSeEnum( Q.FieldAsInteger('SITUACAO') ),
        Q.FieldAsStringNullable('VERAPLIC'),
        Q.FieldAsStringNullable('CMOTIVO'),
        Q.FieldAsStringNullable('XMOTIVO'),
        Q.FieldAsDateTimeNullable('DH_PROC'),
        Q.FieldAsIntNullable('NSEQEVENTO')
      );
  finally
    Q.Free();
  end;
end;

function NFSeRepository.GetResumoEventoNFSe(
  const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum
): NFSeEventoResumoModel;
var
  Q: QueryResult;
  D: NFSeDocEtd;
  E: NFSeEventoEtd;
begin
  Q := FConnection.CreateQuery(
    'SELECT ' +
    'N.ID, N.COD_EMPRESA, N.SITUACAO, N.SERIE, N.NDPS, N.DHEMI, ' +
    'E.ID E_ID, E.TIPO_EVENTO E_TIPO_EVENTO, ' +
    'E.DATA_EVENTO E_DATA_EVENTO, E.SITUACAO E_SITUACAO ' +
    'FROM NFSE N ' +
    'LEFT JOIN NFSE_EVENTOS E ON E.NFES_ID = N.ID AND E.TIPO_EVENTO = :TIPO_EVENTO AND E.SITUACAO <> :SITUACAO ' +
    'WHERE N.ID = :ID AND N.COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(4)
      .ByName('ID', Id)
      .ByName('COD_EMPRESA', EmpresaId)
      .ByName('TIPO_EVENTO', Ord( TipoEvento ))
      .ByName('SITUACAO', Ord( sdpsExcluido ))
      .Build()
  );
  try
    Result := NFSeEventoResumoModel.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsInteger('COD_EMPRESA'),
      Q.FieldAsStringNullable('E_ID'),
      TipoEventoNFSeEnum( Q.FieldAsInteger('E_TIPO_EVENTO') ),
      SituacaoNFSeEnum( Q.FieldAsInteger('E_SITUACAO') ),
      Q.FieldAsDateTime('E_DATA_EVENTO'),
      SituacaoNFSeEnum( Q.FieldAsInteger('SITUACAO') ),
      Q.FieldAsStringNullable('SERIE'),
      Q.FieldAsIntNullable('NDPS'),
      Q.FieldAsDateTimeNullable('DHEMI')
    );
  finally
    Q.Free();
  end;
end;

function NFSeRepository.GetResumoNFSe(const Id: string; TipoDoc: TipoDocNFSeEnumSet): NFSeResumoModel;
var
  Q: QueryResult;
  sTipos: string;
  Docs: NFSeResumoModelDocArray;
  Count: Integer;
begin
  sTipos := StringService.Default( StringService.Join(',',
    EnumService.SetAsArrayString(TypeInfo(TipoDocNFSeEnumSet), TipoDoc)
  ), '');

  Q := FConnection.CreateQuery(
    'SELECT ' +
    'N.ID, N.COD_EMPRESA, N.SITUACAO, N.NATUREZA_EMISSAO, N.TPAMB, N.SERIE, N.NDPS, N.DHEMI, N.LAYOUT_NFSE, N.NLOTE, ' +
    'N.NPROTOCOLO, N.CHAVE_NFSE, N.NNFSE, ' +
    IfThen( sTipos = '', 'null TIPO_DOC, null DOC, ', 'D.TIPO_DOC, D.DOC, ') +
    'SP.ID SP_ID, SD.SUBST_ID SD_SUBST_ID ' +
    'FROM NFSE N ' +
    'LEFT JOIN NFSE_SUBST SP ON SP.SUBST_ID = N.ID ' +
    'LEFT JOIN NFSE_SUBST SD ON SD.ID = N.ID ' +
    IfThen( sTipos <> '', Format('LEFT JOIN NFSE_DOC D ON D.ID = N.ID AND D.TIPO_DOC in (%s) ', [ sTipos ])) +
    'WHERE N.ID = :P0 AND N.COD_EMPRESA = :P1',
    ParametersBuilder.Create(2)
      .Add(Id)
      .Add(FSession.EmpresaId)
      .Build()
  );
  try
    if Q.FieldIsNull('TIPO_DOC') then
      SetLength(Docs, 0)
    else
    begin
      SetLength(Docs, 4);
      Count := 0;

      while not Q.Eof do
      begin
        if Count >= Length(Docs) then
          SetLength(Docs, Length(Docs) + 4);

        Docs[Count] := NFSeResumoModelDoc.Create(
          TipoDocNFSeEnum(Q.FieldAsInteger('TIPO_DOC')),
          Q.FieldAsStringNullable('DOC')
        );
        Inc(Count);
        Q.Next();
      end;
      SetLength(Docs, Count);
    end;

    Result := NFSeResumoModel.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsInteger('COD_EMPRESA'),
      SituacaoNFSeEnum(Q.FieldAsInteger('SITUACAO')),
      NaturezaEmissaoNFSeEnum(Q.FieldAsInteger('NATUREZA_EMISSAO')),
      TipoAmbienteEnum(Q.FieldAsInteger('TPAMB')),
      Q.FieldAsStringNullable('SERIE'),
      Q.FieldAsIntNullable('NDPS'),
      Q.FieldAsDateTimeNullable('DHEMI'),
      LayoutNFSeEnum(Q.FieldAsInteger('LAYOUT_NFSE')),
      Q.FieldAsStringNullable('NLOTE'),
      Q.FieldAsStringNullable('NPROTOCOLO'),
      Q.FieldAsStringNullable('CHAVE_NFSE'),
      Q.FieldAsInt64Nullable('NNFSE'),
      Q.FieldAsStringNullable('SP_ID'),
      Q.FieldAsStringNullable('SD_SUBST_ID'),
      Docs
    );
  finally
    Q.Free();
  end;
end;

function NFSeRepository.ListarRelacionamento(const NFSeId: string): NFSeOSEtdList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ns.id, ns.nfse_id, ns.nped, ns.tipo, ns.cod_empresa, ns.vserv, ns.vdescincond, ns.vretirrf, ns.vretcp, ' +
    'ns.vretpis, ns.vretcofins, ns.vretcsll, ns.vretiss ' +
    'from nfse_os ns ' +
    'where ns.nfse_id = :nfse_id ',
    ParametersBuilder.Create(1).Add(NFSeId).Build()
  );
  try
    Result := NFSeOSEtdList.Create();

    while not Q.Eof do
    begin
      Result.Add( NFSeOSEtd.Create(
        Q.FieldAsInteger('ID'),
        Q.FieldAsString('NFSE_ID'),
        Q.FieldAsInteger('NPED'),
        Q.FieldAsString('TIPO'),
        Q.FieldAsInteger('COD_EMPRESA'),
        Q.FieldAsCurrency('VSERV'),
        Q.FieldAsCurrency('VDESCINCOND'),
        Q.FieldAsCurrency('VRETIRRF'),
        Q.FieldAsCurrency('VRETCSLL'),
        Q.FieldAsCurrency('VRETCP'),
        Q.FieldAsCurrency('VRETPIS'),
        Q.FieldAsCurrency('VRETCOFINS'),
        Q.FieldAsCurrency('VRETISS')
      ));
      q.nEXT();
    end;
  finally
    Q.Free();
  end;
end;

function NFSeRepository.ListarRelacionamento(const NumeroOS: Integer): NFSeOSEtdList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ns.id, ns.nfse_id, ns.nped, ns.tipo, ns.cod_empresa, ns.vserv, ns.vdescincond, ns.vretirrf, ns.vretcp, ' +
    'ns.vretpis, ns.vretcofins, ns.vretcsll, ns.vretiss ' +
    'from nfse_os ns ' +
    'where ns.nped = :nped and ns.tipo = :tipo and ns.cod_empresa = :cod_empresa ',
    ParametersBuilder.Create(1)
      .Add(NumeroOS)
      .Add('OS')
      .Add(FSession.EmpresaId)
      .Build()
  );
  try
    Result := NFSeOSEtdList.Create();

    while not Q.Eof do
    begin
      Result.Add( NFSeOSEtd.Create(
        Q.FieldAsInteger('ID'),
        Q.FieldAsString('NFSE_ID'),
        Q.FieldAsInteger('NPED'),
        Q.FieldAsString('TIPO'),
        Q.FieldAsInteger('COD_EMPRESA'),
        Q.FieldAsCurrency('VSERV'),
        Q.FieldAsCurrency('VDESCINCOND'),
        Q.FieldAsCurrency('VRETIRRF'),
        Q.FieldAsCurrency('VRETCSLL'),
        Q.FieldAsCurrency('VRETCP'),
        Q.FieldAsCurrency('VRETPIS'),
        Q.FieldAsCurrency('VRETCOFINS'),
        Q.FieldAsCurrency('VRETISS')
      ));
      q.nEXT();
    end;
  finally
    Q.Free();
  end;
end;

function NFSeRepository.ListarSituacaoNFSes(const Ids: TArrayString; EmpresaId: Integer): NFSeSitacaoModelArray;
var
  Params: IParametersBuilder;
  Q: QueryResult;
  SQL, SQLIds: string;
  Docs: NFSeResumoModelDocArray;
  I, N, StartIndex, EndIndex, ChunkSize, Count: Integer;
begin
  SetLength(Docs, 0);
  I := 0;
  N := 0;
  ChunkSize := 500;
  Params := ParametersBuilder.Create();

  while I < Length(Ids) do
  begin
    if (I + ChunkSize) > Length(Ids) then
      Count := Length(Ids) - i
    else
      Count := ChunkSize;

    EndIndex := I + Count;

    Params.Reset(Count + 1);
    Params.Add(EmpresaId);

    StartIndex := I;
    SQLIds := '';

    while I < EndIndex do
    begin
      if I > StartIndex then
        SQLIds := SQLIds + ',';

      SQLIds := SQLIds + ':P' + IntToStr(I);
      Params.Add(Ids[I]);

      Inc(I);
    end;

    Q := FConnection.CreateQuery( Format(
        'SELECT ' +
        'N.ID, N.COD_EMPRESA, N.SITUACAO, N.NATUREZA_EMISSAO, N.SERIE, N.NDPS ' +
        'FROM NFSE N ' +
        'WHERE N.COD_EMPRESA = :E0 AND N.ID IN (%s) ',
        [ SQLIds ]
      ),
      Params.Build()
    );
    try
      while not Q.Eof do
      begin
        if N >= Length(Result) then
          SetLength(Result, Length(Result) + 32);

        Result[N] := NFSeSitacaoModel.Create(
          Q.FieldAsString('ID'),
          Q.FieldAsInteger('COD_EMPRESA'),
          SituacaoNFSeEnum(Q.FieldAsInteger('SITUACAO')),
          NaturezaEmissaoNFSeEnum(Q.FieldAsInteger('NATUREZA_EMISSAO')),
          Q.FieldAsStringNullable('SERIE'),
          Q.FieldAsIntNullable('NDPS')
        );
        Inc(N);
        Q.Next();
      end;
    finally
      Q.Free();
    end;
  end;

  SetLength(Result, N);
end;

function NFSeRepository.GetResumoEventoNFSe(const NFSeId, EventoId: string): NFSeEventoResumoModel;
var
  Q: QueryResult;
  D: NFSeDocEtd;
  E: NFSeEventoEtd;
begin
  Q := FConnection.CreateQuery(
    'SELECT ' +
    'N.ID, N.COD_EMPRESA, N.SITUACAO, N.SERIE, N.NDPS, N.DHEMI, ' +
    'E.ID E_ID, E.TIPO_EVENTO E_TIPO_EVENTO, ' +
    'E.DATA_EVENTO E_DATA_EVENTO, E.SITUACAO E_SITUACAO ' +
    'FROM NFSE N ' +
    'LEFT JOIN NFSE_EVENTOS E ON E.NFSE_ID = N.ID AND E.ID = :EVENTO_ID AND E.SITUACAO <> :SITUACAO ' +
    'WHERE N.ID = :NFSE_ID ',
    ParametersBuilder.Create(3)
      .ByName('EVENTO_ID', EventoId)
      .ByName('NFSE_ID', NFSeId)
      .ByName('SITUACAO', Ord( sdpsExcluido ))
      .Build()
  );
  try
    Result := NFSeEventoResumoModel.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsInteger('COD_EMPRESA'),
      Q.FieldAsStringNullable('E_ID'),
      TipoEventoNFSeEnum( Q.FieldAsInteger('E_TIPO_EVENTO') ),
      SituacaoNFSeEnum( Q.FieldAsInteger('E_SITUACAO') ),
      Q.FieldAsDateTime('E_DATA_EVENTO'),
      SituacaoNFSeEnum( Q.FieldAsInteger('SITUACAO') ),
      Q.FieldAsStringNullable('SERIE'),
      Q.FieldAsIntNullable('NDPS'),
      Q.FieldAsDateTimeNullable('DHEMI')
    );
  finally
    Q.Free();
  end;
end;

function NFSeRepository.GetResumoNFSe(const Id: string): NFSeResumoModel;
var
  Q: QueryResult;
begin
  Result := Self.GetResumoNFSe( Id, [] );
{
  Q := FConnection.CreateQuery(
    'SELECT ' +
    'ID, COD_EMPRESA, SITUACAO, SERIE, NDPS, DHEMI, LAYOUT_NFSE, NLOTE ' +
    'FROM NFSE ' +
    'WHERE ID = :P0 AND COD_EMPRESA = :P1',
    ParametersBuilder.Create(2)
      .Add(Id)
      .Add(EmpresaId)
      .Build()
  );
  try
    Result := NFSeResumoModel.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsInteger('COD_EMPRESA'),
      SituacaoNFSeEnum(Q.FieldAsInteger('SITUACAO')),
      Q.FieldAsStringNullable('SERIE'),
      Q.FieldAsIntNullable('NDPS'),
      Q.FieldAsDateTimeNullable('DHEMI'),
      LayoutNFSeEnum(Q.FieldAsInteger('LAYOUT_NFSE')),
      Q.FieldAsStringNullable('NLOTE')
    );
  finally
    Q.Free();
  end;
  }
end;

procedure NFSeRepository.AtualizarDocNFSe(const Input: NFSeDocEtd);
begin
  FConnection.ExecuteCommand(
    'UPDATE OR INSERT INTO NFSE_DOC ' +
    '(ID, TIPO_DOC, DATA_EVENTO, DOC) ' +
    'VALUES ' +
    '(:ID, :TIPO_DOC, COALESCE(:DATA_EVENTO, CURRENT_TIMESTAMP), :DOC) '+
    'MATCHING (ID, TIPO_DOC)',
    ParametersBuilder.Create(4)
      .ByName('ID', Input.Id)
      .ByName('TIPO_DOC', Ord(Input.TipoDoc))
      .ByName('DATA_EVENTO', Input.DataEvento)
      .ByName('DOC', Input.Doc)
      .Build()
  );
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarEmProcessamentoModel): NFSeResumoModel;
var
  H: NFSeHistoricoEtd;
begin
  H := NFSeHistoricoEtd.Create(
    Input.Id, 0, DateTimeNullable.NullInstance(), sdpsEmProcessamento, thAlteracaoStatus, StringNullable.NullInstance()
  );
  try
    PostNFSeHistorico( H );

  finally
    H.Free();
  end;

  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :P0 ' +
    ',NPROTOCOLO = COALESCE(:P1, NPROTOCOLO) ' + // Somente altera sem tem valor
    'WHERE ID = :P2 AND COD_EMPRESA = :P3',
    ParametersBuilder.Create(4)
      .Add( Ord( sdpsEmProcessamento ))
      .Add( StringNullable.CreateOrNull( Input.Protocolo ))
      .Add( Input.Id )
      .Add( Input.EmpresaId )
      .Build()
  );
  Result := GetResumoNFSe( Input.Id );
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarEmEmissaoModel): NFSeResumoModel;
var
  D: NFSeDocEtd;
  H: NFSeHistoricoEtd;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    ',NLOTE = cast((SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, :TABELA )) as varchar(16)) ' +
    'WHERE ID = :ID AND COD_EMPRESA = :COD_EMPRESA AND SITUACAO <> :SITUACAO ',
    ParametersBuilder.Create(4)
      .ByName( 'SITUACAO', Ord( sdpsEmissao ))
      .ByName( 'ID', Input.Id )
      .ByName( 'COD_EMPRESA', Input.EmpresaId )
      .ByName( 'TABELA', 'LOTENFSe' )
      .Build()
  );
  Result := GetResumoNFSe( Input.Id );

  D := NFSeDocEtd.Create( Input.Id, tdocXmlDPSEnvio, DateTimeNullable.NullInstance(), Input.Documento );
  H := NFSeHistoricoEtd.Create(
    Input.Id, 0, D.DataEvento, sdpsEmissao, thAlteracaoStatus, StringNullable.NullInstance()
  );
  try

    AtualizarDocNFSe( D );
    PostNFSeHistorico( H );

  finally
    D.Free();
    H.Free();
  end;
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarRejeicaoModel): NFSeResumoModel;
var
  D: NFSeDocEtd;
  H: NFSeHistoricoEtd;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :P0 ' +
    ',NPROTOCOLO = COALESCE(:P1, NPROTOCOLO) ' +  // Somente altera sem tem valor
    'WHERE ID = :P2 AND COD_EMPRESA = :P3',
    ParametersBuilder.Create(4)
      .Add( Ord( sdpsRejeicao ))
      .Add( StringNullable.CreateOrNull( Input.Protocolo ))
      .Add( Input.Id )
      .Add( Input.EmpresaId )
      .Build()
  );
  Result := GetResumoNFSe( Input.Id );

  D := NFSeDocEtd.Create( Input.Id, tdocTextDPSRejeicao, DateTimeNullable.NullInstance(), Input.Documento );
  H := NFSeHistoricoEtd.Create(
    Input.Id, 0, D.DataEvento, sdpsRejeicao, thRejeicao, StringNullable.CreateOrNull(Input.Historico)
  );
  try

    AtualizarDocNFSe( D );
    PostNFSeHistorico( H );

  finally
    D.Free();
    H.Free();
  end;
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarSituacaoModel;
  Situacao: SituacaoNFSeEnum): NFSeResumoModel;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE ' +
    ' SET SITUACAO = :P0 ' +
    'WHERE ID = :P1 AND COD_EMPRESA = :P2',
    ParametersBuilder.Create(3)
      .Add( Ord( Situacao ))
      .Add(Input.Id)
      .Add(Input.EmpresaId)
      .Build()
  );
  Result := GetResumoNFSe( Input.Id );
end;

function NFSeRepository.CreateItemFromQuery(Q: QueryResult; const RefNFSe: TArrayString): NFSeEtd;
var
  tomador, prestador: NFSeParticipanteEtd;
  NaturezaEmissao: NaturezaEmissaoNFSeEnum;
begin
  tomador := nil;
  prestador := nil;

  NaturezaEmissao := NaturezaEmissaoNFSeEnum(Q.FieldAsInteger('natureza_emissao'));
  case NaturezaEmissao of
    nemtPrestadorWS, nemtPrestadorPortal:
      tomador := CreateParticipante(Q, 't_');

    nemtTomadorTerceiros:
      prestador := CreateParticipante(Q, 't_');

    else
      raise Exception.Create('NFSeRepository.CreateItemFromQuery Case NaturezaEmissaoNFSeEnum');
  end;

  Result := NFSeEtd.Create(
    Q.FieldAsString('id'),
    Q.FieldAsInteger('seqid'),
    Q.FieldAsInteger('cod_empresa'),
    Q.FieldAsIntNullable('cod_cliente'),
    Q.FieldAsIntNullable('intermediario_id'),
    Q.FieldAsIntNullable('dest_ibscbs_id'),
    Q.FieldAsStringNullable('op_interna_id'),
    LayoutNFSeEnum(Q.FieldAsInteger('layout_nfse')),
    SituacaoNFSeEnum(Q.FieldAsInteger('situacao')),
    NaturezaEmissao,
    TipoAmbienteEnum(Q.FieldAsInteger('tpamb')),
    Q.FieldAsDateTimeNullable('dhemi'),
    Q.FieldAsStringNullable('veraplic'),
    Q.FieldAsStringNullable('serie'),
    Q.FieldAsIntNullable('ndps'),
    Q.FieldAsDateNullable('dcompet'),
    Q.FieldAsIntNullable('clocprestacao'),
    Q.FieldAsInteger('finnfse'),
    Q.FieldAsStringNullable('cindop'),
    TipoOperEnteGovEnum(Q.FieldAsInteger('tpoper')),
    TipoEnteGovEnum(Q.FieldAsInteger('tpentegov')),
    Q.FieldAsInteger('inddest'),
    Q.FieldAsStringNullable('ccnae'),
    Q.FieldAsStringNullable('clc116'),
    Q.FieldAsStringNullable('ctribnac'),
    Q.FieldAsStringNullable('ctribmun'),
    Q.FieldAsStringNullable('xdescserv'),
    Q.FieldAsStringNullable('cnbs'),
    Q.FieldAsIntNullable('cod_servico'),
    Q.FieldAsCurrencyNullable('vserv'),
    Q.FieldAsCurrencyNullable('vdescincond'),
    TributacaoISSQNEnum(Q.FieldAsInteger('tribissqn')),
    TipoRetencaoISSQNEnum(Q.FieldAsInteger('tpretissqn')),
    Q.FieldAsCurrencyNullable('iss_paliq'),
    Q.FieldAsCurrencyNullable('iss_vbc'),
    Q.FieldAsCurrencyNullable('viss'),
    Q.FieldAsStringNullable('pc_cst'),
    Q.FieldAsCurrencyNullable('pc_vbcpiscofins'),
    Q.FieldAsCurrencyNullable('pc_paliqpis'),
    Q.FieldAsCurrencyNullable('pc_paliqcofins'),
    Q.FieldAsCurrencyNullable('pc_vpis'),
    Q.FieldAsCurrencyNullable('pc_vcofins'),
    TipoRetencaoPisCofinsEnum(Q.FieldAsInteger('tpretpiscofins')),
    Q.FieldAsCurrencyNullable('vretirrf'),
    Q.FieldAsCurrencyNullable('vretcsll'),
    Q.FieldAsCurrencyNullable('vretcp'),
    Q.FieldAsCurrencyNullable('vretpis'),
    Q.FieldAsCurrencyNullable('vretcofins'),
    Q.FieldAsCurrencyNullable('ptottribfed'),
    Q.FieldAsCurrencyNullable('ptottribest'),
    Q.FieldAsCurrencyNullable('ptottribmun'),
    YesNoEnum(Q.FieldAsInteger('indtottrib')),
    Q.FieldAsCurrencyNullable('ptottribsn'),
    Q.FieldAsStringNullable('nlote'),
    Q.FieldAsStringNullable('nprotocolo'),
    Q.FieldAsStringNullable('chave_nfse'),
    Q.FieldAsDateTimeNullable('dhproc'),
    Q.FieldAsStringNullable('cstat'),
    Q.FieldAsInt64Nullable('nnfse'),
    Q.FieldAsInt64Nullable('ndfse'),
    Q.FieldAsCurrencyNullable('vliq'),
    Q.FieldAsCurrencyNullable('vtotnf'),
    Q.FieldAsCurrencyNullable('predutor'),
    Q.FieldAsCurrencyNullable('vtotalret'),
    Q.FieldAsStringNullable('cverificacao'),
    OrigemCancelamentoNFSeEnum( Q.FieldAsInteger('canc_origem') ),
    Q.FieldAsDateTimeNullable('dhcanc'),
    RefNFSe,
    tomador,
    prestador,
    CreateParticipante(Q, 'i_'),
    CreateParticipante(Q, 'ds_'),
    TipoServicoFactory.FromQueryResult(Q, 'ts_'),
//    CreateIBSCBS( Q, RefNFSe ),
    CreateSubstituida( Q )
  );
end;

function NFSeRepository.CreateNFSeEventoModelFromQuery(Q: QueryResult): NFSeEventoModel;
var
  D: NFSeDocEtd;
  E: NFSeEventoEtd;
begin
  if Q.IsEmpty then
  begin
    Result := nil;
    Exit;
  end;

  if not Q.FieldIsNull('D_ID') then
    D := NFSeDocEtd.Create(
      Q.FieldAsString('D_ID'),
      TipoDocNFSeEnum(Q.FieldAsInteger('D_TIPO_DOC')),
      Q.FieldAsDateTimeNullable('D_DATA_EVENTO'),
      Q.FieldAsString('D_DOC')
    )
  else
    D := nil;

  if not Q.FieldIsNull('E_ID') then
    E := NFSeEventoEtd.Create(
      Q.FieldAsString('E_ID'),
      Q.FieldAsString('E_NFSE_ID'),
      TipoEventoNFSeEnum(Q.FieldAsInteger('E_TIPO_EVENTO')),
      Q.FieldAsDateTime('E_DATA_EVENTO'),
      SituacaoNFSeEnum(Q.FieldAsInteger('E_SITUACAO')),
      Q.FieldAsStringNullable('E_VERAPLIC'),
      Q.FieldAsStringNullable('E_CMOTIVO'),
      Q.FieldAsStringNullable('E_XMOTIVO'),
      Q.FieldAsDateTimeNullable('E_DH_PROC'),
      Q.FieldAsIntNullable('E_NSEQEVENTO')
    )
  else
    E := nil;

  Result := NFSeEventoModel.Create(
    Q.FieldAsString('ID'),
    Q.FieldAsInteger('COD_EMPRESA'),
    SituacaoNFSeEnum(Q.FieldAsInteger('situacao')),
    Q.FieldAsStringNullable('serie'),
    Q.FieldAsIntNullable('ndps'),
    Q.FieldAsDateTimeNullable('dhemi'),
    Q.FieldAsDateTimeNullable('DHCANC'),
    OrigemCancelamentoNFSeEnum( Q.FieldAsInteger('canc_origem') ),
    LayoutNFSeEnum(Q.FieldAsInteger('layout_nfse')),
    D,
    E
  );
end;

function NFSeRepository.GetSqlNFSe: string;
begin
  Result :=
    'select ' +
    'n.id, n.seqid, n.cod_empresa, n.cod_cliente, n.intermediario_id, n.dest_ibscbs_id, n.op_interna_id, n.cod_servico, ' +
    'n.layout_nfse, n.situacao, n.natureza_emissao, n.tpamb, n.dhemi, n.veraplic, n.serie, n.ndps, ' +
    'n.dcompet, n.clocprestacao, n.finnfse, n.cindop, n.tpoper, n.tpentegov, n.inddest, n.ccnae, n.clc116, ' +
    'n.ctribnac, n.ctribmun, n.xdescserv, n.cnbs, n.vserv, n.vdescincond, n.tribissqn, n.tpretissqn, n.iss_paliq, ' +
    'n.iss_vbc, n.viss, n.pc_cst, n.pc_vbcpiscofins, n.pc_paliqpis, n.pc_paliqcofins, n.pc_vpis, n.pc_vcofins, ' +
    'n.tpretpiscofins, n.vretirrf, n.vretcsll, n.vretcp, n.vretpis, n.vretcofins, n.ptottribfed, n.ptottribest, ' +
    'n.ptottribmun, n.indtottrib, n.ptottribsn, n.nlote, n.nprotocolo, n.chave_nfse, n.dhproc, n.cstat, n.nnfse, ' +
    'n.ndfse, n.vliq, n.vtotnf, n.predutor, n.vtotalret, n.canc_origem, n.dhcanc, n.cverificacao, ' +
//    'p.id p_id, p.tipo_part p_tipo_part, p.cpfcnpj p_cpfcnpj, p.nif p_nif, p.cnaonif p_cnaonif, p.im p_im, ' +
//    'p.xnome p_xnome, p.fone p_fone, p.email p_email, p.cmun p_cmun, p.cep p_cep, p.xlgr p_xlgr, p.nro p_nro, ' +
//    'p.xcpl p_xcpl, p.xbairro p_xbairro, ' +
    't.id t_id, t.tipo_part t_tipo_part, t.cpfcnpj t_cpfcnpj, t.nif t_nif, t.cnaonif t_cnaonif, t.im t_im, ' +
    't.xnome t_xnome, t.fone t_fone, t.email t_email, t.cmun t_cmun, t.cep t_cep, t.xlgr t_xlgr, t.nro t_nro, ' +
    't.xcpl t_xcpl, t.xbairro t_xbairro, ' +
    'i.id i_id, i.tipo_part i_tipo_part, i.cpfcnpj i_cpfcnpj, i.nif i_nif, i.cnaonif i_cnaonif, i.im i_im, ' +
    'i.xnome i_xnome, i.fone i_fone, i.email i_email, i.cmun i_cmun, i.cep i_cep, i.xlgr i_xlgr, i.nro i_nro, ' +
    'i.xcpl i_xcpl, i.xbairro i_xbairro, ' +
    'ds.id ds_id, ds.tipo_part ds_tipo_part, ds.cpfcnpj ds_cpfcnpj, ds.nif ds_nif, ds.cnaonif ds_cnaonif, ds.im ds_im, ' +
    'ds.xnome ds_xnome, ds.fone ds_fone, ds.email ds_email, ds.cmun ds_cmun, ds.cep ds_cep, ds.xlgr ds_xlgr, ' +
    'ds.nro ds_nro, ds.xcpl ds_xcpl, ds.xbairro ds_xbairro, ' +
    'cl.email cl_email, ' +
//    'ic.id ic_id, ic.finnfse ic_finnfse, ic.cindop ic_cindop, ic.tpoper ic_tpoper, ic.tpentegov ic_tpentegov, ' +
//    'ic.inddest ic_inddest, ic.tipo_regra_fiscal ic_tipo_regra_fiscal, ic.regra_fiscal_id ic_regra_fiscal_id, ' +
//    'ic.cst ic_cst, ic.cclasstrib ic_cclasstrib, ic.ccredpres ic_ccredpres, ic.cstreg ic_cstreg, ' +
//    'ic.cclasstribreg ic_cclasstribreg, ic.pdifuf ic_pdifuf, ic.pdifmun ic_pdifmun, ic.pdifcbs ic_pdifcbs, ' +
    'ts.cod_servico ts_cod_servico, ts.desc_servico ts_desc_servico, ts.aliq_iss ts_aliq_iss, ts.ativo ts_ativo, ' +
    'ts.nfs_servico ts_nfs_servico, ts.cnae_serv ts_cnae_serv, ts.iss_retido ts_iss_retido, ts.ctribnac ts_ctribnac, ' +
    'ts.ctribmun ts_ctribmun, ts.cnbs ts_cnbs, ts.cindop ts_cindop, ts.isento_serv ts_isento_serv, ' +
    'ts.n_incidencia_serv ts_n_incidencia_serv, ts.cst_pis ts_cst_pis, ts.cst_pis_ent ts_cst_pis_ent, ' +
    'ts.grupo_fiscal_ibscbs ts_grupo_fiscal_ibscbs, ' +
    'te.irrf_servico ts_irrf_servico, ts.vl_teto_irrf ts_vl_teto_irrf, te.aliq_pis_ret ts_aliq_pis_ret, ' +
    'te.aliq_cofins_ret ts_aliq_cofins_ret, te.aliq_cssl_ret ts_aliq_cssl_ret, te.vl_teto_contrib ts_vl_teto_contrib, ' +
    'te.aliq_cp_ret ts_aliq_cp_ret, ' +
    'r.chave r_chave, ' +
    's.id s_id, s.subst_id s_subst_id, s.chave s_chave, s.cmotivo s_cmotivo, s.xmotivo s_xmotivo, s.serie s_serie, ' +
    's.ndps s_ndps, s.nnfse s_nnfse, s.nlote s_nlote, s.cverificacao s_cverificacao ' +
    'from NFSE n ' +
    //'left join dps_part p on p.id = n.id and p.tipo_part = 1    /*1=prestador*/ ' +
    //'left join nfse_part t on t.id = n.id and t.tipo_part = 2    /*2=tomador*/ ' +
    'left join nfse_part t on t.id = n.id and t.tipo_part = iif(n.natureza_emissao in (0,1), 2, 1) /*2=tomador*/' +
    'left join nfse_part i on i.id = n.id and i.tipo_part = 3    /*3=intermediario*/ ' +
    'left join nfse_part ds on ds.id = n.id and ds.tipo_part = 4 /*4=dest ibscbs*/ ' +
//    'left join nfse_ibscbs ic on ic.id = n.id ' +
    'left join nfse_nfseref r on r.id = n.id ' +
    'left join nfse_subst s on s.id = n.id ' +
    'left join clientes cl on cl.cod_cliente = n.cod_cliente and cl.cod_empresa = n.cod_empresa ' +
    'left join tipo_servico ts on ts.cod_servico = n.cod_servico ' +
    'left join tiposerviconfse te on te.cod_tpservico = ts.nfs_servico ';
end;

function NFSeRepository.CriarNFSe(
  Input: NFSeEtd; const Sql, RecordId: string; Parameters: IParametersBuilder
): NFSeEtd;
var
  H: NFSeHistoricoEtd;
begin
  if not Assigned(Input.ParticipantePrincipal) then
    Input.CodCliente.SetNull()
  else if Input.IsEmissaoPropria then
    Input.ParticipantePrincipal.TipoPart := tprtTomador
  else
    Input.ParticipantePrincipal.TipoPart := tprtPrestador;

  if Assigned(Input.Intermediario) then
    Input.Intermediario.TipoPart := tprtIntermediario
  else
    Input.IntermediarioId.SetNull();

  if Assigned(Input.DestIbsCbs) then
    Input.DestIbsCbs.TipoPart := tprtDestIbsCbs
  else
    Input.DestIbsCbsId.SetNull();

  FConnection.ExecuteCommand( Sql, Parameters.Build() );

  if Assigned(Input.ParticipantePrincipal) then
    ExecuteUpserttDPSParticipante(recordId, Input.ParticipantePrincipal);

  if Assigned(Input.Intermediario) then
    ExecuteUpserttDPSParticipante(recordId, Input.Intermediario);

  if Assigned(Input.DestIbsCbs) then
    ExecuteUpserttDPSParticipante(recordId, Input.DestIbsCbs);

  //if Assigned(Input.IbsCbs) then
    //ExecuteUpsertNFSeIbsCbs(recordId, Input.IbsCbs);

  if Assigned(Input.Substituida) then
    ExecuteUpsertNFSeSubstituida(recordId, Input.Substituida);

  H := NFSeHistoricoEtd.Create(
    recordId, 0, DateTimeNullable.NullInstance(), Input.Situacao, thAlteracaoStatus, StringNullable.NullInstance()
  );
  try
    PostNFSeHistorico( H );
  finally
    H.Free();
  end;

  Result := GetNFSe(recordId, Input.CodEmpresa);
end;

function NFSeRepository.CriarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd;
var
  recordId: string;
  P: IParametersBuilder;
begin
  recordId := GenerateNewUUID();

  P := ParametersBuilder.Create(51);

  AplicarParametrosNFSeParaEmissao( recordId, Input, P );

  Result := CriarNFSe( Input, CriarSqlInsertNFSe(False), recordId, P );
end;

procedure NFSeRepository.CriarRelacionamento(const Input: NFSeOSEtd);
begin
  FConnection.ExecuteCommand(
    'INSERT INTO NFSE_OS ' +
    '(ID, NFSE_ID, NPED, TIPO, COD_EMPRESA, VSERV, VDESCINCOND, VRETIRRF, VRETCP, VRETPIS, VRETCOFINS, VRETCSLL, ' +
    'VRETISS ) ' +
    'VALUES ' +
    '(COALESCE((SELECT MAX(ID) FROM NFSE_OS ), 0) + 1, ' + //ID
    ':NFSE_ID, :NPED, :TIPO, :COD_EMPRESA, :VSERV, :VDESCINCOND, :VRETIRRF, :VRETCP, :VRETPIS, :VRETCOFINS, ' +
    ':VRETCSLL, :VRETISS ) ',
    ParametersBuilder.Create(4)
      .ByName( 'NFSE_ID', Input.NFSeId )
      .ByName( 'NPED', Input.NumPed )
      .ByName( 'TIPO', Input.Tipo )
      .ByName( 'COD_EMPRESA', Input.CodEmpresa )
      .ByNameC( 'VSERV', Input.VServicos )
      .ByNameC( 'VDESCINCOND', Input.VDescontos )
      .ByNameC( 'VRETIRRF', Input.VRetIrrf )
      .ByNameC( 'VRETCSLL', Input.VRetCsll )
      .ByNameC( 'VRETCP', Input.VRetCP )
      .ByNameC( 'VRETPIS', Input.VRetPis )
      .ByNameC( 'VRETCOFINS', Input.VRetCofins )
      .ByNameC( 'VRETISS', Input.VRetIss )
      .Build()
  );
  PostNFSeHistorico( NFSeHistoricoModel.Create( Input.NFSeId, Input.CodEmpresa, thLogHistorico,
    Format('Vinculada a O.S.: %d', [ Input.NumPed ])
  ));
end;

function NFSeRepository.CriarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd;
var
  recordId: string;
  P: IParametersBuilder;
begin
  recordId := GenerateNewUUID();

  P := ParametersBuilder.Create(56);

  AplicarParametrosNFSeParaEmissao( recordId, Input, P );
  AplicarParametrosNFSeEmitidaNoPortal( Input, P );

  Result := CriarNFSe( Input, CriarSqlInsertNFSe(True), recordId, P );
end;

function NFSeRepository.CriarSqlInsertNFSe(ComEmissaoPortal: Boolean): string;
begin
  Result :=
    'INSERT INTO NFSE ' +
    '(ID, SEQID, COD_EMPRESA, COD_CLIENTE, INTERMEDIARIO_ID, DEST_IBSCBS_ID, OP_INTERNA_ID, COD_SERVICO, LAYOUT_NFSE, ' +
    'SITUACAO, NATUREZA_EMISSAO, TPAMB, DHEMI, VERAPLIC, SERIE, NDPS, DCOMPET, CLOCPRESTACAO, FINNFSE, CINDOP, ' +
    'TPOPER, TPENTEGOV, INDDEST, CCNAE, CLC116, CTRIBNAC, CTRIBMUN, XDESCSERV, CNBS, VSERV, VDESCINCOND, TRIBISSQN, ' +
    'TPRETISSQN, ISS_PALIQ, ISS_VBC, VISS, PC_CST, PC_VBCPISCOFINS, PC_PALIQPIS, PC_PALIQCOFINS, PC_VPIS, ' +
    'PC_VCOFINS, TPRETPISCOFINS, VRETIRRF, VRETCSLL, VRETCP, VRETPIS, VRETCOFINS, PTOTTRIBFED, PTOTTRIBEST, ' +
    'PTOTTRIBMUN, INDTOTTRIB, PTOTTRIBSN, VLIQ, VTOTNF, VTOTALRET, ' +
    IfThen(ComEmissaoPortal,
    'NNFSE, CHAVE_NFSE, DHPROC, '
    ) +
    'DATA_CADASTRO, DATA_ALTERACAO) ' +
    'VALUES ' +
    '(:ID, ' +
    'COALESCE((SELECT MAX(SEQID) FROM NFSE WHERE COD_EMPRESA = :COD_EMPRESA), 0) + 1, ' +
    ':COD_EMPRESA, :COD_CLIENTE, :INTERMEDIARIO_ID, :DEST_IBSCBS_ID, :OP_INTERNA_ID, :COD_SERVICO, ' +
    ':LAYOUT_NFSE, :SITUACAO, :NATUREZA_EMISSAO, :TPAMB, :DHEMI, :VERAPLIC, :SERIE, :NDPS, :DCOMPET, :CLOCPRESTACAO, ' +
    ':FINNFSE, :CINDOP, :TPOPER, :TPENTEGOV, :INDDEST, :CCNAE, :CLC116, :CTRIBNAC, :CTRIBMUN, :XDESCSERV, :CNBS, ' +
    ':VSERV, :VDESCINCOND, :TRIBISSQN, :TPRETISSQN, :ISS_PALIQ, :ISS_VBC, :VISS, :PC_CST, :PC_VBCPISCOFINS, ' +
    ':PC_PALIQPIS, :PC_PALIQCOFINS, :PC_VPIS, :PC_VCOFINS, :TPRETPISCOFINS, :VRETIRRF, :VRETCSLL, :VRETCP, :VRETPIS, ' +
    ':VRETCOFINS, :PTOTTRIBFED, :PTOTTRIBEST, :PTOTTRIBMUN, :INDTOTTRIB, :PTOTTRIBSN, :VLIQ, :VTOTNF, :VTOTALRET, ' +
    IfThen(ComEmissaoPortal,
    ':NNFSE, :CHAVE_NFSE, :DHPROC, '
    ) +
    'CURRENT_TIMESTAMP, CURRENT_TIMESTAMP )';
end;

function NFSeRepository.CriarSqlUpdateNFSe(ComEmissaoPortal: Boolean): string;
begin
  Result :=
    'UPDATE NFSE SET ' +
    'COD_EMPRESA = :COD_EMPRESA, COD_CLIENTE = :COD_CLIENTE, INTERMEDIARIO_ID = :INTERMEDIARIO_ID, ' +
    'DEST_IBSCBS_ID = :DEST_IBSCBS_ID, OP_INTERNA_ID = :OP_INTERNA_ID, COD_SERVICO = :COD_SERVICO, ' +
    'LAYOUT_NFSE = :LAYOUT_NFSE, SITUACAO = :SITUACAO, NATUREZA_EMISSAO = :NATUREZA_EMISSAO, TPAMB = :TPAMB, ' +
    'DHEMI = :DHEMI, VERAPLIC = :VERAPLIC, SERIE = :SERIE, NDPS = :NDPS, DCOMPET = :DCOMPET, ' +
    'CLOCPRESTACAO = :CLOCPRESTACAO, FINNFSE = :FINNFSE, CINDOP = :CINDOP, TPOPER = :TPOPER, TPENTEGOV = :TPENTEGOV, ' +
    'INDDEST = :INDDEST, CCNAE = :CCNAE, CLC116 = :CLC116, CTRIBNAC = :CTRIBNAC, CTRIBMUN = :CTRIBMUN, ' +
    'XDESCSERV = :XDESCSERV, CNBS = :CNBS, VSERV = :VSERV, VDESCINCOND = :VDESCINCOND, TRIBISSQN = :TRIBISSQN, ' +
    'TPRETISSQN = :TPRETISSQN, ISS_PALIQ = :ISS_PALIQ, ISS_VBC = :ISS_VBC, VISS = :VISS, PC_CST = :PC_CST, ' +
    'PC_VBCPISCOFINS = :PC_VBCPISCOFINS, PC_PALIQPIS = :PC_PALIQPIS, PC_PALIQCOFINS = :PC_PALIQCOFINS, ' +
    'PC_VPIS = :PC_VPIS, PC_VCOFINS = :PC_VCOFINS, TPRETPISCOFINS = :TPRETPISCOFINS, VRETIRRF = :VRETIRRF, ' +
    'VRETCSLL = :VRETCSLL, VRETCP = :VRETCP, VRETPIS = :VRETPIS, VRETCOFINS = :VRETCOFINS, ' +
    'PTOTTRIBFED = :PTOTTRIBFED, PTOTTRIBEST = :PTOTTRIBEST, PTOTTRIBMUN = :PTOTTRIBMUN, INDTOTTRIB = :INDTOTTRIB, ' +
    'PTOTTRIBSN = :PTOTTRIBSN, VLIQ = :VLIQ, VTOTNF = :VTOTNF, VTOTALRET = :VTOTALRET, ' +
    IfThen(ComEmissaoPortal,
    'NNFSE = :NNFSE, CHAVE_NFSE = :CHAVE_NFSE, DHPROC = :DHPROC, '
    ) +
    'DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
    'WHERE ' +
    'ID = :ID'
end;

function NFSeRepository.PostNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd;
var
  recordId: string;
begin
  recordId := GenerateNewUUID();

  FConnection.ExecuteCommand(
    'INSERT INTO NFSE_EVENTOS ' +
    '(ID, NFSE_ID, TIPO_EVENTO, DATA_EVENTO, SITUACAO, VERAPLIC, CMOTIVO, XMOTIVO, DH_PROC, NSEQEVENTO) ' +
    'VALUES ' +
    '(:ID, :NFSE_ID, :TIPO_EVENTO, :DATA_EVENTO, :SITUACAO, :VERAPLIC, :CMOTIVO, :XMOTIVO, :DH_PROC, ' +
    ':NSEQEVENTO)',
    ParametersBuilder.Create(10)
      .ByName( 'ID', recordId )
      .ByName( 'NFSE_ID', Input.NFSeId )
      .ByName( 'TIPO_EVENTO', Ord( Input.TipoEvento ))
      .ByName( 'DATA_EVENTO', Input.DataEvento )
      .ByName( 'SITUACAO', Ord( Input.Situacao ))
      .ByName( 'VERAPLIC', Input.VerAplic )
      .ByName( 'CMOTIVO', Input.CMotivo )
      .ByName( 'XMOTIVO', Input.XMotivo )
      .ByName( 'DH_PROC', Input.DhProc )
      .ByName( 'NSEQEVENTO', Input.NSeqEvento )
      .Build()
  );

  Result := GetNFSeEvento( recordId );
end;

procedure NFSeRepository.PostNFSeHistorico(const Input: NFSeHistoricoModel);
begin
  FConnection.ExecuteCommand(
    'INSERT INTO NFSE_HISTORICO ' +
    '(NFSE_ID, SEQID, DATA_EVENTO, SITUACAO, TIPO_EVENTO, DESCRICAO) ' +
    'VALUES ' +
    '(:NFSE_ID, ' +
    '(COALESCE((SELECT MAX(SEQID) FROM NFSE_HISTORICO WHERE NFSE_ID = :NFSE_ID), 0) + 1), ' + //SEQID
    'CURRENT_TIMESTAMP, ' +
    '(SELECT SITUACAO FROM NFSE WHERE ID = :NFSE_ID AND COD_EMPRESA = :COD_EMPRESA), ' + // SITUACAO
    ':TIPO_EVENTO, :DESCRICAO) ',
    ParametersBuilder.Create(4)
      .ByName( 'NFSE_ID', Input.NFSeId )
      .ByName( 'COD_EMPRESA', Input.EmpresaId )
      .ByName( 'TIPO_EVENTO', Ord( Input.Tipo ))
      .ByName( 'DESCRICAO', Input.Descricao )
      .Build()
  );
end;

procedure NFSeRepository.PostNFSeHistorico(Input: NFSeHistoricoEtd);
begin
  FConnection.ExecuteCommand(
    'INSERT INTO NFSE_HISTORICO ' +
    '(NFSE_ID, SEQID, DATA_EVENTO, SITUACAO, TIPO_EVENTO, DESCRICAO) ' +
    'VALUES ' +
    '(:NFSE_ID, ' +
    '(COALESCE((SELECT MAX(SEQID) FROM NFSE_HISTORICO WHERE NFSE_ID = :NFSE_ID), 0) + 1), ' +
    'CURRENT_TIMESTAMP, :SITUACAO, :TIPO_EVENTO, :DESCRICAO) ',
    ParametersBuilder.Create(4)
      .ByName( 'NFSE_ID', Input.NFSeId )
      .ByName( 'SITUACAO', Ord(Input.Situacao ))
      .ByName( 'TIPO_EVENTO', Ord(Input.TipoEvento ))
      .ByName( 'DESCRICAO', Input.Descricao, 500 )
      .Build()
  );
end;

function NFSeRepository.AlterarNFSe(Input: NFSeEtd; const Sql: string; Parameters: IParametersBuilder): NFSeEtd;
begin
  if not Assigned(Input.ParticipantePrincipal) then
    Input.CodCliente.SetNull()
  else if Input.IsEmissaoPropria then
    Input.ParticipantePrincipal.TipoPart := tprtTomador
  else
    Input.ParticipantePrincipal.TipoPart := tprtPrestador;

  if Assigned(Input.Intermediario) then
    Input.Intermediario.TipoPart := tprtIntermediario
  else
    Input.IntermediarioId.SetNull();

  if Assigned(Input.DestIbsCbs) then
    Input.DestIbsCbs.TipoPart := tprtDestIbsCbs
  else
    Input.DestIbsCbsId.SetNull();

  FConnection.ExecuteCommand( Sql, Parameters.Build() );

  if Assigned(Input.ParticipantePrincipal) then
    ExecuteUpserttDPSParticipante(Input.Id, Input.ParticipantePrincipal)
  else if Input.IsEmissaoPropria then
    ExecuteDeleteNFSeParticipante(Input.Id, tprtTomador)
  else
    ExecuteDeleteNFSeParticipante(Input.Id, tprtPrestador);

  if Assigned(Input.Intermediario) then
    ExecuteUpserttDPSParticipante(Input.Id, Input.Intermediario)
  else
    ExecuteDeleteNFSeParticipante(Input.Id, tprtIntermediario);

  if Assigned(Input.DestIbsCbs) then
    ExecuteUpserttDPSParticipante(Input.Id, Input.DestIbsCbs)
  else
    ExecuteDeleteNFSeParticipante(Input.Id, tprtDestIbsCbs);

  if Assigned(Input.Substituida) then
    ExecuteUpsertNFSeSubstituida(Input.Id, Input.Substituida)
  else
    FConnection.ExecuteCommand(
      'DELETE FROM NFSE_SUBST ' +
      'WHERE ID = :ID ',
      ParametersBuilder.Create(1)
        .Add( Input.Id )
        .Build()
    );

  Result := GetNFSe(Input.Id, Input.CodEmpresa);
end;

function NFSeRepository.AlterarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd;
var
  P: IParametersBuilder;
begin
  P := ParametersBuilder.Create(56);

  AplicarParametrosNFSeParaEmissao( Input.Id, Input, P );
  AplicarParametrosNFSeEmitidaNoPortal( Input, P );

  Result := AlterarNFSe( Input, CriarSqlUpdateNFSe(True), P );
end;

function NFSeRepository.AlterarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd;
var
  P: IParametersBuilder;
begin
  P := ParametersBuilder.Create(51);

  AplicarParametrosNFSeParaEmissao( Input.Id, Input, P );

  Result := AlterarNFSe( Input, CriarSqlUpdateNFSe(False), P );
end;

function NFSeRepository.PutNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE_EVENTOS SET ' +
    'TIPO_EVENTO = :TIPO_EVENTO, DATA_EVENTO = :DATA_EVENTO, SITUACAO = :SITUACAO, VERAPLIC = :VERAPLIC, ' +
    'CMOTIVO = :CMOTIVO, XMOTIVO = :XMOTIVO, DH_PROC = :DH_PROC, NSEQEVENTO = :NSEQEVENTO ' +
    'WHERE ' +
    'ID = :ID ',
    ParametersBuilder.Create(9)
      .ByName( 'ID', Input.Id )
      .ByName( 'TIPO_EVENTO', Ord(Input.TipoEvento) )
      .ByName( 'DATA_EVENTO', Input.DataEvento )
      .ByName( 'SITUACAO', Ord(Input.Situacao) )
      .ByName( 'VERAPLIC', Input.VerAplic )
      .ByName( 'CMOTIVO', Input.CMotivo )
      .ByName( 'XMOTIVO', Input.XMotivo )
      .ByName( 'DH_PROC', Input.DhProc )
      .ByName( 'NSEQEVENTO', Input.NSeqEvento )
      .Build()
  );

  Result := GetNFSeEvento( Input.Id );
end;

procedure NFSeRepository.PutNFSeHistorico(const Input: NFSeUltimoHistoricoModel);
begin
  FConnection.ExecuteCommand(
    'UPDATE OR INSERT INTO NFSE_HISTORICO ' +
    '(NFSE_ID, SEQID, DATA_EVENTO, SITUACAO, TIPO_EVENTO, DESCRICAO) ' +
    'VALUES ' +
    '(:NFSE_ID, 0, CURRENT_TIMESTAMP, ' +
    '(SELECT SITUACAO FROM NFSE WHERE ID = :NFSE_ID AND COD_EMPRESA = :COD_EMPRESA), ' +
    ':TIPO_EVENTO, :DESCRICAO) ' +
    'MATCHING (NFSE_ID, SEQID)',
    ParametersBuilder.Create(4)
      .ByName( 'NFSE_ID', Input.NFSeId )
      .ByName( 'COD_EMPRESA', Input.EmpresaId )
      .ByName( 'TIPO_EVENTO', Ord( thLogHistorico ))
      .ByName( 'DESCRICAO', Input.Descricao )
      .Build()
  );
end;

procedure NFSeRepository.RemoverRelacionamento(const Input: NFSeOSEtd);
begin
  FConnection.ExecuteCommand(
    'DELETE FROM NFSE_OS ' +
    'WHERE NFSE_ID = :NFSE_ID AND NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(4)
      .ByName( 'NFSE_ID', Input.NFSeId )
      .ByName( 'NPED', Input.NumPed )
      .ByName( 'TIPO', Input.Tipo )
      .ByName( 'COD_EMPRESA', Input.CodEmpresa )
      .Build()
  );
  PostNFSeHistorico( NFSeHistoricoModel.Create( Input.NFSeId, Input.CodEmpresa, thLogHistorico,
    Format('Desvinculada a O.S.: %d', [ Input.NumPed ])
  ));
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarAutorizacaoModel): NFSeResumoModel;
var
  D: NFSeDocEtd;
  H: NFSeHistoricoEtd;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    ',CHAVE_NFSE = :CHAVE_NFSE ' +
    ',CVERIFICACAO = :CVERIFICACAO ' +
    ',CSTAT = :CSTAT ' +
    ',DHPROC = :DHPROC ' +
    ',NNFSE = :NNFSE ' +
    ',NDFSE = :NDFSE ' +
    ',VLIQ = :VLIQ ' +
    ',VTOTNF = :VTOTNF ' +
    ',ISS_PALIQ = :ISS_PALIQ ' +
    ',ISS_VBC = :ISS_VBC ' +
    ',VISS = :VISS ' +
    ',PREDUTOR = :PREDUTOR ' +
    ',VTOTALRET = :VTOTALRET ' +
    ',NPROTOCOLO = :NPROTOCOLO ' +
    'WHERE ID = :ID AND COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(18)
      .ByName('SITUACAO', Ord( sdpsAutorizada ))
      .ByName('CHAVE_NFSE', StringNullable.CreateOrNull( Input.NFSeResponse.ChaveNFSe ), 50 )
      .ByName('CVERIFICACAO', Input.NFSeResponse.CodigoVerificacao, 16 )
      .ByName('CSTAT', Input.NFSeResponse.cStat, 4 )
      .ByName('DHPROC', Input.NFSeResponse.DataProcessamento )
      .ByNameI64('NNFSE', Input.NFSeResponse.NumeroNFSe )
      .ByName('NDFSE', Input.NFSeResponse.NumeroDFSe )
      .ByNameC('VLIQ', Input.NFSeResponse.Valores.ValorLiquido )
      .ByNameC('VTOTNF', NumberService.Default( Input.NFSeResponse.Valores.ValotTotalNF, Input.NFSeResponse.Valores.ValorLiquido ))
      .ByName('ISS_PALIQ', Input.NFSeResponse.Valores.AliquotaISS )
      .ByName('ISS_VBC', Input.NFSeResponse.Valores.BaseCalculoISS )
      .ByName('VISS', Input.NFSeResponse.Valores.ValorISS )
      .ByName('PREDUTOR', Input.NFSeResponse.PercentualRedutor )
      .ByNameC('VTOTALRET', Input.NFSeResponse.Valores.ValorTotalRetencoes )
      .ByName( 'NPROTOCOLO', Input.NFSeResponse.Protocolo )
      .ByName('ID', Input.Id )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .Build()
  );

  D := nil;
  if not Input.NFSeResponse.XmlAutorizacao.IsNullOrWhiteSpace() then
    D := NFSeDocEtd.Create(
      Input.Id,
      tdocXmlAutorizacao,
      DateTimeNullable.Create(Input.NFSeResponse.DataProcessamento),
      Input.NFSeResponse.XmlAutorizacao.Value
    );

  H := NFSeHistoricoEtd.Create(
    Input.Id,
    0,
    DateTimeNullable.Create(Input.NFSeResponse.DataProcessamento),
    sdpsAutorizada,
    thAlteracaoStatus,
    StringNullable.Create('Autorização via Portal')
  );
  try
    Result := GetResumoNFSe( Input.Id );

    if Result.NaturezaEmissao = nemtPrestadorWS then
      H.Descricao.SetValue('Autorização via WebService');

    if D <> nil then
      AtualizarDocNFSe( D );

    PostNFSeHistorico( H );
  finally
    D.Free();
    H.Free();
  end;
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarAutorizadaNoPortalModel): NFSeResumoModel;
var
  H: NFSeHistoricoEtd;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    'WHERE ID = :ID AND COD_EMPRESA = :COD_EMPRESA AND NATUREZA_EMISSAO <> :NATUREZA_EMISSAO',
    ParametersBuilder.Create(4)
      .ByName('SITUACAO', Ord( sdpsAutorizada ))
      .ByName('ID', Input.Id )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .ByName('NATUREZA_EMISSAO', Ord( nemtPrestadorWS ))
      .Build()
  );
  Result := GetResumoNFSe( Input.Id );

  if Result.Situacao = sdpsAutorizada then
  begin
    H := NFSeHistoricoEtd.Create(
      Input.Id,
      0,
      DateTimeNullable.NullInstance(),
      sdpsAutorizada,
      thAlteracaoStatus,
      StringNullable.Create('Autorização via Portal')
    );
    try
      PostNFSeHistorico( H );
    finally
      H.Free();
    end;
  end;
end;

function NFSeRepository.AtualizarEventoNFSe(const Input: NFSeAtualizarSituacaoEventoModel;
  Situacao: SituacaoNFSeEnum): NFSeEventoResumoModel;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE_EVENTOS ' +
    ' SET SITUACAO = :P0 ' +
    'WHERE ID = :P1 and NFSE_ID = :P2',
    ParametersBuilder.Create(3)
      .Add( Ord( Situacao ))
      .Add( Input.EventoId)
      .Add( Input.NFSeId)
      .Build()
  );
  Result := GetResumoEventoNFSe( Input.NFSeId, Input.EventoId );
end;

function NFSeRepository.AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmEmissaoModel): NFSeEventoResumoModel;
var
  H: NFSeHistoricoEtd;
begin
  Result := AtualizarEventoNFSe( Input, sdpsEmissao );

  H := NFSeHistoricoEtd.Create(
    Input.NFSeId,
    0,
    DateTimeNullable.NullInstance(),
    sdpsAutorizada,
    thEvento,
    StringNullable.Create(
      Format('%s - %s', [ TipoEventoNFSeEnumStr[Result.TipoEvento], SituacaoNFSeEnumStr[sdpsEmissao] ])
    )
  );
  try
    PostNFSeHistorico( H );
  finally
    H.Free();
  end;
end;

function NFSeRepository.AtualizarEventoNFSe(const Input: NFSeAtualizarEventoRejeicaoModel): NFSeEventoResumoModel;
var
  H: NFSeHistoricoEtd;
begin
  Result := AtualizarEventoNFSe( Input, sdpsRejeicao );
  H := NFSeHistoricoEtd.Create(
    Input.NFSeId,
    0,
    DateTimeNullable.NullInstance(),
    sdpsAutorizada,
    thEvento,
    StringNullable.Create(Format('%s - %s: %s', [
      TipoEventoNFSeEnumStr[Result.TipoEvento], SituacaoNFSeEnumStr[sdpsRejeicao], Input.Historico
    ]))
  );
  try
    PostNFSeHistorico( H );
  finally
    H.Free();
  end;
end;

function NFSeRepository.AtualizarEventoNFSe(
  const Input: NFSeAtualizarEventoEmProcessamentoModel): NFSeEventoResumoModel;
var
  H: NFSeHistoricoEtd;
begin
  Result := AtualizarEventoNFSe( Input, sdpsEmProcessamento );
  H := NFSeHistoricoEtd.Create(
    Input.NFSeId,
    0,
    DateTimeNullable.NullInstance(),
    sdpsAutorizada,
    thEvento,
    StringNullable.Create(Format('%s - %s', [
      TipoEventoNFSeEnumStr[Result.TipoEvento], SituacaoNFSeEnumStr[sdpsEmProcessamento]
    ]))
  );
  try
    PostNFSeHistorico( H );
  finally
    H.Free();
  end;
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarNumeroRPSModel): NFSeEtd;
var
  Q: QueryResult;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'NDPS = (SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, :TABELA )) ' +
    ',SERIE = :SERIE ' +
    ',DHEMI = :DHEMI ' +
    'WHERE ID = :ID AND COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(5)
      .ByName('TABELA', 'RPS' )
      .ByName('SERIE', Input.Serie )
      .ByName('DHEMI', Input.DataEmissao )
      .ByName('ID', Input.Id)
      .ByName('COD_EMPRESA', Input.EmpresaId)
      .Build()
  );

  Result := GetNFSe(Input.Id, Input.EmpresaId);
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarReverterSubstituicaoPortalModel): NFSeResumoModel;
var
  H: NFSeHistoricoEtd;
  S: StringNullable;
begin
  S.SetNull();

  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    ',CANC_ORIGEM = :CANC_ORIGEM ' +
    ',DHCANC = :DHCANC ' +
    'WHERE ID = :ID ',
    ParametersBuilder.Create(4)
      .ByName('SITUACAO', Ord( sdpsAutorizada ))
      .ByName('CANC_ORIGEM', S )
      .ByName('DHCANC', S )
      .ByName('ID', Input.Id)
      .Build()
  );

  S := StringNullable.Create('Revertido Substituição via Portal');

  H := NFSeHistoricoEtd.Create(
    Input.Id, 0, DateTimeNullable.NullInstance(), sdpsAutorizada, thAlteracaoStatus, S
  );
  try
    PostNFSeHistorico( H );

    Result := GetResumoNFSe( Input.Id );

  finally
    H.Free();
  end;
end;

procedure NFSeRepository.AtualizarRetencoesNFSeOS(const Input: NFSeOSEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: NFSeOSEtd;
begin
  SetLength(ParamsList, Input.Count);
  for I := 0 to Input.Count - 1 do
  begin
    Dado := NFSeOSEtd(Input.Items[I]);

    ParamsList[I] := ParametersBuilder.Create(6)
      .ByNameC('VRETIRRF', Dado.VRetIrrf)
      .ByNameC('VRETCSLL', Dado.VRetCsll)
      .ByNameC('VRETCP', Dado.VRetCP)
      .ByNameC('VRETPIS', Dado.VRetPis)
      .ByNameC('VRETCOFINS', Dado.VRetCofins)
      .ByNameC('VRETISS', Dado.VRetIss)
      .ByName('ID', Dado.Id)
      .ByName('NFSE_ID', Dado.NFSeId)
      .ByName('NPED', Dado.NumPed)
      .ByName('TIPO', Dado.Tipo)
      .ByName('COD_EMPRESA', Dado.CodEmpresa)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'UPDATE NFSE_OS SET ' +
    'VRETIRRF = :VRETIRRF, VRETCSLL = :VRETCSLL, VRETCP = :VRETCP, VRETPIS = :VRETPIS, VRETCOFINS = :VRETCOFINS, ' +
    'VRETISS = :VRETISS ' +
    'WHERE ID = :ID AND NFSE_ID = :NFSE_ID AND NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA',
    ParamsList
  );
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarCancPorSubstuicaoModel): NFSeResumoModel;
var
  H: NFSeHistoricoEtd;
  S: StringNullable;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    ',CANC_ORIGEM = :CANC_ORIGEM ' +
    ',DHCANC = :DHCANC ' +
    'WHERE ID = :ID ',
    ParametersBuilder.Create(4)
      .ByName('SITUACAO', Ord( sdpsSubstituida ))
      .ByName('CANC_ORIGEM', Ord( Input.Origem ))
      .ByName('DHCANC', Input.DataProcessamento )
      .ByName('ID', Input.Id)
      .Build()
  );
  S := StringNullable.Create(
    Input.Substituta + ' / Substituição via ' + IfThen(Input.Origem = ocnWebService, 'WebService', 'Portal')
  );

  H := NFSeHistoricoEtd.Create(
    Input.Id, 0, DateTimeNullable.NullInstance(), sdpsSubstituida, thAlteracaoStatus, S
  );
  try
    PostNFSeHistorico( H );

    Result := GetResumoNFSe( Input.Id );

  finally
    H.Free();
  end;
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarReverterCancelamentoPortalModel): NFSeResumoModel;
var
  H: NFSeHistoricoEtd;
  S: StringNullable;
  E: NFSeAtualizarSituacaoEventoModel;
  EveRes: NFSeEventoResumoModel;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    //',CANC_ORIGEM = :CANC_ORIGEM ' +
    ',DHCANC = :DHCANC ' +
    'WHERE ID = :ID ',
    ParametersBuilder.Create(4)
      .ByName('SITUACAO', Ord( sdpsAutorizada ))
      //.ByName('CANC_ORIGEM', IntegerNullable.NullInstance() )
      .ByName('DHCANC', DateTimeNullable.NullInstance() )
      .ByName('ID', Input.NFSeId)
      .Build()
  );

  S := StringNullable.Create('Revertido Cancelamento via Portal');

  H := NFSeHistoricoEtd.Create(
    Input.NFSeId, 0, DateTimeNullable.NullInstance(), sdpsAutorizada, thAlteracaoStatus, S
  );
  E := NFSeAtualizarSituacaoEventoModel.Create( Input.NFSeId, Input.EventoId );
  try
    EveRes := AtualizarEventoNFSe( E, sdpsRascunho );

    PostNFSeHistorico( H );

    Result := GetResumoNFSe( Input.NFSeId );

  finally
    E.Free();
    H.Free();
  end;
end;


function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarReverterAutorizacaoPortalModel): NFSeResumoModel;
var
  H: NFSeHistoricoEtd;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    'WHERE ID = :ID AND COD_EMPRESA = :COD_EMPRESA AND NATUREZA_EMISSAO <> :NATUREZA_EMISSAO',
    ParametersBuilder.Create(4)
      .ByName('SITUACAO', Ord( sdpsRascunho ))
      .ByName('ID', Input.Id )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .ByName('NATUREZA_EMISSAO', Ord( nemtPrestadorWS ))
      .Build()
  );
  Result := GetResumoNFSe( Input.Id );

  if Result.Situacao = sdpsRascunho then
  begin
    H := NFSeHistoricoEtd.Create(
      Input.Id,
      0,
      DateTimeNullable.NullInstance(),
      sdpsRascunho,
      thAlteracaoStatus,
      StringNullable.Create('Revertida Autorização do Portal')
    );
    try
      PostNFSeHistorico( H );
    finally
      H.Free();
    end;
  end;
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarCancelamentoModel): NFSeResumoModel;
var
  D: NFSeDocEtd;
  H: NFSeHistoricoEtd;
  S: StringNullable;
  E: NFSeAtualizarSituacaoEventoModel;
  EveRes: NFSeEventoResumoModel;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    ',CANC_ORIGEM = :CANC_ORIGEM ' +
    ',DHCANC = :DHCANC ' +
    'WHERE ID = :ID ',
    ParametersBuilder.Create(4)
      .ByName('SITUACAO', Ord( sdpsCancelada ))
      .ByName('CANC_ORIGEM', Ord( Input.NFSeResponse.Origem ))
      .ByName('DHCANC', Input.NFSeResponse.DataProcessamento )
      .ByName('ID', Input.NFSeId)
      .Build()
  );

  D := nil;
  if (Input.NFSeResponse.Origem = ocnWebService) and not Input.NFSeResponse.XmlCancelamento.IsNullOrWhiteSpace then
    D := NFSeDocEtd.Create(
      Input.NFSeId,
      tdocXmlCancAutorizacao,
      DateTimeNullable.Create(Input.NFSeResponse.DataProcessamento),
      Input.NFSeResponse.XmlCancelamento.Value
    );

  S := StringNullable.Create('Cancelamento via Portal', Input.NFSeResponse.Origem <> ocnPortalWebSite);

  H := NFSeHistoricoEtd.Create(
    Input.NFSeId, 0, DateTimeNullable.NullInstance(), sdpsCancelada, thAlteracaoStatus, S
  );
  E := NFSeAtualizarSituacaoEventoModel.Create( Input.NFSeId, Input.EventoId );
  try
    EveRes := AtualizarEventoNFSe( E, sdpsAutorizada );

    if D <> nil then
     AtualizarDocNFSe( D );

    PostNFSeHistorico( H );

    Result := GetResumoNFSe( Input.NFSeId );

  finally
    D.Free();
    E.Free();
    H.Free();
  end;
end;

function NFSeRepository.AtualizarEventoNFSe(const Input: NFSeAtualizarEventoFalhaModel): NFSeEventoResumoModel;
var
  D: NFSeDocEtd;
  H: NFSeHistoricoEtd;
begin
  Result := AtualizarEventoNFSe( Input, sdpsEmissao );

  if Input.Documento <> '' then
    D := NFSeDocEtd.Create( Input.NFSeId, tdocXmlCancEnvio, DateTimeNullable.NullInstance(), Input.Documento );

  H := NFSeHistoricoEtd.Create(
    Input.NFSeId,
    0,
    D.DataEvento,
    sdpsAutorizada,
    thEvento,
    StringNullable.Create(
      Format('%s - %s', [ TipoEventoNFSeEnumStr[Result.TipoEvento], SituacaoNFSeEnumStr[sdpsEmissao] ])
    )
  );
  try
    AtualizarDocNFSe( D );
    PostNFSeHistorico( H );
  finally
    D.Free();
    H.Free();
  end;
end;

function NFSeRepository.AtualizarNFSe(const Input: NFSeAtualizarExcluirRascunhoModel): NFSeResumoModel;
begin
  FConnection.ExecuteCommand(
    'UPDATE NFSE SET ' +
    'SITUACAO = :SITUACAO ' +
    'WHERE ID = :ID AND COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(3)
      .ByName('SITUACAO', Ord( sdpsExcluido ))
      .ByName('ID', Input.Id )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .Build()
  );
  Result := GetResumoNFSe( Input.Id );
end;

end.
