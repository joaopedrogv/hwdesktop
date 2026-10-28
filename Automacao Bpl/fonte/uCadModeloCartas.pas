unit uCadModeloCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask,uClassesCadastrosBasicos, DBCtrls, OleCtrls,
  SHDocVw, MSHTML, uDadosIni, uEditMoeda;

const
  IDM_MARCADOR = 2184;
  IDM_MARCADOR_LISTA = 2185;
  IDM_OUTDENT = 2187;
  IDM_INDENT = 2186;
  IDM_ALINHARESQ = 59;
  IDM_CENTRALIZAR = 57;
  IDM_JUSTIFICAR = 50;
  IDM_ALINHADIR = 60;
  IDM_IMAGEM = 2168;
  IDM_LINHAHORIZ = 2150;
  IDM_RECORTAR = 16;
  IDM_COPIAR = 15;
  IDM_COLAR = 26;
  IDM_HYPERLINK = 2124;
  IDM_DESFAZER = 43;  

type
	Tcadastrosbasicos_inserirtag_rtf = function(): string;
  Tcadastrosbasicos_inserircampo_rtf = function(pId: string): string;
  Tcadastrosbasicos_inserirtag_html = function(): string;
  Tcadastrosbasicos_inserirtag_template = function(): string;

  TfrmCadModeloCartas = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    BitBtn7: TBitBtn;
    vRichEditDadosCarta: TRichEdit;
    TabSheet4: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    DBLookupListBox2: TDBLookupListBox;
    DBLookupListBox1: TDBLookupListBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    DBText1: TDBText;
    DBText2: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBComboBox1: TDBComboBox;
    Label15: TLabel;
    DBComboBox2: TDBComboBox;
    TabSheet5: TTabSheet;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    Label16: TLabel;
    DBEdit3: TDBEdit;
    Label18: TLabel;
    DBComboBox3: TDBComboBox;
    cdColor: TColorDialog;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    tsControles: TTabSheet;
    pnControles: TPanel;
    Panel48: TPanel;
    btEnviarNot: TBitBtn;
    btControlesNotCanc: TBitBtn;
    DBGridControlesNot: TDBGrid;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    btNaoEnviarNot: TBitBtn;
    SpeedButton15: TSpeedButton;
    SpeedButton59: TSpeedButton;
    Panel5: TPanel;
    Label19: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    tsPlataforma: TTabSheet;
    pnPlataforma: TPanel;
    Panel7: TPanel;
    DBGrid2: TDBGrid;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Panel8: TPanel;
    Label20: TLabel;
    PageControl2: TPageControl;
    tsHtml: TTabSheet;
    tsMarkdown: TTabSheet;
    Panel6: TPanel;
    Panel78: TPanel;
    WebBrowser1: TWebBrowser;
    Panel99: TPanel;
    Label423: TLabel;
    BitBtn10: TBitBtn;
    Panel9: TPanel;
    Label21: TLabel;
    BitBtn13: TBitBtn;
    Panel10: TPanel;
    DBMemo1: TDBMemo;
    Panel11: TPanel;
    Panel12: TPanel;
    BitBtn14: TBitBtn;
    SpeedButton16: TSpeedButton;
    Panel13: TPanel;
    Label22: TLabel;
    DBComboBox5: TDBComboBox;
    bt_outros_prod: TSpeedButton;
    pmOutros: TPopupMenu;
    MenuCartasCobranca: TMenuItem;
    MenuCartasClientes: TMenuItem;
    MenuCartasVeiculos: TMenuItem;
    MenuNotFinanceiros: TMenuItem;
    MenuTiposDocumento: TMenuItem;
    TabSheet6: TTabSheet;
    GroupBox5: TGroupBox;
    Panel14: TPanel;
    Label23: TLabel;
    Label26: TLabel;
    SpeedButton18: TSpeedButton;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Panel16: TPanel;
    Label27: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Panel17: TPanel;
    Label28: TLabel;
    PageControl4: TPageControl;
    tsHtml2: TTabSheet;
    Panel18: TPanel;
    Panel19: TPanel;
    WebBrowser2: TWebBrowser;
    Panel20: TPanel;
    Label29: TLabel;
    BitBtn15: TBitBtn;
    Panel21: TPanel;
    tsMarkdown2: TTabSheet;
    Panel22: TPanel;
    Label30: TLabel;
    BitBtn17: TBitBtn;
    Panel23: TPanel;
    DBMemo2: TDBMemo;
    Panel24: TPanel;
    Panel25: TPanel;
    Label31: TLabel;
    DBComboBox6: TDBComboBox;
    Panel26: TPanel;
    Label32: TLabel;
    DBComboBox8: TDBComboBox;
    DBComboBox9: TDBComboBox;
    DBComboBox7: TDBComboBox;
    procedure DBComboBox9Exit(Sender: TObject);
    procedure DBComboBox7Exit(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure bt_outros_prodClick(Sender: TObject);
    procedure MenuTiposDocumentoClick(Sender: TObject);
    procedure MenuNotFinanceirosClick(Sender: TObject);
    procedure MenuCartasVeiculosClick(Sender: TObject);
    procedure MenuCartasClientesClick(Sender: TObject);
    procedure MenuCartasCobrancaClick(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure DBComboBox5Exit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure btNaoEnviarNotClick(Sender: TObject);
    procedure DBGridControlesNotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridControlesNotCellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGridControlesNotDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton8Click(Sender: TObject);
    procedure btEnviarNotClick(Sender: TObject);
    procedure btControlesNotCancClick(Sender: TObject);
    procedure DBComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure SpeedButton62Click(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
    procedure SpeedButton58Click(Sender: TObject);
    procedure SpeedButton57Click(Sender: TObject);
    procedure SpeedButton56Click(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure configuraEntrada;
    procedure DocumentoEmBranco(WebBrowser: TWebBrowser);
    procedure carregarwebbrownser(pWebBrowser: TWebBrowser; pHtml: string);
    procedure configurarFormPorTipo(pCriarClasse: Boolean = True);
    procedure checkMenu;
  private
    { Private declarations }
  public
    { Public declarations }
    _AbrirnoEditor_ : boolean;
    _Acao_ : string;
    _Codigo_ : integer;
    _Form_ : TfrmCadModeloCartas;
    _Descricao_ : string;
    DataUltConsSql: string;
  end;

var
  frmCadModeloCartas: TfrmCadModeloCartas;
  HTMLDocumento:IHTMLDocument2;
//  obModeloCartas : TModeloCartas;

implementation

uses UDtmCadastrosBasicos, uDtmAtivo, UEditorCartas, DB, funcoes, Clipbrd, UListar, UListaCamposSql, uDataSet_OOP;

procedure ErpSincConsultasSQL(Silent: Boolean); stdcall; external 'hw.nfe.dx.dll';

function ErpSincConsultasExisteAtualizacao(Silent: Boolean): Boolean; stdcall; external 'hw.nfe.dx.dll';

{$R *.dfm}

function GetIEHandle(WebBrowser: TWebbrowser; ClassName: string): HWND;
var
  hwndChild, hwndTmp: HWND;
  oleCtrl: TOleControl;
  szClass: array [0..255] of char;
begin
  oleCtrl :=WebBrowser;
  hwndTmp := oleCtrl.Handle;
  while (true) do
  begin
    hwndChild := GetWindow(hwndTmp, GW_CHILD);
    GetClassName(hwndChild, szClass, SizeOf(szClass));
    if (string(szClass)=ClassName) then
    begin
      Result :=hwndChild;
      Exit;
    end;
    hwndTmp := hwndChild;
  end;
  Result := 0;
end;

procedure TfrmCadModeloCartas.BitBtn10Click(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
	HTMLDocument := WebBrowser1.Document as IHTMLDocument2;
  carregarwebbrownser(
  	WebBrowser1,
    vDadosIni.abreFormEditorHtml(
    	HTMLDocument.body.innerHTML,
      obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString,
      true));
end;

procedure TfrmCadModeloCartas.BitBtn11Click(Sender: TObject);
begin
  inherited;
	TForm(pnPlataforma.Parent).ModalResult := IDOK;
end;

procedure TfrmCadModeloCartas.BitBtn12Click(Sender: TObject);
begin
  inherited;
  TForm(pnPlataforma.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadModeloCartas.BitBtn13Click(Sender: TObject);
begin
	try
    try
      Application.CreateForm(TfrmListar, frmListar);
      frmListar._Tabela_ := 'MACRO';
      frmListar.ShowModal;
      if FrmListar._Registro <> '' then
        DBMemo1.SelText := '{{' + frmListar._Registro + '}}';
    except
    end;
  finally
    frmListar.Free;
  end;
end;

procedure TfrmCadModeloCartas.BitBtn14Click(Sender: TObject);
begin
  try
    try
      Application.CreateForm(TfrmListarCamposSql, frmListarCamposSql);
      frmListarCamposSql._Id_ := obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString;
      frmListarCamposSql.ShowModal;
      if frmListarCamposSql._Registro <> '' then
      	if DBMemo1.Enabled then
        	DBMemo1.SelText := '{{' + frmListarCamposSql._Registro + '}}';
    except
    end;
  finally
    frmListarCamposSql.Free;
  end;
end;

procedure TfrmCadModeloCartas.BitBtn15Click(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
	HTMLDocument := WebBrowser2.Document as IHTMLDocument2;
  carregarwebbrownser(
  	WebBrowser2,
    vDadosIni.abreFormEditorHtml(
    	HTMLDocument.body.innerHTML,
      obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString,
      true));
end;

procedure TfrmCadModeloCartas.BitBtn17Click(Sender: TObject);
begin
  try
    try
      Application.CreateForm(TfrmListarCamposSql, frmListarCamposSql);
      frmListarCamposSql._Id_ := obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString;
      frmListarCamposSql.ShowModal;
      if frmListarCamposSql._Registro <> '' then
      	if DBMemo2.Enabled then
        	DBMemo2.SelText := '{{' + frmListarCamposSql._Registro + '}}';
    except
    end;
  finally
    frmListarCamposSql.Free;
  end;
end;

procedure TfrmCadModeloCartas.BitBtn1Click(Sender: TObject);
var
 I: Integer;
begin
	obModCarta.vProcesso := 'BAS285';
  if obModCarta.getTipoContrato = 'MOT' then
  	obModCarta.vProcesso := 'BAS176'
  else if obModCarta.getTipoContrato = 'NOT' then
  	obModCarta.vProcesso := 'BAS418'
  else if obModCarta.getTipoContrato = 'DOC' then
  	obModCarta.vProcesso := 'BAS552';

  if not vDadosIni.PesqPros(obModCarta.vProcesso, 'PESQUISAR', '', 'MODCARTAS', '', obModCarta.buscas, true) then
    exit;

  inherited;

  SpeedButton2.Hint := 'Enviar para Lixeira -  [' + obModCarta.vProcesso + ']';

  obModCarta.rModCartas.vCampo := ComboBox1.Text;
  obModCarta.rModCartas.vCondicao := ComboBox3.Text;
  obModCarta.rModCartas.vDataIni := trim(MaskEdit1.Text);
  obModCarta.rModCartas.vDataFim := trim(MaskEdit2.Text);
  obModCarta.rModCartas.vValor := trim(MaskEdit3.Text);
  obModCarta.rModCartas.vAdicional := CheckBox1.Checked;
  obModCarta.rModCartas.avancada := CheckBox3.Checked;

  obModCarta._defineSqlAdicional;

  if MaskEdit2.Visible then
  begin
    if not obModCarta.ConsultaCampos('MODCARTAS',
    	obModCarta.rModCartas.vCampo,
      'MODCARTAS.COD_CARTA',
      obModCarta.rModCartas.vDataIni,
      obModCarta.rModCartas.vDataFim,
      vDadosIni.codEmpresa, 1,
      'MODCARTAS.*, MSG_APLICATIVO.APLICATIVO ',
      'LEFT JOIN MSG_APLICATIVO ON MSG_APLICATIVO.ID = MODCARTAS.ID_MSG_APLICATIVO',
      obModCarta.rModCartas.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not obModCarta.ConsultaCampos('MODCARTAS',
  	obModCarta.rModCartas.vValor,
    obModCarta.rModCartas.vCampo,
    obModCarta.rModCartas.vCondicao,
  	'MODCARTAS.COD_CARTA', True, vDadosIni.codEmpresa,
    'MODCARTAS.*, MSG_APLICATIVO.APLICATIVO ',
    'LEFT JOIN MSG_APLICATIVO ON MSG_APLICATIVO.ID = MODCARTAS.ID_MSG_APLICATIVO',
    obModCarta.rModCartas.vSqlAdicional) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;
        
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if obModCarta._lixeiraCheia then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
  obModCarta.ultimasql := obModCarta.dataset.CommandText;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;

  if obModCarta.dataSet.Active then
     for I := 0 to DBGrid1.Columns.Count - 1 do
       if DBGrid1.Columns[i].FieldName = 'DADOS_CARTA' then
         DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

  if vDadosIni.GetIni('MD', 'MHTT', 'N') <> 'S' then
    if obModCarta.getTipoContrato = 'DOC' then
    	if vDadosIni.retornaDadosHwCloudIA(obModCarta.buscas, False) <> '' then
        if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
          vDadosIni.buscarConfigHwCloud;

  _GravaConfiguracoesBoolean(MenuCartasCobranca.Name, MenuCartasCobranca.Checked);
  _GravaConfiguracoesBoolean(MenuCartasClientes.Name, MenuCartasClientes.Checked);
  _GravaConfiguracoesBoolean(MenuCartasVeiculos.Name, MenuCartasVeiculos.Checked);
  _GravaConfiguracoesBoolean(MenuNotFinanceiros.Name, MenuNotFinanceiros.Checked);
  _GravaConfiguracoesBoolean(MenuTiposDocumento.Name, MenuTiposDocumento.Checked);
end;

procedure TfrmCadModeloCartas.BitBtn3Click(Sender: TObject);
var
	vHabHwCloud: Boolean;
begin
	if vDadosIni.GetIni('MD', 'MHTT', 'N') <> 'S' then
    if DataUltConsSql <> FormatDateTime('DD/MM/YYYY', vDadosIni.getDataBanco(obModCarta.buscas)) then
    begin
    	try
        if ErpSincConsultasExisteAtualizacao(True) then
          ErpSincConsultasSQL(True);
      finally
      	DataUltConsSql := FormatDateTime('DD/MM/YYYY', vDadosIni.getDataBanco(obModCarta.buscas));

        _GravaConfiguracoesString('DataUltConsSql', DataUltConsSql);
      end;
    end;

  if not obModCarta.Insert then
  	exit;

  inherited;

  vHabHwCloud := trim(vDadosIni.retornaDadosHwCloudIA(obModCarta.buscas, False)) <> '';

  Label14.Visible := obModCarta.getTipoContrato = 'MOT';
  Label15.Visible := obModCarta.getTipoContrato = 'MOT';
  DBComboBox1.Visible := obModCarta.getTipoContrato = 'MOT';
  DBComboBox2.Visible := obModCarta.getTipoContrato = 'MOT';

  if obModCarta.getTipoContrato = 'MOT' then
    vRichEditDadosCarta.Top := 128
  else
    vRichEditDadosCarta.Top := 69;

  if obModCarta.getTipoContrato = 'MOT' then
    Label8.Top := 132
  else
    Label8.Top := 72;

  vRichEditDadosCarta.Clear;
  if (obModCarta.getTipoContrato = 'NOT') or (obModCarta.getTipoContrato = 'DOC') then
  begin
  	Panel13.Visible := vHabHwCloud;
    
    vDadosIni.retornaDbComboboxConsultasSql(DBComboBox5);
    DBComboBox5.ItemIndex := 0;

    vDadosIni.retornaDbComboboxConsultasSql(DBComboBox8);
    DBComboBox8.ItemIndex := 0;

    vDadosIni.retornaDbComboboxTemplate(DBComboBox7);
    DBComboBox7.ItemIndex := 0;

    vDadosIni.retornaDbComboboxTemplate(DBComboBox9);
    DBComboBox9.ItemIndex := 0;

    DBComboBox6.ItemIndex := 0;

    DBMemo1.Enabled := True;
    DBMemo2.Enabled := True;

    BitBtn14.Visible      := False;
    SpeedButton16.Visible := False;

  	Panel8.Visible := (trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'WHATSAPP');
    Panel17.Visible := (trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'WHATSAPP');

    if trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'E-MAIL' then
    begin
    	if obModCarta.getTipoContrato = 'DOC' then
      begin
      	carregarwebbrownser(WebBrowser2, obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString);

      	PageControl4.ActivePage := tsHtml2;
      	tsHtml2.Show;
      end
      else
      begin
    		carregarwebbrownser(WebBrowser1, obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString);

      	PageControl2.ActivePage := tsHtml;
      	tsHtml.Show;
      end;
    end
    else
    begin
      if obModCarta.getTipoContrato = 'DOC' then
      begin
      	PageControl4.ActivePage := tsMarkdown2;
        tsMarkdown2.Show;
      end
      else
      begin
        PageControl2.ActivePage := tsMarkdown;
        tsMarkdown.Show;
      end;
    end;

    if obModCarta.getTipoContrato = 'DOC' then
      TabSheet6.Show
    else
	    TabSheet5.Show;
  end
  else
  begin
		PageControl3.ActivePage := TabSheet3;
    TabSheet3.Show;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
    DBEdit6.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
    DBEdit9.SetFocus;
end;

procedure TfrmCadModeloCartas.btEnviarNotClick(Sender: TObject);
begin                 
  inherited;
  if not obControlesNot.AtivarDesativarControles then
  	exit;
    
	TForm(pnControles.Parent).ModalResult := IDOK;
end;

procedure TfrmCadModeloCartas.btNaoEnviarNotClick(Sender: TObject);
begin
  inherited;
	if not obControlesNot.AtivarDesativarControles(false) then
  	exit;
    
	TForm(pnControles.Parent).ModalResult := IDOK;
end;

procedure TfrmCadModeloCartas.BitBtn4Click(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
  vDadosCarta: string;
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
  if ((obModCarta.getTipoContrato = 'NOT') or (obModCarta.getTipoContrato = 'DOC'))
   and (trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'E-MAIL') then
  begin
    if obModCarta.getTipoContrato = 'DOC' then
      HTMLDocument := WebBrowser2.Document as IHTMLDocument2
    else
  		HTMLDocument := WebBrowser1.Document as IHTMLDocument2;
    vDadosCarta := HTMLDocument.body.innerHTML;
    vDadosCarta := vDadosIni._converterTags(vDadosCarta, 'H');
    vDadosCarta := vDadosIni._converterTagsImage(vDadosCarta, obModCarta.buscas, false);
    obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString := vDadosCarta;
  end
  else if ((obModCarta.getTipoContrato = 'NOT') or (obModCarta.getTipoContrato = 'DOC'))
  	and ((trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'WHATSAPP')
    	or (trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'TELEGRAM')) then
  begin
  	if obModCarta.getTipoContrato = 'DOC' then
    	obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString := DBMemo2.Text
    else
  		obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString := DBMemo1.Text;
  end
  else
  	obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString :=
    	vDadosIni._converterTags(obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString, 'R');
  if not obModCarta.Post then
  begin
  	if ((obModCarta.getTipoContrato = 'NOT') or (obModCarta.getTipoContrato = 'DOC'))
    	and (trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'E-MAIL') then
      	obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString := vDadosIni._converterTagsImage(obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString, obModCarta.buscas, true);
    setFocusCampoErro(obModCarta.vNomeCampoErro, obModCarta.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obModCarta.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadModeloCartas.btControlesNotCancClick(Sender: TObject);
begin
  inherited;
	TForm(pnControles.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadModeloCartas.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS293','CANCELAR', '','MODCARTAS',obModCarta.dataSet.FieldByName('COD_CARTA').AsString, obModCarta.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    obModCarta.Cancel;
    obModCarta.RollBackTransacao;
    inherited;
//  end;
end;

procedure TfrmCadModeloCartas.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS295', 'ACESSAR EDITOR DE TEXTO', '', 'CONTRATO',
  '', obModCarta.buscas, true) then
    exit;
  Application.CreateForm(TfrmEditorCartas, frmEditorCartas);
  frmEditorCartas.ShowModal;
end;

procedure TfrmCadModeloCartas.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if obModCarta.obRegrasCCobranca.Post then
    TabSheet2.Show;
end;

procedure TfrmCadModeloCartas.BitBtn9Click(Sender: TObject);
begin
  inherited;
  TabSheet2.show;
end;

procedure TfrmCadModeloCartas.btSelectAllClick(Sender: TObject);
begin
  inherited;
	obControlesNot._marcarTodos;
end;

procedure TfrmCadModeloCartas.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	obControlesNot._desmarcarTodos;
end;

procedure TfrmCadModeloCartas.bt_outros_prodClick(Sender: TObject);
begin
  inherited;
	pmOutros.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadModeloCartas.carregarwebbrownser(pWebBrowser: TWebBrowser; pHtml: string);
var
  vhtml: string;
  ADoccument: Variant;
begin
   DocumentoEmBranco(pWebBrowser);
   (pWebBrowser.Document as IHTMLDocument2).designMode := 'Off';
//   (pWebBrowser.Document as IHTMLDocument2).designMode := 'On';
   vhtml := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">' +
     '<HTML><HEAD>' +
     '<META http-equiv=Content-Type content="text/html; charset=unicode">' +
     '<META content="MSHTML 6.00.2900.5512" name=GENERATOR></HEAD>' +
     '<BODY>' + pHtml +
     '</BODY></HTML>';
   ADoccument := pWebBrowser.Document;
   ADoccument.Clear;
   ADoccument.Write(vhtml);
   ADoccument.Close;
//   pWebBrowser.Enabled := false;
end;

procedure TfrmCadModeloCartas.checkMenu;
begin
	MenuCartasCobranca.Checked := False;
  MenuCartasClientes.Checked := False;
  MenuCartasVeiculos.Checked := False;
  MenuNotFinanceiros.Checked := False;
  MenuTiposDocumento.Checked := False;
end;

procedure TfrmCadModeloCartas.configuraEntrada;
begin
  if obModCarta.getTipoContrato = 'CAR' then
    frmCadModeloCartas.Caption := 'Modelos de Cartas de Cobrança'
  else if obModCarta.getTipoContrato = 'CLI' then
    frmCadModeloCartas.Caption := 'Modelos de Cartas para Cliente'
 	else if obModCarta.getTipoContrato = 'MOT' then
  	frmCadModeloCartas.Caption := 'Modelos de Contratos para Veículos'
  else if obModCarta.getTipoContrato = 'NOT' then
  	frmCadModeloCartas.Caption := 'Modelos de Notificações Financeiro'
  else if obModCarta.getTipoContrato = 'DOC' then
  	frmCadModeloCartas.Caption := 'Modelos de Mensagens por Tipo de Documento';
end;

procedure TfrmCadModeloCartas.configurarFormPorTipo(pCriarClasse: Boolean = True);
begin
	if pCriarClasse then
		obModCarta.create;
  configuraEntrada;
  CheckBox3.Checked := false;
  GroupBox3.Height := 73;

  if (obModCarta.getTipoContrato = 'CAR') or (obModCarta.getTipoContrato = 'CLI') then
  begin
  	SpeedButton6.Visible := obModCarta.getTipoContrato = 'CAR';
  	SpeedButton8.Visible := false;
  	BitBtn1.Hint := 'Clique para pesquisar - [BAS285]';
  	BitBtn3.Hint := 'Novo cadastro - [BAS286]';
	  SpeedButton1.Hint := 'Editar Registro - [BAS287]';
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS285]';
    SpeedButton25.Hint := 'Ver registros da lixeira - [BAS290]';
    SpeedButton5.Hint := 'Recuperar registro - [BAS291]';
    BitBtn4.Hint := 'Confirmar Registro - [BAS292]';
    Label17.Caption := 'Descrição';
    DBEdit6.CharCase := ecUpperCase;
    SpeedButton15.Visible := false;
    SpeedButton59.Visible := false;
  end
  else if (obModCarta.getTipoContrato = 'MOT') then
  begin
  	SpeedButton6.Visible := false;
  	SpeedButton8.Visible := false;
  	BitBtn1.Hint := 'Clique para pesquisar - [BAS176]';
  	BitBtn3.Hint := 'Novo cadastro - [BAS177]';
    SpeedButton1.Hint := 'Editar Registro - [BAS178]';
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS176]';
    SpeedButton5.Hint := 'Recuperar registro - [BAS181]';
    BitBtn4.Hint := 'Confirmar Registro - [BAS183]';
    Label17.Caption := 'Descrição';
    DBEdit6.CharCase := ecUpperCase;
    SpeedButton15.Visible := false;
    SpeedButton59.Visible := false;
  end
  else if (obModCarta.getTipoContrato = 'NOT') then
  begin
  	SpeedButton6.Visible := false;
  	SpeedButton8.Visible := true;
  	BitBtn1.Hint := 'Clique para pesquisar - [BAS418]';
  	BitBtn3.Hint := 'Novo cadastro - [BAS419]';
  	SpeedButton1.Hint := 'Editar Registro - [BAS420]';
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS422]';
    SpeedButton5.Hint := 'Recuperar registro - [BAS423]';
    BitBtn4.Hint := 'Confirmar Registro - [BAS425]';
    Label17.Caption := 'Assunto';
    DBEdit6.CharCase := ecNormal;
    SpeedButton15.Visible := true;
    SpeedButton59.Visible := true;
  end
  else if (obModCarta.getTipoContrato = 'DOC') then
  begin
  	SpeedButton6.Visible := false;
  	SpeedButton8.Visible := false;
  	BitBtn1.Hint := 'Clique para pesquisar - [BAS552]';
  	BitBtn3.Hint := 'Novo cadastro - [BAS553]';
  	SpeedButton1.Hint := 'Editar Registro - [BAS554]';
    SpeedButton2.Hint := 'Enviar para Lixeira - [BAS556]';
    SpeedButton5.Hint := 'Recuperar registro - [BAS557]';
    BitBtn4.Hint := 'Confirmar Registro - [BAS559]';
    Label17.Caption := 'Assunto';
    DBEdit6.CharCase := ecNormal;
    SpeedButton15.Visible := false;
    SpeedButton59.Visible := false;
  end;
end;

procedure TfrmCadModeloCartas.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	key := #0;
end;

procedure TfrmCadModeloCartas.DBComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	key := #0;
end;

procedure TfrmCadModeloCartas.DBComboBox3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	key := #0;
end;

procedure TfrmCadModeloCartas.DBComboBox5Exit(Sender: TObject);
begin
  inherited;
	BitBtn14.Visible      := DBComboBox5.ItemIndex > 0;
  SpeedButton16.Visible := DBComboBox5.ItemIndex > 0;
end;

procedure TfrmCadModeloCartas.DBComboBox7Exit(Sender: TObject);
begin
  inherited;
	if DBComboBox7.ItemIndex > 0 then
		DBMemo1.Text := vDadosIni.retornaTextoTemplate(DBComboBox7.Items[DBComboBox7.ItemIndex])
  else
  	DBMemo1.Text := '';

  DBMemo1.Enabled := trim(obModCarta.dataSet.FieldByName('TEMPLATE').AsString) = '';
end;

procedure TfrmCadModeloCartas.DBComboBox9Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox9.ItemIndex > 0 then
		DBMemo2.Text := vDadosIni.retornaTextoTemplate(DBComboBox9.Items[DBComboBox9.ItemIndex])
  else
  	DBMemo2.Text := '';

  DBMemo2.Enabled := trim(obModCarta.dataSet.FieldByName('TEMPLATE').AsString) = '';
end;

procedure TfrmCadModeloCartas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadModeloCartas.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  if not DBGrid2.DataSource.DataSet.IsEmpty then
		TForm(pnPlataforma.Parent).ModalResult := IDOK;
end;

procedure TfrmCadModeloCartas.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_RETURN then
  	TForm(pnPlataforma.Parent).ModalResult := IDOK;
end;

procedure TfrmCadModeloCartas.DBGridControlesNotCellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	obControlesNot._marcarDesmarcaItem;
end;

procedure TfrmCadModeloCartas.DBGridControlesNotDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 21 then
      Column.Width := 21;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadModeloCartas.DBGridControlesNotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_SPACE then
	  obControlesNot._marcarDesmarcaItem;
end;

procedure TfrmCadModeloCartas.DocumentoEmBranco(WebBrowser: TWebBrowser);
begin
	if not Assigned(WebBrowser.Document) then
    WebBrowser.Navigate('about:blank');
end;

procedure TfrmCadModeloCartas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obModCarta.Cancel;
  obModCarta.RollBackTransacao;
  obModCarta.free;
  obModCarta:=nil;
  Action := caFree;
  frmCadModeloCartas := nil;
end;

procedure TfrmCadModeloCartas.FormCreate(Sender: TObject);
var
 i:integer;
begin
  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;
  for I := 0 to PageControl2.PageCount - 1 do
    PageControl2.Pages[i].TabVisible := false;
  for I := 0 to PageControl4.PageCount - 1 do
  	PageControl4.Pages[i].TabVisible := false;
  inherited;

  TabSheet3.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;              

  MenuCartasCobranca.Checked := _LerConfiguracoesRegistroBoolean(MenuCartasCobranca.Name);
  MenuCartasClientes.Checked := _LerConfiguracoesRegistroBoolean(MenuCartasClientes.Name);
  MenuCartasVeiculos.Checked := _LerConfiguracoesRegistroBoolean(MenuCartasVeiculos.Name);
  MenuNotFinanceiros.Checked := _LerConfiguracoesRegistroBoolean(MenuNotFinanceiros.Name);
  MenuTiposDocumento.Checked := _LerConfiguracoesRegistroBoolean(MenuTiposDocumento.Name);

  if (not MenuCartasClientes.Checked)
  	and (not MenuCartasClientes.Checked)
    and (not MenuCartasVeiculos.Checked)
    and (not MenuTiposDocumento.Checked)
    and (not MenuCartasCobranca.Checked) then
    	MenuCartasCobranca.Checked := True;

  if MenuCartasCobranca.Checked then
    vDadosIni.vtpContrato := 'CAR'
  else if MenuCartasClientes.Checked then
    vDadosIni.vtpContrato := 'CLI'
  else if MenuCartasVeiculos.Checked then
    vDadosIni.vtpContrato := 'MOT'
  else if MenuNotFinanceiros.Checked then
  	vDadosIni.vtpContrato := 'NOT'
  else if MenuTiposDocumento.Checked then
  	vDadosIni.vtpContrato := 'DOC';

  TelaCadastro := vDadosIni.vTipoForm;
  if obModCarta = nil then
    obModCarta := TModeloCartas.Create;
  if obControlesNot = nil then
  	obControlesNot := TControlesNot.Create;
  configurarFormPorTipo(False);

  DataUltConsSql := _LerConfiguracoesRegistroString('DataUltConsSql', '01/01/2000');

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadModeloCartas.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsModCartas;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    obModCarta.vProcesso := 'BAS285';
    if obModCarta.getTipoContrato = 'MOT' then
    	obModCarta.vProcesso := 'BAS176'
    else if obModCarta.getTipoContrato = 'NOT' then
    	obModCarta.vProcesso := 'BAS422';
    SpeedButton2.Hint := 'Enviar para Lixeira -  [' + obModCarta.vProcesso + ']';
  end;
  
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  MenuTiposDocumento.Visible := vDadosIni.retornaDadosHwCloudIA(obModCarta.buscas, False) <> '';
  
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TfrmCadModeloCartas.MenuCartasCobrancaClick(Sender: TObject);
begin
  inherited;
  vDadosIni.vtpContrato := 'CAR';
  configurarFormPorTipo;

  checkMenu;
  MenuCartasCobranca.Checked := True;
end;

procedure TfrmCadModeloCartas.MenuCartasClientesClick(Sender: TObject);
begin
  inherited;
  vDadosIni.vtpContrato := 'CLI';
  configurarFormPorTipo;

  checkMenu;
  MenuCartasClientes.Checked := True;
end;

procedure TfrmCadModeloCartas.MenuCartasVeiculosClick(Sender: TObject);
begin
  inherited;
  vDadosIni.vtpContrato := 'MOT';
  configurarFormPorTipo;

  checkMenu;
  MenuCartasVeiculos.Checked := True;
end;

procedure TfrmCadModeloCartas.MenuNotFinanceirosClick(Sender: TObject);
begin
  inherited;
  vDadosIni.vtpContrato := 'NOT';
  configurarFormPorTipo;

  checkMenu;
  MenuNotFinanceiros.Checked := True;
end;

procedure TfrmCadModeloCartas.MenuTiposDocumentoClick(Sender: TObject);
begin
  inherited;
  vDadosIni.vtpContrato := 'DOC';
  configurarFormPorTipo;

  checkMenu;
  MenuTiposDocumento.Checked := True;
end;

procedure TfrmCadModeloCartas.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  obModCarta.obRegrasCCobranca.dataSet.FieldByName('CODANT_PROCESSAMENTO').AsInteger:=0;
end;

procedure TfrmCadModeloCartas.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if DBLookupListBox2.KeyValue = null then
    obModCarta.obRegrasCCobranca.dataSet.FieldByName('CODANT_REPROCESSAMENTO').AsInteger:= 0
  else
    obModCarta.obRegrasCCobranca.dataSet.FieldByName('CODANT_REPROCESSAMENTO').AsInteger:= DBLookupListBox2.KeyValue;
end;

procedure TfrmCadModeloCartas.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  obModCarta.obRegrasCCobranca.dataSet.FieldByName('CODANT_REPROCESSAMENTO').AsInteger:= 0;
end;

procedure TfrmCadModeloCartas.SpeedButton15Click(Sender: TObject);
var
	ATagMacro: THandle;
  AProcedure: Tcadastrosbasicos_inserirtag_rtf;
begin
	if ATagMacro = 0 then
    CarregaPacote('pkCadastrosBasicos', ATagMacro);

  if ATagMacro = 0 then
  begin
    Application.MessageBox('Pacote Cadastros Básicos não carregado', 'Atenção', 0 + 64);
    Exit;
  end;
  @AProcedure := GetProcAddress(ATagMacro, 'cadastrosbasicos_inserirtag_rtf');
  if Assigned(AProcedure) then
  	DBEdit6.Text := DBEdit6.Text + AProcedure();
end;

procedure TfrmCadModeloCartas.SpeedButton16Click(Sender: TObject);
var
	ACampo: THandle;
  AProcedure: Tcadastrosbasicos_inserircampo_rtf;
begin
	if ACampo = 0 then
    CarregaPacote('pkCadastrosBasicos', ACampo);

  if ACampo = 0 then
  begin
    Application.MessageBox('Pacote Cadastros Básicos não carregado', 'Atenção', 0 + 64);
    Exit;
  end;
  @AProcedure := GetProcAddress(ACampo, 'cadastrosbasicos_inserircampo_rtf');
  if Assigned(AProcedure) then
  	DBEdit9.Text := DBEdit9.Text + AProcedure(obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString);
end;

procedure TfrmCadModeloCartas.SpeedButton18Click(Sender: TObject);
var
	ACampo: THandle;
  AProcedure: Tcadastrosbasicos_inserircampo_rtf;
begin
	if ACampo = 0 then
    CarregaPacote('pkCadastrosBasicos', ACampo);

  if ACampo = 0 then
  begin
    Application.MessageBox('Pacote Cadastros Básicos não carregado', 'Atenção', 0 + 64);
    Exit;
  end;
  @AProcedure := GetProcAddress(ACampo, 'cadastrosbasicos_inserircampo_rtf');
  if Assigned(AProcedure) then
  	DBEdit6.Text := DBEdit6.Text + AProcedure(obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString);
end;

procedure TfrmCadModeloCartas.SpeedButton1Click(Sender: TObject);
var
  vHabHwCloud: Boolean;
  vStream:  TStream;
  I: Integer;
begin
  try
    if obModCarta.IsEmpty then
     exit;

    if vDadosIni.GetIni('MD', 'MHTT', 'N') <> 'S' then
      if DataUltConsSql <> FormatDateTime('DD/MM/YYYY', vDadosIni.getDataBanco(obModCarta.buscas)) then
      begin
      	try
          if ErpSincConsultasExisteAtualizacao(True) then
            ErpSincConsultasSQL(True);
        finally
        	DataUltConsSql := FormatDateTime('DD/MM/YYYY', vDadosIni.getDataBanco(obModCarta.buscas));

        	_GravaConfiguracoesString('DataUltConsSql', DataUltConsSql);
        end;
      end;

    if not obModCarta.Edit then
      exit;

    inherited;

    vHabHwCloud := trim(vDadosIni.retornaDadosHwCloudIA(obModCarta.buscas, False)) <> '';
  
    if trim(obModCarta.dataset.FieldByName('TIPO_CONTRATO').AsString) <> '' then
    begin
      for I := 0 to DBComboBox3.Items.Count - 1 do
        if trim(obModCarta.dataset.FieldByName('TIPO_CONTRATO').AsString) = trim(DBComboBox3.Items[I]) then
        begin
          DBComboBox3.ItemIndex := I;
          Break;
        end;
    end;

    Label14.Visible := trim(obModCarta.dataSet.FieldByName('TIPO').AsString) = 'MOT';
    Label15.Visible := trim(obModCarta.dataSet.FieldByName('TIPO').AsString) = 'MOT';
    DBComboBox1.Visible := trim(obModCarta.dataSet.FieldByName('TIPO').AsString) = 'MOT';
    DBComboBox2.Visible := trim(obModCarta.dataSet.FieldByName('TIPO').AsString) = 'MOT';

    if trim(obModCarta.dataSet.FieldByName('TIPO').AsString) = 'MOT' then
      vRichEditDadosCarta.Top := 128
    else
      vRichEditDadosCarta.Top := 69;

    if trim(obModCarta.dataSet.FieldByName('TIPO').AsString) = 'MOT' then
      Label8.Top := 132
    else
      Label8.Top := 72;

    if (obModCarta.getTipoContrato = 'NOT') or (obModCarta.getTipoContrato = 'DOC') then
    begin
    	Panel13.Visible := vHabHwCloud;
      
      vDadosIni.retornaDbComboboxConsultasSql(DBComboBox5);
      if trim(obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString) <> '' then
      begin
      	for I := 0 to DBComboBox5.Items.Count - 1 do
        	if trim(DBComboBox5.Items[I]) = trim(obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString) then
          begin
          	DBComboBox5.ItemIndex := I;
            Break;
          end;
      end
      else
        DBComboBox5.ItemIndex := 0;

      vDadosIni.retornaDbComboboxConsultasSql(DBComboBox8);
      if trim(obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString) <> '' then
      begin
      	for I := 0 to DBComboBox8.Items.Count - 1 do
        	if trim(DBComboBox8.Items[I]) = trim(obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString) then
          begin
          	DBComboBox8.ItemIndex := I;
            Break;
          end;
      end
      else
        DBComboBox8.ItemIndex := 0;

      vDadosIni.retornaDbComboboxTemplate(DBComboBox7);
      if trim(obModCarta.dataSet.FieldByName('TEMPLATE').AsString) <> '' then
      begin
      	for I := 0 to DBComboBox7.Items.Count - 1 do
        	if trim(DBComboBox7.Items[I]) = trim(obModCarta.dataSet.FieldByName('TEMPLATE').AsString) then
          begin
          	DBComboBox7.ItemIndex := I;
            Break;
          end;
      end
      else
        DBComboBox7.ItemIndex := 0;

      vDadosIni.retornaDbComboboxTemplate(DBComboBox9);
      if trim(obModCarta.dataSet.FieldByName('TEMPLATE').AsString) <> '' then
      begin
      	for I := 0 to DBComboBox9.Items.Count - 1 do
        	if trim(DBComboBox9.Items[I]) = trim(obModCarta.dataSet.FieldByName('TEMPLATE').AsString) then
          begin
          	DBComboBox9.ItemIndex := I;
            Break;
          end;
      end
      else
        DBComboBox9.ItemIndex := 0;

      if trim(obModCarta.dataSet.FieldByName('DOC').AsString) <> '' then
      begin
      	for I := 0 to DBComboBox6.Items.Count - 1 do
        	if Copy(trim(DBComboBox6.Items[I]), 1, 1) = trim(obModCarta.dataSet.FieldByName('DOC').AsString) then
          begin
          	DBComboBox6.ItemIndex := I;
            Break;
          end;
      end
      else
        DBComboBox6.ItemIndex := 0;

      if trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'WHATSAPP' then
      begin
        DBMemo1.Text := vDadosIni.retornaTextoTemplate(obModCarta.dataSet.FieldByName('TEMPLATE').AsString);
        DBMemo2.Text := DBMemo1.Text;
      end;

      DBMemo1.Enabled := trim(obModCarta.dataSet.FieldByName('TEMPLATE').AsString) = '';
    	DBMemo2.Enabled := trim(obModCarta.dataSet.FieldByName('TEMPLATE').AsString) = '';

      BitBtn14.Visible      := trim(obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString) <> '';
      SpeedButton16.Visible := trim(obModCarta.dataSet.FieldByName('ID_CONSULTAS_SQL').AsString) <> '';

    	Panel8.Visible := (trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'WHATSAPP');
      Panel17.Visible := (trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'WHATSAPP');

    	if trim(obModCarta.obAplicativo.dataSet.FieldByName('APLICATIVO').AsString) = 'E-MAIL' then
      begin
        if obModCarta.getTipoContrato = 'DOC' then
        begin
          carregarwebbrownser(WebBrowser2, obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString);

          PageControl4.ActivePage := tsHtml2;
      		tsHtml2.Show;
        end
        else
        begin
          carregarwebbrownser(WebBrowser1, obModCarta.dataSet.FieldByName('DADOS_CARTA').AsString);

          PageControl2.ActivePage := tsHtml;
          tsHtml.Show;
        end;
      end
      else
      begin
       	if obModCarta.getTipoContrato = 'DOC' then
        begin
          PageControl4.ActivePage := tsMarkdown2;
          tsMarkdown2.Show;
        end
        else
        begin
          PageControl2.ActivePage := tsMarkdown;
          tsMarkdown.Show;
        end;
      end;

      if obModCarta.getTipoContrato = 'DOC' then
        TabSheet6.Show
      else
        TabSheet5.Show;
    end
    else
    begin
      vStream := TMemoryStream.Create;

      vStream := obModCarta.dataSet.CreateBlobStream(obModCarta.dataSet.FieldByName('DADOS_CARTA'), bmRead);
      vStream.Position :=0;
      vRichEditDadosCarta.Lines.LoadFromStream(vStream);

  		PageControl3.ActivePage := TabSheet3;
      TabSheet3.Show;
    end;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
     	DBEdit6.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
    	DBEdit9.SetFocus;
  finally
    vStream.Free;
  end;
end;

procedure TfrmCadModeloCartas.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not obModCarta._abrelixeira then
  begin
  	obModCarta.vProcesso := 'BAS288';
    if obModCarta.getTipoContrato = 'MOT' then
    	obModCarta.vProcesso := 'BAS180'
    else if obModCarta.getTipoContrato = 'NOT' then
    	obModCarta.vProcesso := 'BAS422';

    SpeedButton2.Hint := 'Enviar para Lixeira -  [' + obModCarta.vProcesso + ']';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
  	obModCarta.vProcesso := 'BAS289';
    if obModCarta.getTipoContrato = 'MOT' then
    	obModCarta.vProcesso := 'BAS179'
    else if obModCarta.getTipoContrato = 'NOT' then
    	obModCarta.vProcesso := 'BAS421';

    SpeedButton2.Hint := 'Excluir registro permanentemente -  [' + obModCarta.vProcesso + ']';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;
end;

procedure TfrmCadModeloCartas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obModCarta.Delete then
  begin
    if obModCarta._lixeiraCheia then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TfrmCadModeloCartas.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  if obModCarta.getTipoContrato = 'DOC' then
  	HTMLDocumento := WebBrowser2.Document as IHTMLDocument2
  else
		HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  HTMLDocumento.execCommand('Bold', False,0);
end;

procedure TfrmCadModeloCartas.SpeedButton56Click(Sender: TObject);
begin
  inherited;
	if obModCarta.getTipoContrato = 'DOC' then
  	HTMLDocumento := WebBrowser2.Document as IHTMLDocument2
  else
		HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  HTMLDocumento.execCommand('Italic', False,0);
end;

procedure TfrmCadModeloCartas.SpeedButton57Click(Sender: TObject);
begin
  inherited;
	if obModCarta.getTipoContrato = 'DOC' then
  	HTMLDocumento := WebBrowser2.Document as IHTMLDocument2
  else
		HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  HTMLDocumento.execCommand('Underline', False,0);
end;

procedure TfrmCadModeloCartas.SpeedButton58Click(Sender: TObject);
begin
  inherited;
	if obModCarta.getTipoContrato = 'DOC' then
  	HTMLDocumento := WebBrowser2.Document as IHTMLDocument2
  else
		HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  if cdColor.Execute then
    HTMLDocumento.execCommand('ForeColor', False,cdColor.Color)
  else
    abort;
end;

procedure TfrmCadModeloCartas.SpeedButton59Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('env_not_financ_%', obModCarta.buscas);
end;

procedure TfrmCadModeloCartas.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  obModCarta._restauraRegistro;
  if not obModCarta._lixeiraCheia then
     obModCarta.montaSelect(obModCarta.ultimasql);
  lixeiraVazia(not obModCarta._lixeiraCheia);
  //  if obModCarta._lixeiraCheia then
//    SpeedButton25.Visible := true
//  else
//    SpeedButton25.Visible := false;
end;

procedure TfrmCadModeloCartas.SpeedButton60Click(Sender: TObject);
begin
  inherited;
  if obModCarta.getTipoContrato = 'DOC' then
  	SendMessage(GetIEHandle(webbrowser2, 'Internet Explorer_Server'), WM_COMMAND,IDM_IMAGEM, 0)
  else
		SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_IMAGEM, 0);
end;

procedure TfrmCadModeloCartas.SpeedButton61Click(Sender: TObject);
begin
  inherited;
  if obModCarta.getTipoContrato = 'DOC' then
  	SendMessage(GetIEHandle(webbrowser2, 'Internet Explorer_Server'), WM_COMMAND,IDM_HYPERLINK, 0)
  else
		SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_HYPERLINK, 0);
end;

procedure TfrmCadModeloCartas.SpeedButton62Click(Sender: TObject);
begin
  inherited;
  if obModCarta.getTipoContrato = 'DOC' then
  	SendMessage(GetIEHandle(webbrowser2, 'Internet Explorer_Server'), WM_COMMAND, IDM_DESFAZER, 0)
  else
		SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND, IDM_DESFAZER, 0);
end;

procedure TfrmCadModeloCartas.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not obModCarta._ManterRegrasCartasCobranca then
    exit;
  TabSheet4.Show;
  DBLookupListBox1.ListSource:=obModCarta.obRegrasCCobranca.dsModeloCarta;
  DBLookupListBox1.ListField := 'COD_CARTA;DESCRICAO';
  DBLookupListBox1.KeyField:= 'COD_CARTA';
  DBLookupListBox2.ListSource:=obModCarta.obRegrasCCobranca.dsModeloCarta;
  DBLookupListBox2.ListField := 'COD_CARTA;DESCRICAO';
  DBLookupListBox2.KeyField:= 'COD_CARTA';
end;

procedure TfrmCadModeloCartas.SpeedButton8Click(Sender: TObject);
begin
  inherited;
	obControlesNot._abrirFormControlesNot;
end;

procedure TfrmCadModeloCartas.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if DBLookupListBox1.KeyValue=null then
    obModCarta.obRegrasCCobranca.dataSet.FieldByName('CODANT_PROCESSAMENTO').AsInteger:= 0
  else
    obModCarta.obRegrasCCobranca.dataSet.FieldByName('CODANT_PROCESSAMENTO').AsInteger:= DBLookupListBox1.KeyValue;
end;

end.
