(*
  Arquivo exclusivo Delphi com ACBR
*)
unit EmitirWsNFSeUseCaseUnit;

interface

uses
  NFSeComACBrUseCaseBaseUnit, ResultadoOperacaoDFeUnit, ResultadoExecucaoTransmissaoDFeOutputUnit,
  INFSeRepositoryUnit, ConfiguracaoNFSeServiceUnit, IErrorLoggerUnit, IACBrNFSeAdapterUnit, INFSeConverterUnit,
  IConfiguracaoNFSeServiceUnit, IEmpresasRepositoryUnit, IProgressObserverUnit, IDataBaseConnectionUnit,
  IAtualizarSituacaoNFSeServiceUnit, ITributosDFeRepositoryUnit, IEnviarEmailUseCaseUnit, IEmailComposerServiceUnit,
  TipoComunsUnit, ConfiguracaoNFSeModelUnit, NFSeResumoModelUnit, EmpresaEtdUnit, IConfiguracoesRepositoryUnit,
  ISessionContextUnit;

type
  ResultadoOperacaoDFeArray = TArrayInteger;

  EmitirLoteWsNFSeInput = record
  private
    NFSeIds: TArrayString;
    Emails: TArrayString;
    EmpresaId: Integer;
    Silent: Boolean;
  public
    class function Create(
      const NFSeIds: TArrayString;
      const Emails: TArrayString;
      EmpresaId: Integer;
      Silent: Boolean
    ): EmitirLoteWsNFSeInput; static;
  end;

  EmitirWsNFSeInput = record
  private
    NFSeId: string;
    Email: string;
    EmpresaId: Integer;
    Silent: Boolean;
  public
    class function Create(
      const NFSeId: string;
      const Email: string;
      EmpresaId: Integer;
      Silent: Boolean
    ): EmitirWsNFSeInput; static;
  end;

  IEmitirWsNFSeUseCase = interface
    ['{33B5D278-291F-4604-8DCE-EF753D199730}']
    function Executar(const Input: EmitirWsNFSeInput): ResultadoOperacaoDFe;
  end;

  IConsultarWsNFSeUseCase = interface
    ['{139FD389-B3B7-4378-93F4-2C6BE22C161B}']
    function Executar(const Input: EmitirWsNFSeInput): ResultadoOperacaoDFe;
  end;

  IEmitirLoteWsNFSeUseCase = interface
    ['{CF2AD889-6659-4E23-A236-C9595DB56963}']
    function Executar(const Input: EmitirLoteWsNFSeInput): ResultadoOperacaoDFeArray;
  end;

  EmissaoWsNFSeUseCase = class(NFSeComACBrUseCaseBase)
  private
    FSession: ISessionContext;
    FConfigRepo: IConfiguracoesRepository;
    FEmailFComposer: IEmailComposerService;
    FEnviarEmailUseCase: IEnviarEmailUseCase;
    FEmpresa: EmpresaEtd;
    FConfigNFSe: ConfiguracaoNFSeModel;
    FApenasConsultar: Boolean;
    FEmpresaId: Integer;
    FNFSeId: string;
    FEmails: string;
    FXmlsImpressao: TArrayString;
  private
    procedure Imprimir();
    procedure AddXMLImpressao(const XmlAutNFSe: string);
    function EnviarEmail(): ResultadoOperacaoDFe;
    function ExecutarConsulta(const ResumoNFSe: NFSeResumoModel; out PrecisaEmitir: Boolean): ResultadoOperacaoDFe;
    function ExecutarEmissao(): ResultadoOperacaoDFe;
    function Executar(): ResultadoOperacaoDFe; overload;
    function ExecutarLote(const Input: EmitirLoteWsNFSeInput): ResultadoOperacaoDFeArray; overload;
    function ExecutarIndividual(const Input: EmitirWsNFSeInput): ResultadoOperacaoDFe;
  public
    constructor Create(
      Session: ISessionContext;
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      EmpresasRepo: IEmpresasRepository;
      ConfigRepo: IConfiguracoesRepository;
      ConfNFSe: IConfiguracaoNFSeService;
      AtualizarSituacaoService: IAtualizarSituacaoNFSeService;
      ACBr: IACBrNFSeAdapter;
      NFSeConverter: INFSeConverter;
      EmailComposer: IEmailComposerService;
      EnviarEmailUseCase: IEnviarEmailUseCase;
      LogError: IErrorLogger;
      Observer: IProgressObserver
    );
  end;

  EmitirWsNFSeUseCase = class(EmissaoWsNFSeUseCase, IEmitirWsNFSeUseCase, IEmitirLoteWsNFSeUseCase)
  public
    function Executar(const Input: EmitirLoteWsNFSeInput): ResultadoOperacaoDFeArray; overload;
    function Executar(const Input: EmitirWsNFSeInput): ResultadoOperacaoDFe; overload;
  end;

  ConsultarWsNFSeUseCase = class(EmissaoWsNFSeUseCase, IConsultarWsNFSeUseCase)
  public
    function Executar(const Input: EmitirWsNFSeInput): ResultadoOperacaoDFe;
  end;

implementation

uses
  SysUtils, StrUtils, IOUtils,
  DpsEmitirModelUnit, ITransactionUnit, NFSeTypesUnit, NFSeModelUnit,
  NFSeAtualizarSituacaoTypesUnit, WebServiceResponseTypesUnit, NFSeEtdUnit, StringNullableUnit, NFSeHistoricoEtdUnit,
  DateAndTimeNullableUnit, ACBrNFSeAdapterTypes, NFSeHistoricoTypesUnit, TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit, EmailConfigModelUnit, EmailNFSeInputUnit, EmailConfigRemetenteEnumUnit,
  EmailMessageTypesUnit;

function CreateACBrSubstituirInput(DPS: NFSeEtd): ACBrSubstituirInput;
begin
  Result := ACBrSubstituirInput.Create(
    dps.Substituida.Chave.Value,
    dps.Substituida.CMotivo.Value,
    dps.Substituida.XMotivo.Value,
    dps.Substituida.Serie.Value,
    dps.Substituida.Ndps.Value,
    IfThen( dps.Substituida.NNFSe.HasValue, dps.Substituida.NNFSe.Value.ToString()),
    dps.Substituida.NLote.Value,
    dps.Substituida.CVerificacao.Value
  );
end;

{ EmitirLoteWsNFSeInput }

class function EmitirLoteWsNFSeInput.Create(
  const NFSeIds, Emails: TArrayString;
  EmpresaId: Integer;
  Silent: Boolean
): EmitirLoteWsNFSeInput;
begin
  Result.NFSeIds := NFSeIds;
  Result.Emails := Emails;
  Result.EmpresaId := EmpresaId;
  Result.Silent := Silent;
end;

{ EmitirWsNFSeInput }

class function EmitirWsNFSeInput.Create(
  const NFSeId, Email: string; EmpresaId: Integer; Silent: Boolean
): EmitirWsNFSeInput;
begin
  Result.NFSeId := NFSeId;
  Result.Email := Email;
  Result.EmpresaId := EmpresaId;
  Result.Silent := Silent;
end;

{ EmissaoWsNFSeUseCase }

function EmissaoWsNFSeUseCase.ExecutarEmissao(): ResultadoOperacaoDFe;
var
  emitirDps: DpsEmitirModel;
  dps: NFSeEtd;
  tribDfe: TributoDFeContextEtd;
  transaction: ITransaction;
  respostaWS: WSResposta;
  nfseResumo: NFSeResumoModel;
  atualizacaoStatus: NFSeAtualizarSituacaoModel;
  nroLote: string;
begin
  transaction := FConnection.BeginTransaction();
  try try

    FObserver.OnMessage('Preparando DPS/NFSe para transmissão');
    // Testes iniciais
    dps := FNFSeRepo.GetNFSe(FNFSeId, FEmpresaId);

    if dps = nil then
    begin
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_DOC_NAO_ENCONTRADO );
      Exit;
    end;

    if (dps.Ndps.Value <= 0)
      or (dps.Serie.Value.Trim() = '' )
      or (dps.DhEmi.IsNull) then
    begin
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_RPS_NAO_GERADO );
      Exit;
    end;

    if not ( dps.Situacao in [ SituacaoNFSeEnum.sdpsRascunho, SituacaoNFSeEnum.sdpsRejeicao  ]) then
    begin
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_SITUACAO_NAO_PERMITIDA );
      Exit;
    end;

    tribDfe := nil;
    if dps.LayoutNFSeComIbsCbs() then
      tribDfe := FTributosDFeRepo.GetById( FNFSeId, tdfoNFSe );

    emitirDps := DpsEmitirModel.Create(
      NFSeModel.Create( dps, tribDfe ),
      edpsPrestador,
      FEmpresa.CNPJ,
      StringNullable.Create( FEmpresa.InscMunicipal, not FConfigNFSe.EnviarInscricaoMunicipal ),
      FEmpresa.Razao,
      FConfigNFSe.CMunEmitente,
      FConfigNFSe.OpSimpNac,
      FConfigNFSe.RegApTribSN,
      FConfigNFSe.RegEsTrib,
      FConfigNFSe.IncentivoCultural,
      FConfigNFSe.ConvenioSistemaNacionalAtivo,
      FConfigNFSe.PreferirAliqSNaoIbpt,
      FConfigNFSe.WebService.ApiPropria
    );
    dps := nil; // finally faz free
    tribDfe := nil;

    FNFSeConverter.ConverterParaACBr(
      emitirDps,
      FACBr.NotaFiscalRequest
    );

    // ********** no padrao abrasf temos de gerar o numero do lote
    // ******* quando envia assincrono temos que salvar o protocolo
    // fazer esses teste no ambiente GV, gerar por aqui ou retornar no momento q atualiza a emissao
    // FACBr.Emitir( nroLote );

    FObserver.OnMessage('Atualizando situação para "Em Emissão"');

    // Atualizacao DPS para Em Emissao e Salvando XML de envio
    atualizacaoStatus := NFSeAtualizarEmEmissaoModel.Create(
      FNFSeId, FEmpresaId, FACBr.ObterXmlDPS()
    );
    nfseResumo := FNFSeRepo.AtualizarNFSe( NFSeAtualizarEmEmissaoModel(atualizacaoStatus) );

    if nfseResumo.Situacao <> SituacaoNFSeEnum.sdpsEmissao then
    begin
      transaction.Rollback();
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, 'Não foi possível alterar o documento para "Emissão"' );
      Exit;
    end;
    transaction.Commit();

    nroLote := nfseResumo.NLote.Value;

    FObserver.OnMessage('Iniciando processo de comunicação');
    // Envio e tratamento de resposta
    if not emitirDps.DPS.NFSe.IsPadraoNacional() and (emitirDps.DPS.NFSe.Substituida <> nil) then
      respostaWS := FACBr.Substituir( nroLote, CreateACBrSubstituirInput( emitirDps.DPS.NFSe ) )
    else
      respostaWS := FACBr.Emitir( nroLote );

    case respostaWS.Resultado of
      wsSucesso:
        begin
          FObserver.OnMessage('NFSe Autorizada. Salvando dados');

          emitirDps.DPS.Tributo := FNFSeConverter.ConververParaTributoDFe( emitirDps.DPS, FACBr.NotaFiscalResponse );

          if (emitirDps.DPS.NFSe.Substituida <> nil) and (FACBr.SubstituicaoResponse <> nil) then
          begin
            AddXMLImpressao(FACBr.SubstituicaoResponse.Autorizacao.XmlAutorizacao.Value);

            FAtualizarSituacaoService.ExecutarSubstituicao(
              emitirDps.DPS.NFSe,
              FACBr.SubstituicaoResponse,
              emitirDps.DPS.Tributo
            );
          end
          else
          begin
            AddXMLImpressao(FACBr.AutorizacaoResponse.XmlAutorizacao.Value);

            FAtualizarSituacaoService.ExecutarAutorizacao(
              emitirDps.DPS.NFSe,
              FACBr.AutorizacaoResponse,
              emitirDps.DPS.Tributo
            );
          end;
          transaction.Commit();

          Result := EnviarEmail();
          if Result <> rodOK then
          begin
            transaction.Commit();
            Exit;
          end;
        end;

      wsRejeicao:
        begin
          FObserver.OnMessage('NFSe Rejeitada. Salvando erros para consulta');

          atualizacaoStatus.Free();
          atualizacaoStatus := NFSeAtualizarRejeicaoModel.Create(
            FNFSeId, FEmpresaId,
            WSErrorSerializer.Serialize( respostaWS.Erros ),
            respostaWS.Protocolo,
            WSErrorSerializer.FormatarMensagem( respostaWS.Erros )
          );
          FNFSeRepo.AtualizarNFSe( NFSeAtualizarRejeicaoModel( atualizacaoStatus ));
          transaction.Commit();
        end;

      wsEmProcessamento:
        begin
          FObserver.OnMessage('NFSe Em Processamento. Consultar em instantes');

          atualizacaoStatus.Free();
          atualizacaoStatus := NFSeAtualizarEmProcessamentoModel.Create( FNFSeId, FEmpresaId, respostaWS.Protocolo );
          FNFSeRepo.AtualizarNFSe( NFSeAtualizarEmProcessamentoModel( atualizacaoStatus ));
          transaction.Commit();
        end;

      wsFalhaComunicacao, wsFalhaImplementacao:
        begin
          FObserver.OnMessage('Falha de comunicação ou implementação. Consulte o histórico para mais detalhes');
          Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, WSErrorSerializer.FormatarMensagem( respostaWS.Erros ));
          Exit;
        end;
    end;

    Result := ResultadoOperacaoDFe.rodOK;

  except on E: Exception do
    begin
      transaction.Rollback();
      Result := ResultadoOperacaoDFe.rodFalhaNaoTratada;
      FLogError.LogError( 'EmitirWsNFSeUseCase.ExecutarEmissao - NFSeId: %s - Empresa: %d - Erro: %s', [ FNFSeId, FEmpresaId, E.Message ]);
    end;
  end;
  finally
    transaction.Commit();
    dps.Free();
    tribDfe.Free();
    emitirDps.Free();
    transaction.Free();
    atualizacaoStatus.Free();
  end;
end;

procedure EmissaoWsNFSeUseCase.Imprimir;
var
  I: Integer;
  Canceladas: TArrayBoolean;
begin
  if Length(FXmlsImpressao) = 0 then
    Exit;

  SetLength(Canceladas, Length(FXmlsImpressao) );

  for I := 0 to High(FXmlsImpressao) do
    Canceladas[I] := False;

  FACBr.Imprimir( FXmlsImpressao, Canceladas );
end;

function EmissaoWsNFSeUseCase.ExecutarConsulta(const ResumoNFSe: NFSeResumoModel;
  out PrecisaEmitir: Boolean
): ResultadoOperacaoDFe;
var
  transaction: ITransaction;
  respostaWS: WSResposta;
  nfseSituacao: NFSeSituacaoModel;
  atualizacaoStatus: NFSeAtualizarSituacaoModel;
  nfs: NFSeModel;
  xmlDoc: string;
begin
  PrecisaEmitir := False;
  transaction := FConnection.BeginTransaction();
  try try
    FObserver.OnMessage('Preparando Consulta');

    if ResumoNFSe.Id.IsEmpty() then
    begin
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_DOC_NAO_ENCONTRADO );
      Exit;
    end;

    if (ResumoNFSe.Ndps.Value <= 0)
      or (ResumoNFSe.Serie.Value.Trim() = '' )
      or (ResumoNFSe.DhEmi.IsNull) then
    begin
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_RPS_NAO_GERADO );
      Exit;
    end;

    if not ( ResumoNFSe.Situacao in [ sdpsEmissao, sdpsEmProcessamento, sdpsAutorizada ]) then
    begin
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_SITUACAO_NAO_PERMITIDA );
      Exit;
    end;

    if not ResumoNFSe.Documento[tdocXmlAutorizacao].IsNullOrWhiteSpace then
      xmlDoc := ResumoNFSe.Documento[tdocXmlAutorizacao].Value
    else if not ResumoNFSe.Documento[tdocXmlDPSEnvio].IsNullOrWhiteSpace then
      xmlDoc := ResumoNFSe.Documento[tdocXmlDPSEnvio].Value
    else
    begin
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_XML_NAO_ENCONTRADO );
      Exit;
    end;

    FObserver.OnMessage('Iniciando processo de comunicação');

    // O que deve ser feito se nao tem cancelamento e situacao = Autorizada?
    // Eu deveria saber se o cancelamento foi por substituicao e fazer o que? pois a substituicao precisa resolver os updates

    respostaWS := FACBr.Consutar( ACBrConsultarInput.Create(
      xmlDoc,
      resumoNFSe.NDps.Value.ToString(),
      resumoNFSe.Serie.Value,
      {Protocolo} resumoNFSe.NProt.Value,
      {Tipo} '1',
      {NumeroLote} resumoNFSe.NLote.Value
    ));

    Result := ResultadoOperacaoDFe.rodOK;

    if respostaWS.Resultado in [ wsFalhaComunicacao, wsFalhaImplementacao ] then
    begin
      FObserver.OnMessage('Falha de comunicação. Consulte o histórico para mais detalhes');

      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, WSErrorSerializer.FormatarMensagem( respostaWS.Erros ));
    end
    // Testes quando autorizada sao diferentes
    else if resumoNFSe.Situacao = sdpsAutorizada then
    begin
      if respostaWS.Resultado = wsSucesso then
      begin
        if resumoNFSe.SubstituidaPorId.HasValue
          and Assigned(FACBr.CancPorSubstResponse) then
        begin
          FNFSeRepo.PutNFSeHistorico(NFSeUltimoHistoricoModel.Create(
            FNFSeId, FEmpresaId, 'NFSe foi substituída e está Cancelada no WebService. ' + sLineBreak +
            'Tente consultar a Nota que originou a substuição para resolver a situação'
          ));
          Result := ResultadoOperacaoDFe.rodFalhaRegistrada;
        end

        else if Assigned(FACBr.CancPorSubstResponse) then
          FAtualizarSituacaoService.ExecutarCancelamento( resumoNFSe.Id, FEmpresaId, FACBr.CancPorSubstResponse )

        else if Assigned(FACBr.CancelamentoResponse) then
          FAtualizarSituacaoService.ExecutarCancelamento( resumoNFSe.Id, FEmpresaId, FACBr.CancelamentoResponse )

        else if Assigned(FACBr.SubstituicaoResponse) then
        begin
          nfs := NFSeModel.Create(
            FNFSeRepo.GetNFSe( FNFSeId, FEmpresaId ),
            FTributosDFeRepo.GetById( FNFSeId, tdfoNFSe )
          );
          nfs.Tributo := FNFSeConverter.ConververParaTributoDFe( nfs, FACBr.NotaFiscalResponse);

          FAtualizarSituacaoService.ExecutarSubstituicao(
            nfs.NFSe,
            FACBr.SubstituicaoResponse,
            nfs.Tributo
          );
        end;
        // Nao faz nada nos demais retornos pois já está atualizada
      end;
    end
    // Quando nao autorizada pode alterar a situação
    else
    begin
      case respostaWS.Resultado of
        wsSucesso:
          begin
            FObserver.OnMessage('NFSe Autorizada. Salvando dados');

            if Assigned(FACBr.SubstituicaoResponse) or Assigned(FACBr.AutorizacaoResponse) then
            begin
              nfs := NFSeModel.Create(
                FNFSeRepo.GetNFSe( FNFSeId, FEmpresaId ),
                FTributosDFeRepo.GetById( FNFSeId, tdfoNFSe )
              );
              nfs.Tributo := FNFSeConverter.ConververParaTributoDFe( nfs, FACBr.NotaFiscalResponse);
            end;

            if Assigned(FACBr.SubstituicaoResponse) then
            begin
              AddXMLImpressao(FACBr.SubstituicaoResponse.Autorizacao.XmlAutorizacao.Value);

              FAtualizarSituacaoService.ExecutarSubstituicao(
                nfs.NFSe,
                FACBr.SubstituicaoResponse,
                nfs.Tributo
              );
            end

            else if Assigned(FACBr.AutorizacaoResponse) then
            begin
              AddXMLImpressao(FACBr.AutorizacaoResponse.XmlAutorizacao.Value);

              FAtualizarSituacaoService.ExecutarAutorizacao(
                nfs.NFSe,
                FACBr.AutorizacaoResponse,
                nfs.Tributo
              );
            end

            else if Assigned(FACBr.CancPorSubstResponse) then
              FAtualizarSituacaoService.ExecutarCancelamento( resumoNFSe.Id, FEmpresaId, FACBr.CancPorSubstResponse)

            else if Assigned(FACBr.CancelamentoResponse) then
              FAtualizarSituacaoService.ExecutarCancelamento( resumoNFSe.Id, FEmpresaId, FACBr.CancelamentoResponse);

            Result := EnviarEmail();
            if Result <> rodOK then
                transaction.Commit();
          end;

        wsRejeicao:
          begin
            PrecisaEmitir := True;
            FObserver.OnMessage('NFSe Rejeitada. Salvando erros para consulta');

            atualizacaoStatus.Free();
            atualizacaoStatus := NFSeAtualizarRejeicaoModel.Create(
              FNFSeId, FEmpresaId,
              WSErrorSerializer.Serialize( respostaWS.Erros ),
              respostaWS.Protocolo,
              WSErrorSerializer.FormatarMensagem( respostaWS.Erros )
            );
            FNFSeRepo.AtualizarNFSe( NFSeAtualizarRejeicaoModel( atualizacaoStatus ));
          end;

        wsEmProcessamento:
          begin
            FObserver.OnMessage('NFSe Em Processamento. Consultar em instantes');

            atualizacaoStatus.Free();
            atualizacaoStatus := NFSeAtualizarEmProcessamentoModel.Create( FNFSeId, FEmpresaId, respostaWS.Protocolo );
            FNFSeRepo.AtualizarNFSe( NFSeAtualizarEmProcessamentoModel( atualizacaoStatus ));
          end;
      end;
    end;

    transaction.Commit();

  except on E: Exception do
    begin
      transaction.Rollback();
      Result := ResultadoOperacaoDFe.rodFalhaNaoTratada;
      FLogError.LogError( 'EmitirWsNFSeUseCase.ExecutarConsulta - NFSeId: %s - Empresa: %d - Erro: %s', [ FNFSeId, FEmpresaId, E.Message ]);
    end;
  end;
  finally
    transaction.Commit();
    transaction.Free();
    atualizacaoStatus.Free();
    nfs.Free();
  end;
end;

function EmissaoWsNFSeUseCase.Executar(): ResultadoOperacaoDFe;
var
  ResumoNFSe: NFSeResumoModel;
  PrecisaEmitir: Boolean;
begin
  ResumoNFSe := FNFSeRepo.GetResumoNFSe(FNFSeId, [ tdocXmlDPSEnvio, tdocXmlAutorizacao ]);
  try
    if ResumoNFSe.NaturezaEmissao <> nemtPrestadorWS then
    begin
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_EMISSAO_PORTAL );
      Exit;
    end;

    case ResumoNFSe.Situacao of
      sdpsEmissao,
      sdpsEmProcessamento,
      sdpsAutorizada:
        begin
          Result := ExecutarConsulta( ResumoNFSe, PrecisaEmitir );

          if FApenasConsultar then
            Exit;

          if PrecisaEmitir then
            Result := ExecutarEmissao();
        end;

      sdpsRascunho,
      sdpsRejeicao:
        begin
          if FApenasConsultar then
          begin
            Result := ExecutarConsulta( ResumoNFSe, PrecisaEmitir );
            Exit;
          end;

          Result := ExecutarEmissao();
        end

      else //sdpsExcluido, sdpsCancelada, sdpsSubstituida
        Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId, HIST_SITUACAO_NAO_PERMITIDA );
    end;

  except on E: Exception do
    begin
      Result := ResultadoOperacaoDFe.rodFalhaNaoTratada;
      FLogError.LogError( 'EmitirWsNFSeUseCase.Executar - DpsId: %s - Empresa: %d - Erro: %s', [ FNFSeId, FEmpresaId, E.Message ]);
      FObserver.OnError( 'Falha no processo. Consulte o log para detalhes' );
    end;
  end;
end;

procedure EmissaoWsNFSeUseCase.AddXMLImpressao(const XmlAutNFSe: string);
begin
  SetLength(FXmlsImpressao, Length(FXmlsImpressao) + 1);
  FXmlsImpressao[High(FXmlsImpressao)] := XmlAutNFSe;
end;

constructor EmissaoWsNFSeUseCase.Create(
  Session: ISessionContext;
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  EmpresasRepo: IEmpresasRepository;
  ConfigRepo: IConfiguracoesRepository;
  ConfNFSe: IConfiguracaoNFSeService;
  AtualizarSituacaoService:
  IAtualizarSituacaoNFSeService;
  ACBr: IACBrNFSeAdapter;
  NFSeConverter: INFSeConverter;
  EmailComposer: IEmailComposerService;
  EnviarEmailUseCase: IEnviarEmailUseCase;
  LogError: IErrorLogger;
  Observer: IProgressObserver
);
begin
  inherited Create(
    Connection, NFSeRepo, TributosDFeRepo, EmpresasRepo, ConfNFSe, AtualizarSituacaoService, ACBr, NFSeConverter,
    LogError, Observer
  );

  FConfigRepo := ConfigRepo;
  FEmailFComposer := EmailComposer;
  FEnviarEmailUseCase := EnviarEmailUseCase;

  SetLength(FXmlsImpressao, 0);
end;

function EmissaoWsNFSeUseCase.EnviarEmail(): ResultadoOperacaoDFe;
var
  fileNamePDF, xmlAut, chaveNFSe: string;
  bXMLAut, bXMLCanc, bDANFSePDF: TBytes;
  emailConfig: EmailConfigModel;
  eCompuserInput: EmailNFSeInput;
  eMessage: EmailMessageModel;
begin
  Result := ResultadoOperacaoDFe.rodOK;

  if String.IsNullOrWhiteSpace(FEmails) then
    Exit;

  if (FACBr.SubstituicaoResponse <> nil)
    and (FACBr.SubstituicaoResponse.Autorizacao <> nil)
    and not FACBr.SubstituicaoResponse.Autorizacao.XmlAutorizacao.IsNullOrWhiteSpace()
  then
  begin
    xmlAut := FACBr.SubstituicaoResponse.Autorizacao.XmlAutorizacao.Value;
    ChaveNFSe := FACBr.SubstituicaoResponse.Autorizacao.ChaveNFSe;
    if chaveNFSe = '' then
      chaveNFSe := IntToStr(FACBr.SubstituicaoResponse.Autorizacao.NumeroNFSe);
  end

  else if (FACBr.AutorizacaoResponse <> nil)
    and not FACBr.AutorizacaoResponse.XmlAutorizacao.IsNullOrWhiteSpace()
  then
  begin
    xmlAut := FACBr.AutorizacaoResponse.XmlAutorizacao.Value;
    ChaveNFSe := FACBr.AutorizacaoResponse.ChaveNFSe;
    if chaveNFSe = '' then
      chaveNFSe := IntToStr(FACBr.AutorizacaoResponse.NumeroNFSe);
  end

  else
    Exit;

  try try
    fileNamePDF := FACBr.GerarPdfAtual();

    // PDF gerado com sucesso, carrega os bytes e apaga o arquivo
    if TFile.Exists(fileNamePDF) then
      bDANFSePDF := TFile.ReadAllBytes(fileNamePDF);

    // XML Autorizacao
    bXMLAut := TEncoding.UTF8.GetBytes( xmlAut );

    // XML Cancelamento
    bXMLCanc := [];

    // Email Config de Documentos Fiscais
    emailConfig := FConfigRepo.GetEmailConfig( cerDFes );

    // Input do Email de NFSe juntando tudo
    eCompuserInput := EmailNFSeInput.Create(
      FEmails,
      chaveNFSe,
      bDANFSePDF,
      bXMLAut,
      bXMLCanc,
      emailConfig
    );

    // Formatando a mensagem
    eMessage := FEmailFComposer.ComporEmailNFSe( eCompuserInput );

    FObserver.OnMessage('Enviando email...');

    if FEnviarEmailUseCase.Executar( emailConfig, eMessage ) then
      FNFSeRepo.PostNFSeHistorico( NFSeHistoricoModel.Create(
        FNFSeId, FEmpresaId, TipoHistoricoNFSeEnum.thEmailEnviado, FEmails
      ))
    else
      Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId,
        'Serviço de envio de email não conseguiu enviar email e não registrou a mensagem de erro'
      );
  except
    Result := Self.RetornarFalhaSalva( FNFSeId, FEmpresaId,
      '*Serviço de envio de email não conseguiu enviar email e não registrou a mensagem de erro'
    );
  end;
  finally
    // Deleta o arquio PDF se o mesmo foi gerado apenas para o envio do email
    if TFile.Exists(fileNamePDF) then
      TFile.Delete(fileNamePDF);
  end;
end;

function EmissaoWsNFSeUseCase.ExecutarLote(const Input: EmitirLoteWsNFSeInput): ResultadoOperacaoDFeArray;
var
  I: Integer;
  NFSeId: string;
  Emails: TArrayString;
begin
  FObserver.OnStart();

  SetLength(Result, Length(Input.NFSeIds));
  NFSeId := 'None';

  // Obtendo dados de configuracao
  FEmpresaId := Input.EmpresaId;
  FConfigNFSe := FConfNFSe.Executar( Input.EmpresaId );
  FEmpresa := FEmpresasRepo.GetByKey( Input.EmpresaId );
  try try

    if Length(input.Emails) = 0 then
    begin
      SetLength(Emails, Length(Input.NFSeIds));
      for I := 0 to High(Input.NFSeIds) do
        Emails[I] := '';
    end
    else
      Emails := input.Emails;

    if Length(Emails) <> Length(Input.NFSeIds) then
      raise Exception.Create('EmitirWsNFSeUseCase Erro de implementação Qtde de IDs incompativel com lista de Emails');

    if FEmpresa = nil then
      raise Exception.Create('Empresa = nil');

    // Configuracao e alimentacao Adapter ACBr
    FACBr.Configurar( FConfigNFSe, FEmpresa );

    // Tratamento individual
    for I := Low(Input.NFSeIds) to High(Input.NFSeIds) do
    begin
      FObserver.OnCounter(I + 1, Length(Input.NFSeIds));

      FNFSeId := Input.NFSeIds[I];
      FEmails := Emails[I];

      Result[I] := Ord( Self.Executar() );
    end;

    if not Input.Silent then
      Imprimir();

    FObserver.OnComplete();

  except on E: Exception do
    begin
      SetLength(Result, 0);// Vai corresponder a falha nao tratada
      FLogError.LogError( 'EmitirWsNFSeUseCase.Executar - DpsId: %s - Empresa: %d - Erro: %s', [ NFSeId, Input.EmpresaId, E.Message ]);
      FObserver.OnError( 'Falha no processo. Consulte o log para detalhes' );
    end;
  end;
  finally
    SetLength(FXmlsImpressao, 0);
    FEmpresa.Free();
  end;
end;

function EmissaoWsNFSeUseCase.ExecutarIndividual(const Input: EmitirWsNFSeInput): ResultadoOperacaoDFe;
var
  exeResult: ResultadoOperacaoDFeArray;
  NFSesId, Emails: TArrayString;
begin
  // Basicamnte transforma o Input no Array do outro input
  SetLength( NFSesId, 1 );
  SetLength( Emails, 1 );
  NFSesId[0] := Input.NFSeId;
  Emails[0] := Input.Email;

  exeResult := Self.ExecutarLote( EmitirLoteWsNFSeInput.Create(
    NFSesId,
    Emails,
    Input.EmpresaId,
    Input.Silent
  ));

  if Length(exeResult) = 0 then
    Result := rodFalhaNaoTratada

  else
    Result := ResultadoOperacaoDFe( exeResult[0] );
end;

{ ConsultarWsNFSeUseCase }

function ConsultarWsNFSeUseCase.Executar(const Input: EmitirWsNFSeInput): ResultadoOperacaoDFe;
begin
  FApenasConsultar := True;
  Result := Self.ExecutarIndividual( Input );
end;

{ EmitirWsNFSeUseCase }

function EmitirWsNFSeUseCase.Executar(const Input: EmitirWsNFSeInput): ResultadoOperacaoDFe;
begin
  FApenasConsultar := False;
  Result := Self.ExecutarIndividual( Input );
end;

function EmitirWsNFSeUseCase.Executar(const Input: EmitirLoteWsNFSeInput): ResultadoOperacaoDFeArray;
begin
  FApenasConsultar := False;
  Result := Self.ExecutarLote( Input );
end;

end.
