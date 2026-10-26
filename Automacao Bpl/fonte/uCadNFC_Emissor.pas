unit uCadNFC_Emissor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, uDataSet_OOP, DB;

type
  TfrmCadNFC_Emissor = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    scrollCadastro: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    ckServerProc: TCheckBox;
    ckServerImp: TCheckBox;
    SpeedButton10: TSpeedButton;
    SpeedButton59: TSpeedButton;
    radioTpEmiss: TRadioGroup;
    lkClientOrServer: TDBLookupComboBox;
    Label9: TLabel;
    ck_ServerAutorizacao_client: TDBCheckBox;
    ck_ServerImpressao_client: TDBCheckBox;
    ck_ServerAutorizacao_server: TDBCheckBox;
    ck_ServerImpressao_server: TDBCheckBox;
    ck_ServerEmail_server: TDBCheckBox;
    ck_ServerEmail_client: TDBCheckBox;
    Label13: TLabel;
    ed_lib_ssl: TDBLookupComboBox;
    Label14: TLabel;
    ed_lib_sslcryptlib: TDBLookupComboBox;
    Label15: TLabel;
    ed_lib_sslhttplib: TDBLookupComboBox;
    Label16: TLabel;
    ed_lib_sslxmlsignlib: TDBLookupComboBox;
    ed_set_lib_ssl: TSpeedButton;
    bt_mais: TSpeedButton;
    popEmissor: TPopupMenu;
    LogSincronizaoNFCeoffline1: TMenuItem;
    ConfiguraesSincronizaoNFCeOffline1: TMenuItem;
    N1: TMenuItem;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    procedure bt_maisClick(Sender: TObject);
    procedure ConfiguraesSincronizaoNFCeOffline1Click(Sender: TObject);
    procedure LogSincronizaoNFCeoffline1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ed_lib_sslExit(Sender: TObject);
    procedure ed_set_lib_sslClick(Sender: TObject);
    procedure GroupBox4Exit(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure ckServerProcClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FClientOrServer: TDadosLookUp_OOP;
    FSimNao        : TDadosLookUp_OOP;
    FLibSSL        : TDadosLookUp_OOP;
    FLibCrypt      : TDadosLookUp_OOP;
    FLibHttp       : TDadosLookUp_OOP;
    FLibXmlSign    : TDadosLookUp_OOP;
    procedure FieldCLIENT_OR_SERVERChange(Sender: TField);
    procedure montarcomponentes;
    procedure edits_lib_atualizar;
  public
    { Public declarations }
  end;

var
  frmCadNFC_Emissor: TfrmCadNFC_Emissor;

implementation

uses uDtmNFConsumidor, uClassesNFConsumidor, uDtmAtivo, uDadosIni, hw_win_utils, hw_utils;

procedure cloud_view_config(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TfrmCadNFC_Emissor.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('NFC002', 'CONSULTA', '', 'NFC_EMISSOR', '', Emissor.buscas, False) then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not Emissor.ConsultaCampos('NFC_EMISSOR', ComboBox1.Text,
        'COD_EMISSOR', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if Emissor.ConsultaCampos('NFC_EMISSOR', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, 'COD_EMISSOR', true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFC_Emissor.BitBtn2Click(Sender: TObject);
begin
  inherited;
//sair
end;

procedure TfrmCadNFC_Emissor.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de terminal. Por favor acesso menu de configuração para esse fim direto do servidor');
    Exit;
  end;

  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not Emissor.Insert then
      exit;
    inherited;

    montarcomponentes;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFC_Emissor.BitBtn4Click(Sender: TObject);
begin
  if not Emissor.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(Emissor.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if Emissor.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadNFC_Emissor.BitBtn5Click(Sender: TObject);
begin
  Emissor.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadNFC_Emissor.bt_maisClick(Sender: TObject);
begin
  inherited;
  popEmissor.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNFC_Emissor.ckServerProcClick(Sender: TObject);
begin
  inherited;
  Emissor.DefinirTipo(radioTpEmiss.ItemIndex, ckServerProc.Checked, ckServerImp.Checked);
  ckServerProc.Checked := Pos('3|', Emissor.dataSet.FieldByName('tipo').AsString) > 0;
  ckServerImp.Checked  := Pos('4|', Emissor.dataSet.FieldByName('tipo').AsString) > 0;

  if Pos('1|', Emissor.dataSet.FieldByName('tipo').AsString) > 0 then
    radioTpEmiss.ItemIndex := 2
  else if Pos('2|', Emissor.dataSet.FieldByName('tipo').AsString) > 0 then
    radioTpEmiss.ItemIndex := 3
  else if Pos('5|', Emissor.dataSet.FieldByName('tipo').AsString) > 0 then
    radioTpEmiss.ItemIndex := 0
  else if Pos('6|', Emissor.dataSet.FieldByName('tipo').AsString) > 0 then
    radioTpEmiss.ItemIndex := 1
  else
    radioTpEmiss.ItemIndex := -1;
end;

procedure TfrmCadNFC_Emissor.ConfiguraesSincronizaoNFCeOffline1Click(
  Sender: TObject);
begin
  inherited;
  cloud_view_config(WideString(Format(';empresaId=%d;caixaId=%d',
    [vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor])));
end;

procedure TfrmCadNFC_Emissor.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (vDadosIni.vNFConsumidor.NFCeOffline <> noNone) and
    (not Emissor.fempty('refresh_token')) then
    if (gdFocused in State) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clWindow;
      TDBGrid(Sender).Canvas.Font.Color := clWindowText;
    end
    else if ((Now - Emissor.fdatet('data_api_error')) < EncodeTime(1, 0, 0, 0)) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := $00A6A6FF;
      TDBGrid(Sender).Canvas.Font.Color := clWindowText;
    end
    else if ((Now - Emissor.fdatet('data_api_online')) < EncodeTime(1, 0, 0, 0)) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := $00C1FFC1;
      TDBGrid(Sender).Canvas.Font.Color := clWindowText;
    end
    else
    begin
      TDBGrid(Sender).Canvas.Brush.Color := $00B3FFFF;
      TDBGrid(Sender).Canvas.Font.Color := clWindowText;
    end;
  TDBGrid(Sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadNFC_Emissor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1.Click
  else if Key = VK_INSERT then
    BitBtn3.Click;
end;

procedure TfrmCadNFC_Emissor.edits_lib_atualizar;
begin
  if (not Emissor.fnull('lib_ssl')) and (Emissor.fint('lib_ssl') >= 0) and (Emissor.fint('lib_ssl') <= 5) then
  begin
    case Trunc(ed_lib_ssl.KeyValue) of
      0 : //Default
      begin
        Emissor.fdata('lib_sslcryptlib').Put(0);
        Emissor.fdata('lib_sslhttplib').Put(0);
        Emissor.fdata('lib_sslxmlsignlib').Put(0);
      end;
      1 : //libOpenSSL
      begin
        Emissor.fdata('lib_sslcryptlib').Put(1);
        Emissor.fdata('lib_sslhttplib').Put(3);
        Emissor.fdata('lib_sslxmlsignlib').Put(4);
      end;
      2 : //libCapicom
      begin                                  
        Emissor.fdata('lib_sslcryptlib').Put(2);
        Emissor.fdata('lib_sslhttplib').Put(1);
        Emissor.fdata('lib_sslxmlsignlib').Put(3);
      end;
      3 : //libCapicomDelphiSoap
      begin                                       
        Emissor.fdata('lib_sslcryptlib').Put(2);
        Emissor.fdata('lib_sslhttplib').Put(4);
        Emissor.fdata('lib_sslxmlsignlib').Put(3);
      end;
      4 : //libWinCrypt
      begin
        Emissor.fdata('lib_sslcryptlib').Put(3);
        Emissor.fdata('lib_sslhttplib').Put(2);
        Emissor.fdata('lib_sslxmlsignlib').Put(4);
      end;
      //5: //libCustom
    end;
  end;
end;

procedure TfrmCadNFC_Emissor.ed_lib_sslExit(Sender: TObject);
var
  Habilitado: Boolean;
begin
  inherited;
  edits_lib_atualizar;
//  Habilitado                   := ed_lib_ssl.Enabled and (ed_lib_ssl.KeyValue = 5);
//  ed_lib_sslcryptlib.Enabled   := Habilitado;
//  ed_lib_sslhttplib.Enabled    := Habilitado;
//  ed_lib_sslxmlsignlib.Enabled := Habilitado;
//  ed_lib_ssl.Enabled           := ed_lib_ssl.KeyValue = 5;
  ed_lib_sslcryptlib.Enabled   := ed_lib_ssl.KeyValue = 5;
  ed_lib_sslhttplib.Enabled    := ed_lib_ssl.KeyValue = 5;
  ed_lib_sslxmlsignlib.Enabled := ed_lib_ssl.KeyValue = 5;
end;

procedure TfrmCadNFC_Emissor.FieldCLIENT_OR_SERVERChange(Sender: TField);
begin
  ck_ServerAutorizacao_client.Visible := Sender.AsString <> 'S';
  ck_ServerImpressao_client.Visible   := Sender.AsString <> 'S';
  ck_ServerEmail_client.Visible       := Sender.AsString <> 'S';

  ck_ServerAutorizacao_server.Visible := Sender.AsString = 'S';
  ck_ServerImpressao_server.Visible   := Sender.AsString = 'S';
  ck_ServerEmail_server.Visible       := Sender.AsString = 'S';
end;

procedure TfrmCadNFC_Emissor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(FClientOrServer);
  FreeAndNil(FSimNao);
  FreeAndNil(Emissor);        
  FreeAndNil(FLibSSL);
  FreeAndNil(FLibCrypt);
  FreeAndNil(FLibHttp);
  FreeAndNil(FLibXmlSign);

  Action := caFree;
  frmCadNFC_Emissor := nil;
end;

procedure TfrmCadNFC_Emissor.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  Emissor := TNFC_Emissor.create;

  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  FClientOrServer := TDadosLookUp_OOP.create;
  FSimNao         := TDadosLookUp_OOP.create;
  FLibSSL         := TDadosLookUp_OOP.create;
  FLibCrypt       := TDadosLookUp_OOP.create;
  FLibHttp        := TDadosLookUp_OOP.create;
  FLibXmlSign     := TDadosLookUp_OOP.create;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadNFC_Emissor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    if PageControl1.ActivePage = TabSheet2 then
      SpeedButton1.Click;
end;

procedure TfrmCadNFC_Emissor.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmNFConsumidor.dsEmissor;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  {if TelaCadastro = 1 then
  begin
    if (Pos('|CAD_DIFAL_FCP|', vDadosIni.vPesquisa) > 0) then
    begin
      Self.Caption := Self.Caption + ' - ' + vDadosIni.getValue(vDadosIni.vPesquisa, 7) + ' NF: ' + vDadosIni.getValue(vDadosIni.vPesquisa, 8); 
      Emissor.montaSelect('select * from NFC_EMISSOR' +
        ' where cod_nf = ' + IntToStr(StrToIntDef(vDadosIni.getValue(vDadosIni.vPesquisa, 6), 0)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tpob = ' + QuotedStr(vDadosIni.getValue(vDadosIni.vPesquisa, 7)));
      if Emissor.dataSet.IsEmpty then
      begin
        Self.Caption := Self.Caption + '*';
        BitBtn3Click(Sender);
        Emissor.dataSet.FieldByName('COD_OR').AsString := vDadosIni.getValue(vDadosIni.vPesquisa, 2);
        Emissor.dataSet.FieldByName('COD_REC').AsString := vDadosIni.getValue(vDadosIni.vPesquisa, 3);
        Emissor.dataSet.FieldByName('VL_OR').AsFloat := StrToFloatDef(vDadosIni.getValue(vDadosIni.vPesquisa, 4),0);
        Emissor.dataSet.FieldByName('UF').AsString := vDadosIni.getValue(vDadosIni.vPesquisa, 5);
        Emissor.dataSet.FieldByName('COD_NF').AsInteger := StrToIntDef(vDadosIni.getValue(vDadosIni.vPesquisa, 6), 0);
        Emissor.dataSet.FieldByName('TPOB').AsString := vDadosIni.getValue(vDadosIni.vPesquisa, 7);
        Emissor.dataSet.FieldByName('DATA_LANC').AsDateTime := vDadosIni.getDataBanco(Emissor.buscas);
        Emissor.dataSet.FieldByName('DT_VCTO').AsDateTime := Emissor.dataSet.FieldByName('DATA_LANC').AsDateTime;
        Emissor.dataSet.FieldByName('ANO_REF').AsInteger := YearOf(Emissor.dataSet.FieldByName('DATA_LANC').AsDateTime);
        Emissor.dataSet.FieldByName('MES_REF').AsInteger := MonthOf(Emissor.dataSet.FieldByName('DATA_LANC').AsDateTime );
      end
      else
        SpeedButton1.Click;
    end
    else
      BitBtn3Click(Sender);
  end;}

  FClientOrServer.setDadosDataSet(['C', 'S'], ['C - Client', 'S - Server'], lkClientOrServer);

  FLibSSL.setDadosDataSet(    ['0', '1', '2', '3', '4', '5'],
                              ['Default', 'libOpenSSL', 'libCapicom', 'libCapicomDelphiSoap', 'libWinCrypt', 'libCustom'], ed_lib_ssl);
  FLibCrypt.setDadosDataSet(  ['0', '1', '2', '3'],
                              ['Default', 'cryOpenSSL', 'cryCapicom', 'cryWinCrypt'], ed_lib_sslcryptlib);
  FLibHttp.setDadosDataSet(   ['0', '1', '2', '3', '4'],
                              ['Default', 'httpWinINet', 'httpWinHttp', 'httpOpenSSL', 'httpIndy'], ed_lib_sslhttplib);
  FLibXmlSign.setDadosDataSet(['0', '1', '2', '3', '4'],
                              ['Default', 'xsXmlSec', 'xsMsXml', 'xsMsXmlCapicom', 'xsLibXml2'], ed_lib_sslxmlsignlib);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadNFC_Emissor.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  Emissor.dataSet.FieldByName('client_or_server').OnChange := FieldCLIENT_OR_SERVERChange;
  FieldCLIENT_OR_SERVERChange(Emissor.dataSet.FieldByName('client_or_server'));
end;

procedure TfrmCadNFC_Emissor.GroupBox4Exit(Sender: TObject);
begin
  inherited;
  Emissor.dataSet.FieldByName('client_or_server').OnChange := nil;
end;

procedure TfrmCadNFC_Emissor.LogSincronizaoNFCeoffline1Click(Sender: TObject);
var
  codigo: Integer;
begin
  inherited;
  if Emissor.dataSet.Active then
    codigo := Emissor.fint('cod_emissor')
  else
    codigo := vDadosIni.vNFConsumidor.CodEmissor;

  CreateProcessSimple(
    Format('%s%s LESS LOGSINCNFCE cnpj=%s empresaId=%d caixaId=%d',
          [ExtractFilePath(Application.ExeName), 'HWNFCServiceLess.exe',
           vDadosIni.vEmp.vCNPJ, vDadosIni.cod_empresa, codigo]));
end;

procedure TfrmCadNFC_Emissor.montarcomponentes;
begin

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsCadastro;

  ckServerProc.Checked := Pos('3|', Emissor.dataSet.FieldByName('tipo').AsString) > 0;
  ckServerImp.Checked  := Pos('4|', Emissor.dataSet.FieldByName('tipo').AsString) > 0;

  if Pos('1|', Emissor.dataSet.FieldByName('tipo').AsString) > 0 then
    radioTpEmiss.ItemIndex := 2
  else if Pos('2|', Emissor.dataSet.FieldByName('tipo').AsString) > 0 then
    radioTpEmiss.ItemIndex := 3
  else if Pos('5|', Emissor.dataSet.FieldByName('tipo').AsString) > 0 then
    radioTpEmiss.ItemIndex := 0
  else if Pos('6|', Emissor.dataSet.FieldByName('tipo').AsString) > 0 then
    radioTpEmiss.ItemIndex := 1
  else
    radioTpEmiss.ItemIndex := -1;

  ed_lib_sslExit(ed_lib_ssl);

  ed_lib_ssl.Enabled     := vDadosIni.PesqPros('NFC036', 'HABILITAR', '', '', '', Emissor.buscas, False, False, True);
  ed_set_lib_ssl.Enabled := ed_lib_ssl.Enabled;

  DBEdit4.Enabled := vDadosIni.vNFConsumidor.NFCeOffline <> noClient;

  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TfrmCadNFC_Emissor.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  Emissor.DefinirIdentificador;
end;

procedure TfrmCadNFC_Emissor.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not Emissor.Edit then
      exit;
    inherited;

    montarcomponentes;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFC_Emissor.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    Emissor.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFC_Emissor.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.nfc_abreFormNFConsumidor('nfc_abreformConfigNFCe', 1);
end;

procedure TfrmCadNFC_Emissor.ed_set_lib_sslClick(Sender: TObject);
begin
  inherited;
  if (Emissor.fnull('lib_ssl')) or (Emissor.fint('lib_ssl') = 5) then
    Emissor.fdata('lib_ssl').Put(0)
  else
    Emissor.fdata('lib_ssl').Put(Emissor.fint('lib_ssl') + 1);

  ed_lib_sslExit(ed_lib_ssl);
end;

end.
