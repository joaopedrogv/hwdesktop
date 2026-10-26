unit UCadTipoServ;

interface

uses
  Windows, Messages, uCadPadraoModal, DBCtrls, ExtCtrls, Menus,
  Dialogs, ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  UClassesProdutos, QRCtrls, QuickRpt, AppEvnts, Graphics, Variants, uDadosIni,
  MSHTML, OleCtrls, SHDocVw, UCorrelFiscalNFSe, uEditHw;

type
  TFrmCadTipoServ = class(TfrmCadPadraoM)
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBComboBox5: TDBComboBox;
    Label13: TLabel;
    DBComboBox4: TDBComboBox;
    Label14: TLabel;
    Label15: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    Label16: TLabel;
    Label17: TLabel;
    DBComboBox2: TDBComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    tsRelTipoServ: TTabSheet;
    qrpTipoServ: TQuickRep;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    lbEmpresa: TQRLabel;
    QRLabel8: TQRLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    Label22: TLabel;
    Label24: TLabel;
    DBEdit8: TDBEdit;
    TabSheet4: TTabSheet;
    GroupBox68: TGroupBox;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    Label201: TLabel;
    Label202: TLabel;
    DBText30: TDBText;
    Label203: TLabel;
    Label216: TLabel;
    DBText32: TDBText;
    DBText33: TDBText;
    Label218: TLabel;
    GroupBox4: TGroupBox;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    TabSheet5: TTabSheet;
    GroupBox7: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label31: TLabel;
    Label32: TLabel;
    DBText4: TDBText;
    Label33: TLabel;
    Label34: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    Label35: TLabel;
    GroupBox8: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn12: TBitBtn;
    GroupBox9: TGroupBox;
    DBGrid4: TDBGrid;
    GroupBox10: TGroupBox;
    DBGrid5: TDBGrid;
    Label38: TLabel;
    DBEdit12: TDBEdit;
    Label40: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    SpeedButton59: TSpeedButton;
    tsDadosComercioAberto: TTabSheet;
    pnDadosComercioAberto: TPanel;
    pnButtonComercioAberto: TPanel;
    pnOKDadosComercioAberto: TBitBtn;
    pnCancDadosComercioAberto: TBitBtn;
    RadioGroupOpcoesComercioAberto: TRadioGroup;
    MarcarTodosTipoServico: TMenuItem;
    DesmarcaTodosTipoServico: TMenuItem;
    tsComercioAberto: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox80: TGroupBox;
    DBText62: TDBText;
    GroupBoxDadosCA: TGroupBox;
    pnDadosCA: TPanel;
    PageControlCA: TPageControl;
    TabSheetCA1: TTabSheet;
    pnOpcoesDadosCA: TPanel;
    btnOKAlterarDadosCA: TBitBtn;
    btnCancAlterarDadosCA: TBitBtn;
    pnButtonAlterDadosCA: TPanel;
    btnAlterarDadosCA: TBitBtn;
    ScrollBox5: TScrollBox;
    pnDescricaoHTMLCA: TPanel;
    Panel80: TPanel;
    Label427: TLabel;
    Panel81: TPanel;
    pnOpcoesHtml: TPanel;
    SpeedButtonAlterarHtmlCA: TSpeedButton;
    WebBrowserCA: TWebBrowser;
    pnDescricaoServCA: TPanel;
    Label462: TLabel;
    Label471: TLabel;
    Label41: TLabel;
    DBEditDescrCA: TDBEdit;
    DBComboBoxEnvCA: TDBComboBox;
    DBComboBoxPrecoCombinarCA: TDBComboBox;
    Panel79: TPanel;
    lbIdComercioAberto: TLabel;
    DBTextIdComercioAberto: TDBText;
    btDefinirEmp: TBitBtn;
    tsMultiempresa: TTabSheet;
    pnMultiempresa: TPanel;
    pnMultiempresaBottom: TPanel;
    btnMultiempresaOK: TBitBtn;
    btnMultiempresaCancelar: TBitBtn;
    DBGridMultiempresa: TDBGrid;
    DBLookupComboBox5: TDBLookupComboBox;
    btOpcoes: TSpeedButton;
    tsCadTipoServ: TTabSheet;
    pnCadTipoServ: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    EditDescricaoTipoTipoServ: TEdit;
    EditSiglaTipoTipoServ: TEdit;
    Panel5: TPanel;
    btnCadTipoServOK: TBitBtn;
    btnCadTipoServCancel: TBitBtn;
    SpeedButton9: TSpeedButton;
    Panel4: TPanel;
    pnDefinirTipoServicoPorEmpresaTop: TPanel;
    SpeedButtonMultiempresaSel: TSpeedButton;
    SpeedButtonMultiempresaDesm: TSpeedButton;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    tsPadNacional: TTabSheet;
    Label44: TLabel;
    DBEdit14: TDBEdit;
    Label45: TLabel;
    DBEdit15: TDBEdit;
    Label46: TLabel;
    DBEdit16: TDBEdit;
    TabSheet6: TTabSheet;
    Label23: TLabel;
    DBComboBox10: TDBComboBox;
    Label18: TLabel;
    DBEdit7: TDBEdit;
    Label26: TLabel;
    Label39: TLabel;
    DBEdit13: TDBEdit;
    Label21: TLabel;
    DBComboBox9: TDBComboBox;
    Label25: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label27: TLabel;
    Label215: TLabel;
    DBEdit9: TDBEdit;
    Label161: TLabel;
    DBComboBox14: TDBComboBox;
    Label29: TLabel;
    DBComboBox13: TDBComboBox;
    Label160: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    DBComboBox12: TDBComboBox;
    DBComboBox11: TDBComboBox;
    DBComboBox15: TDBComboBox;
    Label36: TLabel;
    DBEdit10: TDBEdit;
    Label37: TLabel;
    DBEdit11: TDBEdit;
    linkVerCorrelFiscal: TLabel;
    lbCIndOp: TLabel;
    edCIndOp: TDBEdit;
    lbInfoCIndOp: TLabel;
    btAlterarDadosFiscais: TSpeedButton;
    Label158: TLabel;
    DBComboBox22: TDBComboBox;
    tsAlterDadosServ: TTabSheet;
    Panel52: TPanel;
    btVoltarDadosServ: TBitBtn;
    GroupBox79: TGroupBox;
    DBText7: TDBText;
    btVoltarDadosServ2: TBitBtn;
    tsAlterDadosLote: TTabSheet;
    ScrollBoxAlterDadosLote: TScrollBox;
    GroupBox12: TGroupBox;
    Label473: TLabel;
    pnVendaOnline: TPanel;
    lbVendaOnline: TLabel;
    ckVendaOnline: TCheckBox;
    cbVendaOnline: TComboBox;
    Panel128: TPanel;
    pnCenterAlterDadosProd: TPanel;
    SpeedButtonAlterarServico: TSpeedButton;
    SpeedBSelTodos: TSpeedButton;
    SpeedBDesmarcarTodos: TSpeedButton;
    SpeedButtonAlterarProduto2: TSpeedButton;
    lbCorLote: TLabel;
    btExcluirRegistro: TSpeedButton;
    btLixeiraVazia: TSpeedButton;
    btRestaurarRegistro: TSpeedButton;
    btLixeiraCheia: TSpeedButton;
    pnCorLote: TPanel;
    ckPermOpcaoMarcadas: TCheckBox;
    Panel119: TPanel;
    btSalvarServLote: TBitBtn;
    btnCancServLote: TBitBtn;
    btSairServLote: TBitBtn;
    ckLixeira: TCheckBox;
    pnCFOP: TPanel;
    ckCFOP: TCheckBox;
    lbGrupoProd: TLabel;
    EdCodCFOP: TEditHw;
    DBLCfop: TDBLookupComboBox;
    pnAliqIss: TPanel;
    lbAliqIss: TLabel;
    ckAliqIss: TCheckBox;
    EdAliqIss: TEditHw;
    pnServicoIsento: TPanel;
    lbServicoIsento: TLabel;
    CheckBox22: TCheckBox;
    ckServicoIsento: TCheckBox;
    cbServicoIsento: TComboBox;
    pnNaoIncidencia: TPanel;
    lbNaoIncidencia: TLabel;
    CheckBox2: TCheckBox;
    ckNaoIncidencia: TCheckBox;
    cbNaoIncidencia: TComboBox;
    pnTmoSimultaneo: TPanel;
    lbTmoSimultaneo: TLabel;
    CheckBox4: TCheckBox;
    ckTmoSimultaneo: TCheckBox;
    cbTmoSimultaneo: TComboBox;
    pnTmo: TPanel;
    lbTmo: TLabel;
    EdTmo: TEditHw;
    ckTmo: TCheckBox;
    pnAltValorCupom: TPanel;
    lbAltValorCupom: TLabel;
    CheckBox5: TCheckBox;
    ckAltValorCupom: TCheckBox;
    cbAltValorCupom: TComboBox;
    pnAltDescricao: TPanel;
    lbAltDescricao: TLabel;
    CheckBox6: TCheckBox;
    ckAltDescricao: TCheckBox;
    cbAltDescricao: TComboBox;
    pnServicoGarantia: TPanel;
    lbServicoGarantia: TLabel;
    CheckBox7: TCheckBox;
    ckServicoGarantia: TCheckBox;
    cbServicoGarantia: TComboBox;
    pnOrigemServ: TPanel;
    lbOrigemServ: TLabel;
    CheckBox8: TCheckBox;
    ckOrigemServ: TCheckBox;
    DbLOrigemServ: TDBLookupComboBox;
    pnSeqRevisao: TPanel;
    lbSeqRevisao: TLabel;
    EdSeqRevisao: TEditHw;
    ckSeqRevisao: TCheckBox;
    pnServPropTerc: TPanel;
    lbServPropTerc: TLabel;
    CheckBox9: TCheckBox;
    ckServPropTerc: TCheckBox;
    cbServPropTerc: TComboBox;
    pnEspecieVap: TPanel;
    lbEspecieVap: TLabel;
    CheckBox10: TCheckBox;
    ckEspecieVap: TCheckBox;
    DbLEspecieVap: TDBLookupComboBox;
    pnUnidade: TPanel;
    lbObsEtiq: TLabel;
    CheckBox25: TCheckBox;
    ckUnidade: TCheckBox;
    EdUnidade: TEdit;
    Label47: TLabel;
    pnCnaeServ: TPanel;
    lbCnaeServ: TLabel;
    ckCnaeServ: TCheckBox;
    edCnaeServ: TMaskEdit;
    pnLc116: TPanel;
    lbLc116: TLabel;
    ckLc116: TCheckBox;
    pnTribNac: TPanel;
    lbTribNac: TLabel;
    ckTribNac: TCheckBox;
    edTribNac: TMaskEdit;
    pnTribMun: TPanel;
    lbTribMun: TLabel;
    ckTribMun: TCheckBox;
    edTribMun: TMaskEdit;
    pnNbs: TPanel;
    lbNbs: TLabel;
    ckNbs: TCheckBox;
    edNBS: TMaskEdit;
    pnIndOp: TPanel;
    lbIndOp: TLabel;
    ckIndOp: TCheckBox;
    edIndOp: TMaskEdit;
    pnIssRetido: TPanel;
    lbIssRetido: TLabel;
    ckIssRetido: TCheckBox;
    lbInfIssRetido: TLabel;
    edIssRetido: TMaskEdit;
    pnCstPisCofins: TPanel;
    lbCstPisCofins: TLabel;
    ckCstPisCofins: TCheckBox;
    cbCstPisCofins: TComboBox;
    pnCstPisCofinsEnt: TPanel;
    lbCstPisCofinsEnt: TLabel;
    ckCstPisCofinsEnt: TCheckBox;
    cbCstPisCofinsEnt: TComboBox;
    SpeedButton68: TSpeedButton;
    DBLLc116: TDBLookupComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton68Click(Sender: TObject);
    procedure ckCstPisCofinsEntClick(Sender: TObject);
    procedure ckCstPisCofinsClick(Sender: TObject);
    procedure ckIssRetidoClick(Sender: TObject);
    procedure ckIndOpClick(Sender: TObject);
    procedure ckNbsClick(Sender: TObject);
    procedure ckTribMunClick(Sender: TObject);
    procedure ckTribNacClick(Sender: TObject);
    procedure ckLc116Click(Sender: TObject);
    procedure ckCnaeServClick(Sender: TObject);
    procedure ckLixeiraClick(Sender: TObject);
    procedure DBLCfopExit(Sender: TObject);
    procedure EdCodCFOPExit(Sender: TObject);
    procedure SpeedButtonAlterarProduto2Click(Sender: TObject);
    procedure ckPermOpcaoMarcadasClick(Sender: TObject);
    procedure ckUnidadeClick(Sender: TObject);
    procedure ckEspecieVapClick(Sender: TObject);
    procedure ckServPropTercClick(Sender: TObject);
    procedure ckSeqRevisaoClick(Sender: TObject);
    procedure ckOrigemServClick(Sender: TObject);
    procedure ckServicoGarantiaClick(Sender: TObject);
    procedure ckAltDescricaoClick(Sender: TObject);
    procedure ckAltValorCupomClick(Sender: TObject);
    procedure ckTmoClick(Sender: TObject);
    procedure ckTmoSimultaneoClick(Sender: TObject);
    procedure ckNaoIncidenciaClick(Sender: TObject);
    procedure ckServicoIsentoClick(Sender: TObject);
    procedure ckAliqIssClick(Sender: TObject);
    procedure ckCFOPClick(Sender: TObject);
    procedure SpeedBDesmarcarTodosClick(Sender: TObject);
    procedure SpeedBSelTodosClick(Sender: TObject);
    procedure SpeedButtonAlterarServicoClick(Sender: TObject);
    procedure btVoltarDadosServClick(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure btSalvarServLoteClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnCancServLoteClick(Sender: TObject);
    procedure ckVendaOnlineClick(Sender: TObject);
    procedure btAlterarDadosFiscaisClick(Sender: TObject);
    procedure linkVerCorrelFiscalClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure pnCadTipoServEnter(Sender: TObject);
    procedure btnCadTipoServOKClick(Sender: TObject);
    procedure btnCadTipoServCancelClick(Sender: TObject);
    procedure btOpcoesClick(Sender: TObject);
    procedure DBLookupComboBox5Exit(Sender: TObject);
    procedure pnMultiempresaEnter(Sender: TObject);
    procedure DBGridMultiempresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridMultiempresaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridMultiempresaCellClick(Column: TColumn);
    procedure SpeedButtonMultiempresaDesmClick(Sender: TObject);
    procedure SpeedButtonMultiempresaSelClick(Sender: TObject);
    procedure btnMultiempresaCancelarClick(Sender: TObject);
    procedure btnMultiempresaOKClick(Sender: TObject);
    procedure btDefinirEmpClick(Sender: TObject);
    procedure pnDadosCAEnter(Sender: TObject);
    procedure btnAlterarDadosCAClick(Sender: TObject);
    procedure btnCancAlterarDadosCAClick(Sender: TObject);
    procedure btnOKAlterarDadosCAClick(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure SpeedButtonAlterarHtmlCAClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DesmarcaTodosTipoServicoClick(Sender: TObject);
    procedure MarcarTodosTipoServicoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure pnCancDadosComercioAbertoClick(Sender: TObject);
    procedure pnOKDadosComercioAbertoClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBComboBox15Enter(Sender: TObject);
    procedure DBComboBox13Exit(Sender: TObject);
    procedure DBComboBox11Exit(Sender: TObject);
    procedure DBComboBox14Exit(Sender: TObject);
    procedure DBComboBox12Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox9KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrpTipoServPreview(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure habilitarCamposComercioAberto;
    procedure DesativarAtivarCamposHtml(pTipo: string; pHablitar: boolean = true);
    procedure carregarwebbrownser(pWebBrowser: TWebBrowser; pHtml: string);
    procedure DocumentoEmBranco(WebBrowser: TWebBrowser);
  private
    { Private declarations }
    vCriou: Smallint;
    function GetComboNatReceita(pCST: string): AnsiString;
    procedure SelecionadoCampoFiscalNFSe(Campo: TFormCorrelFiscalCampo; const Value: string);
  public
    { Public declarations }
    procedure tipo_tipo_serv_add(Sender: TObject);
    procedure tipo_tipo_serv_edit(Sender: TObject);
    procedure tipo_tipo_serv_del(Sender: TObject);
  end;

var
  FrmCadTipoServ: TFrmCadTipoServ;
  TipoServ: TTipoServ;
  pop_menu_tipo_tipo_serv: TPopupMenu;

implementation

uses
  uDtmAtivo, DB, SysUtils, UDtmProdutos, UClasseSugestaoCompras, uDataSet_OOP, UIUtilsUnit, ContainerUnit,
  AlteracaoFiscalNFSeModelUnit, UAlterarFiscalNFSe, TipoComunsUnit, StringNullableUnit, StringServiceUnit,
  ArrayServiceUnit;

{$R *.dfm}

procedure TFrmCadTipoServ.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS221', 'EXCLUIR', '', 'TIPO_SERVICO_MECANICO',
    TipoServ.dataSet.FieldByName('COD_SERVICO').AsString, TipoServ.buscas, true) then
    exit;

  if TipoServ.vTipoServMecanico.Delete then
  begin
    TipoServ.vUsuario._abreTipoServicoMecanico(TipoServ.dataSet.FieldByName('COD_SERVICO').AsString);
    if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
    	DBGrid2.SetFocus;
  end;
end;

procedure TFrmCadTipoServ.BitBtn11Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TFrmCadTipoServ.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS085]';
  if vDadosIni.PesqPros('BAS084', 'PESQUISAR', '', 'TIPO_SERVICO', '', TipoServ.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if (ckLixeira.Checked) and (ckLixeira.Visible) then
      begin
        if not TipoServ.ConsultaCamposLixeira('TIPO_SERVICO', ComboBox1.Text,
          ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
           if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus;
      end
      else
      begin
        if not TipoServ.ConsultaCampos('TIPO_SERVICO', ComboBox1.Text,
          ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
           if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus;
      end;
    end
    else
    begin
      if (ckLixeira.Checked) and (ckLixeira.Visible) then
      begin
        if not TipoServ.ConsultaCamposLixeira('TIPO_SERVICO', MaskEdit3.text, ComboBox1.Text,
          combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
             ComboBox1.SetFocus;
      end
      else
      begin
        if not TipoServ.ConsultaCampos('TIPO_SERVICO', MaskEdit3.text, ComboBox1.Text,
          combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
             ComboBox1.SetFocus;
      end
    end;

    if ckLixeira.Checked then
    begin
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
      SpeedButton6.Visible := false;
      SpeedButton9.Visible := false;
      SpeedButton8.Visible := false;
      SpeedButton7.Visible := false;
      SpeedButton11.Visible := false;
      SpeedButton12.Visible := false;
      btAlterarDadosFiscais.Visible := false;
      SpeedButton24.Visible := false;
    end
    else
    begin
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      SpeedButton6.Visible := true;
      SpeedButton9.Visible := true;
      SpeedButton8.Visible := true;
      SpeedButton7.Visible := true;
      SpeedButton11.Visible := true;
      SpeedButton12.Visible := true;
      btAlterarDadosFiscais.Visible := true;
      SpeedButton24.Visible := true;
    end;

    TipoServ.ultimasql := TipoServ.dataset.CommandText;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadTipoServ.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if (TipoServ.dataSet.ChangeCount > 0) then
    if Application.MessageBox('Foram feitas alterações no banco de dados.' + chr(13) +
      'Deseja cancelar as alterações e sair?', 'Confirmação', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON1) = mrYES then
    begin
      TipoServ.Cancel;
      TipoServ.CancelUpdates;
      TipoServ.RollBackTransacao;
    end
    else
    begin
      PageControl3.ActivePage := TabSheet3;
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        DBEdit2.SetFocus;
      exit;
    end;
  inherited;
end;

procedure TFrmCadTipoServ.BitBtn3Click(Sender: TObject);
begin
	try
    if not TipoServ.Insert then
      exit;

    TipoServ.vTipoServEmpresa._abreTodosEmpresas(0);

    if TipoServ.vTipoServEmpresa.dataSet.RecordCount > 1 then
      if not TipoServ.abreFormEmpresas then
      begin
        TipoServ.Cancel;
        TipoServ.RollBackTransacao;
        exit;
      end;

    inherited;
    TabSheet3.TabVisible := true;
    tsComercioAberto.TabVisible := false;
    TabSheet3.Caption := 'Cadastrando um novo Tipo de Serviço';
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.Show;

    Label158.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    DBComboBox22.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

  //      	DBLookupComboBox4.Enabled := not TipoServ.codEmpresaPreenchido;
    TipoServ.LocTipoTipoServ.abreTipoTipoServ;
    TipoServ.LocEspecieSeg.abreEspecieSeg;
    TipoServ.LocCFOP.abreCFOP;
    TipoServ.codtiposervLC.abretabela;

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
      DBLookupComboBox4.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      TipoServ.Cancel;
      TipoServ.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadTipoServ.BitBtn4Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
      BitBtn4.SetFocus;
    if not TipoServ.Post then
    begin
    	PageControl3.ActivePage := TabSheet3;
    	setFocusCampoErro(TipoServ.vNomeCampoErro, TipoServ.vMensagemErro);
    end
    else
    begin
      if CheckCadSeq.Checked then
      begin
        if TipoServ.Insert then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
        MudaCor;
      end
      else
      begin
        if ((TelaCadastro = 4) or (TelaCadastro = 5)) then
        begin
          PageControl1.ActivePage := tsAlterDadosServ;
          tsAlterDadosServ.Show;
          exit;
        end;
        inherited;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadTipoServ.BitBtn5Click(Sender: TObject);
begin
  TipoServ.Cancel;
  TipoServ.RollBackTransacao;
  if ((TelaCadastro = 4) or (TelaCadastro = 5)) then
  begin
    PageControl1.ActivePage := tsAlterDadosServ;
    tsAlterDadosServ.Show;
    exit;
  end;
  inherited;
end;

procedure TFrmCadTipoServ.BitBtn7Click(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('BAS243', 'INLCUIR', '', 'TIPO_SERVICO_BOX',
    TipoServ.dataSet.FieldByName('COD_SERVICO').AsString, TipoServ.buscas, true) then
    exit;

  if not TipoServ.incluirTipoServicoBox then
    exit;
end;

procedure TFrmCadTipoServ.BitBtn8Click(Sender: TObject);
begin
  inherited;
 if not TipoServ.vTipoServBox.dataset.Locate('COD_BOX',VarArrayOf([DBGrid5.Columns[DBGrid5.SelectedIndex].Field.AsString]), [loPartialKey]) then
 exit;

 if not vDadosIni.PesqPros('BAS244', 'EXCLUIR', '', 'TIPO_SERVICO_BOX',
    TipoServ.dataSet.FieldByName('COD_SERVICO').AsString, TipoServ.buscas, true) then
    exit;

  if TipoServ.vTipoServBox.Delete then
  begin
    TipoServ.vBox._abreTipoServicoBox(TipoServ.dataSet.FieldByName('COD_SERVICO').AsString);
    if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
    	DBGrid5.SetFocus;
  end;
end;

procedure TFrmCadTipoServ.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS220', 'INLCUIR', '', 'TIPO_SERVICO_MECANICO',
    TipoServ.dataSet.FieldByName('COD_SERVICO').AsString, TipoServ.buscas, true) then
    exit;

  if not TipoServ.incluirTipoServicoMecanico then
    exit;
end;

procedure TFrmCadTipoServ.btAlterarDadosFiscaisClick(Sender: TObject);
var
  codigo: TArrayInteger;
  form: TFormAlterarFiscalNFSe;
  sCaption: string;
begin
  inherited;

  if not TipoServ.Auditor.Processo('BAS551').Validar().Permitido() then
    exit;

  try
    sCaption := Format('%d - %s', [ TipoServ.fint('cod_servico'), TipoServ.fstr('desc_servico') ]);
    codigo := TArrayInteger( TipoServ.GetArrayInts('COD_SERVICO', True, True ));

    case Length(codigo) of
      0: Exit;
      1:;
      else 
        sCaption := IntToStr(Length(codigo)) + ' registros selecionados';
    end;

    form := TFormAlterarFiscalNFSe.Create(nil);
    try
      form.Setup(
        sCaption,
        StringNullable.CreateOrNull(TipoServ.fstr('cnae_serv')),
        StringNullable.CreateOrNull(TipoServ.fstr('nfs_servico')),
        StringNullable.CreateOrNull(TipoServ.fstr('ctribnac')),
        StringNullable.CreateOrNull(TipoServ.fstr('ctribmun')),
        StringNullable.CreateOrNull(TipoServ.fstr('cnbs')),
        StringNullable.CreateOrNull(TipoServ.fstr('cindop'))
      );

      if form.ShowModal <> mrOk  then
        Exit;

      with form.GetResult() do
      begin
        Container.GetInstance().ErpFeaturesFactory.CreateAtualizarFiscalNFSeUseCase().Executar(
          AlteracaoFiscalNFSeModel.Create(
            codigo,
            CCNAE,
            CLC116,
            CTribNac,
            CTribMun,
            CNBS,
            CIndOp
          )
        );
        TipoServ.Refresh();
        TipoServ.Auditor.Sucesso()
          .GravarMensagem( 'Codigos: ' + StringService.Join( ',',  ArrayService.IntArrayToStringArray(codigo) ));
      end;      
    finally
      form.free();
    end;            
  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TFrmCadTipoServ.btDefinirEmpClick(Sender: TObject);
begin
  inherited;
	if not TipoServ.abreFormEmpresas then
  	exit;
end;

procedure TFrmCadTipoServ.btnAlterarDadosCAClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS430', 'ALTERAR', '', 'TIPO_SERVICO',
     TipoServ.dataSet.FieldByName('COD_SERVICO').AsString, TipoServ.buscas, true) then
    Exit;

  if trim(TipoServ.dataSet.FieldByName('DESC_SERV_RES').AsString) = '' then
    TipoServ.dataSet.FieldByName('DESC_SERV_RES').AsString :=
      vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(TipoServ.dataSet.FieldByName('DESC_SERVICO').AsString));

  //  altera o modo design do webbrowse para ON
  pnOpcoesHtml.Visible := true;
  pnDadosCA.Enabled := true;
  pnOpcoesDadosCA.Visible := pnDadosCA.Enabled;
  (WebBrowserCA.Document as IHTMLDocument2).designMode := 'On';

  pnOpcoesDadosCA.Visible := true;
  DesativarAtivarCamposHtml('C', true);
  vDadosIni.abreForm('Dados Comércio Aberto', pnDadosCA, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  PageControlCA.ActivePage := TabSheetCA1;
  TabSheetCA1.Show;
  carregarwebbrownser(WebBrowserCA, TipoServ.dataSet.FieldByName('DESC_SERV_COMPL').AsString);
  pnOpcoesDadosCA.Visible := false;
  DesativarAtivarCamposHtml('C', false);
end;

procedure TFrmCadTipoServ.btnCadTipoServCancelClick(Sender: TObject);
begin
	TForm(pnCadTipoServ.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadTipoServ.btnCadTipoServOKClick(Sender: TObject);
begin
	if trim(EditDescricaoTipoTipoServ.Text) = '' then
  begin
  	Application.MessageBox(Pchar('Descrição não informada.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
  	if (Self.Enabled) and (Self.Visible) and (EditDescricaoTipoTipoServ.CanFocus) then
    	EditDescricaoTipoTipoServ.SetFocus;
    exit;
  end;

  if trim(EditSiglaTipoTipoServ.Text) = '' then
  begin
    Application.MessageBox(Pchar('Sigla não informada.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
  	if (Self.Enabled) and (Self.Visible) and (EditSiglaTipoTipoServ.CanFocus) then
    	EditSiglaTipoTipoServ.SetFocus;
    exit;
  end;
  TForm(pnCadTipoServ.Parent).ModalResult := IDOK;
end;

procedure TFrmCadTipoServ.btnCancAlterarDadosCAClick(Sender: TObject);
begin
  inherited;
	TForm(pnDadosCA.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadTipoServ.btnCancServLoteClick(Sender: TObject);
begin
  inherited;
  TipoServ.Cancel;
  TipoServ.CancelUpdates;
  TipoServ.RollBackTransacao;

  PageControl1.ActivePage := tsAlterDadosServ;
  tsAlterDadosServ.Show;
end;

procedure TFrmCadTipoServ.btnMultiempresaCancelarClick(Sender: TObject);
begin
  TForm(pnMultiempresa.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadTipoServ.btnMultiempresaOKClick(Sender: TObject);
var
	vEmpresa: boolean;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (btnMultiempresaOK.CanFocus) then
  	btnMultiempresaOK.SetFocus;

  if vDadosIni.vSugCompra.vMultiempresa then
  begin
  	vEmpresa := false;
    try
      TipoServ.vTipoServEmpresa.dataSet.First;
      while not TipoServ.vTipoServEmpresa.dataSet.Eof do
      begin
        if TipoServ.vTipoServEmpresa.dataSet.FieldByName('SEL').AsString = 'S' then
        begin
          vEmpresa := true;
          break;
        end;

        TipoServ.vTipoServEmpresa.dataSet.Next;
      end;

    finally
      TipoServ.vTipoServEmpresa.dataSet.First;
    end;

    if not vEmpresa then
    begin
      Application.MessageBox(Pchar('Favor selecionar as empresas antes de continuar'), 'Atenção', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;
  end;

	TForm(pnMultiempresa.Parent).ModalResult := IDOK;
end;

procedure TFrmCadTipoServ.btnOKAlterarDadosCAClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
  if not vDadosIni.PesqPros('BAS431', 'SALVAR', '', 'TIPO_SERVICO',
     TipoServ.dataSet.FieldByName('COD_SERVICO').AsString, TipoServ.buscas, true) then
    Exit;

  if (Self.Enabled) and (Self.Visible) and (btnOKAlterarDadosCA.CanFocus) then
	  btnOKAlterarDadosCA.SetFocus;
  HTMLDocument := WebBrowserCA.Document as IHTMLDocument2;
  TipoServ.dataSet.FieldByName('DESC_SERV_COMPL').AsString := HTMLDocument.body.innerHTML;

  if trim(TipoServ.dataSet.FieldByName('DESC_SERV_RES').AsString) = '' then
  begin
    Application.MessageBox('Descrição do tipo de serviço não informada!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEditDescrCA.CanFocus) then
    	DBEditDescrCA.SetFocus;
    exit;
  end;

  TForm(pnDadosCA.Parent).ModalResult := IDOK;
end;

procedure TFrmCadTipoServ.btOpcoesClick(Sender: TObject);
var
	MenuItem: TMenuItem;
begin
  inherited;

  if not Assigned(pop_menu_tipo_tipo_serv) then
  begin
    pop_menu_tipo_tipo_serv := TPopupMenu.Create(Self);

    MenuItem := TMenuItem.Create(pop_menu_tipo_tipo_serv);
    MenuItem.Caption := 'Incluir origem do tipo de serviço - [PRO430]';
    MenuItem.OnClick := tipo_tipo_serv_add;
    pop_menu_tipo_tipo_serv.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_tipo_tipo_serv);
    MenuItem.Caption := 'Alterar origem do tipo de serviço - [PRO431]';
    MenuItem.OnClick := tipo_tipo_serv_edit;
    pop_menu_tipo_tipo_serv.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_tipo_tipo_serv);
    MenuItem.Caption := 'Excluir origem do tipo de serviço - [PRO432]';
    MenuItem.OnClick := tipo_tipo_serv_del;
    pop_menu_tipo_tipo_serv.Items.Add(MenuItem);
  end;

  pop_menu_tipo_tipo_serv.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadTipoServ.btSalvarServLoteClick(Sender: TObject);
begin
  inherited;
  try
  	 Screen.Cursor := crHourGlass;
    FrmCadTipoServ.Enabled := false;
    DBGrid1.Visible := false;

    TipoServ.vAtualizarServ.vHabCfop := ckCFOP.Checked;
    TipoServ.vAtualizarServ.vHabAliqIss := ckAliqIss.Checked;
    TipoServ.vAtualizarServ.vHabServIsento := ckServicoIsento.Checked;
    TipoServ.vAtualizarServ.vHabNaoIncidencia := ckNaoIncidencia.Checked;
    TipoServ.vAtualizarServ.vHabTmoSimult := ckTmoSimultaneo.Checked;
    TipoServ.vAtualizarServ.vHabTmo := ckTmo.Checked;
    TipoServ.vAtualizarServ.vHabAltValorCupom := ckAltValorCupom.Checked;
    TipoServ.vAtualizarServ.vHabAltDescr := ckAltDescricao.Checked;
    TipoServ.vAtualizarServ.vHabServGarantia := ckServicoGarantia.Checked;
    TipoServ.vAtualizarServ.vHabOrigemServ := ckOrigemServ.Checked;
    TipoServ.vAtualizarServ.vHabSeqRevisao := ckSeqRevisao.Checked;
    TipoServ.vAtualizarServ.vHabServPropTerc := ckServPropTerc.Checked;
    TipoServ.vAtualizarServ.vHabEspecieVap := ckEspecieVap.Checked;
    TipoServ.vAtualizarServ.vHabUnidade := ckUnidade.Checked;
    TipoServ.vAtualizarServ.vHabVendaOnline := ckVendaOnline.Checked;
    TipoServ.vAtualizarServ.vHabCnaeServ := ckCnaeServ.Checked;
    TipoServ.vAtualizarServ.vHabLc116 := ckLc116.Checked;
    TipoServ.vAtualizarServ.vHabTribNac := ckTribNac.Checked;
    TipoServ.vAtualizarServ.vHabTribMun := ckTribMun.Checked;
    TipoServ.vAtualizarServ.vHabNbs := ckNbs.Checked;
    TipoServ.vAtualizarServ.vHabIndOp := ckIndOp.Checked;
    TipoServ.vAtualizarServ.vHabIssRetido := ckIssRetido.Checked;
    TipoServ.vAtualizarServ.vHabCstPisCofins := ckCstPisCofins.Checked;
    TipoServ.vAtualizarServ.vHabCstPisCofinsEnt := ckCstPisCofinsEnt.Checked;

    TipoServ.vAtualizarServ.vCodCfopLote := Trunc(EdCodCFOP.AsValue);
    TipoServ.vAtualizarServ.vAliqIss := EdAliqIss.AsValue;
    TipoServ.vAtualizarServ.vServIsento := Trim(cbServicoIsento.Text);
    TipoServ.vAtualizarServ.vNaoIncidencia := Trim(cbNaoIncidencia.Text);
    TipoServ.vAtualizarServ.vTmoSimult := Trim(cbTmoSimultaneo.Text);
    TipoServ.vAtualizarServ.vTmo := EdTmo.AsValue;
    TipoServ.vAtualizarServ.vAltValorCupom := Trim(cbAltValorCupom.Text);
    TipoServ.vAtualizarServ.vAltDescricao := Trim(cbAltDescricao.Text);
    TipoServ.vAtualizarServ.vServGarantia := Trim(cbServicoGarantia.Text);
    TipoServ.vAtualizarServ.vOrigemServ := Trim(vDadosIni.IfThen(DbLOrigemServ.KeyValue = Null, '', DbLOrigemServ.KeyValue));
    TipoServ.vAtualizarServ.vSeqRevisao := Trunc(EdSeqRevisao.AsValue);
    TipoServ.vAtualizarServ.vServPropTerc := Trim(cbServPropTerc.Text);
    TipoServ.vAtualizarServ.vUnidade := Trim(EdUnidade.Text);
    TipoServ.vAtualizarServ.vVendaOnline := Trim(cbVendaOnline.Text);
    TipoServ.vAtualizarServ.vCnaeServ := Trim(edCnaeServ.Text);
    TipoServ.vAtualizarServ.vLc116 := Trim(vDadosIni.IfThen(DBLLc116.KeyValue = Null, '', DBLLc116.KeyValue));
    TipoServ.vAtualizarServ.vTribNac := Trim(edTribNac.Text);
    TipoServ.vAtualizarServ.vTribMun := Trim(edTribMun.Text);
    TipoServ.vAtualizarServ.vNbs := Trim(edNBS.Text);
    TipoServ.vAtualizarServ.vIndOp := Trim(edIndOp.Text);
    TipoServ.vAtualizarServ.vIssRetido := Trim(edIssRetido.Text);
    TipoServ.vAtualizarServ.vCstPisCofins := Trim(cbCstPisCofins.Text);
    TipoServ.vAtualizarServ.vCstPisCofinsEnt := Trim(cbCstPisCofinsEnt.Text);

    if not TipoServ.AtualizarTiposServicosEmLote then
	 begin
      setFocusCampoErro(TipoServ.vNomeCampoErro, TipoServ.vMensagemErro);
      exit;
    end;
  finally
    _GravaConfiguracoesDouble(EdCodCFOP.Name, EdCodCFOP.AsValue);
    _GravaConfiguracoesDouble(EdAliqIss.Name, EdAliqIss.AsValue);
    _GravaConfiguracoesInteger(cbServicoIsento.Name, cbServicoIsento.ItemIndex);
    _GravaConfiguracoesInteger(cbNaoIncidencia.Name, cbNaoIncidencia.ItemIndex);
    _GravaConfiguracoesInteger(cbTmoSimultaneo.Name, cbTmoSimultaneo.ItemIndex);
    _GravaConfiguracoesDouble(EdTmo.Name, EdTmo.AsValue);
    _GravaConfiguracoesInteger(cbAltValorCupom.Name, cbAltValorCupom.ItemIndex);
    _GravaConfiguracoesInteger(cbAltDescricao.Name, cbAltDescricao.ItemIndex);
    _GravaConfiguracoesInteger(cbServicoGarantia.Name, cbServicoGarantia.ItemIndex);
    _GravaConfiguracoesString(DbLOrigemServ.Name, Trim(vDadosIni.IfThen(DbLOrigemServ.KeyValue = Null, '', DbLOrigemServ.KeyValue)));
    _GravaConfiguracoesDouble(EdSeqRevisao.Name, EdSeqRevisao.AsValue);
    _GravaConfiguracoesInteger(cbServPropTerc.Name, cbServPropTerc.ItemIndex);
    _GravaConfiguracoesString(EdUnidade.Name, EdUnidade.Text);
    _GravaConfiguracoesInteger(cbVendaOnline.Name, cbVendaOnline.ItemIndex);
    _GravaConfiguracoesString(edCnaeServ.Name, edCnaeServ.Text);
    _GravaConfiguracoesString(DBLLc116.Name, Trim(vDadosIni.IfThen(DBLLc116.KeyValue = Null, '', DBLLc116.KeyValue)));
    _GravaConfiguracoesString(edTribNac.Name, edTribNac.Text);
    _GravaConfiguracoesString(edTribMun.Name, edTribMun.Text);
    _GravaConfiguracoesString(edNBS.Name, edNBS.Text);
    _GravaConfiguracoesString(edIndOp.Name, edIndOp.Text);
    _GravaConfiguracoesString(edIssRetido.Name, edIssRetido.Text);
    _GravaConfiguracoesInteger(cbCstPisCofins.Name, cbCstPisCofins.ItemIndex);
    _GravaConfiguracoesInteger(cbCstPisCofinsEnt.Name, cbCstPisCofinsEnt.ItemIndex);

    _GravaConfiguracoesBoolean(ckCFOP.Name, ckCFOP.Checked);
    _GravaConfiguracoesBoolean(ckAliqIss.Name, ckAliqIss.Checked);
    _GravaConfiguracoesBoolean(ckServicoIsento.Name, ckServicoIsento.Checked);
    _GravaConfiguracoesBoolean(ckNaoIncidencia.Name, ckNaoIncidencia.Checked);
    _GravaConfiguracoesBoolean(ckTmoSimultaneo.Name, ckTmoSimultaneo.Checked);
    _GravaConfiguracoesBoolean(ckTmo.Name, ckTmo.Checked);
    _GravaConfiguracoesBoolean(ckAltValorCupom.Name, ckAltValorCupom.Checked);
    _GravaConfiguracoesBoolean(ckAltDescricao.Name, ckAltDescricao.Checked);
    _GravaConfiguracoesBoolean(ckServicoGarantia.Name, ckServicoGarantia.Checked);
    _GravaConfiguracoesBoolean(ckOrigemServ.Name, ckOrigemServ.Checked);
    _GravaConfiguracoesBoolean(ckSeqRevisao.Name, ckSeqRevisao.Checked);
    _GravaConfiguracoesBoolean(ckServPropTerc.Name, ckServPropTerc.Checked);
    _GravaConfiguracoesBoolean(ckUnidade.Name, ckUnidade.Checked);
    _GravaConfiguracoesBoolean(ckVendaOnline.Name, ckVendaOnline.Checked);
    _GravaConfiguracoesBoolean(ckCnaeServ.Name, ckCnaeServ.Checked);
    _GravaConfiguracoesBoolean(ckLc116.Name, ckLc116.Checked);
    _GravaConfiguracoesBoolean(ckTribNac.Name, ckTribNac.Checked);
    _GravaConfiguracoesBoolean(ckTribMun.Name, ckTribMun.Checked);
    _GravaConfiguracoesBoolean(ckNbs.Name, ckNbs.Checked);
    _GravaConfiguracoesBoolean(ckIndOp.Name, ckIndOp.Checked);
    _GravaConfiguracoesBoolean(ckIssRetido.Name, ckIssRetido.Checked);
    _GravaConfiguracoesBoolean(ckCstPisCofins.Name, ckCstPisCofins.Checked);
    _GravaConfiguracoesBoolean(ckCstPisCofinsEnt.Name, ckCstPisCofinsEnt.Checked);

    FrmCadTipoServ.Enabled := true;
    DBGrid1.Visible := true;
    Screen.Cursor := crDefault;
  end;

  PageControl1.ActivePage := tsAlterDadosServ;
  tsAlterDadosServ.Show;
end;

procedure TFrmCadTipoServ.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    TipoServ._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoServ.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    TipoServ._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoServ.btVoltarDadosServClick(Sender: TObject);
begin
  try
    inherited;
    ckLixeira.Visible := True;
    ckLixeira.Checked := False;

    if ckLixeira.Checked then
      FrmCadTipoServ.Caption := 'Tipo de Serviços (Lixeira)'
    else
      FrmCadTipoServ.Caption := 'Tipo de Serviços';

    Panel2.Visible := true;

    GroupBox3.Parent := TabSheet2;

    btVoltarDadosServ.Parent := Panel52;
    BitBtn2.Visible := True;
	 BitBtn3.Visible := True;
    Panel1.Parent := TabSheet2;
    PageControl1.ActivePage := TabSheet2;
    TelaCadastro := 0;
    Self.fechar  := False;
  finally

  end;
end;

procedure TFrmCadTipoServ.carregarwebbrownser(pWebBrowser: TWebBrowser;
  pHtml: string);
var
  vhtml: string;
  ADoccument: Variant;
begin
   DBComboBoxEnvCA.ItemIndex := vDadosIni.IfThen(
   	 TipoServ.dataSet.FieldByName('ENV_COMERCIO_ABERTO').AsString = 'S', 0, 1);
   DBComboBoxPrecoCombinarCA.ItemIndex := vDadosIni.IfThen(
   	 TipoServ.dataSet.FieldByName('PRECO_A_COMBINAR_CA').AsString = 'S', 0, 1);

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

procedure TFrmCadTipoServ.ckAliqIssClick(Sender: TObject);
begin
  inherited;
  EdAliqIss.Enabled := ckAliqIss.Checked;
  if ckAliqIss.Checked then
  begin
  	 pnAliqIss.ParentBackground := False;
	 pnAliqIss.Color := clYellow;
  end
  else
  begin
  	 pnAliqIss.ParentBackground := True;
  	 pnAliqIss.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdAliqIss.CanFocus) then
  	EdAliqIss.SetFocus;
end;

procedure TFrmCadTipoServ.ckAltDescricaoClick(Sender: TObject);
begin
  inherited;
  cbAltDescricao.Enabled := ckAltDescricao.Checked;
  if ckAltDescricao.Checked then
  begin
  	 pnAltDescricao.ParentBackground := False;
	 pnAltDescricao.Color := clYellow;
  end
  else
  begin
  	 pnAltDescricao.ParentBackground := True;
  	 pnAltDescricao.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbAltDescricao.CanFocus) then
  	cbAltDescricao.SetFocus;
end;

procedure TFrmCadTipoServ.ckAltValorCupomClick(Sender: TObject);
begin
  inherited;
  cbAltValorCupom.Enabled := ckAltValorCupom.Checked;
  if ckAltValorCupom.Checked then
  begin
  	 pnAltValorCupom.ParentBackground := False;
	 pnAltValorCupom.Color := clYellow;
  end
  else
  begin
  	 pnAltValorCupom.ParentBackground := True;
  	 pnAltValorCupom.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbAltValorCupom.CanFocus) then
  	cbAltValorCupom.SetFocus;
end;

procedure TFrmCadTipoServ.ckCFOPClick(Sender: TObject);
begin
  inherited;
  EdCodCFOP.Enabled := ckCFOP.Checked;
  DBLCfop.Enabled := ckCFOP.Checked;
  if ckCFOP.Checked then
  begin
  	 pnCFOP.ParentBackground := False;
	 pnCFOP.Color := clYellow;
  end
  else
  begin
  	 pnCFOP.ParentBackground := True;
  	 pnCFOP.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodCFOP.CanFocus) then
  	EdCodCFOP.SetFocus;
end;

procedure TFrmCadTipoServ.ckCnaeServClick(Sender: TObject);
begin
  inherited;
  edCnaeServ.Enabled := ckCnaeServ.Checked;
  if ckCnaeServ.Checked then
  begin
  	 pnCnaeServ.ParentBackground := False;
	 pnCnaeServ.Color := clYellow;
  end
  else
  begin
  	 pnCnaeServ.ParentBackground := True;
  	 pnCnaeServ.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (edCnaeServ.CanFocus) then
  	edCnaeServ.SetFocus;
end;

procedure TFrmCadTipoServ.ckCstPisCofinsClick(Sender: TObject);
begin
  inherited;
  cbCstPisCofins.Enabled := ckCstPisCofins.Checked;
  if ckCstPisCofins.Checked then
  begin
  	 pnCstPisCofins.ParentBackground := False;
	 pnCstPisCofins.Color := clYellow;
  end
  else
  begin
  	 pnCstPisCofins.ParentBackground := True;
  	 pnCstPisCofins.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbCstPisCofins.CanFocus) then
  	cbCstPisCofins.SetFocus;
end;

procedure TFrmCadTipoServ.ckCstPisCofinsEntClick(Sender: TObject);
begin
  inherited;
  cbCstPisCofinsEnt.Enabled := ckCstPisCofinsEnt.Checked;
  if ckCstPisCofinsEnt.Checked then
  begin
  	 pnCstPisCofinsEnt.ParentBackground := False;
	 pnCstPisCofinsEnt.Color := clYellow;
  end
  else
  begin
  	 pnCstPisCofinsEnt.ParentBackground := True;
  	 pnCstPisCofinsEnt.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbCstPisCofinsEnt.CanFocus) then
  	cbCstPisCofinsEnt.SetFocus;
end;

procedure TFrmCadTipoServ.ckTribNacClick(Sender: TObject);
begin
  inherited;
  edTribNac.Enabled := ckTribNac.Checked;
  if ckTribNac.Checked then
  begin
  	 pnTribNac.ParentBackground := False;
	 pnTribNac.Color := clYellow;
  end
  else
  begin
  	 pnTribNac.ParentBackground := True;
  	 pnTribNac.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (edTribNac.CanFocus) then
  	edTribNac.SetFocus;
end;

procedure TFrmCadTipoServ.ckEspecieVapClick(Sender: TObject);
begin
  inherited;
  DbLEspecieVap.Enabled := ckEspecieVap.Checked;
  if ckEspecieVap.Checked then
  begin
  	 pnEspecieVap.ParentBackground := False;
	 pnEspecieVap.Color := clYellow;
  end
  else
  begin
  	 pnEspecieVap.ParentBackground := True;
  	 pnEspecieVap.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (DbLEspecieVap.CanFocus) then
  	DbLEspecieVap.SetFocus;
end;

procedure TFrmCadTipoServ.ckIndOpClick(Sender: TObject);
begin
  inherited;
  edIndOp.Enabled := ckIndOp.Checked;
  if ckIndOp.Checked then
  begin
  	 pnIndOp.ParentBackground := False;
	 pnIndOp.Color := clYellow;
  end
  else
  begin
  	 pnIndOp.ParentBackground := True;
  	 pnIndOp.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (edIndOp.CanFocus) then
  	edIndOp.SetFocus;
end;

procedure TFrmCadTipoServ.ckIssRetidoClick(Sender: TObject);
begin
  inherited;
  edIssRetido.Enabled := ckIssRetido.Checked;
  if ckIssRetido.Checked then
  begin
  	 pnIssRetido.ParentBackground := False;
	 pnIssRetido.Color := clYellow;
  end
  else
  begin
  	 pnIssRetido.ParentBackground := True;
  	 pnIssRetido.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (edIssRetido.CanFocus) then
  	edIssRetido.SetFocus;
end;

procedure TFrmCadTipoServ.ckLc116Click(Sender: TObject);
begin
  inherited;
  DBLLc116.Enabled := ckLc116.Checked;
  if ckLc116.Checked then
  begin
  	 pnLc116.ParentBackground := False;
	 pnLc116.Color := clYellow;
  end
  else
  begin
  	 pnLc116.ParentBackground := True;
  	 pnLc116.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLLc116.CanFocus) then
  	DBLLc116.SetFocus;
end;

procedure TFrmCadTipoServ.ckLixeiraClick(Sender: TObject);
begin
  inherited;
  if not ckLixeira.Visible then
    exit;

  if not ckLixeira.Enabled then
  begin
  	 if ckLixeira.Checked then
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS017]';
      btExcluirRegistro.Hint := 'Excluir registro permanentemente - [BAS017]';
    end
    else
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [BAS085]';
      btExcluirRegistro.Hint := 'Enviar para Lixeira - [BAS085]';
    end;
  	exit;
  end;

  if ckLixeira.Checked then
  	 SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS017]'
  else
 	 SpeedButton2.Hint := 'Enviar para Lixeira - [BAS085]';

  if (PageControl1.ActivePage = tsAlterDadosServ) then
  begin
    if ckLixeira.Checked then
      FrmCadTipoServ.Caption := 'Alteração Tipos de Serviços em Lote (Lixeira)'
    else
      FrmCadTipoServ.Caption := 'Alteração Tipos de Serviços em Lote';
  end
  else
  begin
    if ckLixeira.Checked then
    	FrmCadTipoServ.Caption := 'Tipo de Serviços (Lixeira)'
    else
      FrmCadTipoServ.Caption := 'Tipo de Serviços';
  end;
  BitBtn1Click(Sender);
end;

procedure TFrmCadTipoServ.ckNaoIncidenciaClick(Sender: TObject);
begin
  inherited;
  cbNaoIncidencia.Enabled := ckNaoIncidencia.Checked;
  if ckNaoIncidencia.Checked then
  begin
  	 pnNaoIncidencia.ParentBackground := False;
	 pnNaoIncidencia.Color := clYellow;
  end
  else
  begin
  	 pnNaoIncidencia.ParentBackground := True;
  	 pnNaoIncidencia.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbNaoIncidencia.CanFocus) then
  	cbNaoIncidencia.SetFocus;
end;

procedure TFrmCadTipoServ.ckNbsClick(Sender: TObject);
begin
  inherited;
  edNBS.Enabled := ckNbs.Checked;
  if ckNbs.Checked then
  begin
  	 pnNbs.ParentBackground := False;
	 pnNbs.Color := clYellow;
  end
  else
  begin
  	 pnNbs.ParentBackground := True;
  	 pnNbs.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (edNBS.CanFocus) then
  	edNBS.SetFocus;
end;

procedure TFrmCadTipoServ.ckOrigemServClick(Sender: TObject);
begin
  inherited;
  DbLOrigemServ.Enabled := ckOrigemServ.Checked;
  if ckOrigemServ.Checked then
  begin
  	 pnOrigemServ.ParentBackground := False;
	 pnOrigemServ.Color := clYellow;
  end
  else
  begin
  	 pnOrigemServ.ParentBackground := True;
  	 pnOrigemServ.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (DbLOrigemServ.CanFocus) then
  	DbLOrigemServ.SetFocus;
end;

procedure TFrmCadTipoServ.ckPermOpcaoMarcadasClick(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesBoolean(ckPermOpcaoMarcadas.Name, ckPermOpcaoMarcadas.Checked);
end;

procedure TFrmCadTipoServ.ckSeqRevisaoClick(Sender: TObject);
begin
  inherited;
  EdSeqRevisao.Enabled := ckSeqRevisao.Checked;
  if ckSeqRevisao.Checked then
  begin
  	 pnSeqRevisao.ParentBackground := False;
	 pnSeqRevisao.Color := clYellow;
  end
  else
  begin
  	 pnSeqRevisao.ParentBackground := True;
  	 pnSeqRevisao.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdSeqRevisao.CanFocus) then
  	EdSeqRevisao.SetFocus;
end;

procedure TFrmCadTipoServ.ckServicoGarantiaClick(Sender: TObject);
begin
  inherited;
  cbServicoGarantia.Enabled := ckServicoGarantia.Checked;
  if ckServicoGarantia.Checked then
  begin
  	 pnServicoGarantia.ParentBackground := False;
	 pnServicoGarantia.Color := clYellow;
  end
  else
  begin
  	 pnServicoGarantia.ParentBackground := True;
  	 pnServicoGarantia.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbServicoGarantia.CanFocus) then
  	cbServicoGarantia.SetFocus;
end;

procedure TFrmCadTipoServ.ckServicoIsentoClick(Sender: TObject);
begin
  inherited;
  cbServicoIsento.Enabled := ckServicoIsento.Checked;
  if ckServicoIsento.Checked then
  begin
  	 pnServicoIsento.ParentBackground := False;
	 pnServicoIsento.Color := clYellow;
  end
  else
  begin
  	 pnServicoIsento.ParentBackground := True;
  	 pnServicoIsento.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbServicoIsento.CanFocus) then
  	cbServicoIsento.SetFocus;
end;

procedure TFrmCadTipoServ.ckServPropTercClick(Sender: TObject);
begin
  inherited;
  cbServPropTerc.Enabled := ckServPropTerc.Checked;
  if ckServPropTerc.Checked then
  begin
  	 pnServPropTerc.ParentBackground := False;
	 pnServPropTerc.Color := clYellow;
  end
  else
  begin
  	 pnServPropTerc.ParentBackground := True;
  	 pnServPropTerc.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbServPropTerc.CanFocus) then
  	cbServPropTerc.SetFocus;
end;

procedure TFrmCadTipoServ.ckTmoClick(Sender: TObject);
begin
  inherited;
  EdTmo.Enabled := ckTmo.Checked;
  if ckTmo.Checked then
  begin
  	 pnTmo.ParentBackground := False;
	 pnTmo.Color := clYellow;
  end
  else
  begin
  	 pnTmo.ParentBackground := True;
  	 pnTmo.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdTmo.CanFocus) then
  	EdTmo.SetFocus;
end;

procedure TFrmCadTipoServ.ckTmoSimultaneoClick(Sender: TObject);
begin
  inherited;
  cbTmoSimultaneo.Enabled := ckTmoSimultaneo.Checked;
  if ckTmoSimultaneo.Checked then
  begin
  	 pnTmoSimultaneo.ParentBackground := False;
	 pnTmoSimultaneo.Color := clYellow;
  end
  else
  begin
  	 pnTmoSimultaneo.ParentBackground := True;
  	 pnTmoSimultaneo.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbTmoSimultaneo.CanFocus) then
  	cbTmoSimultaneo.SetFocus;
end;

procedure TFrmCadTipoServ.ckTribMunClick(Sender: TObject);
begin
  inherited;
  edTribMun.Enabled := ckTribMun.Checked;
  if ckTribMun.Checked then
  begin
  	 pnTribMun.ParentBackground := False;
	 pnTribMun.Color := clYellow;
  end
  else
  begin
  	 pnTribMun.ParentBackground := True;
  	 pnTribMun.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (edTribMun.CanFocus) then
  	edTribMun.SetFocus;
end;

procedure TFrmCadTipoServ.ckUnidadeClick(Sender: TObject);
begin
  inherited;
  EdUnidade.Enabled := ckUnidade.Checked;
  if ckUnidade.Checked then
  begin
  	 pnUnidade.ParentBackground := False;
	 pnUnidade.Color := clYellow;
  end
  else
  begin
  	 pnUnidade.ParentBackground := True;
  	 pnUnidade.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdUnidade.CanFocus) then
  	EdUnidade.SetFocus;
end;

procedure TFrmCadTipoServ.ckVendaOnlineClick(Sender: TObject);
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

procedure TFrmCadTipoServ.DBComboBox11Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox11.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    //    DBComboBox11.Text := DBComboBox11.Items[DBComboBox11.ItemIndex];
    DBComboBox13.DataSource.DataSet.FieldByName(DBComboBox13.DataField).AsString :=
      DBComboBox11.DataSource.DataSet.FieldByName(DBComboBox11.DataField).AsString;
  end;
end;

procedure TFrmCadTipoServ.DBComboBox12Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox12.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    //    DBComboBox12.Text := DBComboBox12.Items[DBComboBox12.ItemIndex];
    DBComboBox14.DataSource.DataSet.FieldByName(DBComboBox14.DataField).AsString :=
      DBComboBox12.DataSource.DataSet.FieldByName(DBComboBox12.DataField).AsString;
  end;
  //  DBComboBox5.Items.Text := GetComboNatReceita(TipoServ.dataSet.FieldByName('cst_pis').AsString);
end;

procedure TFrmCadTipoServ.DBComboBox13Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox13.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    //    DBComboBox13.Text := DBComboBox13.Items[DBComboBox13.ItemIndex];
    DBComboBox11.DataSource.DataSet.FieldByName(DBComboBox11.DataField).AsString :=
      DBComboBox13.DataSource.DataSet.FieldByName(DBComboBox13.DataField).AsString;
  end;
end;

procedure TFrmCadTipoServ.DBComboBox14Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox14.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    //    DBComboBox14.Text := DBComboBox14.Items[DBComboBox14.ItemIndex];
    DBComboBox12.DataSource.DataSet.FieldByName(DBComboBox12.DataField).AsString :=
      DBComboBox14.DataSource.DataSet.FieldByName(DBComboBox14.DataField).AsString;
  end;
  //  DBComboBox5.Items.Text := GetComboNatReceita(TipoServ.dataSet.FieldByName('cst_cofins').AsString);
end;

procedure TFrmCadTipoServ.DBComboBox15Enter(Sender: TObject);
begin
  inherited;
  DBComboBox5.Items.Text := GetComboNatReceita(TipoServ.dataSet.FieldByName('cst_pis').AsString);
end;

procedure TFrmCadTipoServ.DBComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  {  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
      if not ((copy(DBComboBox3.Text, 0, 1) = 'R') or (copy(DBComboBox3.Text, 0, 1) = 'M')
        or (copy(DBComboBox3.Text, 0, 1) = 'L') or (copy(DBComboBox3.Text, 0, 1) = 'G')
        or (copy(DBComboBox3.Text, 0, 1) = 'S') or (DBComboBox3.Text = '')) then
      begin
        Application.MessageBox('Selecione ''R - REVISÃO'' ou ''M - MECÂNICA'' ou ''L - LAVAGEM'' ou ''G - SERVICOS GERAIS'' ou ''S - SEGMENTAÇÃO''.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
          DBComboBox3.SetFocus;
      end;}
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> 'R') and (UpperCase(key) <> 'M') and (UpperCase(key) <> 'L')
    and (UpperCase(key) <> 'G') and (UpperCase(key) <> 'S') then
    key := #0;
end;

procedure TFrmCadTipoServ.DBComboBox6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> 'P') and (UpperCase(key) <> 'S') then
    key := #0;
end;

procedure TFrmCadTipoServ.DBComboBox9KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> 'T') and (UpperCase(key) <> 'A') then
    key := #0;
end;

procedure TFrmCadTipoServ.DBComboBoxKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> 'S') and (UpperCase(key) <> 'N') then
    key := #0;
end;

procedure TFrmCadTipoServ.DBEdit13Exit(Sender: TObject);
begin
	if Trim(DBEdit13.Text) = '' then
    TipoServ.atribuiIBGE;
end;

procedure TFrmCadTipoServ.DBEdit2Enter(Sender: TObject);
begin
  inherited;
  TipoServ.dataSet.FieldByName('DESC_SERVICO').AsString :=
    trim(TipoServ.dataSet.FieldByName('DESC_SERVICO').AsString);
  DBEdit2.SelectAll;
end;

procedure TFrmCadTipoServ.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if (trim(TipoServ.dataSet.FieldByName('DESC_SERVICO').AsString) = '') and (ActiveControl <>
    BitBtn5) and (ActiveControl <> BitBtn6) then
  begin
    Application.MessageBox('A descrição do tipo de serviço não pode ser vazia!' + chr(13) +
      'Campo requerido.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end;
end;

procedure TFrmCadTipoServ.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  if TipoServ.dataSet.state in [dsInsert, dsEdit] then
  begin
    TipoServ.dataSet.FieldByName('COD_SERV_LEICOMPLEMENTAR_166').AsString :=
      StringReplace(TipoServ.dataSet.FieldByName('COD_SERV_LEICOMPLEMENTAR_166').AsString,
      '.', '', [rfReplaceAll]);
  end;
end;

procedure TFrmCadTipoServ.DBGrid1CellClick(Column: TColumn);
begin
	if Column.FieldName = 'SEL' then
    TipoServ._marcaDesmarcaLinha;
end;

procedure TFrmCadTipoServ.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFrmCadTipoServ.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    if not TipoServ.dataSet.IsEmpty then
      TipoServ._marcaDesmarcaLinha;
end;

procedure TFrmCadTipoServ.DBGridMultiempresaCellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	TipoServ.vTipoServEmpresa._marcaDesmarcaLinha;
end;

procedure TFrmCadTipoServ.DBGridMultiempresaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
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
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;  
end;

procedure TFrmCadTipoServ.DBGridMultiempresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_TAB then
  	Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_SPACE then
    TipoServ.vTipoServEmpresa._marcaDesmarcaLinha
	else if Key = VK_RETURN then
  	btnMultiempresaOKClick(Sender);
end;

procedure TFrmCadTipoServ.DBLCfopExit(Sender: TObject);
begin
  inherited;
  if DBLCfop.KeyValue = null then
  	 EdCodCFOP.AsValue := 0
  else
	 EdCodCFOP.AsValue := DBLCfop.KeyValue;
end;

procedure TFrmCadTipoServ.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  TipoServ.dataSet.FieldByName('COD_SERV_LEICOMPLEMENTAR_166').AsString :=
    StringReplace(TipoServ.dataSet.FieldByName('NFS_SERVICO').AsString, '.', '', [rfReplaceAll]);
end;

procedure TFrmCadTipoServ.DBLookupComboBox5Exit(Sender: TObject);
begin
  inherited;
	if (copy(DBLookupComboBox5.KeyValue, 1, 1) = 'V')  then
  begin
    DBEdit12.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
	    DBEdit12.SetFocus;
  end
  else
  begin
    DBEdit12.Enabled := False;
    TipoServ.dataSet.FieldByName('SEQ_REVISAO').AsInteger := 0;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox6.CanFocus) then
	    DBComboBox6.SetFocus;
  end;
end;

procedure TFrmCadTipoServ.DesativarAtivarCamposHtml(pTipo: string;
  pHablitar: boolean);
begin
	if pTipo = 'C' then
  begin
    pnDadosCA.Enabled := pHablitar;
    pnOpcoesDadosCA.Enabled := pHablitar;

    btnOKAlterarDadosCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    btnCancAlterarDadosCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;

    SpeedButtonAlterarHtmlCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    DBEditDescrCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    DBComboBoxEnvCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    DBComboBoxPrecoCombinarCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
//    PageControlCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
  	TabSheetCA1.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
	end;
end;

procedure TFrmCadTipoServ.DesmarcaTodosTipoServicoClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    TipoServ._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoServ.DocumentoEmBranco(WebBrowser: TWebBrowser);
begin
	if not Assigned(WebBrowser.Document) then
     WebBrowser.Navigate('about:blank');
end;

procedure TFrmCadTipoServ.EdCodCFOPExit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = btSalvarServLote)
  	or (ActiveControl = btnCancServLote)
    or (ActiveControl = btSairServLote)) then
    Exit;

  DBLCfop.KeyValue := EdCodCFOP.AsInteger;

  if EdCodCFOP.AsInteger <= 0 then
  	 exit;

  if not TipoServ.buscasCfop(EdCodCFOP.AsInteger) then
  begin
    Application.MessageBox('CFOP não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdCodCFOP.CanFocus) then
    	EdCodCFOP.SetFocus;
    exit;
  end;
end;

procedure TFrmCadTipoServ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (PageControl1.ActivePage = tsAlterDadosServ) then
  begin
    GroupBox3.Parent := TabSheet2;
    btVoltarDadosServ.Parent := Panel52;
    BitBtn2.Visible := True;
    BitBtn3.Visible := True;
    Panel1.Parent := TabSheet2;
    Panel2.Visible := True;
    PageControl1.ActivePage := TabSheet2;
  end;

  TabSheet2.show;
  inherited;
  TipoServ.Cancel;
  TipoServ.RollBackTransacao;
  TipoServ.Destroy;
  Action := caFree;
  FrmCadTipoServ := nil;
end;

procedure TFrmCadTipoServ.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  vAlterDadosServ, vAlterDadosLote: boolean;
begin
  vAlterDadosServ := PageControl1.ActivePage = tsAlterDadosServ;
  vAlterDadosLote := PageControl1.ActivePage = tsAlterDadosLote;
  inherited;

  if vAlterDadosServ then
    btVoltarDadosServClick(Sender)
  else if vAlterDadosLote then
  begin
    btnCancServLoteClick(Sender);
    btVoltarDadosServClick(Sender);
  end;
end;

procedure TFrmCadTipoServ.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  TipoServ := TTipoServ.create;
  TipoServ.abreEmpresas;
  TipoServ.TipoTipoServ.Abrir;
  TipoServ.vTipoServEmpresa._abreTodosEmpresas(0);

  SpeedButton9.Visible := TipoServ.vTipoServEmpresa.dataSet.RecordCount > 1;
  btDefinirEmp.Visible := TipoServ.vTipoServEmpresa.dataSet.RecordCount > 1;

  //  TipoServ.abreTipoServ;
  TelaCadastro := vDadosIni.vTipoForm;
  if TelaCadastro = 2 then
    TelaCadastro := 0;             
  tsRelTipoServ.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheetCA1.TabVisible := false;
  tsDadosComercioAberto.TabVisible := false;
  tsMultiempresa.TabVisible := false;
  tsCadTipoServ.TabVisible := false;
  tsAlterDadosServ.TabVisible := false;
  tsAlterDadosLote.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  DBComboBox12.Clear;
  DBComboBox12.Items.Add('01 - Operação Tributável com Alíquota Básica');
  DBComboBox12.Items.Add('02 - Operação Tributável com Alíquota Diferenciada');
  DBComboBox12.Items.Add('03 - Operação Tributável com Alíquota por Unidade de Medida de Produto');
  DBComboBox12.Items.Add('04 - Operação Tributável Monofásica - Revenda a Alíquota Zero');
  DBComboBox12.Items.Add('05 - Operação Tributável por Substituição Tributária');
  DBComboBox12.Items.Add('06 - Operação Tributável a Alíquota Zero');
  DBComboBox12.Items.Add('07 - Operação Isenta da Contribuição');
  DBComboBox12.Items.Add('08 - Operação sem Incidência da Contribuição');
  DBComboBox12.Items.Add('09 - Operação com Suspensão da Contribuição');
  DBComboBox12.Items.Add('49 - Outras Operações de Saída');
  DBComboBox12.Items.Add('99 - Outras Operações');

  CbCstPisCofins.Clear;
  for I := 0 to DBComboBox12.Items.Count - 1 do
  	CbCstPisCofins.Items.Add(DBComboBox12.Items[I]);

  DBComboBox11.Clear;
  DBComboBox11.Items.Add('50 - Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno');
  DBComboBox11.Items.Add('51 - Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Não Tributada no Mercado Interno');
  DBComboBox11.Items.Add('52 - Operação com Direito a Crédito - Vinculada Exclusivamente a Receita de Exportação');
  DBComboBox11.Items.Add('53 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno');
  DBComboBox11.Items.Add('54 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas no Mercado Interno e de Exportação');
  DBComboBox11.Items.Add('55 - Operação com Direito a Crédito - Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação');
  DBComboBox11.Items.Add('56 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação');
  DBComboBox11.Items.Add('60 - Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno');
  DBComboBox11.Items.Add('61 - Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno');
  DBComboBox11.Items.Add('62 - Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação');
  DBComboBox11.Items.Add('63 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno');
  DBComboBox11.Items.Add('64 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação');
  DBComboBox11.Items.Add('65 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação');
  DBComboBox11.Items.Add('66 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação');
  DBComboBox11.Items.Add('67 - Crédito Presumido - Outras Operações');
  DBComboBox11.Items.Add('70 - Operação de Aquisição sem Direito a Crédito');
  DBComboBox11.Items.Add('71 - Operação de Aquisição com Isenção');
  DBComboBox11.Items.Add('72 - Operação de Aquisição com Suspensão');
  DBComboBox11.Items.Add('73 - Operação de Aquisição a Alíquota Zero');
  DBComboBox11.Items.Add('74 - Operação de Aquisição sem Incidência da Contribuição');
  DBComboBox11.Items.Add('75 - Operação de Aquisição por Substituição Tributária');
  DBComboBox11.Items.Add('98 - Outras Operações de Entrada');
  DBComboBox11.Items.Add('99 - Outras Operações');

  CbCstPisCofinsEnt.Clear;
  for I := 0 to DBComboBox11.Items.Count - 1 do
    CbCstPisCofinsEnt.Items.Add(DBComboBox11.Items[I]);

  if (vDadosIni.vModalOuChild <> 'M') then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadTipoServ.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (TipoServ.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
  else if Key = VK_F6 then
  begin
    if (ckLixeira.visible) and (ckLixeira.Enabled) and (PageControl1.ActivePage = TabSheet2) then
      ckLixeira.Checked := not ckLixeira.Checked
    else if (ckLixeira.visible) and (ckLixeira.Enabled) and (PageControl1.ActivePage = tsAlterDadosServ) then
    	ckLixeira.Checked := not ckLixeira.Checked;
  end;
end;

procedure TFrmCadTipoServ.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  DBGrid1.DataSource := dtmProdutos.dsTipoServ;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  if Assigned(TipoServ) then
  begin
    TipoServ.abreEmpresas;
    TipoServ.TipoTipoServ.Abrir;
    TipoServ.vTipoServEmpresa._abreTodosEmpresas(0);
    SpeedButton9.Visible := TipoServ.vTipoServEmpresa.dataSet.RecordCount > 1;
    btDefinirEmp.Visible := TipoServ.vTipoServEmpresa.dataSet.RecordCount > 1;
  end;

  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  begin
    SpeedButton8.Hint := 'Adicionar Técnico Específico para serviço - [BAS219]';
    GroupBox4.Caption := 'Tipo de Serviços por Técnicos';
    GroupBox5.Caption := 'Técnicos';
    GroupBox6.Caption := 'Técnicos Adicionado';
  end
  else
  begin
    SpeedButton8.Hint := 'Adicionar Mecânico Específico para serviço - [BAS219]';
    GroupBox4.Caption := 'Tipo de Serviços por Mecânicos';
    GroupBox5.Caption := 'Mecânicos';
    GroupBox6.Caption := 'Mecânicos Adicionado';
  end;

  SpeedButton7.Visible  := vDadosIni.vEmp.vAgendaOficina = 'S';
  SpeedButton11.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;

  if Assigned(TipoServ) then
    if vCriou = 0 then
      TipoServ.verificarTipoServEmpresas;

  if Assigned(TipoServ) then
    if vCriou = 0 then
      vCriou := 1;
end;

function TFrmCadTipoServ.GetComboNatReceita(pCST: string): AnsiString;
var
  vTempSt: TStringList;
begin
  vTempSt := TStringList.Create; ;
  if (Copy(pCST, 1, 2) = '04') then
  begin
    vTempSt.Clear;
    vTempSt.Add('');
    vTempSt.Add('101 - Gasolinas, Exceto Gasolina de Aviação');
    vTempSt.Add('102 - Óleo Diesel');
    vTempSt.Add('103 - Gás Liqüefeito de Petróleo – GLP');
    vTempSt.Add('104 - Querosene de Aviação');
    vTempSt.Add('105 - Correntes Destinadas à Formulação de Gasolinas');
    vTempSt.Add('106 - Correntes Destinadas à Formulação de Óleo Diesel');
    vTempSt.Add('107 - Nafta Petroquímica Destinada à Formulação de Gasolina ou de Óleo Diesel');
    vTempSt.Add('108 - Nafta Petroquímica Destinada à Formulação Exclusivamente de Óleo Diesel');
    vTempSt.Add('109 - Biodiesel');
    vTempSt.Add('110 - Nafta Petroquímica Destinada às Centrais Petroquímicas');
    vTempSt.Add('111 - Etano, Propano, Butano e Correntes Gasosas de Refinaria - HLR - Hidrocarbonetos Leves de Refino Destinados à Produção de Eteno e Propeno');
    vTempSt.Add('112 - Álcool, Inclusive para Fins Carburantes – Venda por Produtor ou Importador.');
    vTempSt.Add('113 - Álcool, Inclusive para Fins Carburantes – Venda por Distribuidor ou Comerciante Não Varejista.');
    vTempSt.Add('200 - FÁRMACOS E PERFUMARIAS');
    vTempSt.Add('201 - Produtos Farmacêuticos');
    vTempSt.Add('202 - Produtos de Perfumaria, de Toucador ou de Higiene Pessoal.');
    vTempSt.Add('301 - Veículos Automotores e Máquinas Agrícolas Autopropulsadas');
    vTempSt.Add('302 - Autopeças - Vendas para Atacadistas, Varejistas e Consumidores');
    vTempSt.Add('303 - Autopeças - Vendas para Fabricantes de Veículos e Máquinas e de Autopeças');
    vTempSt.Add('304 - Pneumáticos (Pneus Novos e Câmaras-de-Ar)');
    vTempSt.Add('401 - Águas Minerais Artificiais e Águas Gaseificadas Artificiais');
    vTempSt.Add('402 - Águas Minerais Naturais, Incluídas as Naturalmente Gaseificadas');
    vTempSt.Add('403 - Refrigerantes');
    vTempSt.Add('404 - Preparações Compostas, não Alcoólicas, para Elaboração de Bebida Refrigerante');
    vTempSt.Add('405 - Refrescos, Isotônicos e Energéticos');
    vTempSt.Add('406 - Cervejas de Malte e Cervejas Sem Álcool');
    vTempSt.Add('407 - Chope e Cervejas de Malte Quando Vendidas a Granel');
    vTempSt.Add('701 - Embalagens de Vidro não Retornáveis para Refrigerantes ou Cervejas');
    vTempSt.Add('702 - Embalagens de Vidro Retornáveis para Refrigerantes ou Cervejas');
    vTempSt.Add('703 - Garrafas e Garrafões com Capacidade Nominal de Envasamento Inferior a 10 Litros');
    vTempSt.Add('704 - Garrafas e Garrafões com Capacidade Nominal de Envasamento Igual ou Superior a 10 Litros');
    vTempSt.Add('705 - Lata de Aço para Refrigerantes, Cervejas sem Álcool ou Água');
    vTempSt.Add('706 - Lata de Aço para Cervejas de Malte');
    vTempSt.Add('707 - Lata de Alumínio para Refrigerantes, Cervejas sem Álcool ou Água');
    vTempSt.Add('708 - Lata de Alumínio para Cervejas de Malte');
    vTempSt.Add('709 - Pré-Formas de Embalagens com Faixa de Gramatura de até 30 g');
    vTempSt.Add('710 - Pré-Formas de Embalagens com Faixa de Gramatura Acima de 30 até 42 g');
    vTempSt.Add('711 - Pré-Formas de Embalagens com Faixa de Gramatura Acima de 42 g');
    vTempSt.Add('712 - Pré-Formas de Embalagens com Faixa de Gramatura Acima de 42 g');
    vTempSt.Add('811 - Águas Minerais Artificiais - Todas as Embalagens');
    vTempSt.Add('812 - Águas Gaseificadas Artificiais - Todas as Embalagens');
    vTempSt.Add('821 - Águas Minerais Naturais Envasadas em Embalagens de Capacidade até 10 Litros');
    vTempSt.Add('822 - Águas Minerais Naturais Envasadas em Embalagens de Capacidade Acima de 10 Litros');
    vTempSt.Add('831 - Águas e Refrigerantes, em PET/Plástico - Grupo 01');
    vTempSt.Add('832 - Águas e Refrigerantes, em PET/Plástico - Grupo 02');
    vTempSt.Add('833 - Águas e Refrigerantes, em PET/Plástico - Grupo 03');
    vTempSt.Add('834 - Águas e Refrigerantes, em PET/Plástico - Grupo 04');
    vTempSt.Add('835 - Águas e Refrigerantes, em PET/Plástico - Grupo 05');
    vTempSt.Add('836 - Águas e Refrigerantes, em PET/Plástico - Grupo 06');
    vTempSt.Add('837 - Águas e Refrigerantes, em PET/Plástico - Grupo 07');
    vTempSt.Add('838 - Águas e Refrigerantes, em PET/Plástico - Grupo 08');
    vTempSt.Add('839 - Águas e Refrigerantes, em PET/Plástico - Grupo 09');
    vTempSt.Add('840 - Águas e Refrigerantes, em PET/Plástico - Grupo 10');
    vTempSt.Add('841 - Águas e Refrigerantes, em PET/Plástico - Grupo 11');
    vTempSt.Add('842 - Águas e Refrigerantes, em PET/Plástico - Grupo 12');
    vTempSt.Add('843 - Águas e Refrigerantes, em PET/Plástico - Grupo 13');
    vTempSt.Add('844 - Águas e Refrigerantes, em PET/Plástico - Grupo 14');
    vTempSt.Add('845 - Águas e Refrigerantes, em PET/Plástico - Grupo 16');
    vTempSt.Add('846 - Águas e Refrigerantes, em PET/Plástico - Grupo 18');
    vTempSt.Add('847 - Águas e Refrigerantes, em PET/Plástico - Grupo 20');
    vTempSt.Add('848 - Águas e Refrigerantes, em PET/Plástico - Grupo 23');
    vTempSt.Add('849 - Águas e Refrigerantes, em PET/Plástico - Grupo 25');
    vTempSt.Add('850 - Águas e Refrigerantes, em PET/Plástico - Grupo 29');
    vTempSt.Add('861 - Águas e Refrigerantes, em Lata - Grupo 01');
    vTempSt.Add('862 - Águas e Refrigerantes, em Lata - Grupo 02');
    vTempSt.Add('863 - Águas e Refrigerantes, em Lata - Grupo 03');
    vTempSt.Add('864 - Águas e Refrigerantes, em Lata - Grupo 04');
    vTempSt.Add('865 - Águas e Refrigerantes, em Lata - Grupo 05');
    vTempSt.Add('866 - Águas e Refrigerantes, em Lata - Grupo 06');
    vTempSt.Add('867 - Águas e Refrigerantes, em Lata - Grupo 07');
    vTempSt.Add('868 - Águas e Refrigerantes, em Lata - Grupo 08');
    vTempSt.Add('869 - Águas e Refrigerantes, em Lata - Grupo 09');
    vTempSt.Add('870 - Águas e Refrigerantes, em Lata - Grupo 10');
    vTempSt.Add('871 - Águas e Refrigerantes, em Lata - Grupo 11');
    vTempSt.Add('872 - Águas e Refrigerantes, em Lata - Grupo 14');
    vTempSt.Add('881 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 01');
    vTempSt.Add('882 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 02');
    vTempSt.Add('883 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 03');
    vTempSt.Add('884 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 04');
    vTempSt.Add('885 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 05');
    vTempSt.Add('886 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 06');
    vTempSt.Add('887 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 07');
    vTempSt.Add('888 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 08');
    vTempSt.Add('889 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 09');
    vTempSt.Add('890 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 10');
    vTempSt.Add('891 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 11');
    vTempSt.Add('892 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 12');
    vTempSt.Add('893 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 13');
    vTempSt.Add('894 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 14');
    vTempSt.Add('895 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 15');
    vTempSt.Add('896 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 16');
  end
  else if (Copy(pCST, 1, 2) = '05') then
  begin
    vTempSt.Clear;
    vTempSt.Add('');
    vTempSt.Add('101 - Cigarros, de fumo (tabaco) ou dos seus sucedâneos');
    vTempSt.Add('201 - Motocicletas (incluídos os ciclomotores) e outros ciclos equipados com motor auxiliar, mesmo com carro lateral; carros laterais');
    vTempSt.Add('301 - Semeadores, plantadores e transplantadores');
    vTempSt.Add('401 - Álcool, inclusive para fins carburantes – Vendas por Produtor/Importador');
    vTempSt.Add('402 - Álcool, inclusive para fins carburantes – Vendas por Distribuidor');
    vTempSt.Add('403 - Gasolinas, Óleo Dieses e GLP');
    vTempSt.Add('404 - Veiculos');
    vTempSt.Add('405 - Autopeças');
    vTempSt.Add('406 - Pneus');
    vTempSt.Add('407 - Bebidas Frias');
    vTempSt.Add('408 - Embalagens para bebidas Frias');
    vTempSt.Add('409 - Artigos de Perfumaria');
  end
  else if (Copy(pCST, 1, 2) = '06') then
  begin
    vTempSt.Clear;
    vTempSt.Add('');
    vTempSt.Add('101 - Adubos ou fertilizantes classificados no Capítulo 31, exceto os produtos de uso veterinário, da TIPI, e suas matérias-primas');
    vTempSt.Add('102 - Defensivos agropecuários classificados na posição 38.08 da TIPI e suas matérias-primas');
    vTempSt.Add('103 - Sementes e mudas destinadas à semeadura e plantio, em conformidade com o disposto na Lei no 10.711/03, e produtos de natureza biológica utilizados em sua produção');
    vTempSt.Add('104 - Corretivo de solo de origem mineral classificado no Capítulo 25 da TIPI');
    vTempSt.Add('105 - Legumes de vagem, secos, em grão, mesmo pelados ou partidos; arroz; farinhas e sêmolas');
    vTempSt.Add('106 - Inoculantes agrícolas produzidos a partir de bactérias fixadoras de nitrogênio, classificados no código 3002.90.99 da TIPI');
    vTempSt.Add('107 - Vacinas para medicina veterinária');
    vTempSt.Add('108 - Farinha, grumos e sêmolas, grãos esmagados ou em flocos, de milho, classificados, respectivamente, nos códigos 1102.20, 1103.13 e 1104.19, todos da TIPI');
    vTempSt.Add('109 - Pintos de 1 (um) dia');
    vTempSt.Add('110 - Leite fluido pasteurizado ou industrializado, na forma de ultrapasteurizado, leite em pó, integral, semidesnatado ou desnatado, leite fermentado, bebidas e compostos lácteos e fórmulas infantis, assim definidas conforme previsão legal específica, ' +
      'destinados ao consumo humano ou utilizados na industrialização de produtos que se destinam ao consumo humano');
    vTempSt.Add('111 - Queijos tipo mozarela, minas, prato, queijo de coalho, ricota, requeijão, queijo provolone, queijo parmesão e queijo fresco não maturado');
    vTempSt.Add('112 - Soro de leite fluido a ser empregado na industrialização de produtos destinados ao consumo humano');
    vTempSt.Add('113 - Farinha de trigo');
    vTempSt.Add('114 - Trigo');
    vTempSt.Add('115 - Pré-misturas próprias para fabricação de pão comum e pão comum');
    vTempSt.Add('116 - Produtos hortícolas e frutas');
    vTempSt.Add('117 - Ovos');
    vTempSt.Add('118 - Venda de semens e embriões');
    vTempSt.Add('119 - Massas alimentícias classificadas na posição 19.02 da TIPI.');
    vTempSt.Add('201 - Aeronaves classificadas na posição 88.02 da TIPI');
    vTempSt.Add('202 - Partes, peças, ferramentais, componentes, insumos, fluidos hidráulicos, tintas, anticorrosivos, lubrificantes, equipamentos, serviços e matérias-primas a serem empregados na manutenção, conservação, modernização, reparo, revisão, conversão e ' +
      'industrialização das aeronaves, seus motores, partes, componentes, ferramentais e equipamentos das aeronaves referidas no código 201');
    vTempSt.Add('203 - Álcool anidro adicionado à gasolina, por distribuidores');
    vTempSt.Add('204 - Álcool, inclusive para fins carburantes, em operações realizadas em bolsa de mercadorias e futuros, exceto quando ocorra a liquidação física do contrato');
    vTempSt.Add('205 - Carvão mineral destinado à geração de energia elétrica');
    vTempSt.Add('206 - Biodiesel fabricado a partir de matérias-primas produzidas nas regiões norte, nordeste e no semi-árido, por agricultor familiar enquadrado no PRONAF');
    vTempSt.Add('207 - Valores recebidos pelos concessionários de que trata a Lei nº 6.729/1979, pela intermediação ou entrega dos veículos classificados nas posições 87.03 e 87.04 da TIPI, vendidos diretamente ao consumidor final');
    vTempSt.Add('208 - Veículos novos montados sobre chassis, com capacidade para vinte e três a quarenta e quatro passageiros, classificados no código 8702.10.00 Ex. 02 e 8702.90.90 Ex 02, da TIPI, destinados ao transporte escolar para a educação básica na zona ' +
      'rural das redes estadual, municipal e distrital, quando adquiridos pelos Estados, Municípios e pelo Distrito Federal');
    vTempSt.Add('209 - Embarcações novas, com capacidade para vinte a trinta e cinco passageiros, classificadas no código 8901.90.00 da TIPI, destinadas ao transporte escolar para a educação básica na zona rural das redes estadual, municipal e distrital, quando ' + 'adquiridos pelos Estados, Municípios e pelo Distrito Federal');
    vTempSt.Add('210 - Materiais e equipamentos, inclusive partes, peças e componentes, destinados ao emprego na construção, conservação, modernização, conversão ou reparo de embarcações registradas ou pré-registradas no Registro Especial Brasileiro');
    vTempSt.Add('211 - Veículos e carros blindados de combate, novos, armados ou não, e suas partes, produzidos no Brasil, com peso bruto total até 30 (trinta) toneladas, classificados na posição 8710.00.00 da TIPI, destinados ao uso das Forças Armadas ou órgãos de ' +
      'segurança pública brasileiros, quando adquiridos por órgãos e entidades da administração pública direta');
    vTempSt.Add('212 - Gás natural canalizado, destinado à produção de energia elétrica pelas usinas integrantes do Programa Prioritário de Termoeletricidade, nos termos e condições estabelecidos em ato conjunto dos Ministros de Estado de Minas Energia e da Fazenda');
    vTempSt.Add('213 - Serviços de transporte ferroviário em sistema de trens de alta velocidade (TAV), assim entendido como a composição utilizada para efetuar a prestação do serviço público de transporte ferroviário que consiga atingir velocidade igual ou superior' + ' a 250 km/h (duzentos e cinquenta quilômetros por hora)');
    vTempSt.Add('301 - Produtos classificados na posição 87.13 da NCM (cadeiras de rodas e outros veículos)');
    vTempSt.Add('302 - Artigos e aparelhos ortopédicos ou para fraturas classificados no código 90.21.10 da NCM');
    vTempSt.Add('303 - Artigos e aparelhos de próteses classificados no código 90.21.3 da NCM');
    vTempSt.Add('304 - Almofadas antiescaras classificadas nos Capítulos 39, 40, 63 e 94 da NCM');
    vTempSt.Add('305 - Bens relacionados em ato do Poder Executivo para aplicação nas Unidades Modulares de Saúde de que trata o Convênio ICMS no 114/2009 quando vendidos a órgãos da administração pública direta federal, estadual, distrital e municipal');
    vTempSt.Add('306 - Produtos químicosclassificados no Capítulo 29 da Nomenclatura Comum do Mercosul - NCM');
    vTempSt.Add('307 - Produtos químicos intermediários de síntese, classificados no Capítulo 29 da NCM');
    vTempSt.Add('308 - Produtos destinados ao uso em hospitais, clínicas e consultórios médicos e odontológicos, campanhas de saúde realizadas pelo poder público, laboratório de anatomia patológica, citológica ou de análises clínicas, classificados nas posições ' + '30.02, 30.06, 39.26, 40.15 e 90.18, da NCM');
    vTempSt.Add('309 - Produtos classificados nos códigos 8443.32.22, 8469.00.39 Ex 01, 8714.20.00, e 9021.40.00, todos da TIPI');
    vTempSt.Add('310 - Calculadoras equipadas com sintetizador de voz classificadas no código 8470.10.00 da TIPI');
    vTempSt.Add('311 - Teclados com colmeia classificados no código 8471.60.52 da TIPI');
    vTempSt.Add('312 - Indicadores ou apontadores - mouses - com entrada para acionador classificados no código 8471.60.53 da TIPI');
    vTempSt.Add('313 - Linhas braile classificadas no código 8471.60.90 da TIPI');
    vTempSt.Add('314 - Digitalizadores de imagens - scanners - equipados com sintetizador de voz classificados no código 8471.90.14 da TIPI');
    vTempSt.Add('315 - Duplicadores braile classificados no código 8472.10.00 da TIPI');
    vTempSt.Add('316 - Acionadores de pressão classificados no código 8471.60.53 da TIPI');
    vTempSt.Add('317 - Lupas eletrônicas do tipo utilizado por pessoas com deficiência visual classificadas no código 8525.80.19 da TIPI');
    vTempSt.Add('318 - Implantes cocleares classificados no código 9021.90.19 da TIPI');
    vTempSt.Add('319 - Próteses oculares classificadas no código 9021.90.89 da TIPI.');
    vTempSt.Add('401 - Venda a varejo de unidades de processamento digital classificadas no código 8471.50.10 da TIPI, desde que o preço de venda de cada unidade não exceda a R$ 2.000,00');
    vTempSt.Add('402 - Venda a varejo de máquinas automáticas para processamento de dados, digitais, portáteis, de peso inferior a 3,5Kg (três quilos e meio), com tela (écran) de área superior a 140cm2 (cento e quarenta centímetros quadrados), classificadas nos ' +
      'códigos 8471.30.12, 8471.30.19 ou 8471.30.90 da TIPI, desde que o preço de venda de cada máquina não exceda a R$ 4.000,00');
    vTempSt.Add('403 - Venda a varejo de máquinas automáticas de processamento de dados, apresentadas sob a forma de sistemas, do código 8471.49 da TIPI, contendo exclusivamente 1 (uma) unidade de processamento digital, 1 (uma) unidade de saída por vídeo (monitor), ' +
      '1 (um) teclado (unidade de entrada), 1 (um) mouse (unidade de entrada), classificados, respectivamente, nos códigos 8471.50.10, 8471.60.7, 8471.60.52 e 8471.60.53 da TIPI, desde que o preço de venda de cada sistema não exceda a R$ 4.000,00 (dois mil' +
      ' e quinhentos reais)');
    vTempSt.Add('404 - Venda a varejo de teclado (unidade de entrada) e de mouse (unidade de entrada) classificados, respectivamente, nos códigos 8471.60.52 e 8471.60.53 da TIPI, quando acompanharem a unidade de processamento digital classificada no código 8471.50.10' +
      ' da TIPI, desde que o preço de venda de cada conjunto não exceda a R$ 2.100,00 (dois mil e cem reais).');
    vTempSt.Add('405 - PADIS - Programa de Apoio ao Desenvolvimento Tecnológico da Indústria de Semicondutores');
    vTempSt.Add('406 - PATVD - Programa de Apoio ao Desenvolvimento Tecnológico da Indústria de Equipamentos para a TV Digital');
    vTempSt.Add('407 - Máquinas automáticas de proc. de dados,portáteis,sem teclado,que tenham uma unidade central de processamento com E/S de dados por meio de uma tela sensível ao toque de área superior a 140cm2 e inferior a 600cm2,e que não possuam função de' +
      ' comando remoto (Tablet PC), classif. em 8471.41,prod. no País cfe. proc. produtivo básico estab. pelo P. Exec');
    vTempSt.Add('901 - Papel destinado à impressão de jornais');
    vTempSt.Add('902 - Papéis classificados nos códigos 4801.00.10, 4801.00.90, 4802.61.91, 4802.61.99, 4810.19.89 e 4810.22.90, todos da TIPI, destinados à impressão de periódicos');
    vTempSt.Add('903 - Livros, conforme definido no art. 2o da Lei no 10.753/03');
    vTempSt.Add('904 - Preparações compostas não-alcoólicas, classificadas no código 2106.90.10 Ex 01 da TIPI, destinadas à elaboração de bebidas pelas pessoas jurídicas industriais dos produtos referidos no art. 58-A da Lei no 10.833/2003');
    vTempSt.Add('905 - Material de defesa, classificado nas posições 87.10.00.00 e 89.06.10.00 da TIPI, além de partes, peças, componentes, ferramentais, insumos, equipamentos e matérias-primas a serem empregados na sua industrialização, montagem, manutenção, ' + 'modernização e conversão');
    vTempSt.Add('906 - Equipamentos de controle de produção, inclusive medidores de vazão, condutivímetros, aparelhos para controle, registro, gravação e transmissão dos quantitativos medidos, quando adquiridos por pessoas jurídicas legalmente obrigadas à sua ' + 'utilização');
    vTempSt.Add('907 - Valores pagos ou creditados pelos Estados, Distrito Federal e Municípios relativos ao ICMS e ao ISS, no âmbito de programas de concessão de crédito voltados ao estímulo à solicitação de documento fiscal na aquisição de mercadorias e serviços');
    vTempSt.Add('908 - Vendas de mercadorias destinadas ao consumo ou à industrialização na Zona Franca de Manaus – ZFM');
    vTempSt.Add('909 - Vendas de mercadorias destinadas ao consumo ou à industrialização nas Áreas de Livre Comércio – ALC, exceto quando tiver como destinatárias pessoas jurídicas atacadistas e varejistas, sujeitas ao regime de apuração não cumulativa da Contribuição' + ' para o PIS/Pasep e da Cofins');
    vTempSt.Add('910 - Vendas de matérias-primas, produtos intermediários e materiais de embalagem, produzidos na Zona Franca de Manaus para emprego em processo de industrialização por estabelecimentos industriais ali instalados e consoante projetos aprovados pelo SUFRAMA');
    vTempSt.Add('911 - Receitas financeiras, inclusive decorrentes de operações realizadas para fins de hedge, auferidas pelas pessoas jurídicas sujeitas ao regime de incidência não-cumulativa');
    vTempSt.Add('912 - Aquisição no mercado interno ou a importação, de forma combinada ou não, de mercadoria equivalente à empregada ou consumida na industrialização de produto exportado (Drawback Reposição de Estoque)');
    vTempSt.Add('913 - Projetores para exibição cinematográfica, classificados no código 9007.2 da NCM, e suas partes e acessórios, classificados no código 9007.9 da NCMs');
    vTempSt.Add('999 - Outros Produtos e Receitas');
  end
  else if (Copy(pCST, 1, 2) = '07') then
  begin
    vTempSt.Clear;
    vTempSt.Add('');
    vTempSt.Add('101 - Fornecimento de mercadorias ou serviços para uso ou consumo de bordo em embarcações e aeronaves em tráfego internacional, quando o pagamento for efetuado em moeda conversível (exceto querosene de aviação)');
    vTempSt.Add('102 - Transporte internacional de cargas ou passageiros');
    vTempSt.Add('103 - Receitas auferidas pelos estaleiros navais brasileiros nas atividades de construção, conservação, modernização, conversão e reparo de embarcações pré-registradas ou registradas no Registro Especial Brasileiro (REB), instituído pela Lei nº 9.432,' + ' de 8 de janeiro de 1997');
    vTempSt.Add('104 - Frete de mercadorias transportadas entre o País e o exterior pelas embarcações registradas no REB, de que trata o art. 11 da Lei nº 9.432, de 1997');
    vTempSt.Add('201 - Receitas relativas às atividades próprias dos templos de qualquer culto; partidos políticos; instituições de educação e de assistência social que preencham as condições e requisitos do art. 12 da Lei nº 9.532, de 10 de dezembro de 1997; instituições' + ' de caráter filantrópico, recreativo, cultural, científico e as ' +
      'associações, que preencham as condições e requisitos do art. 15 da Lei nº 9.532, de 1997; sindicatos, federações e confederações; serviços sociais autônomos, criados ou autorizados por lei; ' + 'conselhos de fiscalização de profissões regulamentadas; fundações de direito privado; condomínios de proprietários de imóveis residenciais ou comerciais; e Organização das Cooperativas Brasileiras (OCB) e as '
      +
      'Organizações Estaduais de Cooperativas previstas no art. 105 e seu § 1º da Lei nº 5.764, de 16 de dezembro de 1971.');
    vTempSt.Add('202 - Receitas das entidades beneficentes de assistência social com a finalidade de prestação de serviços nas áreas de assistência social, saúde ou educação, que atendam aos requisitos do art. 29 da Lei nº 12.101, de 27 de novembro de 2009.');
    vTempSt.Add('301 - Venda de energia elétrica pela Itaipu Binacional');
    vTempSt.Add('401 - Importação de bens ou mercadorias para uso ou consumo exclusivo na organização e realização dos referidos eventos, promovida pela Fifa, Subsidiária Fifa no Brasil, Confederações Fifa, Associações estrangeiras membros da Fifa, Parceiros Comerciais ' +
      'da Fifa domiciliados no exterior, Emissora Fonte da Fifa e Prestadores de Serviço da Fifa domiciliados no exterior, ou por intermédio de pessoa jurídica por eles contratada para representá-los');
    vTempSt.Add('402 - Receita auferida por Subsidiária Fifa no Brasil, decorrente das atividades próprias e diretamente vinculadas à organização ou realização dos referidos eventos, exceto as receitas decorrentes da venda de ingressos e de pacotes de hospedagem.');
    vTempSt.Add('403 - Receita das atividades próprias, auferida pelos Prestadores de Serviços da FIFA, estabelecidos no País sob a forma de sociedade com finalidade específica para o desenvolvimento de atividades diretamente relacionadas à realização dos eventos.');
    vTempSt.Add('901 - Recursos recebidos a título de repasse, oriundos do Orçamento Geral da União, dos Estados, do Distrito Federal e dos Municípios, pelas empresas públicas e sociedades de economia mista');
    vTempSt.Add('902 - Receita da instituição privada de ensino superior, com fins lucrativos ou sem fins lucrativos não beneficente, que aderir ao Programa Universidade para Todos (Prouni), no período de vigência do termo de adesão, decorrentes da realização de ' +
      'atividades de ensino superior, proveniente de cursos de graduação ou cursos seqüenciais de formação específica');
    vTempSt.Add('999 - Outras receitas com isenção');
  end
  else
  begin
    vTempSt.Clear;
  end;
  Result := vTempSt.Text;
end;

procedure TFrmCadTipoServ.habilitarCamposComercioAberto;
begin
	pnOpcoesDadosCA.Visible := false;
  DesativarAtivarCamposHtml('C', true);
  PageControlCA.ActivePage := TabSheetCA1;
  TabSheetCA1.Show;
  carregarwebbrownser(WebBrowserCA, TipoServ.dataSet.FieldByName('DESC_SERV_COMPL').AsString);
end;

procedure TFrmCadTipoServ.linkVerCorrelFiscalClick(Sender: TObject);
var
  form: TFormCorrelFiscalNFSe;
begin
  inherited;
  form := TFormCorrelFiscalNFSe.Create(nil);
  try
    form.Setup(
      TipoServ.fstr('nfs_servico'), TipoServ.fstr('ctribnac'), TipoServ.fstr('cnbs'), TipoServ.fstr('cindop')
    );
    form.OnSelectCampo := SelecionadoCampoFiscalNFSe;

    form.ShowModal();

  finally
    FreeAndNil(form);
  end;
end;

procedure TFrmCadTipoServ.MarcarTodosTipoServicoClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    TipoServ._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoServ.PageControl3Change(Sender: TObject);
begin
	if PageControl3.ActivePage = tsComercioAberto then
	  habilitarCamposComercioAberto
end;

procedure TFrmCadTipoServ.pnCadTipoServEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (EditDescricaoTipoTipoServ.CanFocus) then
  	EditDescricaoTipoTipoServ.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditSiglaTipoTipoServ.CanFocus) then
  	EditSiglaTipoTipoServ.SetFocus;
end;

procedure TFrmCadTipoServ.pnCancDadosComercioAbertoClick(Sender: TObject);
begin
  inherited;
	TForm(pnDadosComercioAberto.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadTipoServ.pnDadosCAEnter(Sender: TObject);
begin
 if not pnDadosCA.Enabled then
    exit;

  if not pnOpcoesDadosCA.Enabled then
    exit;

  carregarwebbrownser(WebBrowserCA, TipoServ.dataSet.FieldByName('DESC_SERV_COMPL').AsString);
  if (Self.Enabled) and (Self.Visible) and (DBEditDescrCA.CanFocus) then
    DBEditDescrCA.SetFocus;
end;

procedure TFrmCadTipoServ.pnMultiempresaEnter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (DBGridMultiempresa.CanFocus) then
  	DBGridMultiempresa.SetFocus;
end;

procedure TFrmCadTipoServ.pnOKDadosComercioAbertoClick(Sender: TObject);
begin
  inherited;
	try
  	if not TipoServ.EnviarDadosComercioAberto(RadioGroupOpcoesComercioAberto.ItemIndex = 1) then
    	exit;

	  TForm(pnDadosComercioAberto.Parent).ModalResult := IDOK;
  finally
    _GravaConfiguracoesInteger(RadioGroupOpcoesComercioAberto.Name,	RadioGroupOpcoesComercioAberto.ItemIndex);
  end;
end;

procedure TFrmCadTipoServ.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmCadTipoServ.qrpTipoServPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Tipo de Serviços');
end;

procedure TFrmCadTipoServ.SelecionadoCampoFiscalNFSe(Campo: TFormCorrelFiscalCampo; const Value: string);
begin
  case Campo of
    cfLC116   : TipoServ.dataSet.FieldByName('nfs_servico').AsString := Value;
    cfCTribNac: TipoServ.dataSet.FieldByName('ctribnac').AsString := Value;
    cfNBS     : TipoServ.dataSet.FieldByName('cnbs').AsString := Value;
    cfCIndOp  : TipoServ.dataSet.FieldByName('cindop').AsString := Value;
  end;
end;

procedure TFrmCadTipoServ.SpeedBDesmarcarTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    TipoServ._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoServ.SpeedBSelTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    TipoServ._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoServ.SpeedButton11Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS430', 'ALTERAR', '', 'TIPO_SERVICO',
     '', TipoServ.buscas, true) then
    Exit;

  if not TipoServ.ConfigAPIComercioAbertoAtiva then
  begin
  	Application.MessageBox('Configuração da API do Comércio Aberto não definidas, favor verificar!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  RadioGroupOpcoesComercioAberto.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroupOpcoesComercioAberto.Name);
  if not vDadosIni.abreForm('Atualizar informações Comércio Aberto', pnDadosComercioAberto, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
  	exit;
end;

procedure TFrmCadTipoServ.SpeedButton12Click(Sender: TObject);
begin
  inherited;
	if not TipoServ._replicarTipoServ then
    exit;

  SpeedButton1Click(Sender);
end;

procedure TFrmCadTipoServ.SpeedButton1Click(Sender: TObject);
begin
	try
    if TipoServ.dataSet.IsEmpty then
      exit;

    if not TipoServ.Edit then
      exit;

    TipoServ.vTipoServEmpresa._abreTodosEmpresas(TipoServ.dataset.FieldByName('COD_SERVICO').AsInteger);

    inherited;
    PageControl1.ActivePage := TabSheet1;
    TabSheet3.TabVisible := true;
    tsComercioAberto.TabVisible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
    TabSheet3.Caption := 'Alterando Tipo de Serviço';
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.Show;

	 Label158.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    DBComboBox22.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

    TipoServ.PreencheCampos;
    TipoServ.LocTipoTipoServ.abreTipoTipoServ;
    TipoServ.LocEspecieSeg.abreEspecieSeg;
    TipoServ.LocCFOP.abreCFOP;
    TipoServ.codtiposervLC.abretabela;

  //        DBLookupComboBox4.Enabled := not TipoServ.codEmpresaPreenchido;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
      DBLookupComboBox4.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      TipoServ.Cancel;
      TipoServ.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadTipoServ.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    GroupBox3.Parent := Panel52;
    BitBtn2.Visible := False;
	 BitBtn3.Visible := False;
    btVoltarDadosServ.Parent := GroupBox3;
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

    PageControl1.ActivePage := tsAlterDadosServ;

    lbCorLote.Visible := false;
    pnCorLote.Visible := false;

    TelaCadastro := 5;

    ckPermOpcaoMarcadas.Visible := true;
    
    ckLixeira.Visible    := True;
    if ckLixeira.Checked then
      FrmCadTipoServ.Caption := 'Alteração Tipos de Serviços em Lote (Lixeira)'
    else
      FrmCadTipoServ.Caption := 'Alteração Tipos de Serviços em Lote';
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadTipoServ.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS018', 'ABRIR A LIXEIRA', '', 'TIPO_SERVICO', '', TipoServ.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not TipoServ.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS085]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
        SpeedButton6.Visible := true;
        SpeedButton9.Visible := true;
        SpeedButton8.Visible := true;
        SpeedButton7.Visible := true;
        SpeedButton11.Visible := true;
        SpeedButton12.Visible := true;
        btAlterarDadosFiscais.Visible := true;
        SpeedButton24.Visible := true;

        ckLixeira.Enabled := false;
        ckLixeira.Checked := false;
        ckLixeira.Enabled := true;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS017]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
        SpeedButton6.Visible := false;
        SpeedButton9.Visible := false;
        SpeedButton8.Visible := false;
        SpeedButton7.Visible := false;
        SpeedButton11.Visible := false;
        SpeedButton12.Visible := false;
        btAlterarDadosFiscais.Visible := false;
        SpeedButton24.Visible := false;

        ckLixeira.Enabled := false;
        ckLixeira.Checked := true;
        ckLixeira.Enabled := true;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadTipoServ.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
  try
    if not TipoServ.Delete then
    	Exit;
      
    vStatusLixeira := TipoServ.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
    
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      TipoServ.Cancel;
      TipoServ.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadTipoServ.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS086', 'IMPRIMIR', '', 'TIPO_SERVICO', '', TipoServ.buscas, true) then
  begin
    inherited;
    qrpTipoServ.Preview;
  end;
end;

procedure TFrmCadTipoServ.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('tpserv_%', TipoServ.buscas);
end;

procedure TFrmCadTipoServ.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not TipoServ.restaurarRegistro then
  	Exit;
    
  if TipoServ.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadTipoServ.SpeedButton68Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('tpserv_alt_lote_reg', TipoServ.buscas);
end;

procedure TFrmCadTipoServ.SpeedButton6Click(Sender: TObject);
var
  def: TDefinicaoClasses;
begin
  if vDadosIni.PesqPros('BAS087', 'ABRIR TELA', '', 'TIPO_SERVICO', '', TipoServ.buscas, true) then
  begin
    inherited;
    def.DefClasseServ;
    TipoServ.Refresh;
  end;
end;

procedure TFrmCadTipoServ.SpeedButton7Click(Sender: TObject);
begin
  inherited;
	if vDadosIni.vEmp.vAgendaOficina <> 'S' then
  begin
    Application.MessageBox('Empresa não configurada para usar Agenda Oficina!',
      'Atenção', 0 + 64);
    exit;
  end;

  if not vDadosIni.PesqPros('BAS242', 'ABRIR TELA TIPO SERVICO POR MECANICO', '',
    'TIPO_SERVICO_MECANICO', TipoServ.dataSet.FieldByName('COD_SERVICO').AsString, TipoServ.buscas,
    true) then
    exit;

  if TipoServ.vBox._abreBox then
    if  TipoServ.vBox._abreTipoServicoBox(TipoServ.dataSet.FieldByName('COD_SERVICO').AsString) then
      if     
        TipoServ.vTipoServBox.abreServicoBox(TipoServ.dataSet.FieldByName('COD_SERVICO').AsString) then
        PageControl1.ActivePage := TabSheet5;
end;

procedure TFrmCadTipoServ.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.vEmp.vAgendaOficina <> 'S' then
  begin
    Application.MessageBox('Empresa não configurada para usar Agenda Oficina!',
      'Atenção', 0 + 64);
    exit;
  end;

  if not vDadosIni.PesqPros('BAS219', 'ABRIR TELA TIPO SERVICO POR MECANICO', '',
    'TIPO_SERVICO_MECANICO', TipoServ.dataSet.FieldByName('COD_SERVICO').AsString, TipoServ.buscas,
    true) then
    exit;

  if TipoServ.vUsuario._abreMecanico then
    if
      TipoServ.vUsuario._abreTipoServicoMecanico(TipoServ.dataSet.FieldByName('COD_SERVICO').AsString)
      then
      if
        TipoServ.vTipoServMecanico.abreExcecaoServico(TipoServ.dataSet.FieldByName('COD_SERVICO').AsString) then
        PageControl1.ActivePage := TabSheet4;

end;

procedure TFrmCadTipoServ.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if TipoServ.dataSet.IsEmpty then
    exit;

  TipoServ.vTipoServEmpresa._abreTodosEmpresas(TipoServ.dataset.FieldByName('COD_SERVICO').AsInteger);

  if TipoServ.vTipoServEmpresa.dataSet.RecordCount > 1 then
  begin
    if not TipoServ.abreFormEmpresas then
      exit;

    if not TipoServ.atualizarServicoEmpresa then
      exit;
  end;
end;

procedure TFrmCadTipoServ.SpeedButtonAlterarHtmlCAClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
	HTMLDocument := WebBrowserCA.Document as IHTMLDocument2;
  carregarwebbrownser(WebBrowserCA, vDadosIni.abreFormEditorHtml(HTMLDocument.body.innerHTML, '', false));
  TipoServ.dataSet.FieldByName('DESC_SERV_COMPL').AsString := HTMLDocument.body.innerHTML;
end;

procedure TFrmCadTipoServ.SpeedButtonAlterarProduto2Click(Sender: TObject);
var
  I: Integer;
  vArrayCodTipoItem: array of string;
  vArrayDescrTipoItem: array of string;
  vIndexFieldNames: string;
  vIndexName: string;
  vRecNo: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('BAS560', 'ALTERAR', '', 'TIPO_SERVICO', '', TipoServ.buscas, true) then
	 Exit;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;

  TipoServ.LocTipoTipoServ.abreTipoTipoServ;
  TipoServ.LocEspecieSeg.abreEspecieSeg;
  TipoServ.LocCFOP.abreCFOP;
  TipoServ.codtiposervLC.abretabela;

  pnVendaOnline.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

  EdCodCFOP.AsValue := _LerConfiguracoesRegistroDouble(EdCodCFOP.Name);
  EdAliqIss.AsValue := _LerConfiguracoesRegistroDouble(EdAliqIss.Name);
  cbServicoIsento.ItemIndex := _LerConfiguracoesRegistroInteger(cbServicoIsento.Name);
  cbNaoIncidencia.ItemIndex := _LerConfiguracoesRegistroInteger(cbNaoIncidencia.Name);
  cbTmoSimultaneo.ItemIndex := _LerConfiguracoesRegistroInteger(cbTmoSimultaneo.Name);
  EdTmo.AsValue := _LerConfiguracoesRegistroDouble(EdTmo.Name);
  cbAltValorCupom.ItemIndex := _LerConfiguracoesRegistroInteger(cbAltValorCupom.Name);
  cbAltDescricao.ItemHeight := _LerConfiguracoesRegistroInteger(cbAltDescricao.Name);
  cbServicoGarantia.ItemHeight := _LerConfiguracoesRegistroInteger(cbServicoGarantia.Name);
  DbLOrigemServ.KeyValue := _LerConfiguracoesRegistroString(DbLOrigemServ.Name);
  EdSeqRevisao.AsValue := _LerConfiguracoesRegistroDouble(EdSeqRevisao.Name);
  cbServPropTerc.ItemIndex := _LerConfiguracoesRegistroInteger(cbServPropTerc.Name);
  EdUnidade.Text := _LerConfiguracoesRegistroString(EdUnidade.Name);
  cbVendaOnline.ItemIndex := _LerConfiguracoesRegistroInteger(cbVendaOnline.Name);
  edCnaeServ.Text := _LerConfiguracoesRegistroString(edCnaeServ.Name);
  DBLLc116.KeyValue := _LerConfiguracoesRegistroString(DBLLc116.Name);
  edTribNac.Text := _LerConfiguracoesRegistroString(edTribNac.Name);
  edTribMun.Text := _LerConfiguracoesRegistroString(edTribMun.Name);
  edNBS.Text := _LerConfiguracoesRegistroString(edNBS.Name);
  edIndOp.Text := _LerConfiguracoesRegistroString(edIndOp.Name);
  edIssRetido.Text := _LerConfiguracoesRegistroString(edIssRetido.Name);
  cbCstPisCofins.ItemIndex := _LerConfiguracoesRegistroInteger(cbCstPisCofins.Name);
  cbCstPisCofinsEnt.ItemIndex := _LerConfiguracoesRegistroInteger(cbCstPisCofinsEnt.Name);

  if ckPermOpcaoMarcadas.Checked then
	ckCFOP.Checked := _LerConfiguracoesRegistroBoolean(ckCFOP.Name)
  else
  	ckCFOP.Checked := false;
  ckCFOPClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckAliqIss.Checked := _LerConfiguracoesRegistroBoolean(ckAliqIss.Name)
  else
  	ckAliqIss.Checked := false;
  ckAliqIssClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckServicoIsento.Checked := _LerConfiguracoesRegistroBoolean(ckServicoIsento.Name)
  else
  	ckServicoIsento.Checked := false;
  ckServicoIsentoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckNaoIncidencia.Checked := _LerConfiguracoesRegistroBoolean(ckNaoIncidencia.Name)
  else
  	ckNaoIncidencia.Checked := false;
  ckNaoIncidenciaClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckTmoSimultaneo.Checked := _LerConfiguracoesRegistroBoolean(ckTmoSimultaneo.Name)
  else
  	ckTmoSimultaneo.Checked := false;
  ckTmoSimultaneoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckTmo.Checked := _LerConfiguracoesRegistroBoolean(ckTmo.Name)
  else
  	ckTmo.Checked := false;
  ckTmoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckAltValorCupom.Checked := _LerConfiguracoesRegistroBoolean(ckAltValorCupom.Name)
  else
  	ckAltValorCupom.Checked := false;
  ckAltValorCupomClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckAltDescricao.Checked := _LerConfiguracoesRegistroBoolean(ckAltDescricao.Name)
  else
  	ckAltDescricao.Checked := false;
  ckAltDescricaoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckServicoGarantia.Checked := _LerConfiguracoesRegistroBoolean(ckServicoGarantia.Name)
  else
  	ckServicoGarantia.Checked := false;
  ckServicoGarantiaClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckOrigemServ.Checked := _LerConfiguracoesRegistroBoolean(ckOrigemServ.Name)
  else
  	ckOrigemServ.Checked := false;
  ckOrigemServClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckSeqRevisao.Checked := _LerConfiguracoesRegistroBoolean(ckSeqRevisao.Name)
  else
  	ckSeqRevisao.Checked := false;
  ckSeqRevisaoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckServPropTerc.Checked := _LerConfiguracoesRegistroBoolean(ckServPropTerc.Name)
  else
  	ckServPropTerc.Checked := false;
  ckServPropTercClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckUnidade.Checked := _LerConfiguracoesRegistroBoolean(ckUnidade.Name)
  else
  	ckUnidade.Checked := false;
  ckUnidadeClick(Sender);

  if not pnVendaOnline.Visible then
   ckVendaOnline.Checked := False 
  else if ckPermOpcaoMarcadas.Checked then
	ckVendaOnline.Checked := _LerConfiguracoesRegistroBoolean(ckVendaOnline.Name)
  else
  	ckVendaOnline.Checked := false;
  ckVendaOnlineClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckCnaeServ.Checked := _LerConfiguracoesRegistroBoolean(ckCnaeServ.Name)
  else
   ckCnaeServ.Checked := False;
  ckCnaeServClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckLc116.Checked := _LerConfiguracoesRegistroBoolean(ckLc116.Name)
  else
   ckLc116.Checked := False;
  ckLc116Click(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckTribNac.Checked := _LerConfiguracoesRegistroBoolean(ckTribNac.Name)
  else
   ckTribNac.Checked := False;
  ckTribNacClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckTribMun.Checked := _LerConfiguracoesRegistroBoolean(ckTribMun.Name)
  else
   ckTribMun.Checked := False;
  ckTribMunClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckNBS.Checked := _LerConfiguracoesRegistroBoolean(ckNBS.Name)
  else
   ckNBS.Checked := False;
  ckNbsClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckIndOp.Checked := _LerConfiguracoesRegistroBoolean(ckIndOp.Name)
  else
   ckIndOp.Checked := False;
  ckIndOpClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckIssRetido.Checked := _LerConfiguracoesRegistroBoolean(ckIssRetido.Name)
  else
   ckIssRetido.Checked := False;
  ckIssRetidoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckCstPisCofins.Checked := _LerConfiguracoesRegistroBoolean(ckCstPisCofins.Name)
  else
   ckCstPisCofins.Checked := False;
  ckCstPisCofinsClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckCstPisCofinsEnt.Checked := _LerConfiguracoesRegistroBoolean(ckCstPisCofinsEnt.Name)
  else
   ckCstPisCofinsEnt.Checked := False;
  ckCstPisCofinsEntClick(Sender);

  try
  	 vIndexFieldNames := TipoServ.dataSet.IndexFieldNames;
    vIndexName       := TipoServ.dataSet.IndexName;
    vRecNo           := TipoServ.dataSet.RecNo;

    for I := 0 to TipoServ.dataSet.Fields.Count - 1 do
    begin
    	if trim(TipoServ.dataSet.Fields[I].DisplayName) = trim(ComboBox2.text) then
      begin
      	vIndexFieldNames := TipoServ.dataSet.Fields[I].FieldName;
        break;
      end;
    end;

    TipoServ.dataSet.DisableControls;
    TipoServ.dataSet.Filtered := false;
    TipoServ.dataSet.Filter := 'sel = ''S'' ';
    TipoServ.dataSet.Filtered := true;

    if TipoServ.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum produto selecionado.', 'Atenção',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;
  finally
  	 TipoServ.dataSet.Filtered        := false;
    TipoServ.dataSet.IndexName       := vIndexName;
    TipoServ.dataSet.IndexFieldNames := vIndexFieldNames;
    if TipoServ.dataSet.RecordCount >= vRecNo then
	   TipoServ.dataSet.RecNo         := vRecNo;
    TipoServ.dataSet.EnableControls;
  end;

  PageControl1.ActivePage := tsAlterDadosLote;
  tsAlterDadosLote.Show;
end;

procedure TFrmCadTipoServ.SpeedButtonAlterarServicoClick(Sender: TObject);
begin
  inherited;
  SpeedButton1Click(Sender);

  if (TipoServ.dataSet.State in [dsInsert, dsEdit]) then
  begin
  	 if TipoServ.dataSet.FieldByName('ativo').AsInteger <> 1 then
     	TipoServ.dataSet.FieldByName('ativo').AsInteger := 1;
  end;
end;

procedure TFrmCadTipoServ.SpeedButtonMultiempresaDesmClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    TipoServ.vTipoServEmpresa._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadTipoServ.SpeedButtonMultiempresaSelClick(Sender: TObject);
begin
 	try
    Screen.Cursor := crHourGlass;
    TipoServ.vTipoServEmpresa._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadTipoServ.tipo_tipo_serv_add(Sender: TObject);
begin
	with TipoServ.TipoTipoServ do
	  if not Auditor.Processo('PRO430').Inserir.Permitido then
  		Exit;

  EditDescricaoTipoTipoServ.Enabled := False;
  EditSiglaTipoTipoServ.Enabled := False;
  Panel5.Enabled := False;

  EditDescricaoTipoTipoServ.Enabled := True;
  EditSiglaTipoTipoServ.Enabled := True;
  Panel5.Enabled := True;
  
  EditDescricaoTipoTipoServ.Text := '';
  EditSiglaTipoTipoServ.Text := '';
  if not vDadosIni.abreForm('Incluir origem do tipo de serviço', pnCadTipoServ, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
	  exit;

  TipoServ.TipoTipoServ.Insert;
  TipoServ.TipoTipoServ.fdata('descricao').Put(trim(FrmCadTipoServ.EditDescricaoTipoTipoServ.Text));
  TipoServ.TipoTipoServ.fdata('sigla').Put(trim(FrmCadTipoServ.EditSiglaTipoTipoServ.Text));
  if not TipoServ.TipoTipoServ.Post then
  	exit;

  TipoServ.LocTipoTipoServ.abreTipoTipoServ;
end;

procedure TFrmCadTipoServ.tipo_tipo_serv_del(Sender: TObject);
begin
	bt_modal_assume.Caption := 'Excluir';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  grid_modal.DataSource := TipoServ.TipoTipoServ._dataSourceOOP;
  if not vDadosIni.abreForm('Selecione a origem do tipo de serviço que deseja excluir', pn_modal, opFormsDefCad) then
    Exit;

  with TipoServ.TipoTipoServ do
	  if not Auditor.Processo('PRO432', fstr('descricao'), fstr('cod_tipo_servico')).Excluir.Permitido then
	    Exit;

  if not TipoServ.TipoTipoServ.Delete then
  	exit;

  TipoServ.LocTipoTipoServ.abreTipoTipoServ;
end;

procedure TFrmCadTipoServ.tipo_tipo_serv_edit(Sender: TObject);
begin
  bt_modal_assume.Caption := 'Selecionar';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  grid_modal.DataSource := TipoServ.TipoTipoServ._dataSourceOOP;
  if not vDadosIni.abreForm('Selecione a origem do tipo de serviço que deseja alterar', pn_modal, opFormsDefCad) then
    Exit;

  with TipoServ.TipoTipoServ do
    if not Auditor.Processo('PRO431', fstr('descricao'), fstr('cod_tipo_servico')).Alterar.Permitido then
        Exit;

  EditDescricaoTipoTipoServ.Enabled := False;
  EditSiglaTipoTipoServ.Enabled := False;
  Panel5.Enabled := False;

  EditDescricaoTipoTipoServ.Enabled := True;
  Panel5.Enabled := True;
  
  FrmCadTipoServ.EditDescricaoTipoTipoServ.Text := Trim(TipoServ.TipoTipoServ.fstr('descricao'));
  FrmCadTipoServ.EditSiglaTipoTipoServ.Text := Trim(TipoServ.TipoTipoServ.fstr('sigla'));
  if not vDadosIni.abreForm('Alterar a origem do tipo de serviço', FrmCadTipoServ.pnCadTipoServ, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
	  exit;

  if not TipoServ.TipoTipoServ.Edit then
    Exit;

  TipoServ.TipoTipoServ.fdata('descricao').Put(trim(FrmCadTipoServ.EditDescricaoTipoTipoServ.Text));
  TipoServ.TipoTipoServ.fdata('sigla').Put(trim(FrmCadTipoServ.EditSiglaTipoTipoServ.Text));
  if not TipoServ.TipoTipoServ.Post then
  	exit;

  TipoServ.LocTipoTipoServ.abreTipoTipoServ;
end;

end.

