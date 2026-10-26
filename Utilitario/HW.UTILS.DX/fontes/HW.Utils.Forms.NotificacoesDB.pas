unit HW.Utils.Forms.NotificacoesDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX,
  HW.Utils.Classes.NotificacoesERP_DX;

type
  TfrmUtilsNotificacoesDB = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    pnTotalNotificacao: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    WebBrowser1: TWebBrowser;
    btExit: TSpeedButton;
    pnIndex: TPanel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btExitClick(Sender: TObject);
  private
    FcentralNotificacaoDB: TCentralNotificacoesDB_ERP;
    Fnotificacoes: TArray<TNotificacoesNaoLidas>;
    //FusarNotificacoesEmCache: Boolean;
    procedure atualizaWebBrowserNotificacao(Anotificacao: TNotificacoesNaoLidas);
    { Private declarations }
  public
    { Public declarations }
    procedure verificarExistenciaDeNotificacoesNaoLidas;
    property centralNotificacaoDB: TCentralNotificacoesDB_ERP read FcentralNotificacaoDB write FcentralNotificacaoDB;
//    property usarNotificacoesEmCache: Boolean read FusarNotificacoesEmCache write FusarNotificacoesEmCache;
    property notificacoes: TArray<TNotificacoesNaoLidas> read Fnotificacoes write Fnotificacoes;
  end;

var
  frmUtilsNotificacoesDB: TfrmUtilsNotificacoesDB;

implementation

uses
  System.StrUtils, HW.Utils.Classes.Rtti, HW.Utils.Classes.Funcoes_DX,
  HW.Utils.Classes.Registros_DX;

{$R *.dfm}

{ TfrmUtilsNotificacoes }

procedure TfrmUtilsNotificacoesDB.atualizaWebBrowserNotificacao(Anotificacao: TNotificacoesNaoLidas);
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
    if Anotificacao.data_visualizacao.Trim.IsEmpty then
      centralNotificacaoDB.db_NotificacaoMarcarComoLida(Fnotificacoes, Fnotificacoes[WebBrowser1.Tag])
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

procedure TfrmUtilsNotificacoesDB.FormShow(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try

    try
      if not Assigned(centralNotificacaoDB) then
        raise Exception.Create('Objeto centralSuporte não definido');

    except on E: Exception do
      begin
        THwUtilsClass.RegistraErro(e.Message);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      end;
    end;

    verificarExistenciaDeNotificacoesNaoLidas;

    Self.AutoSize := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsNotificacoesDB.btExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUtilsNotificacoesDB.SpeedButton2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if (WebBrowser1.Tag - 1) >= Low(Fnotificacoes) then
    begin
      WebBrowser1.Tag := WebBrowser1.Tag - 1;
      pnIndex.Caption := Format('%d de %d', [WebBrowser1.Tag + 1, High(Fnotificacoes) + 1]);
      atualizaWebBrowserNotificacao(Fnotificacoes[WebBrowser1.Tag]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsNotificacoesDB.SpeedButton3Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if (WebBrowser1.Tag + 1) <= High(Fnotificacoes) then
    begin
      WebBrowser1.Tag := WebBrowser1.Tag + 1;
      pnIndex.Caption := Format('%d de %d', [WebBrowser1.Tag + 1, High(Fnotificacoes) + 1]);
      atualizaWebBrowserNotificacao(Fnotificacoes[WebBrowser1.Tag]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsNotificacoesDB.verificarExistenciaDeNotificacoesNaoLidas;
begin
  pnIndex.Caption := '';
  if Assigned(Fnotificacoes) then
  begin

    if High(Fnotificacoes) = 0 then
      pnTotalNotificacao.Caption := '1 Notificação não lida'
    else
      pnTotalNotificacao.Caption := (High(Fnotificacoes) + 1).ToString + ' Notificações não lidas';

    WebBrowser1.Tag := Low(Fnotificacoes);
    if WebBrowser1.Tag > -1 then
    begin
      pnIndex.Caption := Format('%d de %d', [WebBrowser1.Tag + 1, High(Fnotificacoes) + 1]);
      if High(Fnotificacoes) >= WebBrowser1.Tag then
        atualizaWebBrowserNotificacao(Fnotificacoes[WebBrowser1.Tag]);
    end;
  end
  else
  begin
    atualizaWebBrowserNotificacao(nil);
    pnTotalNotificacao.Caption := 'Sem notificações';
  end;
end;

end.
