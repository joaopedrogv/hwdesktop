unit SeletorEntidadeFrame;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, SelecaoEntidadeOption;

type
  // Seletor de entidade por identificador, usado por Operacao Interna e Grupo
  // Fiscal. O frame apresenta somente o texto de cada opcao e devolve o
  // identificador selecionado; a carga pertence a composicao e a falha nao deixa
  // lista parcial. O identificador vazio representa a opcao vazia, quando ela e
  // permitida pelo chamador.
  TfrmSeletorEntidadeFrame = class(TFrame)
    cbSelecao: TComboBox;
    procedure cbSelecaoChange(Sender: TObject);
  private
    // Identificador de cada item, na mesma ordem dos itens exibidos. O item da
    // opcao vazia tem identificador ''.
    FIds: TArray<string>;
    // Carregamento fornecido pela composicao. A referencia e gerenciada e cai
    // junto com o frame; o seletor nunca libera o caso de uso que a produziu.
    FCarregar: TCarregarSelecaoEntidade;
    FPermiteVazio: Boolean;
    // Suprime a notificacao durante a carga e a limpeza: o evento pertence a
    // mudanca feita pelo usuario.
    FSilencioso: Boolean;
    // Notificacao de mudanca feita pelo usuario.
    FOnSelecaoAlterada: TNotifyEvent;
    procedure NotificarSelecao;
    function IndiceDoId(const AId: string): Integer;
  public
    // Recebe o carregamento e informa se a lista aceita a opcao vazia. A
    // composicao chama uma unica vez, logo apos criar o frame.
    procedure ConfigurarCarregamento(const ACarregar: TCarregarSelecaoEntidade;
      APermiteVazio: Boolean);
    // Limpa a lista e a selecao, executa o carregamento e seleciona AIdAtual. A
    // opcao vazia e selecionada quando AIdAtual = '' e ela e permitida; sem
    // permissao, nenhum item fica selecionado. Um identificador informado que
    // nao consta da carga devolve False sem deixar lista ou selecao parcial e
    // sem criar item provisorio, para que o chamador interrompa a preparacao em
    // vez de perder o vinculo.
    function Carregar(const AIdAtual: string): Boolean;
    // Identificador do item corrente; '' para a opcao vazia ou sem selecao.
    function IdSelecionado: string;
    // Texto do item corrente, usado pelos rotulos da tela.
    function TextoSelecionado: string;
    procedure Limpar;
    // Controle que recebe o foco e o vinculo do painel de validacao.
    function ControleEdicao: TWinControl;
    // Notifica a mudanca feita pelo usuario; a carga e a limpeza nao notificam.
    property OnSelecaoAlterada: TNotifyEvent read FOnSelecaoAlterada
      write FOnSelecaoAlterada;
  end;

implementation

{$R *.dfm}

const
  TextoOpcaoVazia = '[ Vazio ]';

{ TfrmSeletorEntidadeFrame }

procedure TfrmSeletorEntidadeFrame.ConfigurarCarregamento(
  const ACarregar: TCarregarSelecaoEntidade; APermiteVazio: Boolean);
begin
  FCarregar := ACarregar;
  FPermiteVazio := APermiteVazio;
end;

function TfrmSeletorEntidadeFrame.Carregar(const AIdAtual: string): Boolean;
var
  Opcoes: TSelecaoEntidadeOptions;
  I: Integer;
  Indice: Integer;
begin
  Result := False;

  // Uma carga nova substitui a lista anterior; a falha nao deixa opcoes parciais
  // nem a selecao da preparacao anterior.
  Limpar;
  if not Assigned(FCarregar) then
    Exit;
  if not FCarregar(AIdAtual, Opcoes) then
    Exit;

  FSilencioso := True;
  try
    cbSelecao.Items.BeginUpdate;
    try
      if FPermiteVazio then
      begin
        SetLength(FIds, 1);
        FIds[0] := '';
        cbSelecao.Items.Add(TextoOpcaoVazia);
      end;

      for I := 0 to High(Opcoes) do
      begin
        SetLength(FIds, Length(FIds) + 1);
        FIds[High(FIds)] := Opcoes[I].Id;
        cbSelecao.Items.Add(Opcoes[I].Texto);
      end;
    finally
      cbSelecao.Items.EndUpdate;
    end;

    if AIdAtual = '' then
    begin
      // Grupo Fiscal vazio e uma selecao valida; Operacao Interna sem valor
      // apenas permanece sem item selecionado ate o usuario escolher.
      if FPermiteVazio then
        cbSelecao.ItemIndex := 0;
      Result := True;
      Exit;
    end;

    Indice := IndiceDoId(AIdAtual);
    if Indice < 0 then
    begin
      // O vinculo informado continua existindo para o chamador: sem item
      // provisorio, a lista e a selecao sao descartadas e a preparacao falha.
      Limpar;
      Exit;
    end;

    cbSelecao.ItemIndex := Indice;
    Result := True;
  finally
    FSilencioso := False;
  end;
end;

function TfrmSeletorEntidadeFrame.ControleEdicao: TWinControl;
begin
  Result := cbSelecao;
end;

function TfrmSeletorEntidadeFrame.IdSelecionado: string;
begin
  Result := '';
  if (cbSelecao.ItemIndex >= 0) and (cbSelecao.ItemIndex <= High(FIds)) then
    Result := FIds[cbSelecao.ItemIndex];
end;

function TfrmSeletorEntidadeFrame.IndiceDoId(const AId: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(FIds) do
    if FIds[I] = AId then
      Exit(I);
end;

procedure TfrmSeletorEntidadeFrame.Limpar;
var
  Anterior: Boolean;
begin
  // Clear reinicia os itens, a selecao e a lista interna do controle; limpar
  // apenas os itens deixaria o estado anterior para tras. A limpeza nao dispara
  // OnSelecaoAlterada, mesmo quando interrompe uma selecao existente.
  Anterior := FSilencioso;
  FSilencioso := True;
  try
    cbSelecao.Items.Clear;
    cbSelecao.ItemIndex := -1;
    SetLength(FIds, 0);
  finally
    FSilencioso := Anterior;
  end;
end;

procedure TfrmSeletorEntidadeFrame.NotificarSelecao;
begin
  if FSilencioso then
    Exit;

  if Assigned(FOnSelecaoAlterada) then
    FOnSelecaoAlterada(Self);
end;

function TfrmSeletorEntidadeFrame.TextoSelecionado: string;
begin
  Result := cbSelecao.Text;
end;

procedure TfrmSeletorEntidadeFrame.cbSelecaoChange(Sender: TObject);
begin
  NotificarSelecao;
end;

end.
