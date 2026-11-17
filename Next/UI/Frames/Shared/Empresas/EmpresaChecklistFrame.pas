unit EmpresaChecklistFrame;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.CheckLst, EmpresaOption,
  TipoComunsUnit;

type
  // Seletor de empresas reutilizavel. Carrega as opcoes pela funcao recebida da
  // composicao e devolve os identificadores marcados; a sessao, a consulta e o
  // feedback pertencem a tela que o utiliza. A falha de carga devolve False sem
  // apresentar mensagem e sem deixar lista parcial.
  TfrmEmpresaChecklistFrame = class(TFrame)
    clbEmpresas: TCheckListBox;
  private
    // Identificador de cada linha, na mesma ordem dos itens exibidos. O host le
    // os ids marcados, nunca as posicoes.
    FIds: TArrayInteger;
    // Carregamento fornecido pela composicao. A referencia e gerenciada e cai
    // junto com o frame; o seletor nunca libera o caso de uso nem a sessao.
    FCarregarOpcoes: TCarregarOpcoesEmpresas;
    function Carregar(const APreparacao: TPreparacaoEmpresas;
      const AEmpresasVinculadas: TArrayInteger): Boolean;
  public
    // Recebe o carregamento das empresas; a composicao chama uma unica vez,
    // logo apos criar o frame.
    procedure ConfigurarCarregamento(const ACarregar: TCarregarOpcoesEmpresas);
    // Inclusao: carrega as empresas e mantem marcadas as permitidas ao login.
    function CarregarInclusao: Boolean;
    // Alteracao: carrega as empresas e substitui as marcas pelos vinculos
    // gravados, inclusive os bloqueados. Sem vinculos, nada fica marcado.
    function CarregarAlteracao(
      const AEmpresasVinculadas: TArrayInteger): Boolean;
    // Substitui a lista anterior pela lista recebida, preservando a ordem, o
    // texto e a disponibilidade de cada opcao.
    procedure Configurar(const AOpcoes: TEmpresaOptions);
    // Devolve os ids marcados, inclusive os de itens desabilitados, na ordem da
    // lista.
    function EmpresasSelecionadas: TArrayInteger;
    procedure Limpar;
  end;

implementation

{$R *.dfm}

{ TfrmEmpresaChecklistFrame }

procedure TfrmEmpresaChecklistFrame.ConfigurarCarregamento(
  const ACarregar: TCarregarOpcoesEmpresas);
begin
  FCarregarOpcoes := ACarregar;
end;

function TfrmEmpresaChecklistFrame.Carregar(
  const APreparacao: TPreparacaoEmpresas;
  const AEmpresasVinculadas: TArrayInteger): Boolean;
var
  Opcoes: TEmpresaOptions;
begin
  Result := False;

  // Uma carga nova substitui a lista anterior; a falha nao deixa opcoes parciais
  // nem a lista da preparacao anterior.
  Limpar;
  if not Assigned(FCarregarOpcoes) then
    Exit;
  if not FCarregarOpcoes(APreparacao, AEmpresasVinculadas, Opcoes) then
    Exit;

  Configurar(Opcoes);
  Result := True;
end;

function TfrmEmpresaChecklistFrame.CarregarInclusao: Boolean;
begin
  Result := Carregar(peInclusao, nil);
end;

function TfrmEmpresaChecklistFrame.CarregarAlteracao(
  const AEmpresasVinculadas: TArrayInteger): Boolean;
begin
  Result := Carregar(peAlteracao, AEmpresasVinculadas);
end;

procedure TfrmEmpresaChecklistFrame.Configurar(
  const AOpcoes: TEmpresaOptions);
var
  I: Integer;
begin
  // A lista e reconstruida a cada preparacao: a anterior nao e reaproveitada.
  Limpar;

  SetLength(FIds, Length(AOpcoes));
  clbEmpresas.Items.BeginUpdate;
  try
    for I := 0 to High(AOpcoes) do
    begin
      FIds[I] := AOpcoes[I].Id;
      clbEmpresas.Items.Add(AOpcoes[I].Texto);
      // A disponibilidade vem antes da marca: um item bloqueado continua
      // podendo manter a marca do vinculo gravado.
      clbEmpresas.ItemEnabled[I] := AOpcoes[I].Habilitada;
      clbEmpresas.Checked[I] := AOpcoes[I].Marcada;
    end;
  finally
    clbEmpresas.Items.EndUpdate;
  end;
end;

function TfrmEmpresaChecklistFrame.EmpresasSelecionadas: TArrayInteger;
var
  I: Integer;
  Total: Integer;
begin
  SetLength(Result, Length(FIds));
  Total := 0;
  // Todos os itens marcados sao devolvidos, inclusive os desabilitados, como no
  // cadastro legado.
  for I := 0 to High(FIds) do
    if clbEmpresas.Checked[I] then
    begin
      Result[Total] := FIds[I];
      Inc(Total);
    end;
  SetLength(Result, Total);
end;

procedure TfrmEmpresaChecklistFrame.Limpar;
begin
  // Clear reinicia os itens, a selecao e a lista interna do controle; limpar
  // apenas os itens deixaria o estado anterior para tras.
  clbEmpresas.Clear;
  SetLength(FIds, 0);
end;

end.
