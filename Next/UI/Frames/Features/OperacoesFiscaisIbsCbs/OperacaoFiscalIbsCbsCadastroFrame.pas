unit OperacaoFiscalIbsCbsCadastroFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.CheckLst, Vcl.Buttons, CadastroEditorFrame,
  EditorCadastro, OperacoesFiscaisIbsCbsCadastroView,
  OperacoesFiscaisIbsCbsCadastroPresenter, TipoComunsUnit,
  DateTimeServiceUnit, StringNullableUnit, DateAndTimeNullableUnit,
  OperacaoFiscalIbsCbsEtdUnit, OperacaoFiscalIbsCbsCondicaoEtdUnit,
  SeletorEntidadeFrame, RegraFiscalSelecaoFrame, EmpresaChecklistFrame,
  ValidationPanelFrame;

type
  TfrmOperacaoFiscalIbsCbsCadastroFrame = class(TfrmCadastroEditor, IOperacoesFiscaisIbsCbsCadastroView)
    pcSecoes: TPageControl;
    tsCadastro: TTabSheet;
    lblOperacaoInterna: TLabel;
    fraOperacaoInterna: TfrmSeletorEntidadeFrame;
    lblGrupoFiscal: TLabel;
    fraGrupoFiscal: TfrmSeletorEntidadeFrame;
    lblRegraFiscal: TLabel;
    fraRegraFiscal: TfrmRegraFiscalSelecaoFrame;
    lblInicioVigencia: TLabel;
    edInicioVigencia: TMaskEdit;
    lblFimVigencia: TLabel;
    edFimVigencia: TMaskEdit;
    ckFimVigencia: TCheckBox;
    lblEmpresas: TLabel;
    fraEmpresas: TfrmEmpresaChecklistFrame;
    tsCondicoes: TTabSheet;
    lblEscopo: TLabel;
    gbTipoEmissao: TGroupBox;
    clbTipoEmissao: TCheckListBox;
    gbNatureza: TGroupBox;
    clbNatureza: TCheckListBox;
    gbTipoOrgaoPublico: TGroupBox;
    clbTipoOrgaoPublico: TCheckListBox;
    btnVerificarCondicoes: TSpeedButton;
    procedure ckFimVigenciaClick(Sender: TObject);
    procedure btnVerificarCondicoesClick(Sender: TObject);
  private
    // A alteração recebe uma cópia independente do registro carregado; o frame libera o rascunho ao ser destruído,
    // junto com a aba.
    FRascunho: OperacaoFiscalIbsCbsEtd;
    // Motivo da última carga que falhou; cada preparação reinicia o valor.
    FFalhaCarga: string;
    // Códigos do domínio na mesma ordem dos itens; as marcas usam o código, nunca o texto apresentado.
    FCodigosTipoEmissao: TArrayInteger;
    FCodigosNatureza: TArrayInteger;
    FCodigosTipoOrgaoPublico: TArrayInteger;
    function GetPresenter: TOperacoesFiscaisIbsCbsCadastroPresenter;
    // Não valida nem grava: normalização e validação pertencem ao domínio, a gravação ao apresentador.
    function AplicarCamposAoRascunho: Boolean;
    // Não libera o rascunho, que pertence ao ciclo da aba.
    procedure LimparCampos;
    procedure LimparValidacao;
    // As opções das condições são fixas: as listas são montadas uma única vez.
    procedure CarregarOpcoesCondicoes;
    procedure CarregarCheckList(const ACheckList: TCheckListBox;
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo; var ACodigos: TArrayInteger);
    function CheckListDoAtributo(const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): TCheckListBox;
    function CodigosDoAtributo(const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): TArrayInteger;
    function ValoresMarcados(const ACheckList: TCheckListBox; const ACodigos: TArrayInteger): TArrayInteger;
    procedure LimparCondicoes;
    procedure MarcarCondicao(const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd);
    procedure PreencherCondicoes(const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray);
    function CondicoesDosCampos: OperacaoFiscalIbsCbsCondicaoEtdArray;
    function CopiarCondicoes(
      const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): OperacaoFiscalIbsCbsCondicaoEtdArray;
    // Uma condição que os checklists não representam não pode ser descartada: o domínio precisa reportar a configuração
    // inválida.
    function CondicaoForaDoDominio(const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd): Boolean;
    function AtributoNasCondicoes(const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): Boolean;
    function CopiarOperacao(const AOperacao: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
    function CarregarSeletores(const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
    procedure PreencherVigencias(const AOperacao: OperacaoFiscalIbsCbsEtd);
    procedure AtualizarEscopo;
    procedure GrupoFiscalAlterado(Sender: TObject);

    property Presenter: TOperacoesFiscaisIbsCbsCadastroPresenter read GetPresenter;
  public
    constructor Create(AOwner: TComponent; const AHost: IEditorCadastroHost); override;
    destructor Destroy; override;
    // A composição entrega o apresentador ao frame, que passa a liberá-lo.
    procedure ConfigurarPresenter(APresenter: TOperacoesFiscaisIbsCbsCadastroPresenter);
    function PrepararInclusao: Boolean;
    // A entidade recebida não é assumida: o frame guarda uma cópia própria, com empresas e valores de condição
    // independentes. Um vínculo que a carga não devolve interrompe a preparação, para não perdê-lo em silêncio.
    function PrepararAlteracao(const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
    // Motivo da última falha de preparação; o apresentador o inclui no aviso único da aba descartada.
    function FalhaCarga: string;
    function HasPendingChanges: Boolean; override;
    function TryFocus: Boolean; override;
    procedure ExibirAnaliseCondicoes(const AResumo, ARelatorio: string);
  protected
    function Salvar: Boolean; override;
  end;

implementation

{$R *.dfm}

uses
  AnaliseCondicoesForm;

const
  // Identificação das cargas que interrompem a preparação da aba.
  FalhaOperacaoInterna = 'Operação Interna';
  FalhaGrupoFiscal = 'Grupo Fiscal';
  FalhaRegraFiscal = 'Regra Fiscal';
  FalhaEmpresas = 'Empresas';

constructor TfrmOperacaoFiscalIbsCbsCadastroFrame.Create(AOwner: TComponent; const AHost: IEditorCadastroHost);
begin
  inherited Create(AOwner, AHost);

  // A base carrega o DFM antes deste trecho, portanto as opções podem ser montadas aqui.
  CarregarOpcoesCondicoes;

  // O rótulo de escopo acompanha apenas a escolha do usuário: a carga e a limpeza do seletor não notificam.
  fraGrupoFiscal.OnSelecaoAlterada := GrupoFiscalAlterado;

  fraValidacao.Bind('OperacaoInternaId', fraOperacaoInterna.ControleEdicao, '');
  fraValidacao.Bind('GrupoFiscalId', fraGrupoFiscal.ControleEdicao, '');
  fraValidacao.Bind('RegraFiscalId', fraRegraFiscal.ControleEdicao, '');
  fraValidacao.Bind('InicioVigencia', edInicioVigencia, '');
  fraValidacao.Bind('FimVigencia', edFimVigencia, '');

  // O erro de Condicoes leva o foco ao primeiro checklist, que fica na sub-aba Condições.
  fraValidacao.Bind('Condicoes', clbTipoEmissao, '');

  pcSecoes.ActivePage := tsCadastro;
end;

destructor TfrmOperacaoFiscalIbsCbsCadastroFrame.Destroy;
begin
  FreeAndNil(FRascunho);
  inherited;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.ConfigurarPresenter(
  APresenter: TOperacoesFiscaisIbsCbsCadastroPresenter);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador do cadastro de Operações Fiscais IBS/CBS não foi informado.');

  AssociarPresenter(APresenter);
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.CarregarOpcoesCondicoes;
begin
  CarregarCheckList(clbTipoEmissao, ocaTipoEmissao, FCodigosTipoEmissao);
  CarregarCheckList(clbNatureza, ocaNaturezaEmissao, FCodigosNatureza);
  CarregarCheckList(clbTipoOrgaoPublico, ocaTipoOrgaoPublico, FCodigosTipoOrgaoPublico);
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.CarregarCheckList(const ACheckList: TCheckListBox;
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo; var ACodigos: TArrayInteger);
var
  I: Integer;
begin
  ACheckList.Items.Clear;

  ACodigos := OperacaoFiscalIbsCbsCondicoes.ValoresDoDominio(AAtributo);
  for I := 0 to High(ACodigos) do
    ACheckList.Items.Add(OperacaoFiscalIbsCbsCondicoes.DescricaoValor(AAtributo, ACodigos[I]));
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CheckListDoAtributo(
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): TCheckListBox;
begin
  case AAtributo of
    ocaTipoEmissao:
      Result := clbTipoEmissao;
    ocaNaturezaEmissao:
      Result := clbNatureza;
    ocaTipoOrgaoPublico:
      Result := clbTipoOrgaoPublico;
  else
    // Atributo sem editor (configuração inválida): o domínio reporta na gravação.
    Result := nil;
  end;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CodigosDoAtributo(
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): TArrayInteger;
begin
  case AAtributo of
    ocaTipoEmissao:
      Result := FCodigosTipoEmissao;
    ocaNaturezaEmissao:
      Result := FCodigosNatureza;
    ocaTipoOrgaoPublico:
      Result := FCodigosTipoOrgaoPublico;
  else
    SetLength(Result, 0);
  end;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.ValoresMarcados(const ACheckList: TCheckListBox;
  const ACodigos: TArrayInteger): TArrayInteger;
var
  I: Integer;
  Total: Integer;
begin
  SetLength(Result, Length(ACodigos));
  Total := 0;
  for I := 0 to High(ACodigos) do
    if ACheckList.Checked[I] then
    begin
      Result[Total] := ACodigos[I];
      Inc(Total);
    end;
  SetLength(Result, Total);
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.LimparCondicoes;
var
  I: Integer;
begin
  for I := 0 to clbTipoEmissao.Items.Count - 1 do
    clbTipoEmissao.Checked[I] := False;
  for I := 0 to clbNatureza.Items.Count - 1 do
    clbNatureza.Checked[I] := False;
  for I := 0 to clbTipoOrgaoPublico.Items.Count - 1 do
    clbTipoOrgaoPublico.Checked[I] := False;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.MarcarCondicao(const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd);
var
  CheckList: TCheckListBox;
  Codigos: TArrayInteger;
  I: Integer;
begin
  CheckList := CheckListDoAtributo(ACondicao.Atributo);
  if CheckList = nil then
    Exit;

  Codigos := CodigosDoAtributo(ACondicao.Atributo);
  for I := 0 to High(Codigos) do
    if OperacaoFiscalIbsCbsCondicoes.Contem(ACondicao, Codigos[I]) then
      CheckList.Checked[I] := True;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.PreencherCondicoes(
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray);
var
  I: Integer;
begin
  LimparCondicoes;
  for I := 0 to High(ACondicoes) do
    MarcarCondicao(ACondicoes[I]);
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CondicoesDosCampos: OperacaoFiscalIbsCbsCondicaoEtdArray;
  procedure Adicionar(const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo; const AValores: TArrayInteger);
  begin
    // Um atributo sem valor marcado não vira condição; o conjunto vazio não é gravado.
    if Length(AValores) = 0 then
      Exit;

    SetLength(Result, Length(Result) + 1);
    Result[High(Result)] := OperacaoFiscalIbsCbsCondicaoEtd.Create(AAtributo, AValores);
  end;
begin
  SetLength(Result, 0);

  // A ordem segue o cadastro legado; o domínio normaliza valores e ordem antes de gravar.
  Adicionar(ocaTipoEmissao, ValoresMarcados(clbTipoEmissao, FCodigosTipoEmissao));
  Adicionar(ocaNaturezaEmissao, ValoresMarcados(clbNatureza, FCodigosNatureza));
  Adicionar(ocaTipoOrgaoPublico, ValoresMarcados(clbTipoOrgaoPublico, FCodigosTipoOrgaoPublico));
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CopiarCondicoes(
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): OperacaoFiscalIbsCbsCondicaoEtdArray;
var
  I: Integer;
begin
  SetLength(Result, Length(ACondicoes));
  for I := 0 to High(ACondicoes) do
    // A aba edita um conjunto próprio: os valores não compartilham o array de origem.
    Result[I] := OperacaoFiscalIbsCbsCondicaoEtd.Create(
      ACondicoes[I].Atributo, Copy(ACondicoes[I].Valores, 0, Length(ACondicoes[I].Valores)));
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CondicaoForaDoDominio(
  const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd): Boolean;
var
  I: Integer;
begin
  // Atributo sem editor ou valor não aceito: os checklists não recriam a condição.
  Result := ACondicao.Atributo = ocaInvalida;
  if Result then
    Exit;

  for I := 0 to High(ACondicao.Valores) do
    if not OperacaoFiscalIbsCbsCondicoes.CodigoValido(ACondicao.Atributo, ACondicao.Valores[I]) then
    begin
      Result := True;
      Exit;
    end;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.AtributoNasCondicoes(
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): Boolean;
var
  I: Integer;
begin
  // Cada atributo admite uma única condição no vínculo: se o atributo está no conjunto, os checklists já a representam.
  Result := False;
  for I := 0 to High(ACondicoes) do
    if ACondicoes[I].Atributo = AAtributo then
    begin
      Result := True;
      Exit;
    end;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CopiarOperacao(
  const AOperacao: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
begin
  // A entidade não possui Clone: a cópia usa o construtor completo e substitui os arrays por cópias independentes.
  Result := OperacaoFiscalIbsCbsEtd.Create(
    AOperacao.Id, AOperacao.OperacaoInternaId, AOperacao.RegraFiscalId,
    AOperacao.GrupoFiscalId, AOperacao.InicioVigencia, AOperacao.FimVigencia,
    AOperacao.DataCadastro, AOperacao.DataAlteracao, AOperacao.Ativo,
    Copy(AOperacao.EmpresasId, 0, Length(AOperacao.EmpresasId)));

  Result.OperacaoInternaDescricao := AOperacao.OperacaoInternaDescricao;
  Result.GrupoFiscalDescricao := AOperacao.GrupoFiscalDescricao;
  Result.RegraFiscalDescricao := AOperacao.RegraFiscalDescricao;
  Result.Condicoes := CopiarCondicoes(AOperacao.Condicoes);
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CarregarSeletores(const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
begin
  Result := False;

  if not fraOperacaoInterna.Carregar(AOperacao.OperacaoInternaId) then
  begin
    FFalhaCarga := FalhaOperacaoInterna;
    Exit;
  end;
  // Grupo Fiscal vazio é uma seleção válida e volta para a opção vazia.
  if not fraGrupoFiscal.Carregar(AOperacao.GrupoFiscalId.ToText('')) then
  begin
    FFalhaCarga := FalhaGrupoFiscal;
    Exit;
  end;
  if not fraRegraFiscal.Carregar(AOperacao.RegraFiscalId) then
  begin
    FFalhaCarga := FalhaRegraFiscal;
    Exit;
  end;

  if not fraEmpresas.CarregarAlteracao(AOperacao.EmpresasId) then
  begin
    FFalhaCarga := FalhaEmpresas;
    Exit;
  end;

  Result := True;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.PreencherVigencias(const AOperacao: OperacaoFiscalIbsCbsEtd);
begin
  // O início é obrigatório: uma data zerada permanece em branco e o domínio reporta o campo em vez de a tela inventar
  // um valor.
  if AOperacao.InicioVigencia > 0 then
    edInicioVigencia.Text := DateService.ParseLocal(AOperacao.InicioVigencia)
  else
    edInicioVigencia.Clear;

  // O fim nulo desabilita a máscara: o painel de validação pula o campo e a marcação é a única forma de informar a
  // data.
  ckFimVigencia.Checked := not AOperacao.FimVigencia.IsNull;
  edFimVigencia.Enabled := ckFimVigencia.Checked;
  if AOperacao.FimVigencia.IsNull then
    edFimVigencia.Clear
  else
    edFimVigencia.Text := DateService.ParseLocal(AOperacao.FimVigencia.Value);
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.AtualizarEscopo;
begin
  if fraGrupoFiscal.IdSelecionado = '' then
    lblEscopo.Caption := 'Escopo: Padrão (sem Grupo Fiscal)'
  else
    lblEscopo.Caption := 'Escopo: Grupo Fiscal ' + fraGrupoFiscal.TextoSelecionado;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.GrupoFiscalAlterado(Sender: TObject);
begin
  AtualizarEscopo;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.ckFimVigenciaClick(Sender: TObject);
begin
  // Desmarcado significa fim de vigência nulo: a máscara não aceita edição enquanto a data não for informada.
  edFimVigencia.Enabled := ckFimVigencia.Checked;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.btnVerificarCondicoesClick(Sender: TObject);
begin
  if not AplicarCamposAoRascunho then
    Exit;
  Presenter.AnalisarCondicoes(FRascunho);
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.PrepararInclusao: Boolean;
begin
  Result := False;
  FFalhaCarga := '';

  FreeAndNil(FRascunho);
  LimparCampos;

  // Sem as listas carregadas não há aba: o apresentador apresenta o motivo registrado aqui e o rascunho só nasce depois
  // de todas as cargas.
  if not fraOperacaoInterna.Carregar('') then
  begin
    FFalhaCarga := FalhaOperacaoInterna;
    Exit;
  end;
  if not fraGrupoFiscal.Carregar('') then
  begin
    FFalhaCarga := FalhaGrupoFiscal;
    Exit;
  end;
  if not fraRegraFiscal.Carregar('') then
  begin
    FFalhaCarga := FalhaRegraFiscal;
    Exit;
  end;
  if not fraEmpresas.CarregarInclusao then
  begin
    FFalhaCarga := FalhaEmpresas;
    Exit;
  end;

  FRascunho := OperacaoFiscalIbsCbsEtd.Create;
  edInicioVigencia.Text := DateService.ParseLocal(FRascunho.InicioVigencia);
  Result := True;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.PrepararAlteracao(const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
begin
  Result := False;
  if AOperacao = nil then
    raise Exception.Create('A operação fiscal da alteração não foi informada.');

  FFalhaCarga := '';

  // A cópia é assumida pela aba antes da carga, para que uma falha libere exatamente o rascunho desta preparação.
  FreeAndNil(FRascunho);
  FRascunho := CopiarOperacao(AOperacao);

  LimparCampos;

  // Um identificador ausente devolve False e descarta a preparação, em vez de apagar o vínculo em silêncio.
  if not CarregarSeletores(FRascunho) then
  begin
    FreeAndNil(FRascunho);
    LimparCampos;
    Exit;
  end;

  PreencherVigencias(FRascunho);
  PreencherCondicoes(FRascunho.Condicoes);
  AtualizarEscopo;
  Result := True;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.Salvar: Boolean;
begin
  Result := False;

  LimparValidacao;
  if not AplicarCamposAoRascunho then
    Exit;

  Result := Presenter.Salvar(FRascunho);
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.GetPresenter(): TOperacoesFiscaisIbsCbsCadastroPresenter;
begin
  Result := TOperacoesFiscaisIbsCbsCadastroPresenter(PresenterCadastro);
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.AplicarCamposAoRascunho: Boolean;
var
  Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  I: Integer;
begin
  Result := FRascunho <> nil;
  if not Result then
    Exit;

  FRascunho.OperacaoInternaId := fraOperacaoInterna.IdSelecionado;
  FRascunho.RegraFiscalId := fraRegraFiscal.IdSelecionado;

  // A opção vazia do Grupo Fiscal volta a ser vínculo nulo.
  if fraGrupoFiscal.IdSelecionado = '' then
    FRascunho.GrupoFiscalId := StringNullable.NullInstance()
  else
    FRascunho.GrupoFiscalId := StringNullable.CreateOrNull(fraGrupoFiscal.IdSelecionado);

  // Data incompleta vira zero e o domínio reporta o campo; a tela não corrige o que foi digitado.
  FRascunho.InicioVigencia := DateService.FromLocalToDateDef(edInicioVigencia.Text, 0);

  if ckFimVigencia.Checked then
    FRascunho.FimVigencia := DateNullable.Create(DateService.FromLocalToDateDef(edFimVigencia.Text, 0))
  else
    FRascunho.FimVigencia := DateNullable.NullInstance();

  FRascunho.EmpresasId := fraEmpresas.EmpresasSelecionadas;

  // A condição carregada fora do domínio é mantida até o usuário escolher valores válidos para o mesmo atributo, para o
  // domínio reportar a configuração inválida em vez de perdê-la.
  Condicoes := CondicoesDosCampos;
  for I := 0 to High(FRascunho.Condicoes) do
    if CondicaoForaDoDominio(FRascunho.Condicoes[I]) and
      not AtributoNasCondicoes(Condicoes, FRascunho.Condicoes[I].Atributo) then
    begin
      SetLength(Condicoes, Length(Condicoes) + 1);
      Condicoes[High(Condicoes)] := FRascunho.Condicoes[I];
    end;
  FRascunho.Condicoes := Condicoes;

  FRascunho.OperacaoInternaDescricao := fraOperacaoInterna.TextoSelecionado;
  if fraGrupoFiscal.IdSelecionado = '' then
    FRascunho.GrupoFiscalDescricao := ''
  else
    FRascunho.GrupoFiscalDescricao := fraGrupoFiscal.TextoSelecionado;
  FRascunho.RegraFiscalDescricao := fraRegraFiscal.TextoSelecionado;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.LimparCampos;
begin
  fraOperacaoInterna.Limpar;
  fraGrupoFiscal.Limpar;
  fraRegraFiscal.Limpar;

  edInicioVigencia.Clear;
  ckFimVigencia.Checked := False;
  edFimVigencia.Enabled := False;
  edFimVigencia.Clear;

  fraEmpresas.Limpar;
  LimparCondicoes;

  // A limpeza não notifica o seletor de grupo: o rótulo é atualizado aqui.
  AtualizarEscopo;
  pcSecoes.ActivePage := tsCadastro;
  LimparValidacao;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.LimparValidacao;
begin
  fraValidacao.Limpar;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.FalhaCarga: string;
begin
  Result := FFalhaCarga;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.HasPendingChanges: Boolean;
begin
  Result := FRascunho <> nil;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.TryFocus: Boolean;
begin
  Result := fraValidacao.FocarPrimeiroErro;
  if Result then
    Exit;

  // Sem erro vinculado, a operação interna continua sendo o primeiro campo.
  pcSecoes.ActivePage := tsCadastro;
  Result := False;
  if fraOperacaoInterna.ControleEdicao.CanFocus then
  begin
    fraOperacaoInterna.ControleEdicao.SetFocus;
    Result := True;
  end;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.ExibirAnaliseCondicoes(const AResumo, ARelatorio: string);
var
  Dialogo: TfrmAnaliseCondicoes;
begin
  Dialogo := TfrmAnaliseCondicoes.Create(nil);
  try
    Dialogo.Configure(AResumo, ARelatorio);
    Dialogo.ShowModal;
  finally
    Dialogo.Free;
  end;
end;

end.
