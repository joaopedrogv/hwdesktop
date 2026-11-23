unit CadastroEditorFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Forms, EditorCadastro, CadastroEditorView, ValidationPanelFrame,
  ValidationEntityOutputUnit, PresenterCadastroBase, System.ImageList, Vcl.ImgList;

type
  TfrmCadastroEditor = class(TFrame, ICadastroEditorView, IEditorCadastro)
    sbCampos: TScrollBox;
    pnCampos: TPanel;
    fraValidacao: TfrmValidationPanelFrame;
    pnRodape: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    imgListCadastro: TImageList;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FHost: IEditorCadastroHost;
    FPresenterCadastro: TPresenterCadastroBase;
  protected
    // Até a atribuição, a composição continua dona do apresentador e o libera se a associação falhar.
    procedure AssociarPresenter(APresenter: TPresenterCadastroBase);
    function Salvar: Boolean; virtual;
    property PresenterCadastro: TPresenterCadastroBase read FPresenterCadastro;
  public
    constructor Create(AOwner: TComponent; const AHost: IEditorCadastroHost); reintroduce; virtual;
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

{$R *.dfm}

uses
  NextDialogs;

constructor TfrmCadastroEditor.Create(AOwner: TComponent; const AHost: IEditorCadastroHost);
begin
  if AHost = nil then
    raise Exception.Create('O hospedeiro do editor de cadastro não foi informado.');
  inherited Create(AOwner);
  FHost := AHost;
end;

destructor TfrmCadastroEditor.Destroy;
begin
  FreeAndNil(FPresenterCadastro);
  inherited;
end;

procedure TfrmCadastroEditor.btnSalvarClick(Sender: TObject);
var
  Notificado: Boolean;
begin
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
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
      btnSalvar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
  end;
end;

procedure TfrmCadastroEditor.btnCancelarClick(Sender: TObject);
begin
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  FHost.EditorCancelado(Self);
end;

procedure TfrmCadastroEditor.AssociarPresenter(APresenter: TPresenterCadastroBase);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador da consulta nao foi informado');

  FPresenterCadastro := APresenter;
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

procedure TfrmCadastroEditor.ShowValidation(const AValidacao: ValidationEntityOutput);
begin
  fraValidacao.ExibirValidacao(AValidacao);
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

function TfrmCadastroEditor.ShowDangerQuestion(const AMessage: string): Boolean;
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
