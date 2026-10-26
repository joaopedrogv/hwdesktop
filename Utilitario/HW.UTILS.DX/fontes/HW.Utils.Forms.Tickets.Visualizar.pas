unit HW.Utils.Forms.Tickets.Visualizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  HW.Utils.Classes.CentralAcoes, HW.Utils.Classes.Registros.Ticket_DX, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  IdComponent, Vcl.Samples.Gauges;

type
  TfrmUtilsTicketsVisualizar = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    pnTitulo: TPanel;
    memoTickets: TMemo;
    Panel3: TPanel;
    btView: TSpeedButton;
    btReply: TSpeedButton;
    scrollMensagens: TScrollBox;
    Gauge1: TGauge;
    FileOpenDialog1: TFileOpenDialog;
    ImageList1: TImageList;
    Panel2: TPanel;
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
    procedure btReplyClick(Sender: TObject);
    procedure btViewClick(Sender: TObject);
  private
    FcentralSuporte: THW_CentralSuporte;
    Fticket: TTicket;
    function getImageIndex(AFileName: string): Integer;
    procedure AListView1DblClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    procedure showDadosDoTicket;
    property centralSuporte: THW_CentralSuporte read FcentralSuporte write FcentralSuporte;
    property ticket: TTicket read Fticket write Fticket;
  end;

var
  frmUtilsTicketsVisualizar: TfrmUtilsTicketsVisualizar;

implementation

uses
  HW.Utils.Classes.Rtti, System.StrUtils,
  HW.Utils.Classes.Registros.Ticket.Mensagem_DX,
  HW.Utils.Classes.Registros.Ticket.Documento_DX, HW.Utils.Classes.Funcoes_DX,
  HW.Utils.Forms.Tickets.Resposta;

{$R *.dfm}

{ TfrmUtilsTicketsVisualizar }

procedure TfrmUtilsTicketsVisualizar.AListView1DblClick(Sender: TObject);
var
  AListView: TListView;
  Acod_documento, Arevisao: Integer;
  AFileName: string;
  I: Integer;
  ADownloadWork: THW_CentralSuporte_Download;
begin
  Screen.Cursor := crHourGlass;
  try
    AListView := TListView(Sender);
    if not Assigned(AListView.Selected) then
      Exit;

    Arevisao := 0;
    Acod_documento := 0;

    for I := 0 to AListView.Selected.SubItems.Count - 1 do
      if I = 0 then
        Acod_documento := StrToIntDef(AListView.Selected.SubItems[I], 0)
      else if I = 1 then
        Arevisao := StrToIntDef(AListView.Selected.SubItems[I], 0);

    if (Acod_documento > 0) and (Arevisao > 0) then
    begin
      FileOpenDialog1.FileName := AListView.Selected.Caption;
      if not FileOpenDialog1.Execute then
        Exit
      else
        AFileName := FileOpenDialog1.FileName;

      if FileExists(AFileName) then
        if THwUtilsClass.ShowConfirmacao('Arquivo já existe. Deseja substituir') <> IDYES then
          Exit;

      ADownloadWork := THW_CentralSuporte_Download.Create;
      Gauge1.Visible := True;
      try
        ADownloadWork.Gauge := TGauge(Gauge1);

        try
          if not centralSuporte.TicketDownloadDocumento(Acod_documento, Arevisao, AFileName, ADownloadWork) then
            raise Exception.Create('Erro ao efetuar download. Tente novamente ' + #13 + centralSuporte.LastError);

        except on E: Exception do
          begin
            THwUtilsClass.ShowErro(E.Message);
            THwUtilsClass.RegistraErro(E.Message);
          end;
        end;

      finally
        Gauge1.Visible := False;
        Gauge1.Progress := 0;
        FreeAndNil(ADownloadWork);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsTicketsVisualizar.btReplyClick(Sender: TObject);
var
  AComponent: TComponent;
  I: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    if not Assigned(Fticket) then
    begin
      THwUtilsClass.ShowErro('Não foi possivel obter dados do ticket');
      Exit;
    end;

    try

      Application.CreateForm(TfrmUtilsTicketResposta, frmUtilsTicketResposta);
      frmUtilsTicketResposta.centralSuporte := FcentralSuporte;
      frmUtilsTicketResposta.ticket := Fticket;
      if frmUtilsTicketResposta.ShowModal = IDOK then
      begin
        Screen.Cursor := crHourGlass;
        for I := scrollMensagens.ComponentCount - 1 downto 0 do
        begin
          AComponent := scrollMensagens.Components[I];
          AComponent.Free;
        end;
        Fticket := FcentralSuporte.TicketGet(Fticket.TicketID);
        showDadosDoTicket;
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

procedure TfrmUtilsTicketsVisualizar.btViewClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUtilsTicketsVisualizar.FormShow(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    showDadosDoTicket;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmUtilsTicketsVisualizar.getImageIndex(AFileName: string): Integer;
begin
  Result := 0;
  if '.pdf'.Contains(ExtractFileExt(AFileName).ToLower)  then
    Result := 1
  else if '.jpg.jpeg.png.bmp.gif'.Contains(ExtractFileExt(AFileName).ToLower) then
    Result := 2
  else if '.doc.docx.rtf.txt.ini.log.config.xml.html'.Contains(ExtractFileExt(AFileName).ToLower) then
    Result := 3
  else if '.xls.xlsx'.Contains(ExtractFileExt(AFileName).ToLower) then
    Result := 4
  else if '.zip.rar.7z'.Contains(ExtractFileExt(AFileName).ToLower) then
    Result := 5
  else if '.exe.bat'.Contains(ExtractFileExt(AFileName).ToLower) then
    Result := 6;
end;

procedure TfrmUtilsTicketsVisualizar.showDadosDoTicket;
var
  AMensagem: TTicketMensagem;
  APanel: TPanel;
  AMemo: TMemo;
  AListView: TListView;
  ADocumento: TTicketDocumento;
  ALabel: TLabel;
begin
  if Assigned(Fticket) then
  begin
    pnTitulo.Caption := 'Ticket n° ' + Fticket.TicketID.ToString;


    Label2.Caption := Fticket.TicketID.ToString;
    Label4.Caption := THwConvertDateTimeFormatUtils.ConvertDateTime(Fticket.DataCriacao, 'mongo', 'DD/MM/YYYY hh:nn');
    Label6.Caption := Fticket.Assunto;
    Label8.Caption := IfThen(Fticket.Status.ToLower.Trim = 'pendente cliente', 'Você', 'Suporte Técnico');
    if Assigned(Fticket.Responsavel) and (Assigned(Fticket.Responsavel.Usuario)) then
      Label10.Caption := Fticket.Responsavel.Usuario.nome_cliente
    else
      Label10.Caption := '';


    memoTickets.Font.Size := 10;
    with memoTickets.Lines do
    begin
      Clear;
      Add('Número          : ' + Fticket.TicketID.ToString + ' ' +
          'Data abertura: ' + THwConvertDateTimeFormatUtils.ConvertDateTime(Fticket.DataCriacao, 'mongo', 'DD/MM/YYYY hh:nn'));
      Add('Assunto         : ' + Fticket.Assunto);
      if Assigned(Fticket.Responsavel) and (Assigned(Fticket.Responsavel.Usuario)) then
        Add('Pentendente para: ' + IfThen(Fticket.Status.ToLower.Trim = 'pendente cliente', 'Você', 'Suporte Técnico') + ' ' +
            ' - Responsável: ' + Fticket.Responsavel.Usuario.nome_cliente)
      else
        Add('Pentendente para: ' + IfThen(Fticket.Status.ToLower.Trim = 'pendente cliente', 'Você', 'Suporte Técnico'));
    end;

    for AMensagem in Fticket.Mensagens do
    begin
      APanel := TPanel.Create(scrollMensagens);
      APanel.Parent := scrollMensagens;
      APanel.Name := 'APanel' + AMensagem.MensagemID.ToString;
      APanel.Tag  := AMensagem.TicketID;
      APanel.Caption := '';
      APanel.Height := 100;
      APanel.Top := 99999;
      APanel.Align := alTop;
      APanel.BorderWidth := 6;
      APanel.BevelKind := bkTile;
      APanel.BevelOuter := bvNone;
      APanel.BevelEdges := [beLeft, beRight, beBottom];
      APanel.Visible := True;

      ALabel := TLabel.Create(APanel);
      ALabel.Parent := APanel;
      ALabel.Name := 'ALabel' + AMensagem.MensagemID.ToString;
      ALabel.Align := alTop;
      ALabel.Font.Size := 10;
      ALabel.Font.Style := [fsBold];
      ALabel.Caption := 'Não foi possível localizar o remetente da mensagem';
      if Assigned(AMensagem.CriadorPor.Usuario) then
        ALabel.Caption := AMensagem.CriadorPor.Usuario.nome_cliente;

      AMemo := TMemo.Create(APanel);
      AMemo.Parent := APanel;
      AMemo.Name := 'AMemo' + AMensagem.MensagemID.ToString;
      AMemo.Tag  := AMensagem.TicketID;
      AMemo.Lines.Text := AMensagem.Conteudo;
      AMemo.Align := alClient;
      AMemo.BorderStyle := bsNone;
      AMemo.Visible := True;
      AMemo.ReadOnly := True;
      if AMemo.CanFocus then
        AMemo.SetFocus;

      AListView := TListView.Create(APanel);
      AListView.Parent := APanel;
      AListView.Name := 'AListView' + AMensagem.MensagemID.ToString;
      AListView.Tag  := AMensagem.TicketID;
      AListView.Align := alRight;
      AListView.BorderStyle := bsNone;
      AListView.ViewStyle := vsReport;
      AListView.ShowColumnHeaders := False;
      AListView.SmallImages := ImageList1;
      AListView.OnDblClick  := AListView1DblClick;
      AListView.Visible := True;
      AListView.Width := 168;
        with AListView.Columns.Add do
      begin
        Caption := 'arquivo';
        Width  := 165;
      end;
      for ADocumento in AMensagem.Documentos do
        if Assigned(ADocumento.Revisao) then
        begin
          with AListView.Items.Add do
          begin
            Caption    := ADocumento.Revisao.doc_nome;
            ImageIndex := getImageIndex(Caption);
            SubItems.Add(ADocumento.cod_documento.ToString);
            SubItems.Add(ADocumento.Revisao.revisao.ToString);
          end;
        end;
    end;
  end;
end;

end.
