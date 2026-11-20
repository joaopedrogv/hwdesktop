unit EventoDFe112150CadastroFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.StdCtrls, Vcl.Mask, CadastroEditorFrame,
  EditorCadastro, EventoDFe112150CadastroView, EventoDFe112150CadastroPresenter,
  EventoDFe112150EtdUnit, TipoEventoDFeUnit;

type
  TfrmEventoDFe112150CadastroFrame = class(TfrmCadastroEditor,
    IEventoDFe112150CadastroView)
    lblChaveDocumento: TLabel;
    edChaveDocumento: TEdit;
    lblDataPrevisao: TLabel;
    edDataPrevisaoEntrega: TMaskEdit;
  private
    // A alteração recebe uma cópia independente do registro carregado; o frame libera o rascunho ao ser destruído,
    // junto com a aba.
    FRascunho: EventoDFe112150Etd;
    function GetPresenter: TEventoDFe112150CadastroPresenter;
    function AplicarCamposAoRascunho: Boolean;
    procedure LimparCampos;
    procedure LimparValidacao;
    property Presenter: TEventoDFe112150CadastroPresenter read GetPresenter;
  public
    constructor Create(AOwner: TComponent; const AHost: IEditorCadastroHost); override;
    destructor Destroy; override;
    // A composição entrega o apresentador ao frame, que passa a liberá-lo.
    procedure ConfigurarPresenter(APresenter: TEventoDFe112150CadastroPresenter);
    function PrepararInclusao: Boolean;
    // A entidade recebida não é assumida: o frame guarda um clone próprio.
    function PrepararAlteracao(const AEvento: EventoDFe112150Etd;
      AModo: TModoEventoDFe): Boolean;
    function PrepararAbaRestauracao(const AId: string): Boolean;
    function HasPendingChanges: Boolean; override;
    function TryFocus: Boolean; override;
  protected
    function Salvar: Boolean; override;
  end;

implementation

{$R *.dfm}

uses
  DateTimeServiceUnit;

constructor TfrmEventoDFe112150CadastroFrame.Create(AOwner: TComponent;
  const AHost: IEditorCadastroHost);
begin
  inherited Create(AOwner, AHost);

  fraValidacao.Bind(edChaveDocumento);
  fraValidacao.Bind(edDataPrevisaoEntrega);
end;

destructor TfrmEventoDFe112150CadastroFrame.Destroy;
begin
  FreeAndNil(FRascunho);
  inherited;
end;

procedure TfrmEventoDFe112150CadastroFrame.ConfigurarPresenter(
  APresenter: TEventoDFe112150CadastroPresenter);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador do cadastro do evento 112150 não foi informado.');

  AssociarPresenter(APresenter);
end;

procedure TfrmEventoDFe112150CadastroFrame.LimparValidacao;
begin
  fraValidacao.Limpar;
end;

procedure TfrmEventoDFe112150CadastroFrame.LimparCampos;
begin
  edChaveDocumento.Clear;
  edDataPrevisaoEntrega.Clear;
end;

function TfrmEventoDFe112150CadastroFrame.PrepararInclusao: Boolean;
begin
  FreeAndNil(FRascunho);
  LimparCampos;
  LimparValidacao;

  FRascunho := EventoDFe112150Etd.Create;
  Result := True;
end;

function TfrmEventoDFe112150CadastroFrame.PrepararAlteracao(
  const AEvento: EventoDFe112150Etd; AModo: TModoEventoDFe): Boolean;
begin
  Result := False;
  if AEvento = nil then
    raise Exception.Create('O evento da alteração não foi informado.');

  FreeAndNil(FRascunho);
  FRascunho := EventoDFe112150Etd(AEvento.Clone);
  // A intenção de restauração pertence ao rascunho e somente a gravação a aplica.
  FRascunho.Restaurar := AModo = meRestauracao;

  LimparCampos;
  LimparValidacao;

  edChaveDocumento.Text := FRascunho.ChaveDocumento;
  if FRascunho.DataPrevisaoEntrega > 0 then
    edDataPrevisaoEntrega.Text := DateService.ParseLocal(FRascunho.DataPrevisaoEntrega);

  if AModo = meRestauracao then
    ShowWarning('Este evento está na lixeira. Salvar irá restaurá-lo.');

  Result := True;
end;

function TfrmEventoDFe112150CadastroFrame.PrepararAbaRestauracao(
  const AId: string): Boolean;
begin
  Result := (PresenterCadastro <> nil) and
    Presenter.PrepararAlteracao(AId, meRestauracao);
end;

function TfrmEventoDFe112150CadastroFrame.Salvar: Boolean;
begin
  Result := False;

  LimparValidacao;
  if not AplicarCamposAoRascunho then
    Exit;

  Result := Presenter.Salvar(FRascunho);
end;

function TfrmEventoDFe112150CadastroFrame.GetPresenter: TEventoDFe112150CadastroPresenter;
begin
  Result := TEventoDFe112150CadastroPresenter(PresenterCadastro);
end;

function TfrmEventoDFe112150CadastroFrame.AplicarCamposAoRascunho: Boolean;
begin
  Result := FRascunho <> nil;
  if not Result then
    Exit;

  FRascunho.ChaveDocumento := Trim(edChaveDocumento.Text);
  FRascunho.DataPrevisaoEntrega := DateService.FromLocalToDateDef(edDataPrevisaoEntrega.Text, 0);
end;

function TfrmEventoDFe112150CadastroFrame.HasPendingChanges: Boolean;
begin
  Result := FRascunho <> nil;
end;

function TfrmEventoDFe112150CadastroFrame.TryFocus: Boolean;
begin
  Result := fraValidacao.FocarPrimeiroErro;
  if Result then
    Exit;

  // Sem erro vinculado, a chave continua sendo o primeiro campo.
  if edChaveDocumento.CanFocus then
  begin
    edChaveDocumento.SetFocus;
    Result := True;
  end;
end;

end.
