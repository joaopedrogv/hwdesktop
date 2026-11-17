unit OperacaoFiscalIbsCbsCadastroFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.CheckLst,
  EditorCadastro, TipoComunsUnit, DateTimeServiceUnit, StringNullableUnit,
  DateAndTimeNullableUnit, OperacaoFiscalIbsCbsEtdUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit, SeletorEntidadeFrame,
  RegraFiscalSelecaoFrame, EmpresaChecklistFrame, ValidationPanelFrame,
  ValidationEntityOutputUnit;

type
  // Editor da aba de Operacoes Fiscais IBS/CBS. O frame apresenta as sub-abas
  // Cadastro e Condicoes, carrega os seletores e as empresas na preparacao e e o
  // dono do rascunho: a autorizacao, a gravacao e a troca de sessao pertencem ao
  // formulario que o contem. As mensagens do caso de uso sao apresentadas pelo
  // painel comum, agrupadas pelo campo que as originou.
  TfrmOperacaoFiscalIbsCbsCadastroFrame = class(TFrame, IEditorCadastro)
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
    fraValidacao: TfrmValidationPanelFrame;
    procedure ckFimVigenciaClick(Sender: TObject);
  private
    // Rascunho da aba. A inclusao cria a entidade e a alteracao recebe uma copia
    // independente do registro carregado; o frame libera o rascunho ao ser
    // destruido, junto com a aba.
    FRascunho: OperacaoFiscalIbsCbsEtd;
    // Motivo da ultima falha de carga, identificado pela carga que nao
    // concluiu. Cada preparacao reinicia o valor.
    FFalhaCarga: string;
    // Codigos do dominio na mesma ordem dos itens de cada checklist. As marcas
    // sao lidas e gravadas pelo codigo, nunca pelo texto apresentado.
    FCodigosTipoEmissao: TArrayInteger;
    FCodigosNatureza: TArrayInteger;
    FCodigosTipoOrgaoPublico: TArrayInteger;
    // As opcoes das condicoes sao fixas e independem da preparacao: monta-las
    // uma unica vez mantem as listas disponiveis em todas as abas.
    procedure CarregarOpcoesCondicoes;
    procedure CarregarCheckList(const ACheckList: TCheckListBox;
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo;
      var ACodigos: TArrayInteger);
    function CheckListDoAtributo(
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): TCheckListBox;
    function CodigosDoAtributo(
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): TArrayInteger;
    function ValoresMarcados(const ACheckList: TCheckListBox;
      const ACodigos: TArrayInteger): TArrayInteger;
    procedure LimparCondicoes;
    procedure MarcarCondicao(
      const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd);
    procedure PreencherCondicoes(
      const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray);
    function CondicoesDosCampos: OperacaoFiscalIbsCbsCondicaoEtdArray;
    function CopiarCondicoes(
      const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray)
      : OperacaoFiscalIbsCbsCondicaoEtdArray;
    // Uma condicao carregada que os checklists nao representam nao pode ser
    // descartada: o dominio precisa reportar a configuracao invalida.
    function CondicaoForaDoDominio(
      const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd): Boolean;
    function AtributoNasCondicoes(
      const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): Boolean;
    function CopiarOperacao(
      const AOperacao: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
    function CarregarSeletores(
      const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
    procedure PreencherVigencias(
      const AOperacao: OperacaoFiscalIbsCbsEtd);
    // O rotulo de escopo das condicoes acompanha o Grupo Fiscal selecionado.
    procedure AtualizarEscopo;
    procedure GrupoFiscalAlterado(Sender: TObject);
    // Gancho do painel de validacao: ativa a sub-aba que contem o campo antes da
    // rolagem e do foco, porque uma pagina oculta nao aceita foco.
    procedure AtivarSecaoDoControle(AControle: TWinControl);
    // A primeira mensagem do resultado define a sub-aba apresentada.
    procedure AtivarSecaoDaValidacao(
      const AValidacao: ValidationEntityOutput);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // Reinicia o frame para uma inclusao: descarta o rascunho anterior, limpa os
    // campos e carrega os seletores e as empresas permitidas. Devolve False
    // quando qualquer carga falha; o frame nao apresenta mensagem e nao deixa
    // rascunho, porque o formulario descarta a aba parcial.
    function PrepararInclusao: Boolean;
    // Prepara a alteracao de uma operacao existente. A entidade recebida nao e
    // assumida: o frame guarda uma copia propria, com empresas e valores de
    // condicao independentes. Um vinculo que a carga nao devolve interrompe a
    // preparacao, para nao perder o vinculo em silencio.
    function PrepararAlteracao(
      const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
    // Motivo da ultima falha de preparacao; vazio quando todas as cargas foram
    // concluidas. O frame nao apresenta mensagem: o formulario inclui o motivo
    // no aviso unico da aba descartada.
    function FalhaCarga: string;
    // Transfere os campos editados para o rascunho. Nao valida nem grava: a
    // normalizacao e a validacao pertencem ao dominio e a gravacao ao
    // formulario. Retorna False quando nao ha rascunho.
    function AplicarCamposAoRascunho: Boolean;
    // Limpa os campos, as listas e a validacao, devolvendo o editor ao estado
    // neutro. Nao libera o rascunho, que pertence ao ciclo da aba.
    procedure LimparCampos;
    procedure LimparValidacao;
    // Contrato comum da aba de cadastro: a base consulta pendencias, encaminha o
    // foco e entrega a validacao sem conhecer este frame.
    function HasPendingChanges: Boolean;
    function TryFocus: Boolean;
    procedure ShowValidation(const AValidacao: ValidationEntityOutput);
    property Rascunho: OperacaoFiscalIbsCbsEtd read FRascunho;
  end;

implementation

{$R *.dfm}

const
  OperacaoNaoInformadaMessage =
    'A operação fiscal da alteração não foi informada.';
  // Identificação das cargas que interrompem a preparação da aba. O formulário
  // apresenta o motivo no aviso único da aba descartada.
  FalhaOperacaoInterna = 'Operação Interna';
  FalhaGrupoFiscal = 'Grupo Fiscal';
  FalhaRegraFiscal = 'Regra Fiscal';
  FalhaEmpresas = 'Empresas';

{ TfrmOperacaoFiscalIbsCbsCadastroFrame }

constructor TfrmOperacaoFiscalIbsCbsCadastroFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // O frame ja possui os proprios controles: a classe base carrega o DFM antes
  // deste trecho, portanto as opcoes podem ser montadas aqui.
  CarregarOpcoesCondicoes;

  // O rotulo de escopo acompanha apenas a escolha feita pelo usuario: a carga e
  // a limpeza do seletor nao notificam.
  fraGrupoFiscal.OnSelecaoAlterada := GrupoFiscalAlterado;

  // O painel deriva o campo do nome do controle; o rotulo exibido vem do
  // metadata da operacao fiscal usado pelo validador.
  fraValidacao.Bind('OperacaoInternaId', fraOperacaoInterna.ControleEdicao, '');
  fraValidacao.Bind('GrupoFiscalId', fraGrupoFiscal.ControleEdicao, '');
  fraValidacao.Bind('RegraFiscalId', fraRegraFiscal.ControleEdicao, '');
  fraValidacao.Bind('InicioVigencia', edInicioVigencia, '');
  fraValidacao.Bind('FimVigencia', edFimVigencia, '');

  // O erro das condicoes e agrupado pelo dominio: o vinculo leva o foco ao
  // primeiro checklist, que esta na sub-aba Condicoes.
  fraValidacao.Bind('Condicoes', clbTipoEmissao, '');
  fraValidacao.OnPrepararAtivacao := AtivarSecaoDoControle;

  pcSecoes.ActivePage := tsCadastro;
end;

destructor TfrmOperacaoFiscalIbsCbsCadastroFrame.Destroy;
begin
  FreeAndNil(FRascunho);
  inherited;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.CarregarOpcoesCondicoes;
begin
  CarregarCheckList(clbTipoEmissao, ocaTipoEmissao, FCodigosTipoEmissao);
  CarregarCheckList(clbNatureza, ocaNaturezaEmissao, FCodigosNatureza);
  CarregarCheckList(clbTipoOrgaoPublico, ocaTipoOrgaoPublico,
    FCodigosTipoOrgaoPublico);
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.CarregarCheckList(
  const ACheckList: TCheckListBox;
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  var ACodigos: TArrayInteger);
var
  I: Integer;
begin
  ACheckList.Items.Clear;

  // O dominio define os valores e o texto de cada opcao; a tela apenas os
  // apresenta na mesma ordem em que guarda os codigos.
  ACodigos := OperacaoFiscalIbsCbsCondicoes.ValoresDoDominio(AAtributo);
  for I := 0 to High(ACodigos) do
    ACheckList.Items.Add(
      OperacaoFiscalIbsCbsCondicoes.DescricaoValor(AAtributo, ACodigos[I]));
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
    // Atributo nao suportado (vinculo carregado de configuracao invalida) nao
    // tem editor; o dominio reporta a condicao na gravacao.
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

function TfrmOperacaoFiscalIbsCbsCadastroFrame.ValoresMarcados(
  const ACheckList: TCheckListBox;
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

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.MarcarCondicao(
  const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd);
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

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CondicoesDosCampos:
  OperacaoFiscalIbsCbsCondicaoEtdArray;
  procedure Adicionar(const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo;
    const AValores: TArrayInteger);
  begin
    // Um atributo sem valor marcado nao vira condicao; o conjunto vazio tambem
    // nao e gravado.
    if Length(AValores) = 0 then
      Exit;

    SetLength(Result, Length(Result) + 1);
    Result[High(Result)] :=
      OperacaoFiscalIbsCbsCondicaoEtd.Create(AAtributo, AValores);
  end;
begin
  SetLength(Result, 0);

  // A ordem segue o cadastro legado; o dominio normaliza os valores e a ordem
  // do conjunto antes de gravar.
  Adicionar(ocaTipoEmissao,
    ValoresMarcados(clbTipoEmissao, FCodigosTipoEmissao));
  Adicionar(ocaNaturezaEmissao,
    ValoresMarcados(clbNatureza, FCodigosNatureza));
  Adicionar(ocaTipoOrgaoPublico,
    ValoresMarcados(clbTipoOrgaoPublico, FCodigosTipoOrgaoPublico));
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CopiarCondicoes(
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray)
  : OperacaoFiscalIbsCbsCondicaoEtdArray;
var
  I: Integer;
begin
  SetLength(Result, Length(ACondicoes));
  for I := 0 to High(ACondicoes) do
    // Os valores sao copiados um a um: a aba edita um conjunto proprio e nao
    // compartilha o array da entidade de origem.
    Result[I] := OperacaoFiscalIbsCbsCondicaoEtd.Create(
      ACondicoes[I].Atributo,
      Copy(ACondicoes[I].Valores, 0, Length(ACondicoes[I].Valores)));
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CondicaoForaDoDominio(
  const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd): Boolean;
var
  I: Integer;
begin
  // Atributo sem editor e valor que o dominio nao aceita: os checklists nao
  // conseguem apresentar nem recriar a condicao.
  Result := ACondicao.Atributo = ocaInvalida;
  if Result then
    Exit;

  for I := 0 to High(ACondicao.Valores) do
    if not OperacaoFiscalIbsCbsCondicoes.CodigoValido(ACondicao.Atributo,
      ACondicao.Valores[I]) then
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
  // Cada atributo admite uma unica condicao no vinculo: o atributo presente
  // no conjunto indica que os checklists ja representam essa condicao.
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
  // A entidade nao possui Clone: a copia usa o construtor completo e, depois,
  // substitui os arrays por copias independentes.
  Result := OperacaoFiscalIbsCbsEtd.Create(
    AOperacao.Id,
    AOperacao.OperacaoInternaId,
    AOperacao.RegraFiscalId,
    AOperacao.GrupoFiscalId,
    AOperacao.InicioVigencia,
    AOperacao.FimVigencia,
    AOperacao.DataCadastro,
    AOperacao.DataAlteracao,
    AOperacao.Ativo,
    Copy(AOperacao.EmpresasId, 0, Length(AOperacao.EmpresasId)));

  Result.OperacaoInternaDescricao := AOperacao.OperacaoInternaDescricao;
  Result.GrupoFiscalDescricao := AOperacao.GrupoFiscalDescricao;
  Result.RegraFiscalDescricao := AOperacao.RegraFiscalDescricao;
  Result.Condicoes := CopiarCondicoes(AOperacao.Condicoes);
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.CarregarSeletores(
  const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
begin
  Result := False;

  if not fraOperacaoInterna.Carregar(AOperacao.OperacaoInternaId) then
  begin
    FFalhaCarga := FalhaOperacaoInterna;
    Exit;
  end;
  // Grupo Fiscal vazio e uma selecao valida e volta para a opcao vazia.
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

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.PreencherVigencias(
  const AOperacao: OperacaoFiscalIbsCbsEtd);
begin
  // O inicio e obrigatorio: uma data zerada permanece em branco e o dominio
  // reporta o campo, em vez de a tela inventar um valor.
  if AOperacao.InicioVigencia > 0 then
    edInicioVigencia.Text := DateService.ParseLocal(AOperacao.InicioVigencia)
  else
    edInicioVigencia.Clear;

  // O fim nulo desabilita a mascara: o painel de validacao pula o campo e a
  // marcacao e a unica forma de informar a data.
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
    lblEscopo.Caption :=
      'Escopo: Grupo Fiscal ' + fraGrupoFiscal.TextoSelecionado;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.GrupoFiscalAlterado(
  Sender: TObject);
begin
  AtualizarEscopo;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.AtivarSecaoDoControle(
  AControle: TWinControl);
var
  Atual: TControl;
begin
  // A sub-aba e identificada pela cadeia de pais: o painel de validacao entrega
  // o controle interno do seletor ou o checklist, nao a pagina.
  Atual := AControle;
  while Atual <> nil do
  begin
    if Atual = tsCondicoes then
    begin
      pcSecoes.ActivePage := tsCondicoes;
      Exit;
    end;

    if Atual = tsCadastro then
    begin
      pcSecoes.ActivePage := tsCadastro;
      Exit;
    end;

    Atual := Atual.Parent;
  end;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.AtivarSecaoDaValidacao(
  const AValidacao: ValidationEntityOutput);
begin
  // As condicoes ficam na sub-aba Condicoes; qualquer outro campo do validador
  // pertence ao Cadastro.
  if (Length(AValidacao.Validations) > 0) and
    SameText(Trim(AValidacao.Validations[0].FieldName), 'Condicoes') then
    pcSecoes.ActivePage := tsCondicoes
  else
    pcSecoes.ActivePage := tsCadastro;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.ckFimVigenciaClick(
  Sender: TObject);
begin
  // Desmarcado significa fim de vigencia nulo: a mascara nao aceita edicao
  // enquanto a data nao for informada.
  edFimVigencia.Enabled := ckFimVigencia.Checked;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.PrepararInclusao: Boolean;
begin
  Result := False;
  FFalhaCarga := '';

  FreeAndNil(FRascunho);
  LimparCampos;

  // Sem as listas carregadas nao ha aba: o formulario descarta a aba parcial e
  // apresenta o aviso com o motivo registrado aqui. O rascunho so nasce depois
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

function TfrmOperacaoFiscalIbsCbsCadastroFrame.PrepararAlteracao(
  const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
begin
  Result := False;
  if AOperacao = nil then
    raise Exception.Create(OperacaoNaoInformadaMessage);

  FFalhaCarga := '';

  // A copia e assumida pela aba antes da carga, para que uma falha libere
  // exatamente o rascunho desta preparacao.
  FreeAndNil(FRascunho);
  FRascunho := CopiarOperacao(AOperacao);

  LimparCampos;

  // Os seletores recebem os vinculos gravados. Um identificador ausente devolve
  // False e a preparacao e descartada, em vez de apagar o vinculo em silencio.
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

function TfrmOperacaoFiscalIbsCbsCadastroFrame.AplicarCamposAoRascunho: Boolean;
var
  Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  I: Integer;
begin
  Result := FRascunho <> nil;
  if not Result then
    Exit;

  // Somente os campos das duas sub-abas sao mapeados; os demais permanecem com
  // os valores da criacao ou da copia carregada.
  FRascunho.OperacaoInternaId := fraOperacaoInterna.IdSelecionado;
  FRascunho.RegraFiscalId := fraRegraFiscal.IdSelecionado;

  // A opcao vazia do Grupo Fiscal volta a ser vinculo nulo.
  if fraGrupoFiscal.IdSelecionado = '' then
    FRascunho.GrupoFiscalId := StringNullable.NullInstance()
  else
    FRascunho.GrupoFiscalId :=
      StringNullable.CreateOrNull(fraGrupoFiscal.IdSelecionado);

  // A data incompleta vira zero e o dominio reporta o campo obrigatorio; a tela
  // nao valida nem corrige o que foi digitado.
  FRascunho.InicioVigencia :=
    DateService.FromLocalToDateDef(edInicioVigencia.Text, 0);

  if ckFimVigencia.Checked then
    FRascunho.FimVigencia :=
      DateNullable.Create(DateService.FromLocalToDateDef(edFimVigencia.Text, 0))
  else
    FRascunho.FimVigencia := DateNullable.NullInstance();

  FRascunho.EmpresasId := fraEmpresas.EmpresasSelecionadas;

  // Os checklists so representam atributo e valores do dominio. A condicao
  // carregada fora desse conjunto e mantida enquanto o usuario nao escolher
  // valores validos para o mesmo atributo, para o dominio reportar a
  // configuracao invalida em vez de perde-la; escolher valores validos
  // substitui a condicao invalida.
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

  // A limpeza nao notifica o seletor de grupo: o rotulo e atualizado aqui.
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
  // Um rascunho aberto ja e pendencia: a inclusao nasce com dados a gravar e a
  // alteracao com a copia carregada do registro.
  Result := FRascunho <> nil;
end;

function TfrmOperacaoFiscalIbsCbsCadastroFrame.TryFocus: Boolean;
begin
  // O foco do primeiro erro passa pelo mesmo gancho de ativacao da sub-aba.
  Result := fraValidacao.FocarPrimeiroErro;
  if Result then
    Exit;

  // Sem erro vinculado, a operacao interna continua sendo o primeiro campo.
  pcSecoes.ActivePage := tsCadastro;
  Result := False;
  if fraOperacaoInterna.ControleEdicao.CanFocus then
  begin
    fraOperacaoInterna.ControleEdicao.SetFocus;
    Result := True;
  end;
end;

procedure TfrmOperacaoFiscalIbsCbsCadastroFrame.ShowValidation(
  const AValidacao: ValidationEntityOutput);
begin
  // A sub-aba do primeiro erro e apresentada antes das mensagens, para que o
  // usuario veja a secao a que o painel se refere.
  AtivarSecaoDaValidacao(AValidacao);
  fraValidacao.ExibirValidacao(AValidacao);
end;

end.
