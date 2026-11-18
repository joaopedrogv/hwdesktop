unit GruposFiscaisCadastroPresenter;

interface

uses
  AuthorizationService, GruposFiscaisCadastroView, ObterGruposFiscaisUseCaseUnit,
  SalvarGrupoFiscalUseCaseUnit, GrupoFiscalEtdUnit, PresenterCadastroBase;

type
  // Nao conhece a consulta, a grade nem as abas.
  TGruposFiscaisCadastroPresenter = class(TPresenterCadastroBase)
  private
    // A view pertence ao frame do editor e as demais dependencias ao container de composicao: o apresentador apenas as
    // utiliza e nunca as libera.
    FView: IGruposFiscaisCadastroView;
    FObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase;
    FSalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
  public
    constructor Create(const AView: IGruposFiscaisCadastroView; const AAuthorization: IAuthorizationService;
      AObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase; ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase);
    function PrepararInclusao: Boolean; override;
    function PrepararAlteracao(const AId: string): Boolean; override;
    function Salvar(const ARascunho: GrupoFiscalEtd): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, StatusRegistroEnumUnit,
  CreateEntityUseCaseOutputUnit;

const
  // Codigo do cadastro legado usado por esta funcionalidade. O host recebe o processo, a acao e a tabela e nao os
  // conhece.
  ProcessoGravacao = 'MOD011';
  TabelaGruposFiscais = 'GRUPOS_FISCAIS';

constructor TGruposFiscaisCadastroPresenter.Create(const AView: IGruposFiscaisCadastroView;
  const AAuthorization: IAuthorizationService;
  AObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase; ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase);
begin
  inherited Create(AAuthorization, TabelaGruposFiscais);
  if AView = nil then
    raise Exception.Create('A view do cadastro de Grupos Fiscais não foi informada.');
  if AObterGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de carregamento de Grupos Fiscais não foi informado.');
  if ASalvarGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de gravação de Grupos Fiscais não foi informado.');

  FView := AView;
  FObterGrupoFiscal := AObterGrupoFiscal;
  FSalvarGrupoFiscal := ASalvarGrupoFiscal;
end;

function TGruposFiscaisCadastroPresenter.PrepararInclusao: Boolean;
begin
  Result := FView.PrepararInclusao;
  if Result then
    Exit;

  FView.ShowWarning('Não foi possível carregar as empresas para a inclusão.');
end;

function TGruposFiscaisCadastroPresenter.PrepararAlteracao(const AId: string): Boolean;
var
  Carregado: GrupoFiscalEtd;
begin
  Result := False;

  Carregado := nil;
  try
    try
      Carregado := FObterGrupoFiscal.Executar(AId);
      if Carregado = nil then
      begin
        FView.ShowError('O grupo fiscal selecionado não foi encontrado.');
        Exit;
      end;

      // A consulta apresenta apenas registros ativos.
      if Carregado.Ativo <> saAtivo then
      begin
        FView.ShowError('O grupo fiscal selecionado está fora da consulta de ativos.');
        Exit;
      end;

      if not FView.PrepararAlteracao(Carregado) then
      begin
        FView.ShowWarning('Não foi possível carregar as empresas para a alteração.');
        Exit;
      end;

      Result := True;
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto tecnico do banco nao deve chegar a interface.
        FView.ShowError('Não foi possível carregar o grupo fiscal para alteração.');
    end;
  finally
    // A view copia o grupo para o rascunho do frame; a entidade continua pertencendo a este metodo e e liberada no
    // finally.
    Carregado.Free;
  end;
end;

function TGruposFiscaisCadastroPresenter.Salvar(const ARascunho: GrupoFiscalEtd): Boolean;
var
  Resultado: CreateEntityUseCaseOutPut;
begin
  Result := False;

  if ARascunho = nil then
  begin
    FView.ShowError('O rascunho do grupo fiscal não foi informado.');
    Exit;
  end;

  if not Autorizar(ProcessoGravacao, aaSalvar) then
    Exit;

  Resultado := nil;
  try
    try
      Resultado := FSalvarGrupoFiscal.Executar(ARascunho);

      if Resultado.Validation.IsValid then
        Result := True
      else
        // A validacao volta para o editor que iniciou a gravacao.
        FView.ShowValidation(Resultado.Validation);
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto tecnico do banco nao deve chegar a interface.
        FView.ShowError('Não foi possível salvar o grupo fiscal.');
    end;
  finally
    // O resultado do caso de uso libera a entidade persistida; o apresentador nunca a devolve nem a retem.
    Resultado.Free;
  end;
end;

end.
