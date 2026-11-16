unit ValidationPanelFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, ValidationEntityOutputUnit;

type
  // Link de campo do painel. O SysLink nao declara o Enter nem o entrega ao
  // frame; o descendente pede a tecla e dispara a mesma ativacao do clique.
  TVisualValidationLink = class(TLinkLabel)
  private
    FNomeCampo: string;
    procedure WMGetDlgCode(var AMessage: TWMGetDlgCode); message WM_GETDLGCODE;
  public
    property NomeCampo: string read FNomeCampo write FNomeCampo;
  end;

  // Vinculo entre o nome de campo produzido pelo validador e o editor que o
  // representa. O nome exibido identifica o campo para o usuario.
  TVinculoCampoValidacao = record
    NomeCampo: string;
    Controle: TWinControl;
    NomeExibicao: string;
  end;

  // Linha apresentada: o link do campo, quando existe vinculo, seguido do texto
  // das mensagens. Os controles pertencem ao painel e sao reposicionados quando
  // a largura disponivel muda.
  TLinhaValidacao = record
    Link: TVisualValidationLink;
    Texto: TLabel;
  end;

  // Painel reutilizavel de erros de validacao. Recebe o resultado produzido pelo
  // caso de uso e agrupa as mensagens por campo. A navegacao depende apenas dos
  // vinculos registrados pela tela, portanto o painel nao conhece a
  // funcionalidade que o utiliza.
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
    // Deriva o nome do campo do validador a partir do nome do editor.
    function NomeCampoDoControle(AControle: TWinControl): string;
    function JaAgrupado(const ACampos: TArray<string>;
      const ANomeCampo: string): Boolean;
    function MensagensDoCampo(const AValidacao: ValidationEntityOutput;
      const ANomeCampo: string): string;
    procedure CriarLinha(const ANomeCampo, ATexto: string;
      AControle: TWinControl; const ANomeExibicao: string);
    function LarguraDisponivel: Integer;
    procedure ReorganizarLinhas;
    function RolagemAncestral(AControle: TControl): TScrollBox;
    procedure RolarControleEmVista(AControle: TControl);
    procedure RolarPainelEmVista;
    function AtivarCampo(const ANomeCampo: string): Boolean;
    procedure LinkClick(Sender: TObject; const ALink: string;
      ALinkType: TSysLinkType);
    procedure LinkKeyDown(Sender: TObject; var AKey: Word;
      AShift: TShiftState);
  public
    destructor Destroy; override;
    // Registra o editor responsavel por um campo do validador. O vinculo
    // repetido substitui o anterior, porque um campo possui um unico editor.
    procedure Bind(const ANomeCampo: string; AControle: TWinControl;
      const ANomeExibicao: string); overload;
    // Registra o editor pelo sufixo do proprio nome e deixa o rotulo para o
    // texto do metadata devolvido na validacao.
    procedure Bind(AControle: TWinControl); overload;
    // Substitui as linhas anteriores pelas mensagens do resultado recebido.
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    procedure Limpar;
    // Navega ate o primeiro campo vinculado com erro; campos sem vinculo nao
    // recebem foco.
    function FocarPrimeiroErro: Boolean;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Graphics;

const
  // Medidas internas do painel: margem das linhas, intervalo entre o link e o
  // texto e entre linhas.
  MargemLinha = 10;
  IntervaloLinkTexto = 2;
  IntervaloEntreLinhas = 8;
  LarguraMinimaTexto = 120;

// Mede a altura do bloco de texto quebrado na largura informada. O rotulo usa
// largura fixa e nao se auto-dimensiona, portanto a altura precisa ser calculada
// com a mesma fonte antes de posicionar a linha seguinte.
function AlturaDoTextoQuebrado(const ATexto: string; AFonte: TFont;
  ALargura: Integer): Integer;
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
    DrawText(Bitmap.Canvas.Handle, PChar(ATexto), Length(ATexto), Area,
      DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX);
    if (Area.Bottom - Area.Top) > Result then
      Result := Area.Bottom - Area.Top;
  finally
    Bitmap.Free;
  end;
end;

procedure TVisualValidationLink.WMGetDlgCode(var AMessage: TWMGetDlgCode);
begin
  // Sem DLGC_WANTALLKEYS o dialogo entrega o Enter ao botao padrao do rodape e
  // o link nunca recebe WM_KEYDOWN.
  AMessage.Result := DLGC_WANTALLKEYS;
end;

{ TfrmValidationPanelFrame }

destructor TfrmValidationPanelFrame.Destroy;
begin
  // As linhas pertencem ao painel: libera-las aqui nao depende da ordem de
  // destruicao dos componentes do frame.
  LimparLinhas;
  inherited;
end;

procedure TfrmValidationPanelFrame.Bind(const ANomeCampo: string;
  AControle: TWinControl; const ANomeExibicao: string);
var
  Indice: Integer;
  Vinculo: TVinculoCampoValidacao;
begin
  // Sem editor nao existe destino para o link: o campo permanece sem vinculo.
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
  // Sem controle nao ha campo para vincular.
  if AControle = nil then
    Exit;

  // O rotulo fica vazio: a exibicao usa o texto do metadata, quando existir.
  Bind(NomeCampoDoControle(AControle), AControle, '');
end;

procedure TfrmValidationPanelFrame.ExibirValidacao(
  const AValidacao: ValidationEntityOutput);
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

  // A ordem dos grupos e a da primeira ocorrencia no resultado do validador.
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
      // O rotulo informado pela tela tem prioridade; sem ele, o metadata do
      // validador nomeia o campo, e o proprio nome e a ultima alternativa.
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

    CriarLinha(NomeCampo, MensagensDoCampo(AValidacao, NomeCampo), Controle,
      NomeExibicao);
  end;

  Visible := True;
  // A primeira exibicao acontece com o painel recem-visivel: a largura real e a
  // altura das mensagens quebradas so podem ser calculadas depois disso.
  ReorganizarLinhas;
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

    // Um campo vinculado pode nao aceitar foco agora: a proxima linha
    // vinculada ainda pode ser o destino util.
    if AtivarCampo(FLinhas[I].Link.NomeCampo) then
      Exit(True);
  end;
end;

procedure TfrmValidationPanelFrame.LimparLinhas;
var
  Linhas: TArray<TLinhaValidacao>;
  I: Integer;
begin
  // A lista e esvaziada antes de liberar os controles: o redimensionamento das
  // barras que acompanha a liberacao pode chegar ao painel, que nao deve tocar
  // em linhas ja destruidas.
  Linhas := FLinhas;
  SetLength(FLinhas, 0);

  for I := 0 to High(Linhas) do
  begin
    if Linhas[I].Link <> nil then
      Linhas[I].Link.Free;
    Linhas[I].Texto.Free;
  end;
end;

function TfrmValidationPanelFrame.IndiceVinculo(
  const ANomeCampo: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(FVinculos) do
    if SameText(FVinculos[I].NomeCampo, ANomeCampo) then
      Exit(I);
end;

function TfrmValidationPanelFrame.NomeCampoDoControle(
  AControle: TWinControl): string;
const
  Prefixos: array[0..5] of string = ('ed_', 'cb_', 'ck_', 'ed', 'cb', 'ck');
var
  I: Integer;
  Prefixo: string;
begin
  Result := AControle.Name;

  // Os prefixos com sublinhado vem antes dos curtos porque ed_ tambem comeca
  // com ed; sem prefixo conhecido o proprio nome do controle e a chave.
  for I := Low(Prefixos) to High(Prefixos) do
  begin
    Prefixo := Prefixos[I];
    if (Length(Result) > Length(Prefixo)) and
      SameText(Copy(Result, 1, Length(Prefixo)), Prefixo) then
    begin
      Result := Copy(Result, Length(Prefixo) + 1, Length(Result));
      Exit;
    end;
  end;
end;

function TfrmValidationPanelFrame.JaAgrupado(const ACampos: TArray<string>;
  const ANomeCampo: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to High(ACampos) do
    if SameText(ACampos[I], ANomeCampo) then
      Exit(True);
end;

function TfrmValidationPanelFrame.MensagensDoCampo(
  const AValidacao: ValidationEntityOutput;
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

    // Itens distintos podem produzir o mesmo texto: a linha apresenta cada
    // mensagem uma unica vez.
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
    // O href preserva o nome do validador; o texto e o rotulo conhecido pela
    // tela, usado para localizar o editor do campo.
    Linha.Link.Caption := Format('<a href="%s">%s</a>',
      [ANomeCampo, ANomeExibicao]);
  end;

  Mensagem := ATexto;
  if (Linha.Link = nil) and (ANomeCampo <> '') then
    // Sem vinculo nao existe destino de foco: a linha identifica o campo apenas
    // pelo texto, quando o validador informou o nome.
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
  // O ajuste altera a altura das mensagens e, com ela, as barras do painel: o
  // evento de redimensionamento que chega durante o ajuste nao deve reentrar.
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
      FLinhas[I].Texto.Height := AlturaDoTextoQuebrado(
        FLinhas[I].Texto.Caption, FLinhas[I].Texto.Font,
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

function TfrmValidationPanelFrame.RolagemAncestral(
  AControle: TControl): TScrollBox;
var
  Atual: TControl;
begin
  Result := nil;
  if AControle = nil then
    Exit;

  Atual := AControle.Parent;
  while Atual <> nil do
  begin
    if Atual is TScrollBox then
      Exit(TScrollBox(Atual));
    Atual := Atual.Parent;
  end;
end;

procedure TfrmValidationPanelFrame.RolarControleEmVista(AControle: TControl);
var
  Rolagem: TScrollBox;
  Origem: TPoint;
  Topo: Integer;
  Base: Integer;
begin
  Rolagem := RolagemAncestral(AControle);
  if Rolagem = nil then
    Exit;

  // ClientToParent devolve a posicao no conteudo da area de rolagem, inclusive
  // para controles aninhados no frame do editor.
  Origem.X := 0;
  Origem.Y := 0;
  Origem := AControle.ClientToParent(Origem, Rolagem);

  Topo := Origem.Y;
  Base := Topo + AControle.Height;

  if Topo < Rolagem.VertScrollBar.Position then
    Rolagem.VertScrollBar.Position := Topo
  else if Base > Rolagem.VertScrollBar.Position + Rolagem.ClientHeight then
    Rolagem.VertScrollBar.Position := Base - Rolagem.ClientHeight;
end;

procedure TfrmValidationPanelFrame.RolarPainelEmVista;
begin
  RolarControleEmVista(Self);
end;

function TfrmValidationPanelFrame.AtivarCampo(
  const ANomeCampo: string): Boolean;
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

  RolarControleEmVista(Controle);

  if Controle.CanFocus then
  begin
    Controle.SetFocus;
    Result := True;
  end;
end;

procedure TfrmValidationPanelFrame.LinkClick(Sender: TObject;
  const ALink: string; ALinkType: TSysLinkType);
begin
  if Sender is TVisualValidationLink then
    AtivarCampo(TVisualValidationLink(Sender).NomeCampo)
  else
    AtivarCampo(ALink);
end;

procedure TfrmValidationPanelFrame.LinkKeyDown(Sender: TObject; var AKey: Word;
  AShift: TShiftState);
begin
  if AKey <> VK_RETURN then
    Exit;

  // O Enter pertence ao link focado, nao ao comando padrao do rodape.
  AKey := 0;
  if Sender is TVisualValidationLink then
    AtivarCampo(TVisualValidationLink(Sender).NomeCampo);
end;

end.
