unit ColumnSelectionFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.CheckLst;

type
  // A ordem recebida é a ordem exibida.
  TColumnSelectionEntry = record
    Key: string;
    Title: string;
    Checked: Boolean;
    Enabled: Boolean;
  end;

  TColumnSelectionEntries = TArray<TColumnSelectionEntry>;

  TColumnSelectionResult = record
    Key: string;
    Checked: Boolean;
  end;

  TColumnSelectionResults = TArray<TColumnSelectionResult>;

  // Não aplica a seleção: o chamador lê o resultado no aceite da tela que o contém.
  TfrmColumnSelectionFrame = class(TFrame)
    pnLista: TPanel;
    clbColunas: TCheckListBox;
    pmLista: TPopupMenu;
    miSelecionarTodos: TMenuItem;
    miRemoverSelecao: TMenuItem;
    miInverterSelecao: TMenuItem;
  private
    FEntries: TColumnSelectionEntries;
    // Os comandos coletivos alteram apenas itens habilitados; os demais mantêm o estado.
    procedure SetEnabledState(AValue: Boolean);
    procedure InvertEnabledState;
  published
    // O streaming do VCL só resolve eventos do DFM em métodos publicados.
    procedure miSelecionarTodosClick(Sender: TObject);
    procedure miRemoverSelecaoClick(Sender: TObject);
    procedure miInverterSelecaoClick(Sender: TObject);
  public
    // A chave deve ser única e não vazia; a verificação pertence ao chamador.
    procedure Configure(const AEntries: TColumnSelectionEntries);
    // Inclui os itens desabilitados; o chamador decide quais aplicar.
    function CollectSelection: TColumnSelectionResults;
  end;

implementation

{$R *.dfm}

procedure TfrmColumnSelectionFrame.Configure(const AEntries: TColumnSelectionEntries);
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
