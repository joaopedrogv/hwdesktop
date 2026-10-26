unit AtualizarSituacaoNFSeServiceUnit;

interface

uses
  IAtualizarSituacaoNFSeServiceUnit,
  NFSeAtualizarSituacaoTypesUnit,
  INFSeRepositoryUnit,
  NFSeEtdUnit,
  NFSeResponseTypesUnit, NFSeEventoModelUnit, NFSeTypesUnit, DateTimeServiceUnit, ITributosDFeRepositoryUnit,
  TributoDFeContextEtdUnit, IPedVendaRepositoryUnit, NFSeOSEtdUnit, IFormasPagamentoRepositoryUnit,
  IControleCreditosRepositoryUnit, NFSeResumoModelUnit, IRatearRetencoesNFSeOSServiceUnit;

type
  AtualizarSituacaoNFSeService = class(TInterfacedObject, IAtualizarSituacaoNFSeService)
  private
    FNFSeRepo: INFSeRepository;
    FTribDFeRepo: ITributosDFeRepository;
    FPedVendaRepo: IPedVendaRepository;
    FFormasPagtoRepo: IFormasPagamentoRepository;
    FCreditosRepo: IControleCreditosRepository;
    FRateioRetenServ: IRatearRetencoesNFSeOSService;

    procedure ExecutarRateioRetencoes(const NFSe: NFSeEtd; const NFSeOSs: NFSeOSEtdList);
    procedure AtualizarOrdemServicoEmissaoNFSe(
      const NFSe: NFSeEtd; const NFSeOSs: NFSeOSEtdList; NumeroNFSe: Int64; DataProcessamento: TDateTime
    );
    function TransferirOrdemServsParaNFSeSubstituidora(const NFSe: NFSeEtd): NFSeOSEtdList;
    function ReverterTransferenciaOrdemServsParaNFSeSubstituida(const NFSe: NFSeEtd): NFSeOSEtdList;
    procedure RemoverDasOrdensServProcessamentoNFSe(const NFSe: NFSeResumoModel; const NFSeOSs: NFSeOSEtdList);
    procedure RemoverDasFormasPgtoVinculoNFSe(const NFSe: NFSeResumoModel; const NFSeOS: NFSeOSEtd);
    procedure AtualizarControleCreditos(ControleCreditoId: Integer; const NumeroDocumento: string);
  public
    constructor Create(
      NFSeRepo: INFSeRepository;
      TribDFeRepo: ITributosDFeRepository;
      PedVendaRepo: IPedVendaRepository;
      FormasPagtoRepo: IFormasPagamentoRepository;
      CreditosRepo: IControleCreditosRepository;
      RateioRetenServ: IRatearRetencoesNFSeOSService
    );
    procedure ExecutarAutorizacao(
      const NFSe: NFSeEtd;
      const Autorizacao: NFSeResponseAutorizacaoModel;
      const TribDFeResponse: TributoDFeContextEtd
    );
    procedure ExecutarSubstituicao(
      const NFSe: NFSeEtd;
      const Substituicao: NFSeResponseSubstituicaoModel;
      const TribDFeResponse: TributoDFeContextEtd
    );
    procedure ExecutarAutorizacaoViaPortal( const NFSe: NFSeEtd );
    procedure ExecutarCancelamento(
      const NFSeEvnt: NFSeEventoModel; const Cancelamento: NFSeResponseCancelamentoModel
    ); overload;
    procedure ExecutarCancelamento(
      const NFSeId: string; EmpresaId: Integer; const Cancelamento: NFSeResponseCancelamentoModel
    ); overload;
    procedure ExecutarExclusao(const Input: AtualizarSituacaoNFSeInput);
    procedure ExecutarReversaoAutorizacaoViaPortal( const NFSeId: string; EmpresaId: Integer );
  end;

implementation

{ AtualizarSituacaoNFSeService }

uses
  SysUtils, StrUtils, Math, DateUtils,
  NFSeEventoEtdUnit, VersaoAplicacaoUnit, StringNullableUnit, DateAndTimeNullableUnit, TributoDFeOrigemEnumUnit,
  UpdatePedvendaVinculoNFSeCommandsUnit, TipoComunsUnit, StringServiceUnit, UpdatePedvendaEmissaoNFSeCommandsUnit,
  IntegerNullableUnit, UpdatePedvendaVinculoNFSeSubstituidaCommandUnit, FormaPagamentoEtdUnit,
  UpdateFormaPagamentoVincularNFCommandsUnit, StatusRegistroEnumUnit, UpdateControleCreditoNumDocumentoCommandUnit,
  ControleCreditoEtdUnit, NumberServiceUnit;

procedure AtualizarSituacaoNFSeService.AtualizarControleCreditos(ControleCreditoId: Integer;
  const NumeroDocumento: string);
var
  Credito: ControleCreditoEtd;
begin
  if ControleCreditoId <= 0 then
    Exit;

  Credito := FCreditosRepo.GetByKey(ControleCreditoId);
  try
    if Credito <> nil then
      FCreditosRepo.AtualizarNumeroDocumento( UpdateControleCreditoNumDocumentoCommand.Create(
        Credito.CodCred, Credito.CodEmpresa, NumeroDocumento
      ));
  finally
    Credito.Free();
  end;
end;

procedure AtualizarSituacaoNFSeService.AtualizarOrdemServicoEmissaoNFSe(
  const NFSe: NFSeEtd; const NFSeOSs: NFSeOSEtdList; NumeroNFSe: Int64; DataProcessamento: TDateTime
);
var
  FormasPgto: FormaPagamentoEtdList;
  I, F, iNumNF: Integer;
  S, R: string;
  NDocParts: TArrayString;
begin
  for I := 0 to NFSeOSs.Count - 1 do
  begin
    FPedVendaRepo.AtualizarVinculoEmissaoNFSe( UpdatePedvendaEmissaoNFSeCommand.Create(
      NFSe.Id,
      NFSe.CodEmpresa,
      nfseOSs.Items[I].NumPed,
      Int64Nullable.Create(NumeroNFSe),
      NFSe.NDps,
      NFSe.DhEmi,
      DateTimeNullable.Create(DataProcessamento),
      NumberService.Default(NFSe.VTotNf.Value, NFSe.VLiq.Value)
    ));

    // Formas de pagamento
    FormasPgto := FFormasPagtoRepo.ListarPorNumeroVenda(NFSeOSs.Items[I].NumPed, NFSeOSs.Items[I].Tipo);
    try
      for F := 0 to FormasPgto.Count - 1 do
        if (FormasPgto.Items[F].Ativo = saAtivo) and FormasPgto.Items[F].NumNota.IsNull then
        begin
          // Ajustando o numero da nota para casos que tem o ANO no numero, os ultimos 6 correspondem ao numero
          S := IntToStr(NumeroNFSe);
          if Length(S) > 6 then
            System.Delete(S, 1, Length(S) - 6);

          iNumNF := StrToIntDef(S, 0);
          if iNumNF > 0 then
          begin
            // Separando o numero do documento da parcerla e alterando a parte que corresponde ao numero da venda
            NDocParts := StringService.Split( ['-'], FormasPgto.Items[F].NDoc.Value );
            if Length(NDocParts) = 2 then
            begin
              NDocParts[0] := StringService.PadLeft( IntToStr(iNumNF), 6, '0');
              S := StringService.Join('-', NDocParts );
            end
            else
              S := FormasPgto.Items[F].NDoc.Value;

            FFormasPagtoRepo.VincularNotaFiscal( UpdateFormaPagamentoVincularNFCommand.Create(
              FormasPgto.Items[F].SeqForm, FormasPgto.Items[F].CodEmpresa, iNumNF, YearOf(NFSe.DhEmi.Value), S
            ));

            // Alterando Credito vinculado a forma de pagamento quando já foi processado
            if (FormasPgto.Items[F].TipDoc.Value = 'S2') and (FormasPgto.Items[F].Prcss.Value = 'S') then
              AtualizarControleCreditos( FormasPgto.Items[F].NProcessamento.Value, S );
          end;
        end;
    finally
      FormasPgto.Free();
    end;
  end;
end;

constructor AtualizarSituacaoNFSeService.Create(
  NFSeRepo: INFSeRepository;
  TribDFeRepo: ITributosDFeRepository;
  PedVendaRepo: IPedVendaRepository;
  FormasPagtoRepo: IFormasPagamentoRepository;
  CreditosRepo: IControleCreditosRepository;
  RateioRetenServ: IRatearRetencoesNFSeOSService
);
begin
  FNFSeRepo := NFSeRepo;
  FTribDFeRepo := TribDFeRepo;
  FPedVendaRepo := PedVendaRepo;
  FFormasPagtoRepo := FormasPagtoRepo;
  FCreditosRepo := CreditosRepo;
  FRateioRetenServ := RateioRetenServ;
end;

procedure AtualizarSituacaoNFSeService.ExecutarAutorizacao(
  const NFSe: NFSeEtd;
  const Autorizacao: NFSeResponseAutorizacaoModel;
  const TribDFeResponse: TributoDFeContextEtd
);
var
  atualizacaoStatus: NFSeAtualizarAutorizacaoModel;
  nfseOSs: NFSeOSEtdList;
  I: Integer;
begin
  // Atualizaçao de dados apenas quando a NFSe está em emissão
  if NFSe.Situacao in [sdpsRascunho, sdpsRejeicao, sdpsEmissao, sdpsEmProcessamento ] then
  begin
    // Objeto que contém os dados da NFSe para atualização
    atualizacaoStatus := NFSeAtualizarAutorizacaoModel.Create(
      NFSe.Id,
      NFSe.CodEmpresa,
      Autorizacao
    );
    try
      {$REGION 'Tratando vBC, pAliqISS e VISS quando não presentes no XML, preserva o da nota'}

      if atualizacaoStatus.NFSeResponse.Valores.BaseCalculoISS.IsNull
        and atualizacaoStatus.NFSeResponse.Valores.AliquotaISS.IsNull
        and atualizacaoStatus.NFSeResponse.Valores.ValorISS.IsNull then
      begin
        if NFSe.IssVBC.HasValue then
          atualizacaoStatus.NFSeResponse.Valores.BaseCalculoISS.SetValue(NFSe.IssVBC.Value);
        if NFSe.IssPAliq.HasValue then
          atualizacaoStatus.NFSeResponse.Valores.AliquotaISS.SetValue(NFSe.IssPAliq.Value);
        if NFSe.VIss.HasValue then
          atualizacaoStatus.NFSeResponse.Valores.ValorISS.SetValue(NFSe.VIss.Value);
      end;

      {$ENDREGION}

      // Atualiza os campos retornados do webservice
      FNFSeRepo.AtualizarNFSe( atualizacaoStatus );

      // Atualiza os tributos da RTC
      if TribDFeResponse <> nil then
      begin
        TribDFeResponse.Id := NFSe.Id;
        TribDFeResponse.Origem := tdfoNFSe;
        FTribDFeRepo.Post( TribDFeResponse );
      end;
    finally
      atualizacaoStatus.Free();
    end;

    // Transfere de uma NFSe para outra se for substituiçãp
    nfseOSs := TransferirOrdemServsParaNFSeSubstituidora( NFSe );
    try
      // Obtém o relacionamento caso nao existiu substituição
      if nfseOSs = nil then
        nfseOSs := FNFSeRepo.ListarRelacionamento( NFSe.Id );

      // Atualiza os valores de retençoes
      ExecutarRateioRetencoes( NFSe, nfseOSs );

      // Atualização dos dados da NFSe na Ordem de Servico
      AtualizarOrdemServicoEmissaoNFSe( NFSe, nfseOSs, Autorizacao.NumeroNFSe, Autorizacao.DataProcessamento );

    finally
      nfseOSs.Free();
    end;
  end;
end;

procedure AtualizarSituacaoNFSeService.ExecutarAutorizacaoViaPortal(const NFSe: NFSeEtd);
var
  Substituicao: NFSeResponseSubstituicaoModel;
begin
  // Apesar do metodo ser AutorizacaoViaPortal, ele serve para fazer a substituição também
  // Caso o objeto tenha a substituicao ela será feita, caso contrario o metodo de substituição que é chamado
  // executa apenas a autorização

  Substituicao := NFSeResponseSubstituicaoModel.Create(
    NFSeResponseAutorizacaoModel.Create(
      NFSe.ChaveNFSe.Value,
      NFSe.CVerificacao,
      IfThen( Assigned(NFSe.Substituida) and not NFSe.Substituida.SubstituidaId.IsNullOrWhiteSpace(), '101', '100' ),
      DateTimeService.Default(NFSe.DhProc.Value, NFSe.DhEmi.Value),
      NFSe.NNFSe.Value,
      NFSe.NDFSe,
      NFSeResponseAutorizacaoValoresModel.Create(
        NFSe.VLiq.Value,
        NFSe.VTotNf.Value,
        NFSe.VTotalRet.Value,
        NFSe.IssVBC,
        NFSe.IssPAliq,
        NFSe.VIss
      ),
      NFSe.PRedutor,
      NFSe.NProtocolo,
      {ChaveNFSeSubstituida} '', // Nao existe essa campo no repositorio
      {XmlAutorizacao} StringNullable.NullInstance()
    ),
    NFSeResponseCancelamentoModel.Create(
      DateTimeService.Default(NFSe.DhProc.Value, NFSe.DhEmi.Value),
      IntegerNullable.NullInstance(),
      StringNullable.NullInstance(),
      ocnPortalWebSite
    )
  );
  try
    Self.ExecutarSubstituicao( NFSe, Substituicao, nil ); // Nao precisa passar o TribDFe, ela já ta pronto
  finally
    Substituicao.Free();
  end;
end;

procedure AtualizarSituacaoNFSeService.ExecutarSubstituicao(
  const NFSe: NFSeEtd;
  const Substituicao: NFSeResponseSubstituicaoModel;
  const TribDFeResponse: TributoDFeContextEtd
);
var
  substSituacao: NFSeAtualizarCancPorSubstuicaoModel;
  substituida: NFSeEtd;
  I: Integer;
begin
  substSituacao := nil;
  substituida := nil;
  try
    // Executa a autorização
    Self.ExecutarAutorizacao( NFSe, Substituicao.Autorizacao, TribDFeResponse );

    if (NFSe.Substituida = nil) or not NFSe.Substituida.SubstituidaId.HasValue then
      Exit;

    // Obtem a nota substituida para efetuar o cancelamento
    substituida := FNFSeRepo.GetNFSe( NFSe.Substituida.SubstituidaId.Value, NFSe.CodEmpresa );

    // Efetua o cancelamento por substituição
    if substituida.Situacao = sdpsAutorizada then
    begin
      substSituacao := NFSeAtualizarCancPorSubstuicaoModel.Create(
        NFSe.Substituida.SubstituidaId.Value,
        NFSe.CodEmpresa,
        Substituicao.Cancelamento.Origem,
        Substituicao.Autorizacao.DataProcessamento,
        Format('NFSe %d - %s', [
          Substituicao.Autorizacao.NumeroNFSe, DateTimeService.ParseLocal(Substituicao.Autorizacao.DataProcessamento)
        ])
      );

      FNFSeRepo.AtualizarNFSe( substSituacao );
    end;
  finally
    substSituacao.Free();
    substituida.Free();
  end;
end;

procedure AtualizarSituacaoNFSeService.RemoverDasFormasPgtoVinculoNFSe(const NFSe: NFSeResumoModel;
  const NFSeOS: NFSeOSEtd);
var
  FormasPgto: FormaPagamentoEtdList;
  I, iNumNF: Integer;
  NDocParts: TArrayString;
  S: string;
begin
  if NFSe.NNFSe.IsNull or (NFSe.NNFSe.Value < 0) then
    Exit;

  FormasPgto := FFormasPagtoRepo.ListarPorNumeroVenda(NFSeOS.NumPed, NFSeOS.Tipo);
  try
    for I := 0 to FormasPgto.Count - 1 do
      if (FormasPgto.Items[I].Ativo = saAtivo)
        and not FormasPgto.Items[I].NumNota.IsNull
        and not FormasPgto.Items[I].NRequisicao.IsNull then
      begin
        // Ajustando o numero da nota para casos que tem o ANO no numero, os ultimos 6 correspondem ao numero
        S := IntToStr(NFSe.NNFSe.Value);
        if Length(S) > 6 then
          System.Delete(S, 1, Length(S) - 6);

        iNumNF := StrToIntDef(S, 0);
        if (iNumNF > 0)
          and (FormasPgto.Items[I].NumNota.Value = iNumNF)
          and (FormasPgto.Items[I].SubSerie.Value = YearOf(NFSe.DhEmi.Value)) then
        begin
          // Separando o numero do documento da parcerla e alterando a parte que corresponde ao numero da venda
          NDocParts := StringService.Split( ['-'], FormasPgto.Items[I].NDoc.Value );
          if Length(NDocParts) = 2 then
          begin
            NDocParts[0] := StringService.PadLeft( IntToStr(FormasPgto.Items[I].NRequisicao.Value), 6, '0');
            S := StringService.Join('-', NDocParts );
          end
          else
            S := FormasPgto.Items[I].NDoc.Value;

          FFormasPagtoRepo.DesvincularNotaFiscal( UpdateFormaPagamentoDesvincularNFCommand.Create(
            FormasPgto.Items[I].SeqForm, FormasPgto.Items[I].CodEmpresa, S
          ));

          // Alterando Credito vinculado a forma de pagamento quando já foi processado
          if (FormasPgto.Items[I].TipDoc.Value = 'S2') and (FormasPgto.Items[I].Prcss.Value = 'S') then
            AtualizarControleCreditos( FormasPgto.Items[I].NProcessamento.Value, S );
        end;
      end;
  finally
    FormasPgto.Free();
  end;
end;

procedure AtualizarSituacaoNFSeService.RemoverDasOrdensServProcessamentoNFSe(const NFSe: NFSeResumoModel; const NFSeOSs: NFSeOSEtdList);
var
  FormasPgto: FormaPagamentoEtdList;
  I, F, iNumNF: Integer;
  NDocParts: TArrayString;
  S: string;
begin
  for I := 0 to NFSeOSs.Count - 1 do
  begin
    FPedVendaRepo.RemoverVinculoComNFSe( UpdatePedvendaRemoverVinculoNFSeCommand.Create(
      NFSeOSs.Items[I].NumPed, NFSeOSs.Items[I].CodEmpresa, NFSeOSs.Items[I].NFSeId
    ));

    FNFSeRepo.RemoverRelacionamento( NFSeOSs.Items[I] );

    RemoverDasFormasPgtoVinculoNFSe( NFSe, NFSeOSs.Items[I] );
  end;
end;

function AtualizarSituacaoNFSeService.ReverterTransferenciaOrdemServsParaNFSeSubstituida(
  const NFSe: NFSeEtd): NFSeOSEtdList;
var
  I: Integer;
begin
  Result := nil;
  if (NFSe.Substituida <> nil) and not NFSe.Substituida.SubstituidaId.IsNullOrWhiteSpace then
  begin
    Result := FNFSeRepo.ListarRelacionamento(nfse.Id);
    for I := 0 to Result.Count - 1 do
    begin
      FNFSeRepo.RemoverRelacionamento( Result.Items[I] );
      Result.Items[I].NFSeId := NFSe.Substituida.SubstituidaId.Value;
      FNFSeRepo.CriarRelacionamento( Result.Items[I] );

      FPedVendaRepo.AtualizarVinculoNFSeSubstituicao( UpdatePedvendaVinculoNFSeSubstituidaCommand.Create(
        Result.Items[I].NumPed, Result.Items[I].CodEmpresa, NFSe.Id, NFSe.Substituida.SubstituidaId.Value
      ));
    end;
  end;
end;

function AtualizarSituacaoNFSeService.TransferirOrdemServsParaNFSeSubstituidora(const NFSe: NFSeEtd): NFSeOSEtdList;
var
  I: Integer;
begin
  Result := nil;
  if (NFSe.Substituida <> nil) and not NFSe.Substituida.SubstituidaId.IsNullOrWhiteSpace then
  begin
    Result := FNFSeRepo.ListarRelacionamento(nfse.Substituida.SubstituidaId.Value);
    for I := 0 to Result.Count - 1 do
    begin
      FNFSeRepo.RemoverRelacionamento( Result.Items[I] );
      Result.Items[I].NFSeId := NFSe.Id;
      FNFSeRepo.CriarRelacionamento( Result.Items[I] );

      FPedVendaRepo.AtualizarVinculoNFSeSubstituicao( UpdatePedvendaVinculoNFSeSubstituidaCommand.Create(
        Result.Items[I].NumPed, Result.Items[I].CodEmpresa, NFSe.Substituida.SubstituidaId.Value, NFSe.Id
      ));
    end;
  end;
end;

procedure AtualizarSituacaoNFSeService.ExecutarCancelamento(
  const NFSeEvnt: NFSeEventoModel; const Cancelamento: NFSeResponseCancelamentoModel
);
var
  cancSituacao: NFSeAtualizarCancelamentoModel;
  nfseOSs: NFSeOSEtdList;
  resumoNFSe: NFSeResumoModel;
begin
  // Input do Repositorio para o cancelamento
  cancSituacao := NFSeAtualizarCancelamentoModel.Create(
    NFSeEvnt.NFSeId,
    NFSeEvnt.Evento.Id,
    Cancelamento.Clone()
  );

  nfseOSs := FNFSeRepo.ListarRelacionamento( NFSeEvnt.NFSeId );
  try
    // Efetuando o cancelamento
    resumoNFSe := FNFSeRepo.AtualizarNFSe( cancSituacao );

    // Removendo vinculos e liberando O.S para novas emissões
    RemoverDasOrdensServProcessamentoNFSe( resumoNFSe, nfseOSs );

  finally
    cancSituacao.Free();
    nfseOSs.Free();
  end;
end;

procedure AtualizarSituacaoNFSeService.ExecutarCancelamento(
  const NFSeId: string; EmpresaId: Integer; const Cancelamento: NFSeResponseCancelamentoModel
);
var
  Evento: NFSeEventoModel;
  EveIn: NFSeEventoEtd;
begin
  Evento := FNFSeRepo.GetEventoNFSe( NFSeId, EmpresaId, tenCancelamento );
  try
    if Evento.Evento = nil then
    begin
      EveIn := NFSeEventoEtd.Create(
        '',
        NFSeId,
        tenCancelamento,
        Cancelamento.DataProcessamento,
        sdpsAutorizada,
        StringNullable.Create(VERSAO_APP_HW),
        StringNullable.NullInstance(),
        StringNullable.NullInstance(),
        DateTimeNullable.Create(Cancelamento.DataProcessamento),
        Cancelamento.NumSeqEvento
      );
      with FNFSeRepo.PostNFSeEvento( EveIn ) do
      try
        Evento := FNFSeRepo.GetEventoNFSe(Id);
      finally
        Free();
      end;
    end;

    // Chama o cancelamento dessa classe
    Self.ExecutarCancelamento( Evento, Cancelamento );

  finally
    EveIn.Free();
  end;
end;

procedure AtualizarSituacaoNFSeService.ExecutarExclusao(const Input: AtualizarSituacaoNFSeInput);
var
  nfseOSs: NFSeOSEtdList;
  nfseOS: NFSeOSEtd;
  tribIDs: TArrayString;
  resumoNFSe: NFSeResumoModel;
  I: Integer;
begin
  nfseOSs := FNFSeRepo.ListarRelacionamento( Input.NFSeId );
  try
    // Exclui logicamente o registro da NFSe via campo de situacao = sdpsExcluida
    resumoNFSe :=  FNFSeRepo.AtualizarNFSe( NFSeAtualizarExcluirRascunhoModel.Create( Input.NFSeId, Input.EmpresaId ));

    // Removendo vinculos e liberando O.S para novas emissões
    RemoverDasOrdensServProcessamentoNFSe( resumoNFSe, nfseOSs );

    // Exclui fisicamente o tributoDFe vinculado
    FTribDFeRepo.Delete( StringService.Split( [';'], Input.NFSeId), tdfoNFSe );

  finally
    nfseOSs.Free();
  end;
end;

procedure AtualizarSituacaoNFSeService.ExecutarRateioRetencoes(
  const NFSe: NFSeEtd; const NFSeOSs: NFSeOSEtdList
);
var
  HouveRateio: Boolean;
begin
  if NFSeOSs.Count = 0 then
    Exit;

  FRateioRetenServ.Executar( NFSe, NFSeOSs, HouveRateio );

  if HouveRateio then
    FNFSeRepo.AtualizarRetencoesNFSeOS( NFSeOSs );
end;

procedure AtualizarSituacaoNFSeService.ExecutarReversaoAutorizacaoViaPortal( const NFSeId: string; EmpresaId: Integer );
var
  reversaoAutorizacao: NFSeAtualizarReverterAutorizacaoPortalModel;
  reversaoSubstituicao: NFSeAtualizarReverterSubstituicaoPortalModel;
  nfseOSs: NFSeOSEtdList;
  nfse, substituida: NFSeEtd;
  evento: NFSeEventoModel;
  resumoNFSe: NFSeResumoModel;
  I: Integer;
begin
  nfseOSs := nil;
  substituida := nil;
  reversaoAutorizacao := NFSeAtualizarReverterAutorizacaoPortalModel.Create( NFSeId, EmpresaId );
  nfse := FNFSeRepo.GetNFSe( NFSeId, EmpresaId );
  try
    // Efetuando a reversao
    resumoNFSe := FNFSeRepo.AtualizarNFSe( reversaoAutorizacao );

    if (NFSe.Substituida <> nil) and not NFSe.Substituida.SubstituidaId.IsNullOrWhiteSpace() then
      substituida := FNFSeRepo.GetNFSe( NFSe.Substituida.SubstituidaId.Value, EmpresaId );

    // Nao existe substituicao
    if substituida = nil then
    begin
       // Desfaz a alteracao de num nf nos documentos
      nfseOSs := FNFSeRepo.ListarRelacionamento( NFSeId );
      for I := 0 to NFSeOSs.Count - 1 do
      begin
        FPedVendaRepo.RemoverVinculoComNFSe( UpdatePedvendaRemoverVinculoNFSeCommand.Create(
          NFSeOSs.Items[I].NumPed, NFSeOSs.Items[I].CodEmpresa, NFSeOSs.Items[I].NFSeId
        ));
        RemoverDasFormasPgtoVinculoNFSe( resumoNFSe, NFSeOSs.Items[I] );
      end;

      Exit;
    end;

    reversaoSubstituicao := NFSeAtualizarReverterSubstituicaoPortalModel.Create(
      substituida.Id, substituida.CodEmpresa
    );
    FNFSeRepo.AtualizarNFSe(reversaoSubstituicao);

    // Reverte a transferencia feita anteriormente
    nfseOSs := ReverterTransferenciaOrdemServsParaNFSeSubstituida( NFSe );
    // Obtém o relacionamento caso nao existiu substituição
    if nfseOSs = nil then
      nfseOSs := FNFSeRepo.ListarRelacionamento( NFSe.Id );

    // Atualiza os valores de retençoes de volta com os dados da nota anterior
    ExecutarRateioRetencoes( substituida, nfseOSs );

    // Atualização dos dados da NFSe na Ordem de Servico
    AtualizarOrdemServicoEmissaoNFSe( substituida, nfseOSs, substituida.NNFSe.Value, substituida.DhProc.Value );

  finally
    reversaoSubstituicao.Free();
    reversaoAutorizacao.Free();
    substituida.Free();
    nfseOSs.Free();
  end;
end;

end.
