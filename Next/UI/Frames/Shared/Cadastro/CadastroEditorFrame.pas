unit CadastroEditorFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Forms, EditorCadastro, CadastroEditorView, ValidationPanelFrame,
  ValidationEntityOutputUnit, PresenterCadastroBase;

type
  // Base dos editores de cadastro: rodape proprio e contratos comuns da aba.
  TfrmCadastroEditor = class(TFrame, ICadastroEditorView, IEditorCadastro)
  private
    FHost: IEditorCadastroHost;
    FRodape: TPanel;
    FBtnSalvar: TButton;
    FBtnCancelar: TButton;
    // Apresentador da funcionalidade. A base responde pela liberacao a partir da  associacao aceita.
    FPresenterCadastro: TPresenterCadastroBase;
    // Painel de validacao da funcionalidade; o componente continua sendo do frame concreto.
    FPainelValidacao: TfrmValidationPanelFrame;
    procedure CriarRodape;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  protected
    // Associa o apresentador da funcionalidade. Ate a atribuicao a composicao continua dona do apresentador e o
    // libera se a associacao for recusada.
    procedure AssociarPresenter(APresenter: TPresenterCadastroBase);
    // Registra o painel que o frame concreto ja exibe e que continua sendo dele.
    procedure AssociarPainelValidacao(APainel: TfrmValidationPanelFrame);
    // Executa a gravacao da funcionalidade; False mantem o editor e os dados.
    function Salvar: Boolean; virtual;
    property PresenterCadastro: TPresenterCadastroBase read FPresenterCadastro;
  public
    constructor Create(AOwner: TComponent;
      const AHost: IEditorCadastroHost); reintroduce; virtual;
    destructor Destroy; override;
    procedure ShowInformation(const AMessage: string);
    procedure ShowWarning(const AMessage: string);
    procedure ShowError(const AMessage: string);
    function ShowDangerQuestion(const AMessage: string): Boolean;
    function ShowQuestion(const AMessage: string): Boolean;
    function HasPendingChanges: Boolean; virtual;
    function TryFocus: Boolean; virtual;
    procedure ShowValidation(const AValidacao: ValidationEntityOutput); virtual;
    function PrepararAbaInclusao: Boolean;
    function PrepararAbaAlteracao(const AId: string): Boolean;
  end;

implementation

uses
  NextDialogs;

constructor TfrmCadastroEditor.Create(AOwner: TComponent;
  const AHost: IEditorCadastroHost);
begin
  if AHost = nil then
    raise Exception.Create('O hospedeiro do editor de cadastro não foi informado.');
  inherited Create(AOwner);
  FHost := AHost;
  CriarRodape;
end;

destructor TfrmCadastroEditor.Destroy;
begin
  FreeAndNil(FPresenterCadastro);
  inherited;
end;

procedure TfrmCadastroEditor.CriarRodape;
begin
  FRodape := TPanel.Create(Self);
  FRodape.Parent := Self;
  FRodape.Align := alBottom;
  FRodape.Height := 44;
  FRodape.BevelOuter := bvNone;
  FRodape.Caption := '';

  FBtnCancelar := TButton.Create(FRodape);
  FBtnCancelar.Parent := FRodape;
  FBtnCancelar.Caption := 'Cancelar';
  FBtnCancelar.Width := 110;
  FBtnCancelar.Height := 32;
  FBtnCancelar.Top := 6;
  FBtnCancelar.Anchors := [akTop, akRight];
  FBtnCancelar.Left := ClientWidth - 16 - FBtnCancelar.Width;
  FBtnCancelar.OnClick := btnCancelarClick;

  FBtnSalvar := TButton.Create(FRodape);
  FBtnSalvar.Parent := FRodape;
  FBtnSalvar.Caption := 'Salvar';
  FBtnSalvar.Width := 110;
  FBtnSalvar.Height := 32;
  FBtnSalvar.Top := 6;
  FBtnSalvar.Anchors := [akTop, akRight];
  FBtnSalvar.Left := FBtnCancelar.Left - FBtnSalvar.Width - 8;
  FBtnSalvar.OnClick := btnSalvarClick;
end;

procedure TfrmCadastroEditor.btnSalvarClick(Sender: TObject);
var
  Notificado: Boolean;
begin
  FBtnSalvar.Enabled := False;
  FBtnCancelar.Enabled := False;
  Notificado := False;
  try
    if Salvar then
    begin
      FHost.EditorSalvo(Self);
      Notificado := True;
    end;
  finally
    // Com o fechamento pendente os comandos continuam desabilitados.
    if not Notificado then
    begin
      FBtnSalvar.Enabled := True;
      FBtnCancelar.Enabled := True;
    end;
  end;
end;

procedure TfrmCadastroEditor.btnCancelarClick(Sender: TObject);
begin
  FBtnSalvar.Enabled := False;
  FBtnCancelar.Enabled := False;
  FHost.EditorCancelado(Self);
end;

procedure TfrmCadastroEditor.AssociarPresenter(APresenter: TPresenterCadastroBase);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador da consulta nao foi informado');

  FPresenterCadastro := APresenter;
end;

procedure TfrmCadastroEditor.AssociarPainelValidacao(
  APainel: TfrmValidationPanelFrame);
begin
  if APainel = nil then
    raise Exception.Create('O painel de validação do editor de cadastro não foi informado.');

  FPainelValidacao := APainel;
end;

function TfrmCadastroEditor.Salvar: Boolean;
begin
  Result := False;
end;

function TfrmCadastroEditor.HasPendingChanges: Boolean;
begin
  Result := False;
end;

function TfrmCadastroEditor.TryFocus: Boolean;
begin
  Result := False;
end;

procedure TfrmCadastroEditor.ShowValidation(
  const AValidacao: ValidationEntityOutput);
begin
  if FPainelValidacao <> nil then
    FPainelValidacao.ExibirValidacao(AValidacao);
end;

procedure TfrmCadastroEditor.ShowInformation(const AMessage: string);
begin
  TNextDialogs.ShowInformation(AMessage);
end;

procedure TfrmCadastroEditor.ShowWarning(const AMessage: string);
begin
  TNextDialogs.ShowWarning(AMessage);
end;

procedure TfrmCadastroEditor.ShowError(const AMessage: string);
begin
  TNextDialogs.ShowError(AMessage);
end;

function TfrmCadastroEditor.ShowDangerQuestion(
  const AMessage: string): Boolean;
begin
  Result := TNextDialogs.ShowDangerQuestion(AMessage);
end;

function TfrmCadastroEditor.ShowQuestion(const AMessage: string): Boolean;
begin
  Result := TNextDialogs.ShowQuestion(AMessage);
end;

function TfrmCadastroEditor.PrepararAbaInclusao: Boolean;
begin
  Result := (FPresenterCadastro <> nil) and FPresenterCadastro.PrepararInclusao;
end;

function TfrmCadastroEditor.PrepararAbaAlteracao(const AId: string): Boolean;
begin
  Result := (FPresenterCadastro <> nil) and FPresenterCadastro.PrepararAlteracao(AId);
end;

end.
