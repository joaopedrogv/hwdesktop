unit GruposFiscaisForm;

interface

uses
  System.SysUtils,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm, PresenterConsultaBase,
  GruposFiscaisPresenter, GruposFiscaisView, NextDatasetDefinition,
  LocalPreferences,
  GruposFiscaisQueryDefinition, GrupoFiscalCadastroFrame, EditorCadastro, System.ImageList, Vcl.ImgList, Data.DB,
  DataGridFrame, Vcl.Buttons, FilterFrame, Vcl.ExtCtrls, Vcl.ComCtrls, System.Classes;

type
  TfrmGruposFiscais = class(TfrmConsultaBase, IGruposFiscaisView)
    procedure btnNovoAcoesClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  public
    function AbrirEdicao(const ASelecao: TGrupoSelecionado): Boolean;
    function AbrirInclusao: Boolean;
    procedure ConfigurarTela(const ADefinition: INextDatasetDefinitionBase;
      const APresenter: TGruposFiscaisPresenter; const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastroComandos);
  end;

implementation

{$R *.dfm}

procedure TfrmGruposFiscais.ConfigurarTela(const ADefinition: INextDatasetDefinitionBase;
  const APresenter: TGruposFiscaisPresenter; const APreferences: ILocalPreferences;
  const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador de Grupos Fiscais nao foi informado.');
  if ADefinition = nil then
    raise Exception.Create('A definicao da consulta nao foi informada.');

  // As validacoes precisam acontecer antes da posse. a sequencia preserva o resultado esperado
  Attach(ADefinition, 'Grupos Fiscais');
  ConfigurarCriacaoEditorAba(ACriarEditor);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.DatasetId);
  AssociarPresenter(APresenter);

  RegistrarAcao(btnNovoAcoes);
  RegistrarAcao(btnAlterar, True);
  RegistrarAcao(btnExcluir, True);
end;

procedure TfrmGruposFiscais.btnAlterarClick(Sender: TObject);
begin
  TGruposFiscaisPresenter(PresenterConsulta).SolicitarEdicao;
end;

procedure TfrmGruposFiscais.btnExcluirClick(Sender: TObject);
begin
  if not TGruposFiscaisPresenter(PresenterConsulta).EnviarParaLixeira then
    Exit;

  try
    RefreshResult();
  except
    btnPesquisar.Click;
  end;
end;

procedure TfrmGruposFiscais.btnNovoAcoesClick(Sender: TObject);
begin
  TGruposFiscaisPresenter(PresenterConsulta).SolicitarInclusao;
end;

function TfrmGruposFiscais.AbrirEdicao(const ASelecao: TGrupoSelecionado): Boolean;
var
  Id: string;
  PreparacaoFalhou: Boolean;
begin
  Result := False;
  Id := Trim(ASelecao.Id);
  if Id = '' then
    Exit;

  PreparacaoFalhou := False;
  Result := AbrirAba(Id, 'Alterar - ' + ASelecao.Descricao,
    procedure(AEditor: TWinControl)
    begin
      if TfrmGrupoFiscalCadastroFrame(AEditor).PrepararAbaAlteracao(Id) then
        Exit;
      PreparacaoFalhou := True;
      // Abort interrompe a montagem; a base descarta a aba parcial sem mensagem.
      Abort;
    end);

  if Result or PreparacaoFalhou then
    Exit;

  ShowError('Não foi possível iniciar a alteração do grupo fiscal.');
end;

function TfrmGruposFiscais.AbrirInclusao: Boolean;
var
  PreparacaoFalhou: Boolean;
begin
  PreparacaoFalhou := False;
  Result := AbrirAba(ChaveAbaInclusao, 'Inclusão',
    procedure(AEditor: TWinControl)
    begin
      if TfrmGrupoFiscalCadastroFrame(AEditor).PrepararAbaInclusao then
        Exit;
      PreparacaoFalhou := True;
      // Abort interrompe a montagem; a base descarta a aba parcial sem mensagem.
      Abort;
    end);

  if Result or PreparacaoFalhou then
    Exit;

  ShowError('Não foi possível iniciar a inclusão do grupo fiscal.');
end;

end.
