unit GrupoFiscalCadastroFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  EditorCadastro, TipoTributoFiscalEnumUnit, GrupoFiscalEtdUnit,
  ValidationPanelFrame, ValidationEntityOutputUnit, EmpresaOption,
  EmpresaChecklistFrame;

type
  // Editor dos campos do grupo fiscal. O frame apresenta e coleta descricao,
  // tipo de tributo e empresas e e o dono do rascunho da aba: a autorizacao, a
  // gravacao e a troca de sessao pertencem ao formulario que o contem. Os erros
  // do caso de uso sao apresentados pelo painel comum, que agrupa as mensagens
  // por campo.
  TfrmGrupoFiscalCadastroFrame = class(TFrame, IEditorCadastro)
    lblDescricao: TLabel;
    edDescricao: TEdit;
    lblTipoTributo: TLabel;
    cbTipoTributo: TComboBox;
    lblEmpresas: TLabel;
    fraEmpresas: TfrmEmpresaChecklistFrame;
    fraValidacao: TfrmValidationPanelFrame;
  private
    // Rascunho da aba. A inclusao cria a entidade e a alteracao recebe uma copia
    // independente do registro carregado; o frame libera o rascunho ao ser
    // destruido, junto com a aba.
    FRascunho: GrupoFiscalEtd;
    // Os itens do tipo de tributo sao fixos e independem da inclusao: monta-los
    // uma unica vez mantem a lista disponivel em todas as inclusoes.
    procedure CarregarOpcoesTributo;
    function GetDescricao: string;
    procedure SetDescricao(const AValue: string);
    function GetTipoTributo: TipoTributoFiscalEnum;
    procedure SetTipoTributo(const AValue: TipoTributoFiscalEnum);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // Reinicia o frame para uma inclusao: descarta o rascunho anterior, cria o
    // novo e entrega as opcoes ao seletor de empresas.
    procedure PrepararInclusao(const AOpcoes: TEmpresaOptions);
    // Prepara a alteracao de um grupo existente. A entidade recebida nao e
    // assumida: o frame guarda um clone com empresas independentes. O tipo
    // permanece bloqueado e as empresas vinculadas iniciam marcadas, inclusive
    // as que o usuario nao pode habilitar.
    procedure PrepararAlteracao(const AGrupo: GrupoFiscalEtd;
      const AOpcoes: TEmpresaOptions);
    // Transfere os campos editados para o rascunho da aba. Nao grava: a
    // gravacao pertence ao formulario. Retorna False quando nao ha rascunho.
    function AplicarCamposAoRascunho: Boolean;
    // Limpa os campos e a lista. Nao libera o rascunho, que pertence ao ciclo da
    // aba.
    procedure LimparCampos;
    procedure LimparValidacao;
    // Encaminha o resultado do caso de uso ao painel de validacao, que agrupa os
    // campos e oferece o link para o editor correspondente.
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    // Foca o primeiro campo com erro; sem erro vinculado, foca a descricao.
    function FocarPrimeiroCampoInvalido: Boolean;
    function TemRascunho: Boolean;
    // Contrato comum da aba de cadastro: a base consulta pendencias, encaminha o
    // foco e entrega a validacao sem conhecer este frame.
    function HasPendingChanges: Boolean;
    function TryFocus: Boolean;
    procedure ShowValidation(const AValidacao: ValidationEntityOutput);
    property Rascunho: GrupoFiscalEtd read FRascunho;
    property Descricao: string read GetDescricao write SetDescricao;
    property TipoTributo: TipoTributoFiscalEnum read GetTipoTributo
      write SetTipoTributo;
  end;

implementation

{$R *.dfm}

const
  RascunhoNaoInformadoMessage =
    'O grupo fiscal da alteração não foi informado.';

constructor TfrmGrupoFiscalCadastroFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // O frame ja possui os proprios controles: a classe base carrega o DFM antes
  // deste trecho, portanto as opcoes podem ser montadas aqui.
  CarregarOpcoesTributo;

  // O painel deriva o campo do nome do controle; o rotulo exibido vem do
  // metadata do grupo fiscal usado pelo validador.
  fraValidacao.Bind(edDescricao);
  fraValidacao.Bind(cbTipoTributo);
end;

destructor TfrmGrupoFiscalCadastroFrame.Destroy;
begin
  FreeAndNil(FRascunho);
  inherited;
end;

procedure TfrmGrupoFiscalCadastroFrame.CarregarOpcoesTributo;
var
  Tributo: TipoTributoFiscalEnum;
begin
  cbTipoTributo.Items.Clear;
  for Tributo := Low(TipoTributoFiscalEnum) to High(TipoTributoFiscalEnum) do
    cbTipoTributo.Items.Add(TipoTributoFiscalEnumDisplay[Tributo]);

  // O item vazio representa a ausencia de escolha e e o padrao da inclusao.
  cbTipoTributo.ItemIndex := Ord(tfIndefinido);
end;

procedure TfrmGrupoFiscalCadastroFrame.LimparValidacao;
begin
  fraValidacao.Limpar;
end;

procedure TfrmGrupoFiscalCadastroFrame.LimparCampos;
begin
  edDescricao.Clear;
  // A alteracao bloqueia o tipo de tributo; limpar devolve o editor ao estado
  // neutro para a proxima inclusao. O rascunho nao e liberado aqui.
  cbTipoTributo.Enabled := True;
  cbTipoTributo.ItemIndex := Ord(tfIndefinido);
  fraEmpresas.Limpar;
end;

procedure TfrmGrupoFiscalCadastroFrame.PrepararInclusao(
  const AOpcoes: TEmpresaOptions);
begin
  FreeAndNil(FRascunho);
  FRascunho := GrupoFiscalEtd.Create;
  LimparCampos;
  LimparValidacao;
  fraEmpresas.Configurar(AOpcoes);
end;

procedure TfrmGrupoFiscalCadastroFrame.PrepararAlteracao(
  const AGrupo: GrupoFiscalEtd;
  const AOpcoes: TEmpresaOptions);
var
  Copia: GrupoFiscalEtd;
begin
  if AGrupo = nil then
    raise Exception.Create(RascunhoNaoInformadoMessage);

  // O clone preserva o identificador e os demais campos; as empresas recebem
  // um array proprio para que a edicao nao altere a entidade de quem chamou.
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
  Descricao := FRascunho.Descricao;
  TipoTributo := FRascunho.TipoTributo;

  // O tipo de tributo nao e alteravel: o campo apenas apresenta o valor gravado.
  // A lista recebida marca as empresas vinculadas e desabilita as que o usuario
  // nao pode habilitar.
  cbTipoTributo.Enabled := False;
  LimparValidacao;
  fraEmpresas.Configurar(AOpcoes);
end;

function TfrmGrupoFiscalCadastroFrame.AplicarCamposAoRascunho: Boolean;
begin
  Result := FRascunho <> nil;
  if not Result then
    Exit;

  // Somente os tres campos da aba sao mapeados; os demais permanecem com os
  // padroes de criacao ou da copia carregada.
  FRascunho.Descricao := Trim(Descricao);
  FRascunho.TipoTributo := TipoTributo;
  FRascunho.EmpresasId := fraEmpresas.EmpresasSelecionadas;
end;

function TfrmGrupoFiscalCadastroFrame.TemRascunho: Boolean;
begin
  Result := FRascunho <> nil;
end;

function TfrmGrupoFiscalCadastroFrame.HasPendingChanges: Boolean;
begin
  // Um rascunho aberto ja e pendencia: a inclusao nasce com dados a gravar e a
  // alteracao com a copia carregada do registro.
  Result := TemRascunho;
end;

function TfrmGrupoFiscalCadastroFrame.TryFocus: Boolean;
begin
  Result := FocarPrimeiroCampoInvalido;
end;

procedure TfrmGrupoFiscalCadastroFrame.ShowValidation(
  const AValidacao: ValidationEntityOutput);
begin
  ExibirValidacao(AValidacao);
end;

procedure TfrmGrupoFiscalCadastroFrame.ExibirValidacao(
  const AValidacao: ValidationEntityOutput);
begin
  fraValidacao.ExibirValidacao(AValidacao);
end;

function TfrmGrupoFiscalCadastroFrame.FocarPrimeiroCampoInvalido: Boolean;
begin
  Result := fraValidacao.FocarPrimeiroErro;
  if Result then
    Exit;

  // Sem erro vinculado, a descricao continua sendo o primeiro campo da inclusao.
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
  // O indice do item e a propria representacao do enum; o item vazio e o
  // tfIndefinido.
  Result := tfIndefinido;
  if (cbTipoTributo.ItemIndex > Ord(tfIndefinido)) and
    (cbTipoTributo.ItemIndex <= Ord(High(TipoTributoFiscalEnum))) then
    Result := TipoTributoFiscalEnum(cbTipoTributo.ItemIndex);
end;

procedure TfrmGrupoFiscalCadastroFrame.SetTipoTributo(
  const AValue: TipoTributoFiscalEnum);
begin
  if (Ord(AValue) >= Ord(Low(TipoTributoFiscalEnum))) and
    (Ord(AValue) < cbTipoTributo.Items.Count) then
    cbTipoTributo.ItemIndex := Ord(AValue)
  else
    cbTipoTributo.ItemIndex := Ord(tfIndefinido);
end;

end.
