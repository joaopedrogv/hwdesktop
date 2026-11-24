unit EmpresaChecklistFrame;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.CheckLst, EmpresaOption,
  TipoComunsUnit;

type
  // A falha de carga devolve False sem mensagem e sem lista parcial; a sessão e o feedback pertencem à tela.
  TfrmEmpresaChecklistFrame = class(TFrame)
    clbEmpresas: TCheckListBox;
  private
    // Identificadores na mesma ordem dos itens exibidos; o host lê os ids, nunca as posições.
    FIds: TArrayInteger;
    // Referência gerenciada pela composição: o seletor nunca a libera.
    FCarregarOpcoes: TCarregarOpcoesEmpresas;
    function Carregar(const APreparacao: TPreparacaoEmpresas; const AEmpresasVinculadas: TArrayInteger): Boolean;
  public
    procedure ConfigurarCarregamento(const ACarregar: TCarregarOpcoesEmpresas);
    // Inclusão: carrega as empresas e marca as permitidas ao login.
    function CarregarInclusao: Boolean;
    // Alteração: marca os vínculos gravados, inclusive os bloqueados; sem vínculos, nada fica marcado.
    function CarregarAlteracao(const AEmpresasVinculadas: TArrayInteger): Boolean;
    procedure Configurar(const AOpcoes: TEmpresaOptions);
    // Inclui os itens desabilitados, na ordem da lista.
    function EmpresasSelecionadas: TArrayInteger;
    procedure Limpar;
  end;

implementation

{$R *.dfm}

procedure TfrmEmpresaChecklistFrame.ConfigurarCarregamento(const ACarregar: TCarregarOpcoesEmpresas);
begin
  FCarregarOpcoes := ACarregar;
end;

function TfrmEmpresaChecklistFrame.Carregar(const APreparacao: TPreparacaoEmpresas;
  const AEmpresasVinculadas: TArrayInteger): Boolean;
var
  Opcoes: TEmpresaOptions;
begin
  Result := False;

  // A falha não deixa opções parciais nem a lista da preparação anterior.
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

function TfrmEmpresaChecklistFrame.CarregarAlteracao(const AEmpresasVinculadas: TArrayInteger): Boolean;
begin
  Result := Carregar(peAlteracao, AEmpresasVinculadas);
end;

procedure TfrmEmpresaChecklistFrame.Configurar(const AOpcoes: TEmpresaOptions);
var
  I: Integer;
begin
  Limpar;

  SetLength(FIds, Length(AOpcoes));
  clbEmpresas.Items.BeginUpdate;
  try
    for I := 0 to High(AOpcoes) do
    begin
      FIds[I] := AOpcoes[I].Id;
      clbEmpresas.Items.Add(AOpcoes[I].Texto);
      // A disponibilidade vem antes da marca: um item bloqueado mantém a marca do vínculo gravado.
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
  // Clear reinicia itens e lista interna; limpar só os itens deixaria estado para trás.
  clbEmpresas.Clear;
  SetLength(FIds, 0);
end;

end.
