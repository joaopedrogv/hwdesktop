unit UCadKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, DBCtrls, DB,
  AppEvnts, DBClient, IBDatabase, OleCtrls, SHDocVw, MSHTML, ActiveX, ExtDlgs;

type
  TFrmCadKits = class(TfrmCadPadraoM)
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBComboBox1: TDBComboBox;
    TabSheet4: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    GroupBox15: TGroupBox;
    GroupBox17: TGroupBox;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    SpeedButton10: TSpeedButton;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    CheckBox2: TCheckBox;
    Label14: TLabel;
    SpeedButtonECommerce: TSpeedButton;
    tsPromocaoKit: TTabSheet;
    GroupBox5: TGroupBox;
    Panel5: TPanel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label204: TLabel;
    Label208: TLabel;
    Label207: TLabel;
    Label209: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox8: TGroupBox;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    Panel4: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label20: TLabel;
    Panel6: TPanel;
    DBText27: TDBText;
    BitBtn7: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn8: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    GroupBox14: TGroupBox;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    GroupBox7: TGroupBox;
    ScrollBox4: TScrollBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    Label201: TLabel;
    DBText28: TDBText;
    Label202: TLabel;
    DBText29: TDBText;
    Label218: TLabel;
    DBText33: TDBText;
    Label216: TLabel;
    DBText32: TDBText;
    Label21: TLabel;
    DBText3: TDBText;
    Label22: TLabel;
    Label23: TLabel;
    DBText1: TDBText;
    BitBtn9: TBitBtn;
    tsECommerce: TTabSheet;
    GroupBoxKit: TGroupBox;
    DBTextDescKit: TDBText;
    lbCodigo: TLabel;
    DBTextCodigoKit: TDBText;
    lbIdECommerce: TLabel;
    DBTextIdEcommerce: TDBText;
    GroupBoxDadosEC: TGroupBox;
    pnDadosEC: TPanel;
    pnOpcoesDadosEC: TPanel;
    btnOKAlterarDadosEC: TBitBtn;
    btnCancAlterarDadosEC: TBitBtn;
    Panel114: TPanel;
    LbPagEC: TLabel;
    Panel115: TPanel;
    sbVoltarEC: TSpeedButton;
    sbAvancarEC: TSpeedButton;
    PageControlEC: TPageControl;
    TabSheetEC1: TTabSheet;
    ScrollBox9: TScrollBox;
    Panel77: TPanel;
    pnDescricaoHTMLEC: TPanel;
    Panel99: TPanel;
    lbDescrCompletaEC: TLabel;
    Panel78: TPanel;
    pnOpcoesHtml: TPanel;
    SpeedButtonAlterarHtmlEC: TSpeedButton;
    WebBrowserEC: TWebBrowser;
    pnDescricaoProdEC: TPanel;
    lbDescrEC: TLabel;
    lbPromoEC: TLabel;
    lbFreteGratisEC: TLabel;
    lbLancEC: TLabel;
    lbTermAceiteEC: TLabel;
    lbCompreJuntoEC: TLabel;
    lbVirtualEC: TLabel;
    lbSincEC: TLabel;
    lbCategoria: TLabel;
    lbDestaqueEC: TLabel;
    lbDispEC: TLabel;
    DBEditDescrEC: TDBEdit;
    DBComboBoxPromoEC: TDBComboBox;
    DBComboBoxFreteGratisEC: TDBComboBox;
    DBComboBoxLancEC: TDBComboBox;
    DBComboBoxTermAceiteEC: TDBComboBox;
    DBComboBoxCompreJuntoEC: TDBComboBox;
    DBComboBoxVirtualEC: TDBComboBox;
    DBComboBoxSincEC: TDBComboBox;
    DBLookupComboBoxCategoria: TDBLookupComboBox;
    DBComboBoxDestaqueEC: TDBComboBox;
    DBComboBoxDispEC: TDBComboBox;
    TabSheetEC2: TTabSheet;
    ScrollBox10: TScrollBox;
    Panel91: TPanel;
    pnCategoriasEC: TPanel;
    Splitter9: TSplitter;
    Panel93: TPanel;
    TreeViewCat: TTreeView;
    Panel94: TPanel;
    Panel95: TPanel;
    Panel96: TPanel;
    TreeViewCatDB: TTreeView;
    Panel100: TPanel;
    Panel117: TPanel;
    Panel103: TPanel;
    Label430: TLabel;
    pnImagemEC: TPanel;
    Panel98: TPanel;
    Label426: TLabel;
    lbS_qtdeImgProdEC: TLabel;
    Panel112: TPanel;
    TabSheetEC4: TTabSheet;
    pnGradeVaricaoEC: TPanel;
    Panel101: TPanel;
    Label428: TLabel;
    pnButtonAlterDadosEC: TPanel;
    btnAlterarDadosEC: TBitBtn;
    pnImagemProdutoEC: TPanel;
    Panel57: TPanel;
    SpeedButton48: TSpeedButton;
    SpeedButton49: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    Panel55: TPanel;
    Panel110: TPanel;
    Image1: TImage;
    pnEscolherGradeImage: TPanel;
    lbDescrGradeImg: TLabel;
    pnDescImagemProduto: TPanel;
    pnLabelImagemProduto: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    pnItensEC: TPanel;
    pnItensLeftEC: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton13: TSpeedButton;
    pnSincEcKitItens: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    TabSheetEC5: TTabSheet;
    pnItensKit: TPanel;
    GroupBoxItens: TGroupBox;
    lbItensKit: TLabel;
    btnOKItens: TBitBtn;
    btnCancItens: TBitBtn;
    CheckBoxItensKit: TCheckBox;
    lbCodReferencia: TLabel;
    DBEditCodReferencia: TDBEdit;
    DBEditCodEAN: TDBEdit;
    lbCodEAN: TLabel;
    lbPeso: TLabel;
    DBEditPeso: TDBEdit;
    lbComprimento: TLabel;
    DBEditComprimento: TDBEdit;
    lbAltura: TLabel;
    DBEditAltura: TDBEdit;
    lbLargura: TLabel;
    DBEditLargura: TDBEdit;
    lbPesoInf: TLabel;
    lbComprimentoInf: TLabel;
    lbAlturaInf: TLabel;
    lbLarguraInf: TLabel;
    lbRegra: TLabel;
    DBComboBoxRegra: TDBComboBox;
    btnIncluirItemKit: TBitBtn;
    btnAlterarItemKit: TBitBtn;
    btnDeltarItemKit: TBitBtn;
    btnImprimirItemKit: TBitBtn;
    DBEditDescValor: TDBEdit;
    lbDescValor: TLabel;
    lbDescPerc: TLabel;
    DBEditDescPerc: TDBEdit;
    lbValorKitECommerce: TLabel;
    DBTextValorEcommerce: TDBText;
    lbPrecoTabela: TLabel;
    DBTextPrecoTabela: TDBText;
    Label26: TLabel;
    DBTextValorEcommerceLiq: TDBText;
    lbDescValorKitECommerce: TLabel;
    DBTextDescValorEcommerce: TDBText;
    lbDescPercKitECommerce: TLabel;
    DBTextDescPercEcommerce: TDBText;
    Panel7: TPanel;
    TabSheetEC3: TTabSheet;
    ScrollBox5: TScrollBox;
    pnTituloPag: TPanel;
    lbTituloPag: TLabel;
    lbPalavrasChaves: TLabel;
    lbUrlAcesso: TLabel;
    lbPalavrasChavesInf: TLabel;
    DBEditTituloPag: TDBEdit;
    DBEditPalavrasChaves: TDBEdit;
    DBEditURLAcesso: TDBEdit;
    lbPrecoCombinarEC: TLabel;
    DBComboBoxPrecoCombinarEC: TDBComboBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosKitsProdutosClick: TMenuItem;
    DesmarcarTodosKitsProdutosClick: TMenuItem;
    tsImagemKit: TTabSheet;
    pnImagemKit: TPanel;
    Label555: TLabel;
    Label556: TLabel;
    Label557: TLabel;
    Panel164: TPanel;
    btImagemKitFechar: TBitBtn;
    MemoEndereco: TMemo;
    MemoUrl: TMemo;
    MemoErro: TMemo;
    Label558: TLabel;
    EditDataCadImg: TEdit;
    Label559: TLabel;
    EditDataErroImg: TEdit;
    tsAlterDadosKit: TTabSheet;
    Panel52: TPanel;
    btVoltarDadosKit: TBitBtn;
    GroupBox79: TGroupBox;
    DBText7: TDBText;
    btVoltarDadosKit2: TBitBtn;
    Panel128: TPanel;
    pnCenterAlterDadosProd: TPanel;
    SpeedButtonAlterarKit: TSpeedButton;
    SpeedBSelTodos: TSpeedButton;
    SpeedBDesmarcarTodos: TSpeedButton;
    SpeedButtonAlterarProduto2: TSpeedButton;
    lbCorLote: TLabel;
    btExcluirRegistro: TSpeedButton;
    btLixeiraVazia: TSpeedButton;
    btRestaurarRegistro: TSpeedButton;
    btLixeiraCheia: TSpeedButton;
    SpeedButton68: TSpeedButton;
    btSincronizarServicos: TSpeedButton;
    pnCorLote: TPanel;
    ckPermOpcaoMarcadas: TCheckBox;
    tsAlterDadosLote: TTabSheet;
    ScrollBox6: TScrollBox;
    GroupBox9: TGroupBox;
    Panel119: TPanel;
    btSalvarServLote: TBitBtn;
    btnCancServLote: TBitBtn;
    btSairServLote: TBitBtn;
    ckLixeira: TCheckBox;
    SpeedButton59: TSpeedButton;
    Label473: TLabel;
    Label158: TLabel;
    DBComboBox22: TDBComboBox;
    pnSomenteKitTodo: TPanel;
    lbSomenteKitTodo: TLabel;
    CheckBox22: TCheckBox;
    ckSomenteKitTodo: TCheckBox;
    cbSomenteKitTodo: TComboBox;
    pnVendaOnline: TPanel;
    lbVendaOnline: TLabel;
    CheckBox4: TCheckBox;
    ckVendaOnline: TCheckBox;
    cbVendaOnline: TComboBox;
    procedure btSincronizarServicosClick(Sender: TObject);
    procedure btSalvarServLoteClick(Sender: TObject);
    procedure ckVendaOnlineClick(Sender: TObject);
    procedure ckSomenteKitTodoClick(Sender: TObject);
    procedure SpeedButtonAlterarProduto2Click(Sender: TObject);
    procedure SpeedButtonAlterarKitClick(Sender: TObject);
    procedure ckLixeiraClick(Sender: TObject);
    procedure btVoltarDadosKit2Click(Sender: TObject);
    procedure btVoltarDadosKitClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedBDesmarcarTodosClick(Sender: TObject);
    procedure SpeedBSelTodosClick(Sender: TObject);
    procedure ckPermOpcaoMarcadasClick(Sender: TObject);
    procedure pnImagemKitEnter(Sender: TObject);
    procedure btImagemKitFecharClick(Sender: TObject);
    procedure DesmarcarTodosKitsProdutosClickClick(Sender: TObject);
    procedure MarcarTodosKitsProdutosClickClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBEditURLAcessoExit(Sender: TObject);
    procedure DBEditTituloPagExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure DBEditDescPercExit(Sender: TObject);
    procedure DBEditDescValorExit(Sender: TObject);
    procedure btnImprimirItemKitClick(Sender: TObject);
    procedure btnDeltarItemKitClick(Sender: TObject);
    procedure btnAlterarItemKitClick(Sender: TObject);
    procedure btnIncluirItemKitClick(Sender: TObject);
    procedure btnCancItensClick(Sender: TObject);
    procedure btnOKItensClick(Sender: TObject);
    procedure DBComboBoxRegraExit(Sender: TObject);
    procedure DBEditLarguraKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditComprimentoKeyPress(Sender: TObject; var Key: Char);
    procedure pnItensKitEnter(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure TreeViewCatDBDblClick(Sender: TObject);
    procedure TreeViewCatDblClick(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure pnDadosECEnter(Sender: TObject);
    procedure btnAlterarDadosECClick(Sender: TObject);
    procedure SpeedButtonAlterarHtmlECClick(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure btnOKAlterarDadosECClick(Sender: TObject);
    procedure btnCancAlterarDadosECClick(Sender: TObject);
    procedure sbAvancarECClick(Sender: TObject);
    procedure sbVoltarECClick(Sender: TObject);
    procedure ScrollBox4Enter(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButtonECommerceClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function testarDiretorioImagemProduto: boolean;
    procedure abrirDiretorioDestinoImagem;
    procedure habilitarCamposECommerce(pFormulario: boolean = False);
    procedure DocumentoEmBranco(pWebBrowser: TWebBrowser);
    procedure carregarwebbrownser(pWebBrowser: TWebBrowser; pHtml: string);
    function GetBrowserHtml(const webBrowser: TWebBrowser): String;
    procedure DesativarAtivarCamposHtml(pHablitar: boolean = true);
    procedure MontarImagem;
    procedure FormItensKitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AtualizarCamposPesoDimensoes(pTipo: string);
    procedure MontarDBComboboxRegra;
    procedure RemoveAcentosEspacos;
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
    procedure verificarAbaEcommerceComercioAberto;
  end;

var
  FrmCadKits: TFrmCadKits;
  Kit: TKitsProdutos;

  PrimeiraPesquisa2: Boolean;
  vConfigColuna2 : boolean;
  campoPesquisa2: string;
  cdsColunas2: TClientDataSet;

  cdsGrid2: TClientDataSet;
  GridCfg2: TDBGrid;
  ListGridsAndDataSets2: TStrings;
  ListPositions2: TStrings;

  trans2: TIBTransaction;
  vTabela2, vCampoPadrao2: string;
  fReset2, vCtrlClick2, vShiftClick2: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt2,vAlterarNomeDtSet2, usuario2: string;
  vCamposPadraoRegistro2: Boolean;
  vDiretorioDestino: string;
  vFocoDadosEC: boolean;

implementation

uses Clipbrd, StrUtils, uDataSet_OOP;

procedure hw_image_view(Source: WideString); stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TFrmCadKits.abrirDiretorioDestinoImagem;
begin
 vDiretorioDestino := vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', Kit.buscas);
 if (trim(vDiretorioDestino) <> '') then
   if Pos('\', vDiretorioDestino) > 0 then
     if Copy(vDiretorioDestino, Length(vDiretorioDestino), 1) <> '\' then
       vDiretorioDestino := vDiretorioDestino + '\';
end;

procedure TFrmCadKits.AtualizarCamposPesoDimensoes(pTipo: string);
begin
	lbPeso.Visible := trim(pTipo) <> '';
  lbPesoInf.Visible := trim(pTipo) <> '';
  lbComprimento.Visible := trim(pTipo) <> '';
  lbComprimentoInf.Visible := trim(pTipo) <> '';
  lbAltura.Visible := trim(pTipo) <> '';
  lbAlturaInf.Visible := trim(pTipo) <> '';
  lbLargura.Visible := trim(pTipo) <> '';
  lbLarguraInf.Visible := trim(pTipo) <> '';

  DBEditPeso.Visible := trim(pTipo) <> '';
  DBEditComprimento.Visible := trim(pTipo) <> '';
  DBEditAltura.Visible := trim(pTipo) <> '';
  DBEditLargura.Visible := trim(pTipo) <> '';

  Kit.vKitCons.abreKitsProd(Kit.dataset);
	if (pTipo = 'SOMARPESODIM') or (pTipo = '') then
  begin
    DBEditPeso.DataSource := nil;
    DBEditPeso.DataField := 'PESO_BRUT_PROD';
    DBEditPeso.DataSource := dtmProdutos.dsKitsTot;

    DBEditComprimento.DataSource := nil;
    DBEditComprimento.DataField := 'COMPRIMENTO_PROD';
    DBEditComprimento.DataSource := dtmProdutos.dsKitsTot;

    DBEditAltura.DataSource := nil;
    DBEditAltura.DataField := 'LARGURA_PROD';
    DBEditAltura.DataSource := dtmProdutos.dsKitsTot;

    DBEditLargura.DataSource := nil;
    DBEditLargura.DataField := 'ALTURA_PROD';
    DBEditLargura.DataSource := dtmProdutos.dsKitsTot;

    if (pTipo = 'SOMARPESODIM') then
	    DBComboBoxRegra.ItemIndex := 0
    else
    	DBComboBoxRegra.ItemIndex := -1;
  end
  else if pTipo = 'CADPESODIM' then
  begin
    DBEditPeso.DataSource := nil;
    DBEditPeso.DataField := 'PESO_BRUT_KIT';
    DBEditPeso.DataSource := dtmProdutos.dsKitsEC;

    DBEditComprimento.DataSource := nil;
    DBEditComprimento.DataField := 'COMPRIMENTO_KIT';
    DBEditComprimento.DataSource := dtmProdutos.dsKitsEC;

    DBEditAltura.DataSource := nil;
    DBEditAltura.DataField := 'ALTURA_KIT';
    DBEditAltura.DataSource := dtmProdutos.dsKitsEC;

    DBEditLargura.DataSource := nil;
    DBEditLargura.DataField := 'LARGURA_KIT';
    DBEditLargura.DataSource := dtmProdutos.dsKitsEC;

    DBComboBoxRegra.ItemIndex := 1;
  end
  else if pTipo = 'SOMARPESO_CADDIM' then
  begin
    DBEditPeso.DataSource := nil;
    DBEditPeso.DataField := 'PESO_BRUT_PROD';
    DBEditPeso.DataSource := dtmProdutos.dsKitsTot;

    DBEditComprimento.DataSource := nil;
    DBEditComprimento.DataField := 'COMPRIMENTO_KIT';
    DBEditComprimento.DataSource := dtmProdutos.dsKitsEC;

    DBEditAltura.DataSource := nil;
    DBEditAltura.DataField := 'ALTURA_KIT';
    DBEditAltura.DataSource := dtmProdutos.dsKitsEC;

    DBEditLargura.DataSource := nil;
    DBEditLargura.DataField := 'LARGURA_KIT';
    DBEditLargura.DataSource := dtmProdutos.dsKitsEC;

    DBComboBoxRegra.ItemIndex := 2;
  end;
end;

procedure TFrmCadKits.BitBtn10Click(Sender: TObject);
begin
  begin
    inherited;
    if not Kit.vItKit.Insert(Kit.dataSet) then
    	exit;

    CheckBox2.Visible := true;
    CheckBox2.Checked := false;
    Label14.Visible := true;

    CheckBoxItensKit.Visible := true;
    CheckBoxItensKit.Checked := false;
    lbItensKit.Visible := true;

    if PageControl1.ActivePage = TabSheet4 then
    begin
      TabSheet6.TabVisible := true;
      TabSheet6.Show;
      TabSheet6.Caption := 'Incluindo novo Item no Kit';
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
    end
    else if PageControl1.ActivePage = TabSheet1 then
      vDadosIni.abreForm('Incluindo novo Item no Kit', pnItensKit, [ofEscapeExit, ofAlignAllClientWinCtrl]);
    Kit.vItKit.Preenchecampos;
  end;
end;

procedure TFrmCadKits.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if not Kit.vItKit.Edit(Kit.dataset) then
  	exit;

  CheckBox2.Visible := false;
  CheckBox2.Checked := false;
  Label14.Visible := false;

  CheckBoxItensKit.Visible := false;
  CheckBoxItensKit.Checked := false;
  lbItensKit.Visible := false;

  if PageControl1.ActivePage = TabSheet4 then
  begin
    TabSheet6.TabVisible := true;
    TabSheet6.Show;
    TabSheet6.Caption := 'Alterando Item do Kit';
    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
     DBEdit4.SetFocus;
  end
  else if PageControl1.ActivePage = TabSheet1 then
    vDadosIni.abreForm('Alterando Item do Kit', pnItensKit, [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

procedure TFrmCadKits.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if not Kit.vItKit.Delete(Kit, true) then
  	exit;
    
  Kit.Refresh;
  Kit.vItKit.Refresh;
end;

procedure TFrmCadKits.BitBtn13Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO124', 'VOLTAR', '','KITS_PROD_KITS',
  	Kit.vItKit.dataSet.FieldByName('CODIGO_KIT').asString + ' - ' +
    Kit.vItKit.dataSet.FieldByName('NUM_FAB_PROD').asString, Kit.vItKit.buscas, true) then
  begin
    inherited;
    PageControl1.ActivePage := TabSheet2;
//    TabSheet4.TabVisible := false;
    TabSheet2.Show;
    CheckBox2.Visible := false;
    CheckBox2.Checked := false;
    Label14.Visible := false;
    CheckBox2.Font.Color := clTeal;
    Kit.vItKit.Cancel;
    Kit.vItKit.RollBackTransacao;
  end;
end;

procedure TFrmCadKits.BitBtn14Click(Sender: TObject);
begin
  try
  	BitBtn14.Enabled := false;
    BitBtn15.Enabled := false;
    BitBtn16.Enabled := false;

    if Kit.vItKit.Post(Kit, true) then
    begin
      if (CheckBox2.Checked) or (CheckBoxItensKit.Checked) then
      begin
        if Kit.vItKit.Insert(Kit.dataSet) then
        begin
          if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
            DBEdit4.SetFocus;
          Kit.vItKit.Preenchecampos;
        end;
      end
      else
      begin
        if PageControl1.ActivePage = TabSheet1 then
          TForm(pnItensKit.Parent).ModalResult := IDOK
        else
        begin
          TabSheet6.TabVisible := false;
          TabSheet5.Show;
          CheckBox2.Visible := false;
          Label14.Visible := false;
        end;
      end;
    end
    else
    begin
      setFocusCampoErro(Kit.vItKit.vNomeCampoErro, Kit.vItKit.vMensagemErro);
      exit;
    end;
  finally
    BitBtn14.Enabled := true;
    BitBtn15.Enabled := true;
    BitBtn16.Enabled := true;
  end;
end;

procedure TFrmCadKits.BitBtn15Click(Sender: TObject);
begin
  inherited;
  Kit.vItKit.dataSet.Cancel;
  Kit.vItKit.RollBackTransacao;
  if PageControl1.ActivePage = TabSheet1 then
    TForm(pnItensKit.Parent).ModalResult := IDCANCEL
  else
  begin
    TabSheet6.TabVisible := false;
    TabSheet5.Show;
    CheckBox2.Visible := false;
    CheckBox2.Checked := false;
    Label14.Visible := false;
    CheckBox2.Font.Color := clTeal;
  end;
end;

procedure TFrmCadKits.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO114]';
  if not vDadosIni.PesqPros('PRO110', 'PESQUISAR', '','KITS_PROD_KITS','', kit.buscas, true) then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    inherited;
    Kit.rKit.vCampo := ComboBox1.Text;
    Kit.rKit.vCondicao := ComboBox3.Text;
    Kit.rKit.vValor := trim(MaskEdit3.Text);
    Kit.rKit.vAdicional := CheckBox1.Checked;
    Kit._defineSqlAdicional;

    if MaskEdit2.Visible then
    begin
      if (ckLixeira.Checked) and (ckLixeira.Visible) then
      begin
        if not Kit.ConsultaCamposLixeira('KITS_PROD', ComboBox1.Text,
          'CODIGO_KIT', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
          ' KITS_PROD.*, ' +
          ' COALESCE(KITS_PROD_TOT.REGRA_PESO_DIM, '''') REGRA_PESO_DIM, ' +
          ' COALESCE(KITS_PROD_TOT.QUANT_PROD_KIT, 0) QUANT_PROD_KIT, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_CUS_PROD, 0) PREC_CUS_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_CUSM_PROD, 0) PREC_CUSM_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_TAB_PROD, 0) PREC_TAB_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_PUBLICO, 0) PREC_PUBLICO, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_30_PROD, 0) PREC_30_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_60_PROD, 0) PREC_60_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_90_PROD, 0) PREC_90_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PESO_BRUT_PROD, 0) PESO_BRUT_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.COMPRIMENTO_PROD, 0) COMPRIMENTO_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.LARGURA_PROD, 0) LARGURA_PROD, ' +
             ' COALESCE(KITS_PROD_TOT.ALTURA_PROD, 0) ALTURA_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.EST_F, 0) EST_F, ' +
          ' COALESCE(KITS_PROD_TOT.VALOR_TAB_PROKIT, 0) VALOR_TAB_PROKIT, ' +
          ' COALESCE(KITS_PROD_TOT.DESCONTO_VALOR, 0) DESCONTO_VALOR, ' +
          ' COALESCE(KITS_PROD_TOT.DESCONTO_PERC, 0) DESCONTO_PERC,  ' +
          ' COALESCE(KITS_PROD_TOT.VALOR_DESC_TAB_PROKIT, 0) VALOR_DESC_TAB_PROKIT ',
          ' LEFT JOIN KITS_PROD_TOT ON KITS_PROD_TOT.CODIGO_KIT = KITS_PROD.CODIGO_KIT AND KITS_PROD_TOT.COD_EMPRESA = KITS_PROD.COD_EMPRESA ',
          Kit.rKit.vSqlAdicional) then
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus;
      end
      else
      begin
        if not Kit.ConsultaCampos('KITS_PROD', ComboBox1.Text,
          'CODIGO_KIT', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
          ' KITS_PROD.*, ' +
          ' COALESCE(KITS_PROD_TOT.REGRA_PESO_DIM, '''') REGRA_PESO_DIM, ' +
          ' COALESCE(KITS_PROD_TOT.QUANT_PROD_KIT, 0) QUANT_PROD_KIT, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_CUS_PROD, 0) PREC_CUS_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_CUSM_PROD, 0) PREC_CUSM_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_TAB_PROD, 0) PREC_TAB_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_PUBLICO, 0) PREC_PUBLICO, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_30_PROD, 0) PREC_30_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_60_PROD, 0) PREC_60_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_90_PROD, 0) PREC_90_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PESO_BRUT_PROD, 0) PESO_BRUT_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.COMPRIMENTO_PROD, 0) COMPRIMENTO_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.LARGURA_PROD, 0) LARGURA_PROD, ' +
             ' COALESCE(KITS_PROD_TOT.ALTURA_PROD, 0) ALTURA_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.EST_F, 0) EST_F, ' +
          ' COALESCE(KITS_PROD_TOT.VALOR_TAB_PROKIT, 0) VALOR_TAB_PROKIT, ' +
          ' COALESCE(KITS_PROD_TOT.DESCONTO_VALOR, 0) DESCONTO_VALOR, ' +
          ' COALESCE(KITS_PROD_TOT.DESCONTO_PERC, 0) DESCONTO_PERC,  ' +
          ' COALESCE(KITS_PROD_TOT.VALOR_DESC_TAB_PROKIT, 0) VALOR_DESC_TAB_PROKIT ',
          ' LEFT JOIN KITS_PROD_TOT ON KITS_PROD_TOT.CODIGO_KIT = KITS_PROD.CODIGO_KIT AND KITS_PROD_TOT.COD_EMPRESA = KITS_PROD.COD_EMPRESA ',
          Kit.rKit.vSqlAdicional) then
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus;
      end;
    end
    else
    begin
      if (ckLixeira.Checked) and (ckLixeira.Visible) then
      begin
        if not Kit.ConsultaCamposLixeira('KITS_PROD', Kit.rKit.vValor, ComboBox1.Text,
          combobox3.Text, 'CODIGO_KIT', true, vDadosIni.codEmpresa,
          ' KITS_PROD.*, ' +
          ' COALESCE(KITS_PROD_TOT.REGRA_PESO_DIM, '''') REGRA_PESO_DIM, ' +
          ' COALESCE(KITS_PROD_TOT.QUANT_PROD_KIT, 0) QUANT_PROD_KIT, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_CUS_PROD, 0) PREC_CUS_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_CUSM_PROD, 0) PREC_CUSM_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_TAB_PROD, 0) PREC_TAB_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_PUBLICO, 0) PREC_PUBLICO, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_30_PROD, 0) PREC_30_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_60_PROD, 0) PREC_60_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_90_PROD, 0) PREC_90_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PESO_BRUT_PROD, 0) PESO_BRUT_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.COMPRIMENTO_PROD, 0) COMPRIMENTO_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.LARGURA_PROD, 0) LARGURA_PROD, ' +
             ' COALESCE(KITS_PROD_TOT.ALTURA_PROD, 0) ALTURA_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.EST_F, 0) EST_F, ' +
          ' COALESCE(KITS_PROD_TOT.VALOR_TAB_PROKIT, 0) VALOR_TAB_PROKIT, ' +
          ' COALESCE(KITS_PROD_TOT.DESCONTO_VALOR, 0) DESCONTO_VALOR, ' +
          ' COALESCE(KITS_PROD_TOT.DESCONTO_PERC, 0) DESCONTO_PERC,  ' +
          ' COALESCE(KITS_PROD_TOT.VALOR_DESC_TAB_PROKIT, 0) VALOR_DESC_TAB_PROKIT ',
          ' LEFT JOIN KITS_PROD_TOT ON KITS_PROD_TOT.CODIGO_KIT = KITS_PROD.CODIGO_KIT AND KITS_PROD_TOT.COD_EMPRESA = KITS_PROD.COD_EMPRESA ',
          Kit.rKit.vSqlAdicional) then
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              ComboBox1.SetFocus;
      end
      else
      begin
        if not Kit.ConsultaCampos('KITS_PROD', Kit.rKit.vValor, ComboBox1.Text,
          combobox3.Text, 'CODIGO_KIT', true, vDadosIni.codEmpresa,
          ' KITS_PROD.*, ' +
          ' COALESCE(KITS_PROD_TOT.REGRA_PESO_DIM, '''') REGRA_PESO_DIM, ' +
          ' COALESCE(KITS_PROD_TOT.QUANT_PROD_KIT, 0) QUANT_PROD_KIT, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_CUS_PROD, 0) PREC_CUS_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_CUSM_PROD, 0) PREC_CUSM_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_TAB_PROD, 0) PREC_TAB_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_PUBLICO, 0) PREC_PUBLICO, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_30_PROD, 0) PREC_30_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_60_PROD, 0) PREC_60_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PREC_90_PROD, 0) PREC_90_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.PESO_BRUT_PROD, 0) PESO_BRUT_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.COMPRIMENTO_PROD, 0) COMPRIMENTO_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.LARGURA_PROD, 0) LARGURA_PROD, ' +
             ' COALESCE(KITS_PROD_TOT.ALTURA_PROD, 0) ALTURA_PROD, ' +
          ' COALESCE(KITS_PROD_TOT.EST_F, 0) EST_F, ' +
          ' COALESCE(KITS_PROD_TOT.VALOR_TAB_PROKIT, 0) VALOR_TAB_PROKIT, ' +
          ' COALESCE(KITS_PROD_TOT.DESCONTO_VALOR, 0) DESCONTO_VALOR, ' +
          ' COALESCE(KITS_PROD_TOT.DESCONTO_PERC, 0) DESCONTO_PERC,  ' +
          ' COALESCE(KITS_PROD_TOT.VALOR_DESC_TAB_PROKIT, 0) VALOR_DESC_TAB_PROKIT ',
          ' LEFT JOIN KITS_PROD_TOT ON KITS_PROD_TOT.CODIGO_KIT = KITS_PROD.CODIGO_KIT AND KITS_PROD_TOT.COD_EMPRESA = KITS_PROD.COD_EMPRESA ',
          Kit.rKit.vSqlAdicional) then
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              ComboBox1.SetFocus;
      end;
    end;
    Kit.ultimasql := Kit.dataSet.CommandText;
    if ckLixeira.Checked then
    begin
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
      SpeedButton6.Visible := false;

      SpeedButtonECommerce.Visible := false;
      SpeedButton7.Visible := false;
    end
    else
    begin
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      SpeedButton6.Visible := true;

      SpeedButtonECommerce.Visible := true;
      SpeedButton7.Visible := true;
    end;

    Screen.Cursor := crDefault;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
       DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.BitBtn2Click(Sender: TObject);
begin
	if (Kit.dataSet.ChangeCount > 0) then
    if Application.MessageBox('Foram feitas alterações no banco de dados.' + chr(13) +
      'Deseja cancelar as alterações e sair?', 'Confirmação', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON1) = mrYES then
    begin
    	Kit.Cancel;
		  Kit.CancelUpdates;
		  Kit.RollBackTransacao;
    end
    else
    begin
//      PageControl3.ActivePage := TabSheet3;
//      if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
//        DBEdit59.SetFocus;
      exit;
    end;
  inherited;
end;

procedure TFrmCadKits.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO111', 'INCLUIR', '','KITS_PROD_KITS','',kit.buscas, true) then
  	exit;

  if Kit.Insert then
  begin
    TabSheet3.TabVisible := true;
    tsECommerce.TabVisible := False;
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.Show;

    Label158.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    DBComboBox22.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

    DBEdit1.Enabled:=true;
    MontarImagem;
    Kit.PreencheCampos;
    TabSheet3.Caption := 'Dados do Kit';
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
	    DBEdit2.SetFocus;
  end;
end;

procedure TFrmCadKits.BitBtn4Click(Sender: TObject);
begin
  if not Kit.post then
  begin
    setFocusCampoErro(Kit.vNomeCampoErro, Kit.vMensagemErro);
    exit;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if Kit.Insert then
      begin
        Kit.PreencheCampos;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadKits.BitBtn5Click(Sender: TObject);
begin
  Kit.Cancel;
  Kit.CancelUpdates;
  Kit.RollBackTransacao;
  inherited;
end;

procedure TFrmCadKits.BitBtn8Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TFrmCadKits.BitBtn9Click(Sender: TObject);
begin
  if not Kit._imprimirKit(false) then
    exit;
end;

procedure TFrmCadKits.btImagemKitFecharClick(Sender: TObject);
begin
  inherited;
	TForm(pnImagemKit.Parent).ModalResult := ID_CLOSE;	
end;

procedure TFrmCadKits.btnAlterarDadosECClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO411', 'ALTERAR', '', 'KITS_PROD_EC',
     Kit.dataSet.FieldByName('CODIGO_KIT').AsString, Kit.buscas, true) then
    Exit;

//  Kit.vKitEC.abreKitsEC(Kit.dataSet);
//  Kit.vItKit.abreItKitsProd(Kit.dataSet);

  // verificar limite produtos e-commerce
  if (Kit.vKitEC.IsEmpty)
  	or ((not Kit.vKitEC.IsEmpty) and (Kit.vKitEC.dataSet.FieldByName('sinc_ecommerce').AsString <> 'S')) then
  begin
    if not Kit.limiteProdutoEcommerce then
      exit;
  end;

  pnItensLeftEC.Visible := not vDadosIni.vEcommerce.vKitsSincronizarTodosProdutos;
  GroupBox7.Parent := pnItensEC;
  DBGrid2.Parent := pnItensEC;
  GroupBox15.Parent := pnItensKit;

  btnIncluirItemKit.Visible := False;
  btnAlterarItemKit.Visible := False;
  btnDeltarItemKit.Visible := False;
  btnImprimirItemKit.Visible := False;

  LbPagEC.Caption := '1/4';

  sbVoltarEC.Visible := false;
  sbAvancarEC.Visible := true;
  pnOpcoesHtml.Visible := true;
  pnDadosEC.Enabled := true;
  pnOpcoesDadosEC.Visible := pnDadosEC.Enabled;
  if Assigned(WebBrowserEC.Document) then
    (WebBrowserEC.Document as IHTMLDocument2).designMode := 'On';

  lbDescrGradeImg.Caption := trim(Kit.vImagensKit.dataSet.FieldByName('DESCR_GRADE').AsString);
  if Kit.dataSet.State <> dsEdit then
    lbS_qtdeImgProdEC.Caption := ''
  else if Kit.vImagensKit.dataSet.RecordCount <= 0 then
  	lbS_qtdeImgProdEC.Caption := '0/0'
  else
  	lbS_qtdeImgProdEC.Caption := IntToStr(Kit.vImagensKit.dataSet.RecNo) +
      '/' + IntToStr(Kit.vImagensKit.dataSet.RecordCount);
      
  if Kit.vKitEC.IsEmpty then
    Kit.vKitEC.Insert(Kit.dataSet)
  else
    Kit.vKitEC.Edit(Kit.dataSet);

  RemoveAcentosEspacos;

  pnOpcoesDadosEC.Visible := true;
  DesativarAtivarCamposHtml(true);
  
	montarDBComboboxRegra;
  vFocoDadosEC := true;
  vDadosIni.abreForm('Dados E-Commerce', pnDadosEC, [ofEscapeExit, ofAlignAllClientWinCtrl]);

  PageControlEC.ActivePage := TabSheetEC1;
  
  if pnDadosEC.Tag <> 99 then
  	carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
  pnOpcoesDadosEC.Visible := false;
  DesativarAtivarCamposHtml(false);
end;

procedure TFrmCadKits.btnAlterarItemKitClick(Sender: TObject);
begin
  try
    if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit, true) then
    begin
      setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
      exit;
    end;

    if (Kit.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.dataset.Post;
      Kit.Apply;
    end;

    if (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.vKitEC.dataset.Post;
      Kit.vKitEC.Apply;
    end;

    if not Kit.vItKit.Edit(Kit.dataset) then
      exit;

    CheckBox2.Visible := false;
    CheckBox2.Checked := false;
    Label14.Visible := false;

    CheckBoxItensKit.Visible := false;
    CheckBoxItensKit.Checked := false;
    lbItensKit.Visible := false;

    if pnDadosEC.Tag = 99 then
    	vDadosIni.abreForm('Alterando Item no Kit', pnItensKit, [ofBISystemMenuOff, ofEscapeExit, ofAlignAllClientWinCtrl])
    else if PageControl1.ActivePage = TabSheet4 then
    begin
      TabSheet6.TabVisible := true;
      TabSheet6.Show;
      TabSheet6.Caption := 'Alterando Item do Kit';
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
    end
    else if PageControl1.ActivePage = TabSheet1 then
      vDadosIni.abreForm('Alterando Item do Kit', pnItensKit, [ofBISystemMenuOff, ofEscapeExit, ofAlignAllClientWinCtrl]);
  finally
    Kit.abreKitsProd(Kit.dataset);
    Kit.vKitEC.abreKitsEC(Kit.dataset);
    if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.dataSet.Edit;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    AtualizarCamposPesoDimensoes(Kit.vItKit.vRegraPesoDim);
    carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
  end;
end;

procedure TFrmCadKits.btnCancAlterarDadosECClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (btnCancAlterarDadosEC.CanFocus) then
	  btnCancAlterarDadosEC.SetFocus;
  Kit.vKitEC.Cancel;
  Kit.vKitEC.RollBackTransacao;
  AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  TForm(pnDadosEC.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadKits.btnCancItensClick(Sender: TObject);
begin
  inherited;
	Kit.vItKit.dataSet.Cancel;
  Kit.vItKit.RollBackTransacao;
  if pnDadosEC.Tag = 99 then
  	TForm(pnItensKit.Parent).ModalResult := IDCANCEL
  else if PageControl1.ActivePage = TabSheet1 then
    TForm(pnItensKit.Parent).ModalResult := IDCANCEL
  else
  begin
    TabSheet6.TabVisible := false;
    TabSheet5.Show;
    CheckBox2.Visible := false;
    CheckBox2.Checked := false;
    Label14.Visible := false;
    CheckBox2.Font.Color := clTeal;
  end;
end;

procedure TFrmCadKits.btnDeltarItemKitClick(Sender: TObject);
begin
	try
  	btnIncluirItemKit.Enabled := false;
    btnAlterarItemKit.Enabled := false;
    btnDeltarItemKit.Enabled := false;
    btnImprimirItemKit.Enabled := false;
  	btnOKAlterarDadosEC.Enabled := false;
    btnCancAlterarDadosEC.Enabled := false;
    sbVoltarEC.Enabled := false;
    sbAvancarEC.Enabled := false;
    
    Kit.vItKit.vRegraPesoDim := Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString;

    if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit, false, true) then
    begin
      setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
      exit;
    end;

    if (Kit.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.dataset.Post;
      Kit.Apply;
    end;

    if (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.vKitEC.dataset.Post;
      Kit.vKitEC.Apply;
    end;

    if not Kit.vItKit.Delete(Kit, pnDadosEC.Tag = 99) then
      exit;
  finally
  	Kit.abreKitsProd(Kit.dataset);
    Kit.vKitEC.abreKitsEC(Kit.dataset);
    if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.dataSet.Edit;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    AtualizarCamposPesoDimensoes(Kit.vItKit.vRegraPesoDim);
    carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
    
  	btnIncluirItemKit.Enabled := true;
    btnAlterarItemKit.Enabled := true;
    btnDeltarItemKit.Enabled := true;
    btnImprimirItemKit.Enabled := true;
  	btnOKAlterarDadosEC.Enabled := true;
    btnCancAlterarDadosEC.Enabled := true;
    sbVoltarEC.Enabled := true;
    sbAvancarEC.Enabled := true;
    
    Kit.vItKit.vRegraPesoDim := '';
  end;
end;

procedure TFrmCadKits.btnImprimirItemKitClick(Sender: TObject);
begin
  if not Kit._imprimirKit(false) then
    exit;
end;

procedure TFrmCadKits.btnIncluirItemKitClick(Sender: TObject);
begin
  try
//    if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit, true) then
//    begin
//      setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
//      exit;
//    end;

    if (Kit.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.dataset.Post;
      Kit.Apply;
    end;

    if (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.vKitEC.dataset.Post;
      Kit.vKitEC.Apply;
    end;

    if not Kit.vItKit.Insert(Kit.dataSet) then
      exit;

    CheckBox2.Visible := true;
    CheckBox2.Checked := false;
    Label14.Visible := true;

    CheckBoxItensKit.Visible := true;
    CheckBoxItensKit.Checked := false;
    lbItensKit.Visible := true;

    if pnDadosEC.Tag = 99 then
    	vDadosIni.abreForm('Incluindo novo Item no Kit', pnItensKit, [ofBISystemMenuOff, ofEscapeExit, ofAlignAllClientWinCtrl])
    else if PageControl1.ActivePage = TabSheet4 then
    begin
      TabSheet6.TabVisible := true;
      TabSheet6.Show;
      TabSheet6.Caption := 'Incluindo novo Item no Kit';
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
    end
    else if PageControl1.ActivePage = TabSheet1 then
      vDadosIni.abreForm('Incluindo novo Item no Kit', pnItensKit, [ofBISystemMenuOff, ofEscapeExit, ofAlignAllClientWinCtrl]);
    Kit.vItKit.Preenchecampos;
  finally
    Kit.abreKitsProd(Kit.dataset);
    Kit.vKitEC.abreKitsEC(Kit.dataset);
    if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.dataSet.Edit;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    AtualizarCamposPesoDimensoes(Kit.vItKit.vRegraPesoDim);
    carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
  end;
end;

procedure TFrmCadKits.btnOKAlterarDadosECClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
	try
  	btnIncluirItemKit.Enabled := false;
    btnAlterarItemKit.Enabled := false;
    btnDeltarItemKit.Enabled := false;
    btnImprimirItemKit.Enabled := false;
  	btnOKAlterarDadosEC.Enabled := false;
    btnCancAlterarDadosEC.Enabled := false;
    sbVoltarEC.Enabled := false;
    sbAvancarEC.Enabled := false;

    if not vDadosIni.PesqPros('PRO412', 'SALVAR', '', 'KITS_PROD_EC',
       Kit.dataSet.FieldByName('CODIGO_KIT').AsString, Kit.buscas, true) then
      Exit;

    if (Self.Enabled) and (Self.Visible) and (btnOKAlterarDadosEC.CanFocus) then
      btnOKAlterarDadosEC.SetFocus;
    HTMLDocument := WebBrowserEC.Document as IHTMLDocument2;
    Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString := HTMLDocument.body.innerHTML;
    if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit, true, true) then
    begin
      setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
      exit;
    end;
    if not Kit.vKitEC.Post(Kit, Kit.vItKit, pnDadosEC.Tag = 99) then
    begin
      setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
      exit;
    end;

    if (Kit.dataSet.FieldByName('ID_COMMERCE').AsInteger > 0)
      and (Kit.vKitEC.dataSet.FieldByName('SINC_ECOMMERCE').AsString = 'N') then
    begin
    	if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    		Kit.dataSet.Edit;
   	 	Kit.dataSet.FieldByName('ID_COMMERCE').Value := Null;
    end;

    AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
    TForm(pnDadosEC.Parent).ModalResult := IDOK;
  finally
    btnIncluirItemKit.Enabled := true;
    btnAlterarItemKit.Enabled := true;
    btnDeltarItemKit.Enabled := true;
    btnImprimirItemKit.Enabled := true;
  	btnOKAlterarDadosEC.Enabled := true;
    btnCancAlterarDadosEC.Enabled := true;
    sbVoltarEC.Enabled := true;
    sbAvancarEC.Enabled := true;
  end;
end;

procedure TFrmCadKits.btnOKItensClick(Sender: TObject);
begin
	try
  	btnOKItens.Enabled := false;
    btnCancItens.Enabled := false;

    Kit.vItKit.vRegraPesoDim := Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString;

    if Kit.vItKit.Post(Kit, false) then
    begin
      if (CheckBox2.Checked) or (CheckBoxItensKit.Checked) then
      begin
        if Kit.vItKit.Insert(Kit.dataSet) then
        begin
          if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
            DBEdit4.SetFocus;
          Kit.vItKit.Preenchecampos;
        end;
      end
      else
      begin
      	if pnDadosEC.Tag = 99 then
          TForm(pnItensKit.Parent).ModalResult := IDOK
        else if PageControl1.ActivePage = TabSheet1 then
          TForm(pnItensKit.Parent).ModalResult := IDOK
        else
        begin
          TabSheet6.TabVisible := false;
          TabSheet5.Show;
          CheckBox2.Visible := false;
          Label14.Visible := false;
        end;
      end;
    end
    else
    begin
      setFocusCampoErro(Kit.vItKit.vNomeCampoErro, Kit.vItKit.vMensagemErro);
      exit;
    end;
  finally
  	Kit.abreKitsProd(Kit.dataset);
    Kit.vKitEC.abreKitsEC(Kit.dataset);
    if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.dataSet.Edit;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    AtualizarCamposPesoDimensoes(Kit.vItKit.vRegraPesoDim);
    carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
    
  	btnOKItens.Enabled := true;
    btnCancItens.Enabled := true;

    Kit.vItKit.vRegraPesoDim := '';
  end;
end;

procedure TFrmCadKits.btSalvarServLoteClick(Sender: TObject);
begin
  inherited;
  try
  	 Screen.Cursor := crHourGlass;
    FrmCadKits.Enabled := false;
    DBGrid1.Visible := false;

    Kit.vAtualizarKit.vHabSomenteKitTodo := ckSomenteKitTodo.Checked;
    Kit.vAtualizarKit.vHabVendaOnline := ckVendaOnline.Checked;

    Kit.vAtualizarKit.vSomenteKitTodo := Trim(cbSomenteKitTodo.Text);
    Kit.vAtualizarKit.vVendaOnline := Trim(cbVendaOnline.Text);

    if not Kit.AtualizarKitsEmLote then
	 begin
      setFocusCampoErro(Kit.vNomeCampoErro, Kit.vMensagemErro);
      exit;
    end;
  finally
    _GravaConfiguracoesInteger(cbSomenteKitTodo.Name, cbSomenteKitTodo.ItemIndex);
    _GravaConfiguracoesInteger(cbVendaOnline.Name, cbVendaOnline.ItemIndex);

    _GravaConfiguracoesBoolean(ckSomenteKitTodo.Name, ckSomenteKitTodo.Checked);
    _GravaConfiguracoesBoolean(ckVendaOnline.Name, ckVendaOnline.Checked);

    FrmCadKits.Enabled := true;
    DBGrid1.Visible := true;
    Screen.Cursor := crDefault;
  end;

  PageControl1.ActivePage := tsAlterDadosKit;
  tsAlterDadosKit.Show;
end;

procedure TFrmCadKits.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Kit._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadKits.btSincronizarServicosClick(Sender: TObject);
begin
  inherited;
  try
  	 Screen.Cursor := crHourGlass;
    FrmCadKits.Enabled := false;
    DBGrid1.Visible := false;
  	 if not Kit.sincronizarKitsEmLote then
      exit;
  finally
  	 FrmCadKits.Enabled := true;
    DBGrid1.Visible := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Kit._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadKits.btVoltarDadosKit2Click(Sender: TObject);
begin
  inherited;
  try
    inherited;
    ckLixeira.Visible := True;
    ckLixeira.Checked := False;

    if ckLixeira.Checked then
      FrmCadKits.Caption := 'Kits de Produtos (Lixeira)'
    else
      FrmCadKits.Caption := 'Kits de Produtos';

    Panel2.Visible := true;

    GroupBox3.Parent := TabSheet2;

    btVoltarDadosKit.Parent := Panel52;
    BitBtn2.Visible := True;
	 BitBtn3.Visible := True;
    Panel1.Parent := TabSheet2;
    PageControl1.ActivePage := TabSheet2;
    TelaCadastro := 0;
    Self.fechar  := False;
  finally

  end;
end;

procedure TFrmCadKits.btVoltarDadosKitClick(Sender: TObject);
begin
  try
    inherited;
    ckLixeira.Visible := True;
    ckLixeira.Checked := False;

    if ckLixeira.Checked then
      FrmCadKits.Caption := 'Kits de Produtos (Lixeira)'
    else
      FrmCadKits.Caption := 'Kits de Produtos';

    Panel2.Visible := true;

    GroupBox3.Parent := TabSheet2;

    btVoltarDadosKit.Parent := Panel52;
    BitBtn2.Visible := True;
	 BitBtn3.Visible := True;
    Panel1.Parent := TabSheet2;
    PageControl1.ActivePage := TabSheet2;
    TelaCadastro := 0;
    Self.fechar  := False;
  finally

  end;
end;

procedure TFrmCadKits.carregarwebbrownser(pWebBrowser: TWebBrowser;
  pHtml: string);
var
  vhtml: string;
  ADoccument: Variant;
begin
   DBComboBoxSincEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('SINC_ECOMMERCE').AsString = 'S', 0, 1);
   DBComboBoxDispEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('DISPONIVEL').AsString = 'S', 0, 1);
   DBComboBoxPrecoCombinarEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('COMPREJUNTO').AsString = 'S', 0, 1);
   DBComboBoxPromoEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('PROMOCIONAL').AsString = 'S', 0, 1);
   DBComboBoxFreteGratisEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('FRETE_GRATIS').AsString = 'S', 0, 1);
   DBComboBoxLancEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('LANCAMENTO').AsString = 'S', 0, 1);
   DBComboBoxTermAceiteEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('TERMOS_ACEITE').AsString = 'S', 0, 1);
   DBComboBoxCompreJuntoEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('COMPREJUNTO').AsString = 'S', 0, 1);
   DBComboBoxVirtualEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('VIRTUAL').AsString = 'S', 0, 1);
   DBComboBoxDestaqueEC.ItemIndex := vDadosIni.IfThen(
   	 Kit.vKitEC.dataSet.FieldByName('DESTAQUE').AsString = 'S', 0, 1);

   DocumentoEmBranco(pWebBrowser);
     (pWebBrowser.Document as IHTMLDocument2).designMode := 'Off';
//     (pWebBrowser.Document as IHTMLDocument2).designMode := 'On';
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
end;

procedure TFrmCadKits.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
  begin
    Label14.Font.Color := clRed;
    CheckBox2.Font.Color := clRed;
  end
  else
  begin
    Label14.Font.Color := clTeal;
    CheckBox2.Font.Color := clTeal;
  end;
end;

procedure TFrmCadKits.ckLixeiraClick(Sender: TObject);
begin
  inherited;
  if not ckLixeira.Visible then
    exit;

  if not ckLixeira.Enabled then
  begin
  	 if ckLixeira.Checked then
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO113]';
      btExcluirRegistro.Hint := 'Excluir registro permanentemente - [PRO113]';
    end
    else
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [PRO114]';
      btExcluirRegistro.Hint := 'Enviar para Lixeira - [PRO114]';
    end;
  	exit;
  end;

  if ckLixeira.Checked then
  	 SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO113]'
  else
 	 SpeedButton2.Hint := 'Enviar para Lixeira - [PRO114]';

  if (PageControl1.ActivePage = tsAlterDadosKit) then
  begin
    if ckLixeira.Checked then
      FrmCadKits.Caption := 'Alteração Kits de Produtos em Lote (Lixeira)'
    else
      FrmCadKits.Caption := 'Alteração Kits de Produtos em Lote';
  end
  else
  begin
    if ckLixeira.Checked then
    	FrmCadKits.Caption := 'Kits de Produtos (Lixeira)'
    else
      FrmCadKits.Caption := 'Kits de Produtos';
  end;
  BitBtn1Click(Sender);
end;

procedure TFrmCadKits.ckPermOpcaoMarcadasClick(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesBoolean(ckPermOpcaoMarcadas.Name, ckPermOpcaoMarcadas.Checked);
end;

procedure TFrmCadKits.ckSomenteKitTodoClick(Sender: TObject);
begin
  inherited;
  cbSomenteKitTodo.Enabled := ckSomenteKitTodo.Checked;
  if ckSomenteKitTodo.Checked then
  begin
  	 pnSomenteKitTodo.ParentBackground := False;
	 pnSomenteKitTodo.Color := clYellow;
  end
  else
  begin
  	 pnSomenteKitTodo.ParentBackground := True;
  	 pnSomenteKitTodo.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbSomenteKitTodo.CanFocus) then
  	cbSomenteKitTodo.SetFocus;
end;

procedure TFrmCadKits.ckVendaOnlineClick(Sender: TObject);
begin
  inherited;
  cbVendaOnline.Enabled := ckVendaOnline.Checked;
  if ckVendaOnline.Checked then
  begin
  	 pnVendaOnline.ParentBackground := False;
	 pnVendaOnline.Color := clYellow;
  end
  else
  begin
  	 pnVendaOnline.ParentBackground := True;
  	 pnVendaOnline.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbVendaOnline.CanFocus) then
  	cbVendaOnline.SetFocus;
end;

procedure TFrmCadKits.Configurarcolunas1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO197', 'CONFIGURAR', '', 'KITS_PROD', '', Kit.buscas, true) then
    inherited;
end;

procedure TFrmCadKits.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if not Kit.TipoKit then
  	if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
end;

procedure TFrmCadKits.DBComboBoxRegraExit(Sender: TObject);
begin
  inherited;
  lbPeso.Visible := trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) <> '';
  lbPesoInf.Visible := trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) <> '';
  lbComprimento.Visible := trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) <> '';
  lbComprimentoInf.Visible := trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) <> '';
  lbAltura.Visible := trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) <> '';
  lbAlturaInf.Visible := trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) <> '';
  lbLargura.Visible := trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) <> '';
  lbLarguraInf.Visible := trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) <> '';

  if (trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) = 'Usar a soma dos pesos e dimensões dos produtos') then
  begin
    DBEditPeso.Enabled := false;
    DBEditComprimento.Enabled := false;
    DBEditAltura.Enabled := false;
    DBEditLargura.Enabled := false;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString := 'SOMARPESODIM';
    DBComboBoxRegra.ItemIndex := 0;
    AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  end
  else if (trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) = 'Cadastrar peso e dimensões específicas para o kit') then
  begin
    DBEditPeso.Enabled := true;
    DBEditComprimento.Enabled := true;
    DBEditAltura.Enabled := true;
    DBEditLargura.Enabled := true;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString := 'CADPESODIM';
    DBComboBoxRegra.ItemIndex := 1;
    AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  end
  else if (trim(DBComboBoxRegra.Items[DBComboBoxRegra.ItemIndex]) = 'Usar a soma dos pesos e cadastrar dimensões específicas para o kit') then
  begin
    DBEditPeso.Enabled := false;
    DBEditComprimento.Enabled := true;
    DBEditAltura.Enabled := true;
    DBEditLargura.Enabled := true;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString := 'SOMARPESO_CADDIM';
    DBComboBoxRegra.ItemIndex := 2;
    AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  end
  else
  begin
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString := '';
    DBComboBoxRegra.ItemIndex := -1;
    AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEditPeso.CanFocus) then
  	DBEditPeso.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditComprimento.CanFocus) then
  	DBEditComprimento.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditAltura.CanFocus) then
  	DBEditAltura.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditLargura.CanFocus) then
  	DBEditLargura.SetFocus;
end;

procedure TFrmCadKits.DBEditDescPercExit(Sender: TObject);
begin
	if Kit.vKitEC.dataSet.FieldByName('DESCONTO_PERC').AsFloat > 0 then
  	Kit.vKitEC.dataSet.FieldByName('DESCONTO_VALOR').AsFloat := 0;
end;

procedure TFrmCadKits.DBEditDescValorExit(Sender: TObject);
begin
  if Kit.vKitEC.dataSet.FieldByName('DESCONTO_VALOR').AsFloat > 0 then
  	Kit.vKitEC.dataSet.FieldByName('DESCONTO_PERC').AsFloat := 0;
end;

procedure TFrmCadKits.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = BitBtn15) or (activecontrol = BitBtn16) or (activecontrol = btnCancItens) then
    exit;

  if TDBEdit(Sender).Text = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if Kit.vItKit.dataSet.State in [dsInsert, dsEdit] then
        if vDadosIni.vPesquisa <> '' then
          Kit.vItKit.dataSet.FieldByName('num_fab_prod').AsString := vDadosIni.vPesquisa
        else
        begin
        	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
          	DBEdit4.SetFocus;
          exit;
        end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  if Kit.vItKit.VerificaItKit(Kit) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
	    DBEdit3.SetFocus
  end
  else
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    	DBEdit4.SetFocus;
  end;
end;

procedure TFrmCadKits.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    SpeedButton10Click(Sender);
end;

procedure TFrmCadKits.DBEditAlturaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadKits.DBEditComprimentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadKits.DBEditLarguraKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadKits.DBEditTituloPagExit(Sender: TObject);
begin
  RemoveAcentosEspacos;
end;

procedure TFrmCadKits.DBEditURLAcessoExit(Sender: TObject);
begin
  RemoveAcentosEspacos;
end;

procedure TFrmCadKits.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    Kit._marcaDesmarcaLinha;
end;

procedure TFrmCadKits.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

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

procedure TFrmCadKits.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not Kit.dataSet.IsEmpty then
      Kit._marcaDesmarcaLinha;
end;

procedure TFrmCadKits.DBGrid2ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
    cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmCadKits.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
	if PageControl1.ActivePage = TabSheet1 then
  begin
    if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('SINC_ECOMMERCE').AsString) = 'S')
    	or (vDadosIni.vEcommerce.vKitsSincronizarTodosProdutos) then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := TColor($00FF8000);
        TDBGrid(sender).canvas.Font.color := clWhite;
      end;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TFrmCadKits.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn11Click(Sender)
  else if Key = VK_DELETE then
    BitBtn12Click(Sender)
  else if Key = VK_INSERT then
  	BitBtn10Click(Sender);
end;

procedure TFrmCadKits.DesativarAtivarCamposHtml(pHablitar: boolean);
begin
	pnDadosEC.Enabled := pHablitar;
  pnOpcoesDadosEC.Enabled := pHablitar;

  btnOKAlterarDadosEC.Enabled := pnOpcoesDadosEC.Enabled and pnOpcoesDadosEC.Visible;
  btnCancAlterarDadosEC.Enabled := pnOpcoesDadosEC.Enabled and pnOpcoesDadosEC.Visible;
  sbVoltarEC.Enabled := pnOpcoesDadosEC.Enabled and pnOpcoesDadosEC.Visible;
  sbAvancarEC.Enabled := pnOpcoesDadosEC.Enabled and pnOpcoesDadosEC.Visible;

  SpeedButtonAlterarHtmlEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);

  lbDescrCompletaEC.Enabled := (pnOpcoesDadosEC.Enabled)
    and (pnOpcoesDadosEC.Visible);
  pnDescricaoHTMLEC.Enabled := (pnOpcoesDadosEC.Enabled)
    and (pnOpcoesDadosEC.Visible);

  lbDescrEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);
  DBEditDescrEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);

  lbSincEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);
  DBComboBoxSincEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);

  lbDispEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);
  DBComboBoxDispEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);

  lbPrecoCombinarEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);
  DBComboBoxPrecoCombinarEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);

  lbPromoEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBComboBoxPromoEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbFreteGratisEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);
  DBComboBoxFreteGratisEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);

  lbLancEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBComboBoxLancEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbTermAceiteEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBComboBoxTermAceiteEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbCompreJuntoEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBComboBoxCompreJuntoEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbVirtualEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);
  DBComboBoxVirtualEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible);

  lbDestaqueEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBComboBoxDestaqueEC.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbCategoria.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBLookupComboBoxCategoria.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbCodReferencia.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditCodReferencia.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbCodEAN.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditCodEAN.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbRegra.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBComboBoxRegra.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbPeso.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  lbPesoInf.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditPeso.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbComprimento.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  lbComprimentoInf.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditComprimento.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbAltura.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  lbAlturaInf.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditAltura.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbLargura.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  lbLarguraInf.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditLargura.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbDescValor.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditDescValor.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbDescPerc.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditDescPerc.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbTituloPag.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditTituloPag.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbPalavrasChaves.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  lbPalavrasChavesInf.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditPalavrasChaves.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  lbUrlAcesso.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
  DBEditURLAcesso.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

//    PageControlEC.Enabled := pnOpcoesDadosEC.Enabled and pnOpcoesDadosEC.Visible;
  TabSheetEC1.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  TabSheetEC2.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  TabSheetEC3.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  TabSheetEC4.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  TabSheetEC5.Enabled := (pnOpcoesDadosEC.Enabled)
  	and (pnOpcoesDadosEC.Visible)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
end;

procedure TFrmCadKits.DesmarcarTodosKitsProdutosClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Kit._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadKits.DocumentoEmBranco(pWebBrowser: TWebBrowser);
begin
	if not Assigned(pWebBrowser.Document) then
     pWebBrowser.Navigate('about:blank');
end;

procedure TFrmCadKits.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not Assigned(DBGrid2.DataSource) then
    Exit;
  if not Assigned(DBGrid2.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa2 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
      cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid2, GridCfg2, true, ListPositions2, cdsGrid2);

  Kit.Cancel;
  Kit.RollBackTransacao;
  Kit.free;
  Action := caFree;
  FrmCadKits := nil;
end;

procedure TFrmCadKits.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  Kit := TKitsProdutos.Create;
  Kit.abreKitsProd(true);

  TabSheet4.TabVisible := false;
  tsPromocaoKit.TabVisible := false;
  TabSheetEC1.TabVisible := false;
  TabSheetEC2.TabVisible := false;
  TabSheetEC3.TabVisible := false;
  TabSheetEC4.TabVisible := false;
  TabSheetEC5.TabVisible := false;
  tsImagemKit.TabVisible := false;
  tsAlterDadosKit.TabVisible := false;
  tsAlterDadosLote.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  PageControl3.ActivePage := TabSheet3;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadKits.FormItensKitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (key = vk_f2) then
  begin
    CheckBoxItensKit.Checked := not CheckBoxItensKit.Checked;
    if CheckBoxItensKit.Checked then
    begin
      CheckBoxItensKit.Font.Color := clRed;
      lbItensKit.Font.Color := clRed;
    end
    else
    begin
      lbItensKit.Font.Color := clTeal;
      CheckBoxItensKit.Font.Color := clTeal;
    end;
  end;
end;

procedure TFrmCadKits.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (Kit.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
  else if (key = vk_f2) then
  begin
    CheckBox2.Checked := not CheckBox2.Checked;
    if CheckBox2.Checked then
    begin
      CheckBox2.Font.Color := clRed;
      Label14.Font.Color := clRed;
    end
    else
    begin
      Label14.Font.Color := clTeal;
      CheckBox2.Font.Color := clTeal;
    end;
  end;
end;

procedure TFrmCadKits.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsKits;
    inherited;
    if vCriou = 0 then
    begin
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

      vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet2, GridCfg2, DBGrid2, cdsGrid2, cdsColunas2, trans2, ListGridsAndDataSets2,
        ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario2);
    end;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  lixeiraVazia(not Kit.StatusLixeira);

  if PrimeiraPesquisa2 then
  begin
    PrimeiraPesquisa2 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid2, GridCfg2, cdsGrid2, cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
  end;

  if vCriou = 0 then
  begin
    testarDiretorioImagemProduto;

    abrirDiretorioDestinoImagem;
  end;

  SpeedButtonECommerce.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce)
    and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

function TFrmCadKits.GetBrowserHtml(const webBrowser: TWebBrowser): String;
var
  strStream: TStringStream;
  adapter: IStream;
  browserStream: IPersistStreamInit;
begin
  strStream := TStringStream.Create('');
  try
    browserStream := webBrowser.Document as IPersistStreamInit;
    adapter := TStreamAdapter.Create(strStream,soReference);
    browserStream.Save(adapter,true);
    result := strStream.DataString;
  finally
  end;
  strStream.Free();
end;

procedure TFrmCadKits.habilitarCamposECommerce(pFormulario: boolean = False);
begin
  pnOpcoesDadosEC.Visible := false;
  if not pFormulario then
  begin
 	 DesativarAtivarCamposHtml(true);
 	 PageControlEC.ActivePage := TabSheetEC1;

  	carregarwebbrownser(WebBrowserEC, kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
  end;
  if kit.montarTreeViewEC then
  begin
  	kit.montarTreeViewEC := false;
  	kit.vCategorias.montarTreeView(TreeViewCat);
    Kit.vCategorias.montarTreeViewDB(Kit, TreeViewCatDB);
  end;
end;

procedure TFrmCadKits.Image1DblClick(Sender: TObject);
//var
//  vTemp: string;
begin
  if Kit.vImagensKit.dataSet.RecordCount <= 0 then
  	exit;

  if Kit.vImagensKit.dataSet.FieldByName('DATA_CAD').IsNull then
  	EditDataCadImg.Text  := ''
  else
  	EditDataCadImg.Text  := FormatDateTime('dd/mm/yyyy', Kit.vImagensKit.dataSet.FieldByName('DATA_CAD').AsDateTime);

  MemoEndereco.Text      := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
  	trim(Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString);

  MemoUrl.Text           := trim(Kit.vImagensKit.dataSet.FieldByName('URL').AsString);

  MemoErro.Text          := trim(Kit.vImagensKit.dataSet.FieldByName('ERRO').AsString);

  if Kit.vImagensKit.dataSet.FieldByName('DATA_HORA_FALHA').IsNull then
  	EditDataErroImg.Text := ''
  else
  	EditDataErroImg.Text := FormatDateTime('dd/mm/yyyy', Kit.vImagensKit.dataSet.FieldByName('DATA_HORA_FALHA').AsDateTime);

  if not vDadosIni.abreForm('Imagem', pnImagemKit, [ofAutoSize, ofEscapeExit]) then
  	exit;
//  vTemp := Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString;
//  InputQuery('Endereço da Imagem', 'Endereço da imagem', vTemp);
end;

procedure TFrmCadKits.MarcarTodosKitsProdutosClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Kit._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadKits.MenuItem1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO197', 'CONFIGURAR', '', 'KITS_PROD_KITS', '', Kit.vItKit.buscas, true) then
    vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGrid2, GridCfg2, cdsGrid2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmCadKits.MenuItem2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO198', 'RESETAR', '', 'KITS_PROD_KITS', '', Kit.vItKit.buscas, true) then
    vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid2, GridCfg2, cdsColunas2, cdsGrid2, usuario2,
       vDadosIni.transacaoCol, fReset2, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TFrmCadKits.MenuItem3Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid2, usuario2, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmCadKits.MenuItem4Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid2);
end;

procedure TFrmCadKits.MenuItem5Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadKits.MontarDBComboboxRegra;
begin
	if (trim(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString) = 'SOMARPESODIM')
  	or (trim(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString) = '') then
  begin
    DBEditPeso.Enabled := false;
    DBEditComprimento.Enabled := false;
    DBEditAltura.Enabled := false;
    DBEditLargura.Enabled := false;
    if (trim(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString) = 'SOMARPESODIM') then
	    DBComboBoxRegra.ItemIndex := 0
    else
    	DBComboBoxRegra.ItemIndex := - 1;
  end
  else if trim(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString) = 'CADPESODIM' then
  begin
    DBEditPeso.Enabled := true;
    DBEditComprimento.Enabled := true;
    DBEditAltura.Enabled := true;
    DBEditLargura.Enabled := true;
    DBComboBoxRegra.ItemIndex := 1;
  end
  else if trim(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString) = 'SOMARPESO_CADDIM' then
  begin
    DBEditPeso.Enabled := false;
    DBEditComprimento.Enabled := true;
    DBEditAltura.Enabled := true;
    DBEditLargura.Enabled := true;
    DBComboBoxRegra.ItemIndex := 2;
  end;
end;

procedure TFrmCadKits.MontarImagem;
begin
	if Kit.vImagensKit.dataSet.RecordCount <= 0 then
  begin
    Image1.Picture.Assign(nil);
    Image1.Hint    := '';
  end
  else
  begin
  	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
      Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString) then
    begin
      if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
        Image1.Picture.LoadFromFile('')
      else
        Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
    end
    else
    begin
      Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString);
    end;

    Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
      Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString;
  end;

  if Kit.vImagensKit.dataSet.RecordCount <= 0 then
    lbS_qtdeImgProdEC.Caption := '0/0'
  else
    lbS_qtdeImgProdEC.Caption := IntToStr(Kit.vImagensKit.dataSet.RecNo) +
      '/' + IntToStr(Kit.vImagensKit.dataSet.RecordCount);
end;

procedure TFrmCadKits.PageControl3Change(Sender: TObject);
begin
  inherited;
	if PageControl3.ActivePage = tsECommerce then
  begin
  	AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  	habilitarCamposECommerce;
  end;
end;

procedure TFrmCadKits.pnDadosECEnter(Sender: TObject);
begin
	if not vFocoDadosEC then
  	exit;
    
	if not pnDadosEC.Enabled then
    exit;

  if not pnOpcoesDadosEC.Enabled then
    exit;

  carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);

	vFocoDadosEC := false;
  
  if (Self.Enabled) and (Self.Visible) and (DBEditDescrEC.CanFocus) then
    DBEditDescrEC.SetFocus;
end;

procedure TFrmCadKits.pnImagemKitEnter(Sender: TObject);
begin
  if MemoEndereco.CanFocus then
    MemoEndereco.SetFocus;
end;

procedure TFrmCadKits.pnItensKitEnter(Sender: TObject);
begin
  inherited;
  TForm(pnItensKit.Parent).KeyPreview := true;
  TForm(pnItensKit.Parent).OnKeyDown := FormItensKitKeyDown;
	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    DBEdit4.SetFocus;
end;

procedure TFrmCadKits.RemoveAcentosEspacos;
begin
  if trim(Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_RES').AsString) <> '' then
  	if trim(Kit.vKitEC.dataSet.FieldByName('TITULO_PAGINA').AsString) = '' then
    	Kit.vKitEC.dataSet.FieldByName('TITULO_PAGINA').AsString :=
        trim(Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_RES').AsString);

	if trim(Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_RES').AsString) <> '' then
  	if trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString) = '' then
    	Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString :=
        vDadosIni.RemoveAcentos(trim(Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_RES').AsString));

  if (trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString) <> '')
  	and (Pos(' ', trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString)) > 0) then
  begin
  	Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString :=
		  trim(StringReplace(trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString), '  ', ' ', [rfReplaceAll, rfIgnoreCase]));
    Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString :=
		  trim(StringReplace(trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString), '  ', ' ', [rfReplaceAll, rfIgnoreCase]));
  end;

  if (trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString) <> '')
  	and (Pos(' ', trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString)) > 0) then
  begin
  	Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString :=
		  trim(StringReplace(trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString), ' ', '-', [rfReplaceAll, rfIgnoreCase]));
  end;

  if (trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString) <> '')
  	and (Pos('-', trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString)) > 0) then
  begin
  	Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString :=
		  trim(StringReplace(trim(Kit.vKitEC.dataSet.FieldByName('URL_ACESSO').AsString), '--', '-', [rfReplaceAll, rfIgnoreCase]));
  end;
end;

procedure TFrmCadKits.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO198', 'RESETAR', '', 'KITS_PROD', '', Kit.buscas, true) then
    inherited;
end;

procedure TFrmCadKits.sbAvancarECClick(Sender: TObject);
begin
  if PageControlEC.ActivePage = TabSheetEC1 then
    PageControlEC.ActivePage := TabSheetEC2
  else if PageControlEC.ActivePage = TabSheetEC2 then
     PageControlEC.ActivePage := TabSheetEC3
  else if PageControlEC.ActivePage = TabSheetEC3 then
  	PageControlEC.ActivePage := TabSheetEC4;
  verificarAbaEcommerceComercioAberto;
end;

procedure TFrmCadKits.sbVoltarECClick(Sender: TObject);
begin
	if PageControlEC.ActivePage = TabSheetEC2 then
    PageControlEC.ActivePage := TabSheetEC1
  else if PageControlEC.ActivePage = TabSheetEC3 then
    PageControlEC.ActivePage := TabSheetEC2
  else if PageControlEC.ActivePage = TabSheetEC4 then
  	PageControlEC.ActivePage := TabSheetEC3;
  verificarAbaEcommerceComercioAberto;
end;

procedure TFrmCadKits.ScrollBox4Enter(Sender: TObject);
begin
  vConfigColuna2 := true;
end;

procedure TFrmCadKits.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid2, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmCadKits.SpeedBDesmarcarTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Kit._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadKits.SpeedBSelTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Kit._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadKits.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if Kit.vItKit.dataSet.State in [dsInsert, dsEdit] then
      if vDadosIni.vPesquisa <> '' then
        Kit.vItKit.dataSet.FieldByName('num_fab_prod').AsString := vDadosIni.vPesquisa
      else
      begin
        if trim(DBEdit4.Text) = '' then
        begin
        	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
          	DBEdit4.SetFocus;
          exit;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;

  if Kit.vItKit.VerificaItKit(Kit) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
	    DBEdit3.SetFocus;
  end
  else
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
	    DBEdit4.SetFocus;
  end;
end;

procedure TFrmCadKits.SpeedButton13Click(Sender: TObject);
begin
	if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit) then
  begin
    setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
    exit;
  end;

  if (Kit.dataSet.State in [dsInsert, dsEdit]) then
  begin
    Kit.dataset.Post;
    Kit.Apply;
  end;

	if not (Kit.vItKit.AddRemoverProduto(Kit, false, false)) then
  	exit;

  Kit.abreKitsProd(Kit.dataset);
  Kit.vKitEC.abreKitsEC(Kit.dataset);
  if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    Kit.dataSet.Edit;
  if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    Kit.vKitEC.dataSet.Edit;
  AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
end;

procedure TFrmCadKits.SpeedButton14Click(Sender: TObject);
begin
	if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit) then
  begin
    setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
    exit;
  end;

  if (Kit.dataSet.State in [dsInsert, dsEdit]) then
  begin
    Kit.dataset.Post;
    Kit.Apply;
  end;
  
	if not (Kit.vItKit.AddRemoverProduto(Kit, true, true)) then
  	exit;

  Kit.abreKitsProd(Kit.dataset);
  Kit.vItKit.abreItKitsProd(Kit.dataset);
  Kit.vKitEC.abreKitsEC(Kit.dataset);
  if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    Kit.dataSet.Edit;
  if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    Kit.vKitEC.dataSet.Edit;
  AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
end;

procedure TFrmCadKits.SpeedButton15Click(Sender: TObject);
begin
	if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit) then
  begin
    setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
    exit;
  end;

  if (Kit.dataSet.State in [dsInsert, dsEdit]) then
  begin
    Kit.dataset.Post;
    Kit.Apply;
  end;
  
	if not (Kit.vItKit.AddRemoverProduto(Kit, false, true)) then
  	exit;
  
  Kit.abreKitsProd(Kit.dataset);
  Kit.vItKit.abreItKitsProd(Kit.dataset);
  Kit.vKitEC.abreKitsEC(Kit.dataset);
  if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    Kit.dataSet.Edit;
  if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    Kit.vKitEC.dataSet.Edit;
  AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
end;

procedure TFrmCadKits.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO112', 'ALTERAR', '','KITS_PROD_KITS',
  	Kit.dataSet.FieldByName('CODIGO_KIT').AsString, kit.buscas, true) then
    	exit;

  if Kit.dataSet.IsEmpty then
  	exit;

  try
    if Assigned(TreeViewCat) then
      FreeAndNil(TreeViewCat);
  finally
    if not Assigned(TreeViewCat) then
    begin
      TreeViewCat := TTreeView.Create(Self);
      TreeViewCat.Parent := Panel93;
      TreeViewCat.Align := alClient;
      TreeViewCat.OnDblClick := TreeViewCatDblClick;
      TreeViewCat.Items.Clear;
    end;
  end;

  try
    if Assigned(TreeViewCatDB) then
      FreeAndNil(TreeViewCatDB);
  finally
    if not Assigned(TreeViewCatDB) then
    begin
      TreeViewCatDB := TTreeView.Create(Self);
      TreeViewCatDB.Parent := Panel96;
      TreeViewCatDB.Align := alClient;
      TreeViewCatDB.OnDblClick := TreeViewCatDBDblClick;
      TreeViewCatDB.Items.Clear;
    end;
  end;

  Kit.vImagensKit.alterarImagemNovaTab(Kit.dataSet, vDiretorioDestino);

  if Kit.Edit then
  begin
    PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;
    TabSheet3.TabVisible := true;

    Label158.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    DBComboBox22.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

    tsECommerce.TabVisible := (vDadosIni.vEcommerce.vHabilitarEcommerce)
    	and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.Caption := 'Dados do Kit';
    MontarImagem;
    DBEdit1.Enabled:=false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
	    DBEdit2.SetFocus;
  end;
end;

procedure TFrmCadKits.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO116', 'ABRIR LIXEIRA', '','KITS_PROD_KITS','', kit.buscas, true) then
  begin
    if not Kit.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO114]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      SpeedButton6.Visible := true;
      SpeedButtonECommerce.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce)
    		and (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY');
      SpeedButton7.Visible := true;

      ckLixeira.Enabled := false;
      ckLixeira.Checked := false;
      ckLixeira.Enabled := true;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [PRO113]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
      SpeedButton6.Visible := false;
      SpeedButtonECommerce.Visible := false;
      SpeedButton7.Visible := false;

      ckLixeira.Enabled := false;
      ckLixeira.Checked := true;
      ckLixeira.Enabled := true;
    end;
  end;
end;

procedure TFrmCadKits.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;
    if not Kit.Delete then
      Exit;

    vStatusLixeira := Kit.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      Kit.Cancel;
      Kit.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadKits.SpeedButtonECommerceClick(Sender: TObject);
begin
  try
    if Kit.dataSet.IsEmpty then
      exit;

    try
      if Assigned(TreeViewCat) then
        FreeAndNil(TreeViewCat);
    finally
      if not Assigned(TreeViewCat) then
      begin
        TreeViewCat := TTreeView.Create(Self);
        TreeViewCat.Parent := Panel93;
        TreeViewCat.Align := alClient;
        TreeViewCat.OnDblClick := TreeViewCatDblClick;
        TreeViewCat.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewCatDB) then
        FreeAndNil(TreeViewCatDB);
    finally
      if not Assigned(TreeViewCatDB) then
      begin
        TreeViewCatDB := TTreeView.Create(Self);
        TreeViewCatDB.Parent := Panel96;
        TreeViewCatDB.Align := alClient;
        TreeViewCatDB.OnDblClick := TreeViewCatDBDblClick;
        TreeViewCatDB.Items.Clear;
      end;
    end;

    Kit.vImagensKit.alterarImagemNovaTab(Kit.dataSet, vDiretorioDestino);

    pnDadosEC.Tag := 99;
    if not Kit.Edit then
      exit;

    Kit.vItKit.abreItKitsProd(Kit.dataSet);
    
    PageControlEC.ActivePage := TabSheetEC1;

    pnDadosEC.Align  := alNone;
    pnDadosEC.Height := 328;
    pnDadosEC.Width  := 872;

    MontarImagem;
    habilitarCamposECommerce(true);
    pnDadosECEnter(Sender);
    btnAlterarDadosECClick(Sender);
  finally
  	pnDadosEC.Align := alClient;
    pnDadosEC.Tag := 0;
    
  	Kit.Cancel;
  	Kit.CancelUpdates;
	  Kit.RollBackTransacao;
  end;
end;

procedure TFrmCadKits.SpeedButton3Click(Sender: TObject);
begin
  if not Kit._imprimirKit(true) then
    exit;
end;

procedure TFrmCadKits.SpeedButton48Click(Sender: TObject);
var
  vFileNameOrigem: string;
  vFileNameDestino: string;
  positionTemp: Integer;
  I: Integer;
  vtemp: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros(
      'PRO405',
      'ADICIONAR IMAGEM',
      '',
      'KITS_PROD',
      Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
      Kit.buscas,
      true) then
        exit;

    if not OpenPictureDialog1.Execute then
      exit;

    try
    	for I := 0 to OpenPictureDialog1.Files.Count - 1 do
      begin
        vFileNameOrigem := OpenPictureDialog1.Files[I];//OpenPictureDialog1.FileName;

        vFileNameDestino := IfThen(trim(vDiretorioDestino) <> '',
          trim(vDiretorioDestino) + trim(ExtractFileName(vFileNameOrigem)),
          trim(vFileNameOrigem));

        // Testar imagem do Kit
        if (vDadosIni.vEcommerce.vHabilitarEcommerce) then
          if (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.JPG')
            and (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.JPEG')
            {and (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.PNG')} then
          begin
          	vtemp := 'E-Commerce';
            Application.MessageBox(PChar('Imagem selecionada não esta no formato aceito pelo ' + vtemp + ': ' + #13 + #13 +
              'Formatos suportados: JPG e JPEG '+ #13 +
              'Imagem: ' + ExtractFileName(vFileNameOrigem)), 'Atenção', MB_ICONERROR + MB_DEFBUTTON1);
            exit;
          end;

        // Criar classes e adicionar imagens a lista
        vFileNameDestino := Kit.vImagensKit.adicionarImagem(
          Kit.dataSet,
          vFileNameOrigem,
          vFileNameDestino,
          vDiretorioDestino);

        if Kit.dataSet.State in [dsInsert, dsEdit] then
        begin
        	if trim(Kit.dataSet.FieldByName('alterou_imagem').AsString) <> 'S' then
		        Kit.dataSet.FieldByName('alterou_imagem').AsString := 'S';
        end;

        lbDescrGradeImg.Caption := trim(Kit.vImagensKit.dataSet.FieldByName('DESCR_GRADE').AsString);
        if Kit.vImagensKit.dataSet.RecordCount <= 0 then
        begin
          Image1.Picture.LoadFromFile('');
          Image1.Hint    := '';
        end
        else
        begin
          Kit.vImagensKit.dataSet.Last;

          if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString) then
          begin
            if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
              Image1.Picture.LoadFromFile('')
            else
              Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
          end
          else
          begin
            Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
              Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString);
          end;

          Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString;
        end;

        if Kit.dataSet.State <> dsEdit then
          lbS_qtdeImgProdEC.Caption := ''
        else if Kit.vImagensKit.dataSet.RecordCount <= 0 then
        	lbS_qtdeImgProdEC.Caption := '0/0'
        else
        	lbS_qtdeImgProdEC.Caption := IntToStr(Kit.vImagensKit.dataSet.RecNo) +
          	'/' + IntToStr(Kit.vImagensKit.dataSet.RecordCount);

        vDadosIni.GravaAuditoria(
        	'PRO405',
          'ADICIONAR IMAGEM',
          'SUCESSO - ' + ExtractFileName(vFileNameDestino),
          'KITS_PROD',
          Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
          Kit.buscas);
      end;
    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
        	'PRO405',
          'ADICIONAR IMAGEM',
          'FALHA - ' + ExtractFileName(vFileNameDestino),
      	  'KITS_PROD',
          Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
          Kit.buscas);
        Kit.registraErro('Falha ao adicionar imagem. Erro: ' + e.Message);
        Application.MessageBox(Pchar('Falha ao adicionar imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
     end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.SpeedButton49Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    lbDescrGradeImg.Caption := trim(Kit.vImagensKit.dataSet.FieldByName('DESCR_GRADE').AsString);
    if Kit.dataSet.State <> dsEdit then
      lbS_qtdeImgProdEC.Caption := ''
    else if Kit.vImagensKit.dataSet.RecordCount <= 0 then
    	lbS_qtdeImgProdEC.Caption := '0/0'
    else
      lbS_qtdeImgProdEC.Caption := IntToStr(Kit.vImagensKit.dataSet.RecNo) +
        '/' + IntToStr(Kit.vImagensKit.dataSet.RecordCount);
        
    if Kit.vImagensKit.dataSet.RecordCount > 0 then
      if (Kit.vImagensKit.dataSet.RecNo = Kit.vImagensKit.dataSet.RecordCount) then
      begin
        Application.MessageBox(PChar('Fim da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    try
      if not vDadosIni.PesqPros(
        'PRO407',
        'PROXIMA IMAGEM',
        '',
        'KITS_PROD',
        Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
        Kit.buscas,
        true) then
          exit;

      if Kit.vImagensKit.dataSet.RecordCount > 0 then
     		if (Kit.vImagensKit.dataSet.RecNo < Kit.vImagensKit.dataSet.RecordCount) then
        	Kit.vImagensKit.dataSet.Next;

      if Kit.vImagensKit.dataSet.RecordCount <= 0 then
      begin
        Image1.Picture.Assign(nil);
        Image1.Hint    := '';
      end
      else
      begin
      	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString) then
        begin
					if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
            Image1.Picture.LoadFromFile('')
          else
            Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
        end
        else
        begin
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString);
        end;

        Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString;
      end;

      lbDescrGradeImg.Caption := trim(Kit.vImagensKit.dataSet.FieldByName('DESCR_GRADE').AsString);
      if Kit.dataSet.State <> dsEdit then
        lbS_qtdeImgProdEC.Caption := ''
      else if Kit.vImagensKit.dataSet.RecordCount <= 0 then
      	lbS_qtdeImgProdEC.Caption := '0/0'
      else
        lbS_qtdeImgProdEC.Caption := IntToStr(Kit.vImagensKit.dataSet.RecNo) +
          '/' + IntToStr(Kit.vImagensKit.dataSet.RecordCount);

      vDadosIni.GravaAuditoria(
        'PRO407',
        'PROXIMA IMAGEM',
        'SUCESSO',
        'KITS_PROD',
        Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
        Kit.buscas);

    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
        	'PRO407',
          'PROXIMA IMAGEM',
          'FALHA',
        	'KITS_PROD',
        	Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
          Kit.buscas);
          
        Kit.registraErro('Falha ao adicionar imagem. Erro: ' + e.Message);
        Application.MessageBox(Pchar('Falha ao adicionar imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
     end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.SpeedButton50Click(Sender: TObject);
var
  vFileNameImage: string;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

    if Kit.vImagensKit.dataSet.RecordCount <= 0 then
    begin
      Application.MessageBox(PChar('Nenhuma imagem encontrada na lista'),
        'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;

  	if not vDadosIni.PesqPros(
      'PRO409',
      'EXCLUIR IMAGEM',
      '',
      'KITS_PROD',
      Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
      Kit.buscas,
      true) then
        exit;

    try
      vFileNameImage := Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString;

      Kit.vImagensKit.removerImagem(
        Kit.dataSet);

      if Kit.vImagensKit.dataSet.RecordCount <= 0 then
      begin
        Image1.Picture.LoadFromFile('');
        Image1.Hint    := '';
      end
      else
      begin
      	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString) then
        begin
					if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
            Image1.Picture.LoadFromFile('')
          else
            Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
        end
        else
        begin
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString);
        end;

        Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
          Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString;
      end;

      if Kit.dataSet.State in [dsInsert, dsEdit] then
      begin
      	if trim(Kit.dataSet.FieldByName('alterou_imagem').AsString) <> 'S' then
	        Kit.dataSet.FieldByName('alterou_imagem').AsString := 'S';
      end;

      lbDescrGradeImg.Caption := trim(Kit.vImagensKit.dataSet.FieldByName('DESCR_GRADE').AsString);
      if Kit.dataSet.State <> dsEdit then
        lbS_qtdeImgProdEC.Caption := ''
      else if Kit.vImagensKit.dataSet.RecordCount <= 0 then
      	lbS_qtdeImgProdEC.Caption := '0/0'
      else
      	lbS_qtdeImgProdEC.Caption := IntToStr(Kit.vImagensKit.dataSet.RecNo) +
          '/' + IntToStr(Kit.vImagensKit.dataSet.RecordCount);

      vDadosIni.GravaAuditoria(
        'PRO409',
        'EXCLUIR IMAGEM',
        'SUCESSO - ' + ExtractFileName(vFileNameImage),
      	'KITS_PROD',
        Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
        Kit.buscas);

    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
          'PRO409',
          'EXCLUIR IMAGEM',
          'FALHA - ' + ExtractFileName(vFileNameImage),
          'KITS_PROD',
          Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
          Kit.buscas);

        Kit.registraErro('Falha ao excluir imagem. Erro: ' + e.Message);
        Application.MessageBox(Pchar('Falha ao excluir imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.SpeedButton51Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    lbDescrGradeImg.Caption := trim(Kit.vImagensKit.dataSet.FieldByName('DESCR_GRADE').AsString);
  	if Kit.dataSet.State <> dsEdit then
      lbS_qtdeImgProdEC.Caption := ''
    else if Kit.vImagensKit.dataSet.RecordCount <= 0 then
    	lbS_qtdeImgProdEC.Caption := '0/0'
    else
      lbS_qtdeImgProdEC.Caption := IntToStr(Kit.vImagensKit.dataSet.RecNo) +
        '/' + IntToStr(Kit.vImagensKit.dataSet.RecordCount);

    if Kit.vImagensKit.dataSet.RecordCount > 0 then
      if (Kit.vImagensKit.dataSet.RecNo <= 1) then
      begin
        Application.MessageBox(PChar('Início da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    try
      if not vDadosIni.PesqPros(
      	'PRO408',
        'IMAGEM ANTERIOR',
        '',
        'KITS_PROD',
        Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
        Kit.buscas,
        true) then
          exit;

      if Kit.vImagensKit.dataSet.RecordCount > 0 then
     		if (Kit.vImagensKit.dataSet.RecNo > 1) then
        	Kit.vImagensKit.dataSet.Prior;

      if Kit.vImagensKit.dataSet.RecordCount <= 0 then
      begin
        Image1.Picture.LoadFromFile('');
        Image1.Hint    := '';
      end
      else
      begin
      	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString) then
        begin
          if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
            Image1.Picture.LoadFromFile('')
          else
            Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
        end
        else
        begin
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString);
        end;

        Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString;
      end;

      lbDescrGradeImg.Caption := trim(Kit.vImagensKit.dataSet.FieldByName('DESCR_GRADE').AsString);
      if Kit.dataSet.State <> dsEdit then
        lbS_qtdeImgProdEC.Caption := ''
      else if Kit.vImagensKit.dataSet.RecordCount <= 0 then
      	lbS_qtdeImgProdEC.Caption := '0/0'
      else
        lbS_qtdeImgProdEC.Caption := IntToStr(Kit.vImagensKit.dataSet.RecNo) +
          '/' + IntToStr(Kit.vImagensKit.dataSet.RecordCount);

      vDadosIni.GravaAuditoria(
        'PRO408',
        'IMAGEM ANTERIOR',
        'SUCESSO',
        'KITS_PROD',
        Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
        Kit.buscas);
        
    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
          'PRO408',
          'IMAGEM ANTERIOR',
          'FALHA',
          'KITS_PROD',
          Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
          Kit.buscas);

        Kit.registraErro('Falha ao adicionar imagem. Erro: ' + e.Message);
        Application.MessageBox(Pchar('Falha ao adicionar imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
     end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.SpeedButton52Click(Sender: TObject);
var
  wides: WideString;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros(
      'PRO406',
      'VISUALIZAR IMAGEM',
      '',
      'KITS_PROD',
      Kit.dataSet.FieldByName('CODIGO_KIT').AsString,
      Kit.buscas,
      true) then
        exit;

    if Kit.vImagensKit.dataSet.RecordCount > 0 then
      if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') + Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString) then
      begin
      	Application.MessageBox(PChar('Imagem não encontrada: ' + #13 + #13 +
        	IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
          Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString),
          'Atenção', 0 + 64);
        exit;
      end
      else
      begin
        //viewImage(PChar(Kit.vGradesImagens.Items[Kit.vGradesImagens.fIndex].img.ItemSelected.fileNameImagemToZoom));
        wides := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Kit.vImagensKit.dataSet.FieldByName('IMAGEM').AsString;
        hw_image_view(wides);
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not Kit.restaurarRegistro then
  	Exit;

  if Kit.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadKits.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not Kit.dataSet.FieldByName('CODIGO_KIT').IsNull then
    if vDadosIni.PesqPros('PRO119', 'ACESSAR', '','KITS_PROD_KITS',Kit.dataSet.FieldByName('CODIGO_KIT').AsString, kit.buscas, true) then
//    if vDadosIni.PesqPros('PRO119', Kit.dataSet.FieldByName('CODIGO_KIT').asString, Kit.buscas, true) then
    begin
      Label202.Visible := Kit.vItKit.dataSet.FieldByName('PREC_CUS_PROD').Visible;
      DBText29.Visible := Kit.vItKit.dataSet.FieldByName('PREC_CUS_PROD').Visible;
      Label21.Visible := Kit.vItKit.dataSet.FieldByName('PREC_CUSM_PROD').Visible;
      DBText3.Visible := Kit.vItKit.dataSet.FieldByName('PREC_CUSM_PROD').Visible;

      GroupBox7.Parent := TabSheet5;
		  DBGrid2.Parent := TabSheet5;

      GroupBox15.Parent := TabSheet6;

      btnIncluirItemKit.Visible := True;
		  btnAlterarItemKit.Visible := True;
		  btnDeltarItemKit.Visible := True;
		  btnImprimirItemKit.Visible := True;
      
      TabSheet4.Show;
//      TabSheet4.TabVisible := true;
      Label22.Caption := IntToStr(Kit.dataSet.FieldByName('CODIGO_KIT').asinteger) + ' - ' +
        trim(Kit.dataSet.FieldByName('DESCRICAO_KIT').asString);
      Kit.vItKit.abreItKitsProd(Kit.dataSet);
    end;
end;

procedure TFrmCadKits.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    GroupBox3.Parent := Panel52;
    BitBtn2.Visible := False;
	 BitBtn3.Visible := False;
    btVoltarDadosKit.Parent := GroupBox3;
    Panel1.Visible := true;
    Panel1.Parent := Panel128;
	 Panel2.Visible := False;

    Panel52.Visible := false;
    Panel52.Align := alNone;

    GroupBox79.Visible := false;
    GroupBox79.Align := alNone;

    Panel52.Visible := True;
    Panel52.Align := alTop;

//    GroupBox79.Visible := True;
//    GroupBox79.Align := alTop;

    Panel52.Height := GroupBox3.Height;

    _LerConfiguracoesRegistroBoolean(ckPermOpcaoMarcadas.Name, False);

    PageControl1.ActivePage := tsAlterDadosKit;

    lbCorLote.Visible := false;
    pnCorLote.Visible := false;

    TelaCadastro := 5;

    ckPermOpcaoMarcadas.Visible := true;
    
    ckLixeira.Visible    := True;
    if ckLixeira.Checked then
      FrmCadKits.Caption := 'Alteração Kits de Produtos em Lote (Lixeira)'
    else
      FrmCadKits.Caption := 'Alteração Kits de Produtos em Lote';
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.SpeedButton9Click(Sender: TObject);
begin
	if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit) then
  begin
    setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
    exit;
  end;

  if (Kit.dataSet.State in [dsInsert, dsEdit]) then
  begin
    Kit.dataset.Post;
    Kit.Apply;
  end;
  
	if not (Kit.vItKit.AddRemoverProduto(Kit, true, false)) then
  	exit;
  
  Kit.abreKitsProd(Kit.dataset);
  Kit.vItKit.abreItKitsProd(Kit.dataset);
  Kit.vKitEC.abreKitsEC(Kit.dataset);
  if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    Kit.dataSet.Edit;
  if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    Kit.vKitEC.dataSet.Edit;
  AtualizarCamposPesoDimensoes(Kit.vKitEC.dataSet.FieldByName('REGRA_PESO_DIM').AsString);
  carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
end;

procedure TFrmCadKits.SpeedButtonAlterarHtmlECClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
	HTMLDocument := WebBrowserEC.Document as IHTMLDocument2;
  carregarwebbrownser(WebBrowserEC, vDadosIni.abreFormEditorHtml(HTMLDocument.body.innerHTML, '', false));
  Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString := HTMLDocument.body.innerHTML;
end;

procedure TFrmCadKits.SpeedButtonAlterarKitClick(Sender: TObject);
begin
  inherited;
  SpeedButton1Click(Sender);

  if (Kit.dataSet.State in [dsInsert, dsEdit]) then
  begin
  	 if Kit.dataSet.FieldByName('ativo').AsInteger <> 1 then
     	Kit.dataSet.FieldByName('ativo').AsInteger := 1;
  end;
end;

procedure TFrmCadKits.SpeedButtonAlterarProduto2Click(Sender: TObject);
var
  I: Integer;
  vIndexFieldNames: string;
  vIndexName: string;
  vRecNo: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('PRO460', 'ALTERAR', '', 'KITS_PROD', '', Kit.buscas, true) then
	 Exit;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;

  pnVendaOnline.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

  cbSomenteKitTodo.ItemIndex := _LerConfiguracoesRegistroInteger(cbSomenteKitTodo.Name);
  cbVendaOnline.ItemIndex := _LerConfiguracoesRegistroInteger(cbVendaOnline.Name);

  if ckPermOpcaoMarcadas.Checked then
	ckSomenteKitTodo.Checked := _LerConfiguracoesRegistroBoolean(ckSomenteKitTodo.Name)
  else
  	ckSomenteKitTodo.Checked := false;
  ckSomenteKitTodoClick(Sender);

  if not pnVendaOnline.Visible then
   ckVendaOnline.Checked := False
  else if ckPermOpcaoMarcadas.Checked then
	ckVendaOnline.Checked := _LerConfiguracoesRegistroBoolean(ckVendaOnline.Name)
  else
  	ckVendaOnline.Checked := false;
  ckVendaOnlineClick(Sender);

  try
  	 vIndexFieldNames := Kit.dataSet.IndexFieldNames;
    vIndexName       := Kit.dataSet.IndexName;
    vRecNo           := Kit.dataSet.RecNo;

    for I := 0 to Kit.dataSet.Fields.Count - 1 do
    begin
    	if trim(Kit.dataSet.Fields[I].DisplayName) = trim(ComboBox2.text) then
      begin
      	vIndexFieldNames := Kit.dataSet.Fields[I].FieldName;
        break;
      end;
    end;

    Kit.dataSet.DisableControls;
    Kit.dataSet.Filtered := false;
    Kit.dataSet.Filter := 'sel = ''S'' ';
    Kit.dataSet.Filtered := true;

    if Kit.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum produto selecionado.', 'Atenção',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;
  finally
  	 Kit.dataSet.Filtered        := false;
    Kit.dataSet.IndexName       := vIndexName;
    Kit.dataSet.IndexFieldNames := vIndexFieldNames;
    if Kit.dataSet.RecordCount >= vRecNo then
	   Kit.dataSet.RecNo         := vRecNo;
    Kit.dataSet.EnableControls;
  end;

  PageControl1.ActivePage := tsAlterDadosLote;
  tsAlterDadosLote.Show;
end;

procedure TFrmCadKits.TabSheet4Show(Sender: TObject);
begin
  inherited;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet5.Show;
end;

function TFrmCadKits.testarDiretorioImagemProduto: boolean;
var
  vListaImagens: string;
begin
  Result := true;
  vListaImagens := vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', Kit.buscas);
  if trim(vListaImagens) <> '' then
  begin
    if not DirectoryExists(trim(vListaImagens)) then
    begin
      Application.MessageBox(PChar('Diretório de imagens não encontrado: ' + #13 + #13 + vListaImagens), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Result := false;
      exit;
    end;
  end;
end;

procedure TFrmCadKits.TreeViewCatDBDblClick(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
	vDadosIni.abreStatusProcessamento('Processando', 'Removendo categoria');
	try
    if TreeViewCatDB.Items.Count <= 0 then
      exit;

    if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit, true) then
    begin
      setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
      exit;
    end;

    if (Kit.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.dataset.Post;
      Kit.Apply;
    end;

    if (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.vKitEC.dataset.Post;
      Kit.vKitEC.Apply;
    end;

    if not Kit.vCategorias.deleteItemTreeView(Kit, TreeViewCatDB, TreeViewCatDB.Selected.Text) then
      exit;
  finally
    Kit.abreKitsProd(Kit.dataset);
    Kit.vKitEC.abreKitsEC(Kit.dataset);
    if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.dataSet.Edit;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    AtualizarCamposPesoDimensoes(Kit.vItKit.vRegraPesoDim);
    carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.TreeViewCatDblClick(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
  vDadosIni.abreStatusProcessamento('Processando', 'Adicionando categoria');
  try

    if TreeViewCat.Items.Count <= 0 then
      exit;

    if not Kit.vKitEC.checarCamposEcommerce(Kit, Kit.vItKit, true) then
    begin
      setFocusCampoErro(Kit.vKitEC.vNomeCampoErro, Kit.vKitEC.vMensagemErro);
      exit;
    end;

    if (Kit.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.dataset.Post;
      Kit.Apply;
    end;

    if (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    begin
      Kit.vKitEC.dataset.Post;
      Kit.vKitEC.Apply;
    end;

    if not Kit.vCategorias.addItemTreeView(Kit, TreeViewCat, TreeViewCatDB, TreeViewCat.Selected.Text) then
      exit;
  finally
  	Kit.abreKitsProd(Kit.dataset);
    Kit.vKitEC.abreKitsEC(Kit.dataset);
    if not (Kit.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.dataSet.Edit;
    if not (Kit.vKitEC.dataSet.State in [dsInsert, dsEdit]) then
    	Kit.vKitEC.dataSet.Edit;
    AtualizarCamposPesoDimensoes(Kit.vItKit.vRegraPesoDim);
    carregarwebbrownser(WebBrowserEC, Kit.vKitEC.dataSet.FieldByName('DESCR_KIT_COMPL').AsString);
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadKits.verificarAbaEcommerceComercioAberto;
begin
  if PageControlEC.ActivePage = TabSheetEC1 then
  begin
    sbVoltarEC.Visible := false;
    sbAvancarEC.Visible := false;

    sbAvancarEC.Visible := true;
    pnSincEcKitItens.Visible := false;
    LbPagEC.Caption := '1/4';

    btnIncluirItemKit.Visible := false;
	  btnAlterarItemKit.Visible := false;
  	btnDeltarItemKit.Visible := false;
	  btnImprimirItemKit.Visible := false;
  end
  else if PageControlEC.ActivePage = TabSheetEC2 then
  begin
    sbVoltarEC.Visible := false;
    sbAvancarEC.Visible := false;

    sbVoltarEC.Visible := true;
    sbAvancarEC.Visible := true;
    pnSincEcKitItens.Visible := false;
    LbPagEC.Caption := '2/4';

    btnIncluirItemKit.Visible := false;
	  btnAlterarItemKit.Visible := false;
  	btnDeltarItemKit.Visible := false;
	  btnImprimirItemKit.Visible := false;
  end
  else if PageControlEC.ActivePage = TabSheetEC3 then
  begin
    sbVoltarEC.Visible := false;
    sbAvancarEC.Visible := false;

    sbVoltarEC.Visible := true;
    sbAvancarEC.Visible := true;
    pnSincEcKitItens.ParentColor := false;
    pnSincEcKitItens.Visible := true;
    pnSincEcKitItens.Color := $00FF8000;
    LbPagEC.Caption := '3/4';

    btnIncluirItemKit.Visible := false;
	  btnAlterarItemKit.Visible := false;
  	btnDeltarItemKit.Visible := false;
	  btnImprimirItemKit.Visible := false;
  end
  else if PageControlEC.ActivePage = TabSheetEC4 then
  begin
    sbVoltarEC.Visible := false;
    sbAvancarEC.Visible := false;

    sbVoltarEC.Visible := true;
    pnSincEcKitItens.Visible := false;
    LbPagEC.Caption := '4/4';

    btnIncluirItemKit.Visible := true;
	  btnAlterarItemKit.Visible := true;
  	btnDeltarItemKit.Visible := true;
	  btnImprimirItemKit.Visible := true;
  end
end;

end.

