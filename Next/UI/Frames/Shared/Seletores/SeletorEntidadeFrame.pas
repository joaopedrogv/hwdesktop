unit SeletorEntidadeFrame;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, SelecaoEntidadeOption;

type
  TfrmSeletorEntidadeFrame = class(TFrame)
    cbSelecao: TComboBox;
    procedure cbSelecaoChange(Sender: TObject);
  private
    // Identificadores na mesma ordem dos itens exibidos; a opção vazia usa ''.
    FIds: TArray<string>;
    // Referência gerenciada pela composição: o seletor nunca a libera.
    FCarregar: TCarregarSelecaoEntidade;
    FPermiteVazio: Boolean;
    FSilencioso: Boolean;
    FOnSelecaoAlterada: TNotifyEvent;
    procedure NotificarSelecao;
    function IndiceDoId(const AId: string): Integer;
  public
    procedure ConfigurarCarregamento(const ACarregar: TCarregarSelecaoEntidade; APermiteVazio: Boolean);
    // Um identificador fora da carga devolve False e descarta lista e seleção, sem item provisório, para o chamador
    // interromper a preparação em vez de perder o vínculo.
    function Carregar(const AIdAtual: string): Boolean;
    // Identificador do item corrente; '' para a opção vazia ou sem seleção.
    function IdSelecionado: string;
    function TextoSelecionado: string;
    procedure Limpar;
    // Controle que recebe o foco e o vínculo do painel de validação.
    function ControleEdicao: TWinControl;
    // Notifica apenas a mudança feita pelo usuário; a carga e a limpeza não notificam.
    property OnSelecaoAlterada: TNotifyEvent read FOnSelecaoAlterada write FOnSelecaoAlterada;
  end;

implementation

{$R *.dfm}

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

  // A falha não deixa opções parciais nem a seleção da preparação anterior.
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
        cbSelecao.Items.Add('[ Vazio ]');
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
      // Grupo Fiscal vazio é uma seleção válida; Operação Interna apenas fica sem item selecionado até o usuário
      // escolher.
      if FPermiteVazio then
        cbSelecao.ItemIndex := 0;
      Result := True;
      Exit;
    end;

    Indice := IndiceDoId(AIdAtual);
    if Indice < 0 then
    begin
      // O vínculo continua existindo para o chamador: sem item provisório, a preparação falha.
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
  // Clear reinicia itens e lista interna. A limpeza não dispara OnSelecaoAlterada, mesmo interrompendo uma seleção.
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
