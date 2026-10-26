unit HW.Utils.Forms.Tickets.Resposta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  HW.Utils.Classes.CentralAcoes, HW.Utils.Classes.Registros.Ticket_DX,
  HW.Utils.Classes.Registros.Documento_DX, System.Generics.Collections, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Menus, Vcl.DBCtrls, Datasnap.DBClient, Data.DB;

type
  TfrmUtilsTicketResposta = class(TForm)
    Panel1: TPanel;
    pnRegistro: TPanel;
    Panel7: TPanel;
    Panel2: TPanel;
    FileOpenDialog1: TFileOpenDialog;
    ListView1: TListView;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Image1: TImage;
    Panel3: TPanel;
    Label5: TLabel;
    edResposta: TMemo;
    pnAssunto: TPanel;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    Label3: TLabel;
    Panel8: TPanel;
    Label1: TLabel;
    edAssunto: TEdit;
    btView: TSpeedButton;
    btNovo: TSpeedButton;
    btReply: TSpeedButton;
    lbSize: TLabel;
    edSetor: TComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btViewClick(Sender: TObject);
  private
    FcentralSuporte: THW_CentralSuporte;
    Fticket: TTicket;
    FNovoTicket: Boolean;
    FdtSetor: tclientdataset;
    FdsSetor: TDataSource;
    FFileSize: Int64;

    function getImageIndex(AFileName: string): Integer;
    function GetFileSize(AFileName: string): Int64;
    { Private declarations }
  public
    { Public declarations }
    property centralSuporte: THW_CentralSuporte read FcentralSuporte write FcentralSuporte;
    property ticket: TTicket read Fticket write Fticket;
    property NovoTicket: Boolean read FNovoTicket write FNovoTicket;
  end;

var
  frmUtilsTicketResposta: TfrmUtilsTicketResposta;

implementation

uses
  HW.Utils.Classes.Registros.Ticket.Mensagem_DX, HW.Utils.Classes.Rtti,
  HW.Utils.Classes.Registros.Ticket.Participante_DX,
  System.IOUtils, HW.Utils.Classes.Funcoes_DX, HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Setor_DX, System.StrUtils, System.Math;

{$R *.dfm}

procedure TfrmUtilsTicketResposta.btViewClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUtilsTicketResposta.Excluir1Click(Sender: TObject);
begin
  if ListView1.ItemIndex >= 0 then
  begin
    FFileSize := FFileSize - GetFileSize(ListView1.Selected.SubItems[0]);
    ListView1.DeleteSelected;
  end;
  lbSize.Caption := IfThen(ListView1.Items.Count > 0, RoundTo(FFileSize / 1024 / 1024, -2).ToString + ' MB');
end;

procedure TfrmUtilsTicketResposta.FormCreate(Sender: TObject);
begin
  FNovoTicket := False;
end;

procedure TfrmUtilsTicketResposta.FormShow(Sender: TObject);
var
  Asetores: TArray<TSetor>;
  I: Integer;
begin
  Screen.Cursor := crHourGlass;
  lbSize.Caption := '';
  FFileSize := 0;
  try
    if FNovoTicket then
    begin
      Caption := 'Novo ticket';
      Panel7.Caption := 'Informe sua mensagem e anexe arquivos se necessário';
      btReply.Visible := False;
      edAssunto.Clear;
      pnAssunto.Visible := True;

      Asetores := TSetor.FromJsonToArray<TSetor>(centralSuporte.resposta.setorHw);

      for I := Low(Asetores) to High(Asetores) do
      begin
        edSetor.Items.Add(Asetores[I].Nome);
        if Asetores[I].Nome.ToLower.Trim.Contains('suporte') then
          edSetor.ItemIndex := I;
      end;
    end
    else
    begin
      btNovo.Visible := False;
      pnAssunto.Visible := False;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmUtilsTicketResposta.GetFileSize(AFileName: string): Int64;
var
  AFile: File of byte;
begin
  if not FileExists(AFileName) then
    Exit(0);

  try

    AssignFile(AFile, AFileName);
    try
      Reset(AFile);
      if (IOResult = 0) then
        Exit(FileSize(AFile))
      else
        Exit(0);
    finally
      CloseFile(AFile);
    end;
  except
    Result := 0;
  end;
end;

function TfrmUtilsTicketResposta.getImageIndex(AFileName: string): Integer;
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

procedure TfrmUtilsTicketResposta.SpeedButton1Click(Sender: TObject);
var
  AFileName, AFilePath: string;
  AFileInList: Boolean;
  AListItem: TListItem;
begin
  if FileOpenDialog1.Execute then
    AFilePath := FileOpenDialog1.Files.Text
  else
    Exit;

  if AFilePath.Trim.IsEmpty then
    Exit;

  if FileOpenDialog1.Files.Count > 1 then
  begin
    for AFilePath in FileOpenDialog1.Files do
    begin
      AFileInList := False;
      for AListItem in ListView1.Items do
        if AListItem.SubItems[0].ToLower.Trim = AFilePath.ToLower.Trim then
        begin
          AFileInList := True;
          Break;
        end;

      if not AFileInList then
        with ListView1.Items.Add do
        begin
          AFileName := TPath.GetFileNameWithoutExtension(AFilePath);

          ImageIndex := getImageIndex(AFilePath);
          Caption := AFileName;
          SubItems.Add(AFilePath);
          FFileSize := FFileSize + GetFileSize(AFilePath);
          lbSize.Caption := IfThen(ListView1.Items.Count > 0, RoundTo(FFileSize / 1024 / 1024, -2).ToString + ' MB');
        end;
    end;
    Exit;
  end
  else if FileOpenDialog1.Files.Count = 1 then
    AFilePath := FileOpenDialog1.Files[0]
  else
    Exit;

  AFileName := TPath.GetFileNameWithoutExtension(AFilePath);

  if not InputQuery('Nome do arquivo', 'Informe o nome do anexo', AFileName) then
    Exit;

  if AFileName.Trim = '' then
    Exit;

  for AListItem in ListView1.Items do
    if AListItem.SubItems[0].ToLower.Trim = AFilePath.ToLower.Trim then
      Exit;

  with ListView1.Items.Add do
  begin
    ImageIndex := getImageIndex(AFilePath);
    Caption := AFileName;
    SubItems.Add(AFilePath);

    FFileSize := FFileSize + GetFileSize(AFilePath);
    lbSize.Caption := IfThen(ListView1.Items.Count > 0, RoundTo(FFileSize / 1024 / 1024, -2).ToString + ' MB');
  end;
end;

procedure TfrmUtilsTicketResposta.btNovoClick(Sender: TObject);
var
  Amensagem: TTicketMensagem;
  ATicketMensagens: TArray<TTicketMensagem>;
  AParticipante: TTicketParticipante;
  AAtachments: TObjectList<TDocumento>;
  AListItem: TListItem;
  AAtachment: TDocumento;
  ANewTicket: TTicket;
  Amensagens: TArray<TTicketMensagem>;
  Aparticipantes: TArray<TTicketParticipante>;
  Asetores: TArray<TSetor>;
begin
  Screen.Cursor := crHourGlass;
  try
    try
      if FNovoTicket then
      begin
        if string(edAssunto.Text).Trim.IsEmpty then
          raise Exception.Create('Assunto deve ser preenchido');

        if edSetor.ItemIndex < 0 then
          raise Exception.Create('Informe o setor para a abertura do ticket');

        if edResposta.Lines.Text.Trim.IsEmpty then
          raise Exception.Create('O campo de mensagem deve ser preenchido');

        if edResposta.Lines.Text.Trim.Length < 15 then
          raise Exception.Create('O campo de mensagem deve conter no mínimo 15 caracteres');
      end
      else //mensagens para um ticket já criado
      begin
        if (edResposta.Lines.Text.Trim.IsEmpty) and (ListView1.Items.Count = 0) then
          raise Exception.Create('O campo de mensagem deve ser preenchido');
      end;

    except on E: Exception do
      begin
        THwUtilsClass.ShowErro(e.Message);
        Exit;
      end;
    end;

    try
      Amensagem := TTicketMensagem.Create;
      with Amensagem do
      begin
        MensagemID  := 0;
        DataCriacao := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(Now, 'mongo');
        Conteudo    := IfThen(not edResposta.Lines.Text.Trim.IsEmpty, edResposta.Lines.Text, '.');
        ConteudoHtml:= Conteudo;
        Privada     := False;
        Notificacao := False;
        TicketID    := Fticket.TicketID;
        CodEmpresa  := centralSuporte.acessToken.cod_empresa;

        for AParticipante in Fticket.Participantes do
          if AParticipante.Usuario.cod_usuario = centralSuporte.acessToken.cod_usuario then
          begin
            CriadaPorID := AParticipante.ParticipanteID;
            Break;
          end;
      end;

      AAtachments := TObjectList<TDocumento>.Create();
      try

        FFileSize := 0;
        for AListItem in ListView1.Items do
        begin
          AAtachment := TDocumento.Create;
          AAtachment.descricao := AListItem.Caption;
          AAtachment.filePath := AListItem.SubItems[0];

          AAtachments.Add(AAtachment);

          FFileSize := FFileSize + GetFileSize(AAtachment.filePath);
        end;
        lbSize.Caption := IfThen(ListView1.Items.Count > 0, RoundTo(FFileSize / 1024 / 1024, -2).ToString + ' MB');
        if (FFileSize / 1024 / 1024) > 10 then
        begin
          THwUtilsClass.ShowErro('Tamanho máximo dos anexos excedido' + #13 +
                                 'Anexos: ' + RoundTo(FFileSize / 1024 / 1024, -2).ToString + ' MB' + #13 +
                                 'Máximo 10MB');
          Exit;
        end;

        if FNovoTicket then
        begin
          ANewTicket    := TTicket.Create;
          Aparticipante := TTicketParticipante.Create;

          ANewTicket.DataCriacao     := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(now, 'mongo');
          ANewTicket.DataModificacao := ANewTicket.DataCriacao;

          Aparticipante.UsuarioID    := centralSuporte.acessToken.cod_usuario;
          Aparticipante.DataEntrada  := ANewTicket.DataCriacao;
          AParticipante.NivelAcesso  := 7; //Somente envio
          AParticipante.EnviarEmail  := True;

          SetLength(Amensagens, 1);
          SetLength(Aparticipantes, 1);

          Amensagens[0]     := Amensagem;
          Aparticipantes[0] := Aparticipante;

          ANewTicket.Assunto       := edAssunto.Text;
          ANewTicket.Mensagens     := Amensagens;
          ANewTicket.Participantes := Aparticipantes;
          ANewTicket.Status        := 'Pendente Empresa';
          ANewTicket.Prioridade    := 'Média';

          Asetores := TSetor.FromJsonToArray<TSetor>(centralSuporte.resposta.setorHw);
          if (Length(Asetores) > 0) and (edSetor.ItemIndex >= 0) and
            (edSetor.ItemIndex <= High(Asetores)) then
            ANewTicket.SetorID     := Asetores[edSetor.ItemIndex].SetorID;

          ANewTicket.ClienteID     := centralSuporte.acessToken.cod_cliente;
        end
        else
          ANewTicket := nil;

        if not centralSuporte.TicketRegistrarMensagem(Amensagem, AAtachments, ANewTicket) then
          raise Exception.Create('Erro ao registrar mensagem' + #13 + centralSuporte.LastError);

        ATicketMensagens := Fticket.Mensagens;
        SetLength(ATicketMensagens, Length(ATicketMensagens) + 1);
        ATicketMensagens[High(ATicketMensagens)] := Amensagem;
        Fticket.Mensagens := ATicketMensagens;
        ModalResult := mrOk;
      finally
        FreeAndNil(AAtachments);
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

end.
