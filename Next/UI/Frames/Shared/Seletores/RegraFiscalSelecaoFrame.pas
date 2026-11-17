unit RegraFiscalSelecaoFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  RegraFiscalSelecaoOption, DateTimeServiceUnit;

type
  // Seletor de Regra Fiscal. Apresenta o texto identificado pela classificacao e
  // pela descricao entregue pela composicao e a vigencia da opcao corrente. A
  // carga, a falha e a limpeza seguem o mesmo contrato do seletor de entidade:
  // sem lista parcial e sem item provisorio para um vinculo nao encontrado.
  TfrmRegraFiscalSelecaoFrame = class(TFrame)
    cbSelecao: TComboBox;
    lblVigencia: TLabel;
    procedure cbSelecaoChange(Sender: TObject);
  private
    // Opcoes carregadas, na mesma ordem dos itens exibidos; a vigencia de cada
    // uma acompanha a selecao corrente.
    FOpcoes: TRegraFiscalSelecaoOptions;
    // Carregamento fornecido pela composicao. A referencia e gerenciada e cai
    // junto com o frame; o seletor nunca libera o caso de uso que a produziu.
    FCarregar: TCarregarRegraFiscalSelecao;
    // Suprime a notificacao durante a carga e a limpeza: o evento pertence a
    // mudanca feita pelo usuario.
    FSilencioso: Boolean;
    // Notificacao de mudanca feita pelo usuario.
    FOnSelecaoAlterada: TNotifyEvent;
    procedure AtualizarVigencia;
    procedure NotificarSelecao;
    function IndiceDoId(const AId: string): Integer;
    function TextoVigencia(const AOpcao: TRegraFiscalSelecaoOption): string;
  public
    // Recebe o carregamento das regras. A composicao chama uma unica vez, logo
    // apos criar o frame.
    procedure ConfigurarCarregamento(
      const ACarregar: TCarregarRegraFiscalSelecao);
    // Limpa a lista e a selecao, executa o carregamento e seleciona AIdAtual. O
    // identificador vazio e aceito e deixa o seletor sem item selecionado. Um
    // identificador informado que nao consta da carga devolve False sem deixar
    // lista ou selecao parcial e sem criar item provisorio, para que o chamador
    // interrompa a preparacao em vez de perder o vinculo.
    function Carregar(const AIdAtual: string): Boolean;
    // Identificador do item corrente; '' sem selecao.
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

{ TfrmRegraFiscalSelecaoFrame }

procedure TfrmRegraFiscalSelecaoFrame.ConfigurarCarregamento(
  const ACarregar: TCarregarRegraFiscalSelecao);
begin
  FCarregar := ACarregar;
end;

function TfrmRegraFiscalSelecaoFrame.Carregar(
  const AIdAtual: string): Boolean;
var
  Opcoes: TRegraFiscalSelecaoOptions;
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
    // A lista de opcoes e a origem da vigencia da selecao; os itens do controle
    // guardam apenas o texto.
    FOpcoes := Copy(Opcoes, 0, Length(Opcoes));

    cbSelecao.Items.BeginUpdate;
    try
      for I := 0 to High(FOpcoes) do
        cbSelecao.Items.Add(FOpcoes[I].Texto);
    finally
      cbSelecao.Items.EndUpdate;
    end;

    if AIdAtual <> '' then
    begin
      Indice := IndiceDoId(AIdAtual);
      if Indice < 0 then
      begin
        // O vinculo informado continua existindo para o chamador: sem item
        // provisorio, a lista e a selecao sao descartadas e a preparacao falha.
        Limpar;
        Exit;
      end;
      cbSelecao.ItemIndex := Indice;
    end;

    AtualizarVigencia;
    Result := True;
  finally
    FSilencioso := False;
  end;
end;

function TfrmRegraFiscalSelecaoFrame.ControleEdicao: TWinControl;
begin
  Result := cbSelecao;
end;

function TfrmRegraFiscalSelecaoFrame.IdSelecionado: string;
begin
  Result := '';
  if (cbSelecao.ItemIndex >= 0) and (cbSelecao.ItemIndex <= High(FOpcoes)) then
    Result := FOpcoes[cbSelecao.ItemIndex].Id;
end;

function TfrmRegraFiscalSelecaoFrame.IndiceDoId(const AId: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(FOpcoes) do
    if FOpcoes[I].Id = AId then
      Exit(I);
end;

procedure TfrmRegraFiscalSelecaoFrame.Limpar;
var
  Anterior: Boolean;
begin
  // A limpeza nao dispara OnSelecaoAlterada, mesmo quando interrompe uma
  // selecao existente.
  Anterior := FSilencioso;
  FSilencioso := True;
  try
    cbSelecao.Items.Clear;
    cbSelecao.ItemIndex := -1;
    SetLength(FOpcoes, 0);
    AtualizarVigencia;
  finally
    FSilencioso := Anterior;
  end;
end;

procedure TfrmRegraFiscalSelecaoFrame.AtualizarVigencia;
begin
  if (cbSelecao.ItemIndex >= 0) and (cbSelecao.ItemIndex <= High(FOpcoes)) then
  begin
    lblVigencia.Caption := TextoVigencia(FOpcoes[cbSelecao.ItemIndex]);
    lblVigencia.Visible := True;
  end
  else
  begin
    // Sem selecao nao existe vigencia a apresentar.
    lblVigencia.Caption := '';
    lblVigencia.Visible := False;
  end;
end;

procedure TfrmRegraFiscalSelecaoFrame.NotificarSelecao;
begin
  if FSilencioso then
    Exit;

  if Assigned(FOnSelecaoAlterada) then
    FOnSelecaoAlterada(Self);
end;

function TfrmRegraFiscalSelecaoFrame.TextoSelecionado: string;
begin
  Result := cbSelecao.Text;
end;

function TfrmRegraFiscalSelecaoFrame.TextoVigencia(
  const AOpcao: TRegraFiscalSelecaoOption): string;
begin
  if AOpcao.TemFimVigencia then
    Result := Format('Vigência: De %s até %s',
      [DateService.ParseLocal(AOpcao.InicioVigencia),
       DateService.ParseLocal(AOpcao.FimVigencia)])
  else
    Result := Format('Início Vigência: %s',
      [DateService.ParseLocal(AOpcao.InicioVigencia)]);
end;

procedure TfrmRegraFiscalSelecaoFrame.cbSelecaoChange(Sender: TObject);
begin
  if FSilencioso then
    Exit;

  AtualizarVigencia;
  NotificarSelecao;
end;

end.
