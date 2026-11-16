unit EmpresaChecklistFrame;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.CheckLst, EmpresaOption,
  TipoComunsUnit;

type
  // Seletor de empresas reutilizavel. Recebe as opcoes ja preparadas e devolve
  // os identificadores marcados; a sessao, a consulta e o feedback pertencem a
  // tela que o utiliza.
  TfrmEmpresaChecklistFrame = class(TFrame)
    clbEmpresas: TCheckListBox;
  private
    // Identificador de cada linha, na mesma ordem dos itens exibidos. O host le
    // os ids marcados, nunca as posicoes.
    FIds: TArrayInteger;
  public
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
