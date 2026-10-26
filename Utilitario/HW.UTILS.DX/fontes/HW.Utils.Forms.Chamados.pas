unit HW.Utils.Forms.Chamados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  HW.Utils.Classes.CentralAcoes, Vcl.Buttons, HW.Utils.Classes.Registros.Chamado_DX, Vcl.DBCtrls, Vcl.Mask,
  HW.Utils.Classes.Registros.Usuario_DX, Datasnap.DBClient, Data.DB;

type
  TfrmUtilsChamado = class(TForm)
    Panel1: TPanel;
    pnJaExiste: TPanel;
    Panel4: TPanel;
    pnRegistro: TPanel;
    Panel7: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edContato: TEdit;
    Label2: TLabel;
    edDataAgendamento: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label5: TLabel;
    edTextoProblema: TMemo;
    Label6: TLabel;
    edTelefone: TEdit;
    Panel5: TPanel;
    memoChamado: TMemo;
    btMarcarComoLida: TSpeedButton;
    btExit: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    edSetor: TComboBox;
    Panel3: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    SpeedButton4: TSpeedButton;
    Panel6: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure btMarcarComoLidaClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
  private
    FcentralSuporte: THW_CentralSuporte;
    Fchamado: TChamado;
    Fusuario: TUsuario;
    FdtSetor: TClientDataSet;
    FdsSetor: TDataSource;
    { Private declarations }
  public
    { Public declarations }
    function verificarExistenciaDeChamado: Boolean;
    property centralSuporte: THW_CentralSuporte read FcentralSuporte write FcentralSuporte;
  end;

var
  frmUtilsChamado: TfrmUtilsChamado;

implementation

uses
  HW.Utils.Classes.Rtti, HW.Utils.Classes.Registros.Setor_DX,
  HW.Utils.Classes.Registros_DX, HW.Utils.Classes.Funcoes_DX, System.StrUtils;

{$R *.dfm}

procedure TfrmUtilsChamado.btExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUtilsChamado.btMarcarComoLidaClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try

    try

      if centralSuporte.ChamadoDesistir(Fchamado) then
        verificarExistenciaDeChamado;

    except on E: Exception do
      begin
        THwUtilsClass.ShowErro(E.Message);
        THwUtilsClass.RegistraErro(e.Message);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsChamado.FormCreate(Sender: TObject);
begin
  FdsSetor := TDataSource.Create(Self);
  /// Passos ao entrar na tela
  ///  Exe. O usuario clica no site HW na opção de suporte
  ///  DLL. A partir daqui é somente a dll
  ///  Vai abrir esta tela
  ///  O sistema deverá pedir a senha
  ///  Caso o usuario não saiba ele pode pedir pra redefinir a senha
  ///  Um checkbox para salvar a senha e manter logado sempre que entrar (salva senha cripto no banco, e no reg do windows salva o usuario, talvez precise de uma lista)
  ///  Depois de logado
  ///  Pesquisar os chamados não fechados do usuario e apresentar em tela (aqui vai ter de usar um clientdataset e o adapter)
  ///  Exibir os detalhes do ultimo
  ///  Se o ultimo estiver fechado, deixar abrir um novo
end;

procedure TfrmUtilsChamado.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    if pnJaExiste.Visible then
      Close
    else if THwUtilsClass.ShowConfirmacao('Deseja descartar o registro do chamado') = IDYES then
      Close;
end;

procedure TfrmUtilsChamado.FormShow(Sender: TObject);
var
  Asetores: TArray<TSetor>;
  I: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    Self.AutoSize := True;
    pnJaExiste.Align := alClient;
    pnRegistro.Align := alClient;

    Fusuario := TUsuario.FromJsonString<TUsuario>(centralSuporte.resposta.usuarioHw);

    Asetores := TSetor.FromJsonToArray<TSetor>(centralSuporte.resposta.setorHw);

    for I := Low(Asetores) to High(Asetores) do
    begin
      edSetor.Items.Add(Asetores[I].Nome);
      if Asetores[I].Nome.ToLower.Trim.Contains('suporte') then
        edSetor.ItemIndex := I;
    end;

    if not verificarExistenciaDeChamado then
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUtilsChamado.SpeedButton1Click(Sender: TObject);
begin
  edDataAgendamento.Clear;
  Perform(WM_NEXTDLGCTL, 0, 0);
  if edDataAgendamento.CanFocus then
    edDataAgendamento.SetFocus;
end;

procedure TfrmUtilsChamado.SpeedButton3Click(Sender: TObject);
var
  Achamado: TChamado;
  ADateTime: TDateTime;
  Asetores: TArray<TSetor>;
begin
  Screen.Cursor := crHourGlass;
  try
    Perform(WM_NEXTDLGCTL, 0, 0);
    if edSetor.ItemIndex < 0 then
//    if edSetor.KeyValue <= 0 then
    begin
      THwUtilsClass.ShowAtencao('Informe o setor para a abertura do chamado');
      Exit;
    end;
    if Length(edTextoProblema.Lines.Text.Trim) < 15 then
    begin
      THwUtilsClass.ShowAtencao('Por favor descreva o seu problema. Mínimo de 15 caracteres');
      Exit;
    end;

    Achamado := TChamado.Create;
    with Achamado do
    begin
      cod_empresa := Fusuario.cod_empresa;
      cod_cliente := Fusuario.cod_cliente;
      ativo := 1;
      tipo := 'LISTA';
      nome := edContato.Text;
      mensagem := edTextoProblema.Lines.Text;
      email := Fusuario.email;
      telefone := edTelefone.Text;
      //desativado o agendamento até o site for postado com as datas em UTC
      data_agendamento := '';
      //if TryStrToDateTime(edDataAgendamento.Text, ADateTime) then
        //data_agendamento := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(ADateTime, 'mongo');
      ref_cadastro := 'SISTEMA';
      cod_us_cad := Fusuario.cod_usuario;
      cod_cli_atend := centralSuporte.CodigoParceiro;

      Asetores := TSetor.FromJsonToArray<TSetor>(centralSuporte.resposta.setorHw);
      if (Length(Asetores) > 0) and (edSetor.ItemIndex >= 0) and
        (edSetor.ItemIndex <= High(Asetores)) then
      begin
        SetorID := Asetores[edSetor.ItemIndex].SetorID;
        Setor := Asetores[edSetor.ItemIndex];
      end;
    end;

    try
      if centralSuporte.ChamadoCriar(Achamado) then
        if verificarExistenciaDeChamado then
          if Achamado.data_agendamento <> '' then
            if not Assigned(Fchamado) then
              Application.MessageBox('Chamado criado. Consulte a Central de Atendimento para mais detalhes', 'Atenção', 0 + 64);
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

procedure TfrmUtilsChamado.SpeedButton4Click(Sender: TObject);
var
  Amsg: string;
begin
 Screen.Cursor := crHourGlass;
  try

    if not THwUtilsClass.InputMemo('Adicionar mensagem', 'Adicione uma mensagem ou informação ao seu chamado', Amsg) then
      Exit;

    if Amsg.Trim.IsEmpty then
      Exit;

    try

      if centralSuporte.ChamadoAdicionarMensagemAoChamado(Fchamado, Amsg ) then
        if not verificarExistenciaDeChamado then
          PostMessage(Self.Handle, WM_CLOSE, 0, 0);

    except on E: Exception do
      begin
        THwUtilsClass.ShowErro(E.Message);
        THwUtilsClass.RegistraErro(e.Message);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmUtilsChamado.verificarExistenciaDeChamado: Boolean;
begin
  Result := False;

  pnJaExiste.Visible := False;
  pnRegistro.Visible := False;

  if not Assigned(centralSuporte) then
    Exit;

  try
    Result := centralSuporte.ChamadoGetUltimoAberto(Fchamado);
    if not Result then
      raise Exception.Create('Erro ao obter chamado ' + centralSuporte.LastError);

  except on E: Exception do
    begin
      THwUtilsClass.ShowErro(E.Message);
      THwUtilsClass.RegistraErro(e.Message);
      Exit(False);
    end;
  end;

  if Assigned(Fchamado) then
  begin
    pnJaExiste.Visible := True;

    Label7.Caption := Fchamado.cliente.nome;
    Label8.Caption := Fchamado.cliente.razao;
    Label10.Caption := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(
                         THwConvertDateTimeFormatUtils.ConvertStrToDateTime(Fchamado.data_cadastro, 'mongo'),
                         'DD/MM/YYYY hh:nn');
    Label12.Caption := Fchamado.Setor.Nome;
    Label14.Caption := Fchamado.nome + ' - ' + Fchamado.email;
    Label15.Caption := IfThen(Fchamado.data_agendamento.Trim <> '', 'Agendado');
    if Fchamado.data_agendamento.Trim <> '' then
      Label16.Caption := THwConvertDateTimeFormatUtils.ConvertDateTime( Fchamado.data_agendamento, 'mongo', 'DD/MM/YYYY hh:nn')
    else
      Label16.Caption := '';
    Label18.Caption := Fchamado.status;
    Label20.Caption := Fchamado.cod_chamado.ToString;

    with memoChamado.Lines do
    begin
      Clear;
      {
      Add('Cliente  : ' + Fchamado.cliente.nome);
      Add('           ' + Fchamado.cliente.razao);
      Add('Data     : ' +
                        THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(
                          THwConvertDateTimeFormatUtils.ConvertStrToDateTime(Fchamado.data_cadastro, 'mongo'),
                          'DD/MM/YYYY hh:nn') + '      ' +
            'Setor: ' + Fchamado.Setor.Nome
      );
      Add('');
      Add('Contato  : ' + Fchamado.nome + ' ' + Fchamado.email);
      if Fchamado.data_agendamento.Trim <> '' then
        Add('Agendado : ' + THwConvertDateTimeFormatUtils.ConvertDateTime( Fchamado.data_agendamento, 'mongo', 'DD/MM/YYYY hh:nn'));

      Add('Status   : ' + Fchamado.status);
      Add('Problema : ' + Fchamado.mensagem);
      }
      Add(StringReplace(Fchamado.mensagem, #$A, #13 + #10, [rfReplaceAll]));

    end;
  end
  else
  begin
    edTelefone.Text := '';
    edDataAgendamento.Clear;
    edTextoProblema.Lines.Clear;
    if Assigned(Fusuario) then
      edContato.Text := Fusuario.nome_cliente;
    pnRegistro.Visible := True;
  end;
end;

end.
