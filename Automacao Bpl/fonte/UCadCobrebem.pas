unit UCadCobrebem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, UClassesBoleto, DBCtrls, ExtDlgs, AppEvnts;

type
  TfrmCadCobreBem = class(TfrmCadPadraoM)
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    lbLicencaOuConvenio: TLabel;
    edLicencaOuConvenio: TDBEdit;
    Label15: TLabel;
    DBEdit_ImagemCodigoBarras: TDBEdit;
    Label16: TLabel;
    DBEdit_ImagemLogotipo: TDBEdit;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    TabEnvioEmail: TTabSheet;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox_Controle: TDBLookupComboBox;
    DBEdit23: TDBEdit;
    TabLayouts: TTabSheet;
    Label33: TLabel;
    DBComboBox_TipoDocumento: TDBComboBox;
    Label35: TLabel;
    DBEdit26: TDBEdit;
    Label36: TLabel;
    DBEdit_EnderecoRemessaRetorno: TDBEdit;
    TabSheet6: TTabSheet;
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    Label26: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Memo1: TMemo;
    DBEdit21: TDBEdit;
    Edit1: TEdit;
    Label27: TLabel;
    DBEdit25: TDBEdit;
    Label41: TLabel;
    DBEdit30: TDBEdit;
    Label42: TLabel;
    Label43: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    OpenPictureDialog1: TOpenPictureDialog;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label129: TLabel;
    DBEdit66: TDBEdit;
    DBLookupComboBox14: TDBLookupComboBox;
    TabSheetOutrasConf: TTabSheet;
    TabLicencaGenerica: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox6: TGroupBox;
    Label34: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label56: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    lbGerarRegistroMulta: TLabel;
    lbInfGerarRegistroMulta: TLabel;
    DBEdit22: TDBEdit;
    DBEdit19: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit11: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBEdit37: TDBEdit;
    DBEdit39: TDBEdit;
    DBMemo5: TDBMemo;
    DBMemo6: TDBMemo;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBEdit27: TDBEdit;
    DBComboBoxGerarRegistroMulta: TDBComboBox;
    ScrollBox5: TScrollBox;
    GroupBoxOutrasConf: TGroupBox;
    DBMemoOutrasConf: TDBMemo;
    ScrollBox6: TScrollBox;
    GroupBoxLicencaGenerica: TGroupBox;
    lbLicencaGenerica: TLabel;
    lbNomeCedente: TLabel;
    lbCPFCNPJ: TLabel;
    lbTamCedente: TLabel;
    DBComboBoxLicencaGenerica: TDBComboBox;
    DBEditNomeCedente: TDBEdit;
    DBEditCPFCNPJ: TDBEdit;
    DBEditTamanhoCedente: TDBEdit;
    ScrollBox7: TScrollBox;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label38: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit_SenhaSMTP: TDBEdit;
    DBEdit20: TDBEdit;
    DBMemo2: TDBMemo;
    ScrollBox8: TScrollBox;
    GroupBox5: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label37: TLabel;
    DBComboBox_ArquivoRemessa: TDBComboBox;
    DBComboBox_ArquivoRetorno: TDBComboBox;
    DBComboBox_BoletoImpresso: TDBComboBox;
    DBComboBox_BoletoEmail: TDBComboBox;
    DBMemo1: TDBMemo;
    bnExportarLicenca: TSpeedButton;
    bnExportarLogo: TSpeedButton;
    SaveDialog1: TSaveDialog;
    popUpNew: TPopupMenu;
    ConvnioviaArquivodelicena1: TMenuItem;
    ConvnioprausarcomaAPIdeboletos1: TMenuItem;
    TabConfiguracoes: TTabSheet;
    pnTipoConfiguracoes: TPanel;
    Panel5: TPanel;
    pnConfiguracoesOK: TBitBtn;
    pnConfiguracoesCanc: TBitBtn;
    RadioGroupOpcoes: TRadioGroup;
    TabSheet4: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    ScrollBox9: TScrollBox;
    GroupBox7: TGroupBox;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label62: TLabel;
    DBEdit32: TDBEdit;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    Label65: TLabel;
    DBEdit35: TDBEdit;
    Panel4: TPanel;
    Label66: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    CheckBox2: TCheckBox;
    Label67: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    DBEdit36: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit38: TDBEdit;
    DBEdit41: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label71: TLabel;
    Label72: TLabel;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    Label61: TLabel;
    DBEdit_EnderecoRemessaRetorno2: TDBEdit;
    SpeedButton15: TSpeedButton;
    TabSheet7: TTabSheet;
    ScrollBox10: TScrollBox;
    GroupBox8: TGroupBox;
    Label73: TLabel;
    DBMemo7: TDBMemo;
    Label74: TLabel;
    DBEdit40: TDBEdit;
    Label32: TLabel;
    DBEdit24: TDBEdit;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    DBMemo8: TDBMemo;
    DBMemo9: TDBMemo;
    Label83: TLabel;
    DBMemo10: TDBMemo;
    Label81: TLabel;
    DBEdit47: TDBEdit;
    Label82: TLabel;
    DBEdit48: TDBEdit;
    DBEdit46: TDBEdit;
    Label84: TLabel;
    DBComboBox8: TDBComboBox;
    Label85: TLabel;
    DBEdit50: TDBEdit;
    DBComboBox9: TDBComboBox;
    Label86: TLabel;
    Label87: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    Label88: TLabel;
    Label89: TLabel;
    DBComboBox10: TDBComboBox;
    Label90: TLabel;
    DBComboBox11: TDBComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Label69: TLabel;
    DBEdit31: TDBEdit;
    TabSheet8: TTabSheet;
    ScrollBox11: TScrollBox;
    GroupBoxOutrasConf2: TGroupBox;
    DBMemoOutrasConf2: TDBMemo;
    Label91: TLabel;
    DBMemo11: TDBMemo;
    Label92: TLabel;
    DBEdit53: TDBEdit;
    Label93: TLabel;
    DBComboBox12: TDBComboBox;
    Label94: TLabel;
    Label95: TLabel;
    DBEdit54: TDBEdit;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    DBMemo12: TDBMemo;
    DBEdit49: TDBEdit;
    DBComboBox13: TDBComboBox;
    DBEdit55: TDBEdit;
    Label101: TLabel;
    Label102: TLabel;
    Label105: TLabel;
    DBComboBox16: TDBComboBox;
    Label103: TLabel;
    DBComboBox14: TDBComboBox;
    Label75: TLabel;
    DBEdit44: TDBEdit;
    Label76: TLabel;
    DBEdit45: TDBEdit;
    Label104: TLabel;
    DBComboBox15: TDBComboBox;
    Label77: TLabel;
    DBComboBox7: TDBComboBox;
    Label106: TLabel;
    DBComboBox17: TDBComboBox;
    Label107: TLabel;
    DBComboBox18: TDBComboBox;
    Label110: TLabel;
    DBEdit_CaminhoCertificado: TDBEdit;
    SpeedButton16: TSpeedButton;
    DBEdit_SenhaCertificado: TDBEdit;
    Label111: TLabel;
    Label112: TLabel;
    DBEdit56: TDBEdit;
    procedure SpeedButton16Click(Sender: TObject);
    procedure DBComboBox18KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox7Exit(Sender: TObject);
    procedure DBLookupComboBox5Exit(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure DBComboBox17KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBoxLicencaGenericaExit(Sender: TObject);
    procedure DBComboBox15KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox14KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit40KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox11KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox10KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox9KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox8KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit40Exit(Sender: TObject);
    procedure pnConfiguracoesOKClick(Sender: TObject);
    procedure pnConfiguracoesCancClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure bnExportarLogoClick(Sender: TObject);
    procedure bnExportarLicencaClick(Sender: TObject);
    procedure GroupBox6Exit(Sender: TObject);
    procedure GroupBox6Enter(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBEdit_SenhaSMTPChange(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBComboBox_TipoDocumentoChange(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBComboBox_TipoDocumentoExit(Sender: TObject);
    procedure DBComboBox_TipoDocumentoEnter(Sender: TObject);
    procedure ListBox1Enter(Sender: TObject);
    procedure edLicencaOuConvenioExit(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure AtualizarCamposMascaras;
  private
    procedure montarComponentes;
  public
    { Public declarations }
  end;

var
  frmCadCobreBem: TfrmCadCobreBem;
  obCobrebem: TCobreBem;
  CobrebemX: Variant;

implementation

uses
  uDtmAtivo, udtmBoleto, uDataSet_OOP, DB, StrUtils, uDadosIni, DBClient;

{$R *.dfm}

procedure TfrmCadCobreBem.AtualizarCamposMascaras;
var
	I: Integer;
begin
  if (obCobrebem.dataSet.State in [dsInsert, dsEdit]) then
  	 if trim(obCobrebem.dataSet.FieldByName('BANCO').AsString) <> '' then
	  	obCobrebem.dataSet.FieldByName('BANCO').AsString := vDadosIni.StrZero(obCobrebem.dataSet.FieldByName('BANCO').AsString, 3);

  Label87.Visible :=
  	(trim(obCobrebem.dataSet.FieldByName('BANCO').AsString) = '001');
  DBEdit51.Visible :=
  	(trim(obCobrebem.dataSet.FieldByName('BANCO').AsString) = '001');

  Label85.Visible :=
  	(trim(obCobrebem.dataSet.FieldByName('BANCO').AsString) = '237')
    	or (trim(obCobrebem.dataSet.FieldByName('BANCO').AsString) = '033');
  DBEdit50.Visible := (trim(obCobrebem.dataSet.FieldByName('BANCO').AsString) = '237')
  		or (trim(obCobrebem.dataSet.FieldByName('BANCO').AsString) = '033');

  obCobrebem.SqlOpen(' select qrcode_pix from bancos_homologados ' +
  	 ' where codbanco = ' + QuotedStr(vDadosIni.StrZero(obCobrebem.dataset.FieldByName('BANCO').AsString, 3)), obCobrebem.buscas);

  Label107.Visible := trim(obCobrebem.buscas.FieldByName('QRCODE_PIX').AsString) = 'S';
  DBComboBox18.Visible := trim(obCobrebem.buscas.FieldByName('QRCODE_PIX').AsString) = 'S';

  for I := 0 to DBComboBox9.Items.Count - 1 do
  begin
    if (trim(obCobrebem.dataSet.FieldByName('AMBIENTE').AsString) = trim(DBComboBox9.Items[I])) then
    begin
      DBComboBox9.ItemIndex := I;
      DBComboBox9.Text := DBComboBox9.Items[DBComboBox9.ItemIndex];
      break;
    end;
  end;

  for I := 0 to DBComboBox11.Items.Count - 1 do
  begin
    if (trim(obCobrebem.dataSet.FieldByName('TIPO_CONTA').AsString) = trim(DBComboBox11.Items[I])) then
    begin
      DBComboBox11.ItemIndex := I;
      DBComboBox11.Text := DBComboBox11.Items[DBComboBox11.ItemIndex];
      break;
    end;
  end;


  for I := 0 to DBComboBox8.Items.Count - 1 do
  begin
    if (Copy(trim(obCobrebem.dataSet.FieldByName('TIPODOCUMENTOCOBRANCA').AsString), 1, 2) = Copy(trim(DBComboBox8.Items[I]), 1, 2)) then
    begin
      DBComboBox8.ItemIndex := I;
      DBComboBox8.Text := DBComboBox8.Items[DBComboBox8.ItemIndex];
      break;
    end;
  end;

  obCobrebem.setarMascaraTipoPlugBoleto;
end;

procedure TfrmCadCobreBem.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BOL005]';
  if not vDadosIni.PesqPros('COB001', 'PESQUISAR', '', 'COBREBEM', '', obCobrebem.buscas, true) then
  	exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not obCobrebem.ConsultaCampos('COBREBEM', ComboBox1.Text,
      ' COBREBEM.COD_COBREBEM', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      ' COBREBEM.*, EMPRESA.IDENTIFICACAO_EMP',
      ' LEFT JOIN EMPRESA ON EMPRESA.COD_EMPRESA = COBREBEM.COD_EMP_MULT ', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if not obCobrebem.ConsultaCampos('COBREBEM', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'COBREBEM.COD_COBREBEM', true, vDadosIni.codEmpresa,
      ' COBREBEM.*, EMPRESA.IDENTIFICACAO_EMP',
      ' LEFT JOIN EMPRESA ON EMPRESA.COD_EMPRESA = COBREBEM.COD_EMP_MULT ', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
      
  if obCobrebem.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if (DBGrid1.Columns[i].FieldName = 'HTMLBOLETO')
          or (DBGrid1.Columns[i].FieldName = 'HTMLBOLETOEMAIL')
          or (DBGrid1.Columns[i].FieldName = 'OUTRAS_CONFIG_BOL') then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadCobreBem.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  if vDadosIni.PesqPros('COB002', 'INSERIR', '', 'COBREBEM',
    '', obCobrebem.buscas, true) then
  begin
    if not obCobrebem.Insert then
    begin
    	PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      Exit;
    end;

	 if trim(obCobrebem.dataSet.FieldByName('TIPO_API').AsString) = 'S' then
    	AtualizarCamposMascaras;

    Memo1.Clear;
	  Memo1.Visible := false;

    Label129.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit66.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;
    DBLookupComboBox14.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;

    DBEdit66.Enabled := (obCobrebem.dataSet.State = dsInsert);
    DBLookupComboBox14.Enabled := (obCobrebem.dataSet.State = dsInsert);

    DBEdit9.Enabled := (obCobrebem.dataSet.State = dsInsert);
    DBLookupComboBox2.Enabled := (obCobrebem.dataSet.State = dsInsert);

    DBComboBox17.Enabled := trim(obCobrebem.dataSet.FieldByName('PERMITE_PROTESTO').AsString) = 'S';
  	DBEdit46.Enabled := trim(obCobrebem.dataSet.FieldByName('PERMITE_PROTESTO').AsString) = 'S';

    bnExportarLicenca.Enabled := false;
    bnExportarLogo.Enabled := false;

    DBComboBoxLicencaGenerica.ItemIndex := 1;
    DBComboBoxLicencaGenerica.Enabled := False;
    DBEditNomeCedente.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;
  	DBEditCPFCNPJ.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;
  	DBEditTamanhoCedente.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    montarComponentes;
    if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
      DBEdit66.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (edLicencaOuConvenio.CanFocus) then
      edLicencaOuConvenio.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
    	DBEdit9.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
      DBEdit32.SetFocus;
  end;
end;

procedure TfrmCadCobreBem.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
	  BitBtn4.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (BitBtn7.CanFocus) then
  	BitBtn7.SetFocus;
  if not obCobrebem.Post then
  begin
    setFocusCampoErro(obCobrebem.vNomeCampoErro, obCobrebem.vMensagemErro);
    exit;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obCobrebem.Insert then
      begin
      	obCobrebem.setarMascaraTipoPlugBoleto;
      	if trim(obCobrebem.dataSet.FieldByName('TIPO_API').AsString) = 'S' then
        	PageControl2.ActivePage := TabSheet5
        else
	        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
          DBEdit66.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (edLicencaOuConvenio.CanFocus) then
          edLicencaOuConvenio.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
          DBEdit9.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
          DBEdit32.SetFocus;
      end;
      MudaCor;
    end
    else
    begin
      inherited;
//      obCobrebem.abreCobreBem(0);
      obCobrebem.setarMascaraTipoPlugBoleto;
    end;
  end;
end;

procedure TfrmCadCobreBem.BitBtn5Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('COB009', 'CANCELAR', '', 'COBREBEM',
    obCobrebem.dataSet.FieldByName('COD_COBREBEM').AsString, obCobrebem.buscas, true) then
    	exit;

  inherited;
  obCobrebem.Cancel;
//  obCobrebem.abreCobreBem(0);
  obCobrebem.setarMascaraTipoPlugBoleto;
end;

procedure TfrmCadCobreBem.bnExportarLicencaClick(Sender: TObject);
begin
  inherited;
	obCobrebem.exportaLicencaCobrebem;
end;

procedure TfrmCadCobreBem.bnExportarLogoClick(Sender: TObject);
begin
  inherited;
	obCobrebem.exportaLogotipoCobrebem;
end;

procedure TfrmCadCobreBem.DBComboBox10KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadCobreBem.DBComboBox11KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadCobreBem.DBComboBox14KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	key := #0;
end;

procedure TfrmCadCobreBem.DBComboBox15KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadCobreBem.DBComboBox17KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	key := #0;
end;

procedure TfrmCadCobreBem.DBComboBox18KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadCobreBem.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  DBComboBox1.Enabled := obCobrebem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S';
end;

procedure TfrmCadCobreBem.DBComboBox7Exit(Sender: TObject);
begin
  inherited;
	DBComboBox17.Enabled := trim(obCobrebem.dataSet.FieldByName('PERMITE_PROTESTO').AsString) = 'S';
  DBEdit46.Enabled := trim(obCobrebem.dataSet.FieldByName('PERMITE_PROTESTO').AsString) = 'S';
end;

procedure TfrmCadCobreBem.DBComboBox7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadCobreBem.DBComboBox8KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	key := #0;
end;

procedure TfrmCadCobreBem.DBComboBox9KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadCobreBem.DBComboBoxLicencaGenericaExit(Sender: TObject);
begin
  inherited;
	DBEditNomeCedente.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;
  DBEditCPFCNPJ.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;
  DBEditTamanhoCedente.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;
end;

procedure TfrmCadCobreBem.DBComboBox_TipoDocumentoChange(Sender: TObject);
begin
  inherited;
  ListBox1.ItemIndex := DBComboBox_TipoDocumento.ItemIndex;
end;

procedure TfrmCadCobreBem.DBComboBox_TipoDocumentoEnter(Sender: TObject);
begin
  inherited;
  ListBox1.Visible := true;
end;

procedure TfrmCadCobreBem.DBComboBox_TipoDocumentoExit(Sender: TObject);
begin
  inherited;
  ListBox1.Visible := False;
end;

procedure TfrmCadCobreBem.DBEdit1Enter(Sender: TObject);
begin
  inherited;
  if trim(obCobrebem.dataSet.FieldByName('TIPO_API').AsString) = '' then
	  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadCobreBem.DBEdit40Exit(Sender: TObject);
begin
  inherited;
  AtualizarCamposMascaras;
end;

procedure TfrmCadCobreBem.DBEdit40KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key <> #8 then
    if not (key in ['1','2','3','4','5','6','7','8','9','0']) then
      key := #0;
end;

procedure TfrmCadCobreBem.DBEdit5Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Text := TDBEdit(Sender).Hint;
  if Trim(Memo1.Lines.Text) <> '' then
    Memo1.Visible := true;
end;

procedure TfrmCadCobreBem.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) then
    Exit;
    
  if not (obCobrebem.dataSet.State in [dsInsert, dsEdit]) then
  	exit;

  obCobrebem.atualizarDadosContaCorrente;

  obCobrebem.vNumContaCorrente := obCobrebem.dataSet.FieldByName('NUMEROCONTACORRENTE').AsString;
end;

procedure TfrmCadCobreBem.edLicencaOuConvenioExit(Sender: TObject);
var
  I: Integer;
  temp: string;
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) then
    Exit;

  if not (obCobrebem.dataSet.State in [dsInsert, dsEdit]) then
  	exit;

  Memo1.Clear;
  Memo1.Visible := false;
  // Se necessario colocar os dados da API aqui
  if obCobrebem.validaArquivoLicenca then
  begin
    Edit1.Text := obCobrebem.NomeBanco;

    temp := DBComboBox_ArquivoRemessa.Text;
    DBComboBox_ArquivoRemessa.Clear;
    DBComboBox_ArquivoRemessa.Items.Add('');
    for I := 0 to High(obCobrebem.Layout.LayoutsArquivoRemessa) do
      DBComboBox_ArquivoRemessa.Items.Add(obCobrebem.Layout.LayoutsArquivoRemessa[i]);
    DBComboBox_ArquivoRemessa.Text := temp;

    temp := DBComboBox_ArquivoRetorno.Text;
    DBComboBox_ArquivoRetorno.Clear;
    DBComboBox_ArquivoRetorno.Items.Add('');
    for I := 0 to High(obCobrebem.Layout.LayoutsArquivoRetorno) do
      DBComboBox_ArquivoRetorno.Items.Add(obCobrebem.Layout.LayoutsArquivoRetorno[i]);
    DBComboBox_ArquivoRetorno.Text := temp;

    temp := DBComboBox_BoletoImpresso.Text;
    DBComboBox_BoletoImpresso.Clear;
    DBComboBox_BoletoImpresso.Items.Add('');
    for I := 0 to High(obCobrebem.Layout.LayoutsBoleto) do
      DBComboBox_BoletoImpresso.Items.Add(obCobrebem.Layout.LayoutsBoleto[i]);
    DBComboBox_BoletoImpresso.Text := temp;

    temp := DBComboBox_BoletoEmail.Text;
    DBComboBox_BoletoEmail.Clear;
    DBComboBox_BoletoEmail.Items.Add('');
    for I := 0 to High(obCobrebem.Layout.LayoutsBoletoEmail) do
      DBComboBox_BoletoEmail.Items.Add(obCobrebem.Layout.LayoutsBoletoEmail[i]);
    DBComboBox_BoletoEmail.Text := temp;

    temp := DBComboBox_TipoDocumento.Text;
    DBComboBox_TipoDocumento.Clear;
    ListBox1.Clear;
    for I := 0 to High(obCobrebem.Layout.TiposDocumentosCobranca[1]) do
    begin
      DBComboBox_TipoDocumento.Items.Add(obCobrebem.Layout.TiposDocumentosCobranca[1, i]);
      ListBox1.Items.Add(obCobrebem.Layout.TiposDocumentosCobranca[2, i]);
    end;
    DBComboBox_TipoDocumento.Text := temp;
    if obCobrebem.CabecalhoOutroDadoConfiguracao1 <> '' then
      Label39.Caption := obCobrebem.CabecalhoOutroDadoConfiguracao1 + ':'
    else
      Label39.Caption := 'Dados Configuração 1:';

    if obCobrebem.CabecalhoOutroDadoConfiguracao2 <> '' then
      Label40.Caption := obCobrebem.CabecalhoOutroDadoConfiguracao2 + ':'
    else
      Label40.Caption := 'Dados Configuração 2:';
    Label39.Left := DBEdit28.Left - 6 - Label39.Width;
    Label40.Left := DBEdit28.Left - 6 - Label40.Width;
  end;
end;

procedure TfrmCadCobreBem.DBEdit_SenhaSMTPChange(Sender: TObject);
begin
  inherited;
  if not (obCobrebem = nil) then
    obCobrebem.vModificarSenha := true;
end;

procedure TfrmCadCobreBem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(sender)
  else if (key = VK_DELETE) then
    SpeedButton2Click(sender)
  else if key = VK_INSERT then
    BitBtn3Click(sender);
end;

procedure TfrmCadCobreBem.DBLookupComboBox5Exit(Sender: TObject);
begin
  inherited;
  AtualizarCamposMascaras;
end;

procedure TfrmCadCobreBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadCobreBem := nil;
end;

procedure TfrmCadCobreBem.FormCreate(Sender: TObject);
begin
  inherited;
  obCobrebem := TCobreBem.create;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCobreBem.FormShow(Sender: TObject);
var
  I: Integer;
begin
  if not Self.Enabled then
    Exit;

	TabSheet4.TabVisible := false;
  TabConfiguracoes.TabVisible := false;
  
  DBGrid1.DataSource := DtmBoletos.dsCobreBem;
  obCobrebem.abreCobreBem(0);

  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  //  for I := 0 to self.ComponentCount - 1 do
  //  begin
  //    if Components[i] is TDBEdit then
  //      TDBEdit(Components[i]).CharCase:= ecUpperCase;
  //    if Components[I] is TDBComboBox then
  //       TDBComboBox(Components[I]).CharCase := ecUpperCase;
  //  end;

  DBEdit13.CharCase := ecNormal;
  DBEdit14.CharCase := ecNormal;
  DBEdit15.CharCase := ecNormal;
  DBEdit16.CharCase := ecNormal;
  DBEdit18.CharCase := ecNormal;
  DBEdit_SenhaSMTP.CharCase := ecNormal;
  DBComboBox_ArquivoRemessa.CharCase := ecNormal;
  DBComboBox_ArquivoRetorno.CharCase := ecNormal;
  DBComboBox_BoletoImpresso.CharCase := ecNormal;
  DBComboBox_BoletoEmail.CharCase := ecNormal;
  obCobrebem.setarMascaraTipoPlugBoleto;

  if obCobrebem.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
  TabSheet3.TabVisible := true;
  //  obCobrebem.CriarCobrebemX;
  TabLicencaGenerica.TabVisible := false;
  TabEnvioEmail.TabVisible := false;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadCobreBem.GroupBox6Enter(Sender: TObject);
begin
  inherited;
  DBComboBox1.Enabled := obCobrebem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S';
end;

procedure TfrmCadCobreBem.GroupBox6Exit(Sender: TObject);
begin
  inherited;
  DBComboBox1.Enabled := obCobrebem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S';
end;

procedure TfrmCadCobreBem.ListBox1Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox_TipoDocumento.CanFocus) then
	  DBComboBox_TipoDocumento.SetFocus;
end;

procedure TfrmCadCobreBem.montarComponentes;
begin
  bnExportarLicenca.Enabled     := (trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '')
  	and (trim(obCobrebem.dataSet.FieldByName('LICENCA').AsString) <> '') and (obCobrebem.dataSet.State = dsEdit);
	bnExportarLogo.Enabled        := (trim(obCobrebem.dataSet.FieldByName('LOGOTIPO').AsString) <> '')
    and (obCobrebem.dataSet.State = dsEdit);
  lbLicencaOuConvenio.Caption   := IfThen(trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '', 'Arquivo Licença', 'Código convênio');
  edLicencaOuConvenio.DataField := IfThen(trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '', 'ARQUIVOLICENCA', 'CODIGOCONVENIO');
  edLicencaOuConvenio.Hint      := IfThen(trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '', 'Endereço do arquivo de licença.', 'Código do convênio');
  TabSheetOutrasConf.TabVisible := trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '';
  TabLicencaGenerica.TabVisible := trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '';
  TabEnvioEmail.TabVisible      := trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '';
  TabLayouts.TabVisible         := trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '';
  Memo1.Visible                 := trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '';
  DBEdit49.Enabled              := trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) <> '';
  DBEdit53.Enabled              := trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) <> '';

  if trim(obCobrebem.dataSet.FieldByName('tipo_api').AsString) = '' then
    edLicencaOuConvenio.OnExit := edLicencaOuConvenioExit
  else
    edLicencaOuConvenio.OnExit := nil;
end;

procedure TfrmCadCobreBem.PageControl2Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
	for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TfrmCadCobreBem.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
	for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TfrmCadCobreBem.pnConfiguracoesCancClick(Sender: TObject);
begin
  TForm(pnTipoConfiguracoes.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadCobreBem.pnConfiguracoesOKClick(Sender: TObject);
begin
	if RadioGroupOpcoes.ItemIndex = 1 then
  begin
		if not obCobrebem.existeConfigPlugBoleto then
    begin
    	Application.MessageBox('Configuração de boletos não encontrado no Cadastro de API.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  	  exit;
    end;
  end;
  
  TForm(pnTipoConfiguracoes.Parent).ModalResult := IDOK;
end;

procedure TfrmCadCobreBem.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if (obCobrebem.dataSet.State in [dsEdit, dsInsert]) then
    obCobrebem.dataSet.FieldByName('IMAGENSBOLETO').asString :=
      obCobrebem.selecionarDiretorio(obCobrebem.dataSet.FieldByName('IMAGENSBOLETO').asString);

  if (Self.Enabled) and (Self.Visible) and (DBEdit_ImagemCodigoBarras.CanFocus) then
	  DBEdit_ImagemCodigoBarras.SetFocus;
end;

procedure TfrmCadCobreBem.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.InitialDir :=
    ExtractFilePath(obCobrebem.dataSet.FieldByName('ARQUIVOLICENCA').asString);

  OpenDialog1.Filter := 'Configuração (*.conf)|*.conf';
  OpenDialog1.DefaultExt := 'conf';
  OpenDialog1.Title := 'Selecione o Arquivo de Configuração';
  OpenDialog1.FileName := '';
  if (OpenDialog1.Execute) and (obCobrebem.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (Length(OpenDialog1.FileName) > 128) then
    begin
    	Application.MessageBox('Este caminho está muito longo, selecione outro caminho.', 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      OpenDialog1.FileName := '';
    end
    else
      obCobrebem.dataSet.FieldByName('ARQUIVOLICENCA').asString := OpenDialog1.FileName;
    PageControl3.ActivePage := TabSheet3;

    if (Self.Enabled) and (Self.Visible) and (edLicencaOuConvenio.CanFocus) then
	    edLicencaOuConvenio.SetFocus;
  end;
end;

procedure TfrmCadCobreBem.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  OpenPictureDialog1.InitialDir :=
    ExtractFilePath(obCobrebem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString);
  OpenPictureDialog1.Filter := 'Imagens (*.jpg; *.jpeg; *.giff)|*.jpg;*.jpeg;*.giff';
  OpenPictureDialog1.Title := 'Selecione a Imagem do Logotipo';
  OpenPictureDialog1.FileName := '';
  if (OpenPictureDialog1.Execute) and (obCobrebem.dataSet.State in [dsEdit, dsInsert]) then
    obCobrebem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString := OpenPictureDialog1.FileName;

  if (Self.Enabled) and (Self.Visible) and (DBEdit_ImagemLogotipo.CanFocus) then
	  DBEdit_ImagemLogotipo.SetFocus;       	
end;

procedure TfrmCadCobreBem.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.InitialDir :=
    ExtractFilePath(obCobrebem.dataSet.FieldByName('CAMINHO_CERT').asString);

  OpenDialog1.Filter := 'Configuração (*.pfx)|*.pfx';
  OpenDialog1.DefaultExt := 'conf';
  OpenDialog1.Title := 'Selecione o Certificado Digital';
  OpenDialog1.FileName := '';
  if (OpenDialog1.Execute) and (obCobrebem.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (Length(OpenDialog1.FileName) > 256) then
    begin
      Application.MessageBox('Este caminho está muito longo, selecione outro caminho.', 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      OpenDialog1.FileName := '';
    end
    else
    begin
      obCobrebem.dataSet.FieldByName('CAMINHO_CERT').asString := OpenDialog1.FileName;
      obCobrebem.obterDadosCertificado;
    end;

		PageControl2.ActivePage := TabSheet7;
    if (Self.Enabled) and (Self.Visible) and (DBEdit_CaminhoCertificado.CanFocus) then
	    DBEdit_CaminhoCertificado.SetFocus;
  end;
end;

procedure TfrmCadCobreBem.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if vDadosIni.PesqPros('COB003', 'EDITAR', '', 'COBREBEM',
    obCobrebem.dataSet.FieldByName('COD_COBREBEM').AsString, obCobrebem.buscas, true) then
  begin
    if obCobrebem.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
      exit;

    if not obCobrebem.Edit then
      exit;

    if trim(obCobrebem.dataSet.FieldByName('TIPO_API').AsString) = 'S' then
    	AtualizarCamposMascaras;

    Memo1.Clear;
    Memo1.Visible := false;

    Label129.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit66.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;
    DBLookupComboBox14.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;

    Label14.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit9.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;
    DBLookupComboBox2.Visible := false;//vDadosIni.vEmp.vFinanceiroUnificado;

    DBEdit66.Enabled := (obCobrebem.dataSet.State = dsInsert);
    DBLookupComboBox14.Enabled := (obCobrebem.dataSet.State = dsInsert);

    DBEdit9.Enabled := (obCobrebem.dataSet.State = dsInsert);
    DBLookupComboBox2.Enabled := (obCobrebem.dataSet.State = dsInsert);

    DBComboBox17.Enabled := trim(obCobrebem.dataSet.FieldByName('PERMITE_PROTESTO').AsString) = 'S';
  	DBEdit46.Enabled := trim(obCobrebem.dataSet.FieldByName('PERMITE_PROTESTO').AsString) = 'S';

    bnExportarLicenca.Enabled := trim(obCobrebem.dataSet.FieldByName('LICENCA').asString) <> '';
    bnExportarLogo.Enabled := trim(obCobrebem.dataSet.FieldByName('LOGOTIPO').asString) <> '';

    if obCobrebem.dataSet.FieldByName('LICENCA_GENERICA').AsString <> 'S' then
    begin
    	DBComboBoxLicencaGenerica.ItemIndex := 1;
    	DBComboBoxLicencaGenerica.Enabled := False;
    end
    else
    begin
    	DBComboBoxLicencaGenerica.ItemIndex := 0;
    	DBComboBoxLicencaGenerica.Enabled := True;
    end;

    DBEditNomeCedente.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;
  	DBEditCPFCNPJ.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;
  	DBEditTamanhoCedente.Enabled := DBComboBoxLicencaGenerica.ItemIndex = 0;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    if obCobrebem.dataSet.FieldByName('TIPO_API').asString = 'S' then
    begin
      PageControl1.ActivePage := TabSheet4;
      TabSheet4.Show;

      PageControl2.ActivePage := TabSheet5;
      TabSheet5.Show;
    end
    else
    begin
    	PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;

      PageControl3.ActivePage := TabSheet3;
      TabSheet3.Show;

      edLicencaOuConvenioExit(sender);
    end;

    if not (obCobrebem.dataSet.FieldByName('TIPODOCUMENTOCOBRANCA').isNull) then
      DBComboBox_TipoDocumento.ItemIndex := DBComboBox_TipoDocumento.Items.IndexOf(trim(obCobrebem.dataSet.FieldByName('TIPODOCUMENTOCOBRANCA').AsString));
    if not (obCobrebem.dataSet.FieldByName('LAYOUTBOLETOIMPRESSO').isNull) then
      DBComboBox_BoletoImpresso.ItemIndex := DBComboBox_BoletoImpresso.Items.IndexOf(trim(obCobrebem.dataSet.FieldByName('LAYOUTBOLETOIMPRESSO').AsString));
    if not (obCobrebem.dataSet.FieldByName('LAYOUTBOLETOSEMAIL').isNull) then
      DBComboBox_BoletoEmail.ItemIndex := DBComboBox_BoletoEmail.Items.IndexOf(trim(obCobrebem.dataSet.FieldByName('LAYOUTBOLETOSEMAIL').AsString));
    if not (obCobrebem.dataSet.FieldByName('LAYOUTARQUIVOREMESSA').isNull) then
      DBComboBox_ArquivoRemessa.ItemIndex := DBComboBox_ArquivoRemessa.Items.IndexOf(trim(obCobrebem.dataSet.FieldByName('LAYOUTARQUIVOREMESSA').AsString));
    if not (obCobrebem.dataSet.FieldByName('LAYOUTARQUIVORETORNO').isNull) then
      DBComboBox_ArquivoRetorno.ItemIndex := DBComboBox_ArquivoRetorno.Items.IndexOf(trim(obCobrebem.dataSet.FieldByName('LAYOUTARQUIVORETORNO').AsString));

    montarComponentes;
    if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
      DBEdit66.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (edLicencaOuConvenio.CanFocus) then
      edLicencaOuConvenio.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
      DBEdit32.SetFocus;
  end;
end;

procedure TfrmCadCobreBem.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('BOL007', 'ABRIR A LIXEIRA', '', 'COBREBEM',
    '', obCobrebem.buscas, true) then
  begin
    if not obCobrebem.abrelixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [BOL005]';
      SpeedButton1.Visible := True;
      SpeedButton5.Visible := False;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [BOL004]';
      SpeedButton1.Visible := False;
      SpeedButton5.Visible := True;
    end;
  end;
end;

procedure TfrmCadCobreBem.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('COB005', '', '', 'COBREBEM', '', obCobrebem.buscas, false) then
  begin
    if obCobrebem.Delete then
    begin
      if obCobrebem.StatusLixeira then
      begin
        lixeiraVazia(false);
      end
      else
      begin
        lixeiraVazia(true);
        obCobrebem.abreCobreBem(0);
      end;
    end;
  end;

end;

procedure TfrmCadCobreBem.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('COB006', '', '', 'COBREBEM', '', obCobrebem.buscas, false) then
  begin
    if obCobrebem.restauraLixeira then
    begin
      if obCobrebem.StatusLixeira then
        lixeiraVazia(false)
      else
      begin
        lixeiraVazia(true);
        obCobrebem.abreCobreBem(0);
      end;
    end;
  end;
end;

procedure TfrmCadCobreBem.SpeedButton6Click(Sender: TObject);
var
  arquivoretorno: TArqBoleto;
  hdBoletos: THandle;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdBoletos = 0 then
      arquivoretorno.carregaPacote('pkBoletos', hdboletos);
    arquivoretorno.cadArqBoleto(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadCobreBem.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if (obCobrebem.dataSet.State in [dsEdit, dsInsert]) then
    obCobrebem.dataSet.FieldByName('ENDERECOREMESSARETORNO').asString :=
      obCobrebem.selecionarDiretorio(obCobrebem.dataSet.FieldByName('ENDERECOREMESSARETORNO').asString);

  if (Self.Enabled) and (Self.Visible) and (DBEdit_EnderecoRemessaRetorno.CanFocus) then
	  DBEdit_EnderecoRemessaRetorno.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit_EnderecoRemessaRetorno2.CanFocus) then
	  DBEdit_EnderecoRemessaRetorno2.SetFocus;
end;

end.

