unit GrupoFiscalCadastroFrame;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.CheckLst,
  TipoTributoFiscalEnumUnit, TipoComunsUnit, GrupoFiscalCadastro,
  ValidationPanelFrame, ValidationEntityOutputUnit;

type
  // Editor dos campos da inclusao de grupo fiscal. O frame apenas apresenta e
  // coleta descricao, tipo de tributo e empresas; a autorizacao, a gravacao e o
  // descarte do rascunho pertencem ao formulario que o contem. Os erros do caso
  // de uso sao apresentados pelo painel comum, que agrupa as mensagens por campo.
  TfrmGrupoFiscalCadastroFrame = class(TFrame)
    lblDescricao: TLabel;
    edDescricao: TEdit;
    lblTipoTributo: TLabel;
    cbTipoTributo: TComboBox;
    lblEmpresas: TLabel;
    clbEmpresas: TCheckListBox;
    fraValidacao: TfrmValidationPanelFrame;
  private
    // Identificador de cada linha do checklist, na mesma ordem dos itens
    // exibidos. A tela le os ids marcados, nunca as posicoes.
    FIdsEmpresas: TArrayInteger;
    // Os itens do tipo de tributo sao fixos e independem da inclusao: monta-los
    // uma unica vez mantem a lista disponivel em todas as inclusoes.
    procedure CarregarOpcoesTributo;
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
    // Encaminha o resultado do caso de uso ao painel de validacao, que agrupa os
    // campos e oferece o link para o editor correspondente.
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    // Foca o primeiro campo com erro; sem erro vinculado, foca a descricao.
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

  // O nome vinculado e o produzido pelo validador de SalvarGrupoFiscal; o painel
  // usa o controle para navegar e o rotulo para identificar o campo.
  fraValidacao.Bind(GrupoFiscalCampoDescricao, edDescricao, 'Descrição');
  fraValidacao.Bind(GrupoFiscalCampoTipoTributo, cbTipoTributo,
    'Tipo de tributo');
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
