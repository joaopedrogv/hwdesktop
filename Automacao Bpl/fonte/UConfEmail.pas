unit UConfEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, ComCtrls, Mask, DB,
  IBCustomDataSet, IBQuery, UClassesBoleto;

type
  TfrmConfEmail = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    GroupBoxOpcoes: TGroupBox;
    ckEnviarEmail: TCheckBox;
    ckEnviarWhatsApp: TCheckBox;
    GroupBoxEmail: TGroupBox;
    lbContatoEmail: TLabel;
    lbAssuntoEmail: TLabel;
    lbMensagemEmail: TLabel;
    EditContatoEmail: TEdit;
    EditAssuntoEmail: TEdit;
    MemoMensagemEmail: TMemo;
    GroupBoxWhatsApp: TGroupBox;
    lbContatoWhatsApp: TLabel;
    lbMensagemWhatsApp: TLabel;
    SpeedButtonAdcWhatsApp: TSpeedButton;
    CheckListContatoWhatsApp: TCheckListBox;
    MemoMensagemWhatsApp: TMemo;
    Panel9: TPanel;
    btConfEmailCancelar: TBitBtn;
    btConfEmailOK: TBitBtn;
    btConfEmailSair: TBitBtn;
    pnTelefoneAvulso: TPanel;
    Label34: TLabel;
    meTelefone: TMaskEdit;
    Panel16: TPanel;
    btAdicionarEmailWhatsAppOK: TBitBtn;
    btAdicionarEmailWhatsAppCancelar: TBitBtn;
    Label1: TLabel;
    cbTipoContato: TComboBox;
    Label2: TLabel;
    EdContato: TEdit;
    sbAdicionarTipoContato: TSpeedButton;
    SpeedButtonRemWhatsApp: TSpeedButton;
    lbAssuntoWhatsApp: TLabel;
    EditAssuntoWhatsApp: TEdit;
    procedure SpeedButtonRemWhatsAppClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sbAdicionarTipoContatoClick(Sender: TObject);
    procedure btConfEmailSairClick(Sender: TObject);
    procedure btAdicionarEmailWhatsAppCancelarClick(Sender: TObject);
    procedure btAdicionarEmailWhatsAppOKClick(Sender: TObject);
    procedure SpeedButtonAdcWhatsAppClick(Sender: TObject);
    procedure ckEnviarWhatsAppClick(Sender: TObject);
    procedure ckEnviarEmailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btConfEmailCancelarClick(Sender: TObject);
    procedure btConfEmailOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    unicoEmailWhatsApp: boolean;
    confEmailWhatsApp: boolean;
    codCliente: Integer;
    contato: string;
  end;

var
  frmConfEmail: TfrmConfEmail;
  ConfEmail: TConfEmail;

implementation

uses
  uDtmAtivo, StrUtils, uDadosIni;

{$R *.dfm}

procedure TfrmConfEmail.btConfEmailOKClick(Sender: TObject);
var
	I: Integer;
  vExisteContatoWhatsApp: boolean;
  vTipoId: Integer;
  vIdContato: Integer;
  vIdentificacao: string;
  vEmail: string;
begin
	try
    if (not ckEnviarEmail.Checked) and (not ckEnviarWhatsApp.Checked) then
    begin
      Application.MessageBox(PChar('Favor selecionar opção desejada (Enviar E-mail / Enviar WhatsApp).'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if ckEnviarEmail.Checked then
    begin
      if trim(EditContatoEmail.Text) = '' then
      begin
      	Application.MessageBox(PChar('E-mail não informado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (EditContatoEmail.CanFocus) then
          EditContatoEmail.SetFocus;
        exit;
      end;

      if trim(EditAssuntoEmail.Text) = '' then
      begin
      	Application.MessageBox(PChar('Assunto (E-mail) não informado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (EditAssuntoEmail.CanFocus) then
          EditAssuntoEmail.SetFocus;
        exit;
      end;

      if trim(MemoMensagemEmail.Text) = '' then
      begin
      	Application.MessageBox(PChar('Mensagem (E-mail) não informado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (MemoMensagemEmail.CanFocus) then
          MemoMensagemEmail.SetFocus;
        exit;
      end;

      vIdentificacao := trim(EditContatoEmail.Text);
      vEmail := '';

      for I := 1 to Length(vIdentificacao) do
      begin
        if (vIdentificacao[I] = ';') or (vIdentificacao[I] = ',') or (vIdentificacao[I] = '|') then
        begin
          if not vDadosIni._ValidarEMail(trim(vEmail)) then
          begin
            Application.MessageBox(PChar('E-mail inválido: ' + trim(vEmail) + '.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (EditContatoEmail.CanFocus) then
              EditContatoEmail.SetFocus;
            exit;
          end;
          vemail := '';
        end
        else
           vemail := vemail + vIdentificacao[I];
      end;
      if not vDadosIni._ValidarEMail(trim(vEmail)) then
      begin
        Application.MessageBox(PChar('E-mail inválido: ' + trim(vEmail) + '.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (EditContatoEmail.CanFocus) then
          EditContatoEmail.SetFocus;
        exit;
      end;
    end;

    if ckEnviarWhatsApp.Checked then
    begin
      vExisteContatoWhatsApp := False;
      for I := 0 to CheckListContatoWhatsApp.Items.Count - 1 do
        if CheckListContatoWhatsApp.Checked[I] then
        begin
          vExisteContatoWhatsApp := True;
          Break;
        end;

      if (not vExisteContatoWhatsApp) then
      begin
        Application.MessageBox(PChar('Fone WhatsApp não informado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (CheckListContatoWhatsApp.CanFocus) then
          CheckListContatoWhatsApp.SetFocus;
        exit;
      end;

      if trim(MemoMensagemWhatsApp.Text) = ''  then
      begin
      	Application.MessageBox(PChar('Mensagem (WhatsApp) não informado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (MemoMensagemWhatsApp.CanFocus) then
          MemoMensagemWhatsApp.SetFocus;
        exit;
      end;

    	for I := 0 to CheckListContatoWhatsApp.Items.Count - 1 do
       if CheckListContatoWhatsApp.Checked[I] then
       begin
       	 vIdentificacao := vDadosIni.getCampoPipe(trim(CheckListContatoWhatsApp.Items[I]), 1);

       	 if trim(vIdentificacao) <> '' then
           if not vDadosIni._ValidarCelular(trim(vIdentificacao)) then
           begin
             Application.MessageBox(PChar('Fone WhatsApp selecionado inválido: ' + trim(vIdentificacao)), 'Atenção', MB_ICONINFORMATION + MB_OK);
             if (Self.Enabled) and (Self.Visible) and (CheckListContatoWhatsApp.CanFocus) then
               CheckListContatoWhatsApp.SetFocus;
             exit;
           end;
       end;
    end;

    if not vDadosIni.confEmaiWhatsApp(
    	cBoleto,
    	codCliente,
      trim(contato),
      ckEnviarEmail.Checked,
      ckEnviarWhatsApp.Checked,
      CheckListContatoWhatsApp) then
        exit;

    ModalResult := mrOk;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Falha ao confirmar email / whatsapp: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      vDadosIni.registraErro('Falha ao confirmar email / whatsapp: ' + e.Message);
    end;
  end;
end;

procedure TfrmConfEmail.btConfEmailCancelarClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmConfEmail.btAdicionarEmailWhatsAppOKClick(Sender: TObject);
var
  vTipoId: Integer;
  vTipo: string;
  vtemp: string;
begin
	try
    if trim(cbTipoContato.Text) = '' then
    begin
      Application.MessageBox('Tipo do contato não informado.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (cbTipoContato.CanFocus) then
        cbTipoContato.SetFocus;
      exit;
    end;

    if (trim(meTelefone.Text) = '')
      or (vDadosIni.apenasNumeros(trim(meTelefone.Text)) = '')
      or (trim(meTelefone.Text) = '(  )     -    ') then
    begin
      Application.MessageBox('Telefone não informado.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (meTelefone.CanFocus) then
        meTelefone.SetFocus;
      exit;
    end;

    vtemp := trim(Copy(trim(cbTipoContato.Items[cbTipoContato.ItemIndex]),
    	Pos('|', trim(cbTipoContato.Items[cbTipoContato.ItemIndex])) + 1,
      Length(trim(cbTipoContato.Items[cbTipoContato.ItemIndex])) -
      	Pos('|', trim(cbTipoContato.Items[cbTipoContato.ItemIndex])) + 1));

    vTipoId := StrToInt(vDadosIni.apenasNumeros(trim(vtemp)));
    vTipo   := trim(cbTipoContato.Items[cbTipoContato.ItemIndex]);

    if not vDadosIni.inserirContatoCliente(
      codCliente,
      vTipoId,
      vTipo,
      trim(EdContato.Text),
      vDadosIni.apenasNumeros(trim(meTelefone.Text)),
      CheckListContatoWhatsApp) then
      	exit;

    TForm(pnTelefoneAvulso.Parent).ModalResult := IDOK;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Falha ao adicionar contato whatsapp: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      vDadosIni.registraErro('Falha ao adicionar contato whatsapp: ' + e.Message);
    end;
  end;
end;

procedure TfrmConfEmail.btAdicionarEmailWhatsAppCancelarClick(Sender: TObject);
begin
	TForm(pnTelefoneAvulso.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmConfEmail.btConfEmailSairClick(Sender: TObject);
begin
	ModalResult := mrAbort;
end;

procedure TfrmConfEmail.ckEnviarEmailClick(Sender: TObject);
begin
	lbContatoEmail.Enabled := ckEnviarEmail.Checked;
  EditContatoEmail.Enabled := ckEnviarEmail.Checked;
  lbAssuntoEmail.Enabled := ckEnviarEmail.Checked;
  EditAssuntoEmail.Enabled := ckEnviarEmail.Checked;
  lbMensagemEmail.Enabled := ckEnviarEmail.Checked;
  MemoMensagemEmail.Enabled := ckEnviarEmail.Checked;
end;

procedure TfrmConfEmail.ckEnviarWhatsAppClick(Sender: TObject);
begin
	lbContatoWhatsApp.Enabled := ckEnviarWhatsApp.Checked;
  CheckListContatoWhatsApp.Enabled := ckEnviarWhatsApp.Checked;
  lbMensagemWhatsApp.Enabled := ckEnviarWhatsApp.Checked;
  MemoMensagemWhatsApp.Enabled := ckEnviarWhatsApp.Checked;
  SpeedButtonAdcWhatsApp.Enabled := ckEnviarWhatsApp.Checked;
  SpeedButtonRemWhatsApp.Enabled := ckEnviarWhatsApp.Checked;
end;

procedure TfrmConfEmail.FormCreate(Sender: TObject);
begin
	ConfEmail := TConfEmail.create;
end;

procedure TfrmConfEmail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if PageControl1.ActivePage = TabSheet1 then
  begin
    if Key = VK_F2 then
      ckEnviarEmail.Checked := not ckEnviarEmail.Checked
    else if Key = VK_F3 then
      ckEnviarWhatsApp.Checked := not ckEnviarWhatsApp.Checked
  end;
end;

procedure TfrmConfEmail.FormShow(Sender: TObject);
var
	I: Integer;
  vWhatsAppInf: boolean;
begin
	vWhatsAppInf := false;

  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;

  for I := 0 to CheckListContatoWhatsApp.Items.Count - 1 do
  	if CheckListContatoWhatsApp.Checked[I] then
    begin
  		vWhatsAppInf := true;
      Break;
    end;

  if (unicoEmailWhatsApp)
  	or (confEmailWhatsApp)
    or ((trim(MemoMensagemEmail.Text) = '') and (not vWhatsAppInf)) then
  begin
  	vDadosIni.retornaEmail(
      codCliente,
      EditContatoEmail);

  	vDadosIni.retornaCheckListContato(
      codCliente,
      cBoleto,
      CheckListContatoWhatsApp);
  end
  else if (trim(MemoMensagemEmail.Text) = '') then
  begin
    vDadosIni.retornaEmail(
      codCliente,
      EditContatoEmail);
  end
  else if (not vWhatsAppInf) then
  begin
    vDadosIni.retornaCheckListContato(
      codCliente,
      cBoleto,
      CheckListContatoWhatsApp);
  end;

  TabSheet1.Show;

  if (Self.Enabled) and (Self.Visible) and (btConfEmailOK.CanFocus) then
    btConfEmailOK.SetFocus;
end;

procedure TfrmConfEmail.sbAdicionarTipoContatoClick(Sender: TObject);
var
	vtemp: string;
  I: Integer;
begin
	try
    if not InputQuery('Tipo de contato',
      'Informe o tipo de contato', vtemp) then
      Exit;

    if trim(vtemp) = '' then
    begin
    	Application.MessageBox(PChar('Tipo de contato não informado.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;
    
    if not vDadosIni.inserirTipoContato(
      trim(vtemp),
      cbTipoContato) then
    		exit;

  except on E: Exception do
    begin
      Application.MessageBox(PChar('Falha ao adicionar tipo de contato whatsapp: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      vDadosIni.registraErro('Falha ao adicionar tipo de contato whatsapp: ' + e.Message);
    end;
  end;
end;

procedure TfrmConfEmail.SpeedButtonAdcWhatsAppClick(Sender: TObject);
begin
	if not ConfEmail.Auditor.Processo('CLI260').Inserir.Permitido then
    Exit;

	cbTipoContato.Clear;
  EdContato.Text := '';
	meTelefone.Text := '';

  vDadosIni.retornaComboboxTipoContato(
    cbTipoContato
  );

  if not vDadosIni.abreForm('Informe o telefone', pnTelefoneAvulso, TabSheet2) then
  	exit;
end;

procedure TfrmConfEmail.SpeedButtonRemWhatsAppClick(Sender: TObject);
begin
	if not vDadosIni.removerContatoCliente(
  	codCliente,
    CheckListContatoWhatsApp) then
    	exit;

	CheckListContatoWhatsApp.DeleteSelected;
end;

end.
