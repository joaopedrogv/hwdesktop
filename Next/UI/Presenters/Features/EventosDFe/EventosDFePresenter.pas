unit EventosDFePresenter;

interface

uses
  AuthorizationService, EventosDFeView, RemoverEventoDFeUseCaseUnit,
  TransmitirEventoDFeUseCaseUnit, ConsultarSituacaoEventoDFeUseCaseUnit,
  EventoDFeTransmissaoTypesUnit, NextDatasetDefinition,
  EventosDFeQueryDefinition, PresenterConsultaBase;

type
  // A preparação, o carregamento e a gravação do registro pertencem ao apresentador do cadastro.
  TEventosDFePresenter = class(TPresenterConsultaBase)
  private
    // A view pertence à tela e as demais dependências ao container de composição: o apresentador apenas as utiliza e
    // nunca as libera.
    FView: IEventosDFeView;
    FQueryDefinition: INextDatasetDefinition<TEventoDFeSelecionado>;
    FRemoverEvento: IRemoverEventoDFeUseCase;
    FTransmitirEvento: TransmitirEventoDFeUseCase;
    FConsultarSituacaoEvento: ConsultarSituacaoEventoDFeUseCase;
    FOperacaoEmAndamento: Boolean;
    procedure ApresentarResultadoTransmissao(const AResultado: TEventoDFeResultadoTransmissao);
    procedure ApresentarResultadoConsultaSituacao(
      const AResultado: TEventoDFeResultadoConsultarSituacao);
  public
    constructor Create(const AView: IEventosDFeView;
      AQueryDefinition: INextDatasetDefinition<TEventoDFeSelecionado>;
      AAuthorization: IAuthorizationService; ARemoverEvento: IRemoverEventoDFeUseCase;
      ATransmitirEvento: TransmitirEventoDFeUseCase;
      AConsultarSituacaoEvento: ConsultarSituacaoEventoDFeUseCase);
    function PodeTransmitir: Boolean;
    function PodeConsultarSituacao: Boolean;
    function SolicitarTransmissao: Boolean;
    function SolicitarConsultaSituacao: Boolean;
    function EnviarParaLixeira: Boolean;
    function SolicitarInclusao: Boolean;
    function SolicitarEdicao: Boolean;
    function SolicitarRestauracao: Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, StatusRegistroEnumUnit, TipoEventoDFeUnit,
  EventoDFeStatusUnit, EventoDFeConsultaDecisaoUnit;

const
  // Códigos do cadastro legado usados por esta funcionalidade. O host recebe o processo, a ação, a tabela e a chave e
  // não os conhece.
  ProcessoConsulta = 'EVT001';
  ProcessoInclusao = 'EVT002';
  ProcessoAlteracao = 'EVT003';
  ProcessoExclusao112150 = 'EVT006';
  ProcessoExclusao211130 = 'EVT007';
  ProcessoRestauracao = 'EVT008';
  ProcessoTransmissao = 'EVT009';
  ProcessoConsultaSituacao = 'EVT010';
  TabelaEventosDFe = 'EVENTOS_DFE';
  Tabela112150 = 'EVENTOS_DFE_112150';
  Tabela211130 = 'EVENTOS_DFE_211130_ITEM';

  SelecaoObrigatoriaMessage = 'Selecione um evento DF-e na grade.';

function StatusTransmitivel(const AStatus: TStatusEventoDFe): Boolean;
begin
  Result := AStatus in [sePendente, seRejeitado, seEnviando];
end;

function StatusConsultavel(const AStatus: TStatusEventoDFe): Boolean;
begin
  Result := AStatus in [seEnviando, seRejeitado, seAutorizado];
end;

constructor TEventosDFePresenter.Create(const AView: IEventosDFeView;
  AQueryDefinition: INextDatasetDefinition<TEventoDFeSelecionado>;
  AAuthorization: IAuthorizationService; ARemoverEvento: IRemoverEventoDFeUseCase;
  ATransmitirEvento: TransmitirEventoDFeUseCase;
  AConsultarSituacaoEvento: ConsultarSituacaoEventoDFeUseCase);
begin
  // O processo de pesquisa e a tabela padrão ficam na base, que também responde pela permissão da consulta.
  inherited Create(AAuthorization, ProcessoConsulta, TabelaEventosDFe);
  if AView = nil then
    raise Exception.Create('A view de Eventos DF-e não foi informada.');
  if AQueryDefinition = nil then
    raise Exception.Create('A consulta de Eventos DF-e não foi informada.');
  if ARemoverEvento = nil then
    raise Exception.Create('O caso de uso de remoção de Eventos DF-e não foi informado.');
  if ATransmitirEvento = nil then
    raise Exception.Create('O caso de uso de transmissão de Eventos DF-e não foi informado.');
  if AConsultarSituacaoEvento = nil then
    raise Exception.Create('O caso de uso de consulta de situação de Eventos DF-e não foi informado.');

  FView := AView;
  FQueryDefinition := AQueryDefinition;
  FRemoverEvento := ARemoverEvento;
  FTransmitirEvento := ATransmitirEvento;
  FConsultarSituacaoEvento := AConsultarSituacaoEvento;
end;

function TEventosDFePresenter.PodeTransmitir: Boolean;
var
  Selecao: TEventoDFeSelecionado;
begin
  Result := FQueryDefinition.TryGetSelected(Selecao) and (Trim(Selecao.Id) <> '') and
    (Selecao.Ativo = saAtivo) and StatusTransmitivel(Selecao.Status);
end;

function TEventosDFePresenter.PodeConsultarSituacao: Boolean;
var
  Selecao: TEventoDFeSelecionado;
begin
  Result := FQueryDefinition.TryGetSelected(Selecao) and (Trim(Selecao.Id) <> '') and
    (Selecao.Ativo = saAtivo) and StatusConsultavel(Selecao.Status);
end;

function TEventosDFePresenter.SolicitarTransmissao: Boolean;
var
  Selecao: TEventoDFeSelecionado;
  Resultado: TEventoDFeResultadoTransmissao;
begin
  Result := False;

  if FOperacaoEmAndamento then
    Exit;

  if not FQueryDefinition.TryGetSelected(Selecao) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Selecao.Ativo <> saAtivo then
  begin
    FView.ShowWarning('O evento está na lixeira; restaure-o antes de transmitir.');
    Exit;
  end;

  if not StatusTransmitivel(Selecao.Status) then
  begin
    FView.ShowWarning('O evento não permite transmissão no estado atual.');
    Exit;
  end;

  if not Autorizar(ProcessoTransmissao, aaAlterar, TabelaEventosDFe, IntToStr(Selecao.SeqId)) then
    Exit;

  FView.StartWaiting('Iniciando transmissào');
  FOperacaoEmAndamento := True;
  try
    // A linha é recarregada mesmo quando o envio falha: o estado pode ter mudado antes do erro.
    Result := True;
    try
      Resultado := FTransmitirEvento.Executar(Selecao.Id);
      ApresentarResultadoTransmissao(Resultado);
    except
      on E: EValidacaoNegocio do
        FView.ShowWarning(E.Message);
      on E: Exception do
        FView.ShowError('Não foi possível transmitir o evento DF-e.');
    end;
  finally
    FView.EndWaiting();
    FOperacaoEmAndamento := False;
  end;
end;

procedure TEventosDFePresenter.ApresentarResultadoTransmissao(
  const AResultado: TEventoDFeResultadoTransmissao);
var
  Mensagem: string;
begin
  case AResultado.Classe of
    crAutorizado:
      begin
        Mensagem := 'Evento autorizado.';
        if Trim(AResultado.NProt) <> '' then
          Mensagem := Mensagem + sLineBreak + 'Protocolo: ' + AResultado.NProt;
        if AResultado.DhRegEvento > 0 then
          Mensagem := Mensagem + sLineBreak + 'Registro: ' +
            FormatDateTime('dd/mm/yyyy hh:nn:ss', AResultado.DhRegEvento);
        FView.ShowInformation(Mensagem);
      end;
    crRejeitado:
      begin
        if AResultado.OrigemResultado = orLocal then
        begin
          Mensagem := 'O evento não foi transmitido por falha na validação local.';
          if Trim(AResultado.XMotivo) <> '' then
            Mensagem := Mensagem + sLineBreak + AResultado.XMotivo;
        end
        // Rejeição da NF-e apurada na consulta: não houve lote nem evento enviados.
        else if (AResultado.CStatLote = 0) and (AResultado.CStatEvento = 0) then
          Mensagem := 'A NF-e não permite evento: ' + AResultado.XMotivo
        else if AResultado.CStatEvento <> 0 then
          Mensagem := Format('Evento rejeitado (situação %d): %s',
            [AResultado.CStatEvento, AResultado.XMotivo])
        else
          Mensagem := 'Evento rejeitado: ' + AResultado.XMotivo;
        FView.ShowWarning(Mensagem);
      end;
    crSemResposta:
      FView.ShowWarning('Não foi possível confirmar a transmissão. ' +
        'Use Consultar situação antes de tentar novamente.');
  end;
end;

function TEventosDFePresenter.SolicitarConsultaSituacao: Boolean;
var
  Selecao: TEventoDFeSelecionado;
  Resultado: TEventoDFeResultadoConsultarSituacao;
begin
  Result := False;

  if FOperacaoEmAndamento then
    Exit;

  if not FQueryDefinition.TryGetSelected(Selecao) or (Trim(Selecao.Id) = '') then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Selecao.Ativo <> saAtivo then
  begin
    FView.ShowWarning('O evento está na lixeira; restaure-o antes de consultar a situação.');
    Exit;
  end;

  if not StatusConsultavel(Selecao.Status) then
  begin
    FView.ShowWarning('O evento não permite consulta de situação no estado atual.');
    Exit;
  end;

  if not Autorizar(ProcessoConsultaSituacao, aaAlterar, TabelaEventosDFe,
    IntToStr(Selecao.SeqId)) then
    Exit;

  FView.StartWaiting('Iniciando consulta');
  FOperacaoEmAndamento := True;
  try
    // A linha é recarregada mesmo quando a consulta falha: o estado pode ter mudado antes do erro.
    Result := True;
    try
      Resultado := FConsultarSituacaoEvento.Executar(Selecao.Id);
      ApresentarResultadoConsultaSituacao(Resultado);
    except
      on E: EValidacaoNegocio do
        FView.ShowWarning(E.Message);
      on E: Exception do
        // O texto técnico da consulta não deve chegar à interface.
        FView.ShowError('Não foi possível consultar a situação do evento DF-e.');
    end;
  finally
    FView.EndWaiting();
    FOperacaoEmAndamento := False;
  end;
end;

procedure TEventosDFePresenter.ApresentarResultadoConsultaSituacao(
  const AResultado: TEventoDFeResultadoConsultarSituacao);
var
  Mensagem: string;
begin
  case AResultado.Decisao of
    dcEventoAutorizado:
      begin
        Mensagem := 'Evento autorizado.';
        if Trim(AResultado.NProt) <> '' then
          Mensagem := Mensagem + sLineBreak + 'Protocolo: ' + AResultado.NProt;
        if AResultado.DhRegEvento > 0 then
          Mensagem := Mensagem + sLineBreak + 'Registro: ' +
            FormatDateTime('dd/mm/yyyy hh:nn:ss', AResultado.DhRegEvento);
        FView.ShowInformation(Mensagem);
      end;
    dcNfeNaoApta:
      FView.ShowWarning('A NF-e não permite evento: ' + AResultado.XMotivo);
    dcColisao:
      if AResultado.StatusEvento = seRejeitado then
        FView.ShowWarning(Format('Evento rejeitado (situação %d): %s',
          [AResultado.CStatEvento, AResultado.XMotivo]))
      else
        FView.ShowWarning(Format('A SEFAZ possui um evento para esta chave com a situação %d: %s',
          [AResultado.CStatEvento, AResultado.XMotivo]));
    dcNaoRegistrado:
      if AResultado.StatusEvento = sePendente then
        FView.ShowInformation('O evento não consta na SEFAZ para esta chave e sequência. ' +
          'Ele está Pendente e pode ser transmitido.')
      else
        FView.ShowInformation('O evento não consta na SEFAZ para esta chave e sequência; ' +
          'nenhuma alteração foi feita.');
    dcEventoEmProcessamento:
      FView.ShowInformation(Format(
        'O evento ainda está em processamento na SEFAZ (situação %d): %s. Consulte novamente mais tarde.',
        [AResultado.CStatEvento, AResultado.XMotivo]));
  else
    Exit;
  end;
end;

function TEventosDFePresenter.EnviarParaLixeira: Boolean;
var
  Selecao: TEventoDFeSelecionado;
  Processo: string;
  Tabela: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selecao) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Trim(Selecao.Id) = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Selecao.Ativo <> saAtivo then
  begin
    FView.ShowWarning('O evento já está na lixeira.');
    Exit;
  end;

  if Selecao.Status = seEnviando then
  begin
    FView.ShowWarning('O evento está Enviando; aguarde a conclusão da transmissão antes de excluí-lo.');
    Exit;
  end;

  if Selecao.Status = seAutorizado then
  begin
    FView.ShowWarning('Evento autorizado não pode ser excluído.');
    Exit;
  end;

  if not FView.ShowDangerQuestion(Format('Deseja enviar o evento "%s" (%s) para a lixeira?',
    [Selecao.ChaveDocumento, TipoEventoDFeDisplay(Selecao.TipoEvento)])) then
    Exit;

  if Selecao.TipoEvento = teAtualizacaoPrevisaoEntrega then
  begin
    Processo := ProcessoExclusao112150;
    Tabela := Tabela112150;
  end
  else
  begin
    Processo := ProcessoExclusao211130;
    Tabela := Tabela211130;
  end;

  if not Autorizar(Processo, aaExcluir, Tabela, IntToStr(Selecao.SeqId)) then
    Exit;

  try
    FRemoverEvento.Executar(Selecao.Id);
    Result := True;
  except
    on E: EValidacaoNegocio do
      FView.ShowError(E.Message);
    on E: Exception do
      // O texto técnico do banco não deve chegar à interface.
      FView.ShowError('Não foi possível enviar o evento para a lixeira.');
  end;
end;

function TEventosDFePresenter.SolicitarInclusao: Boolean;
var
  Tipo: TipoEventoDFe;
  Chave: string;
begin
  Result := False;

  // A negativa ou o cancelamento já foi apresentado pelo legado.
  if not Autorizar(ProcessoInclusao, aaInserir, TabelaEventosDFe, '') then
    Exit;

  if not FView.SelecionarTipoEvento(Tipo) then
    Exit;

  Chave := IntToStr(TipoEventoDFeCodigo(Tipo));
  if FView.AtivarInclusao(Chave) then
    Result := True
  else
    Result := FView.AbrirInclusao(Chave, 'Inclusão - ' + TipoEventoDFeDisplay(Tipo));
end;

function TEventosDFePresenter.SolicitarEdicao: Boolean;
var
  Selecao: TEventoDFeSelecionado;
  Chave: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selecao) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Trim(Selecao.Id) = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Selecao.Ativo <> saAtivo then
  begin
    FView.ShowWarning('O evento está na lixeira; use Restaurar.');
    Exit;
  end;

  Chave := IntToStr(TipoEventoDFeCodigo(Selecao.TipoEvento)) + ':' + Selecao.Id;
  if FView.AtivarEdicao(Chave) then
  begin
    Result := True;
    Exit;
  end;

  // A permissão de alteração é verificada antes de o cadastro carregar o registro.
  if not Autorizar(ProcessoAlteracao, aaAlterar, TabelaEventosDFe, IntToStr(Selecao.SeqId)) then
    Exit;

  Result := FView.AbrirEdicao(Selecao, meAlteracao);
end;

function TEventosDFePresenter.SolicitarRestauracao: Boolean;
var
  Selecao: TEventoDFeSelecionado;
  Chave: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selecao) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Trim(Selecao.Id) = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Selecao.Ativo <> saLixeira then
  begin
    FView.ShowWarning('O evento não está na lixeira.');
    Exit;
  end;

  // A chave é a mesma da alteração: a aba já aberta é reativada e o modo é validado na gravação.
  Chave := IntToStr(TipoEventoDFeCodigo(Selecao.TipoEvento)) + ':' + Selecao.Id;
  if FView.AtivarEdicao(Chave) then
  begin
    Result := True;
    Exit;
  end;

  if not Autorizar(ProcessoRestauracao, aaAlterar, TabelaEventosDFe, IntToStr(Selecao.SeqId)) then
    Exit;

  Result := FView.AbrirEdicao(Selecao, meRestauracao);
end;

end.
