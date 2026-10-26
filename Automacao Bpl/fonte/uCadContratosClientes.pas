unit uCadContratosClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, uEditHw, QRCtrls, QuickRpt, 
  UClassesClientes, CheckLst, DB, uFrameCheckListaContato;

type
  Tcl_cadCliente = function(ATipoForm: Integer): Boolean;
  
  TfrmCadContratosClientes = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    TabSheet4: TTabSheet;
    pnContratoRelatorios: TPanel;
    TabSheet5: TTabSheet;
    pnContratoHistorico: TPanel;
    GroupBox42: TGroupBox;
    DBGrid10: TDBGrid;
    Panel13: TPanel;
    BitBtn25: TBitBtn;
    BitBtn24: TBitBtn;
    TabSheet6: TTabSheet;
    pnEquip: TPanel;
    GroupBox43: TGroupBox;
    DBGrid11: TDBGrid;
    Panel15: TPanel;
    Label143: TLabel;
    Label144: TLabel;
    BitBtn19: TBitBtn;
    BitBtn30: TBitBtn;
    TabSheet7: TTabSheet;
    Panel14: TPanel;
    ScrollBox7: TScrollBox;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData4: TQRSysData;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape4: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape5: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel16: TQRLabel;
    QRLabel33: TQRLabel;
    DetailBand3: TQRBand;
    QRDBText14: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel52: TQRLabel;
    QRBand4: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    TabSheet8: TTabSheet;
    pnAjustarContrato: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    EditHw9: TEditHw;
    Label8: TLabel;
    BitBtn8: TBitBtn;
    DBGrid2: TDBGrid;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    BitBtn9: TBitBtn;
    groupAdicional: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    GroupBox5: TGroupBox;
    BitBtn7: TBitBtn;
    PageControl6: TPageControl;
    TabSheet9: TTabSheet;
    BitBtn29: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    TabSheet10: TTabSheet;
    Label159: TLabel;
    MaskEdit17: TMaskEdit;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    CheckBox6: TCheckBox;
    Panel4: TPanel;
    RadioGroup2: TRadioGroup;
    BitBtn41: TBitBtn;
    BitBtn10: TBitBtn;
    Label9: TLabel;
    tsAlterDadosLote: TTabSheet;
    pnAlteracaoEmLote: TPanel;
    GroupBoxAlteracaoEmLote: TGroupBox;
    Panel7: TPanel;
    btnOKAlteracaoEmLote: TBitBtn;
    btnCancelarAlteracaoEmLote: TBitBtn;
    pnControle: TPanel;
    lbControle: TLabel;
    EdControle: TEditHw;
    DBLControle: TDBLookupComboBox;
    ckControle: TCheckBox;
    pnVendedor: TPanel;
    lbVendedor: TLabel;
    EdVendedor: TEditHw;
    DBLVendedor: TDBLookupComboBox;
    ckVendedor: TCheckBox;
    pnDiaVencimento: TPanel;
    lbDiaVencimento: TLabel;
    EdDiaVencimento: TEditHw;
    ckDiaVencimento: TCheckBox;
    pnTipoOS: TPanel;
    lbTipoOS: TLabel;
    cbTipoOS: TComboBox;
    ckTipoOS: TCheckBox;
    pnGerarContratosAcada: TPanel;
    lbGerarContratosAcada: TLabel;
    lbGerarContratosAcada2: TLabel;
    EdGerarContratosAcada: TEditHw;
    ckGerarContratosAcada: TCheckBox;
    ckDataInicialBoleto2: TLabel;
    lbDataInicialBoleto: TLabel;
    meDataInicialBoleto: TMaskEdit;
    pnDataInicialBoleto: TPanel;
    ckDataInicialBoleto: TCheckBox;
    pnStatusContrato: TPanel;
    lbStatusContrato: TLabel;
    cbStatusContrato: TComboBox;
    ckStatusContrato: TCheckBox;
    pnDataInicialFinalContrato: TPanel;
    lbDataInicialFinalContrato2: TLabel;
    lbDataInicialContrato: TLabel;
    meDataInicialContrato: TMaskEdit;
    ckDataInicialFinalContrato: TCheckBox;
    Label11: TLabel;
    meDataFinalContrato: TMaskEdit;
    ckHabDataInicialBoleto: TCheckBox;
    pnOBS: TPanel;
    ckOBS: TCheckBox;
    lbOBS: TLabel;
    meOBS: TMemo;
    tsAlterDadosProc: TTabSheet;
    Panel52: TPanel;
    btVoltarDadosProc: TBitBtn;
    GroupBox79: TGroupBox;
    DBText57: TDBText;
    DBText58: TDBText;
    Label450: TLabel;
    DBText59: TDBText;
    Label453: TLabel;
    Label456: TLabel;
    DBText60: TDBText;
    Label10: TLabel;
    DBText1: TDBText;
    Label12: TLabel;
    Panel128: TPanel;
    pnCenterAlterDadosProd: TPanel;
    SpeedButtonAlterarProduto: TSpeedButton;
    SpeedButtonAlterarProduto2: TSpeedButton;
    btExcluirRegistro: TSpeedButton;
    ckPermOpcaoMarcadas: TCheckBox;
    SpeedButton55: TSpeedButton;
    tsSelecionaGradeProd: TTabSheet;
    ScrollBox5: TScrollBox;
    pnSelecionaGradeProd: TPanel;
    GroupBox7: TGroupBox;
    Panel19: TPanel;
    Label201: TLabel;
    Label202: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel20: TPanel;
    DBGrid3: TDBGrid;
    dsSelecionaGradeProd: TDataSource;
    Panel8: TPanel;
    Label135: TLabel;
    Bevel2: TBevel;
    Label137: TLabel;
    Label157: TLabel;
    LabelObsCtr: TLabel;
    Bevel1: TBevel;
    Label132: TLabel;
    Label133: TLabel;
    Label141: TLabel;
    Label158: TLabel;
    Label340: TLabel;
    Label6: TLabel;
    Label134: TLabel;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    CheckBox5: TCheckBox;
    MaskEdit16: TMaskEdit;
    MemoObsCtr: TMemo;
    EditHw2: TEditHw;
    DBLookupComboBox16: TDBLookupComboBox;
    EditHw3: TEditHw;
    ComboBox13: TComboBox;
    EditHw5: TEditHw;
    DBLookupComboBox19: TDBLookupComboBox;
    EditHw6: TEditHw;
    EditHw7: TEditHw;
    DBLookupComboBox1: TDBLookupComboBox;
    EditHw4: TEditHw;
    Edit1: TEdit;
    Label27: TLabel;
    EditHw1: TEditHw;
    EditHw8: TEditHw;
    Label28: TLabel;
    MemoObsReqOs: TMemo;
    Label29: TLabel;
    GroupBox6: TGroupBox;
    PageControl2: TPageControl;
    tsServicosCtrCons: TTabSheet;
    DBGridServCtr: TDBGrid;
    Panel12: TPanel;
    BitBtnServIncluir: TBitBtn;
    BitBtnServAlterar: TBitBtn;
    BitBtnServExcluir: TBitBtn;
    tsProdutosCtrCons: TTabSheet;
    DBGridProdCtr: TDBGrid;
    Panel11: TPanel;
    BitBtnProdIncluir: TBitBtn;
    BitBtnProdAlterar: TBitBtn;
    BitBtnProdExcluir: TBitBtn;
    tsServicosCtrCad: TTabSheet;
    pnCadServicosCtr: TPanel;
    tsProdutosCtrCad: TTabSheet;
    pnCadProdutosCtr: TPanel;
    GroupBoxOpcao: TGroupBox;
    ckNFS: TCheckBox;
    ckNF: TCheckBox;
    ckRecibo: TCheckBox;
    ckBoleto: TCheckBox;
    Label30: TLabel;
    Label31: TLabel;
    EditHw10: TEditHw;
    pnDiaFaturamento: TPanel;
    ckDiaFaturamento: TCheckBox;
    lbDiaFaturamento: TLabel;
    EdDiaFaturamento: TEditHw;
    Panel21: TPanel;
    Panel22: TPanel;
    Label33: TLabel;
    Panel23: TPanel;
    pnGerarNFS: TPanel;
    pnGerarNF: TPanel;
    pnGerarRecLoc: TPanel;
    pnGerarBoleto: TPanel;
    ckGerarNFS: TCheckBox;
    Label35: TLabel;
    cbGerarNFS: TComboBox;
    ckGerarNF: TCheckBox;
    cbGerarNF: TComboBox;
    Label36: TLabel;
    ckGerarRecLoc: TCheckBox;
    cbGerarRecLoc: TComboBox;
    Label37: TLabel;
    ckGerarBoleto: TCheckBox;
    Label41: TLabel;
    cbGerarBoleto: TComboBox;
    Label138: TLabel;
    ComboBox9: TComboBox;
    Bevel3: TBevel;
    Label156: TLabel;
    Label7: TLabel;
    Label136: TLabel;
    pnCadIncompleto: TPanel;
    Label32: TLabel;
    MaskEdit4: TMaskEdit;
    ckERP: TCheckBox;
    ckVindi: TCheckBox;
    pnVindi: TPanel;
    RadioGroup1: TRadioGroup;
    Panel24: TPanel;
    Label139: TLabel;
    ComboBox10: TComboBox;
    CheckBox4: TCheckBox;
    pnVindi2: TPanel;
    pnCadIncompleto2: TPanel;
    Label42: TLabel;
    EditHw11: TEditHw;
    pnDiasAposVencimento: TPanel;
    lbDiasAposVenc: TLabel;
    ckDiasAposVenc: TCheckBox;
    EdDiasAposVenc: TEditHw;
    Panel25: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label26: TLabel;
    EditHwCodServ: TEditHw;
    DBLookupComboBoxCodServ: TDBLookupComboBox;
    EditHwQtdeServ: TEditHw;
    EditHwValorUnServ: TEditHw;
    EditHwValorTotServ: TEditHw;
    Panel17: TPanel;
    BitBtnServOK: TBitBtn;
    BitBtnServCancel: TBitBtn;
    Panel26: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EditNumFabProd: TEdit;
    EditCodGradeProd: TEdit;
    EditDescricaoProd: TEdit;
    EditHwQtdeProd: TEditHw;
    EditHwValorUnProd: TEditHw;
    EditGrupoProd: TEdit;
    EditCodProd: TEdit;
    EditHwValorTotProd: TEditHw;
    Panel18: TPanel;
    BitBtnProdOK: TBitBtn;
    BitBtnProdCancel: TBitBtn;
    SpeedButton9: TSpeedButton;
    BitBtn12: TBitBtn;
    tabPedidoCompra: TTabSheet;
    lbNotasPedido: TLabel;
    lbxPedidos: TListBox;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    GroupBox9: TGroupBox;
    CheckListBox1: TCheckListBox;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    Panel27: TPanel;
    BitBtn11: TBitBtn;
    FrameCheckListaContato: TFrameCheckListaContato;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditHw9Change(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGridProdCtrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridServCtrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckDiasAposVencClick(Sender: TObject);
    procedure EditHw11Exit(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox9Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure EditHw3Exit(Sender: TObject);
    procedure ckGerarBoletoClick(Sender: TObject);
    procedure ckGerarRecLocClick(Sender: TObject);
    procedure ckGerarNFClick(Sender: TObject);
    procedure ckGerarNFSClick(Sender: TObject);
    procedure ckDiaFaturamentoClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure EditNumFabProdExit(Sender: TObject);
    procedure EditNumFabProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwValorUnProdExit(Sender: TObject);
    procedure EditHwQtdeProdExit(Sender: TObject);
    procedure EditHwValorUnServExit(Sender: TObject);
    procedure EditHwQtdeServExit(Sender: TObject);
    procedure BitBtnProdCancelClick(Sender: TObject);
    procedure BitBtnProdOKClick(Sender: TObject);
    procedure BitBtnServCancelClick(Sender: TObject);
    procedure BitBtnServOKClick(Sender: TObject);
    procedure BitBtnProdExcluirClick(Sender: TObject);
    procedure BitBtnProdAlterarClick(Sender: TObject);
    procedure BitBtnProdIncluirClick(Sender: TObject);
    procedure pnCadProdutosCtrEnter(Sender: TObject);
    procedure pnCadServicosCtrEnter(Sender: TObject);
    procedure BitBtnServExcluirClick(Sender: TObject);
    procedure BitBtnServAlterarClick(Sender: TObject);
    procedure BitBtnServIncluirClick(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure ckPermOpcaoMarcadasClick(Sender: TObject);
    procedure SpeedButtonAlterarProdutoClick(Sender: TObject);
    procedure btVoltarDadosProcClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButtonAlterarProduto2Click(Sender: TObject);
    procedure ckOBSClick(Sender: TObject);
    procedure DBLVendedorExit(Sender: TObject);
    procedure EdVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdVendedorExit(Sender: TObject);
    procedure DBLControleExit(Sender: TObject);
    procedure EdControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdControleExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnOKAlteracaoEmLoteClick(Sender: TObject);
    procedure btnCancelarAlteracaoEmLoteClick(Sender: TObject);
    procedure ckStatusContratoClick(Sender: TObject);
    procedure ckDataInicialBoletoClick(Sender: TObject);
    procedure meDataInicialBoletoExit(Sender: TObject);
    procedure meDataFinalContratoExit(Sender: TObject);
    procedure meDataInicialContratoExit(Sender: TObject);
    procedure ckDataInicialFinalContratoClick(Sender: TObject);
    procedure ckGerarContratosAcadaClick(Sender: TObject);
    procedure ckTipoOSClick(Sender: TObject);
    procedure ckDiaVencimentoClick(Sender: TObject);
    procedure ckVendedorClick(Sender: TObject);
    procedure ckControleClick(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox3Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid11TitleClick(Column: TColumn);
    procedure DBGrid10TitleClick(Column: TColumn);
    procedure groupAdicionalExit(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure EditHw9Exit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DBLookupComboBox19Exit(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure MaskEdit16Exit(Sender: TObject);
    procedure MaskEdit11Exit(Sender: TObject);
    procedure MaskEdit10Exit(Sender: TObject);
    procedure EditHw5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw5Exit(Sender: TObject);
    procedure DBLookupComboBox16Exit(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure DBLookupComboBoxCodServExit(Sender: TObject);
    procedure EditHwCodServKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwCodServExit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure EditHw7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw7Exit(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure pnContratoRelatoriosEnter(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDownServ(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDownProd(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyPressApenasNumeros(Sender: TObject; var Key: Char);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;
  private
  	vCaptionLote: string;
    pedidosCliente: PedidosComprasDoContrato; 
    vValorTemp, vValorTemp1: Currency;
    vValorTotTemp, vValorTotTemp1: Currency;
    vInc: Integer;
  public
    { Public declarations }
  end;

var
  frmCadContratosClientes: TfrmCadContratosClientes;
  Contratos: TContratosComClientes;
  vCodCliente: Integer;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;
  vCodTpServ: Integer;
  vNumFabProd: string;
  vGrupoProd: Integer;
  vCodProd: string;
  vCodGrade: Integer;
  vCodPlataforma: Integer;

implementation

uses  UDtmClientes, uDtmAtivo, uDataSet_OOP, uDadosIni, DateUtils, DBClient, 
  Math, funcoes;

{$R *.dfm}

procedure TfrmCadContratosClientes.BitBtn10Click(Sender: TObject);
begin
  inherited;
  QuickRep1.ReportTitle := 'Contratos entrando em vigência a partir de ' + FormatDateTime('dd/mm/yyyy', StrtoDate(MaskEdit17.Text)) + ' - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vValorTotTemp := 0;
  vValorTotTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
  	QRLabel22.Left := 69;
    QRLabel33.Left := 263;
    QRLabel23.Left := 456;
    QRLabel24.Left := 586;
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
  	QRLabel22.Left := -999;
    QRLabel33.Left := -999;
    QRLabel23.Left := -999;
    QRLabel24.Left := -999;
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Contratos.vSTATUS := ComboBox10.Text;
  Contratos.vDataBasePrGeradorOs := StrToDate(MaskEdit17.Text);
  Contratos.vAgruparRelatorio := RadioGroup1.ItemIndex;
  Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;
  
  Contratos._getDadosRelatorio(9);

  QuickRep1.Preview;
end;

procedure TfrmCadContratosClientes.BitBtn11Click(Sender: TObject);
begin
  TForm(pnSelecionaGradeProd.Parent).ModalResult := IDOK;	
end;

procedure TfrmCadContratosClientes.BitBtn12Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  if Assigned(pedidosCliente) then
    FreeAndNil(pedidosCliente);

  pedidosCliente := Contratos.vProdCtr.GetPedidos( EditHw7.AsInteger );

  lbxPedidos.Clear;
  for I := 0 to pedidosCliente.Count - 1 do
  begin
    lbxPedidos.Items.AddObject(Format('%s - N° %s - Item %d - Qtde Pedido %0.3f - Qtde Atendida %0.3f - Id: [%d]',
      [ DateToStr(pedidosCliente.Items[i].DataPedido), pedidosCliente.Items[i].Numero, pedidosCliente.Items[i].NumItem, pedidosCliente.Items[i].QtdePed, pedidosCliente.Items[i].QtdeEnv, pedidosCliente.Items[i].Codigo ]), pedidosCliente.Items[i]);
  end;

  PageControl2.ActivePage := tabPedidoCompra;
end;

procedure TfrmCadContratosClientes.BitBtn19Click(Sender: TObject);
begin
  TForm(pnEquip.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContratosClientes.BitBtn1Click(Sender: TObject);
var
  I: Integer;
  vTemp: string;
begin
  try
    if vDadosIni.PesqPros('CLI206', 'PESQUISAR', '', 'CLIENTES_COM_CONTRATO', '',
      Contratos.buscas, true) then
    begin
      inherited;
      Screen.Cursor := crHourGlass;
      
      Contratos.rContratos.vCampo := ComboBox1.Text;
      Contratos.rContratos.vCondicao := ComboBox3.Text;
      Contratos.rContratos.vValor := trim(MaskEdit3.Text);
      Contratos.rContratos.vCampoAd := ComboBox11.Text;
      Contratos.rContratos.vValorAd := trim(MaskEdit7.Text);
      Contratos.rContratos.vDataIniAd := MaskEdit9.Text;
      Contratos.rContratos.vDataFimAd := MaskEdit8.Text;
      Contratos.rContratos.vCondicaoAd := ComboBox12.Text;
      Contratos.rContratos.vPorDataAd := MaskEdit9.Visible;
      Contratos.rContratos.vAdicional := CheckBox1.Checked;
      Contratos.rContratos.avancada := CheckBox3.Checked;

      if CheckListBox1.Items.Count > 0 then
      begin
      	Contratos.rContratos.vListaStatus := '';
        for I := 0 to CheckListBox1.Items.Count - 1 do
        begin
        	if CheckListBox1.Checked[I] then
        		Contratos.rContratos.vListaStatus := Contratos.rContratos.vListaStatus +
              vDadosIni.IfThen(trim(Contratos.rContratos.vListaStatus) <> '', ', ', '') +
            	QuotedStr(CheckListBox1.Items[I]);
        end;
      end;

      Contratos.rContratos.vERP := ckERP.Checked;
      Contratos.rContratos.vPagOnline := ckVindi.Checked;
      Contratos._defineSqlAdicional;

      if MaskEdit2.Visible then
      begin
        if not Contratos.ConsultaCampos('CLIENTES_COM_CONTRATO', ComboBox1.Text,
          'CLIENTES_COM_CONTRATO.COD_CONTRATO', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
          ' CLIENTES_COM_CONTRATO.*, CONTROLES.NOME_CTRL, COALESCE(CONTROLES.USAR_BOLETO, ''N'') AS USAR_BOLETO, ' +
          '	COLABORADOR.NOME_VENDEDOR, TIPO_SERVICO.DESC_SERVICO, ' +
          '	CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CPFCGC, CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
          ' CLIENTES.CODIGO_UF, ESTADOS.SIGLA_UF, ' +
          ' CLIENTES.COD_BAIRRO, CIDADES.NOME_CIDADE, ' +
          ' CLIENTES.COD_CIDADE, BAIRROS.NOME_BAIRRO, ' +
          ' CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE ',
          ' INNER JOIN CLIENTES ON CLIENTES_COM_CONTRATO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES_COM_CONTRATO.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
          ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
          ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
          ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
          ' INNER JOIN COLABORADOR ON CLIENTES_COM_CONTRATO.COD_VENDEDOR = COLABORADOR.COD_VENDEDOR AND CLIENTES_COM_CONTRATO.COD_EMPRESA = COLABORADOR.COD_EMPRESA ' +
          ' LEFT JOIN CONTROLES ON CLIENTES_COM_CONTRATO.COD_CONTROLE = CONTROLES.CODIGO_CTRL AND CLIENTES_COM_CONTRATO.COD_EMPRESA = CONTROLES.CODIGO_EMP ' +
          ' LEFT JOIN TIPO_SERVICO ON CLIENTES_COM_CONTRATO.COD_SERVICO = TIPO_SERVICO.COD_SERVICO AND ((TIPO_SERVICO.COD_EMPRESA IS NULL) OR (TIPO_SERVICO.COD_EMPRESA = '+ vDadosIni.CodEmpresa + ')) ',
          Contratos.rContratos.vSqlAdicional) then
          if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
          	combobox1.setfocus
      end
      else
        if not Contratos.ConsultaCampos('CLIENTES_COM_CONTRATO', Contratos.rContratos.vValor, ComboBox1.Text,
          combobox3.Text, 'CLIENTES_COM_CONTRATO.COD_CONTRATO', true, vDadosIni.codEmpresa,
          ' CLIENTES_COM_CONTRATO.*, CONTROLES.NOME_CTRL, COALESCE(CONTROLES.USAR_BOLETO, ''N'') AS USAR_BOLETO, ' +
          ' COLABORADOR.NOME_VENDEDOR, TIPO_SERVICO.DESC_SERVICO, ' +
          ' CLIENTES.NOME_CLIENTE,CLIENTES.RAZAO, CLIENTES.CPFCGC, CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
          ' CLIENTES.CODIGO_UF, ESTADOS.SIGLA_UF, ' +
          ' CLIENTES.COD_BAIRRO, CIDADES.NOME_CIDADE, ' +
          ' CLIENTES.COD_CIDADE, BAIRROS.NOME_BAIRRO, ' +
          ' CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE ',
          ' INNER JOIN CLIENTES ON CLIENTES_COM_CONTRATO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES_COM_CONTRATO.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
          ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
          ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
          ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
          ' INNER JOIN COLABORADOR ON CLIENTES_COM_CONTRATO.COD_VENDEDOR = COLABORADOR.COD_VENDEDOR AND CLIENTES_COM_CONTRATO.COD_EMPRESA = COLABORADOR.COD_EMPRESA ' +
          ' LEFT JOIN CONTROLES ON CLIENTES_COM_CONTRATO.COD_CONTROLE = CONTROLES.CODIGO_CTRL AND CLIENTES_COM_CONTRATO.COD_EMPRESA = CONTROLES.CODIGO_EMP ' +
          ' LEFT JOIN TIPO_SERVICO ON CLIENTES_COM_CONTRATO.COD_SERVICO = TIPO_SERVICO.COD_SERVICO AND ((TIPO_SERVICO.COD_EMPRESA IS NULL) OR (TIPO_SERVICO.COD_EMPRESA = '+ vDadosIni.CodEmpresa + ')) ',
          Contratos.rContratos.vSqlAdicional) then
          	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
          		ComboBox1.SetFocus;

      if Contratos.dataSet.Active then
        for I := 0 to DBGrid1.Columns.Count - 1 do
          if DBGrid1.Columns[i].FieldName = 'OBS' then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      	DBGrid1.SetFocus;
    end;
  finally
  	gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContratosClientes.BitBtn24Click(Sender: TObject);
begin
  TForm(pnContratoHistorico.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContratosClientes.BitBtn25Click(Sender: TObject);
begin
  Contratos._detalhesFormaDePagamento;
end;

procedure TfrmCadContratosClientes.BitBtn26Click(Sender: TObject);
begin
  QuickRep1.ReportTitle := 'Contratos vencidos - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vValorTotTemp := 0;
  vValorTotTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
  	QRLabel22.Left := 69;
    QRLabel33.Left := 263;
    QRLabel23.Left := 456;
    QRLabel24.Left := 586;
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 106;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 104;
  end
  else
  begin
  	QRLabel22.Left := -999;
    QRLabel33.Left := -999;
    QRLabel23.Left := -999;
    QRLabel24.Left := -999;
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 106 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 104 - 18;
  end;

  Contratos.vSTATUS := ComboBox10.Text;
  Contratos.vAgruparRelatorio := RadioGroup1.ItemIndex;
  Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;

  Contratos._getDadosRelatorio(2);

  QuickRep1.Preview;
end;

procedure TfrmCadContratosClientes.BitBtn27Click(Sender: TObject);
begin
  QuickRep1.ReportTitle := 'Contratos vencendo no próximo mês - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vValorTotTemp := 0;
  vValorTotTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
  	QRLabel22.Left := 69;
    QRLabel33.Left := 263;
    QRLabel23.Left := 456;
    QRLabel24.Left := 586;
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
  	QRLabel22.Left := -999;
    QRLabel33.Left := -999;
    QRLabel23.Left := -999;
    QRLabel24.Left := -999;
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Contratos.vSTATUS := ComboBox10.Text;
  Contratos.vAgruparRelatorio := RadioGroup1.ItemIndex;
  Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;

  Contratos._getDadosRelatorio(3);

  QuickRep1.Preview;
end;

procedure TfrmCadContratosClientes.BitBtn28Click(Sender: TObject);
begin
	_GravaConfiguracoesString(ComboBox10.Name, ComboBox10.Text);

  TForm(pnContratoRelatorios.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContratosClientes.BitBtn29Click(Sender: TObject);
begin
  QuickRep1.ReportTitle := 'Posição dos Contratos - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vValorTotTemp := 0;
  vValorTotTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
  	QRLabel22.Left := 69;
    QRLabel33.Left := 263;
    QRLabel23.Left := 456;
    QRLabel24.Left := 586;
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
  	QRLabel22.Left := -999;
    QRLabel33.Left := -999;
    QRLabel23.Left := -999;
    QRLabel24.Left := -999;
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Contratos.vSTATUS := ComboBox10.Text;
  Contratos.vAgruparRelatorio := RadioGroup1.ItemIndex;
  Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;

  Contratos._getDadosRelatorio(1);

  QuickRep1.Preview;
end;

procedure TfrmCadContratosClientes.BitBtn30Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    Contratos.vSoma := 0;
    Contratos._abrirEquipamentos;

    Contratos.buscas.First;
    while not Contratos.buscas.Eof do
    begin
       if DBGrid11.SelectedRows.CurrentRowSelected then
        Contratos.vSoma := Contratos.vSoma + Contratos.buscas.FieldByName('valor').AsFloat;
      Contratos.buscas.Next;
    end;

    Label144.Caption := Format('%0.2f', [Contratos.vSoma]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContratosClientes.BitBtn38Click(Sender: TObject);
begin
  QuickRep1.ReportTitle := 'Contratos a serem gerados - ' + 'Ativo';
  vValorTemp := 0;
  vValorTemp1 := 0;
  vValorTotTemp := 0;
  vValorTotTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
  	QRLabel22.Left := 69;
    QRLabel33.Left := 263;
    QRLabel23.Left := 456;
    QRLabel24.Left := 586;
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
  	QRLabel22.Left := -999;
    QRLabel33.Left := -999;
    QRLabel23.Left := -999;
    QRLabel24.Left := -999;
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Contratos.vDataBasePrGeradorOs := StrToDate(MaskEdit17.Text);
  Contratos.vSTATUS := 'Ativo';
  Contratos.vAgruparRelatorio := RadioGroup1.ItemIndex;
  Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;
  
  if not CheckBox6.Checked then
    Contratos._getDadosRelatorio(4)
  else
    Contratos._getDadosRelatorio(6);

  QuickRep1.Preview;
end;

procedure TfrmCadContratosClientes.BitBtn39Click(Sender: TObject);
begin
  QuickRep1.ReportTitle := 'Contratos não gerados';
  vValorTemp := 0;
  vValorTemp1 := 0;
  vValorTotTemp := 0;
  vValorTotTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
  	QRLabel22.Left := 69;
    QRLabel33.Left := 263;
    QRLabel23.Left := 456;
    QRLabel24.Left := 586;
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
  	QRLabel22.Left := -999;
    QRLabel33.Left := -999;
    QRLabel23.Left := -999;
    QRLabel24.Left := -999;
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Contratos.vDataBasePrGeradorOs := StrToDate(MaskEdit17.Text);
  Contratos.vSTATUS := 'Ativo';
  Contratos.vAgruparRelatorio := RadioGroup1.ItemIndex;
  Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;
  
  if not CheckBox6.Checked then
    Contratos._getDadosRelatorio(5)
  else
    Contratos._getDadosRelatorio(8);

  QuickRep1.Preview;
end;

procedure TfrmCadContratosClientes.BitBtn3Click(Sender: TObject);
var
	I, J: Integer;
  vLista, vLista2: TStrings;
begin
  try
    inherited;
    Contratos._cancelar;
    Contratos.vDATA_INICIAL_VIGENCIA := Date;
    MaskEdit16.Enabled := false;
    CheckBox5.Enabled := false;
    CheckBox5.Checked := false;

    try
      vLista := TStringList.Create;
      vLista2 := TStringList.Create;

      vLista := vDadosIni.getConfSisBlob('contratos_clientes_status_contratos', Contratos.buscas);
      if vLista.Count > 0 then
      begin
        ComboBox9.Items.Clear;
        for I := 0 to vLista.Count - 1 do
        begin
          vLista2 := vDadosIni.SplitS(vLista[i]);
          for J := 0 to vLista2.Count - 1 do
          begin
            if trim(vLista2[j]) <> '' then
              if ComboBox9.Items.IndexOf(trim(vLista2[j])) = -1 then
                ComboBox9.Items.Add(trim(vLista2[j]));
          end;
        end;

        if ComboBox9.Items.IndexOf('Ativo') = -1 then
          ComboBox9.Items.Add('Ativo');
      end;
    finally
      if Assigned(vLista) then
      	FreeAndNil(vLista);
      if Assigned(vLista2) then
      	FreeAndNil(vLista2);
    end;

    GroupBox4.Caption := 'Incluindo contrato';
    Contratos.vServCtr.abreServCtr(0);
    Contratos.vProdCtr.abreProdCtr(0);
    Contratos.vAplicativo.abreAplicativoMens;
    Contratos.vMODO := 'INSERIR';
    Contratos.vDESCR_CONTRATO := '';
    Contratos.vCOD_CONTRATO := 0;
    Contratos.vCodClienteOld := 0;
    Contratos.abreClientes(0);

    MemoObsReqOs.Clear;

    FrameCheckListaContato.Visible := False;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    PageControl2.ActivePage := tsServicosCtrCons;

    if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
      Edit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditHw7.CanFocus) then
    	EditHw7.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
      EditHw2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      Contratos.Cancel;
      Contratos.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadContratosClientes.BitBtn40Click(Sender: TObject);
begin
  _GravaConfiguracoesString(ComboBox10.Name, ComboBox10.Text);

  TForm(pnContratoRelatorios.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContratosClientes.BitBtn41Click(Sender: TObject);
begin                         
  QuickRep1.ReportTitle := 'Contratos entrando em vigência entre ' +
  	FormatDateTime('dd/mm/yyyy', StartOfTheMonth(StrtoDate(MaskEdit17.Text))) +
    ' e ' + FormatDateTime('dd/mm/yyyy', EndOfTheMonth(StrtoDate(MaskEdit17.Text))) +
    ' - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vValorTotTemp := 0;
  vValorTotTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
  	QRLabel22.Left := 69;
    QRLabel33.Left := 263;
    QRLabel23.Left := 456;
    QRLabel24.Left := 586;
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
  	QRLabel22.Left := -999;
    QRLabel33.Left := -999;
    QRLabel23.Left := -999;
    QRLabel24.Left := -999;
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Contratos.vSTATUS := ComboBox10.Text;
  Contratos.vDataBasePrGeradorOs := StrToDate(MaskEdit17.Text);
  Contratos.vAgruparRelatorio := RadioGroup1.ItemIndex;
  Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;

  Contratos._getDadosRelatorio(7);

  QuickRep1.Preview;
end;

procedure TfrmCadContratosClientes.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;

  Contratos.vDESCR_CONTRATO := UpperCase(trim(Edit1.Text));

  Contratos.vCOD_CLIENTE := EditHw7.AsInteger;

  Contratos.vCOD_CONTROLE := EditHw2.AsInteger;

  Contratos.vCOD_COLABORADOR := EditHw5.AsInteger;

  if Contratos.dataSet.FieldByName('ASSINATURA_VINDI_ID').AsInteger > 0 then
  	Contratos.vDIAS_APOS_VENC := 0
  else
  	Contratos.vDIAS_APOS_VENC := EditHw11.AsInteger;

  if Contratos.vDIAS_APOS_VENC > 0 then
  	Contratos.vDIA_VENCIMENTO := 0
  else
  	Contratos.vDIA_VENCIMENTO := EditHw3.AsInteger;

  Contratos.vDIA_FATURAMENTO := EditHw10.AsInteger;

  Contratos.vVALOR_CONTRATO := EditHw4.AsValue;

  Contratos.vVALOR_SERV := EditHw1.AsValue;

  Contratos.vVALOR_PROD := EditHw8.AsValue;

  Contratos.vCONTRATOS_CADA_MES := EditHw6.AsInteger;

  Contratos.vSTATUS := ComboBox9.Text;

  Contratos.vTIPO_OS := UpperCase(trim(ComboBox13.Text));

  Contratos.vDATA_IMPRESSAO_BOLETO := CheckBox5.Checked;

  if vDadosIni.apenasNumeros(MaskEdit10.Text) = '' then
    Contratos.vDATA_INICIAL_VIGENCIA := 0
  else
    Contratos.vDATA_INICIAL_VIGENCIA := StrToDate(MaskEdit10.Text);

  if vDadosIni.apenasNumeros(MaskEdit11.Text) = '' then
    Contratos.vDATA_FINAL_VIGENCIA := 0
  else
    Contratos.vDATA_FINAL_VIGENCIA := StrToDate(MaskEdit11.Text);

  if vDadosIni.apenasNumeros(MaskEdit16.Text) = '' then
    Contratos.vDATA_IMPRESSAOBOL_INICIAL := 0
  else
    Contratos.vDATA_IMPRESSAOBOL_INICIAL := StrToDate(MaskEdit16.Text);

  if vDadosIni.apenasNumeros(MaskEdit4.Text) = '' then
  	Contratos.vDATA_CANCELAMENTO := 0
  else
  	Contratos.vDATA_CANCELAMENTO := StrToDate(MaskEdit4.Text);

  Contratos.vOBS := trim(MemoOBSCtr.Text);
  Contratos.vGerarNFS    := vDadosIni.IfThen(ckNFS.Checked, 'S', 'N');
  Contratos.vGerarNF     := vDadosIni.IfThen(ckNF.Checked, 'S', 'N');
  Contratos.vGerarRecLoc := vDadosIni.IfThen(ckRecibo.Checked, 'S', 'N');
  Contratos.vGerarBoleto := vDadosIni.IfThen(ckBoleto.Checked, 'S', 'N');

  if not Contratos._salvarDadosContrato then
  	 setFocusCampoErro(Contratos.vNomeCampoErro, Contratos.vMensagemErro)
  else
  begin
  	if (TelaCadastro = 5) then
    begin
    	PageControl1.ActivePage := tsAlterDadosProc;
      tsAlterDadosProc.Show;
      exit;
    end
    else if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if Contratos.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        Contratos._cancelar;
        MaskEdit16.Enabled := false;
        CheckBox5.Enabled := false;
        CheckBox5.Checked := false;
        Contratos.vMODO := 'INSERIR';
        Contratos.abreClientes(0);
        if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
          Edit1.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (EditHw7.CanFocus) then
          EditHw7.SetFocus;
      end;
    end
    else
    begin
      if TelaCadastro = 7 then
	     TelaCadastro := 0;
      inherited;
    end;

  end;
end;

procedure TfrmCadContratosClientes.BitBtn5Click(Sender: TObject);
begin
  if TelaCadastro = 7 then
	  TelaCadastro := 0;
  Contratos._cancelar;
  Contratos.Cancel;
  Contratos.RollBackTransacao;
  Contratos.Refresh;
  if (TelaCadastro = 5) then
  begin
  	PageControl1.ActivePage := tsAlterDadosProc;
    tsAlterDadosProc.Show;
    exit;
  end;
  inherited;
end;

procedure TfrmCadContratosClientes.BitBtn7Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGrid10, 'Histórico de Contratos do Cliente');
end;

procedure TfrmCadContratosClientes.BitBtn8Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
      BitBtn8.SetFocus;
    BitBtn8.Enabled := false;
    BitBtn9.Enabled := false;
    if not Contratos.confirmarAjusteContratos then
      exit;
    TForm(pnAjustarContrato.Parent).ModalResult := IDOK;
    Contratos.Refresh;
  finally
    Screen.Cursor := crDefault;
    BitBtn8.Enabled := true;
    BitBtn9.Enabled := true;
  end;
end;

procedure TfrmCadContratosClientes.BitBtn9Click(Sender: TObject);
begin
  TForm(pnAjustarContrato.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContratosClientes.BitBtnProdAlterarClick(Sender: TObject);
begin
  if Contratos.vProdCtr.IsEmpty then
    exit;

  EditNumFabProd.Enabled     := False;
  EditNumFabProd.Color       := cl3DLight;

  vDadosIni.vInibeMensPesqPros := 'S';
  EditHwValorUnProd.Enabled  := vDadosIni.PesqPros('CLI291', 'HABILITAR', '', 'CLIENTES_COM_CONTRATO', '', Contratos.buscas, False);
  if EditHwValorUnProd.Enabled then
  	EditHwValorUnProd.Color  := clWindow
  else
  	EditHwValorUnProd.Color  := cl3DLight;

  EditNumFabProd.Text        := trim(Contratos.vProdCtr.dataSet.FieldByName('num_fab_prod').AsString);
  EditGrupoProd.Text         := IntToStr(Contratos.vProdCtr.dataSet.FieldByName('grupo_prod').AsInteger);
  EditCodProd.Text           := trim(Contratos.vProdCtr.dataSet.FieldByName('cod_prod').AsString);
  EditCodGradeProd.Text      := IntToStr(Contratos.vProdCtr.dataSet.FieldByName('cod_grade').AsInteger);
  EditDescricaoProd.Text     := trim(Contratos.vProdCtr.dataSet.FieldByName('descr_prod').AsString);
  EditHwQtdeProd.AsValue     := Contratos.vProdCtr.dataSet.FieldByName('qtde').AsFloat;
  EditHwValorUnProd.AsValue  := Contratos.vProdCtr.dataSet.FieldByName('valor_un').AsFloat;
  EditHwValorTotProd.AsValue := Contratos.vProdCtr.dataSet.FieldByName('valor_tot').AsFloat;

  if not vDadosIni.PesqPros('CLI287', 'ALTERAR',
  	'Ctr ' + IntToStr(Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger),
    'CLIENTES_COM_CONTRATO_PROD',
    IntToStr(Contratos.vProdCtr.dataSet.FieldByName('COD_CONTRATO_PROD').AsInteger), Contratos.buscas, true) then
    exit;

  vNumFabProd := trim(Contratos.vProdCtr.dataSet.FieldByName('NUM_FAB_PROD').AsString);
  vGrupoProd  := Contratos.vProdCtr.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  vCodProd    := Contratos.vProdCtr.dataSet.FieldByName('COD_PROD').AsString;
  vCodGrade   := Contratos.vProdCtr.dataSet.FieldByName('COD_GRADE').AsInteger;

  Contratos.vProdCtr.vMODO              := 'EDITAR';
  Contratos.vProdCtr.vCOD_CONTRATO      := Contratos.vProdCtr.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  Contratos.vProdCtr.vCOD_CONTRATO_PROD := Contratos.vProdCtr.dataSet.FieldByName('COD_CONTRATO_PROD').AsInteger;
  if not Contratos._abreFormProdIncluir then
    exit;
end;

procedure TfrmCadContratosClientes.BitBtnProdCancelClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtnProdCancel.CanFocus) then
  	BitBtnProdCancel.SetFocus;

	Contratos.vProdCtr.Cancel;
  Contratos.vProdCtr.RollBackTransacao;
  
  TForm(pnCadProdutosCtr.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContratosClientes.BitBtnProdExcluirClick(Sender: TObject);
begin
  if Contratos.vProdCtr.IsEmpty then
    exit;

  Contratos.vProdCtr.vMODO              := 'DELETAR';
  Contratos.vProdCtr.vCOD_CONTRATO      := Contratos.vProdCtr.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  Contratos.vProdCtr.vCOD_CONTRATO_PROD := Contratos.vProdCtr.dataSet.FieldByName('COD_CONTRATO_PROD').AsInteger;

  if not Contratos.vProdCtr.Delete(Contratos) then
    exit;

  Contratos.atribuirValorContrato;
  EditHw4.AsValue := Contratos.vVALOR_CONTRATO;
  EditHw1.AsValue := Contratos.vVALOR_SERV;
  EditHw8.AsValue := Contratos.vVALOR_PROD;
end;

procedure TfrmCadContratosClientes.BitBtnProdIncluirClick(Sender: TObject);
begin
	EditNumFabProd.Enabled     := True;
  EditNumFabProd.Color       := clWindow;

  vDadosIni.vInibeMensPesqPros := 'S';
  EditHwValorUnProd.Enabled  := vDadosIni.PesqPros('CLI291', 'HABILITAR', '', 'CLIENTES_COM_CONTRATO', '', Contratos.buscas, False);
  if EditHwValorUnProd.Enabled then
  	EditHwValorUnProd.Color  := clWindow
  else
  	EditHwValorUnProd.Color  := cl3DLight;

  EditGrupoProd.Text         := '';
  EditCodProd.Text           := '';
	EditNumFabProd.Text        := '';
  EditCodGradeProd.Text      := '';
  EditDescricaoProd.Text     := '';
  EditHwQtdeProd.AsValue     := 0;
  EditHwValorUnProd.AsValue  := 0;
  EditHwValorTotProd.AsValue := 0;

  if Contratos.vCOD_CONTRATO <= 0 then
  begin
  	if Application.MessageBox(PChar('Favor salvar o contrato antes de continuar, deseja salvar?'),
    	'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
        exit;

    Contratos.vDESCR_CONTRATO := trim(Edit1.Text);

  	Contratos.vCOD_CLIENTE := EditHw7.AsInteger;

    Contratos.vCOD_CONTROLE := EditHw2.AsInteger;

    Contratos.vCOD_COLABORADOR := EditHw5.AsInteger;

    if Contratos.dataSet.FieldByName('ASSINATURA_VINDI_ID').AsInteger > 0 then
    	Contratos.vDIAS_APOS_VENC := 0
    else
  	  Contratos.vDIAS_APOS_VENC := EditHw11.AsInteger;

    if Contratos.vDIAS_APOS_VENC > 0 then
      Contratos.vDIA_VENCIMENTO := 0
    else
      Contratos.vDIA_VENCIMENTO := EditHw3.AsInteger;

    Contratos.vDIA_FATURAMENTO := EditHw10.AsInteger;

    Contratos.vVALOR_CONTRATO := EditHw4.AsValue;

    Contratos.vVALOR_SERV := EditHw1.AsValue;

    Contratos.vVALOR_PROD := EditHw8.AsValue;

    Contratos.vCONTRATOS_CADA_MES := EditHw6.AsInteger;

    Contratos.vSTATUS := ComboBox9.Text;

    Contratos.vTIPO_OS := ComboBox13.Text;

    Contratos.vDATA_IMPRESSAO_BOLETO := CheckBox5.Checked;

    if vDadosIni.apenasNumeros(MaskEdit10.Text) = '' then
      Contratos.vDATA_INICIAL_VIGENCIA := 0
    else
      Contratos.vDATA_INICIAL_VIGENCIA := StrToDate(MaskEdit10.Text);

    if vDadosIni.apenasNumeros(MaskEdit11.Text) = '' then
      Contratos.vDATA_FINAL_VIGENCIA := 0
    else
      Contratos.vDATA_FINAL_VIGENCIA := StrToDate(MaskEdit11.Text);

    if vDadosIni.apenasNumeros(MaskEdit16.Text) = '' then
      Contratos.vDATA_IMPRESSAOBOL_INICIAL := 0
    else
      Contratos.vDATA_IMPRESSAOBOL_INICIAL := StrToDate(MaskEdit16.Text);

    if vDadosIni.apenasNumeros(MaskEdit4.Text) = '' then
      Contratos.vDATA_CANCELAMENTO := 0
    else
      Contratos.vDATA_CANCELAMENTO := StrToDate(MaskEdit4.Text);

    Contratos.vOBS := trim(MemoOBSCtr.Text);

    if not Contratos._salvarDadosContrato then
    begin
    	setFocusCampoErro(Contratos.vNomeCampoErro, Contratos.vMensagemErro);
      exit;
    end;

    Contratos.vMODO := 'ALTERAR';
    Contratos.vCOD_CONTRATO := Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  end;

  if not vDadosIni.PesqPros('CLI286', 'INCLUIR',
  	'Ctr ' + IntToStr(Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger),
    'CLIENTES_COM_CONTRATO_PROD',
    '', Contratos.buscas, true) then
    exit;

  vNumFabProd := '';
  vGrupoProd  := 0;
  vCodProd    := '';
  vCodGrade   := 0;

  Contratos.vProdCtr.vMODO              := 'INSERIR';
  Contratos.vProdCtr.vCOD_CONTRATO      := Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  Contratos.vProdCtr.vCOD_CONTRATO_PROD := 0;
  if not Contratos._abreFormProdIncluir then
    exit;
end;

procedure TfrmCadContratosClientes.BitBtnProdOKClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtnProdOK.CanFocus) then
    BitBtnProdOK.SetFocus;

  Contratos.vProdCtr.vCOD_CONTRATO := Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger;

  Contratos.vProdCtr.vGRUPO_PROD  :=
  	StrToInt(vDadosIni.IfThen(trim(EditGrupoProd.Text) <> '', trim(EditGrupoProd.Text), '0'));

  Contratos.vProdCtr.vCOD_PROD    :=
  	trim(EditCodProd.Text);

	Contratos.vProdCtr.vCOD_GRADE   :=
  	StrToInt(vDadosIni.IfThen(trim(EditCodGradeProd.Text) <> '', trim(EditCodGradeProd.Text), '0'));

  Contratos.vProdCtr.vDESCR_PROD  :=
  	trim(EditDescricaoProd.Text);

  Contratos.vProdCtr.vQTDE        :=
  	EditHwQtdeProd.AsValue;

  Contratos.vProdCtr.vVALOR_UN    :=
  	EditHwValorUnProd.AsValue;

	if not Contratos.vProdCtr.Post(Contratos) then
  begin
  	setFocusCampoErro(Contratos.vProdCtr.vNomeCampoErro, Contratos.vProdCtr.vMensagemErro);
    exit;
  end;

  Contratos.atribuirValorContrato;
  EditHw4.AsValue := Contratos.vVALOR_CONTRATO;
  EditHw1.AsValue := Contratos.vVALOR_SERV;
  EditHw8.AsValue := Contratos.vVALOR_PROD;

  TForm(pnCadProdutosCtr.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContratosClientes.BitBtnServAlterarClick(Sender: TObject);
begin
	if Contratos.vServCtr.IsEmpty then
    exit;

  EditHwCodServ.Enabled            := False;
  DBLookupComboBoxCodServ.Enabled  := False;
  EditHwCodServ.Color              := cl3DLight;
  DBLookupComboBoxCodServ.Color    := cl3DLight;

  vDadosIni.vInibeMensPesqPros := 'S';
  EditHwValorUnServ.Enabled        := vDadosIni.PesqPros('CLI290', 'HABILITAR', '', 'CLIENTES_COM_CONTRATO', '', Contratos.buscas, False);
  if EditHwValorUnServ.Enabled then
  	EditHwValorUnServ.Color        := clWindow
  else
  	EditHwValorUnServ.Color        := cl3DLight;

  EditHwCodServ.AsValue            := Contratos.vServCtr.dataSet.FieldByName('cod_servico').AsInteger;
  DBLookupComboBoxCodServ.KeyValue := Contratos.vServCtr.dataSet.FieldByName('cod_servico').AsInteger;
  EditHwQtdeServ.AsValue           := Contratos.vServCtr.dataSet.FieldByName('qtde').AsFloat;
  EditHwValorUnServ.AsValue        := Contratos.vServCtr.dataSet.FieldByName('valor_un').AsFloat;
  EditHwValorTotServ.AsValue       := Contratos.vServCtr.dataSet.FieldByName('valor_tot').AsFloat;

  if not vDadosIni.PesqPros('CLI283', 'ALTERAR',
  	'Ctr ' + IntToStr(Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger),
    'CLIENTES_COM_CONTRATO_SERV',
  	IntToStr(Contratos.vServCtr.dataSet.FieldByName('COD_CONTRATO_SERV').AsInteger), Contratos.buscas, true) then
    exit;

  vCodTpServ := Contratos.vServCtr.dataSet.FieldByName('COD_SERVICO').AsInteger;

  Contratos.vServCtr.vMODO              := 'EDITAR';
  Contratos.vServCtr.vCOD_CONTRATO      := Contratos.vServCtr.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  Contratos.vServCtr.vCOD_CONTRATO_SERV := Contratos.vServCtr.dataSet.FieldByName('COD_CONTRATO_SERV').AsInteger;
	if not Contratos._abreFormServIncluir then
    exit;
end;

procedure TfrmCadContratosClientes.BitBtnServCancelClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtnServCancel.CanFocus) then
  	BitBtnServCancel.SetFocus;

	Contratos.vServCtr.Cancel;
  Contratos.vServCtr.RollBackTransacao;

  TForm(pnCadServicosCtr.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContratosClientes.BitBtnServExcluirClick(Sender: TObject);
begin
	if Contratos.vServCtr.IsEmpty then
    exit;

  Contratos.vServCtr.vMODO              := 'DELETAR';
  Contratos.vServCtr.vCOD_CONTRATO      := Contratos.vServCtr.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  Contratos.vServCtr.vCOD_CONTRATO_SERV := Contratos.vServCtr.dataSet.FieldByName('COD_CONTRATO_SERV').AsInteger;

  if not Contratos.vServCtr.Delete(Contratos) then
    exit;

  Contratos.atribuirValorContrato;
  EditHw4.AsValue := Contratos.vVALOR_CONTRATO;
  EditHw1.AsValue := Contratos.vVALOR_SERV;
  EditHw8.AsValue := Contratos.vVALOR_PROD;
end;

procedure TfrmCadContratosClientes.BitBtnServIncluirClick(Sender: TObject);
begin
  EditHwCodServ.Enabled            := True;
  DBLookupComboBoxCodServ.Enabled  := True;
  EditHwCodServ.Color              := clWindow;
  DBLookupComboBoxCodServ.Color    := clWindow;

  vDadosIni.vInibeMensPesqPros := 'S';
  EditHwValorUnServ.Enabled        := vDadosIni.PesqPros('CLI290', 'HABILITAR', '', 'CLIENTES_COM_CONTRATO', '', Contratos.buscas, False);
  if EditHwValorUnServ.Enabled then
  	EditHwValorUnServ.Color        := clWindow
  else
  	EditHwValorUnServ.Color        := cl3DLight;

  EditHwCodServ.AsValue            := 0;
  DBLookupComboBoxCodServ.KeyValue := 0;
  EditHwQtdeServ.AsValue           := 0;
  EditHwValorUnServ.AsValue        := 0;
  EditHwValorTotServ.AsValue       := 0;

  if Contratos.vCOD_CONTRATO <= 0 then
  begin
  	if Application.MessageBox(PChar('Favor salvar o contrato antes de continuar, deseja salvar?'),
    	'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
        exit;

    Contratos.vDESCR_CONTRATO := trim(Edit1.Text);

  	Contratos.vCOD_CLIENTE := EditHw7.AsInteger;

    Contratos.vCOD_CONTROLE := EditHw2.AsInteger;

    Contratos.vCOD_COLABORADOR := EditHw5.AsInteger;

    if Contratos.dataSet.FieldByName('ASSINATURA_VINDI_ID').AsInteger > 0 then
      Contratos.vDIAS_APOS_VENC := 0
    else
      Contratos.vDIAS_APOS_VENC := EditHw11.AsInteger;

    if Contratos.vDIAS_APOS_VENC > 0 then
      Contratos.vDIA_VENCIMENTO := 0
    else
      Contratos.vDIA_VENCIMENTO := EditHw3.AsInteger;

    Contratos.vDIA_FATURAMENTO := EditHw10.AsInteger;

    Contratos.vVALOR_CONTRATO := EditHw4.AsValue;

    Contratos.vVALOR_SERV := EditHw1.AsValue;

    Contratos.vVALOR_PROD := EditHw8.AsValue;

    Contratos.vCONTRATOS_CADA_MES := EditHw6.AsInteger;

    Contratos.vSTATUS := ComboBox9.Text;

    Contratos.vTIPO_OS := ComboBox13.Text;

    Contratos.vDATA_IMPRESSAO_BOLETO := CheckBox5.Checked;

    if vDadosIni.apenasNumeros(MaskEdit10.Text) = '' then
      Contratos.vDATA_INICIAL_VIGENCIA := 0
    else
      Contratos.vDATA_INICIAL_VIGENCIA := StrToDate(MaskEdit10.Text);

    if vDadosIni.apenasNumeros(MaskEdit11.Text) = '' then
      Contratos.vDATA_FINAL_VIGENCIA := 0
    else
      Contratos.vDATA_FINAL_VIGENCIA := StrToDate(MaskEdit11.Text);

    if vDadosIni.apenasNumeros(MaskEdit16.Text) = '' then
      Contratos.vDATA_IMPRESSAOBOL_INICIAL := 0
    else
      Contratos.vDATA_IMPRESSAOBOL_INICIAL := StrToDate(MaskEdit16.Text);

    if vDadosIni.apenasNumeros(MaskEdit4.Text) = '' then
      Contratos.vDATA_CANCELAMENTO := 0
    else
      Contratos.vDATA_CANCELAMENTO := StrToDate(MaskEdit4.Text);

    Contratos.vOBS := trim(MemoOBSCtr.Text);

    if not Contratos._salvarDadosContrato then
    begin
    	setFocusCampoErro(Contratos.vNomeCampoErro, Contratos.vMensagemErro);
      exit;
    end;

    Contratos.vMODO := 'ALTERAR';
    Contratos.vCOD_CONTRATO := Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  end;

  if not vDadosIni.PesqPros('CLI282', 'INCLUIR',
  	'Ctr ' + IntToStr(Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger),
    'CLIENTES_COM_CONTRATO_SERV',
    '', Contratos.buscas, true) then
    exit;

  vCodTpServ := 0;
	
  Contratos.vServCtr.vMODO              := 'INSERIR';
  Contratos.vServCtr.vCOD_CONTRATO      := Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  Contratos.vServCtr.vCOD_CONTRATO_SERV := 0;
	if not Contratos._abreFormServIncluir then
  	exit;
end;

procedure TfrmCadContratosClientes.BitBtnServOKClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtnServOK.CanFocus) then
	  BitBtnServOK.SetFocus;

  Contratos.vServCtr.vCOD_CONTRATO := Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger;
  Contratos.vServCtr.vCOD_SERVICO  := Trunc(EditHwCodServ.AsValue);
  Contratos.vServCtr.vQTDE         := EditHwQtdeServ.AsValue;
  Contratos.vServCtr.vVALOR_UN     := EditHwValorUnServ.AsValue;

  if not Contratos.vServCtr.Post(Contratos) then
  begin
  	setFocusCampoErro(Contratos.vServCtr.vNomeCampoErro, Contratos.vServCtr.vMensagemErro);
    exit;
  end;

  if trim(Edit1.Text) = '' then
  	Edit1.Text := trim(Contratos.vServCtr.dataSet.FieldByName('desc_servico').AsString)
  else
  begin
  	if (Contratos.vServCtr.dataSet.RecordCount <= 1)
    	and (trim(Edit1.Text) <> trim(Contratos.vServCtr.dataSet.FieldByName('desc_servico').AsString)) then
    begin
    	if Application.MessageBox(PChar('Deseja atribuir a descrição do serviço a descrição do contrato?'),
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
      begin
        Edit1.Text := trim(Contratos.vServCtr.dataSet.FieldByName('desc_servico').AsString);
      end;
    end;
  end;

  Contratos.atribuirValorContrato;
  EditHw4.AsValue := Contratos.vVALOR_CONTRATO;
  EditHw1.AsValue := Contratos.vVALOR_SERV;
  EditHw8.AsValue := Contratos.vVALOR_PROD;

  TForm(pnCadServicosCtr.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContratosClientes.btnCancelarAlteracaoEmLoteClick(
  Sender: TObject);
begin
  inherited;
	TForm(pnAlteracaoEmLote.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContratosClientes.btnOKAlteracaoEmLoteClick(Sender: TObject);
begin
  inherited;
  try
  	if (Self.Enabled) and (Self.Visible) and (btnOKAlteracaoEmLote.CanFocus) then
      btnOKAlteracaoEmLote.SetFocus;

    Contratos.vCOD_CONTROLE := EdControle.AsInteger;

    Contratos.vCOD_COLABORADOR := EdVendedor.AsInteger;

    Contratos.vDIAS_APOS_VENC := EdDiasAposVenc.AsInteger;

    Contratos.vDIA_VENCIMENTO := EdDiaVencimento.AsInteger;

    Contratos.vDIA_FATURAMENTO := EdDiaFaturamento.AsInteger;

    Contratos.vCONTRATOS_CADA_MES := EdGerarContratosAcada.AsInteger;

    Contratos.vSTATUS := cbStatusContrato.Text;

    Contratos.vTIPO_OS := cbTipoOS.Text;

    Contratos.vDATA_IMPRESSAO_BOLETO := ckHabDataInicialBoleto.Checked;

    if vDadosIni.apenasNumeros(meDataInicialContrato.Text) = '' then
      Contratos.vDATA_INICIAL_VIGENCIA := 0
    else
      Contratos.vDATA_INICIAL_VIGENCIA := StrToDate(meDataInicialContrato.Text);

    if vDadosIni.apenasNumeros(meDataFinalContrato.Text) = '' then
      Contratos.vDATA_FINAL_VIGENCIA := 0
    else
      Contratos.vDATA_FINAL_VIGENCIA := StrToDate(meDataFinalContrato.Text);

    if vDadosIni.apenasNumeros(meDataInicialBoleto.Text) = '' then
      Contratos.vDATA_IMPRESSAOBOL_INICIAL := 0
    else
      Contratos.vDATA_IMPRESSAOBOL_INICIAL := StrToDate(meDataInicialBoleto.Text);

    Contratos.vOBS := trim(meOBS.Lines.Text);

    Contratos.vGerarNFS := Copy(trim(cbGerarNFS.Text), 1, 1);

    Contratos.vGerarNF := Copy(trim(cbGerarNF.Text), 1, 1);

		Contratos.vGerarRecLoc := Copy(trim(cbGerarRecLoc.Text), 1, 1);

    Contratos.vGerarBoleto := Copy(trim(cbGerarBoleto.Text), 1, 1);

    Contratos.vHAB_COD_COLABORADOR := ckVendedor.Checked;

    Contratos.vHAB_COD_CONTROLE := ckControle.Checked;

    Contratos.vHAB_DIAS_APOS_VENC := ckDiasAposVenc.Checked;

    Contratos.vHAB_DIA_VENCIMENTO := ckDiaVencimento.Checked;

  	Contratos.vHAB_DIA_FATURAMENTO := ckDiaFaturamento.Checked;

  	Contratos.vHAB_CONTRATOS_CADA_MES := ckGerarContratosAcada.Checked;

    Contratos.vHAB_STATUS := ckStatusContrato.Checked;

    Contratos.vHAB_TIPO_OS := ckTipoOS.Checked;

    Contratos.vHAB_DATA_VIGENCIA_CONTRATO := ckDataInicialFinalContrato.Checked;

    Contratos.vHAB_DATA_IMPRESSAOBOL_INICIAL := ckDataInicialBoleto.Checked;

    Contratos.vHAB_OBS := ckOBS.Checked;

    Contratos.vHAB_GERAR_NFS := ckGerarNFS.Checked;

    Contratos.vHAB_GERAR_NF := ckGerarNF.Checked;

    Contratos.vHAB_GERAR_REC_LOC := ckGerarRecLoc.Checked;

    Contratos.vHAB_GERAR_BOLETO := ckGerarBoleto.Checked;

    if not Contratos.atualizarContratosEmLote then
    begin
    	setFocusCampoErro(Contratos.vNomeCampoErro, Contratos.vMensagemErro);
    	exit;
    end;

		TForm(pnAlteracaoEmLote.Parent).ModalResult := IDOK;
  finally
    _GravaConfiguracoesDouble(EdControle.Name, EdControle.AsValue);
    _GravaConfiguracoesDouble(EdVendedor.Name, EdVendedor.AsValue);
    _GravaConfiguracoesDouble(EdDiaVencimento.Name, EdDiaVencimento.AsValue);
    _GravaConfiguracoesDouble(EdDiaFaturamento.Name, EdDiaFaturamento.AsValue);
    _GravaConfiguracoesDouble(EdDiasAposVenc.Name, EdDiasAposVenc.AsValue);
    _GravaConfiguracoesString(cbTipoOS.Name, cbTipoOS.Text);
    _GravaConfiguracoesDouble(EdGerarContratosAcada.Name, EdGerarContratosAcada.AsValue);
    _GravaConfiguracoesString(meDataInicialContrato.Name, meDataInicialContrato.Text);
    _GravaConfiguracoesString(meDataFinalContrato.Name, meDataFinalContrato.Text);
    _GravaConfiguracoesString(meDataInicialBoleto.Name, meDataInicialBoleto.Text);
    _GravaConfiguracoesInteger(cbStatusContrato.Name, cbStatusContrato.ItemIndex);
    _GravaConfiguracoesString(meOBS.Name, meOBS.Lines.Text);
    _GravaConfiguracoesString(cbGerarNFS.Name, cbGerarNFS.Text);
    _GravaConfiguracoesString(cbGerarNF.Name, cbGerarNF.Text);
    _GravaConfiguracoesString(cbGerarRecLoc.Name, cbGerarRecLoc.Text);
    _GravaConfiguracoesString(cbGerarBoleto.Name, cbGerarBoleto.Text);

    _GravaConfiguracoesBoolean(ckControle.Name, ckControle.Checked);
    _GravaConfiguracoesBoolean(ckVendedor.Name, ckVendedor.Checked);
    _GravaConfiguracoesBoolean(ckDiaVencimento.Name, ckDiaVencimento.Checked);
    _GravaConfiguracoesBoolean(ckDiaFaturamento.Name, ckDiaFaturamento.Checked);
    _GravaConfiguracoesBoolean(ckDiasAposVenc.Name, ckDiasAposVenc.Checked);
    _GravaConfiguracoesBoolean(ckTipoOS.Name, ckTipoOS.Checked);
    _GravaConfiguracoesBoolean(ckGerarContratosAcada.Name, ckGerarContratosAcada.Checked);
    _GravaConfiguracoesBoolean(ckDataInicialFinalContrato.Name, ckDataInicialFinalContrato.Checked);
    _GravaConfiguracoesBoolean(ckDataInicialBoleto.Name, ckDataInicialBoleto.Checked);
    _GravaConfiguracoesBoolean(ckStatusContrato.Name, ckStatusContrato.Checked);
    _GravaConfiguracoesBoolean(ckOBS.Name, ckOBS.Checked);
    _GravaConfiguracoesBoolean(ckGerarNFS.Name, ckGerarNFS.Checked);
    _GravaConfiguracoesBoolean(ckGerarNF.Name, ckGerarNF.Checked);
    _GravaConfiguracoesBoolean(ckGerarRecLoc.Name, ckGerarRecLoc.Checked);
    _GravaConfiguracoesBoolean(ckGerarBoleto.Name, ckGerarBoleto.Checked);
  end;
end;

procedure TfrmCadContratosClientes.btSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    Contratos._marcarTodos(Contratos.dataSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContratosClientes.btUnSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    Contratos._desmarcarTodos(Contratos.dataSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContratosClientes.btVoltarDadosProcClick(Sender: TObject);
begin
	frmCadContratosClientes.Caption := 'Contratos Clientes';

	Panel2.Visible := true;
	GroupBox3.Parent := TabSheet2;
  
	btVoltarDadosProc.Parent := Panel52;
  BitBtn2.Visible := True;
  BitBtn3.Visible := True;
  Panel1.Parent := TabSheet2;
  TelaCadastro := 0;
  
	PageControl1.ActivePage := TabSheet2;	
end;

procedure TfrmCadContratosClientes.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Panel52.Height := GroupBox3.Height;

  GroupBox5.Visible := CheckBox3.Checked;
  groupAdicional.Visible := CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then   
    ComboBox11.SetFocus;
end;

procedure TfrmCadContratosClientes.CheckBox3Click(Sender: TObject);
begin
  inherited;
  Panel52.Height := GroupBox3.Height;

  GroupBox5.Visible := CheckBox3.Checked;
  groupAdicional.Visible := CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;

  if (Self.Enabled) and (Self.Visible) and (CheckListBox1.CanFocus) then
    CheckListBox1.SetFocus;
end;

procedure TfrmCadContratosClientes.CheckBox4Click(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesBoolean(CheckBox4.Name, CheckBox4.Checked);
end;

procedure TfrmCadContratosClientes.ckControleClick(Sender: TObject);
begin
  inherited;
	EdControle.Enabled := ckControle.Checked;
  DBLControle.Enabled := ckControle.Checked;
  if ckControle.Checked then
  begin
  	pnControle.ParentBackground := False;
		pnControle.Color := clYellow;
  end
  else
  begin
  	pnControle.ParentBackground := True;
  	pnControle.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdControle.CanFocus) then
  	EdControle.SetFocus;
end;

procedure TfrmCadContratosClientes.ckDataInicialBoletoClick(Sender: TObject);
begin
  inherited;
	meDataInicialBoleto.Enabled := ckDataInicialBoleto.Checked;
  if ckDataInicialBoleto.Checked then
  begin
  	ckHabDataInicialBoleto.Checked := True;
  	pnDataInicialBoleto.ParentBackground := False;
		pnDataInicialBoleto.Color := clYellow;
  end
  else
  begin
    ckHabDataInicialBoleto.Checked := False;
  	pnDataInicialBoleto.ParentBackground := True;
  	pnDataInicialBoleto.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (meDataInicialBoleto.CanFocus) then
  	meDataInicialBoleto.SetFocus;
end;

procedure TfrmCadContratosClientes.ckDataInicialFinalContratoClick(
  Sender: TObject);
begin
  inherited;
	meDataInicialContrato.Enabled := ckDataInicialFinalContrato.Checked;
  meDataFinalContrato.Enabled := ckDataInicialFinalContrato.Checked;
  if ckDataInicialFinalContrato.Checked then
  begin
  	pnDataInicialFinalContrato.ParentBackground := False;
		pnDataInicialFinalContrato.Color := clYellow;
  end
  else
  begin
  	pnDataInicialFinalContrato.ParentBackground := True;
  	pnDataInicialFinalContrato.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (meDataInicialContrato.CanFocus) then
  	meDataInicialContrato.SetFocus;
end;

procedure TfrmCadContratosClientes.ckDiaFaturamentoClick(Sender: TObject);
begin
  inherited;
  EdDiaFaturamento.Enabled := ckDiaFaturamento.Checked;
  if ckDiaFaturamento.Checked then
  begin
  	pnDiaFaturamento.ParentBackground := False;
		pnDiaFaturamento.Color := clYellow;
  end
  else
  begin
  	pnDiaFaturamento.ParentBackground := True;
  	pnDiaFaturamento.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdDiaFaturamento.CanFocus) then
  	EdDiaFaturamento.SetFocus;
end;

procedure TfrmCadContratosClientes.ckDiasAposVencClick(Sender: TObject);
begin
  inherited;
	EdDiasAposVenc.Enabled := ckDiasAposVenc.Checked;
  if ckDiasAposVenc.Checked then
  begin
  	pnDiasAposVencimento.ParentBackground := False;
		pnDiasAposVencimento.Color := clYellow;
  end
  else
  begin
  	pnDiasAposVencimento.ParentBackground := True;
  	pnDiasAposVencimento.Color := clBtnFace;
  end;

  ckDiaVencimento.Enabled := not ckDiasAposVenc.Checked;
  lbDiaVencimento.Enabled := not ckDiasAposVenc.Checked;
  EdDiaVencimento.Enabled := (not ckDiasAposVenc.Checked) and (ckDiaVencimento.Checked);

  if (Self.Enabled) and (Self.Visible) and (EdDiasAposVenc.CanFocus) then
  	EdDiasAposVenc.SetFocus;
end;

procedure TfrmCadContratosClientes.ckDiaVencimentoClick(Sender: TObject);
begin
  inherited;
	EdDiaVencimento.Enabled := ckDiaVencimento.Checked;
  if ckDiaVencimento.Checked then
  begin
  	pnDiaVencimento.ParentBackground := False;
		pnDiaVencimento.Color := clYellow;
  end
  else
  begin
  	pnDiaVencimento.ParentBackground := True;
  	pnDiaVencimento.Color := clBtnFace;
  end;

  ckDiasAposVenc.Enabled := not ckDiaVencimento.Checked;
  lbDiasAposVenc.Enabled := not ckDiaVencimento.Checked;
  EdDiasAposVenc.Enabled := (not ckDiaVencimento.Checked) and (ckDiasAposVenc.Checked);

  if (Self.Enabled) and (Self.Visible) and (EdDiaVencimento.CanFocus) then
  	EdDiaVencimento.SetFocus;
end;

procedure TfrmCadContratosClientes.ckGerarBoletoClick(Sender: TObject);
begin
  inherited;
	cbGerarBoleto.Enabled := ckGerarBoleto.Checked;
  if ckGerarBoleto.Checked then
  begin
  	pnGerarBoleto.ParentBackground := False;
		pnGerarBoleto.Color := clYellow;
  end
  else
  begin
  	pnGerarBoleto.ParentBackground := True;
  	pnGerarBoleto.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbGerarBoleto.CanFocus) then
  	cbGerarBoleto.SetFocus;
end;

procedure TfrmCadContratosClientes.ckGerarContratosAcadaClick(Sender: TObject);
begin
  inherited;
	EdGerarContratosAcada.Enabled := ckGerarContratosAcada.Checked;
  if ckGerarContratosAcada.Checked then
  begin
  	pnGerarContratosAcada.ParentBackground := False;
		pnGerarContratosAcada.Color := clYellow;
  end
  else
  begin
  	pnGerarContratosAcada.ParentBackground := True;
  	pnGerarContratosAcada.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdGerarContratosAcada.CanFocus) then
  	EdGerarContratosAcada.SetFocus;
end;

procedure TfrmCadContratosClientes.ckGerarNFClick(Sender: TObject);
begin
  inherited;
	cbGerarNF.Enabled := ckGerarNF.Checked;
  if ckGerarNF.Checked then
  begin
  	pnGerarNF.ParentBackground := False;
		pnGerarNF.Color := clYellow;
  end
  else
  begin
  	pnGerarNF.ParentBackground := True;
  	pnGerarNF.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbGerarNF.CanFocus) then
  	cbGerarNF.SetFocus;
end;

procedure TfrmCadContratosClientes.ckGerarNFSClick(Sender: TObject);
begin
  inherited;
	cbGerarNFS.Enabled := ckGerarNFS.Checked;
  if ckGerarNFS.Checked then
  begin
  	pnGerarNFS.ParentBackground := False;
		pnGerarNFS.Color := clYellow;
  end
  else
  begin
  	pnGerarNFS.ParentBackground := True;
  	pnGerarNFS.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbGerarNFS.CanFocus) then
  	cbGerarNFS.SetFocus;
end;

procedure TfrmCadContratosClientes.ckGerarRecLocClick(Sender: TObject);
begin
  inherited;
	cbGerarRecLoc.Enabled := ckGerarRecLoc.Checked;
  if ckGerarRecLoc.Checked then
  begin
  	pnGerarRecLoc.ParentBackground := False;
		pnGerarRecLoc.Color := clYellow;
  end
  else
  begin
  	pnGerarRecLoc.ParentBackground := True;
  	pnGerarRecLoc.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbGerarRecLoc.CanFocus) then
  	cbGerarRecLoc.SetFocus;
end;

procedure TfrmCadContratosClientes.ckOBSClick(Sender: TObject);
begin
  inherited;
	meOBS.Enabled := ckOBS.Checked;
  if ckOBS.Checked then
  begin
  	pnOBS.ParentBackground := False;
		pnOBS.Color := clYellow;
  end
  else
  begin
  	pnOBS.ParentBackground := True;
  	pnOBS.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (meOBS.CanFocus) then
  	meOBS.SetFocus;
end;

procedure TfrmCadContratosClientes.ckPermOpcaoMarcadasClick(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesBoolean(ckPermOpcaoMarcadas.Name, ckPermOpcaoMarcadas.Checked);
end;

procedure TfrmCadContratosClientes.ckStatusContratoClick(Sender: TObject);
begin
  inherited;
	cbStatusContrato.Enabled := ckStatusContrato.Checked;
  if ckStatusContrato.Checked then
  begin
  	pnStatusContrato.ParentBackground := False;
		pnStatusContrato.Color := clYellow;
  end
  else
  begin
  	pnStatusContrato.ParentBackground := True;
  	pnStatusContrato.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbStatusContrato.CanFocus) then
  	cbStatusContrato.SetFocus;
end;

procedure TfrmCadContratosClientes.ckTipoOSClick(Sender: TObject);
begin
  inherited;
	cbTipoOS.Enabled := ckTipoOS.Checked;
  if ckTipoOS.Checked then
  begin
  	pnTipoOS.ParentBackground := False;
		pnTipoOS.Color := clYellow;
  end
  else
  begin
  	pnTipoOS.ParentBackground := True;
  	pnTipoOS.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbTipoOS.CanFocus) then
  	cbTipoOS.SetFocus;
end;

procedure TfrmCadContratosClientes.ckVendedorClick(Sender: TObject);
begin
  inherited;
	EdVendedor.Enabled := ckVendedor.Checked;
  DBLVendedor.Enabled := ckVendedor.Checked;
  if ckVendedor.Checked then
  begin
  	pnVendedor.ParentBackground := False;
		pnVendedor.Color := clYellow;
  end
  else
  begin
  	pnVendedor.ParentBackground := True;
  	pnVendedor.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdVendedor.CanFocus) then
  	EdVendedor.SetFocus;
end;

procedure TfrmCadContratosClientes.ComboBox11Exit(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
  	if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        vCampoAdcional := DBGrid1.DataSource.dataSet.Fields.Fields[i].FieldName;

        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmCadContratosClientes.ComboBox9Exit(Sender: TObject);
var
	vhab: Boolean;
begin
  inherited;
	if trim(ComboBox9.Text) <> 'Cancelado' then
  begin
    vhab := MaskEdit4.Enabled;

    MaskEdit4.Enabled := False;
    MaskEdit4.Color := cl3DLight;

    if (vhab) and (not MaskEdit4.Enabled) then
    	if (Self.Enabled) and (Self.Visible) and (MaskEdit10.CanFocus) then
      	MaskEdit10.SetFocus;
  end
  else
  begin
  	vhab := MaskEdit4.Enabled;

  	MaskEdit4.Enabled := True;
    MaskEdit4.Color := clWindow;

    if (not vhab) and (MaskEdit4.Enabled) then
      if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
      begin
      	MaskEdit4.Text := FormatDateTime('dd/mm/yyyy', Date);
      	MaskEdit4.SetFocus;
      end;
  end;
end;

procedure TfrmCadContratosClientes.DBGrid10TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid10, Column);
end;

procedure TfrmCadContratosClientes.DBGrid11TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid11, Column);
end;

procedure TfrmCadContratosClientes.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  	Contratos._marcaDesmarcaLinha(Contratos.dataSet);
end;

procedure TfrmCadContratosClientes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
    if ((trim(Column.Field.Dataset.FieldbyName('CPFCGC').AsString) = '')
    	or (trim(Column.Field.Dataset.FieldbyName('CEP').AsString) = '')
    	or (Column.Field.Dataset.FieldbyName('COD_BAIRRO').AsInteger <= 0)
      or (Column.Field.Dataset.FieldbyName('COD_CIDADE').AsInteger <= 0)
      or (Column.Field.Dataset.FieldbyName('CODIGO_UF').AsInteger <= 0)) then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnCadIncompleto.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;
    end;

  if (TDBGrid(sender).DataSource.DataSet.FieldByName('ASSINATURA_VINDI_ID').AsInteger > 0)
  	and (Column.FieldName = 'COD_CONTRATO') then
  begin
  	TDBGrid(sender).canvas.brush.color := pnVindi.Color;
    TDBGrid(sender).canvas.Font.color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_EMPRESA').AsInteger > 0)
  	and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS').AsString) <> 'Ativo') then
  begin
    if (Column.FieldName = 'STATUS') then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($009B9BFF);
      TDBGrid(sender).canvas.Font.color := clWindowText;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;

  if TDBGrid(sender).DataSource.dataSet.FieldByName('Sel').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); 
      TDBGrid(sender).canvas.Font.color := clWindowText;

      if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
        if ((trim(Column.Field.Dataset.FieldbyName('CPFCGC').AsString) = '')
            or (trim(Column.Field.Dataset.FieldbyName('CEP').AsString) = '')
            or (Column.Field.Dataset.FieldbyName('COD_BAIRRO').AsInteger <= 0)
            or (Column.Field.Dataset.FieldbyName('COD_CIDADE').AsInteger <= 0)
            or (Column.Field.Dataset.FieldbyName('CODIGO_UF').AsInteger <= 0)) then
        begin
          if (Column.FieldName = 'COD_CLIENTE')
          	or (Column.FieldName = 'NOME_CLIENTE')
            or (Column.FieldName = 'RAZAO') then
          begin
            if (gdFocused in State) then
            begin
              TDBGrid(sender).canvas.brush.color := clWindow;
              TDBGrid(sender).canvas.Font.color := clWindowText;
            end
            else
            begin
              TDBGrid(sender).canvas.brush.color := pnCadIncompleto.Color;
              TDBGrid(sender).canvas.Font.color := clWindowText;
            end;
          end;
        end;

      if (TDBGrid(sender).DataSource.DataSet.FieldByName('ASSINATURA_VINDI_ID').AsInteger > 0)
        and (Column.FieldName = 'COD_CONTRATO') then
      begin
        TDBGrid(sender).canvas.brush.color := pnVindi.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
      end;

      if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_EMPRESA').AsInteger > 0)
        and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS').AsString) <> 'Ativo') then
      begin
        if (Column.FieldName = 'STATUS') then
        begin
          TDBGrid(sender).canvas.brush.color := TColor($009B9BFF);
          TDBGrid(sender).canvas.Font.color := clWindowText;
          TDBGrid(sender).Canvas.FillRect(Rect);
          TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
        end;
      end;
    end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
    begin
    	Column.Width := 18;
      Column.Field.DisplayWidth := 1;
    end;

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

procedure TfrmCadContratosClientes.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_SPACE) then
  	Contratos._marcaDesmarcaLinha(Contratos.dataSet)
	else if (key = VK_RETURN) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton1Click(Sender)
  else if (key = VK_DELETE) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) and (PageControl1.ActivePage = TabSheet2) then
    BitBtn3Click(Sender)
  else if (key = VK_RETURN) and (PageControl1.ActivePage = tsAlterDadosProc) then
  	SpeedButtonAlterarProdutoClick(Sender)
  else if (key = VK_DELETE) and (PageControl1.ActivePage = tsAlterDadosProc) then
  	SpeedButton2Click(Sender);
end;

procedure TfrmCadContratosClientes.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Shift = [ssCtrl]) and (key = VK_DELETE)) then
  	 Key := 0; 
end;

procedure TfrmCadContratosClientes.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmCadContratosClientes.DBGrid3DblClick(Sender: TObject);
begin
	BitBtn11Click(Sender) ;
end;

procedure TfrmCadContratosClientes.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    BitBtn11Click(Sender)
  else if key = VK_TAB then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn11.CanFocus) then
    	BitBtn11.SetFocus;
end;

procedure TfrmCadContratosClientes.DBGridProdCtrKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_RETURN) then
    BitBtnProdAlterarClick(Sender)
  else if key = VK_DELETE then
    BitBtnProdExcluirClick(Sender)
  else if (key = VK_INSERT) then
    BitBtnProdIncluirClick(Sender);
end;

procedure TfrmCadContratosClientes.DBGridServCtrKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_RETURN) then
    BitBtnServAlterarClick(Sender)
  else if key = VK_DELETE then
    BitBtnServExcluirClick(Sender)
  else if (key = VK_INSERT) then
    BitBtnServIncluirClick(Sender);
end;

procedure TfrmCadContratosClientes.DBLControleExit(Sender: TObject);
begin
  inherited;
	if DBLControle.KeyValue = null then
		EdControle.AsValue := 0
  else                         	
  	EdControle.AsValue := DBLControle.KeyValue;
end;

procedure TfrmCadContratosClientes.DBLookupComboBoxCodServExit(Sender: TObject);
begin
	if DBLookupComboBoxCodServ.KeyValue = null then
  	EditHwCodServ.AsValue := 0
  else
	  EditHwCodServ.AsValue := DBLookupComboBoxCodServ.KeyValue;

  if not Contratos.vServCtr.buscarTipoServico(DBLookupComboBoxCodServ.KeyValue) then
  begin
    Application.MessageBox('Serviço não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxCodServ.CanFocus) then
      DBLookupComboBoxCodServ.SetFocus;
    exit;
  end;
  if not Contratos.vServCtr.buscarTipoServico(DBLookupComboBoxCodServ.KeyValue, true) then
  begin
    Application.MessageBox('CFOP do Serviço não informado no cadastro', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxCodServ.CanFocus) then
      DBLookupComboBoxCodServ.SetFocus;
    exit;
  end;

  if vCodTpServ <> Contratos.vServCtr.vCOD_SERVICO then
  begin
  	EditHwCodServ.AsValue            := Contratos.vServCtr.vCOD_SERVICO;
    DBLookupComboBoxCodServ.KeyValue := Contratos.vServCtr.vCOD_SERVICO;
  	EditHwQtdeServ.AsValue           := Contratos.vServCtr.vQTDE;
  	EditHwValorUnServ.AsValue        := Contratos.vServCtr.vVALOR_UN;
    EditHwValorTotServ.AsValue       := Contratos.vServCtr.vQTDE * Contratos.vServCtr.vVALOR_UN;
  end;

	vCodTpServ := DBLookupComboBoxCodServ.KeyValue;
end;

procedure TfrmCadContratosClientes.DBLookupComboBox16Exit(Sender: TObject);
begin
  if DBLookupComboBox16.KeyValue = null then
		EditHw2.AsValue := 0
  else                         	
  	EditHw2.AsValue := DBLookupComboBox16.KeyValue;

  Contratos._habilitarBoleto;

  if Contratos.vBOLETO = 'S' then
  begin
    MaskEdit16.Enabled := true;
    if vDadosIni.apenasNumeros(trim(MaskEdit16.Text)) = '' then
    	if trim(MaskEdit10.Text) <> '' then
    		MaskEdit16.Text    := MaskEdit10.Text;

    CheckBox5.Checked := true;
    CheckBox5.Enabled := false;
  end
  else
  begin
    MaskEdit16.Enabled := false;
    MaskEdit16.Clear;
    
    CheckBox5.Enabled := false;
    CheckBox5.Checked := false;
  end;
end;

procedure TfrmCadContratosClientes.DBLookupComboBox19Exit(Sender: TObject);
begin
	if DBLookupComboBox19.KeyValue = null then
  	EditHw5.AsValue := 0
  else
	  EditHw5.AsValue := DBLookupComboBox19.KeyValue;
end;

procedure TfrmCadContratosClientes.DBLookupComboBox1Exit(Sender: TObject);
begin
	if DBLookupComboBox1.KeyValue = null then
  	EditHw7.AsValue := 0
  else
	  EditHw7.AsValue := DBLookupComboBox1.KeyValue;
end;

procedure TfrmCadContratosClientes.DBLVendedorExit(Sender: TObject);
begin
  inherited;
	if DBLVendedor.KeyValue = null then
  	EdVendedor.AsValue := 0
  else
	  EdVendedor.AsValue := DBLVendedor.KeyValue;
end;

procedure TfrmCadContratosClientes.EdControleExit(Sender: TObject);
begin
  inherited;
	 if (ActiveControl = btnCancelarAlteracaoEmLote) then
    Exit;

  DBLControle.KeyValue := EdControle.AsInteger;

  if EdControle.AsInteger <= 0 then
  	exit;

  if not Contratos.buscarControle(EdControle.AsInteger) then
  begin
    Application.MessageBox('Controle não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdControle.CanFocus) then
    	EdControle.SetFocus;
    exit;
  end;
end;

procedure TfrmCadContratosClientes.EdControleKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CONTROLES');
      if vDadosIni.vPesquisa <> '' then
        EdControle.AsValue := StrToFloat(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadContratosClientes.EditHwCodServExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtnServCancel)) then
    Exit;

  DBLookupComboBoxCodServ.KeyValue := EditHwCodServ.AsInteger;

  if EditHwCodServ.AsInteger <= 0 then
  begin
  	vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Serviço');
    if trim(vDadosIni.vPesquisa) <> '' then
    begin
      EditHwCodServ.AsValue := StrToFloat(vDadosIni.vPesquisa);
      DBLookupComboBoxCodServ.KeyValue := EditHwCodServ.AsInteger;
    end;
  end;

  if EditHwCodServ.AsInteger <= 0 then
    exit;

  if not Contratos.vServCtr.buscarTipoServico(EditHwCodServ.AsInteger) then
  begin
    Application.MessageBox('Serviço não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwCodServ.CanFocus) then
      EditHwCodServ.SetFocus;
    exit;
  end;
  if not Contratos.vServCtr.buscarTipoServico(EditHwCodServ.AsInteger, true) then
  begin
    Application.MessageBox('CFOP do Serviço não informado no cadastro', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwCodServ.CanFocus) then
      EditHwCodServ.SetFocus;
    exit;
  end;

  if vCodTpServ <> Contratos.vServCtr.vCOD_SERVICO then
  begin
  	EditHwCodServ.AsValue            := Contratos.vServCtr.vCOD_SERVICO;
    DBLookupComboBoxCodServ.KeyValue := Contratos.vServCtr.vCOD_SERVICO;
  	EditHwQtdeServ.AsValue           := Contratos.vServCtr.vQTDE;
  	EditHwValorUnServ.AsValue        := Contratos.vServCtr.vVALOR_UN;
    EditHwValorTotServ.AsValue       := Contratos.vServCtr.vQTDE * Contratos.vServCtr.vVALOR_UN;
  end;

  vCodTpServ := EditHwCodServ.AsInteger;
end;

procedure TfrmCadContratosClientes.EditHwCodServKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Serviço');
    if trim(vDadosIni.vPesquisa) <> '' then
    begin
      EditHwCodServ.AsValue := StrToFloat(vDadosIni.vPesquisa);
      DBLookupComboBoxCodServ.KeyValue := EditHwCodServ.AsInteger;
    end;
  end;
end;

procedure TfrmCadContratosClientes.EditHwQtdeProdExit(Sender: TObject);
begin
  EditHwValorTotProd.AsValue :=
  	EditHwQtdeProd.AsValue * EditHwValorUnProd.AsValue;
end;

procedure TfrmCadContratosClientes.EditHwQtdeServExit(Sender: TObject);
begin
	EditHwQtdeServ.AsValue := Round(EditHwQtdeServ.AsValue);
  EditHwValorTotServ.AsValue :=
  	EditHwQtdeServ.AsValue * EditHwValorUnServ.AsValue;
end;

procedure TfrmCadContratosClientes.EditHwValorUnProdExit(Sender: TObject);
begin
  EditHwValorTotProd.AsValue :=
  	EditHwQtdeProd.AsValue * EditHwValorUnProd.AsValue;
end;

procedure TfrmCadContratosClientes.EditHwValorUnServExit(Sender: TObject);
begin
  EditHwValorTotServ.AsValue :=
  	EditHwQtdeServ.AsValue * EditHwValorUnServ.AsValue;
end;

procedure TfrmCadContratosClientes.EditNumFabProdExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtnProdCancel)) then
    Exit;

  if trim(EditNumFabProd.Text) = '' then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if vDadosIni.vPesquisa <> '' then
    begin
      EditNumFabProd.Text   := trim(vDadosIni.vPesquisa);
      EditGrupoProd.Text    := trim(vDadosIni.vPesquisaGrupo_prod);
      EditCodProd.Text      := trim(vDadosIni.vPesquisaCod_prod);
      EditCodGradeProd.Text := '0';
      
      if not Contratos.vProdCtr.buscaProduto(
      	Contratos, 
        trim(EditNumFabProd.Text), 
        StrToInt(vDadosIni.IfThen(trim(EditGrupoProd.Text) <> '', trim(EditGrupoProd.Text), '0')),
        vDadosIni.IfThen(trim(EditCodProd.Text) <> '', trim(EditCodProd.Text), ''),
        StrToInt(vDadosIni.IfThen(trim(EditCodGradeProd.Text) <> '', trim(EditCodGradeProd.Text), '0')), 
        true) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
        	EditNumFabProd.SetFocus;
      	exit;
      end;

      EditNumFabProd.Text        := trim(Contratos.vProdCtr.vNUM_FAB_PROD);
      EditGrupoProd.Text         := IntToStr(Contratos.vProdCtr.vGRUPO_PROD);
      EditCodProd.Text           := trim(Contratos.vProdCtr.vCOD_PROD);
      EditCodGradeProd.Text      := IntToStr(Contratos.vProdCtr.vCOD_GRADE);
      EditDescricaoProd.Text     := trim(Contratos.vProdCtr.vDESCR_PROD);
      EditHwQtdeProd.AsValue     := Contratos.vProdCtr.vQTDE;
      EditHwValorUnProd.AsValue  := Contratos.vProdCtr.vVALOR_UN;
      EditHwValorTotProd.AsValue := (EditHwQtdeProd.AsValue * EditHwValorUnProd.AsValue);
    end;
  end
  else
  begin
    if not Contratos.vProdCtr.buscaProduto(
      Contratos, 
      trim(EditNumFabProd.Text),
      vDadosIni.IfThen(trim(Contratos.vProdCtr.vNUM_FAB_PROD) = trim(EditNumFabProd.Text),
      	StrToInt(vDadosIni.IfThen(trim(EditGrupoProd.Text) <> '', trim(EditGrupoProd.Text), '0')), 0),
      vDadosIni.IfThen(trim(Contratos.vProdCtr.vNUM_FAB_PROD) = trim(EditNumFabProd.Text),
      	vDadosIni.IfThen(trim(EditCodProd.Text) <> '', trim(EditCodProd.Text), ''), ''),
      vDadosIni.IfThen(trim(Contratos.vProdCtr.vNUM_FAB_PROD) = trim(EditNumFabProd.Text),
      	StrToInt(vDadosIni.IfThen(trim(EditCodGradeProd.Text) <> '', trim(EditCodGradeProd.Text), '0')), 0), 
      true) then
    begin
      if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
        EditNumFabProd.SetFocus;
      exit;
    end;

    if (trim(vNumFabProd) <> trim(Contratos.vProdCtr.vNUM_FAB_PROD))
    	or (vGrupoProd <> Contratos.vProdCtr.vGRUPO_PROD)
    	or (trim(vCodProd) <> trim(Contratos.vProdCtr.vCOD_PROD))
      or (vCodGrade <> Contratos.vProdCtr.vCOD_GRADE) then
  	begin
      EditNumFabProd.Text        := trim(Contratos.vProdCtr.vNUM_FAB_PROD);
      EditGrupoProd.Text         := IntToStr(Contratos.vProdCtr.vGRUPO_PROD);
      EditCodProd.Text           := trim(Contratos.vProdCtr.vCOD_PROD);
      EditCodGradeProd.Text      := IntToStr(Contratos.vProdCtr.vCOD_GRADE);
      EditDescricaoProd.Text     := trim(Contratos.vProdCtr.vDESCR_PROD);
      EditHwQtdeProd.AsValue     := Contratos.vProdCtr.vQTDE;
      EditHwValorUnProd.AsValue  := Contratos.vProdCtr.vVALOR_UN;
      EditHwValorTotProd.AsValue := (EditHwQtdeProd.AsValue * EditHwValorUnProd.AsValue);
    end;
  end;

  vNumFabProd := vDadosIni.IfThen(trim(EditNumFabProd.Text) = '', '', trim(EditNumFabProd.Text));
  vGrupoProd  := vDadosIni.IfThen(trim(EditGrupoProd.Text) = '', 0, StrToIntDef(EditGrupoProd.Text, 0));
  vCodProd    := vDadosIni.IfThen(trim(EditCodProd.Text) = '', '', trim(EditCodProd.Text));
  vCodGrade   := vDadosIni.IfThen(trim(EditCodGradeProd.Text) = '', 0, StrToIntDef(EditCodGradeProd.Text, 0));
end;

procedure TfrmCadContratosClientes.EditNumFabProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if vDadosIni.vPesquisa <> '' then
    begin
      EditNumFabProd.Text   := trim(vDadosIni.vPesquisa);
      EditGrupoProd.Text    := trim(vDadosIni.vPesquisaGrupo_prod);
      EditCodProd.Text      := trim(vDadosIni.vPesquisaCod_prod);
      EditCodGradeProd.Text := '0';
      
      if not Contratos.vProdCtr.buscaProduto(
      	Contratos, 
        trim(EditNumFabProd.Text), 
        StrToInt(vDadosIni.IfThen(trim(EditGrupoProd.Text) <> '', trim(EditGrupoProd.Text), '0')),
        vDadosIni.IfThen(trim(EditCodProd.Text) <> '', trim(EditCodProd.Text), ''),
        StrToInt(vDadosIni.IfThen(trim(EditCodGradeProd.Text) <> '', trim(EditCodGradeProd.Text), '0')), 
        true) then
      begin
        if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
        	EditNumFabProd.SetFocus;
        exit;
      end;

      EditNumFabProd.Text        := trim(Contratos.vProdCtr.vNUM_FAB_PROD);
      EditGrupoProd.Text         := IntToStr(Contratos.vProdCtr.vGRUPO_PROD);
      EditCodProd.Text           := trim(Contratos.vProdCtr.vCOD_PROD);
      EditCodGradeProd.Text      := IntToStr(Contratos.vProdCtr.vCOD_GRADE);
      EditDescricaoProd.Text     := trim(Contratos.vProdCtr.vDESCR_PROD);
      EditHwQtdeProd.AsValue     := Contratos.vProdCtr.vQTDE;
      EditHwValorUnProd.AsValue  := Contratos.vProdCtr.vVALOR_UN;
      EditHwValorTotProd.AsValue := (EditHwQtdeProd.AsValue * EditHwValorUnProd.AsValue);
    end;
  end;
end;

procedure TfrmCadContratosClientes.EditHw11Exit(Sender: TObject);
begin
  inherited;
	if (EditHw11.AsInteger > 0) then
  	EditHw3.AsValue := 0;
end;

procedure TfrmCadContratosClientes.EditHw2Exit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBox16.KeyValue := EditHw2.AsInteger;

  if EditHw2.AsInteger <= 0 then
  	exit;

  if not Contratos.buscarControle(EditHw2.AsInteger) then
  begin
    Application.MessageBox('Controle não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
    	EditHw2.SetFocus;
    exit;
  end;

  Contratos._habilitarBoleto;

  if Contratos.vBOLETO = 'S' then
  begin
    MaskEdit16.Enabled := true;
    if vDadosIni.apenasNumeros(trim(MaskEdit16.Text)) = '' then
    	if trim(MaskEdit10.Text) <> '' then
    		MaskEdit16.Text    := MaskEdit10.Text;

    CheckBox5.Checked := true;
    CheckBox5.Enabled := false;
  end
  else
  begin
    MaskEdit16.Enabled := false;
    MaskEdit16.Clear;

    CheckBox5.Checked := false;
    CheckBox5.Enabled := false;
  end;
end;

procedure TfrmCadContratosClientes.EditHw2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CONTROLES');
      if vDadosIni.vPesquisa <> '' then
        EditHw2.AsValue := StrToFloat(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadContratosClientes.EditHw3Exit(Sender: TObject);
begin
  inherited;
  if (Contratos.dataSet.FieldByName('ASSINATURA_VINDI_ID').AsInteger > 0)
		and (EditHw3.AsInteger > 0)
    and (EditHw10.AsInteger <= 0) then
	begin
  	EditHw10.AsValue := EditHw3.AsValue;
  end;
  
  if (EditHw3.AsInteger > 0) then
  	EditHw11.AsValue := 0;
end;

procedure TfrmCadContratosClientes.EditHw5Exit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBox19.KeyValue := EditHw5.AsInteger;

  if EditHw5.AsInteger <= 0 then
  	exit;

  if not Contratos.buscarVendedor(EditHw5.AsInteger) then
  begin
    Application.MessageBox('Vendedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
    	EditHw5.SetFocus;
    exit;
  end;
end;

procedure TfrmCadContratosClientes.EditHw5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    Contratos._consultar_vendedor;
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR', ' AND COD_VENDEDOR IN (' +
      Contratos.vSqlAdcional + '', 'Consulta de Vendedor');
    if trim(vDadosIni.vPesquisa) <> '' then
      EditHw5.AsValue := StrToFloat(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadContratosClientes.EditHw7Exit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBox1.KeyValue := EditHw7.AsInteger;

  if not Contratos.abreClientes(EditHw7.AsInteger) then
  begin
  	MemoObsReqOs.Clear;
  	FrameCheckListaContato.Visible := EditHw7.AsInteger > 0;
    Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw7.CanFocus) then
    	EditHw7.SetFocus;
    exit;
  end;

  if Contratos.vCodClienteOld <> EditHw7.AsInteger then
  begin
    vDadosIni.retornaCtrReqOS(
      EditHw7.AsInteger,
      MemoObsReqOs
    );

    FrameCheckListaContato.Visible := EditHw7.AsInteger > 0;

    if FrameCheckListaContato.Visible then
    begin
      FrameCheckListaContato.CodCliente := EditHw7.AsInteger;
      FrameCheckListaContato.Origem := cContrato;
      FrameCheckListaContato.UnicoMens := True;

      FrameCheckListaContato.carregarContatoAplicativo;
      end;
    end;

  Contratos.vCodClienteOld := EditHw7.AsInteger;
end;

procedure TfrmCadContratosClientes.EditHw7KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	AProcedure: Tcl_cadCliente;
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if trim(vDadosIni.vPesquisa) <> '' then
      EditHw7.AsValue := StrToFloat(vDadosIni.vPesquisa);  
  end
  else if Key = VK_F4 then
  begin
  	try
    	if vDadosIni.vCliente.AHandle = 0 then
        CarregaPacote('pkClientes', vDadosIni.vCliente.AHandle);

      if vDadosIni.vCliente.AHandle = 0 then
      begin
        Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
        Exit;
      end;

      @AProcedure := GetProcAddress(vDadosIni.vCliente.AHandle, 'cl_cadCliente');

      if Assigned(AProcedure) then
        AProcedure(
          1);

      if vDadosIni.vPesquisa <> '' then
        EditHw7.AsValue := StrToFloat(vDadosIni.vPesquisa);
    finally
    end;
  end;
end;

procedure TfrmCadContratosClientes.EditHw9Change(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    Contratos.ajustarValorContratos(EditHw9.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContratosClientes.EditHw9Exit(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    Contratos.ajustarValorContratos(EditHw9.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContratosClientes.EdVendedorExit(Sender: TObject);
begin
  inherited;
	if (ActiveControl = btnCancelarAlteracaoEmLote) then
    Exit;

  DBLVendedor.KeyValue := EdVendedor.AsInteger;

  if EdVendedor.AsInteger <= 0 then
  	exit;

  if not Contratos.buscarVendedor(EdVendedor.AsInteger) then
  begin
    Application.MessageBox('Vendedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdVendedor.CanFocus) then
    	EdVendedor.SetFocus;
    exit;
  end;
end;

procedure TfrmCadContratosClientes.EdVendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    Contratos._consultar_vendedor;
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR', ' AND COD_VENDEDOR IN (' +
      Contratos.vSqlAdcional + '', 'Consulta de Vendedor');
    if trim(vDadosIni.vPesquisa) <> '' then
      EdVendedor.AsValue := StrToFloat(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadContratosClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;
  
  if (Contratos <> nil) then
    Contratos.Cancel;

  Contratos.free;
  Contratos := nil;

  if Assigned(pedidosCliente) then
    FreeAndNil(pedidosCliente);

  Action := caFree;
  if (frmCadContratosClientes <> nil) then
    frmCadContratosClientes := nil;
end;

procedure TfrmCadContratosClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
	vExibirPergFechar: Boolean;
begin
	try
  	vExibirPergFechar := Self.exibirPergFechar;
    if (PageControl1.ActivePage = tsAlterDadosProc) or (PageControl1.ActivePage = tsAlterDadosLote) or (Self.Caption = vCaptionLote) then
    begin
      Self.exibirPergFechar := False;
      btVoltarDadosProcClick(Sender);
    end;
    inherited;
  finally
    Self.exibirPergFechar := vExibirPergFechar;
  end;
end;

procedure TfrmCadContratosClientes.FormCreate(Sender: TObject);
begin
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CLIENTES_CONTRATO' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 7;
    frmCadContratosClientes := TfrmCadContratosClientes(self);
    vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  
  inherited;
  Contratos := TContratosComClientes.create;
  tsCadastro.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := false;
  TabSheet8.TabVisible := false;
  tsAlterDadosProc.TabVisible := false;
  tsAlterDadosLote.TabVisible := false;
  tsProdutosCtrCad.TabVisible := false;
  tsServicosCtrCad.TabVisible := false;
  tsSelecionaGradeProd.TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadContratosClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_F5) then
  begin
  	if (PageControl1.ActivePage = TabSheet2) or (PageControl1.ActivePage = tsAlterDadosProc) then
			ckERP.Checked := not ckERP.Checked;
  end
  else if (key = VK_F6) then
  begin
  	if (PageControl1.ActivePage = TabSheet2) or (PageControl1.ActivePage = tsAlterDadosProc) then
			ckVindi.Checked := not ckVindi.Checked;
  end;
end;

procedure TfrmCadContratosClientes.FormKeyDownProd(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if (key = VK_ESCAPE) then
  	BitBtnProdCancelClick(Sender);
end;

procedure TfrmCadContratosClientes.FormKeyDownServ(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if (key = VK_ESCAPE) then
  	BitBtnServCancelClick(Sender);
end;

procedure TfrmCadContratosClientes.FormResize(Sender: TObject);
begin
  inherited;
	if Self = nil then
    Exit;

  if PageControl1.ActivePage = TabSheet1 then
  begin
 		if (Self.Height >= 654)
      and (Self.Width >= 917) then
    begin
      GroupBox6.Align := alClient;
    end
    else
    begin
    	GroupBox6.Align := alTop;
      GroupBox6.Height := 175;
      GroupBox6.Width := 865;
    end; 
  end;
end;

procedure TfrmCadContratosClientes.FormShow(Sender: TObject);
var
	I, J: Integer;
  vLista, vLista2: TStrings;
  vTemp: string;
begin
	if not Self.Enabled then
    Exit;

	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CLIENTES_CONTRATO' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 7;
    vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
  end;

  tabPedidoCompra.TabVisible := False;

  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmClientes.dsContratoCl;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  leConfiguracoesFormRegistro;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
  end;

  if TelaCadastro = 7 then
  begin
	  MaskEdit3.Text := IntToStr(vCodCliente);
    ComboBox1.Text := Contratos.dataSet.FieldByName('COD_CLIENTE').DisplayLabel;
    ComboBox3.Text := 'Igual';
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    MaskEdit3.Visible := true;
    BitBtn1Click(Sender)
  end;

  Contratos.inserirTpServicoZero;

  try
    vLista := TStringList.Create;
    vLista2 := TStringList.Create;

    vLista := vDadosIni.getConfSisBlob('contratos_clientes_status_contratos', Contratos.buscas);
    if vLista.Count > 0 then
    begin
      CheckListBox1.Items.Clear;
      for I := 0 to vLista.Count - 1 do
      begin
        vLista2 := vDadosIni.SplitS(vLista[i]);
        for J := 0 to vLista2.Count - 1 do
        begin
          if trim(vLista2[j]) <> '' then
            if CheckListBox1.Items.IndexOf(trim(vLista2[j])) = -1 then
              CheckListBox1.Items.Add(trim(vLista2[j]));
        end;
      end;

      if CheckListBox1.Items.IndexOf('Ativo') = -1 then
        CheckListBox1.Items.Add('Ativo');
    end;
  finally
    if Assigned(vLista) then
      FreeAndNil(vLista);
    if Assigned(vLista2) then
      FreeAndNil(vLista2);
  end;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
      'Processo "CLI290" HABILITAR CAMPO VALOR UNITÁRIO DO SERVIÇO' + #13 +
      'Processo "CLI291" HABILITAR CAMPO VALOR UNITÁRIO DO PRODUTO' ;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadContratosClientes.gravaConfiguracoesFormRegistro;
var
	I, J: Integer;
	vTemp: string;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(ckERP.Name  , ckERP.Checked);
    _GravaConfiguracoesBoolean(ckVindi.Name, ckVindi.Checked);
  end;

  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
    vTemp := '';
    for I := 0 to CheckListBox1.Items.Count - 1 do
    begin
      if CheckListBox1.Checked[I] then
        vTemp := vDadosIni.IfThen(trim(vTemp) <> '', trim(vTemp) + '|', '') + trim(CheckListBox1.Items[I]);
    end;

    _GravaConfiguracoesString(CheckListBox1.Name, vTemp);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
  end;
end;

procedure TfrmCadContratosClientes.groupAdicionalExit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmCadContratosClientes.GroupBox4Enter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  Edit1.Text       := trim(Contratos.vDESCR_CONTRATO);

  EditHw7.AsValue  := Contratos.vCOD_CLIENTE;

  EditHw2.AsValue  := Contratos.vCOD_CONTROLE;

  EditHw11.AsValue := Contratos.vDIAS_APOS_VENC;

  EditHw3.AsValue  := Contratos.vDIA_VENCIMENTO;

  EditHw10.AsValue := Contratos.vDIA_FATURAMENTO;

  EditHw4.AsValue  := Contratos.vVALOR_CONTRATO;

  EditHw1.AsValue  := Contratos.vVALOR_SERV;

  EditHw8.AsValue  := Contratos.vVALOR_PROD;

  EditHw5.AsValue  := Contratos.vCOD_COLABORADOR;

  EditHw6.AsValue  := Contratos.vCONTRATOS_CADA_MES;

  MemoOBSCtr.Text  := Contratos.vOBS;

  DBLookupComboBox16.KeyValue := EditHw2.AsInteger;

  DBLookupComboBox19.KeyValue := EditHw5.AsInteger;

  if Contratos.vDATA_INICIAL_VIGENCIA > 0 then
    MaskEdit10.Text := DateToStr(Contratos.vDATA_INICIAL_VIGENCIA)
  else
    MaskEdit10.Clear;

  if Contratos.vDATA_FINAL_VIGENCIA > 0 then
    MaskEdit11.Text := DateToStr(Contratos.vDATA_FINAL_VIGENCIA)
  else
    MaskEdit11.Clear;

  if Contratos.vDATA_IMPRESSAOBOL_INICIAL > 0 then
    MaskEdit16.Text := DateToStr(Contratos.vDATA_IMPRESSAOBOL_INICIAL)
  else
    MaskEdit16.Clear;

  if Contratos.vDATA_CANCELAMENTO > 0 then
  	MaskEdit4.Text := DateToStr(Contratos.vDATA_CANCELAMENTO)
  else
  	MaskEdit4.Clear;

  if trim(Contratos.vSTATUS) <> 'Cancelado' then
  begin
    MaskEdit4.Enabled := False;
    MaskEdit4.Color := cl3DLight;
  end
  else
  begin
  	MaskEdit4.Enabled := True;
    MaskEdit4.Color := clWindow;
  end;

  if Contratos.vSTATUS <> '' then
  begin
    for I := 0 to ComboBox9.Items.Count - 1 do
      if ComboBox9.Items[I] = Contratos.vSTATUS then
      begin
        ComboBox9.ItemIndex := I;
        Break;
      end;
  end
  else
    ComboBox9.ItemIndex := 0;

  if Contratos.vTIPO_OS <> '' then
  begin
    for I := 0 to ComboBox13.Items.Count - 1 do
      if ComboBox13.Items[I] = Contratos.vTIPO_OS then
      begin
        ComboBox13.ItemIndex := I;
        Break;
      end;
  end
  else
    ComboBox13.ItemIndex := 0;

  if trim(Contratos.vGerarNFS) = '' then
  	ckNFS.Checked    := True
  else
  	ckNFS.Checked    := vDadosIni.IfThen(trim(Contratos.vGerarNFS) = 'S', true, false);

  if trim(Contratos.vGerarNF) = '' then
    ckNF.Checked     := True
  else
    ckNF.Checked     := vDadosIni.IfThen(trim(Contratos.vGerarNF) = 'S', true, false);

  if trim(Contratos.vGerarRecLoc) = '' then
    ckRecibo.Checked := True
  else
  	ckRecibo.Checked := vDadosIni.IfThen(trim(Contratos.vGerarRecLoc) = 'S', true, false);

  if trim(Contratos.vGerarBoleto) = '' then
    ckBoleto.Checked := True
  else
  	ckBoleto.Checked := vDadosIni.IfThen(trim(Contratos.vGerarBoleto) = 'S', true, false);
end;

procedure TfrmCadContratosClientes.KeyPressApenasNumeros(Sender: TObject;
  var Key: Char);
begin
	inherited;
	if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadContratosClientes.leConfiguracoesFormRegistro;
var
	I, J: Integer;
  vTemp: string;
  vListaStatus: TStringList;
begin
	if (TelaCadastro <= 0) then
  begin
    ckERP.Checked   := _LerConfiguracoesRegistroBoolean(ckERP.Name);
    ckVindi.Checked := _LerConfiguracoesRegistroBoolean(ckVindi.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
  	vTemp := _LerConfiguracoesRegistroString(CheckListBox1.Name);
    if trim(vTemp) <> '' then
    begin
    	try
        vListaStatus := TStringList.Create;
        vListaStatus := vDadosIni.Split(vTemp);
        for I := 0 to vListaStatus.Count - 1 do
        begin
        	for J := 0 to CheckListBox1.Items.Count - 1 do
          begin
            if trim(vListaStatus[I]) = trim(CheckListBox1.Items[J]) then
            begin
              CheckListBox1.Checked[J] := True;
              Break;
            end;
          end;
        end;
      finally
        if Assigned(vListaStatus) then
          FreeAndNil(vListaStatus);
      end;
    end;
  end;

  if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
    CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
      if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
        ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    	ComboBox12.Text       := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text        := _LerConfiguracoesRegistroString(MaskEdit9.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
      MaskEdit8.Text        := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
      MaskEdit7.Text        := _LerConfiguracoesRegistroString(MaskEdit7.Name);
  end;
end;

procedure TfrmCadContratosClientes.MaskEdit10Exit(Sender: TObject);
begin
  if vDadosIni.apenasNumeros(MaskEdit10.Text) <> '' then
  begin
    try
       StrToDate(MaskEdit10.Text);
     except
       on EConvertError do
       begin
         Application.MessageBox('Data inicial vigência do contrato inválida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (MaskEdit10.CanFocus) then
           MaskEdit10.SetFocus;
         exit;
       end;
     end;
  end;

  if ((Contratos.vMODO = 'INSERIR') and (CheckBox5.Checked)) then
    MaskEdit16.Text := MaskEdit10.Text;
end;

procedure TfrmCadContratosClientes.MaskEdit11Exit(Sender: TObject);
begin
  if vDadosIni.apenasNumeros(MaskEdit11.Text) <> '' then
  begin
     try
       StrToDate(MaskEdit11.Text);
     except
       on EConvertError do
       begin
         Application.MessageBox('Data final vigência do contrato inválida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (MaskEdit11.CanFocus) then
           MaskEdit11.SetFocus;
         exit;
       end;
     end;
  end;
end;

procedure TfrmCadContratosClientes.MaskEdit16Exit(Sender: TObject);
begin
  if not CheckBox5.Checked then
   	exit;

   if vDadosIni.apenasNumeros(MaskEdit16.Text) <> '' then
   begin
     try
			StrToDate(MaskEdit16.Text);
     except
       on EConvertError do
       begin
         Application.MessageBox('Data inicial impressão do boleto inválida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (MaskEdit16.CanFocus) then
           MaskEdit16.SetFocus;
         exit;
       end;
     end;
   end;
end;

procedure TfrmCadContratosClientes.MaskEdit4Exit(Sender: TObject);
begin
  if vDadosIni.apenasNumeros(MaskEdit4.Text) <> '' then
  begin
     try
       StrToDate(MaskEdit4.Text);
     except
       on EConvertError do
       begin
         Application.MessageBox('Data de cancelamento do contrato inválida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
           MaskEdit4.SetFocus;
         exit;
       end;
     end;
  end;
end;

procedure TfrmCadContratosClientes.meDataFinalContratoExit(Sender: TObject);
begin
  inherited;
	if vDadosIni.apenasNumeros(meDataFinalContrato.Text) <> '' then
  begin
     try
       StrToDate(meDataFinalContrato.Text);
     except
       on EConvertError do
       begin
         Application.MessageBox('Data final vigência do contrato inválida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (meDataFinalContrato.CanFocus) then
           meDataFinalContrato.SetFocus;
         exit;
       end;
     end;
  end;
end;

procedure TfrmCadContratosClientes.meDataInicialBoletoExit(Sender: TObject);
begin
  inherited;
  if not ckHabDataInicialBoleto.Checked then
   	exit;

  if vDadosIni.apenasNumeros(meDataInicialBoleto.Text) <> '' then
  begin
    try
     StrToDate(meDataInicialBoleto.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox('Data inicial impressão do boleto inválida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (meDataInicialBoleto.CanFocus) then
          meDataInicialBoleto.SetFocus;
        exit;
      end;
    end;
  end;
end;

procedure TfrmCadContratosClientes.meDataInicialContratoExit(Sender: TObject);
begin
  inherited;
	if vDadosIni.apenasNumeros(meDataInicialContrato.Text) <> '' then
  begin
    try
       StrToDate(meDataInicialContrato.Text);
     except
       on EConvertError do
       begin
         Application.MessageBox('Data inicial vigência do contrato inválida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (meDataInicialContrato.CanFocus) then
           meDataInicialContrato.SetFocus;
         exit;
       end;
     end;
  end;

  meDataInicialBoleto.Text := meDataInicialContrato.Text;
end;

procedure TfrmCadContratosClientes.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel16.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadContratosClientes.pnCadProdutosCtrEnter(Sender: TObject);
begin
  TForm(pnCadProdutosCtr.Parent).OnKeyDown := FormKeyDownProd;

  if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
    EditNumFabProd.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwQtdeProd.CanFocus) then
    EditHwQtdeProd.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwValorUnProd.CanFocus) then
    EditHwValorUnProd.SetFocus;
end;

procedure TfrmCadContratosClientes.pnCadServicosCtrEnter(Sender: TObject);
begin
  TForm(pnCadServicosCtr.Parent).OnKeyDown := FormKeyDownServ;

  if (Self.Enabled) and (Self.Visible) and (EditHwCodServ.CanFocus) then
    EditHwCodServ.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwQtdeServ.CanFocus) then
    EditHwQtdeServ.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwValorUnServ.CanFocus) then
  	EditHwValorUnServ.SetFocus;
end;

procedure TfrmCadContratosClientes.pnContratoRelatoriosEnter(Sender: TObject);
begin
	RadioGroup1.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup1.Name);

  RadioGroup2.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup2.Name);

  CheckBox4.Checked     := _LerConfiguracoesRegistroBoolean(CheckBox4.Name);

  if ComboBox10.CanFocus then
    ComboBox10.SetFocus;
end;

procedure TfrmCadContratosClientes.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vInc := 0;
end;

procedure TfrmCadContratosClientes.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel29.Caption := Format('%0.2n', [vValorTotTemp]);
  QRLabel51.Caption := FloatToStr(Trunc(vValorTotTemp1));
  vValorTotTemp := 0;
  vValorTotTemp1 := 0;
end;

procedure TfrmCadContratosClientes.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  vValorTemp := vValorTemp + QRDBText13.DataSet.FieldByName(QRDBText13.DataField).AsFloat;
  vValorTotTemp := vValorTotTemp + QRDBText13.DataSet.FieldByName(QRDBText13.DataField).AsFloat;
  if vValorTemp > 0 then
    vValorTemp1 := vValorTemp1 + 1;
  if vValorTotTemp > 0 then
    vValorTotTemp1 := vValorTotTemp1 + 1;  
  if trim(Contratos.fRelCab.FieldByName('descr_contrato_tmp').AsString) <> '' then 
    vInc := vInc + 1;
  QRLabel52.Caption := IntToStr(vInc);
end;

procedure TfrmCadContratosClientes.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, QuickRep1.ReportTitle);
end;

procedure TfrmCadContratosClientes.RadioGroup1Click(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesInteger(RadioGroup1.Name, RadioGroup1.ItemIndex);
end;

procedure TfrmCadContratosClientes.RadioGroup2Click(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);
end;

procedure TfrmCadContratosClientes.SpeedButton10Click(Sender: TObject);
var
  novoPedido: NovoPedidoDados;
begin
  inherited;
  novoPedido.Codigo := 0;
  novoPedido.NItem := 0;
  novoPedido.CodCliente := EditHw7.AsInteger;
  novoPedido.DataPedido := Date();
  novoPedido.GrupoProd := Contratos.vProdCtr.fint('grupo_prod');
  novoPedido.CodProd := Contratos.vProdCtr.fstr('cod_prod');
  novoPedido.CodGrade := Contratos.vProdCtr.fint('cod_grade');
  novoPedido.Quantidade := Contratos.vProdCtr.ffloat('qtde');
  novoPedido.ValorUn := Contratos.vProdCtr.fint('valor_un');

  if NovoPedidoViaContrato( novoPedido ) then
    BitBtn12.Click;
end;

procedure TfrmCadContratosClientes.SpeedButton13Click(Sender: TObject);
var
  pedido: PedidoCompraDoContrato;
begin
  inherited;

  if lbxPedidos.ItemIndex = -1 then
    Exit;

  pedido := (lbxPedidos.Items.Objects[lbxPedidos.ItemIndex] as PedidoCompraDoContrato);

  if AlterPedidoViaContrato( pedido ) then
    BitBtn12.Click;
end;

procedure TfrmCadContratosClientes.SpeedButton1Click(Sender: TObject);
var
	I, J: Integer;
  vLista, vLista2: TStrings;
begin
  try
    if Contratos.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('CLI175', 'ALTERAR', '', 'CLIENTES_COM_CONTRATO',
      Contratos.dataSet.FieldByName('COD_CLIENTE').AsString + '/' +
    	Contratos.dataSet.FieldByName('COD_SERVICO').AsString, Contratos.buscas, true) then
      exit;

    inherited;
    Contratos.atualizarContratosTabNova(Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger);
    Contratos._cancelar;

    try
      vLista := TStringList.Create;
      vLista2 := TStringList.Create;

      vLista := vDadosIni.getConfSisBlob('contratos_clientes_status_contratos', Contratos.buscas);
      if vLista.Count > 0 then
      begin
        ComboBox9.Items.Clear;
        for I := 0 to vLista.Count - 1 do
        begin
          vLista2 := vDadosIni.SplitS(vLista[i]);
          for J := 0 to vLista2.Count - 1 do
          begin
            if trim(vLista2[j]) <> '' then
              if ComboBox9.Items.IndexOf(trim(vLista2[j])) = -1 then
                ComboBox9.Items.Add(trim(vLista2[j]));
          end;
        end;

        if ComboBox9.Items.IndexOf('Ativo') = -1 then
          ComboBox9.Items.Add('Ativo');
      end;
    finally
      if Assigned(vLista) then
      	FreeAndNil(vLista);
      if Assigned(vLista2) then
      	FreeAndNil(vLista2);
    end;

    GroupBox4.Caption := 'Alterando contrato: ' + IntToStr(Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger);
    Contratos.vServCtr.abreServCtr(Contratos);
    Contratos.vProdCtr.abreProdCtr(Contratos);
    Contratos.vAplicativo.abreAplicativoMens;
    if not Contratos._getDadosContrato then
      Exit;

    if Contratos.vBOLETO = 'S' then
    begin
      MaskEdit16.Enabled := true;
      CheckBox5.Checked := true;
      CheckBox5.Enabled := false;
      Contratos.vMODO := 'ALTERAR';
    end
    else
    begin
      MaskEdit16.Enabled := false;
      CheckBox5.Enabled := false;
      CheckBox5.Checked := false;
      Contratos.vMODO := 'ALTERAR';
    end;

    Contratos.vCOD_CONTRATO := Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger;
    Contratos.vCodClienteOld := Contratos.dataSet.FieldByName('COD_CLIENTE').AsInteger;
    Contratos.abreClientes(Contratos.dataSet.FieldByName('COD_CLIENTE').AsInteger);
    DBLookupComboBox1.KeyValue := Contratos.dataSet.FieldByName('COD_CLIENTE').AsInteger;

    vDadosIni.retornaCtrReqOS(
      Contratos.dataSet.FieldByName('COD_CLIENTE').AsInteger,
      MemoObsReqOs
    );

    FrameCheckListaContato.Visible := Contratos.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0;

    if FrameCheckListaContato.Visible then
    begin
      FrameCheckListaContato.CodCliente := Contratos.dataSet.FieldByName('COD_CLIENTE').AsInteger;
      FrameCheckListaContato.Origem := cContrato;
      FrameCheckListaContato.UnicoMens := True;

      FrameCheckListaContato.carregarContatoAplicativo;
      end;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    PageControl2.ActivePage := tsServicosCtrCons;

    if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
      Edit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditHw7.CanFocus) then
      EditHw7.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
      EditHw2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      Contratos.Cancel;
      Contratos.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadContratosClientes.SpeedButton23Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI177', 'RELATORIO', '', 'CLIENTES_COM_CONTRATO ',
    '', Contratos.buscas, true) then
    Exit;
  Contratos._abreFormContratosRelatorio;
end;

procedure TfrmCadContratosClientes.SpeedButton24Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI178', 'VISUALIZAR', '', 'CLIENTES_COM_CONTRATO ',
    Contratos.dataSet.FieldByName('COD_CLIENTE').AsString + '/' +
    Contratos.dataSet.FieldByName('COD_SERVICO').AsString, Contratos.buscas, true) then
    Exit;
  Contratos._getDetalhesVendas;
  Contratos._abreFormContratosHistorico;
end;

procedure TfrmCadContratosClientes.SpeedButton26Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI179', 'VISUALIZAR', '', 'CLIENTES_COM_CONTRATO ',
    Contratos.dataSet.FieldByName('COD_CLIENTE').AsString, Contratos.buscas, true) then
    Exit;

  try
    DBGrid11.DataSource.DataSet := Contratos.buscas;
    Contratos._abreFormContratosEquipamentos;
  finally
    DBGrid11.DataSource.DataSet := nil;
  end;
end;

procedure TfrmCadContratosClientes.SpeedButton2Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_CONTRATOS', 'E', Contratos.buscas) then
    Exit;
  Contratos._excluirDadosContrato;
end;

procedure TfrmCadContratosClientes.SpeedButton55Click(Sender: TObject);
var
	I, J: Integer;
  vLista, vLista2: TStrings;
begin
  inherited;
	vDadosIni.configurarSistema('contratos_clientes_%', Contratos.buscas);

  try
    vLista := TStringList.Create;
    vLista2 := TStringList.Create;

    vLista := vDadosIni.getConfSisBlob('contratos_clientes_status_contratos', Contratos.buscas);
    if vLista.Count > 0 then
    begin
      CheckListBox1.Items.Clear;
      for I := 0 to vLista.Count - 1 do
      begin
        vLista2 := vDadosIni.SplitS(vLista[i]);
        for J := 0 to vLista2.Count - 1 do
        begin
          if trim(vLista2[j]) <> '' then
            if CheckListBox1.Items.IndexOf(trim(vLista2[j])) = -1 then
              CheckListBox1.Items.Add(trim(vLista2[j]));
        end;
      end;

      if CheckListBox1.Items.IndexOf('Ativo') = -1 then
        CheckListBox1.Items.Add('Ativo');
    end;
  finally
    if Assigned(vLista) then
      FreeAndNil(vLista);
    if Assigned(vLista2) then
      FreeAndNil(vLista2);
  end;
end;

procedure TfrmCadContratosClientes.SpeedButton6Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI211', 'ABRIR', '', 'GERADOR_OSBOL ', '', Contratos.buscas, true) then
    Exit;

  Contratos._abreFormContratosGerador(0);
end;

procedure TfrmCadContratosClientes.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  vCaptionLote := 'Alteração Contratos Clientes em Lote';
  frmCadContratosClientes.Caption := vCaptionLote;

  Panel52.Height := GroupBox3.Height;
 

  BitBtn2.Visible := False;
  BitBtn3.Visible := False;
  btVoltarDadosProc.Parent := GroupBox3;

  Panel1.Visible := true;
  Panel1.Parent := Panel128;
  Panel2.Visible := False;

  GroupBox3.Parent := Panel52;

  _LerConfiguracoesRegistroBoolean(ckPermOpcaoMarcadas.Name, False);
  
	PageControl1.ActivePage := tsAlterDadosProc;
end;

procedure TfrmCadContratosClientes.SpeedButton8Click(Sender: TObject);
begin
   if not vDadosIni.PesqPros('CLI213', 'AJUSTAR', '', 'CLIENTES_COM_CONTRATO ', '', Contratos.buscas, true) then
     Exit;
   Contratos._abreFormAjustarContratos;
end;

procedure TfrmCadContratosClientes.SpeedButton9Click(Sender: TObject);
begin
  inherited;
	Contratos._abreFormPedidoCompraClienteNfe(0);
end;

procedure TfrmCadContratosClientes.SpeedButtonAlterarProduto2Click(
  Sender: TObject);
var
  vTipoOS: string;
  vGerarNFS: string;
  vGerarNF: string;
  vGerarRecLoc: string;
  vGerarBoleto: string;
  vCodServico: Integer;
  vCodControle: Integer;
	vCodVendedor: Integer;
  I, J: Integer;
  vLista, vLista2: TStrings;
  vIndexFieldNames: string;
  vIndexName: string;
  vRecNo: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('CLI262', 'ABRIR', '', 'CLIENTES_COM_CONTRATO', '', Contratos.buscas, true) then
  	exit;

  Contratos._cancelar;

  try
    vLista := TStringList.Create;
    vLista2 := TStringList.Create;

    vLista := vDadosIni.getConfSisBlob('contratos_clientes_status_contratos', Contratos.buscas);
    if vLista.Count > 0 then
    begin
      cbStatusContrato.Items.Clear;
      for I := 0 to vLista.Count - 1 do
      begin
        vLista2 := vDadosIni.SplitS(vLista[i]);
        for J := 0 to vLista2.Count - 1 do
        begin
          if trim(vLista2[j]) <> '' then
            if cbStatusContrato.Items.IndexOf(trim(vLista2[j])) = -1 then
              cbStatusContrato.Items.Add(trim(vLista2[j]));
        end;
      end;

      if cbStatusContrato.Items.IndexOf('Ativo') = -1 then
        cbStatusContrato.Items.Add('Ativo');
    end;
  finally
    if Assigned(vLista) then
      FreeAndNil(vLista);
    if Assigned(vLista2) then
      FreeAndNil(vLista2);
  end;

  vCodControle := Trunc(_LerConfiguracoesRegistroDouble(EdControle.Name));
  EdControle.AsValue := vCodControle;
  DBLControle.KeyValue := vCodControle;

  vCodVendedor := Trunc(_LerConfiguracoesRegistroDouble(EdVendedor.Name));
  EdVendedor.AsValue := vCodVendedor;
  DBLVendedor.KeyValue := vCodVendedor;

  EdDiaVencimento.AsValue  := _LerConfiguracoesRegistroDouble(EdDiaVencimento.Name);
  EdDiaFaturamento.AsValue := _LerConfiguracoesRegistroDouble(EdDiaFaturamento.Name);
  EdDiasAposVenc.AsValue   := _LerConfiguracoesRegistroDouble(EdDiasAposVenc.Name);

  Contratos.buscas.Close;
  Contratos.buscas.SQL.Text := 'select tipo_os from tipo_vendas' +
    ' where tipo = ''OS'' and venda = ''S'' order by 1';
  Contratos.buscas.Open;

  cbTipoOS.Clear;
  cbTipoOS.ItemIndex := -1;

  Contratos.buscas.First;
  while not Contratos.buscas.Eof do
  begin
    cbTipoOS.Items.Add(Trim(Contratos.buscas.FieldByName('tipo_os').AsString));

    Contratos.buscas.Next;
  end;

  vTipoOS := trim(_LerConfiguracoesRegistroString(cbTipoOS.Name));
  for I := 0 to cbTipoOS.Items.Count - 1 do
    if trim(cbTipoOS.Items[I]) = trim(vTipoOS) then
    begin
      cbTipoOS.ItemIndex := I;
      Break;
    end;

  vGerarNFS := trim(_LerConfiguracoesRegistroString(cbGerarNFS.Name));
  for I := 0 to cbGerarNFS.Items.Count - 1 do
  	if trim(cbGerarNFS.Items[I]) = trim(vGerarNFS) then
    begin
    	cbGerarNFS.ItemIndex := I;
      Break;
    end;

  vGerarNF := trim(_LerConfiguracoesRegistroString(cbGerarNF.Name));
  for I := 0 to cbGerarNF.Items.Count - 1 do
  	if trim(cbGerarNF.Items[I]) = trim(vGerarNF) then
    begin
    	cbGerarNF.ItemIndex := I;
      Break;
    end;

  vGerarRecLoc := trim(_LerConfiguracoesRegistroString(cbGerarRecLoc.Name));
  for I := 0 to cbGerarRecLoc.Items.Count - 1 do
  	if trim(cbGerarRecLoc.Items[I]) = trim(vGerarRecLoc) then
    begin
    	cbGerarRecLoc.ItemIndex := I;
      Break;
    end;

  vGerarBoleto := trim(_LerConfiguracoesRegistroString(cbGerarBoleto.Name));
  for I := 0 to cbGerarBoleto.Items.Count - 1 do
  	if trim(cbGerarBoleto.Items[I]) = trim(vGerarBoleto) then
    begin
    	cbGerarBoleto.ItemIndex := I;
      Break;
    end;

  EdGerarContratosAcada.AsValue:= _LerConfiguracoesRegistroDouble(EdGerarContratosAcada.Name);
  meDataInicialContrato.Text := _LerConfiguracoesRegistroString(meDataInicialContrato.Name);
  meDataFinalContrato.Text := _LerConfiguracoesRegistroString(meDataFinalContrato.Name);
  meDataInicialBoleto.Text := _LerConfiguracoesRegistroString(meDataInicialBoleto.Name);
  cbStatusContrato.ItemIndex := _LerConfiguracoesRegistroInteger(cbStatusContrato.Name);
  meOBS.Text := _LerConfiguracoesRegistroString(meOBS.Name);

  if ckPermOpcaoMarcadas.Checked then
	  ckControle.Checked := _LerConfiguracoesRegistroBoolean(ckControle.Name)
  else
  	ckControle.Checked := false;
  ckControleClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckVendedor.Checked := _LerConfiguracoesRegistroBoolean(ckVendedor.Name)
  else
  	ckVendedor.Checked := false;
  ckVendedorClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckDiaVencimento.Checked := _LerConfiguracoesRegistroBoolean(ckDiaVencimento.Name)
  else
  	ckDiaVencimento.Checked := false;
  ckDiaVencimentoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckDiaFaturamento.Checked := _LerConfiguracoesRegistroBoolean(ckDiaFaturamento.Name)
  else
  	ckDiaFaturamento.Checked := false;
  ckDiaFaturamentoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckDiasAposVenc.Checked := _LerConfiguracoesRegistroBoolean(ckDiasAposVenc.Name)
  else
  	ckDiasAposVenc.Checked := false;
  ckDiasAposVencClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckTipoOS.Checked := _LerConfiguracoesRegistroBoolean(ckTipoOS.Name)
  else
  	ckTipoOS.Checked := false;
  ckTipoOSClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckGerarContratosAcada.Checked := _LerConfiguracoesRegistroBoolean(ckGerarContratosAcada.Name)
  else
  	ckGerarContratosAcada.Checked := false;
  ckGerarContratosAcadaClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckDataInicialFinalContrato.Checked := _LerConfiguracoesRegistroBoolean(ckDataInicialFinalContrato.Name)
  else
  	ckDataInicialFinalContrato.Checked := false;
  ckDataInicialFinalContratoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckDataInicialBoleto.Checked := _LerConfiguracoesRegistroBoolean(ckDataInicialBoleto.Name)
  else
  	ckDataInicialBoleto.Checked := false;
  ckDataInicialBoletoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckStatusContrato.Checked := _LerConfiguracoesRegistroBoolean(ckStatusContrato.Name)
  else
  	ckStatusContrato.Checked := false;
  ckStatusContratoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckOBS.Checked := _LerConfiguracoesRegistroBoolean(ckOBS.Name)
  else
  	ckOBS.Checked := false;
  ckOBSClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckGerarNFS.Checked := _LerConfiguracoesRegistroBoolean(ckGerarNFS.Name)
  else
  	ckGerarNFS.Checked := false;
  ckGerarNFSClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckGerarNF.Checked := _LerConfiguracoesRegistroBoolean(ckGerarNF.Name)
  else
  	ckGerarNF.Checked := false;
  ckGerarNFClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckGerarRecLoc.Checked := _LerConfiguracoesRegistroBoolean(ckGerarRecLoc.Name)
  else
  	ckGerarRecLoc.Checked := false;
  ckGerarRecLocClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckGerarBoleto.Checked := _LerConfiguracoesRegistroBoolean(ckGerarBoleto.Name)
  else
  	ckGerarBoleto.Checked := false;
  ckGerarBoletoClick(Sender);

  try
  	vIndexFieldNames := Contratos.dataSet.IndexFieldNames;
    vIndexName       := Contratos.dataSet.IndexName;
    vRecNo           := Contratos.dataSet.RecNo;

    Contratos.dataSet.DisableControls;
    Contratos.dataSet.Filtered := false;
    Contratos.dataSet.Filter := 'sel = ''S'' ';
    Contratos.dataSet.Filtered := true;

    if Contratos.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum contrato selecionado.', 'Atenção',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      Contratos.dataSet.Refresh;
      exit;
    end;
  finally
  	Contratos.dataSet.Filtered          := false;
    Contratos.dataSet.IndexName         := vIndexName;
    if (trim(vIndexName) = '') and (trim(vIndexFieldNames) = '') then
    	Contratos.dataSet.IndexFieldNames := 'COD_CONTRATO'
    else
	    Contratos.dataSet.IndexFieldNames := vIndexFieldNames;
    if Contratos.dataSet.RecordCount >= vRecNo then
	    Contratos.dataSet.RecNo           := vRecNo;
    Contratos.dataSet.EnableControls;
  end;

  if not Contratos._abreFormContratosAlteracaoEmLote then
  	exit;

  Contratos.dataSet.Refresh;
end;

procedure TfrmCadContratosClientes.SpeedButtonAlterarProdutoClick(
  Sender: TObject);
begin
  inherited;
	TelaCadastro := 5;
  SpeedButton1Click(Sender);
end;

end.
