unit GrupoFiscalCadastroFrame;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.StdCtrls, CadastroEditorFrame, EditorCadastro, GruposFiscaisCadastroView,
  GruposFiscaisCadastroPresenter, TipoTributoFiscalEnumUnit, GrupoFiscalEtdUnit,
  ValidationPanelFrame, EmpresaChecklistFrame;

type
  TfrmGrupoFiscalCadastroFrame = class(TfrmCadastroEditor, IGruposFiscaisCadastroView)
    lblDescricao: TLabel;
    edDescricao: TEdit;
    lblTipoTributo: TLabel;
    cbTipoTributo: TComboBox;
    lblEmpresas: TLabel;
    fraEmpresas: TfrmEmpresaChecklistFrame;
  private
    // A alteração recebe uma cópia independente do registro carregado; o frame libera o rascunho ao ser destruído,
    // junto com a aba.
    FRascunho: GrupoFiscalEtd;
    // Os itens do tipo de tributo são fixos: a lista é montada uma única vez.
    procedure CarregarOpcoesTributo;
    function GetDescricao: string;
    procedure SetDescricao(const AValue: string);
    function GetTipoTributo: TipoTributoFiscalEnum;
    procedure SetTipoTributo(const AValue: TipoTributoFiscalEnum);
    function GetPresenter: TGruposFiscaisCadastroPresenter;
    function AplicarCamposAoRascunho: Boolean;
    procedure LimparCampos;
    procedure LimparValidacao;
    property Presenter: TGruposFiscaisCadastroPresenter read GetPresenter;
    property Descricao: string read GetDescricao write SetDescricao;
    property TipoTributo: TipoTributoFiscalEnum read GetTipoTributo write SetTipoTributo;
  public
    constructor Create(AOwner: TComponent; const AHost: IEditorCadastroHost); override;
    destructor Destroy; override;
    // A composição entrega o apresentador ao frame, que passa a liberá-lo.
    procedure ConfigurarPresenter(APresenter: TGruposFiscaisCadastroPresenter);
    function PrepararInclusao: Boolean;
    // A entidade recebida não é assumida: o frame guarda um clone com empresas independentes.
    // O tipo permanece bloqueado.
    function PrepararAlteracao(const AGrupo: GrupoFiscalEtd): Boolean;
    function HasPendingChanges: Boolean; override;
    function TryFocus: Boolean; override;
  protected
    function Salvar: Boolean; override;
  end;

implementation

{$R *.dfm}

constructor TfrmGrupoFiscalCadastroFrame.Create(AOwner: TComponent; const AHost: IEditorCadastroHost);
begin
  inherited Create(AOwner, AHost);

  // A base carrega o DFM antes deste trecho, portanto as opções podem ser montadas aqui.
  CarregarOpcoesTributo;

  fraValidacao.Bind(edDescricao);
  fraValidacao.Bind(cbTipoTributo);
end;

destructor TfrmGrupoFiscalCadastroFrame.Destroy;
begin
  FreeAndNil(FRascunho);
  inherited;
end;

procedure TfrmGrupoFiscalCadastroFrame.ConfigurarPresenter(APresenter: TGruposFiscaisCadastroPresenter);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador do cadastro de Grupos Fiscais não foi informado.');

  AssociarPresenter(APresenter);
end;

procedure TfrmGrupoFiscalCadastroFrame.CarregarOpcoesTributo;
var
  Tributo: TipoTributoFiscalEnum;
begin
  cbTipoTributo.Items.Clear;
  for Tributo := Low(TipoTributoFiscalEnum) to High(TipoTributoFiscalEnum) do
    cbTipoTributo.Items.Add(TipoTributoFiscalEnumDisplay[Tributo]);

  // O item vazio representa a ausência de escolha e é o padrão da inclusão.
  cbTipoTributo.ItemIndex := Ord(tfIndefinido);
end;

procedure TfrmGrupoFiscalCadastroFrame.LimparValidacao;
begin
  fraValidacao.Limpar;
end;

procedure TfrmGrupoFiscalCadastroFrame.LimparCampos;
begin
  edDescricao.Clear;
  // A alteração bloqueia o tipo de tributo; limpar devolve o editor ao estado neutro. O rascunho não é liberado aqui.
  cbTipoTributo.Enabled := True;
  cbTipoTributo.ItemIndex := Ord(tfIndefinido);
  fraEmpresas.Limpar;
end;

function TfrmGrupoFiscalCadastroFrame.PrepararInclusao: Boolean;
begin
  Result := False;

  FreeAndNil(FRascunho);
  // Limpar os campos também limpa o seletor: a carga vem depois para não ser apagada.
  LimparCampos;
  LimparValidacao;

  // Sem empresas não há inclusão: o formulário descarta a aba e o rascunho só nasce com a lista carregada.
  if not fraEmpresas.CarregarInclusao then
    Exit;

  FRascunho := GrupoFiscalEtd.Create;
  Result := True;
end;

function TfrmGrupoFiscalCadastroFrame.PrepararAlteracao(const AGrupo: GrupoFiscalEtd): Boolean;
var
  Copia: GrupoFiscalEtd;
begin
  Result := False;
  if AGrupo = nil then
    raise Exception.Create('O grupo fiscal da alteração não foi informado.');

  // As empresas recebem um array próprio para que a edição não altere a entidade de quem chamou.
  Copia := GrupoFiscalEtd(AGrupo.Clone());
  try
    Copia.EmpresasId := Copy(AGrupo.EmpresasId, 0, Length(AGrupo.EmpresasId));
  except
    Copia.Free;
    raise;
  end;

  FreeAndNil(FRascunho);
  FRascunho := Copia;

  LimparCampos;
  LimparValidacao;

  // Os vínculos gravados vêm do rascunho: a lista marca inclusive os itens bloqueados e, sem vínculos, começa toda
  // desmarcada.
  if not fraEmpresas.CarregarAlteracao(FRascunho.EmpresasId) then
  begin
    // Nenhum estado parcial sobrevive: o formulário descarta a aba.
    FreeAndNil(FRascunho);
    LimparCampos;
    Exit;
  end;

  Descricao := FRascunho.Descricao;
  TipoTributo := FRascunho.TipoTributo;

  // O tipo de tributo não é alterável: o campo apenas apresenta o valor gravado.
  cbTipoTributo.Enabled := False;
  Result := True;
end;

function TfrmGrupoFiscalCadastroFrame.Salvar: Boolean;
begin
  Result := False;

  LimparValidacao;
  if not AplicarCamposAoRascunho then
    Exit;

  Result := Presenter.Salvar(FRascunho);
end;

function TfrmGrupoFiscalCadastroFrame.GetPresenter: TGruposFiscaisCadastroPresenter;
begin
  Result := TGruposFiscaisCadastroPresenter(PresenterCadastro);
end;

function TfrmGrupoFiscalCadastroFrame.AplicarCamposAoRascunho: Boolean;
begin
  Result := FRascunho <> nil;
  if not Result then
    Exit;

  FRascunho.Descricao := Trim(Descricao);
  FRascunho.TipoTributo := TipoTributo;
  FRascunho.EmpresasId := fraEmpresas.EmpresasSelecionadas;
end;

function TfrmGrupoFiscalCadastroFrame.HasPendingChanges: Boolean;
begin
  Result := FRascunho <> nil;
end;

function TfrmGrupoFiscalCadastroFrame.TryFocus: Boolean;
begin
  Result := fraValidacao.FocarPrimeiroErro;
  if Result then
    Exit;

  // Sem erro vinculado, a descrição continua sendo o primeiro campo.
  if edDescricao.CanFocus then
  begin
    edDescricao.SetFocus;
    Result := True;
  end;
end;

function TfrmGrupoFiscalCadastroFrame.GetDescricao: string;
begin
  Result := edDescricao.Text;
end;

procedure TfrmGrupoFiscalCadastroFrame.SetDescricao(const AValue: string);
begin
  edDescricao.Text := AValue;
end;

function TfrmGrupoFiscalCadastroFrame.GetTipoTributo: TipoTributoFiscalEnum;
begin
  // O índice do item é a representação do enum; o item vazio é tfIndefinido.
  Result := tfIndefinido;
  if (cbTipoTributo.ItemIndex > Ord(tfIndefinido)) and
    (cbTipoTributo.ItemIndex <= Ord(High(TipoTributoFiscalEnum))) then
    Result := TipoTributoFiscalEnum(cbTipoTributo.ItemIndex);
end;

procedure TfrmGrupoFiscalCadastroFrame.SetTipoTributo(const AValue: TipoTributoFiscalEnum);
begin
  if (Ord(AValue) >= Ord(Low(TipoTributoFiscalEnum))) and (Ord(AValue) < cbTipoTributo.Items.Count) then
    cbTipoTributo.ItemIndex := Ord(AValue)
  else
    cbTipoTributo.ItemIndex := Ord(tfIndefinido);
end;

end.
