(*
  Arquivo exclusivo Delphi com ACBR
*)
unit CancelarWsNFSeUseCaseUnit;

interface

uses
  ResultadoExecucaoTransmissaoDFeOutputUnit, NFSeComACBrUseCaseBaseUnit, IDataBaseConnectionUnit;

type
  ICancelarWsNFSeUseCase = interface
    ['{23042F93-2D9E-474E-9B29-9061D8C75E78}']
    function Executar(const NFSeId: string; EmpresaId: Integer): ResultadoExecucaoTransmissaoDFeOutput;
  end;

  CancelarWsNFSeUseCase = class(NFSeComACBrUseCaseBase, ICancelarWsNFSeUseCase)
  public
    function Executar(const NFSeId: string; EmpresaId: Integer): ResultadoExecucaoTransmissaoDFeOutput;
  end;

implementation

uses
  SysUtils, IOUtils,
  ConfiguracaoNFSeModelUnit, NFSeTypesUnit, EmpresaEtdUnit,
  WebServiceResponseTypesUnit, NFSeEtdUnit, StringNullableUnit, DateAndTimeNullableUnit, NFSeDocEtdUnit,
  ACBrNFSeAdapterTypes, NFSeEventoModelUnit, NFSeAtualizarSituacaoTypesUnit, ITransactionUnit,
  NFSeAtualizarSituacaoEventoTypesUnit, NFSeEventoResumoModelUnit, NFSeTypesDisplayUnit, ResultadoOperacaoDFeUnit;

{ CancelarWsNFSeUseCase }

function CancelarWsNFSeUseCase.Executar(const NFSeId: string; EmpresaId: Integer): ResultadoExecucaoTransmissaoDFeOutput;
var
  confNFSe: ConfiguracaoNFSeModel;
  empresa: EmpresaEtd;
  resumoNFSeEvento: NFSeEventoModel;
  transaction: ITransaction;
  resposta: WSResposta;
  updateSitEvent: NFSeAtualizarSituacaoEventoModel;
  resumoEvent: NFSeEventoResumoModel;
  EventoId: string;
begin
  FObserver.OnStart();

  transaction := FConnection.BeginTransaction();
  try try
    FObserver.OnMessage('Preparando DPS/NFSe');

    resumoNFSeEvento := FNFSeRepo.GetEventoNFSe( NFSeId, EmpresaId, tenCancelamento );

    if (resumoNFSeEvento = nil) or (resumoNFSeEvento.Evento = nil) then
    begin
      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, HIST_DOC_NAO_ENCONTRADO );
      Exit;
    end;

    if not (resumoNFSeEvento.Situacao in [ sdpsAutorizada ])
    or not (resumoNFSeEvento.Evento.Situacao in [ sdpsRascunho, sdpsEmissao, sdpsEmProcessamento ]) then
    begin
      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, HIST_SITUACAO_NAO_PERMITIDA );
      Exit;
    end;

    if (resumoNFSeEvento.Autorizacao = nil) or String.IsNullOrWhiteSpace( resumoNFSeEvento.Autorizacao.Doc ) then
    begin
      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, HIST_XML_NAO_ENCONTRADO );
      Exit;
    end;

    EventoId := resumoNFSeEvento.Evento.Id;

    confNFSe := FConfNFSe.Executar( EmpresaId ); // Pode usar o cache
    empresa := FEmpresasRepo.GetByKey( EmpresaId ); // Pode usar o cache

    if empresa = nil then
      raise Exception.Create('Empresa = nil');

    FACBr.Configurar( confNFSe, empresa );

    FObserver.OnMessage('Atualizando situação do Evento para "Em Emissão"');

    // Atualizacao Evento para Em Emissao e Salvando XML de envio
    updateSitEvent := NFSeAtualizarEventoEmEmissaoModel.Create( NFSeId, EventoId );
    resumoEvent := FNFSeRepo.AtualizarEventoNFSe( updateSitEvent, sdpsEmissao );

    if resumoEvent.SituacaoEvento <> SituacaoNFSeEnum.sdpsEmissao then
    begin
      transaction.Rollback();
      Result := RetornarTransmissaoFalhaSalva( NFSeId, EmpresaId, 'Não foi possível alterar o evento de Cancelamento para "Emissão"' );
      Exit;
    end;
    transaction.Commit();

    FObserver.OnMessage('Preparando transmissão');

    resposta := FACBr.Cancelar( ACBrCancelarInput.Create(
      resumoNFSeEvento.Autorizacao.Doc,
      resumoNFSeEvento.Evento.CMotivo.Value,
      resumoNFSeEvento.Evento.XMotivo.Value,
      resumoNFSeEvento.Evento.VerAplic.Value,
      resumoNFSeEvento.Evento.DataEvento
    ));

    case resposta.Resultado of
      wsSucesso:
        begin
          FObserver.OnMessage('Cancelamento homologado. Salvando dados');

          FAtualizarSituacaoService.ExecutarCancelamento( resumoNFSeEvento, FACBr.CancelamentoResponse );
          transaction.Commit();
        end;

      wsRejeicao:
        begin
          FObserver.OnMessage('Cancelamento Rejeitado. Salvando erros para consulta');

          updateSitEvent.Free();
          updateSitEvent := NFSeAtualizarEventoRejeicaoModel.Create(
            NFSeId,  EventoId, FACBr.ObterXmlPedidoCanc(), WSErrorSerializer.FormatarMensagem( resposta.Erros )
          );
          FNFSeRepo.AtualizarEventoNFSe( NFSeAtualizarEventoRejeicaoModel( updateSitEvent ));
          transaction.Commit();
        end;

      wsEmProcessamento:
        begin
          FObserver.OnMessage('Cancelamento Em Processamento. Consultar em instantes');

          updateSitEvent.Free();
          updateSitEvent := NFSeAtualizarEventoEmProcessamentoModel.Create(
            NFSeId, EventoId, FACBr.ObterXmlPedidoCanc()
          );
          FNFSeRepo.AtualizarEventoNFSe( NFSeAtualizarEventoEmProcessamentoModel( updateSitEvent ));
          transaction.Commit();
        end;

      wsFalhaComunicacao, wsFalhaImplementacao:
        begin
          FObserver.OnMessage('Falha de comunicação ou implementação. Consulte o histórico para mais detalhes');

          updateSitEvent.Free();
          updateSitEvent := NFSeAtualizarEventoFalhaModel.Create(
            NFSeId,
            EventoId,
            FACBr.ObterXmlPedidoCanc(),
            Format('%s - %s: %s', [
              TipoEventoNFSeEnumStr[TipoEventoNFSeEnum.tenCancelamento],
              SituacaoNFSeEnumStr[sdpsEmissao],
              WSErrorSerializer.FormatarMensagem( resposta.Erros )
            ])
          );
          FNFSeRepo.AtualizarEventoNFSe( NFSeAtualizarEventoFalhaModel( updateSitEvent ));
          transaction.Commit();

          Result := ResultadoExecucaoTransmissaoDFeOutput.Create( rodFalhaRegistrada, False );
          Exit;
        end;
    end;

    Result := RetornarSucesso(resposta.Resultado = wsSucesso);

    FObserver.OnComplete();

  except on E: Exception do
    begin
      transaction.Rollback();
      Result := RetornarFalhaNaoTratada();
      FLogError.LogError( 'CancelarNFSeWSUseCase.Executar - DpsId: %s - Empresa: %d - Erro: %s', [ NFSeId, EmpresaId, E.Message ]);
      FObserver.OnError( 'Falha no processo. Consulte o log para detalhes' );
    end;
  end;
  finally
    transaction.Commit();
    resumoNFSeEvento.Free();
    empresa.Free();
    transaction.Free();
    updateSitEvent.Free();
  end;
end;

end.
