unit ColumnSelectionFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.CheckLst;

type
  // Item recebido: identidade estavel, rotulo, estado marcado e se a marcacao
  // pode ser alterada. A ordem recebida e a ordem exibida.
  TColumnSelectionEntry = record
    Key: string;
    Title: string;
    Checked: Boolean;
    Enabled: Boolean;
  end;

  TColumnSelectionEntries = TArray<TColumnSelectionEntry>;

  // Resultado: identidade estavel e estado marcado corrente.
  TColumnSelectionResult = record
    Key: string;
    Checked: Boolean;
  end;

  TColumnSelectionResults = TArray<TColumnSelectionResult>;

  // Lista reutilizavel de selecao. O chamador informa a chave estavel, o rotulo
  // exibido, o estado marcado e se a marcacao pode ser alterada. O frame nao
  // conhece conjunto, grade, definicao de coluna nem persistencia; por isso
  // serve tambem a outras listas de itens elegiveis. Nao aplica nada durante a
  // interacao: o chamador le a selecao no aceite da tela que o contem.
  TfrmColumnSelectionFrame = class(TFrame)
    pnLista: TPanel;
    clbColunas: TCheckListBox;
    pmLista: TPopupMenu;
    miSelecionarTodos: TMenuItem;
    miRemoverSelecao: TMenuItem;
    miInverterSelecao: TMenuItem;
  private
    FEntries: TColumnSelectionEntries;
    // Os comandos coletivos alteram apenas itens habilitados; itens fixos
    // permanecem com o estado recebido.
    procedure SetEnabledState(AValue: Boolean);
    procedure InvertEnabledState;
  published
    // Eventos referenciados pelo DFM precisam ser publicados para que o
    // streaming do VCL resolva os metodos ao carregar o frame.
    procedure miSelecionarTodosClick(Sender: TObject);
    procedure miRemoverSelecaoClick(Sender: TObject);
    procedure miInverterSelecaoClick(Sender: TObject);
  public
    // Reconstroi a lista na ordem recebida. A chave deve ser unica e nao vazia;
    // essa verificacao pertence ao chamador, dono do significado da chave.
    procedure Configure(const AEntries: TColumnSelectionEntries);
    // Devolve todos os itens, na ordem da lista, inclusive os desabilitados. O
    // chamador decide quais aplicar.
    function CollectSelection: TColumnSelectionResults;
  end;

implementation

{$R *.dfm}

procedure TfrmColumnSelectionFrame.Configure(
  const AEntries: TColumnSelectionEntries);
var
  I: Integer;
begin
  FEntries := Copy(AEntries);

  clbColunas.Items.BeginUpdate;
  try
    clbColunas.Items.Clear;
    for I := 0 to High(FEntries) do
    begin
      clbColunas.Items.Add(FEntries[I].Title);
      clbColunas.ItemEnabled[I] := FEntries[I].Enabled;
      clbColunas.Checked[I] := FEntries[I].Checked;
    end;
  finally
    clbColunas.Items.EndUpdate;
  end;
end;

function TfrmColumnSelectionFrame.CollectSelection: TColumnSelectionResults;
var
  I: Integer;
begin
  SetLength(Result, Length(FEntries));
  for I := 0 to High(FEntries) do
  begin
    Result[I].Key := FEntries[I].Key;
    Result[I].Checked := clbColunas.Checked[I];
  end;
end;

procedure TfrmColumnSelectionFrame.SetEnabledState(AValue: Boolean);
var
  I: Integer;
begin
  for I := 0 to clbColunas.Items.Count - 1 do
    if clbColunas.ItemEnabled[I] then
      clbColunas.Checked[I] := AValue;
end;

procedure TfrmColumnSelectionFrame.InvertEnabledState;
var
  I: Integer;
begin
  for I := 0 to clbColunas.Items.Count - 1 do
    if clbColunas.ItemEnabled[I] then
      clbColunas.Checked[I] := not clbColunas.Checked[I];
end;

procedure TfrmColumnSelectionFrame.miSelecionarTodosClick(Sender: TObject);
begin
  SetEnabledState(True);
end;

procedure TfrmColumnSelectionFrame.miRemoverSelecaoClick(Sender: TObject);
begin
  SetEnabledState(False);
end;

procedure TfrmColumnSelectionFrame.miInverterSelecaoClick(Sender: TObject);
begin
  InvertEnabledState;
end;

end.
