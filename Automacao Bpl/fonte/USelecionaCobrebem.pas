unit USelecionaCobrebem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, DBCtrls, ExtCtrls, Buttons, udtmBoleto, CheckLst, 
  IBQuery, uDadosIni, uFrameCheckListaContato;

type
  TfrmSelecionaCobrebem = class(TfrmPadrao)
    Panel_Cobrebem: TPanel;
    pnSelecionaCobrebemBottom: TPanel;
    BitBtn_OK: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBoxConvenio: TGroupBox;
    DBLookupComboBox_Cobrebem: TDBLookupComboBox;
    GroupBoxAcoes: TGroupBox;
    Panel1: TPanel;
    ckImprimirBoleto: TCheckBox;
    ckEnviarBoleto: TCheckBox;
    FrameCheckListaContato: TFrameCheckListaContato;
    procedure ckEnviarBoletoClick(Sender: TObject);
    procedure ckImprimirBoletoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaCobrebem: TfrmSelecionaCobrebem;   

implementation

uses uDtmAtivo, UClassesBoleto;

{$R *.dfm}

procedure TfrmSelecionaCobrebem.BitBtn_OKClick(Sender: TObject);
var
	vSel: Boolean;
	I: Integer;
begin
  vSel := False;
  if FrameCheckListaContato.CheckListBoxAplicativo.Visible then
  begin
    for I := 0 to FrameCheckListaContato.CheckListBoxAplicativo.Items.Count - 1 do
      if FrameCheckListaContato.CheckListBoxAplicativo.Checked[I] then
      begin
        vSel := True;
        Break;
      end;
  end
  else if FrameCheckListaContato.CheckListBoxContato.Visible then
  begin
    for I := 0 to FrameCheckListaContato.CheckListBoxContato.Items.Count - 1 do
      if FrameCheckListaContato.CheckListBoxContato.Checked[I] then
      begin
        vSel := True;
        Break;
      end;
  end;

  if (ckImprimirBoleto.Visible) or (ckEnviarBoleto.Visible) then
    if (not ckImprimirBoleto.Checked) and (not ckEnviarBoleto.Checked) then
    begin
      Application.MessageBox('Ação (IMPRIMIR/ENVIAR) não informada.',
        'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (ckImprimirBoleto.CanFocus) then
         ckImprimirBoleto.SetFocus;
      Exit;
    end;

  if (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked) then
  begin
    if FrameCheckListaContato.CheckListBoxAplicativo.Visible then
    begin
     if (not vSel) then
      begin
        Application.MessageBox(PChar('Forma de envio (' + vDadosIni.retornaNomesAplicativo(FrameCheckListaContato.CheckListBoxAplicativo) + ') não informada.'),
          'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (FrameCheckListaContato.CheckListBoxAplicativo.CanFocus) then
           FrameCheckListaContato.CheckListBoxAplicativo.SetFocus;
        exit;
      end;
    end
    else if FrameCheckListaContato.CheckListBoxContato.Visible then
    begin
      if (not vSel) then
      begin
        Application.MessageBox('Contato não informado.',
          'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (FrameCheckListaContato.CheckListBoxContato.CanFocus) then
           FrameCheckListaContato.CheckListBoxContato.SetFocus;
        exit;
      end;
    end;
  end;

  if vDadosIni.IfThen(DBLookupComboBox_Cobrebem.KeyValue = Null, 0, DBLookupComboBox_Cobrebem.KeyValue) <= 0 then
  begin
     Application.MessageBox('Convênio não informado.',
    	'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
     if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_Cobrebem.CanFocus) then
       DBLookupComboBox_Cobrebem.SetFocus;
     Exit;
  end;

  FrameCheckListaContato._GravaConfiguracoesRegistro;

  if (ckImprimirBoleto.Enabled) and (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Enabled) and (ckEnviarBoleto.Visible) then
  	_GravaConfiguracoesBoolean(ckImprimirBoleto.Name, ckImprimirBoleto.Checked);
  if (ckImprimirBoleto.Enabled) and (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Enabled) and (ckEnviarBoleto.Visible) then
    _GravaConfiguracoesBoolean(ckEnviarBoleto.Name, ckEnviarBoleto.Checked);

  Self.ModalResult := mrOK;
end;


procedure TfrmSelecionaCobrebem.ckImprimirBoletoClick(Sender: TObject);
begin
  inherited;
  if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
  	if (not ckImprimirBoleto.Checked) then
    	ckEnviarBoleto.Checked := true;
end;

procedure TfrmSelecionaCobrebem.ckEnviarBoletoClick(Sender: TObject);
begin
  inherited;
  if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
  	 if (not ckEnviarBoleto.Checked) then
    	ckImprimirBoleto.Checked := true;

  FrameCheckListaContato.GroupBoxContato.Visible := (GroupBoxAcoes.Visible) and (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked);
  FrameCheckListaContato.CheckListBoxContato.Visible := FrameCheckListaContato.GroupBoxContato.Visible;
  Self.Height :=
  	vDadosIni.IfThen(not GroupBoxAcoes.Visible, 140,
    	vDadosIni.IfThen((ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked), 278, 175));

  if FrameCheckListaContato.GroupBoxContato.Visible then
    if FrameCheckListaContato.CheckListBoxContato.CanFocus then
      FrameCheckListaContato.CheckListBoxContato.SetFocus;
end;


procedure TfrmSelecionaCobrebem.FormCreate(Sender: TObject);
var
   hwndHandle : THANDLE;
   hMenuHandle : HMenu;
   vCodTemp: integer;
	 vNossoNumero: string;
   vCodCobrebem: Integer;
   vCodCliente: Integer;
   vBolTemp: TBoleto;
begin
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa,1) = 'CR' then
  begin
    vCodTemp := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
    vCodCobrebem := StrToInt(vDadosIni.IfThen(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,3) = '',
    	0, vDadosIni.getCampoPipe(vDadosIni.vPesquisa,3)));
    vCodCliente := StrToInt(vDadosIni.IfThen(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,4) = '',
    	0, vDadosIni.getCampoPipe(vDadosIni.vPesquisa,4)));
    vDadosIni.vPesquisa := '';

    vBolTemp := TBoleto.create;
    vBolTemp._BoletosNFOS(
    	vCodTemp,
      0,
      'CR',
      0,
      '',
      true,
      true,
      vDadosIni.retornaArrayAplicativo,
      vDadosIni.retornaArrayContato(vCodCliente, cBoleto),
      cBoleto,
      False,
      vCodCobrebem);
    Close;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa,1) = 'CRB' then
  begin
    vNossoNumero := vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2);
    vCodCobrebem := StrToInt(vDadosIni.IfThen(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,3) = '',
    	0, vDadosIni.getCampoPipe(vDadosIni.vPesquisa,3)));
    vCodCliente  := StrToInt(vDadosIni.IfThen(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,4) = '',
    	0, vDadosIni.getCampoPipe(vDadosIni.vPesquisa,4)));
    vDadosIni.vPesquisa := '';

    vBolTemp := TBoleto.create;
    vBolTemp._BoletosNFOS(
    	0,
      0,
      'CRB',
      vCodCliente,
      vNossoNumero,
      true,
      true,
      vDadosIni.retornaArrayAplicativo,
      vDadosIni.retornaArrayContato(vCodCliente, cBoleto),
      cBoleto,
      False,
      vCodCobrebem);
    Close;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa,1) = 'CRED' then
  begin
    vCodTemp := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
    vCodCobrebem := StrToInt(vDadosIni.IfThen(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,3) = '',
    	0, vDadosIni.getCampoPipe(vDadosIni.vPesquisa,3)));
    vCodCliente  := StrToInt(vDadosIni.IfThen(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,4) = '',
    	0, vDadosIni.getCampoPipe(vDadosIni.vPesquisa,4)));
    vDadosIni.vPesquisa := '';

    vBolTemp := TBoleto.create;
    vBolTemp._BoletosNFOS(
    	vCodTemp,
      0,
      'CRED',
      vCodCliente,
      '',
      true,
      true,
      vDadosIni.retornaArrayAplicativo,
      vDadosIni.retornaArrayContato(vCodCliente, cBoleto),
      cBoleto,
      False,
      vCodCobrebem);
    Close;
  end;

  vDadosIni.vPesquisa := '';
  hwndHandle := Self.Handle;
  if (hwndHandle <> 0) then
  begin
    hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
    if (hMenuHandle <> 0) then
      DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
  end;
end;

procedure TfrmSelecionaCobrebem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) then
  begin
    if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
    	ckImprimirBoleto.Checked := not ckImprimirBoleto.Checked;
  end
  else if (Key = VK_F3) then
  begin
  	if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
    	ckEnviarBoleto.Checked := not ckEnviarBoleto.Checked;

    FrameCheckListaContato.GroupBoxContato.Visible := (GroupBoxAcoes.Visible) and (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked);
    FrameCheckListaContato.CheckListBoxContato.Visible := FrameCheckListaContato.GroupBoxContato.Visible;
    Self.Height :=
      vDadosIni.IfThen(not GroupBoxAcoes.Visible, 140,
        vDadosIni.IfThen((ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked), 278, 175));

    if FrameCheckListaContato.GroupBoxContato.Visible then
    	if FrameCheckListaContato.CheckListBoxContato.CanFocus then
        FrameCheckListaContato.CheckListBoxContato.SetFocus;
  end
  else if (key = VK_RETURN) then
    BitBtn_OKClick(Sender);
end;


procedure TfrmSelecionaCobrebem.FormShow(Sender: TObject);
begin
  inherited;
  if not Assigned(vDadosIni.vListaContatoTemp) then
    vDadosIni.vListaContatoTemp := TStringList.Create;
  vDadosIni.vListaContatoTemp.Clear;

  FrameCheckListaContato.GroupBoxContato.Visible := (GroupBoxAcoes.Visible) and (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked);
  Self.Height :=
  	vDadosIni.IfThen(not GroupBoxAcoes.Visible, 140,
    	vDadosIni.IfThen((ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked), 278, 175));

  if (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked) then
  	FrameCheckListaContato.carregarContatoAplicativo;

  FrameCheckListaContato._LerConfiguracoesRegistro;

  if (ckImprimirBoleto.Enabled) and (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Enabled) and (ckEnviarBoleto.Visible) then
    frmSelecionaCobrebem.ckImprimirBoleto.Checked := _LerConfiguracoesRegistroBoolean(frmSelecionaCobrebem.ckImprimirBoleto.Name, True)
  else if (ckImprimirBoleto.Visible) and (ckImprimirBoleto.Checked) then
    frmSelecionaCobrebem.ckImprimirBoleto.Checked := True
  else
  	frmSelecionaCobrebem.ckImprimirBoleto.Checked := False;

  if (ckImprimirBoleto.Enabled) and (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Enabled) and (ckEnviarBoleto.Visible) then
    frmSelecionaCobrebem.ckEnviarBoleto.Checked := _LerConfiguracoesRegistroBoolean(frmSelecionaCobrebem.ckEnviarBoleto.Name)
  else if (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked) then
    frmSelecionaCobrebem.ckEnviarBoleto.Checked := True
  else
    frmSelecionaCobrebem.ckEnviarBoleto.Checked := False;

  if (Self.Enabled) and (Self.Visible) and (FrameCheckListaContato.CheckListBoxContato.CanFocus) then
    FrameCheckListaContato.CheckListBoxContato.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_Cobrebem.CanFocus) then
    DBLookupComboBox_Cobrebem.SetFocus;
end;

initialization
  RegisterClass(TfrmSelecionaCobrebem);
finalization
  UnRegisterClass(TfrmSelecionaCobrebem);

end.
