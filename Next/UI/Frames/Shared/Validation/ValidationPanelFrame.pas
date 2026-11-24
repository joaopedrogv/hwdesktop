unit ValidationPanelFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, ValidationEntityOutputUnit;

type
  // O SysLink não recebe o Enter: o descendente pede a tecla e ativa como no clique.
  TVisualValidationLink = class(TLinkLabel)
  private
    FNomeCampo: string;
    procedure WMGetDlgCode(var AMessage: TWMGetDlgCode); message WM_GETDLGCODE;
  public
    property NomeCampo: string read FNomeCampo write FNomeCampo;
  end;

  TVinculoCampoValidacao = record
    NomeCampo: string;
    Controle: TWinControl;
    NomeExibicao: string;
  end;

  // Os controles pertencem ao painel e são reposicionados pela largura disponível.
  TLinhaValidacao = record
    Link: TVisualValidationLink;
    Texto: TLabel;
  end;

  // A navegação usa apenas os vínculos registrados pela tela.
  TfrmValidationPanelFrame = class(TFrame)
    pnTitulo: TPanel;
    lblTitulo: TLabel;
    sbMensagens: TScrollBox;
    procedure sbMensagensResize(Sender: TObject);
  private
    FVinculos: TArray<TVinculoCampoValidacao>;
    FLinhas: TArray<TLinhaValidacao>;
    FAjustando: Boolean;
    procedure LimparLinhas;
    function IndiceVinculo(const ANomeCampo: string): Integer;
    function NomeCampoDoControle(AControle: TWinControl): string;
    function JaAgrupado(const ACampos: TArray<string>; const ANomeCampo: string): Boolean;
    function MensagensDoCampo(const AValidacao: ValidationEntityOutput; const ANomeCampo: string): string;
    procedure CriarLinha(const ANomeCampo, ATexto: string; AControle: TWinControl; const ANomeExibicao: string);
    function LarguraDisponivel: Integer;
    procedure ReorganizarLinhas;
    procedure PrepararControle(AControle: TControl);
    procedure RolarControleEmVista(AControle: TControl);
    procedure RolarPainelEmVista;
    procedure ApresentarSecaoDoPrimeiroCampo;
    function AtivarCampo(const ANomeCampo: string): Boolean;
    procedure LinkClick(Sender: TObject; const ALink: string; ALinkType: TSysLinkType);
    procedure LinkKeyDown(Sender: TObject; var AKey: Word; AShift: TShiftState);
  public
    destructor Destroy; override;
    // O vínculo repetido substitui o anterior: um campo possui um único editor.
    procedure Bind(const ANomeCampo: string; AControle: TWinControl; const ANomeExibicao: string); overload;
    // O campo é derivado do sufixo do nome do controle; o rótulo vem do metadata.
    procedure Bind(AControle: TWinControl); overload;
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    procedure Limpar;
    // Campos sem vínculo não recebem foco.
    function FocarPrimeiroErro: Boolean;
  end;

implementation

{$R *.dfm}

uses
  Vcl.ComCtrls, Vcl.Graphics;

const
  MargemLinha = 10;
  IntervaloLinkTexto = 2;
  IntervaloEntreLinhas = 8;
  LarguraMinimaTexto = 120;

// O rótulo não se auto-dimensiona: a altura é medida com a mesma fonte antes de posicionar a linha seguinte.
function AlturaDoTextoQuebrado(const ATexto: string; AFonte: TFont; ALargura: Integer): Integer;
var
  Bitmap: TBitmap;
  Area: TRect;
begin
  Result := Abs(AFonte.Height);
  if (ATexto = '') or (ALargura <= 0) then
    Exit;

  Bitmap := TBitmap.Create;
  try
    Bitmap.Canvas.Font.Assign(AFonte);
    Area.Left := 0;
    Area.Top := 0;
    Area.Right := ALargura;
    Area.Bottom := 0;
    DrawText(Bitmap.Canvas.Handle, PChar(ATexto), Length(ATexto), Area, DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX);
    if (Area.Bottom - Area.Top) > Result then
      Result := Area.Bottom - Area.Top;
  finally
    Bitmap.Free;
  end;
end;

procedure TVisualValidationLink.WMGetDlgCode(var AMessage: TWMGetDlgCode);
begin
  // Sem DLGC_WANTALLKEYS o diálogo entrega o Enter ao botão padrão e o link não recebe WM_KEYDOWN.
  AMessage.Result := DLGC_WANTALLKEYS;
end;

destructor TfrmValidationPanelFrame.Destroy;
begin
  // As linhas pertencem ao painel: liberá-las aqui não depende da ordem de destruição dos componentes.
  LimparLinhas;
  inherited;
end;

procedure TfrmValidationPanelFrame.Bind(const ANomeCampo: string; AControle: TWinControl; const ANomeExibicao: string);
var
  Indice: Integer;
  Vinculo: TVinculoCampoValidacao;
begin
  if AControle = nil then
    Exit;

  Vinculo.NomeCampo := ANomeCampo;
  Vinculo.Controle := AControle;
  Vinculo.NomeExibicao := ANomeExibicao;

  Indice := IndiceVinculo(ANomeCampo);
  if Indice >= 0 then
    FVinculos[Indice] := Vinculo
  else
  begin
    SetLength(FVinculos, Length(FVinculos) + 1);
    FVinculos[High(FVinculos)] := Vinculo;
  end;
end;

procedure TfrmValidationPanelFrame.Bind(AControle: TWinControl);
begin
  if AControle = nil then
    Exit;

  Bind(NomeCampoDoControle(AControle), AControle, '');
end;

procedure TfrmValidationPanelFrame.ExibirValidacao(const AValidacao: ValidationEntityOutput);
var
  Campos: TArray<string>;
  I: Integer;
  NomeCampo: string;
  Indice: Integer;
  Controle: TWinControl;
  NomeExibicao: string;
begin
  Limpar;

  if AValidacao.IsValid then
    Exit;

  // A ordem dos grupos é a da primeira ocorrência no resultado do validador.
  for I := 0 to High(AValidacao.Validations) do
  begin
    NomeCampo := Trim(AValidacao.Validations[I].FieldName);
    if JaAgrupado(Campos, NomeCampo) then
      Continue;

    SetLength(Campos, Length(Campos) + 1);
    Campos[High(Campos)] := NomeCampo;

    Indice := IndiceVinculo(NomeCampo);
    if Indice >= 0 then
    begin
      Controle := FVinculos[Indice].Controle;
      // O rótulo da tela tem prioridade; depois o metadata do validador e, por último, o nome do campo.
      NomeExibicao := FVinculos[Indice].NomeExibicao;
      if NomeExibicao = '' then
        NomeExibicao := AValidacao.Validations[I].Display;
      if NomeExibicao = '' then
        NomeExibicao := NomeCampo;
    end
    else
    begin
      Controle := nil;
      NomeExibicao := '';
    end;

    CriarLinha(NomeCampo, MensagensDoCampo(AValidacao, NomeCampo), Controle, NomeExibicao);
  end;

  Visible := True;
  // A largura real só existe depois que o painel fica visível; medir antes daria altura errada.
  ReorganizarLinhas;
  ApresentarSecaoDoPrimeiroCampo;
  RolarPainelEmVista;
end;

procedure TfrmValidationPanelFrame.Limpar;
begin
  LimparLinhas;
  Visible := False;
end;

function TfrmValidationPanelFrame.FocarPrimeiroErro: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to High(FLinhas) do
  begin
    if FLinhas[I].Link = nil then
      Continue;

    // Um campo vinculado pode não aceitar foco agora: a próxima linha ainda pode ser o destino útil.
    if AtivarCampo(FLinhas[I].Link.NomeCampo) then
      Exit(True);
  end;
end;

procedure TfrmValidationPanelFrame.LimparLinhas;
var
  Linhas: TArray<TLinhaValidacao>;
  I: Integer;
begin
  // A lista é esvaziada antes de liberar os controles: o redimensionamento que acompanha a liberação pode chegar ao
  // painel, que não deve tocar em linhas já destruídas.
  Linhas := FLinhas;
  SetLength(FLinhas, 0);

  for I := 0 to High(Linhas) do
  begin
    if Linhas[I].Link <> nil then
      Linhas[I].Link.Free;
    Linhas[I].Texto.Free;
  end;
end;

function TfrmValidationPanelFrame.IndiceVinculo(const ANomeCampo: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(FVinculos) do
    if SameText(FVinculos[I].NomeCampo, ANomeCampo) then
      Exit(I);
end;

function TfrmValidationPanelFrame.NomeCampoDoControle(AControle: TWinControl): string;
const
  Prefixos: array[0..5] of string = ('ed_', 'cb_', 'ck_', 'ed', 'cb', 'ck');
var
  I: Integer;
  Prefixo: string;
begin
  Result := AControle.Name;

  // Os prefixos com sublinhado vêm antes porque ed_ também começa com ed; sem prefixo conhecido, o nome do controle é a
  // chave.
  for I := Low(Prefixos) to High(Prefixos) do
  begin
    Prefixo := Prefixos[I];
    if (Length(Result) > Length(Prefixo)) and SameText(Copy(Result, 1, Length(Prefixo)), Prefixo) then
    begin
      Result := Copy(Result, Length(Prefixo) + 1, Length(Result));
      Exit;
    end;
  end;
end;

function TfrmValidationPanelFrame.JaAgrupado(const ACampos: TArray<string>; const ANomeCampo: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to High(ACampos) do
    if SameText(ACampos[I], ANomeCampo) then
      Exit(True);
end;

function TfrmValidationPanelFrame.MensagensDoCampo(const AValidacao: ValidationEntityOutput;
  const ANomeCampo: string): string;
var
  I: Integer;
  J: Integer;
  Mensagem: string;
  Mensagens: TArray<string>;
begin
  SetLength(Mensagens, 0);
  for I := 0 to High(AValidacao.Validations) do
  begin
    if not SameText(Trim(AValidacao.Validations[I].FieldName), ANomeCampo) then
      Continue;

    Mensagem := Trim(AValidacao.Validations[I].GetMessage());
    if Mensagem = '' then
      Continue;

    // Itens distintos podem repetir o texto: cada mensagem aparece uma única vez.
    for J := 0 to High(Mensagens) do
      if SameText(Mensagens[J], Mensagem) then
      begin
        Mensagem := '';
        Break;
      end;
    if Mensagem = '' then
      Continue;

    SetLength(Mensagens, Length(Mensagens) + 1);
    Mensagens[High(Mensagens)] := Mensagem;
  end;

  Result := '';
  for J := 0 to High(Mensagens) do
  begin
    if Result <> '' then
      Result := Result + sLineBreak;
    Result := Result + Mensagens[J];
  end;
end;

procedure TfrmValidationPanelFrame.CriarLinha(const ANomeCampo, ATexto: string;
  AControle: TWinControl; const ANomeExibicao: string);
var
  Linha: TLinhaValidacao;
  Mensagem: string;
begin
  Linha.Link := nil;

  if AControle <> nil then
  begin
    Linha.Link := TVisualValidationLink.Create(Self);
    Linha.Link.Parent := sbMensagens;
    Linha.Link.NomeCampo := ANomeCampo;
    Linha.Link.TabStop := True;
    Linha.Link.OnLinkClick := LinkClick;
    Linha.Link.OnKeyDown := LinkKeyDown;
    // O href preserva o nome do validador; o texto é o rótulo conhecido pela tela.
    Linha.Link.Caption := Format('<a href="%s">%s</a>', [ANomeCampo, ANomeExibicao]);
  end;

  Mensagem := ATexto;
  if (Linha.Link = nil) and (ANomeCampo <> '') then
    // Sem vínculo não há destino de foco: a linha identifica o campo pelo texto.
    Mensagem := ANomeCampo + ': ' + Mensagem;

  Linha.Texto := TLabel.Create(Self);
  Linha.Texto.Parent := sbMensagens;
  Linha.Texto.AutoSize := False;
  Linha.Texto.WordWrap := True;
  Linha.Texto.Font.Color := clRed;
  Linha.Texto.Transparent := True;
  Linha.Texto.Width := LarguraDisponivel;
  Linha.Texto.Caption := Mensagem;

  SetLength(FLinhas, Length(FLinhas) + 1);
  FLinhas[High(FLinhas)] := Linha;
end;

function TfrmValidationPanelFrame.LarguraDisponivel: Integer;
begin
  Result := sbMensagens.ClientWidth - (2 * MargemLinha);
  if Result < LarguraMinimaTexto then
    Result := LarguraMinimaTexto;
end;

procedure TfrmValidationPanelFrame.ReorganizarLinhas;
var
  I: Integer;
  Y: Integer;
begin
  // O ajuste altera a altura das mensagens e as barras do painel: o evento de redimensionamento não deve reentrar.
  if FAjustando then
    Exit;

  FAjustando := True;
  try
    Y := MargemLinha;
    for I := 0 to High(FLinhas) do
    begin
      if FLinhas[I].Link <> nil then
      begin
        FLinhas[I].Link.Left := MargemLinha;
        FLinhas[I].Link.Top := Y;
        if FLinhas[I].Link.Width > LarguraDisponivel then
          FLinhas[I].Link.Width := LarguraDisponivel;
        Y := Y + FLinhas[I].Link.Height + IntervaloLinkTexto;
      end;

      FLinhas[I].Texto.Left := MargemLinha;
      FLinhas[I].Texto.Top := Y;
      FLinhas[I].Texto.Width := LarguraDisponivel;
      FLinhas[I].Texto.Height := AlturaDoTextoQuebrado(FLinhas[I].Texto.Caption, FLinhas[I].Texto.Font,
        FLinhas[I].Texto.Width);
      Y := Y + FLinhas[I].Texto.Height + IntervaloEntreLinhas;
    end;
  finally
    FAjustando := False;
  end;
end;

procedure TfrmValidationPanelFrame.sbMensagensResize(Sender: TObject);
begin
  ReorganizarLinhas;
end;

procedure TfrmValidationPanelFrame.PrepararControle(AControle: TControl);
var
  Ancestral: TControl;
begin
  Ancestral := AControle.Parent;
  while Ancestral <> nil do
  begin
    // A cadeia ShowControl do VCL apresenta a página ancestral; as restrições de visibilidade e habilitação do controle
    // continuam com a tela.
    if Ancestral is TTabSheet then
      Ancestral.Show;
    Ancestral := Ancestral.Parent;
  end;
end;

procedure TfrmValidationPanelFrame.RolarControleEmVista(AControle: TControl);
var
  Ancestral: TControl;
begin
  Ancestral := AControle.Parent;
  while Ancestral <> nil do
  begin
    if Ancestral is TScrollingWinControl then
      TScrollingWinControl(Ancestral).ScrollInView(AControle);
    Ancestral := Ancestral.Parent;
  end;
end;

procedure TfrmValidationPanelFrame.ApresentarSecaoDoPrimeiroCampo;
var
  I: Integer;
  Indice: Integer;
begin
  for I := 0 to High(FLinhas) do
  begin
    if FLinhas[I].Link = nil then
      Continue;

    Indice := IndiceVinculo(FLinhas[I].Link.NomeCampo);
    if Indice >= 0 then
    begin
      PrepararControle(FVinculos[Indice].Controle);
      Exit;
    end;
  end;
end;

procedure TfrmValidationPanelFrame.RolarPainelEmVista;
begin
  RolarControleEmVista(Self);
end;

function TfrmValidationPanelFrame.AtivarCampo(const ANomeCampo: string): Boolean;
var
  Indice: Integer;
  Controle: TWinControl;
begin
  Result := False;

  Indice := IndiceVinculo(ANomeCampo);
  if Indice < 0 then
    Exit;

  Controle := FVinculos[Indice].Controle;
  if Controle = nil then
    Exit;

  PrepararControle(Controle);
  RolarControleEmVista(Controle);

  if Controle.CanFocus then
  begin
    Controle.SetFocus;
    Result := True;
  end;
end;

procedure TfrmValidationPanelFrame.LinkClick(Sender: TObject; const ALink: string; ALinkType: TSysLinkType);
begin
  if Sender is TVisualValidationLink then
    AtivarCampo(TVisualValidationLink(Sender).NomeCampo)
  else
    AtivarCampo(ALink);
end;

procedure TfrmValidationPanelFrame.LinkKeyDown(Sender: TObject; var AKey: Word; AShift: TShiftState);
begin
  if AKey <> VK_RETURN then
    Exit;

  // O Enter pertence ao link focado, não ao comando padrão do rodapé.
  AKey := 0;
  if Sender is TVisualValidationLink then
    AtivarCampo(TVisualValidationLink(Sender).NomeCampo);
end;

end.
