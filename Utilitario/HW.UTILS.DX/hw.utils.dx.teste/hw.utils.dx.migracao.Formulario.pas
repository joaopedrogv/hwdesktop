unit hw.utils.dx.migracao.Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  hw.utilis.migracao.registro.Solicitacao;

type
  TfrmHwUtilsDxMigracaoFormulario = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edUsuarioPadrao: TMaskEdit;
    btIniciar: TBitBtn;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    edModulo: TComboBox;
    edAssunto: TComboBox;
    edUsuario: TComboBox;
    edPropErro: TMemo;
    btMigrar: TBitBtn;
    btNaoMigrar: TBitBtn;
    edTitulo: TEdit;
    edLastMessage: TMemo;
    edPesqModulo: TEdit;
    edPesqAssunto: TEdit;
    lbURL: TLabel;
    lbStatus: TLabel;
    lbDados: TLabel;
    btStatus: TSpeedButton;
    procedure btIniciarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btNaoMigrarClick(Sender: TObject);
    procedure btMigrarClick(Sender: TObject);
    procedure edModuloExit(Sender: TObject);
    procedure edPesqAssuntoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPesqModuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btStatusClick(Sender: TObject);
    procedure edAssuntoExit(Sender: TObject);
  private
    { Private declarations }
    FSolicitacao: TSolicitacaoSC;
    FModuloF7Index: Integer;
    FModulosF7: TStrings;
    procedure atualizarSolicitacao;
  public
    { Public declarations }
  end;

var
  frmHwUtilsDxMigracaoFormulario: TfrmHwUtilsDxMigracaoFormulario;

implementation

{$R *.dfm}

uses
  hw.utils.dx.migracao.Classes,
  System.StrUtils,
  System.Math;

procedure TfrmHwUtilsDxMigracaoFormulario.atualizarSolicitacao;
var
  I: Integer;
begin
  FSolicitacao := Migracao.GetRegistroRank;

  btMigrar.Enabled    := (not FSolicitacao.titulo.Equals('***SEM SOLICITACOES***')) and
                         (not FSolicitacao.titulo.Equals('***ERRO AO CONECTAR COM O BANCO***'));
  btNaoMigrar.Enabled := btMigrar.Enabled;

  if Assigned(FSolicitacao.modulo) then
    edModulo.ItemIndex := edModulo.Items.IndexOf(FSolicitacao.modulo.descricao.ToUpper.Trim)
  else
    edModulo.ItemIndex := -1;
  if FSolicitacao.Advertencia_Modulo then
    edModulo.Color := $009F9FFF
  else
    edModulo.Color := clWindow;

  if Assigned(FSolicitacao.assunto) then
    edAssunto.ItemIndex := edAssunto.Items.IndexOf(FSolicitacao.assunto.descricao.ToUpper.Trim)
  else
    edAssunto.ItemIndex := -1;
  if FSolicitacao.Advertencia_Assunto then
    edAssunto.Color := $009F9FFF
  else
    edAssunto.Color := clWindow;

  edUsuario.Clear;
  for I := Low(Migracao.Usuarios) to High(Migracao.Usuarios) do
    edUsuario.Items.Add(Migracao.Usuarios[I].email.ToLower.Trim);

  if Assigned(FSolicitacao.criado_por) then
    edUsuario.ItemIndex := edUsuario.Items.IndexOf(FSolicitacao.criado_por.email.ToLower.Trim)
  else
    edUsuario.ItemIndex := -1;

  lbDados.Caption := IfThen(FSolicitacao.tipo = 1, 'Correção', 'Sugestão') + ' ' +
                     FSolicitacao.peso_tipo.ToString +  '    ' +
                     IfThen(FSolicitacao.prioridade = 1, 'Leve') +
                     IfThen(FSolicitacao.prioridade = 2, 'Média') +
                     IfThen(FSolicitacao.prioridade = 3, 'Grave') +
                     IfThen(FSolicitacao.prioridade = 4, 'Crítica') + '    ' +
                     IfThen(not FSolicitacao.NomeCliente.Trim.IsEmpty, FSolicitacao.NomeCliente.Trim) + '    de    ' +
                     FSolicitacao.data_criacao.Substring(0, 10);

  edTitulo.Text := FSolicitacao.titulo;
  edPropErro.Lines.Text := FSolicitacao.descricao;
  btStatus.Caption := IfThen(FSolicitacao.status = 0, 'Em Processamento', 'Cadastrada');

  edLastMessage.Lines.Text := Migracao.LastMessage;
  if Migracao.LastMessage.Equals('OK') then
  begin
    edLastMessage.Font.Color := clBlue;
    edLastMessage.Font.Style := [fsBold];
  end
  else
  begin
    edLastMessage.Font.Color := clRed;
    edLastMessage.Font.Style := [];
  end;
  lbURL.Caption := Migracao.LastURL;

  if FSolicitacao.Advertencia_Modulo then
    edPesqModulo.SetFocus
  else if FSolicitacao.Advertencia_Assunto then
    edPesqAssunto.SetFocus;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.btIniciarClick(Sender: TObject);
var
  I: Integer;
begin
  if not Assigned(Migracao) then
    Migracao := TMigracaoSolicitacoes.Create;

  if not Migracao.Iniciar(edUsuarioPadrao.Text) then
  begin
    btMigrar.Enabled := False;
    btNaoMigrar.Enabled := False;
    lbStatus.Caption := 'Api: ERRO';
    lbStatus.Font.Color := clRed;
  end
  else
  begin
    lbStatus.Caption := 'Api: OK';
    lbStatus.Font.Color := clBlue;

    edAssunto.Clear;
    for I := Low(Migracao.Assuntos) to High(Migracao.Assuntos) do
      edAssunto.Items.Add(Migracao.Assuntos[I].descricao.ToUpper.Trim);

    edModulo.Clear;
    for I := Low(Migracao.Modulos) to High(Migracao.Modulos) do
      edModulo.Items.Add(Migracao.Modulos[I].descricao.ToUpper.Trim);

    edUsuario.Clear;
    for I := Low(Migracao.Usuarios) to High(Migracao.Usuarios) do
      edUsuario.Items.Add(Migracao.Usuarios[I].email.ToLower.Trim);

    atualizarSolicitacao;
  end;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.btMigrarClick(Sender: TObject);
begin
  Migracao.migrar(FSolicitacao);
  atualizarSolicitacao;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.btNaoMigrarClick(Sender: TObject);
begin
  Migracao.Naomigrar(FSolicitacao);
  atualizarSolicitacao;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.btStatusClick(Sender: TObject);
begin
  FSolicitacao.status := IfThen(FSolicitacao.status = 0, 1);
  btStatus.Caption := IfThen(FSolicitacao.status = 0, 'Em Processamento', 'Cadastrada');
end;

procedure TfrmHwUtilsDxMigracaoFormulario.edAssuntoExit(Sender: TObject);
var
  AAssunto: TAssunto;
  Adescricao: string;
begin
  if edAssunto.ItemIndex > -1 then
    Adescricao := edAssunto.Items[edAssunto.ItemIndex]
  else
    Adescricao := edAssunto.Text;

  FSolicitacao.assunto := Migracao.GetAssunto(ADescricao);
  if Assigned(FSolicitacao.assunto) then
    FSolicitacao.cod_assunto := FSolicitacao.assunto.cod_tp_assunto
  else
  begin
    FSolicitacao.cod_assunto := 0;
    edAssunto.ItemIndex := -1;
  end;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.edModuloExit(Sender: TObject);
var
  AModulo: TModulo;
  Adescricao: string;
begin
  if edModulo.ItemIndex > -1 then
    Adescricao := edModulo.Items[edModulo.ItemIndex]
  else
    Adescricao := edModulo.Text;

  FSolicitacao.modulo := Migracao.GetModulo(Adescricao);
  if Assigned(FSolicitacao.modulo) then
    FSolicitacao.cod_modulo := FSolicitacao.modulo.cod_modulo
  else
  begin
    FSolicitacao.cod_modulo := 0;
    edModulo.ItemIndex := -1;
  end;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.edPesqAssuntoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  AIndex: Integer;
  Aassunto: TAssunto;
begin
  if Key = VK_F3 then
  begin
    if edAssunto.Items.Count = 0 then
      Exit;

    edAssunto.ItemIndex := Migracao.GetAssunto(edPesqAssunto.Text, edAssunto.ItemIndex);
    if edAssunto.ItemIndex > 0 then
      edAssuntoExit(edAssunto);
//    begin
//      FSolicitacao.assunto := Migracao.Assuntos[edAssunto.ItemIndex];
//      FSolicitacao.cod_assunto := Migracao.Assuntos[edAssunto.ItemIndex].cod_tp_assunto;
//    end;
  end;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.edPesqModuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    if edModulo.Items.Count = 0 then
      Exit;

    FSolicitacao.modulo := Migracao.GetModulo(edPesqModulo.Text, edModulo.ItemIndex);
    if Assigned(FSolicitacao.modulo) then
    begin
      FSolicitacao.cod_modulo := FSolicitacao.modulo.cod_modulo;
      edModulo.ItemIndex := edModulo.Items.IndexOf(FSolicitacao.modulo.descricao.ToUpper.Trim);
    end
    else
    begin
      FSolicitacao.cod_modulo := 0;
      edModulo.ItemIndex := -1;
    end;
//    begin
//      FSolicitacao.modulo := Migracao.Modulos[edModulo.ItemIndex];
//      FSolicitacao.cod_modulo := Migracao.Modulos[edModulo.ItemIndex].cod_modulo;
//      FSolicitacao.Advertencia_Modulo := False;
//    end;
  end
  else if Key = VK_F7 then
  begin
    if edModulo.Items.Count = 0 then
      Exit;
    FModuloF7Index := IfThen((FModuloF7Index + 1) >= FModulosF7.Count, 0, FModuloF7Index + 1);

    FSolicitacao.modulo := Migracao.GetModulo(FModulosF7[FModuloF7Index], edModulo.ItemIndex);
    if Assigned(FSolicitacao.modulo) then
    begin
      FSolicitacao.cod_modulo := FSolicitacao.modulo.cod_modulo;
      edModulo.ItemIndex := edModulo.Items.IndexOf(FSolicitacao.modulo.descricao.ToUpper.Trim);
    end
    else
    begin
      FSolicitacao.cod_modulo := 0;
      edModulo.ItemIndex := -1;
    end;

//    if edModulo.ItemIndex > 0 then
//      edModuloExit(edModulo);
//    begin
//      FSolicitacao.modulo := Migracao.Modulos[edModulo.ItemIndex];
//      FSolicitacao.cod_modulo := Migracao.Modulos[edModulo.ItemIndex].cod_modulo;
//      FSolicitacao.Advertencia_Modulo := False;
//    end;
  end;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
    btMigrar.Click
  else if Key = VK_F12 then
    btNaoMigrar.Click;
end;

procedure TfrmHwUtilsDxMigracaoFormulario.FormShow(Sender: TObject);
begin
  lbURL.Caption := '';
  lbDados.Caption := '';
  edLastMessage.Lines.Clear;
  FModulosF7 := TStringList.Create;
  FModulosF7.Add('NOTAS FISCAIS');
  FModulosF7.Add('PRODUTOS');
  FModulosF7.Add('CLIENTES/FORNECEDOR');
  FModulosF7.Add('VENDAS DE PRODUTOS / REQUISIÇÃO');
  FModuloF7Index := -1;
  btStatus.Caption := '';
end;

end.
