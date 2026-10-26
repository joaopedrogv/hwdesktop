(*
    NAO ESTAMOS UTILIZANDO ESSE ARQUIVO, PODE SER EXCLUIDO
*)

unit ConsultarEmissaoWsNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit, NFSeComACBrUseCaseBaseUnit, IDataBaseConnectionUnit, ResultadoExecucaoTransmissaoDFeOutputUnit;

type

  IConsultarEmissaoWsNFSeUseCase = interface
    ['{975DFC5E-B91D-416F-BD3D-EA6291BDF222}']
    function Executar(const NFSeId: string; EmpresaId: Integer): ResultadoExecucaoTransmissaoDFeOutput;
  end;

  ConsultarEmissaoWsNFSeUseCase = class(NFSeComACBrUseCaseBase, IConsultarEmissaoWsNFSeUseCase)
  private    
//    function TratarQuandoAutorizada(const NFSeId: string; EmpresaId: Integer): ResultadoOperacaoDFe;
  public
    function Executar(const NFSeId: string; EmpresaId: Integer): ResultadoExecucaoTransmissaoDFeOutput;
  end;

implementation

uses
  SysUtils,
  ConfiguracaoNFSeModelUnit, DpsEmitirModelUnit, ITransactionUnit, NFSeTypesUnit, EmpresaEtdUnit,
  NFSeAtualizarSituacaoTypesUnit, WebServiceResponseTypesUnit, NFSeEtdUnit, StringNullableUnit, NFSeHistoricoEtdUnit,
  DateAndTimeNullableUnit, ACBrNFSeAdapterTypes, NFSeDocEtdUnit, StringServiceUnit,
  NFSeResumoModelUnit, NFSeHistoricoTypesUnit, ResultadoOperacaoDFeUnit, NFSeModelUnit, TributoDFeOrigemEnumUnit;

{ ConsultarEmissaoWsNFSeUseCase }

function ConsultarEmissaoWsNFSeUseCase.Executar(const NFSeId: string; EmpresaId: Integer): ResultadoExecucaoTransmissaoDFeOutput;
var
  confNFSe: ConfiguracaoNFSeModel;
  empresa: EmpresaEtd;
  resumoNFSe: NFSeResumoModel;
  transaction: ITransaction;
  respostaWS: WSResposta;
  nfseSituacao: NFSeSituacaoModel;
  atualizacaoStatus: NFSeAtualizarSituacaoModel;
  nfs: NFSeModel;
  xmlDoc: string;
begin
  FObserver.OnStart();
  transaction := FConnection.BeginTransaction();
  try try
    FObserver.OnMessage('Preparando Consulta');

    resumoNFSe := FNFSeRepo.GetResumoNFSe(NFSeId, [ tdocXmlDPSEnvio, tdocXmlAutorizacao ]);

    if resumoNFSe.Id.IsEmpty() then
    begin
      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, HIST_DOC_NAO_ENCONTRADO );
      Exit;
    end;

    if (resumoNFSe.Ndps.Value <= 0)
      or (resumoNFSe.Serie.Value.Trim() = '' )
      or (resumoNFSe.DhEmi.IsNull) then
    begin
      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, HIST_RPS_NAO_GERADO );
      Exit;
    end;

    if not ( resumoNFSe.Situacao in [ sdpsEmissao, sdpsEmProcessamento, sdpsAutorizada ]) then
    begin
      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, HIST_SITUACAO_NAO_PERMITIDA );
      Exit;
    end;

    if not resumoNFSe.Documento[tdocXmlAutorizacao].IsNullOrWhiteSpace then
      xmlDoc := resumoNFSe.Documento[tdocXmlAutorizacao].Value
    else if not resumoNFSe.Documento[tdocXmlDPSEnvio].IsNullOrWhiteSpace then
      xmlDoc := resumoNFSe.Documento[tdocXmlDPSEnvio].Value
    else
    begin
      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, HIST_XML_NAO_ENCONTRADO );
      Exit;
    end;

    confNFSe := FConfNFSe.Executar( EmpresaId );
    empresa := FEmpresasRepo.GetByKey( EmpresaId );

    if empresa = nil then
      raise Exception.Create('Empresa = nil');

    // Configuracao e alimentacao Adapter ACBr
    FACBr.Configurar( confNFSe, empresa );

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

    Result := RetornarSucesso(respostaWS.Resultado = wsSucesso);

    if respostaWS.Resultado in [ wsFalhaComunicacao, wsFalhaImplementacao ] then
    begin   
      FObserver.OnMessage('Falha de comunicação. Consulte o histórico para mais detalhes');

      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, WSErrorSerializer.FormatarMensagem( respostaWS.Erros ));
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
            NFSeId, EmpresaId, 'NFSe foi substituída e está Cancelada no WebService. ' + sLineBreak +
            'Tente consultar a Nota que originou a substuição para resolver a situação'
          ));
          Result := ResultadoExecucaoTransmissaoDFeOutput.Create(ResultadoOperacaoDFe.rodFalhaRegistrada, False);
        end

        else if Assigned(FACBr.CancPorSubstResponse) then
          FAtualizarSituacaoService.ExecutarCancelamento( resumoNFSe.Id, resumoNFSe.EmpresaId, FACBr.CancPorSubstResponse )

        else if Assigned(FACBr.CancelamentoResponse) then
          FAtualizarSituacaoService.ExecutarCancelamento( resumoNFSe.Id, resumoNFSe.EmpresaId, FACBr.CancelamentoResponse )

        else if Assigned(FACBr.SubstituicaoResponse) then
        begin
          nfs := NFSeModel.Create(
            FNFSeRepo.GetNFSe( NFSeId, EmpresaId ),
            FTributosDFeRepo.GetById( NFSeId, tdfoNFSe )
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
                FNFSeRepo.GetNFSe( NFSeId, EmpresaId ),
                FTributosDFeRepo.GetById( NFSeId, tdfoNFSe )
              );
              nfs.Tributo := FNFSeConverter.ConververParaTributoDFe( nfs, FACBr.NotaFiscalResponse);
            end;

            if Assigned(FACBr.SubstituicaoResponse) then
              FAtualizarSituacaoService.ExecutarSubstituicao(
                nfs.NFSe,
                FACBr.SubstituicaoResponse,
                nfs.Tributo
              )

            else if Assigned(FACBr.AutorizacaoResponse) then
              FAtualizarSituacaoService.ExecutarAutorizacao(
                nfs.NFSe,
                FACBr.AutorizacaoResponse,
                nfs.Tributo
              )
                
            else if Assigned(FACBr.CancPorSubstResponse) then
              FAtualizarSituacaoService.ExecutarCancelamento(
                resumoNFSe.Id, resumoNFSe.EmpresaId, FACBr.CancPorSubstResponse
              )

            else if Assigned(FACBr.CancelamentoResponse) then
              FAtualizarSituacaoService.ExecutarCancelamento(
                resumoNFSe.Id, resumoNFSe.EmpresaId, FACBr.CancelamentoResponse
              );
          end;

        wsRejeicao:
          begin
            FObserver.OnMessage('NFSe Rejeitada. Salvando erros para consulta');

            atualizacaoStatus.Free();
            atualizacaoStatus := NFSeAtualizarRejeicaoModel.Create(
              NFSeId, EmpresaId,
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
            atualizacaoStatus := NFSeAtualizarEmProcessamentoModel.Create( NFSeId, EmpresaId, respostaWS.Protocolo );
            FNFSeRepo.AtualizarNFSe( NFSeAtualizarEmProcessamentoModel( atualizacaoStatus ));
          end;
      end;      
    end; 

    transaction.Commit(); 

    FObserver.OnComplete();

  except on E: Exception do
    begin
      transaction.Rollback();
      Result := RetornarFalhaNaoTratada();
      FLogError.LogError( 'ConsultarEmissaoWsNFSeUseCase.Executar - DpsId: %s - Empresa: %d - Erro: %s', [ NFSeId, EmpresaId, E.Message ]);
      FObserver.OnError( 'Falha no processo. Consulte o log para detalhes' );
    end;
  end;
  finally
    transaction.Commit();
    empresa.Free();
    transaction.Free();
    atualizacaoStatus.Free();
    nfs.Free();
  end;
end;

end.

