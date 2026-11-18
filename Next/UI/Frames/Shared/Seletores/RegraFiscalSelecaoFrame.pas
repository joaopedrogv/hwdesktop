unit RegraFiscalSelecaoFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  RegraFiscalSelecaoOption, DateTimeServiceUnit;

type
  TfrmRegraFiscalSelecaoFrame = class(TFrame)
    cbSelecao: TComboBox;
    lblVigencia: TLabel;
    procedure cbSelecaoChange(Sender: TObject);
  private
    // Opções na mesma ordem dos itens exibidos; a vigência acompanha a seleção.
    FOpcoes: TRegraFiscalSelecaoOptions;
    // Referência gerenciada pela composição: o seletor nunca a libera.
    FCarregar: TCarregarRegraFiscalSelecao;
    FSilencioso: Boolean;
    FOnSelecaoAlterada: TNotifyEvent;
    procedure AtualizarVigencia;
    procedure NotificarSelecao;
    function IndiceDoId(const AId: string): Integer;
    function TextoVigencia(const AOpcao: TRegraFiscalSelecaoOption): string;
  public
    procedure ConfigurarCarregamento(const ACarregar: TCarregarRegraFiscalSelecao);
    // Um identificador fora da carga devolve False e descarta lista e seleção, sem item provisório, para o chamador
    // interromper a preparação em vez de perder o vínculo.
    function Carregar(const AIdAtual: string): Boolean;
    // Identificador do item corrente; '' sem seleção.
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

procedure TfrmRegraFiscalSelecaoFrame.ConfigurarCarregamento(const ACarregar: TCarregarRegraFiscalSelecao);
begin
  FCarregar := ACarregar;
end;

function TfrmRegraFiscalSelecaoFrame.Carregar(const AIdAtual: string): Boolean;
var
  Opcoes: TRegraFiscalSelecaoOptions;
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
        // O vínculo continua existindo para o chamador: sem item provisório, a preparação falha.
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
  // A limpeza não dispara OnSelecaoAlterada, mesmo interrompendo uma seleção.
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

function TfrmRegraFiscalSelecaoFrame.TextoVigencia(const AOpcao: TRegraFiscalSelecaoOption): string;
begin
  if AOpcao.TemFimVigencia then
    Result := Format('Vigência: De %s até %s',
      [DateService.ParseLocal(AOpcao.InicioVigencia), DateService.ParseLocal(AOpcao.FimVigencia)])
  else
    Result := Format('Início Vigência: %s', [DateService.ParseLocal(AOpcao.InicioVigencia)]);
end;

procedure TfrmRegraFiscalSelecaoFrame.cbSelecaoChange(Sender: TObject);
begin
  if FSilencioso then
    Exit;

  AtualizarVigencia;
  NotificarSelecao;
end;

end.
