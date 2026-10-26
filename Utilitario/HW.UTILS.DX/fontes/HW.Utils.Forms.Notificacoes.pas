unit HW.Utils.Forms.Notificacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  HW.Utils.Classes.CentralAcoes, HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX;

type
  TfrmUtilsNotificacoes = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    pnTotalNotificacao: TPanel;
    btMarcarComoLida: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    WebBrowser1: TWebBrowser;
    btExit: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btMarcarComoLidaClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FcentralSuporte: THW_CentralSuporte;
    Fnotificacoes: TArray<TNotificacoesNaoLidas>;
    FusarNotificacoesEmCache: Boolean;
    procedure atualizaWebBrowserNotificacao(Anotificacao: TNotificacoesNaoLidas);
    { Private declarations }
  public
    { Public declarations }
    procedure verificarExistenciaDeNotificacoesNaoLidas;
    property centralSuporte: THW_CentralSuporte read FcentralSuporte write FcentralSuporte;
    property usarNotificacoesEmCache: Boolean read FusarNotificacoesEmCache write FusarNotificacoesEmCache;
    property notificacoes: TArray<TNotificacoesNaoLidas> read Fnotificacoes write Fnotificacoes;
  end;

var
  frmUtilsNotificacoes: TfrmUtilsNotificacoes;

implementation

uses
  System.StrUtils, HW.Utils.Classes.Rtti, HW.Utils.Classes.Funcoes_DX,
  HW.Utils.Classes.Registros_DX;

{$R *.dfm}

{ TfrmUtilsNotificacoes }

procedure TfrmUtilsNotificacoes.atualizaWebBrowserNotificacao(Anotificacao: TNotificacoesNaoLidas);
var
  ADoccument: Variant;
  Ahtml, Atitulo, Abody: string;

  function Add(Atag, Astyle, AValue: string): string;
  begin
    Result := IfThen(not Atag.IsEmpty, '<' + Atag + ' ' + Astyle + '>' ) +
              AValue +
              IfThen(not Atag.IsEmpty, '</' + Atag + '>' );
  end;

begin
  Ahtml := '';
  if Assigned(Anotificacao) then
  begin
    Atitulo := Anotificacao.header_html;
    Abody   := Add('strong', '', 'Data ') +
               THwConvertDateTimeFormatUtils.ConvertDateTime(Anotificacao.data_cadastro, 'mongo', 'DD/MM/YYYY hh:nn') + '<br><br>' +
               Anotificacao.body_html;
  end
  else
  begin
    Atitulo := 'Não existem notificações';
    Abody   := '...';
  end;

  Ahtml :=
    Add('', '', '<!DOCTYPE html>' +
      Add('html', '', '' +
        Add('head', '', '' +
          Add('title', '', 'Notificação')
        ) +
        Add('body', '', '' +
          Add( 'div', 'style="font-family: Tahoma"', '' +
            Add('h3', '', Atitulo) +
            Abody

          )
        )
      )
    );

  if not Assigned(WebBrowser1.Document) then
    WebBrowser1.Navigate('about:blank');

  ADoccument := WebBrowser1.Document;
  ADoccument.Clear;
  ADoccument.Write(Ahtml);
  ADoccument.Close;

end;

procedure TfrmUtilsNotificacoes.FormCreate(Sender: TObject);
begin
  FusarNotificacoesEmCache := False;
end;

procedure TfrmUtilsNotificacoes.FormShow(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try

    try
      if not Assigned(centralSuporte) then
        raise Exception.Create('Objeto centralSuporte não definido');

      if FusarNotificacoesEmCache then
        Fnotificacoes := THwClassRegistros.FromJsonToArray<TNotificacoesNaoLidas>(centralSuporte.resposta.notificacoesJson)
      else if not centralSuporte.NotificacaoGetNaoLidas(Fnotificacoes) then
        raise Exception.Create('Erro ao obter notificações ' + centralSuporte.LastError);

    except on E: Exception do
      begin
        if not FusarNotificacoesEmCache then // nao precisa apresentar mensagem, pois é abertura do sistema ERP HW
          THwUtilsClass.ShowErro(E.Message);
        THwUtilsClass.RegistraErro(e.Message);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      end;
    end;
    if FusarNotificacoesEmCache then
      if Assigned(Fnotificacoes) then
      begin
        if Length(Fnotificacoes) = 0 then
          PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      end
      else
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);

    verificarExistenciaDeNotificacoesNaoLidas;

    Self.AutoSize := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsNotificacoes.btExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUtilsNotificacoes.btMarcarComoLidaClick(Sender: TObject);
var
  AIndex    : Integer;
  AarrayTemp: TArray<TNotificacoesNaoLidas>;
begin
  Screen.Cursor := crHourGlass;

  try

    if Length(Fnotificacoes) = 0 then
      Exit;

    try

      if (WebBrowser1.Tag) >= 0 then
        if Assigned(Fnotificacoes[WebBrowser1.Tag]) then
        begin
          AIndex := WebBrowser1.Tag;
          if centralSuporte.NotificacaoMarcarComoLida(Fnotificacoes, Fnotificacoes[WebBrowser1.Tag]) then
          begin
            if Length(Fnotificacoes) = 0 then
            begin
              verificarExistenciaDeNotificacoesNaoLidas;
              Exit;
            end;

            if High(Fnotificacoes) = 0 then
              pnTotalNotificacao.Caption := '1 Notificação não lida'
            else
              pnTotalNotificacao.Caption := (High(Fnotificacoes) + 1).ToString + ' Notificações não lidas';

            if AIndex > High(Fnotificacoes) then
              AIndex := High(Fnotificacoes);

            WebBrowser1.Tag := AIndex;
            atualizaWebBrowserNotificacao(Fnotificacoes[WebBrowser1.Tag]);
          end;
        end;
    except on E: Exception do
      begin
        THwUtilsClass.ShowErro(e.Message);
        THwUtilsClass.RegistraErro(e.Message);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsNotificacoes.SpeedButton2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if (WebBrowser1.Tag - 1) >= Low(Fnotificacoes) then
    begin
      WebBrowser1.Tag := WebBrowser1.Tag - 1;
      atualizaWebBrowserNotificacao(Fnotificacoes[WebBrowser1.Tag]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsNotificacoes.SpeedButton3Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if (WebBrowser1.Tag + 1) <= High(Fnotificacoes) then
    begin
      WebBrowser1.Tag := WebBrowser1.Tag + 1;
      atualizaWebBrowserNotificacao(Fnotificacoes[WebBrowser1.Tag]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsNotificacoes.verificarExistenciaDeNotificacoesNaoLidas;
begin
  if Assigned(Fnotificacoes) then
  begin

    if High(Fnotificacoes) = 0 then
      pnTotalNotificacao.Caption := '1 Notificação não lida'
    else
      pnTotalNotificacao.Caption := (High(Fnotificacoes) + 1).ToString + ' Notificações não lidas';

    WebBrowser1.Tag := Low(Fnotificacoes);
    if WebBrowser1.Tag > -1 then
      if High(Fnotificacoes) >= WebBrowser1.Tag then
        atualizaWebBrowserNotificacao(Fnotificacoes[WebBrowser1.Tag]);
  end
  else
  begin
    atualizaWebBrowserNotificacao(nil);
    pnTotalNotificacao.Caption := 'Sem notificações';
  end;
end;

end.
