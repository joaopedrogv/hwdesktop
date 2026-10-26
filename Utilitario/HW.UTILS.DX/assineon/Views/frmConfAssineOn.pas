unit frmConfAssineOn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls;

type
  TformConfAssineOn = class(TForm)
    PageControl1: TPageControl;
    ts_createUser: TTabSheet;
    ts_problem: TTabSheet;
    Panel1: TPanel;
    pn_mensagem: TPanel;
    Label1: TLabel;
    ed_name: TMaskEdit;
    ed_email: TMaskEdit;
    Label2: TLabel;
    ed_senha: TMaskEdit;
    Label4: TLabel;
    Label3: TLabel;
    lb_cnpj: TLabel;
    CheckBox1: TCheckBox;
    LinkLabel1: TLinkLabel;
    Panel2: TPanel;
    mm_problem: TMemo;
    ts_config: TTabSheet;
    pn_config: TPanel;
    Panel4: TPanel;
    linkAssineOn: TLinkLabel;
    Panel5: TPanel;
    Bevel1: TBevel;
    bt_createUser: TBitBtn;
    Panel6: TPanel;
    Bevel2: TBevel;
    bt_configureNewToken: TBitBtn;
    Sair: TBitBtn;
    Panel7: TPanel;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    ts_tag_cliente: TTabSheet;
    Panel8: TPanel;
    GroupBox1: TGroupBox;
    Panel9: TPanel;
    pn_bts_tagedit_cliente: TPanel;
    bt_edit_revision_cliente: TSpeedButton;
    bt_tags_revision_cliente: TSpeedButton;
    pn_cliente: TPanel;
    lb_cliente: TLabel;
    list_revisions: TComboBox;
    pn_bts_savecanc_cliente: TPanel;
    bt_save_revision_cliente: TSpeedButton;
    Panel12: TPanel;
    GroupBox2: TGroupBox;
    Panel13: TPanel;
    pn_bts_tagedit_colab: TPanel;
    bt_edit_revision_colab: TSpeedButton;
    bt_tags_revision_colab: TSpeedButton;
    pn_colab: TPanel;
    lb_colab: TLabel;
    pn_bts_savecanc_colab: TPanel;
    bt_save_revision_colab: TSpeedButton;
    Panel11: TPanel;
    Panel18: TPanel;
    cb_revision_conf: TComboBox;
    Panel28: TPanel;
    Bevel4: TBevel;
    bt_save_revision_and_tags: TBitBtn;
    lb_alert_revision: TLabel;
    bt_cancel_revision_cliente: TSpeedButton;
    bt_cancel_revision_colab: TSpeedButton;
    Panel3: TPanel;
    Label5: TLabel;
    list_tags: TListBox;
    Panel10: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    list_tables: TComboBox;
    list_fields: TListBox;
    Label8: TLabel;
    lb_acessar_assineon: TLabel;
    lb_login_token: TLabel;
    bt_copiar_link: TSpeedButton;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bt_createUserClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure bt_configureNewTokenClick(Sender: TObject);
    procedure linkAssineOnLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure bt_edit_revision_clienteClick(Sender: TObject);
    procedure bt_cancel_revision_clienteClick(Sender: TObject);
    procedure bt_save_revision_clienteClick(Sender: TObject);
    procedure bt_save_revision_colabClick(Sender: TObject);
    procedure bt_cancel_revision_colabClick(Sender: TObject);
    procedure bt_edit_revision_colabClick(Sender: TObject);
    procedure list_tablesChange(Sender: TObject);
    procedure list_tagsClick(Sender: TObject);
    procedure bt_tags_revision_clienteClick(Sender: TObject);
    procedure lb_acessar_assineonClick(Sender: TObject);
    procedure bt_copiar_linkClick(Sender: TObject);
    procedure list_fieldsDblClick(Sender: TObject);
    procedure bt_save_revision_and_tagsClick(Sender: TObject);
    procedure bt_tags_revision_colabClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure ValidateMe();
    procedure FillConfig();
    procedure FillConfigTag(revisionId: string);
  public
    //
  end;

var
  formConfAssineOn: TformConfAssineOn;

implementation

{$R *.dfm}

uses
  AssineonRepo,
  ApiAssineOn,
  hw_win_utils,
  hw_utils,
  BaseConsts,
  AccountModel,
  Winapi.ShellAPI,
  Vcl.Clipbrd,
  System.StrUtils,
  TemplateModel,
  TablesModel,
  ao_revisions_tags_class;

procedure TformConfAssineOn.BitBtn2Click(Sender: TObject);
begin
  PageControl1.ActivePage := ts_config;
end;

procedure TformConfAssineOn.bt_cancel_revision_clienteClick(
  Sender: TObject);
begin
  lb_cliente.Visible := True;
  list_revisions.Visible := False;
  list_revisions.Parent := pn_config;
  pn_bts_savecanc_cliente.Visible := False;
  pn_bts_tagedit_cliente.Visible := True;
end;

procedure TformConfAssineOn.bt_cancel_revision_colabClick(Sender: TObject);
begin
  lb_colab.Visible := True;
  list_revisions.Visible := False;
  list_revisions.Parent := pn_config;
  pn_bts_savecanc_colab.Visible := False;
  pn_bts_tagedit_colab.Visible := True;
end;

procedure TformConfAssineOn.bt_configureNewTokenClick(Sender: TObject);
const D = 'bt_configureNewToken';
begin
  var newToken := '';
  if not InputQuery('Novo token', 'Copie e cole o novo token aqui', newToken) then
    Exit;

  if newToken.Trim.IsEmpty() then
    if ShowConfirmacao('Token em branco. Deseja tentar cadastrar o usuário novamente') = IDYES then
    begin
      PageControl1.ActivePage := ts_createUser;
      exit;
    end;

  try
    var integration := TIntegrationModel.Create;
    integration.token := newToken;
    TAssineOnRepoSingleton.GetInstance().PostAccount(integration);

    ValidateMe;

  except on E: Exception do
    begin
      LogApp.Error('%s.%s - %s', [Self.ClassName, D, E.Message]);
      ShowErro(StrConcat(['Erro ao salvar novo token no banco de dados. %s', _DLB, E.Message]), [MSG_SUPORTE])
    end;
  end;
end;

procedure TformConfAssineOn.bt_copiar_linkClick(Sender: TObject);
begin
  clipboard.astext := linkAssineOn.Hint;
end;

procedure TformConfAssineOn.bt_createUserClick(Sender: TObject);
const D = 'bt_createUserClick';
begin
  if not CheckBox1.Checked then
  begin
    ShowErro('Por favor leia e aceite os termos de privacidade. Termo encontrado em https://assineon.com.br/privacy-terms');
    Exit;
  end;

  var newUser := TNewAccountModel.Create;

  newUser.name := ed_name.Text;
  newUser.email := ed_email.Text;
  newUser.password := ed_senha.Text;
  newUser.cnpj := ed_senha.Text;
  newUser.privacyTerms := CheckBox1.Checked;
  newUser.hwTrigger := ASSINEON_KEY_TRIGGER;

  try
    var integration := TApiAssineOnSingleton.GetInstance().PostNewUser(newUser);

    if (Assigned(integration)) and (not integration.token.Trim.IsEmpty) then
    begin
      TAssineOnRepoSingleton.GetInstance().PostAccount(integration);
      ValidateMe;
    end;

  except on E: Exception do
    begin
      LogApp.Error('%s.%s - %s', [Self.ClassName, D, E.Message]);
      ShowErro(StrConcat(['Erro ao criar usuário no AssineOn. %s', _DLB, E.Message]), [MSG_SUPORTE]);
    end;
  end;
end;

procedure TformConfAssineOn.bt_edit_revision_clienteClick(Sender: TObject);
begin
  bt_cancel_revision_colab.Click;
  list_revisions.Parent := pn_cliente;
  list_revisions.Visible := True;
  lb_cliente.Visible := False;
  pn_bts_savecanc_cliente.Visible := True;
  pn_bts_tagedit_cliente.Visible := False;

  var revisionId := TAssineOnRepoSingleton.GetInstance().GetAccount.ClienteRevisaoId.Trim;

  for var I := 0 to list_revisions.Items.Count - 1 do
     if (list_revisions.Items.Objects[I] as TRevisionModel).revisionId.Trim.Equals(revisionId) then
     begin
       list_revisions.ItemIndex := I;
       Break;
     end;
end;

procedure TformConfAssineOn.bt_edit_revision_colabClick(Sender: TObject);
begin
  bt_cancel_revision_cliente.Click;
  list_revisions.Parent := pn_colab;
  list_revisions.Visible := True;
  lb_colab.Visible := False;
  pn_bts_savecanc_colab.Visible := True;
  pn_bts_tagedit_colab.Visible := False;

  var revisionId := TAssineOnRepoSingleton.GetInstance().GetAccount.ColaboradorRevisaoId.Trim;

  for var I := 0 to list_revisions.Items.Count - 1 do
     if (list_revisions.Items.Objects[I] as TRevisionModel).revisionId.Trim.Equals(revisionId) then
     begin
       list_revisions.ItemIndex := I;
       Break;
     end;
end;

procedure TformConfAssineOn.bt_save_revision_and_tagsClick(
  Sender: TObject);
begin
  try
    var selRevision := (cb_revision_conf.Items.Objects[0] as TRevisionModel);
    var revision := TRevisionHwModel.Create;

    revision.templateId := selRevision.templateId;
    revision.revisionId := selRevision.revisionId;
    revision.name := selRevision.name;
    revision.validity := selRevision.validity;
    revision.version := selRevision.version;
    revision.isActive := selRevision.isActive;
    revision.tagList := selRevision.tagList;

    revision.tagsHW := [];
    for var I := 0 to list_tags.Items.Count - 1 do
      revision.tagsHW := revision.tagsHW + [(list_tags.Items.Objects[I] as TAo_revisions_tags_class)];

    if TAssineOnRepoSingleton.GetInstance().PostRevision(revision) then
      PageControl1.ActivePage := ts_config;

  except on E: Exception do
    begin
      ShowErro(StrConcat([E.Message, _DLB, MSG_SUPORTE]));
    end;
  end;
end;

procedure TformConfAssineOn.bt_save_revision_clienteClick(Sender: TObject);
begin
  if list_revisions.ItemIndex < 0 then
    Exit;

  var revision := list_revisions.Items.Objects[list_revisions.ItemIndex] as TRevisionModel;

  if TAssineOnRepoSingleton.GetInstance().SetRevisionId(revision.revisionId, prCliente) then
  begin
    lb_cliente.Caption := Format('%s - Rev %d', [revision.name, revision.version]) + IfThen(not revision.isActive, ' ** inativa');
    bt_cancel_revision_cliente.Click;
  end;

end;

procedure TformConfAssineOn.bt_save_revision_colabClick(Sender: TObject);
begin
  if list_revisions.ItemIndex < 0 then
    Exit;

  var revision := list_revisions.Items.Objects[list_revisions.ItemIndex] as TRevisionModel;

  if TAssineOnRepoSingleton.GetInstance().SetRevisionId(revision.revisionId, prColaborador) then
  begin
    lb_colab.Caption := Format('%s - Rev %d', [revision.name, revision.version]) + IfThen(not revision.isActive, ' ** inativa');
    bt_cancel_revision_colab.Click;
  end;
end;

procedure TformConfAssineOn.bt_tags_revision_clienteClick(Sender: TObject);
begin
  var revisionId := TAssineOnRepoSingleton.GetInstance().GetAccount.ClienteRevisaoId.Trim;

  FillConfigTag(revisionId);

  PageControl1.ActivePage := ts_tag_cliente;
end;

procedure TformConfAssineOn.bt_tags_revision_colabClick(Sender: TObject);
begin
  var revisionId := TAssineOnRepoSingleton.GetInstance().GetAccount.ColaboradorRevisaoId.Trim;

  FillConfigTag(revisionId);

  PageControl1.ActivePage := ts_tag_cliente;
end;

procedure TformConfAssineOn.FillConfig;
const D = 'FillConfig';
begin

  var repo := TAssineOnRepoSingleton.GetInstance();
  var api := TApiAssineOnSingleton.GetInstance();

  lb_alert_revision.Visible := False;
  list_revisions.Visible := False;
  list_revisions.Clear;
  lb_cliente.Caption := '** Nenhum modelo selecionado ainda***';
  lb_colab.Caption := lb_cliente.Caption;
  pn_bts_savecanc_cliente.Visible := False;
  pn_bts_tagedit_cliente.Visible := True;
  pn_bts_savecanc_colab.Visible := False;
  pn_bts_tagedit_colab.Visible := True;

  try

    var page := 1;
    var revisions := api.GetRevisions(page, 50);
    var accountDb := repo.GetAccount;


    if Length(revisions) = 0 then
    begin
      lb_alert_revision.Caption := 'Nenhum modelo cadastrado ainda. Por favor acesse o AssineOn no link acima para cadastrar seu primeiro modelo';
      lb_alert_revision.Visible := True;
      Exit;
    end;

    while Length(revisions) > 0 do
    begin
      for var revision in revisions do
      begin
        if revision.isActive then
          list_revisions.AddItem(Format('%s - Rev %d - Validade %d dias', [revision.name, revision.version, revision.validity]), revision);

        if revision.revisionId = accountDb.ClienteRevisaoId then
          lb_cliente.Caption := Format('%s - Rev %d', [revision.name, revision.version]) + IfThen(not revision.isActive, ' ** inativa');
        if revision.revisionId = accountDb.ColaboradorRevisaoId then
          lb_colab.Caption := Format('%s - Rev %d', [revision.name, revision.version]) + IfThen(not revision.isActive, ' ** inativa');
      end;

      page := page + 1;
      revisions := api.GetRevisions(page, 50);
    end;

    if list_revisions.Items.Count = 0 then
    begin
      lb_alert_revision.Caption := 'Nenhum modelo "Ativo" no AssineOn. Por favor acesse o AssineOn no link acima para cadastrar um modelo';
      lb_alert_revision.Visible := True;
    end;

//    lb_cnpj.cli

  except on E: Exception do
    begin
      LogApp.Error('%s.%s - %s', [Self.ClassName, D, E.Message]);
      ShowErro(StrConcat(['Erro ao criar usuário no AssineOn. %s', _DLB, E.Message]), [MSG_SUPORTE]);
    end;
  end;
end;

procedure TformConfAssineOn.FillConfigTag(revisionId: string);
begin
//  bt_cancel_revision_colab.Click;
//  list_revisions.Parent := pn_cliente;
//  list_revisions.Visible := True;
//  lb_cliente.Visible := False;
//  pn_bts_savecanc_cliente.Visible := True;
//  pn_bts_tagedit_cliente.Visible := False;
  var api := TApiAssineOnSingleton.GetInstance();

  var revision := api.GetRevision(revisionId);
  var defaultTags := api.GetDefaultsTags();

  if (not Assigned(revision)) or revision.revisionId.Trim.IsEmpty then
  begin
    ShowAtencao('Api não retornou o Modelo/Revisão atualizado para configurar');
    ValidateMe();
    Exit;
  end;

  cb_revision_conf.Clear;
  cb_revision_conf.AddItem(Format('%s - Rev %d', [revision.name, revision.version]) + IfThen(not revision.isActive, ' ** inativa'), revision);
  cb_revision_conf.ItemIndex := 0;

  var repo := TAssineOnRepoSingleton.GetInstance();

  var tags := repo.GetRevisionTagList(revision);

  list_tags.Clear;
  for var tag in tags do
    if defaultTags.IndexOf(tag.name) = -1 then
      list_tags.AddItem(Format('%s - [%s - %s]', [tag.name, tag.tablename, tag.fieldname]), tag);

  var tabs := repo.GetTableList;

  list_tables.Clear;
  for var tab in tabs do
    list_tables.AddItem(tab.name, tab);

end;

procedure TformConfAssineOn.FormShow(Sender: TObject);
begin
  ts_createUser.TabVisible := False;
  ts_problem.TabVisible := False;
  ts_config.TabVisible := False;
  ts_tag_cliente.TabVisible := False;
  ts_createUser.TabVisible := False;

  ValidateMe;
end;

procedure TformConfAssineOn.lb_acessar_assineonClick(Sender: TObject);
begin
  var token := TApiAssineOnSingleton.GetInstance().GetLoginToken();
  if (not Assigned(token)) or (token.loginUrl.IsEmpty) then
  begin
    ShowAtencao('Api não retornou URL de achesso');
    Exit;
  end;

  lb_login_token.Caption := 'Seu código de acesso é ' + token.code;
  linkAssineOn.Caption := '<a href="' + token.loginUrl +  '">Ir para o site</a>';
  linkAssineOn.Hint := token.loginUrl;

  lb_login_token.Visible := True;
  linkAssineOn.Visible := True;
  bt_copiar_link.Visible := True;
end;

procedure TformConfAssineOn.linkAssineOnLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
end;

procedure TformConfAssineOn.list_fieldsDblClick(Sender: TObject);
begin
  if list_tags.ItemIndex = -1 then
    Exit;

  if list_tables.ItemIndex = -1 then
    Exit;

  if list_fields.ItemIndex = -1 then
    Exit;

  var tag := (list_tags.Items.Objects[list_tags.ItemIndex] as TAo_revisions_tags_class);

  tag.tablename := list_tables.Items[list_tables.ItemIndex];
  tag.fieldname := list_fields.Items[list_fields.ItemIndex];

  list_tags.Items[list_tags.ItemIndex] := Format('%s - [%s - %s]', [tag.name, tag.tablename, tag.fieldname]);
end;

procedure TformConfAssineOn.list_tablesChange(Sender: TObject);
begin
  if list_tables.ItemIndex = -1 then
    Exit;

  list_fields.Clear;
  for var value in ( list_tables.Items.Objects[list_tables.ItemIndex] as TTable).fieldNames do
    list_fields.Items.Add(value);

//  list_fields.Items.Text := ( list_tables.Items.Objects[list_tables.ItemIndex] as TTable).fieldNames.Text;
end;

procedure TformConfAssineOn.list_tagsClick(Sender: TObject);
begin
  if list_tags.ItemIndex = -1 then
    Exit;

  var tableName := (list_tags.Items.Objects[list_tags.ItemIndex] as TAo_revisions_tags_class).tablename;
  var fieldName := (list_tags.Items.Objects[list_tags.ItemIndex] as TAo_revisions_tags_class).fieldname;

  if list_tables.Items.IndexOf(tableName) >= 0 then
    list_tables.ItemIndex := list_tables.Items.IndexOf(tableName);

  if list_tables.ItemIndex = -1 then
    Exit;

  list_fields.Clear;
  for var value in ( list_tables.Items.Objects[list_tables.ItemIndex] as TTable).fieldNames do
    list_fields.Items.Add(value);

  if list_fields.Items.IndexOf(fieldName) >= 0 then
    list_fields.ItemIndex := list_fields.Items.IndexOf(fieldName);
end;

procedure TformConfAssineOn.SairClick(Sender: TObject);
begin
  Close;
end;

procedure TformConfAssineOn.ValidateMe;
begin

  mm_problem.Lines.Clear;
  try

    var repo := TAssineOnRepoSingleton.GetInstance();
    var accountDb := repo.GetAccount();

    var api := TApiAssineOnSingleton.GetInstance();

    if accountDb.bearerToken = '' then
    begin

      var integration := api.GetIntegration(accountDb.email);

      if (not Assigned(integration)) or integration.token.Trim.IsEmpty then
      begin
        ed_name.Text := accountDb.cnpj;
        ed_email.Text := accountDb.email;
        ed_senha.Text := TGUID.NewGuid().ToString.Substring(1, 20);
        lb_cnpj.Caption := accountDb.cnpj;
        CheckBox1.Checked := False;
        PageControl1.ActivePage := ts_createUser;
        Exit;
      end
      else
      begin
        accountDb.bearerToken := integration.token;
        repo.PostAccount(integration);
      end;
    end;

//    if accountDb.bearerToken <> 'qw' then
//    raise Exception.Create('Error aldj asjd kaMessage');

    api.bearerToken := accountDb.bearerToken;
    var me := api.GetMe();

    if not Assigned(me) then
    begin
      mm_problem.Lines.Add(Format('AssineOn não retornou dados de usuário. %s', [MSG_SUPORTE]));
      PageControl1.ActivePage := ts_problem;
    end
    else if not me.email.ToLower().Equals(accountDb.email.ToLower()) then
    begin
      mm_problem.Lines.Add('Cadastro do AssineOn não corresponde ao cadastro da empresa');
      PageControl1.ActivePage := ts_problem;
    end
    else
    begin
      PageControl1.ActivePage := ts_config;
      FillConfig;
    end;


  except on E: Exception do
    begin
      LogApp.Error('%s.ValidateMe - %s', [Self.ClassName, E.Message]);
      mm_problem.Lines.Add(Format(StrConcat(['Erro ao obter dados usuário no AssineOn. %s', _DLB, E.Message]), [MSG_SUPORTE]));
      PageControl1.ActivePage := ts_problem;
      Exit;
    end;
  end;
end;

end.
