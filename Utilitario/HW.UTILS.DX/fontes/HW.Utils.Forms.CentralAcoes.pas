unit HW.Utils.Forms.CentralAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  HW.Utils.Classes.CentralAcoes, Vcl.Imaging.jpeg, Vcl.Buttons,
  HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX;

type
  TfrmUtilsCentralAcoes= class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    memoDadosSessao: TMemo;
    Panel6: TPanel;
    Image1: TImage;
    pnNotificacoes: TPanel;
    pnChat: TPanel;
    btNotificacoes: TSpeedButton;
    pnChamado: TPanel;
    pnTicket: TPanel;
    btChat: TSpeedButton;
    btChamado: TSpeedButton;
    btTickets: TSpeedButton;
    timerNotificacoes: TTimer;
    pnCentraldoCliente: TPanel;
    btCentraldoCliente: TSpeedButton;
    pnSessaoError: TPanel;
    lbError: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnSessaoLogin: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btNotificacoesClick(Sender: TObject);
    procedure btChatClick(Sender: TObject);
    procedure btChamadoClick(Sender: TObject);
    procedure btTicketsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure timerNotificacoesTimer(Sender: TObject);
    procedure btCentraldoClienteClick(Sender: TObject);
  private
    FcentralSuporte: THW_CentralSuporte;
    Fnotificacoes: TArray<TNotificacoesNaoLidas>;
    function getVersaoCaption(AVersaoDisponivel: string): string;
    { Private declarations }
  public
    { Public declarations }

    property centralSuporte: THW_CentralSuporte read FcentralSuporte write FcentralSuporte;

  end;

var
  frmUtilsCentralAcoes: TfrmUtilsCentralAcoes;

implementation

uses
  HW.Utils.Forms.Chamados,
  HW.Utils.Classes.Rest_DX,
  HW.Utils.Classes.Registros.Cliente_DX,
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Rtti,
  HW.Utils.Forms.Tickets,
  HW.Utils.Forms.Notificacoes,
  HW.Utils.Classes.Funcoes_DX,
  Winapi.ShellAPI, System.StrUtils;

{$R *.dfm}

{ TfrmUtilsCentralAcoes }

procedure TfrmUtilsCentralAcoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    if THwUtilsClass.ShowConfirmacao('Deseja sair da Central de Atendimento') = IDYES then
      Close;
end;

procedure TfrmUtilsCentralAcoes.FormShow(Sender: TObject);
var
  accesToken: TResp_AcessTokent;
  cliente: TCliente;

begin
  Self.Icon.Handle := ExtractIcon(Handle,PChar(Application.ExeName),0);

  memoDadosSessao.Visible := False;
  pnSessaoError.Visible := False;
  pnSessaoLogin.Visible := False;

  if not centralSuporte.LoginExecutar then
  begin
    pnSessaoError.BevelOuter := bvNone;
    pnSessaoError.Align := alClient;
    pnSessaoError.Visible := True;

    lbError.Caption := centralSuporte.LastError;
    Label3.Caption := centralSuporte.EmailUsuario;
    Label5.Caption := centralSuporte.CnpjUsuario;




    memoDadosSessao.Lines.Clear;
    memoDadosSessao.Lines.Add(centralSuporte.LastError);
    memoDadosSessao.Lines.Add('Usuario: ' + centralSuporte.EmailUsuario);
    memoDadosSessao.Lines.Add('CNPJ: ' + centralSuporte.CnpjUsuario);

    btNotificacoes.Enabled := False;
    btChat.Enabled := False;
    btChamado.Enabled := False;
    btTickets.Enabled := False;
    btCentraldoCliente.Enabled := False;
    Exit;
  end;

  accesToken := THwClassRegistros.FromJsonString<TResp_AcessTokent>(centralSuporte.resposta.accesstoken);
  cliente    := THwClassRegistros.FromJsonString<TCliente>(centralSuporte.resposta.clienteHw);

  pnSessaoLogin.BevelOuter := bvNone;
  pnSessaoLogin.Align := alClient;
  pnSessaoLogin.Visible := True;

  Label6.Caption  := IfThen(Assigned(accesToken), accesToken.email, 'Falha de login');
  Label8.Caption  := IfThen(Assigned(accesToken), THwConvertDateTimeFormatUtils.ConvertDateTime(accesToken.data_ult_login, 'mongo', 'DD/MM/YYYY hh:mm'), 'Sessão null');
  Label10.Caption := IfThen(Assigned(cliente), cliente.cnpj + ' - ' +cliente.razao);

  with memoDadosSessao.Lines do
  begin
    Clear;
    if Assigned(accesToken) then
      Add('Usuario: ' + accesToken.email + '           ' +
          ' Ultimo acesso: ' + THwConvertDateTimeFormatUtils.ConvertDateTime(accesToken.data_ult_login, 'mongo', 'DD/MM/YYYY hh:mm'))
    else
      Add('Falha de login. Sessão null');

    if Assigned(cliente) then
    begin
      Add('Empresa: ' + cliente.razao + '  CNPJ: ' + cliente.cnpj);
      Add('Release diponível : ' + getVersaoCaption(cliente.release_disponivel));
    end;
  end;

  timerNotificacoes.Interval := 1000 * 60 * 5; //5 min
  timerNotificacoesTimer(timerNotificacoes);//aqui vai ativar o timer
//  timerNotificacoes.Enabled := True;

  Self.AutoSize := True;
end;

function TfrmUtilsCentralAcoes.getVersaoCaption(
  AVersaoDisponivel: string): string;
var
  AVersao, AVersao2: string;
begin
  AVersao := StringReplace(AVersaoDisponivel, '_', '',[rfReplaceAll]);
  while Copy(AVersao, 1, 1) = '0' do
    Delete(AVersao,1,1);
  AVersao2 := '';
  while Length(Trim(AVersao)) > 0   do
  begin
    AVersao2 := AVersao2 + Copy(AVersao, 1, 1) + '.';
    AVersao := Copy(AVersao, 2, Length(Trim(AVersao)));
  end;
  Exit(Copy(AVersao2,1, Length(Trim(AVersao2)) - 1 ));
end;

procedure TfrmUtilsCentralAcoes.btCentraldoClienteClick(Sender: TObject);
begin
  if not btCentraldoCliente.Enabled then
    Exit;
  Screen.Cursor := crHourGlass;
  try
    centralSuporte.HelpDeskAbrir;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsCentralAcoes.btNotificacoesClick(Sender: TObject);
var
  Anotificacao: TNotificacoesNaoLidas;
begin
  if not btNotificacoes.Enabled then
    Exit;

  Application.CreateForm(TfrmUtilsNotificacoes, frmUtilsNotificacoes);
  frmUtilsNotificacoes.centralSuporte := THW_CentralSuporte(centralSuporte);
  frmUtilsNotificacoes.ShowModal;

  if Assigned(frmUtilsNotificacoes.notificacoes) then
  begin
    SetLength(Fnotificacoes, 0);
    for Anotificacao in frmUtilsNotificacoes.notificacoes do
    begin
      SetLength(Fnotificacoes, Length(Fnotificacoes) + 1);
      Fnotificacoes[High(Fnotificacoes)] := Anotificacao;
    end;
    if Length(Fnotificacoes) > 1  then
      pnNotificacoes.Caption := Length(Fnotificacoes).ToString + ' Notificações não lidas'
    else if Length(Fnotificacoes) = 1  then
      pnNotificacoes.Caption := Length(Fnotificacoes).ToString + ' Notificação não lida'
    else
      pnNotificacoes.Caption := 'Notificações';
  end
  else
    pnNotificacoes.Caption := 'Notificações';

  FreeAndNil(frmUtilsNotificacoes);
end;

procedure TfrmUtilsCentralAcoes.btChatClick(Sender: TObject);
begin
  if not btChat.Enabled then
    Exit;
  Screen.Cursor := crHourGlass;
  try
    centralSuporte.ChatIniciar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsCentralAcoes.btChamadoClick(Sender: TObject);
begin
  if not btChamado.Enabled then
    Exit;
  Application.CreateForm(TfrmUtilsChamado, frmUtilsChamado);
  frmUtilsChamado.centralSuporte := THW_CentralSuporte(centralSuporte);
  frmUtilsChamado.ShowModal;
  FreeAndNil(frmUtilsChamado);
end;

procedure TfrmUtilsCentralAcoes.btTicketsClick(Sender: TObject);
begin
  if not btTickets.Enabled then
    Exit;
  Application.CreateForm(TfrmUtilsTickets, frmUtilsTickets);
  frmUtilsTickets.centralSuporte := THW_CentralSuporte(centralSuporte);
  frmUtilsTickets.ShowModal;
  FreeAndNil(frmUtilsTickets);
end;

procedure TfrmUtilsCentralAcoes.timerNotificacoesTimer(Sender: TObject);
begin
  timerNotificacoes.Enabled := False;
  try
    try
      if not centralSuporte.NotificacaoGetNaoLidas(Fnotificacoes) then
        raise Exception.Create('Erro');
    except
      pnNotificacoes.Caption := 'Erro ao obter notificações não lidas';
      Exit;
    end;
    if Length(Fnotificacoes) > 1  then
      pnNotificacoes.Caption := Length(Fnotificacoes).ToString + ' Notificações não lidas'
    else if Length(Fnotificacoes) = 1  then
      pnNotificacoes.Caption := Length(Fnotificacoes).ToString + ' Notificação não lida'
    else
      pnNotificacoes.Caption := 'Notificações';
  finally
    timerNotificacoes.Enabled  := True;
  end;
end;

end.
