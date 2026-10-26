unit uContato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, CheckLst, DBCtrls, Mask, 
  IBQuery, uDadosIni;

type
  TFrmContato = class(TForm)
    Panel29: TPanel;
    btContatoAplicativoOK: TBitBtn;
    btContatoAplicativoCancelar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    lbTelefone: TLabel;
    lbTipoContato: TLabel;
    lbContato: TLabel;
    sbAdicionarTipoContato: TSpeedButton;
    meTelefone: TMaskEdit;
    cbTipoContato: TComboBox;
    EdContato: TEdit;
    Panel2: TPanel;
    lb_contato_pla_aplicativo: TLabel;
    lb_contato_pla_contato: TLabel;
    lb_contato_pla_identificacao: TLabel;
    lb_contrato_pla_tipos_contato: TLabel;
    sbAdicionarTipoContatoAplicativo: TSpeedButton;
    ed_contato_pla_contato: TEdit;
    ed_contato_pla_identificacao: TMaskEdit;
    ck_contrato_pla_tipos_contato: TCheckListBox;
    ed_contato_pla_aplicativo: TComboBox;
    lbEmail: TLabel;
    meEmail: TEdit;
    btSelectAllTipoContato: TSpeedButton;
    btUnSelectAllTipoContato: TSpeedButton;
    procedure ed_contato_pla_identificacaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure meTelefoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUnSelectAllTipoContatoClick(Sender: TObject);
    procedure btSelectAllTipoContatoClick(Sender: TObject);
    procedure ed_contato_pla_aplicativoExit(Sender: TObject);
    procedure sbAdicionarTipoContatoAplicativoClick(Sender: TObject);
    procedure sbAdicionarTipoContatoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btContatoAplicativoCancelarClick(Sender: TObject);
    procedure btContatoAplicativoOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codcliente: Integer;
    origemenv: TOrigemEnv;
    tipocontato: TTipoContato;
    aplicativo: string;
    idcontado: Integer;
  end;

var
  FrmContato: TFrmContato;

implementation

uses
  uDtmAtivo, StrUtils;

{$R *.dfm}

procedure TFrmContato.btContatoAplicativoCancelarClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TFrmContato.btContatoAplicativoOKClick(Sender: TObject);
var
	vSel: Boolean;
  I: Integer;
  vSemTelefone: Boolean;
  vSemEmail: Boolean;
begin
  if PageControl1.ActivePage = TabSheet1 then
  begin
		if trim(cbTipoContato.Text) = '' then
    begin
      Application.MessageBox('Tipo do contato não informado.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (cbTipoContato.CanFocus) then
        cbTipoContato.SetFocus;
      exit;
    end;

    vSemTelefone := (trim(meTelefone.Text) = '') or (vDadosIni.apenasNumeros(trim(meTelefone.Text)) = '') or (trim(meTelefone.Text) = '(  )     -    ');
    vSemEmail := trim(meEmail.Text) = '';

    if (vSemTelefone) and (vSemEmail) then
    begin
      Application.MessageBox('Telefone ou E-mail devem ser informados.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (meTelefone.CanFocus) then
        meTelefone.SetFocus;
      exit;
    end;

    if not vSemTelefone then
    begin
      if (not vDadosIni._ValidarCelular(trim(meTelefone.Text))) then
      begin
        Application.MessageBox(PChar('WhatsApp "' + trim(meTelefone.Text) + '" informado inválido.'), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (meTelefone.CanFocus) then
          meTelefone.SetFocus;
        Exit;
      end;
    end;

    if not vSemEmail then
    begin
      if (not vDadosIni._ValidarEMail(trim(meEmail.Text))) then
      begin
        Application.MessageBox(PChar('E-mail "' + trim(meEmail.Text) + '" informado inválido.'), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (meEmail.CanFocus) then
          meEmail.SetFocus;
        Exit;
      end;
    end;

    if codcliente > 0 then
    begin
      if not vDadosIni.inserirContatoCliente(
        codcliente,
        origemenv,
        trim(cbTipoContato.Text),
        trim(EdContato.Text),
        vDadosIni.apenasNumeros(trim(meTelefone.Text)),
        trim(meEmail.Text),
        idcontado) then
          exit;
    end;

   if (tipocontato <> cTpContatoOutros) and (vDadosIni.apenasNumeros(trim(meTelefone.Text)) <> '') then
  	begin
    	for I := 0 to vDadosIni.vListaContatoTemp.Count - 1 do
        if (ContainsStr(vDadosIni.vListaContatoTemp[I], 'WHATSAPP'))
          and (ContainsStr(vDadosIni.vListaContatoTemp[I], vDadosIni.apenasNumeros(trim(meTelefone.Text)))) then
        begin
          vDadosIni.vListaContatoTemp.Delete(I);
          Break;
        end;
    end;

  	if (tipocontato <> cTpContatoOutros) and (trim(meEmail.Text) <> '') then
   begin
      for I := 0 to vDadosIni.vListaContatoTemp.Count - 1 do
        if (ContainsStr(vDadosIni.vListaContatoTemp[I], 'E-MAIL'))
          and (ContainsStr(vDadosIni.vListaContatoTemp[I], trim(meEmail.Text))) then
        begin
          vDadosIni.vListaContatoTemp.Delete(I);
          Break;
        end;
    end;
  end
  else
  begin
    vSel := False;
  	 for I := 0 to ck_contrato_pla_tipos_contato.Items.Count - 1 do
    	if ck_contrato_pla_tipos_contato.Checked[I] then
      begin
      	vSel := True;
        Break;
      end;

    if trim(ed_contato_pla_aplicativo.Text) = '' then
    begin
      Application.MessageBox('Aplicativo não informado.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_aplicativo.CanFocus) then
        ed_contato_pla_aplicativo.SetFocus;
      exit;
    end;

    if trim(ed_contato_pla_contato.Text) = '' then
    begin
      Application.MessageBox('Contato não informado.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_contato.CanFocus) then
        ed_contato_pla_contato.SetFocus;
      exit;
    end;

    if trim(ed_contato_pla_identificacao.Text) = '' then
    begin
      Application.MessageBox(PChar(StringReplace(lb_contato_pla_identificacao.Caption, ':', '', [rfReplaceAll]) + ' não informado.'), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
        ed_contato_pla_identificacao.SetFocus;
      exit;
    end;

    if (codcliente > 0) and (tipocontato <> cTpContatoOutros) then
      if ck_contrato_pla_tipos_contato.Count <= 0 then
      begin
        Application.MessageBox(PChar('Tipo de contato não informado.'), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (ck_contrato_pla_tipos_contato.CanFocus) then
          ck_contrato_pla_tipos_contato.SetFocus;
        exit;
      end;

    if (codcliente > 0) and (tipocontato <> cTpContatoOutros) then
      if not vSel then
      begin
        Application.MessageBox(PChar('Tipo de contato não informado.'), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (ck_contrato_pla_tipos_contato.CanFocus) then
          ck_contrato_pla_tipos_contato.SetFocus;
        exit;
      end;

    if trim(ed_contato_pla_aplicativo.Text) = 'E-MAIL' then
  	 begin
      if trim(ed_contato_pla_identificacao.Text) <> '' then
      begin
        if (not vDadosIni._ValidarEMail(trim(ed_contato_pla_identificacao.Text))) then
        begin
        	 Application.MessageBox(PChar('E-mail "' + trim(ed_contato_pla_identificacao.Text) + '" informado inválido.'), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        	 if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
        		ed_contato_pla_identificacao.SetFocus;
          Exit;
        end;
      end;
    end
    else if trim(ed_contato_pla_aplicativo.Text) = 'WHATSAPP' then
    begin
    	if trim(ed_contato_pla_identificacao.Text) <> '' then
      begin
        if (not vDadosIni._ValidarCelular(trim(ed_contato_pla_identificacao.Text))) then
        begin
        	 Application.MessageBox(PChar('WhatsApp "' + trim(ed_contato_pla_identificacao.Text) + '" informado inválido.'), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        	 if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
        		ed_contato_pla_identificacao.SetFocus;
          Exit;
        end;
      end;
    end
    else if trim(ed_contato_pla_aplicativo.Text) = 'TELEGRAM' then
    begin
    	if trim(ed_contato_pla_identificacao.Text) <> '' then
      begin
        if (vDadosIni.apenasNumeros(trim(ed_contato_pla_identificacao.Text)) <> trim(ed_contato_pla_identificacao.Text)) then
        begin
        	 Application.MessageBox(PChar('Telegram "' + trim(ed_contato_pla_identificacao.Text) + '" informado inválido, informar somente números.'), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        	 if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
        		ed_contato_pla_identificacao.SetFocus;
          Exit;
        end;
      end;
    end;

  	 if (codcliente <= 0) or (tipocontato = cTpContatoOutros) then
    begin
      if not Assigned(vDadosIni.vListaContatoTemp) then
      	vDadosIni.vListaContatoTemp := TStringList.Create;

      if vDadosIni.existeContato(
      	codcliente,
        vDadosIni.retornaCodAplicativo(trim(ed_contato_pla_aplicativo.Text)),
        trim(ed_contato_pla_identificacao.Text)) then
        	Exit;

      vDadosIni.vListaContatoTemp.Add(
        trim(ed_contato_pla_aplicativo.Text) + ' - ' +
        trim(ed_contato_pla_contato.Text) + ' - ' +
        trim(ed_contato_pla_identificacao.Text));
    end
    else
    begin
      if not vDadosIni.inserirContatoAplicativo(
        codcliente,
        trim(ed_contato_pla_aplicativo.Text),
        trim(ed_contato_pla_contato.Text),
        trim(ed_contato_pla_identificacao.Text),
        ck_contrato_pla_tipos_contato,
        idcontado) then
          Exit;
    end;

    if (tipocontato <> cTpContatoOutros) then
    begin
      for I := 0 to vDadosIni.vListaContatoTemp.Count - 1 do
        if (ContainsStr(vDadosIni.vListaContatoTemp[I], trim(ed_contato_pla_aplicativo.Text)))
          and (ContainsStr(vDadosIni.vListaContatoTemp[I], trim(ed_contato_pla_identificacao.Text))) then
        begin
          vDadosIni.vListaContatoTemp.Delete(I);
          Break;
        end;
    end;
  end;

	ModalResult := mrOk;
end;

procedure TFrmContato.btSelectAllTipoContatoClick(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to ck_contrato_pla_tipos_contato.Count - 1 do
  	ck_contrato_pla_tipos_contato.Checked[I] := True;
end;

procedure TFrmContato.btUnSelectAllTipoContatoClick(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to ck_contrato_pla_tipos_contato.Count - 1 do
  	ck_contrato_pla_tipos_contato.Checked[I] := False;
end;

procedure TFrmContato.ed_contato_pla_aplicativoExit(Sender: TObject);
var
	I: Integer;
begin
	if trim(aplicativo) = trim(ed_contato_pla_aplicativo.Text) then
  	Exit;

  if trim(ed_contato_pla_aplicativo.Text) = '' then
  	lb_contato_pla_identificacao.Caption := 'Identificação:'
  else
  	lb_contato_pla_identificacao.Caption :=
    	Copy(trim(trim(ed_contato_pla_aplicativo.Text)), 1, 1) +
      LowerCase(Copy(trim(trim(ed_contato_pla_aplicativo.Text)), 2, Length(trim(trim(ed_contato_pla_aplicativo.Text))) - 1)) + ':';

  ed_contato_pla_identificacao.Text := '';
  for I := 0 to ck_contrato_pla_tipos_contato.Items.Count - 1 do
  	ck_contrato_pla_tipos_contato.Checked[I] := False;

  if trim(trim(ed_contato_pla_aplicativo.Text)) = 'WHATSAPP' then
  	ed_contato_pla_identificacao.EditMask := '(99) 99999-9999;0;_'
  else
  	ed_contato_pla_identificacao.EditMask := '';

  aplicativo := trim(ed_contato_pla_aplicativo.Text);
end;

procedure TFrmContato.ed_contato_pla_identificacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if UpperCase(trim(lb_contato_pla_identificacao.Caption)) = 'WHATSAPP' then
    if Key = VK_ESCAPE then
    begin
      TMaskEdit(Sender).Text := '(99)99999-9999';
      TMaskEdit(Sender).Clear;
    end;
end;

procedure TFrmContato.FormCreate(Sender: TObject);
begin
	TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
end;

procedure TFrmContato.FormShow(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (cbTipoContato.CanFocus) then
  	cbTipoContato.SetFocus
	else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_aplicativo.CanFocus) then
  	ed_contato_pla_aplicativo.SetFocus;
end;

procedure TFrmContato.meTelefoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then
  begin
    TMaskEdit(Sender).Text := '(99)99999-9999';
    TMaskEdit(Sender).Clear;
  end;
end;

procedure TFrmContato.sbAdicionarTipoContatoAplicativoClick(Sender: TObject);
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

    if vDadosIni.inserirTipoContato(
    	UpperCase(trim(vtemp))) then
      	exit;

    vDadosIni.retornaCheckListTipoContato(ck_contrato_pla_tipos_contato);
  except on E: Exception do
  	begin
      Application.MessageBox(PChar('Falha ao adicionar tipo de contato: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
    	vDadosIni.registraErro('Falha ao adicionar tipo de contato: ' + e.Message);
    end;
  end;
end;

procedure TFrmContato.sbAdicionarTipoContatoClick(Sender: TObject);
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

    if vDadosIni.inserirTipoContato(
    	UpperCase(trim(vtemp))) then
      	exit;

    vDadosIni.retornaComboboxTipoContato(cbTipoContato);
  except on E: Exception do
  	begin
      Application.MessageBox(PChar('Falha ao adicionar tipo de contato: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
    	vDadosIni.registraErro('Falha ao adicionar tipo de contato: ' + e.Message);
    end;
  end;
end;

end.
