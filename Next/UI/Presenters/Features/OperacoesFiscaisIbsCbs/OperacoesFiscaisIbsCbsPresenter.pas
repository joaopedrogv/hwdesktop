unit OperacoesFiscaisIbsCbsPresenter;

interface

uses
  AuthorizationService, OperacoesFiscaisIbsCbsView,
  RemoverOperacaoFiscalIbsCbsUseCaseUnit, NextQueryDefinition,
  OperacoesFiscaisIbsCbsQueryDefinition, PresenterConsultaBase;

type
  // A preparacao, a gravacao e a conferencia do registro pertencem ao apresentador do cadastro.
  TOperacoesFiscaisIbsCbsPresenter = class(TPresenterConsultaBase)
  private
    // A view pertence a tela e as demais dependencias ao container de composicao: o apresentador apenas as utiliza e
    // nunca as libera.
    FView: IOperacoesFiscaisIbsCbsView;
    FQueryDefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
    FRemover: RemoverOperacaoFiscalIbsCbsUseCase;
  public
    constructor Create(const AView: IOperacoesFiscaisIbsCbsView;
      const AQueryDefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
      const AAuthorization: IAuthorizationService; ARemover: RemoverOperacaoFiscalIbsCbsUseCase);
    function EnviarParaLixeira: Boolean;
    function SolicitarInclusao: Boolean;
    function SolicitarEdicao: Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit;

const
  // Codigos do cadastro legado usados por esta funcionalidade. O host recebe o processo, a acao e a tabela e nao os
  // conhece.
  ProcessoConsulta = 'MOD020';
  ProcessoExclusao = 'MOD024';
  TabelaOperacoesFiscais = 'OP_FISCAIS_IBSCBS';
  SelecaoObrigatoriaMessage = 'Selecione uma operação fiscal na grade.';

constructor TOperacoesFiscaisIbsCbsPresenter.Create(
  const AView: IOperacoesFiscaisIbsCbsView;
  const AQueryDefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
  const AAuthorization: IAuthorizationService; ARemover: RemoverOperacaoFiscalIbsCbsUseCase);
begin
  // O processo de pesquisa e a tabela padrao ficam na base, que tambem responde pela permissao da consulta.
  inherited Create(AAuthorization, ProcessoConsulta, TabelaOperacoesFiscais);
  if AView = nil then
    raise Exception.Create('A view de Operações Fiscais IBS/CBS não foi informada.');
  if AQueryDefinition = nil then
    raise Exception.Create('A consulta de Operações Fiscais IBS/CBS não foi informada.');
  if ARemover = nil then
    raise Exception.Create('O caso de uso de remoção de Operações Fiscais IBS/CBS não foi informado.');

  FView := AView;
  FQueryDefinition := AQueryDefinition;
  FRemover := ARemover;
end;

function TOperacoesFiscaisIbsCbsPresenter.EnviarParaLixeira: Boolean;
var
  Selected: TOperacaoFiscalSelecionada;
  Descricao: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selected) then
    Exit;

  Descricao := Trim(Selected.OperacaoInternaDescricao);
  if Trim(Selected.RegraFiscalDescricao) <> '' then
    Descricao := Descricao + ' / ' + Trim(Selected.RegraFiscalDescricao);
  if Trim(Selected.GrupoFiscalDescricao) <> '' then
    Descricao := Descricao + ' / ' + Trim(Selected.GrupoFiscalDescricao);

  if not FView.ShowDangerQuestion(Format('Deseja enviar a operação fiscal "%s" para a lixeira?', [Descricao])) then
    Exit;

  if not Autorizar(ProcessoExclusao, aaExcluir) then
    Exit;

  try
    FRemover.Executar(Selected.Id);
    Result := True;
  except
    on E: EValidacaoNegocio do
      FView.ShowError(E.Message);
    on E: Exception do
      FView.ShowError('Não foi possível enviar a operação fiscal para a lixeira.');
  end;
end;

function TOperacoesFiscaisIbsCbsPresenter.SolicitarInclusao: Boolean;
begin
  Result := FView.AtivarInclusao;
  if Result then
    Exit;

  Result := FView.AbrirInclusao;
end;

function TOperacoesFiscaisIbsCbsPresenter.SolicitarEdicao: Boolean;
var
  Selected: TOperacaoFiscalSelecionada;
  Id: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selected) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  Id := Trim(Selected.Id);
  if Id = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if FView.AtivarEdicao(Id) then
  begin
    Result := True;
    Exit;
  end;

  Selected.Id := Id;
  Result := FView.AbrirEdicao(Selected);
end;

end.
