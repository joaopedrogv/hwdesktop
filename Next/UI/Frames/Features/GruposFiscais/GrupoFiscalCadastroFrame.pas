unit GrupoFiscalCadastroFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  Vcl.CheckLst, TipoTributoFiscalEnumUnit, TipoComunsUnit, GrupoFiscalCadastro;

type
  // Editor dos campos da inclusao de grupo fiscal. O frame apenas apresenta e
  // coleta descricao, tipo de tributo e empresas; a autorizacao, a gravacao e o
  // descarte do rascunho pertencem ao formulario que o contem.
  TfrmGrupoFiscalCadastroFrame = class(TFrame)
    lblDescricao: TLabel;
    edDescricao: TEdit;
    lblErroDescricao: TLabel;
    lblTipoTributo: TLabel;
    cbTipoTributo: TComboBox;
    lblErroTipoTributo: TLabel;
    lblEmpresas: TLabel;
    clbEmpresas: TCheckListBox;
    lblErroGeral: TLabel;
  private
    // Identificador de cada linha do checklist, na mesma ordem dos itens
    // exibidos. A tela le os ids marcados, nunca as posicoes.
    FIdsEmpresas: TArrayInteger;
    // Os itens do tipo de tributo sao fixos e independem da inclusao: monta-los
    // uma unica vez mantem a lista disponivel em todas as inclusoes.
    procedure CarregarOpcoesTributo;
    procedure LimparErros;
    function TextoErrosDoCampo(const AErros: TGrupoFiscalFieldErrors;
      const ACampo: string): string;
    function TextoErrosDesconhecidos(
      const AErros: TGrupoFiscalFieldErrors): string;
    function GetDescricao: string;
    procedure SetDescricao(const AValue: string);
    function GetTipoTributo: TipoTributoFiscalEnum;
    procedure SetTipoTributo(const AValue: TipoTributoFiscalEnum);
  public
    constructor Create(AOwner: TComponent); override;
    // Reinicia o frame para uma inclusao: descricao vazia, tributo indefinido e
    // lista de empresas reconstruida a partir das opcoes recebidas.
    procedure PrepararInclusao(const AOpcoes: TGrupoFiscalEmpresaOptions);
    // Limpa campos e lista. A validacao tem limpeza propria, porque o descarte
    // do rascunho limpa apenas as mensagens.
    procedure LimparCampos;
    procedure LimparValidacao;
    // Associa cada erro ao campo correspondente; campos desconhecidos vao para
    // o rotulo geral. Nenhum dialogo e aberto e a operacao e idempotente.
    procedure ExibirValidacao(const AErros: TGrupoFiscalFieldErrors);
    // Foca o primeiro campo com erro; sem erro, foca a descricao.
    function FocarPrimeiroCampoInvalido: Boolean;
    function EmpresasSelecionadas: TArrayInteger;
    property Descricao: string read GetDescricao write SetDescricao;
    property TipoTributo: TipoTributoFiscalEnum read GetTipoTributo
      write SetTipoTributo;
  end;

implementation

{$R *.dfm}

constructor TfrmGrupoFiscalCadastroFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // O frame ja possui os proprios controles: a classe base carrega o DFM antes
  // deste trecho, portanto as opcoes podem ser montadas aqui.
  CarregarOpcoesTributo;
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

procedure TfrmGrupoFiscalCadastroFrame.LimparErros;
begin
  lblErroDescricao.Caption := '';
  lblErroDescricao.Visible := False;
  lblErroTipoTributo.Caption := '';
  lblErroTipoTributo.Visible := False;
  lblErroGeral.Caption := '';
  lblErroGeral.Visible := False;
end;

procedure TfrmGrupoFiscalCadastroFrame.LimparValidacao;
begin
  LimparErros;
end;

procedure TfrmGrupoFiscalCadastroFrame.LimparCampos;
begin
  edDescricao.Clear;
  cbTipoTributo.ItemIndex := Ord(tfIndefinido);
  clbEmpresas.Items.Clear;
  SetLength(FIdsEmpresas, 0);
end;

procedure TfrmGrupoFiscalCadastroFrame.PrepararInclusao(
  const AOpcoes: TGrupoFiscalEmpresaOptions);
var
  I: Integer;
begin
  LimparCampos;
  LimparValidacao;

  // A lista e reconstruida na ordem recebida e os ids acompanham os itens para
  // que a leitura da selecao devolva identificadores e nao posicoes.
  SetLength(FIdsEmpresas, Length(AOpcoes));
  clbEmpresas.Items.BeginUpdate;
  try
    for I := 0 to High(AOpcoes) do
    begin
      FIdsEmpresas[I] := AOpcoes[I].Id;
      clbEmpresas.Items.Add(AOpcoes[I].Texto);
      clbEmpresas.ItemEnabled[I] := AOpcoes[I].Habilitada;
      clbEmpresas.Checked[I] := AOpcoes[I].Marcada;
    end;
  finally
    clbEmpresas.Items.EndUpdate;
  end;
end;

function TfrmGrupoFiscalCadastroFrame.TextoErrosDoCampo(
  const AErros: TGrupoFiscalFieldErrors; const ACampo: string): string;
var
  I: Integer;
  Mensagem: string;
begin
  Result := '';
  for I := 0 to High(AErros) do
  begin
    if not SameText(Trim(AErros[I].Campo), ACampo) then
      Continue;

    // Itens sem mensagem nao tem o que apresentar.
    Mensagem := Trim(AErros[I].Mensagem);
    if Mensagem = '' then
      Continue;

    if Result = '' then
      Result := Mensagem
    else
      Result := Result + sLineBreak + Mensagem;
  end;
end;

function TfrmGrupoFiscalCadastroFrame.TextoErrosDesconhecidos(
  const AErros: TGrupoFiscalFieldErrors): string;
var
  I: Integer;
  Campo: string;
  Mensagem: string;
begin
  Result := '';
  for I := 0 to High(AErros) do
  begin
    Campo := Trim(AErros[I].Campo);
    if SameText(Campo, GrupoFiscalCampoDescricao) or
      SameText(Campo, GrupoFiscalCampoTipoTributo) then
      Continue;

    Mensagem := Trim(AErros[I].Mensagem);
    if Mensagem = '' then
      Continue;

    // O campo desconhecido e preservado no texto: uma validacao futura nao pode
    // desaparecer sem que o usuario saiba a que campo ela se refere.
    if Campo <> '' then
      Mensagem := Campo + ': ' + Mensagem;

    if Result = '' then
      Result := Mensagem
    else
      Result := Result + sLineBreak + Mensagem;
  end;
end;

procedure TfrmGrupoFiscalCadastroFrame.ExibirValidacao(
  const AErros: TGrupoFiscalFieldErrors);
begin
  LimparErros;

  lblErroDescricao.Caption :=
    TextoErrosDoCampo(AErros, GrupoFiscalCampoDescricao);
  lblErroDescricao.Visible := lblErroDescricao.Caption <> '';

  lblErroTipoTributo.Caption :=
    TextoErrosDoCampo(AErros, GrupoFiscalCampoTipoTributo);
  lblErroTipoTributo.Visible := lblErroTipoTributo.Caption <> '';

  lblErroGeral.Caption := TextoErrosDesconhecidos(AErros);
  lblErroGeral.Visible := lblErroGeral.Caption <> '';
end;

function TfrmGrupoFiscalCadastroFrame.FocarPrimeiroCampoInvalido: Boolean;
var
  Alvo: TWinControl;
begin
  Result := False;

  if lblErroDescricao.Visible then
    Alvo := edDescricao
  else if lblErroTipoTributo.Visible then
    Alvo := cbTipoTributo
  else
    Alvo := edDescricao;

  // A janela pode estar oculta ou o controle desabilitado; nesse caso o foco
  // nao e forcado e o chamador decide como prosseguir.
  if Alvo.CanFocus then
  begin
    Alvo.SetFocus;
    Result := True;
  end;
end;

function TfrmGrupoFiscalCadastroFrame.EmpresasSelecionadas: TArrayInteger;
var
  I: Integer;
  Total: Integer;
begin
  SetLength(Result, Length(FIdsEmpresas));
  Total := 0;
  // Todos os itens marcados sao devolvidos, inclusive os desabilitados, como no
  // cadastro legado.
  for I := 0 to High(FIdsEmpresas) do
    if clbEmpresas.Checked[I] then
    begin
      Result[Total] := FIdsEmpresas[I];
      Inc(Total);
    end;
  SetLength(Result, Total);
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
