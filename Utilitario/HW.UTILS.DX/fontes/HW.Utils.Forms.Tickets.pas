unit HW.Utils.Forms.Tickets;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  HW.Utils.Classes.CentralAcoes, HW.Utils.Classes.Registros.Ticket.Consulta_DX,
  HW.Utils.Classes.Registros.Ticket_DX;

type
  TfrmUtilsTickets = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel4: TPanel;
    pnTotalTickets: TPanel;
    memoTickets: TMemo;
    Panel3: TPanel;
    btPrior: TSpeedButton;
    btNext: TSpeedButton;
    btView: TSpeedButton;
    btReply: TSpeedButton;
    btSair: TSpeedButton;
    btNovo: TSpeedButton;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure btViewClick(Sender: TObject);
    procedure btReplyClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
  private
    FcentralSuporte: THW_CentralSuporte;
    FticketConsulta: TArray<TTicketConsulta>;
    Fticket: TTicket;
    { Private declarations }
  public
    { Public declarations }
    function verificarExistenciaDeTickets: Boolean;
    procedure atualizaMemoTicket(Aticket: TTicketConsulta);
    property centralSuporte: THW_CentralSuporte read FcentralSuporte write FcentralSuporte;
  end;

var
  frmUtilsTickets: TfrmUtilsTickets;

implementation

uses
  System.StrUtils, HW.Utils.Classes.Rtti,
  HW.Utils.Classes.Registros.Ticket.Mensagem_DX,
  HW.Utils.Forms.Tickets.Resposta, HW.Utils.Classes.Funcoes_DX,
  HW.Utils.Forms.Tickets.Visualizar;

{$R *.dfm}

{ TTfrmUtilsTickets }

procedure TfrmUtilsTickets.atualizaMemoTicket(Aticket: TTicketConsulta);
begin
  Panel5.Visible := True;

  Label2.Caption := Aticket.TicketID.ToString;
  Label4.Caption := THwConvertDateTimeFormatUtils.ConvertDateTime(Aticket.DataCriacao, 'mongo', 'DD/MM/YYYY hh:nn');
  Label6.Caption := Aticket.Assunto;
  Label8.Caption := IfThen(Aticket.Status.ToLower.Trim = 'pendente cliente', 'Você', 'Suporte Técnico');
  Label10.Caption := Aticket.Responsavel;

  with memoTickets.Lines do
  begin
    Clear;
    Add('Número          : ' + Aticket.TicketID.ToString);
    Add('Data abertura   : ' + THwConvertDateTimeFormatUtils.ConvertDateTime(Aticket.DataCriacao, 'mongo', 'DD/MM/YYYY hh:nn'));
    Add('Assunto         : ' + Aticket.Assunto);
    Add('Pentendente para: ' + IfThen(Aticket.Status.ToLower.Trim = 'pendente cliente', 'Você', 'Suporte Técnico'));
    Add('Responsável     : ' + Aticket.Responsavel);
  end;
end;

procedure TfrmUtilsTickets.FormShow(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if not verificarExistenciaDeTickets then
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsTickets.btPriorClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if (memoTickets.Tag - 1) >= Low(FticketConsulta) then
    begin
      if Assigned(Fticket) then
        FreeAndNil(Fticket);
      memoTickets.Font.Size := 12;
      memoTickets.ScrollBars := ssNone;
      memoTickets.Tag := memoTickets.Tag - 1;
      atualizaMemoTicket(FticketConsulta[memoTickets.Tag]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsTickets.btReplyClick(Sender: TObject);
var
  Amensagem: TTicketMensagem;
begin
  Screen.Cursor := crHourGlass;
  try
    try
      if (memoTickets.Tag >= 0)then
        //if Assigned(FticketConsulta[memoTickets.Tag]) then
        if (Length(FticketConsulta) >= (memoTickets.Tag - 1)) and (Length(FticketConsulta) > 0) then
        begin
          if (not Assigned(Fticket)) then
            Fticket := centralSuporte.TicketGet(FticketConsulta[memoTickets.Tag].TicketID)
          else if Fticket.TicketID <> FticketConsulta[memoTickets.Tag].TicketID then
            Fticket := centralSuporte.TicketGet(FticketConsulta[memoTickets.Tag].TicketID);

          if not Assigned(Fticket) then
          begin
            THwUtilsClass.ShowErro('Não foi possivel obter dados do ticket');
            Exit;
          end;

          Application.CreateForm(TfrmUtilsTicketResposta, frmUtilsTicketResposta);
          frmUtilsTicketResposta.centralSuporte := FcentralSuporte;
          frmUtilsTicketResposta.ticket := Fticket;
          if frmUtilsTicketResposta.ShowModal = IDOK then
            if Assigned(Fticket.Mensagens[High(Fticket.Mensagens)]) then
            begin
              Screen.Cursor := crHourGlass;
              Amensagem := Fticket.Mensagens[High(Fticket.Mensagens)];
              with memoTickets.Lines do
              begin
                Add('');
                Add('' + THwConvertDateTimeFormatUtils.ConvertDateTime(Amensagem.DataCriacao, 'mongo', 'DD/MM/YYYY hh:nn') + ' ' +
                           centralSuporte.acessToken.nome_usuario);
                Add('');
                Add(Amensagem.ConteudoHtml);
                Add('--');
              end;
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

procedure TfrmUtilsTickets.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUtilsTickets.btNextClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if (memoTickets.Tag + 1) <= High(FticketConsulta) then
    begin
      if Assigned(Fticket) then
        FreeAndNil(Fticket);
      memoTickets.Font.Size := 12;
      memoTickets.ScrollBars := ssNone;
      memoTickets.Tag := memoTickets.Tag + 1;
      atualizaMemoTicket(FticketConsulta[memoTickets.Tag]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsTickets.btNovoClick(Sender: TObject);
var
  Aticket: TTicket;
begin
  Screen.Cursor := crHourGlass;
  try
    Aticket := TTicket.Create;

    Application.CreateForm(TfrmUtilsTicketResposta, frmUtilsTicketResposta);
    frmUtilsTicketResposta.centralSuporte := FcentralSuporte;
    frmUtilsTicketResposta.ticket := Aticket;
    frmUtilsTicketResposta.NovoTicket := True;
    if frmUtilsTicketResposta.ShowModal = IDOK then
    begin
      Screen.Cursor := crHourGlass;
      verificarExistenciaDeTickets;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsTickets.btViewClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    try
      if (memoTickets.Tag >= 0)then
        if (Length(FticketConsulta) >= (memoTickets.Tag - 1)) and (Length(FticketConsulta) > 0) then
          Fticket := centralSuporte.TicketGet(FticketConsulta[memoTickets.Tag].TicketID);

      if Assigned(Fticket) then
      begin
        Application.CreateForm(TfrmUtilsTicketsVisualizar, frmUtilsTicketsVisualizar);
        frmUtilsTicketsVisualizar.centralSuporte := FcentralSuporte;
        frmUtilsTicketsVisualizar.ticket := Fticket;
        frmUtilsTicketsVisualizar.ShowModal;
        FreeAndNil(frmUtilsTicketsVisualizar);
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

function TfrmUtilsTickets.verificarExistenciaDeTickets: Boolean;
var
  Aticket: TTicketConsulta;
  APendenteCliente: Integer;
begin
  Result := False;

  if not Assigned(centralSuporte) then
    Exit;

  try
    Result := centralSuporte.TicketGetEmAbertos(FticketConsulta);
    if not Result then
      raise Exception.Create('Erro ao obter tickets em aberto ' + centralSuporte.LastError);

  except on E: Exception do
    begin
      THwUtilsClass.ShowErro(E.Message);
      THwUtilsClass.RegistraErro(e.Message);
      Exit(False);
    end;
  end;

  APendenteCliente := 0;
  memoTickets.Tag  := -1;

  if Assigned(FticketConsulta) then
  begin
//    pnJaExiste.Visible := True;
    for Aticket in FticketConsulta do
      if Aticket.Status.Trim.ToLower = 'pendente cliente' then
        APendenteCliente := APendenteCliente + 1;

    pnTotalTickets.Caption := 'Total de Tickets ' + (High(FticketConsulta) + 1).ToString + ' - ' +
                              'Suas pendencias ' + APendenteCliente.ToString + ' - ' +
                              'Pendencias Suporte ' + ((High(FticketConsulta) + 1) - APendenteCliente).ToString;

    memoTickets.Tag := Low(FticketConsulta);
    if memoTickets.Tag > -1 then
      if High(FticketConsulta) >= memoTickets.Tag then
        atualizaMemoTicket(FticketConsulta[memoTickets.Tag]);
  end
  else
  begin
    pnTotalTickets.Caption := 'Não existem tickets em aberto para você';
    Panel5.Visible := False;

    memoTickets.Lines.Clear;
    memoTickets.Lines.Add('Não existem tickets em aberto para você');
  end;
end;

end.
