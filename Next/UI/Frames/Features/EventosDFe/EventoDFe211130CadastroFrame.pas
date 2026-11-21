unit EventoDFe211130CadastroFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.StdCtrls, Vcl.ComCtrls, CadastroEditorFrame,
  EditorCadastro, EventoDFeCadastroRestauracao, EventoDFe211130CadastroView,
  EventoDFe211130CadastroPresenter, EventoDFe211130EtdUnit,
  EventoDFe211130ItemEtdUnit, EventoDFe211130ItemEditorFactory,
  EventoDFe211130ItensFrame, NextMemoryQueryDefinition, TipoEventoDFeUnit;

type
  TfrmEventoDFe211130CadastroFrame = class(TfrmCadastroEditor,
    IEventoDFe211130CadastroView, IEventoDFeCadastroRestauracao)
    pcSecoes: TPageControl;
    tsEvento: TTabSheet;
    lblChaveDocumento: TLabel;
    edChaveDocumento: TEdit;
    tsItens: TTabSheet;
    fraItens: TfrmEventoDFe211130ItensFrame;
  private
    // A alteração recebe uma cópia independente do registro carregado; o frame libera o rascunho ao ser destruído,
    // junto com a aba.
    FRascunho: EventoDFe211130Etd;
    function GetPresenter: TEventoDFe211130CadastroPresenter;
    function AplicarCamposAoRascunho: Boolean;
    procedure LimparCampos;
    procedure LimparValidacao;
    procedure ItemFeedback(Sender: TObject; const AMensagem: string);
    property Presenter: TEventoDFe211130CadastroPresenter read GetPresenter;
  public
    constructor Create(AOwner: TComponent; const AHost: IEditorCadastroHost); override;
    destructor Destroy; override;
    // A composição entrega a coleção e a fábrica do item; o frame apenas as repassa à grade.
    procedure ConfigurarColecao(const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
      const AEditorFactory: IEventoDFe211130ItemEditorFactory);
    // A composição entrega o apresentador ao frame, que passa a liberá-lo.
    procedure ConfigurarPresenter(APresenter: TEventoDFe211130CadastroPresenter);
    function PrepararInclusao: Boolean;
    // A entidade recebida não é assumida: o frame guarda um clone próprio.
    function PrepararAlteracao(const AEvento: EventoDFe211130Etd;
      AModo: TModoEventoDFe): Boolean;
    function PrepararAbaRestauracao(const AId: string): Boolean;
    function HasPendingChanges: Boolean; override;
    function TryFocus: Boolean; override;
  protected
    function Salvar: Boolean; override;
  end;

implementation

{$R *.dfm}

constructor TfrmEventoDFe211130CadastroFrame.Create(AOwner: TComponent;
  const AHost: IEditorCadastroHost);
begin
  inherited Create(AOwner, AHost);

  fraValidacao.Bind(edChaveDocumento);
  // Os erros do agregado chegam sob 'Itens' e levam o foco à grade da coleção.
  fraValidacao.Bind('Itens', fraItens.ValidationTarget, 'Itens do evento');

  fraItens.OnFeedback := ItemFeedback;
  pcSecoes.ActivePage := tsEvento;
end;

destructor TfrmEventoDFe211130CadastroFrame.Destroy;
begin
  FreeAndNil(FRascunho);
  inherited;
end;

procedure TfrmEventoDFe211130CadastroFrame.ConfigurarColecao(
  const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
  const AEditorFactory: IEventoDFe211130ItemEditorFactory);
begin
  fraItens.Configurar(AColecao, AEditorFactory);
end;

procedure TfrmEventoDFe211130CadastroFrame.ConfigurarPresenter(
  APresenter: TEventoDFe211130CadastroPresenter);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador do cadastro do evento 211130 não foi informado.');

  AssociarPresenter(APresenter);
end;

procedure TfrmEventoDFe211130CadastroFrame.LimparCampos;
begin
  edChaveDocumento.Clear;
  pcSecoes.ActivePage := tsEvento;
end;

procedure TfrmEventoDFe211130CadastroFrame.LimparValidacao;
begin
  fraValidacao.Limpar;
end;

procedure TfrmEventoDFe211130CadastroFrame.ItemFeedback(Sender: TObject;
  const AMensagem: string);
begin
  ShowWarning(AMensagem);
end;

function TfrmEventoDFe211130CadastroFrame.PrepararInclusao: Boolean;
var
  Itens: EventoDFe211130ItemEtdArray;
begin
  FreeAndNil(FRascunho);
  LimparCampos;
  LimparValidacao;

  FRascunho := EventoDFe211130Etd.Create;
  SetLength(Itens, 0);
  fraItens.Carregar(Itens);
  Result := True;
end;

function TfrmEventoDFe211130CadastroFrame.PrepararAlteracao(
  const AEvento: EventoDFe211130Etd; AModo: TModoEventoDFe): Boolean;
begin
  Result := False;
  if AEvento = nil then
    raise Exception.Create('O evento da alteração não foi informado.');

  FreeAndNil(FRascunho);
  FRascunho := EventoDFe211130Etd(AEvento.Clone);
  // A intenção de restauração pertence ao rascunho e somente a gravação a aplica.
  FRascunho.Restaurar := AModo = meRestauracao;

  LimparCampos;
  LimparValidacao;

  edChaveDocumento.Text := FRascunho.ChaveDocumento;
  fraItens.Carregar(FRascunho.Itens);

  if AModo = meRestauracao then
    ShowWarning('Este evento está na lixeira. Salvar irá restaurá-lo.');

  Result := True;
end;

function TfrmEventoDFe211130CadastroFrame.PrepararAbaRestauracao(
  const AId: string): Boolean;
begin
  Result := (PresenterCadastro <> nil) and
    Presenter.PrepararAlteracao(AId, meRestauracao);
end;

function TfrmEventoDFe211130CadastroFrame.Salvar: Boolean;
begin
  Result := False;

  LimparValidacao;
  if not AplicarCamposAoRascunho then
    Exit;

  // A coleção final inclui os itens ocultos pelo filtro; a duplicidade é validada no salvamento do evento.
  try
    FRascunho.Itens := fraItens.SelectAll;
  except
    ShowError('Não foi possível obter os itens do evento.');
    Exit;
  end;

  Result := Presenter.Salvar(FRascunho);
end;

function TfrmEventoDFe211130CadastroFrame.GetPresenter: TEventoDFe211130CadastroPresenter;
begin
  Result := TEventoDFe211130CadastroPresenter(PresenterCadastro);
end;

function TfrmEventoDFe211130CadastroFrame.AplicarCamposAoRascunho: Boolean;
begin
  Result := FRascunho <> nil;
  if not Result then
    Exit;

  FRascunho.ChaveDocumento := Trim(edChaveDocumento.Text);
end;

function TfrmEventoDFe211130CadastroFrame.HasPendingChanges: Boolean;
begin
  Result := (FRascunho <> nil) or fraItens.HasPendingChanges;
end;

function TfrmEventoDFe211130CadastroFrame.TryFocus: Boolean;
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
