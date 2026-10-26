unit USugestaoCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, UClasseSugestaoCompras, UDtmSugestaoCompras,
  uDadosIni, uDtmAtivo, CheckLst, uEditMoeda, AppEvnts;

type
  TFrmSugestaoCompra = class(TfrmCadPadraoM)
    tsSugestao: TTabSheet;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Label8: TLabel;
    CheckProdMov: TCheckBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label24: TLabel;
    Label13: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    DBLookupComboBoxGrupoProdSugIni: TDBLookupComboBox;
    DBLookupComboBoxGrupoProdSugFim: TDBLookupComboBox;
    DBLookupComboBoxSubGrupoProdSugIni: TDBLookupComboBox;
    DBLookupComboBoxSubGrupoProdSugFim: TDBLookupComboBox;
    DBLookupComboBoxGradeProdSugIni: TDBLookupComboBox;
    DBLookupComboBoxGradeProdSugFim: TDBLookupComboBox;
    DBLookupComboBoxMarcaProdSugIni: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    ProgressBar1: TProgressBar;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    MaskEdit4: TMaskEdit;
    CheckSugPorGrade: TCheckBox;
    RadioGroup1: TRadioGroup;
    GroupBox6: TGroupBox;
    GroupBox33: TGroupBox;
    Label126: TLabel;
    Label136: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    ComboBox13: TComboBox;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    CheckListBoxMercado: TCheckListBox;
    Label26: TLabel;
    CheckListBoxOrigem: TCheckListBox;
    Label27: TLabel;
    GroupBox11: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    ComboVlDem: TComboBox;
    ComboVlEstoque: TComboBox;
    ComboVolume: TComboBox;
    ComboFrequencia: TComboBox;
    ComboPrecoUn: TComboBox;
    ComboPopularidade: TComboBox;
    ComboAtualidade: TComboBox;
    EditGrupoProdSugIni: TEditMoeda;
    EditGrupoProdSugFim: TEditMoeda;
    EditSubGrupoProdSugIni: TEditMoeda;
    EditSubGrupoProdSugFim: TEditMoeda;
    EditGradeProdSugIni: TEditMoeda;
    EditGradeProdSugFim: TEditMoeda;
    EditMarcaProdSugIni: TEditMoeda;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    BitBtn8: TBitBtn;
    Label9: TLabel;
    BitBtn7: TBitBtn;
    GroupBox9: TGroupBox;
    StGradS: TStringGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    EditMarcaProdSugFim: TEditMoeda;
    DBLookupComboBoxMarcaProdSugFim: TDBLookupComboBox;
    Label14: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    CheckArrendVlSug: TCheckBox;
    CheckExcGrupo: TCheckBox;
    CheckExcSubGrupo: TCheckBox;
    CheckExcGrades: TCheckBox;
    CheckexecMarcas: TCheckBox;
    CheckMostrarUltimaVnd: TCheckBox;
    BitBtn16: TBitBtn;
    TabSheet7: TTabSheet;
    pnListaCotacao: TPanel;
    GroupBox12: TGroupBox;
    GroupBox10: TGroupBox;
    Label17: TLabel;
    Label23: TLabel;
    GroupBox13: TGroupBox;
    DBGrid4: TDBGrid;
    BitBtn18: TBitBtn;
    BitBtn17: TBitBtn;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Edit1: TEdit;
    Memo1: TMemo;
    CheckDescrRed: TCheckBox;
    SpeedButton59: TSpeedButton;
    tsMultiempresa: TTabSheet;
    pnMultiempresa: TPanel;
    pnMultiempresaBottom: TPanel;
    btnMultiempresaOK: TBitBtn;
    btnMultiempresaCancelar: TBitBtn;
    DBGridMultiempresa: TDBGrid;
    SpeedButtonMultiempresaSel: TSpeedButton;
    SpeedButtonMultiempresaDesm: TSpeedButton;
    btDefinirEmp: TBitBtn;
    SpeedButtonSelTodos: TSpeedButton;
    SpeedButtonDesTodos: TSpeedButton;
    tsMontarPedidoCompra: TTabSheet;
    pnMontarPedidoCompra: TPanel;
    pnMontarPedidoCompraClient: TPanel;
    pnMontarPedidoCompraBottom: TPanel;
    Splitter3: TSplitter;
    btMontarPedidoCompraOK: TBitBtn;
    btMontarPedidoCompraCancelar: TBitBtn;
    GroupBoxMontarPedidoCompraProdDet: TGroupBox;
    DBGridMontarPedidoCompraProdDet: TDBGrid;
    GroupBoxMontarPedidoCompraClient: TGroupBox;
    DBGridMontarPedidoCompraProd: TDBGrid;
    pnProgressBar: TPanel;
    lbProgressBar: TLabel;
    ProgressBar2: TProgressBar;
    GroupBoxMontarPedidoCompraTop: TGroupBox;
    Panel6: TPanel;
    ckFiltrarPorFornecedor: TCheckBox;
    DBGridMontarPedidoCompraProdTop: TDBGrid;
    Splitter5: TSplitter;
    tsMontarPedidoCompra2: TTabSheet;
    pnMontarPedidoCompra2: TPanel;
    pnMontarPedidoCompra2Top: TPanel;
    lbVendedor2: TLabel;
    EditMoedaVend2: TEditMoeda;
    DBLookupComboBoxVend2: TDBLookupComboBox;
    Label28: TLabel;
    EditMoedaCondPag2: TEditMoeda;
    DBLookupComboBoxCondPag2: TDBLookupComboBox;
    Label29: TLabel;
    ComboBoxTipoPedido2: TComboBox;
    pnMontarPedidoCompra2Fornec: TPanel;
    pnMontarPedidoCompra2Bottom: TPanel;
    BitBtnMontarPedidoCompra2OK: TBitBtn;
    BitBtnMontarPedidoCompra2Cancel: TBitBtn;
    pnInfPedido: TPanel;
    RadioGroupOrdenarCliente: TRadioGroup;
    lbInfPedido: TLabel;
    Label30: TLabel;
    EditMoedaFornec2: TEditMoeda;
    EditMoedaEmpFornec2: TEditMoeda;
    ckFiltrarPorEmpresa: TCheckBox;
    DBLookupComboBoxFornec2: TDBLookupComboBox;
    SpeedButtonSelTodosEmpFornec: TSpeedButton;
    SpeedButtonDesTodosEmpFornec: TSpeedButton;
    DBGridMontarPedidoCompraProdTop2: TDBGrid;
    ckSalvarOpcoes: TCheckBox;
    SpeedButtonBuscasProdutosSug: TSpeedButton;
    tsBuscarProdutosSugCompras: TTabSheet;
    pnLocalizarProdSug: TPanel;
    Panel4: TPanel;
    BitBtnLocalizarProdSugOK: TBitBtn;
    BitBtnLocalizarProdSugCancel: TBitBtn;
    GroupBoxLocalizarProdSugAlClient: TGroupBox;
    DBGridLocalizarProdSug: TDBGrid;
    GroupBoxLocalizarProdSugTop: TGroupBox;
    lbGrupoProd: TLabel;
    EditGrupoProd: TEdit;
    lbCodProd: TLabel;
    EditCodProd: TEdit;
    lbNumFabr: TLabel;
    EditNumFabr: TEdit;
    BitBtnLocalizarProdSugAlClient: TBitBtn;
    lbDescrProd: TLabel;
    EditDescrProd: TEdit;
    SpeedButtonSelTodosProd: TSpeedButton;
    SpeedButtonDesTodosProd: TSpeedButton;
    Panel5: TPanel;
    Label31: TLabel;
    CheckExibirTransf: TCheckBox;
    tsOpcoesSug: TTabSheet;
    pnOpcoesSug: TPanel;
    pnOpcoesSugBottom: TPanel;
    CheckMostrarUltimaVnd2: TCheckBox;
    CheckExibirTransf2: TCheckBox;
    pnOpcoesSugOK: TBitBtn;
    pnOpcoesSugCancel: TBitBtn;
    CheckMostrarDescrRed2: TCheckBox;
    BitBtn19: TBitBtn;
    tsMontarTransferencias: TTabSheet;
    pnMontarTrasferencias: TPanel;
    GroupBoxMontarTrasferenciasTop: TGroupBox;
    GroupBoxMontarTrasferenciasAlClient: TGroupBox;
    DBGridMontarTrasferenciasAlClient: TDBGrid;
    pnMontarTrasferenciasAlBottom: TPanel;
    BitBtnMontarTrasferenciasOK: TBitBtn;
    BitBtnMontarTrasferenciasCancel: TBitBtn;
    DBGridMontarTrasferenciasTop: TDBGrid;
    Splitter4: TSplitter;
    BitBtn20: TBitBtn;
    tsOpcoesTransf: TTabSheet;
    pnMontarTrasferencias3: TPanel;
    pnMontarTrasferencias3Cliente: TPanel;
    pnMontarTrasferencias3Bottom: TPanel;
    BitBtnMontarTrasferencias3OK: TBitBtn;
    BitBtnMontarTrasferencias3Cancel: TBitBtn;
    pnMontarTrasferenciasTop: TPanel;
    Panel8: TPanel;
    Label36: TLabel;
    SpeedButtonSelTodosEmpTransf: TSpeedButton;
    SpeedButtonDesTodosEmpTranf: TSpeedButton;
    GroupBoxMontarTrasferenciasDest: TGroupBox;
    GroupBox16: TGroupBox;
    Label33: TLabel;
    EditMoedaCondPag3: TEditMoeda;
    DBLookupComboBoxCondPag3: TDBLookupComboBox;
    pnMontarTrasferenciasDest: TPanel;
    GroupBoxMontarTrasferenciasOrig: TGroupBox;
    Label32: TLabel;
    Label35: TLabel;
    EditMoedaVend3: TEditMoeda;
    DBLookupComboBoxVend3: TDBLookupComboBox;
    EditMoedaCliente3: TEditMoeda;
    EditMoedaEmpCliente3: TEditMoeda;
    DBLookupComboBoxCliente3: TDBLookupComboBox;
    Label37: TLabel;
    EditMoedaFornecedor3: TEditMoeda;
    DBLookupComboBoxFornecedor3: TDBLookupComboBox;
    Label34: TLabel;
    ComboBoxTipoVenda3: TComboBox;
    Label38: TLabel;
    ComboBoxTipoPedido3: TComboBox;
    EditMoedaEmpFornecedor3: TEditMoeda;
    Label39: TLabel;
    DBLookupComboBoxVendPed3: TDBLookupComboBox;
    EditMoedaVendPed3: TEditMoeda;
    Label40: TLabel;
    ComboBoxOrigemVenda3: TComboBox;
    procedure DBLookupComboBoxVendPed3Exit(Sender: TObject);
    procedure DBLookupComboBoxFornecedor3Exit(Sender: TObject);
    procedure EditMoedaVend3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditMoedaVendPed3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditMoedaVendPed3Exit(Sender: TObject);
    procedure EditMoedaFornecedor3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditMoedaFornecedor3Exit(Sender: TObject);
    procedure EditMoedaCliente3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonDesTodosEmpTranfClick(Sender: TObject);
    procedure SpeedButtonSelTodosEmpTransfClick(Sender: TObject);
    procedure DBGridMontarTrasferenciasAlClientDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridMontarTrasferenciasAlClientKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBGridMontarTrasferenciasAlClientCellClick(Column: TColumn);
    procedure BitBtnMontarTrasferencias3CancelClick(Sender: TObject);
    procedure BitBtnMontarTrasferencias3OKClick(Sender: TObject);
    procedure pnMontarTrasferencias3Enter(Sender: TObject);
    procedure DBLookupComboBoxCondPag3Exit(Sender: TObject);
    procedure EditMoedaCondPag3Exit(Sender: TObject);
    procedure DBLookupComboBoxVend3Exit(Sender: TObject);
    procedure EditMoedaVend3Exit(Sender: TObject);
    procedure EditMoedaCliente3Exit(Sender: TObject);
    procedure DBLookupComboBoxCliente3Exit(Sender: TObject);
    procedure Splitter4Moved(Sender: TObject);
    procedure DBGridMontarTrasferenciasTopKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBGridMontarTrasferenciasTopDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridMontarTrasferenciasTopCellClick(Column: TColumn);
    procedure BitBtnMontarTrasferenciasCancelClick(Sender: TObject);
    procedure BitBtnMontarTrasferenciasOKClick(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure pnOpcoesSugEnter(Sender: TObject);
    procedure pnOpcoesSugCancelClick(Sender: TObject);
    procedure pnOpcoesSugOKClick(Sender: TObject);
    procedure EditCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure EditGrupoProdKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnLocalizarProdSugAlClientClick(Sender: TObject);
    procedure BitBtnLocalizarProdSugCancelClick(Sender: TObject);
    procedure BitBtnLocalizarProdSugOKClick(Sender: TObject);
    procedure SpeedButtonDesTodosProdClick(Sender: TObject);
    procedure SpeedButtonSelTodosProdClick(Sender: TObject);
    procedure pnLocalizarProdSugEnter(Sender: TObject);
    procedure SpeedButtonBuscasProdutosSugClick(Sender: TObject);
    procedure EditMoedaVend2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonDesTodosEmpFornecClick(Sender: TObject);
    procedure SpeedButtonSelTodosEmpFornecClick(Sender: TObject);
    procedure DBGridMontarPedidoCompraProdTopKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBGridMontarPedidoCompraProdTopDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridMontarPedidoCompraProdTopCellClick(Column: TColumn);
    procedure DBGridMontarPedidoCompraProdTitleClick(Column: TColumn);
    procedure EditMoedaFornec2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBoxFornec2Exit(Sender: TObject);
    procedure EditMoedaFornec2Exit(Sender: TObject);
    procedure ckFiltrarPorEmpresaClick(Sender: TObject);
    procedure pnMontarPedidoCompra2Enter(Sender: TObject);
    procedure DBLookupComboBoxCondPag2Exit(Sender: TObject);
    procedure EditMoedaCondPag2Exit(Sender: TObject);
    procedure DBLookupComboBoxVend2Exit(Sender: TObject);
    procedure EditMoedaVend2Exit(Sender: TObject);
    procedure BitBtnMontarPedidoCompra2CancelClick(Sender: TObject);
    procedure BitBtnMontarPedidoCompra2OKClick(Sender: TObject);
    procedure RadioGroupOrdenarClienteClick(Sender: TObject);
    procedure Splitter5Moved(Sender: TObject);
    procedure ckFiltrarPorFornecedorClick(Sender: TObject);
    procedure btMontarPedidoCompraCancelarClick(Sender: TObject);
    procedure btMontarPedidoCompraOKClick(Sender: TObject);
    procedure DBGridMontarPedidoCompraProdKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBGridMontarPedidoCompraProdDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridMontarPedidoCompraProdCellClick(Column: TColumn);
    procedure Splitter3Moved(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButtonDesTodosClick(Sender: TObject);
    procedure SpeedButtonSelTodosClick(Sender: TObject);
    procedure btDefinirEmpClick(Sender: TObject);
    procedure pnMultiempresaEnter(Sender: TObject);
    procedure SpeedButtonMultiempresaDesmClick(Sender: TObject);
    procedure SpeedButtonMultiempresaSelClick(Sender: TObject);
    procedure DBGridMultiempresaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridMultiempresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridMultiempresaCellClick(Column: TColumn);
    procedure btnMultiempresaCancelarClick(Sender: TObject);
    procedure btnMultiempresaOKClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBoxMarcaProdSugFimExit(Sender: TObject);
    procedure EditMarcaProdSugFimExit(Sender: TObject);
    procedure EditMarcaProdSugIniExit(Sender: TObject);
    procedure EditGradeProdSugFimExit(Sender: TObject);
    procedure EditGradeProdSugIniExit(Sender: TObject);
    procedure EditSubGrupoProdSugFimExit(Sender: TObject);
    procedure EditSubGrupoProdSugIniExit(Sender: TObject);
    procedure EditGrupoProdSugFimExit(Sender: TObject);
    procedure EditGrupoProdSugIniExit(Sender: TObject);
    procedure DBLookupComboBoxMarcaProdSugIniExit(Sender: TObject);
    procedure DBLookupComboBoxGradeProdSugFimExit(Sender: TObject);
    procedure DBLookupComboBoxGradeProdSugIniExit(Sender: TObject);
    procedure DBLookupComboBoxSubGrupoProdSugFimExit(Sender: TObject);
    procedure DBLookupComboBoxSubGrupoProdSugIniExit(Sender: TObject);
    procedure DBLookupComboBoxGrupoProdSugFimExit(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure StGradSDblClick(Sender: TObject);
    procedure DBLookupComboBoxGrupoProdSugIniExit(Sender: TObject);
    procedure CheckSugPorGradeClick(Sender: TObject);
    procedure StGradSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure MaskEdit14Exit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  FrmSugestaoCompra: TFrmSugestaoCompra;
  Sugestao: TSugestao;

implementation

uses uDataSet_OOP, DB;

{$R *.dfm}

procedure TFrmSugestaoCompra.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if (copy(StGradS.cells[1, StGradS.Row], 1, 3) <> 'CMP')
  	and (copy(StGradS.cells[1, StGradS.Row], 1, 3) <> 'VND')
    and (copy(StGradS.cells[1, StGradS.Row], 1, 3) <> 'TRF')
  	and (trim(StGradS.Cells[1, StGradS.Row]) <> 'GR.')
    and (trim(StGradS.Cells[12, StGradS.Row]) <> '')
    and (trim(StGradS.Cells[13, StGradS.Row]) <> '')
    and (trim(StGradS.Cells[14, StGradS.Row]) <> '') then
  begin
    Sugestao.DemandaMensal(
      StGradS.Cells[13, StGradS.Row],
      strtoint((trim(StGradS.Cells[12, StGradS.Row]))),
      strtoint((trim(StGradS.Cells[14, StGradS.Row]))));
    TabSheet5.Show;
    TabSheet5.TabVisible := true;
    TabSheet5.Caption := 'Valor Mensal Venda ' + 'do Produto: ' +
      StGradS.Cells[12, StGradS.Row] +
      '  ' + StGradS.Cells[13, StGradS.Row] +
      '  ' + StGradS.Cells[11, StGradS.Row];
    Label9.caption := 'Média mensal: ' + StGradS.Cells[5, StGradS.Row];
    if Sugestao.qtdMesSug > 1 then
      Label9.caption := Label9.caption + '   [Considerados ' + IntToStr(Sugestao.qtdMesSug) + ' meses na sugestão]'
    else
    	Label9.caption := Label9.caption + '   [Considerados ' + IntToStr(Sugestao.qtdMesSug) + ' mês na sugestão]' ;
  end;
end;

procedure TFrmSugestaoCompra.BitBtn11Click(Sender: TObject);
begin
  inherited;
//  if (copy(StGradS.cells[1, StGradS.Row], 1, 3) <> 'CMP') and (trim(StGradS.Cells[1, StGradS.Row])<>'GR.') then
	if (Trim(StGradS.cells[12, StGradS.Row]) <> '')
  	and (Trim(StGradS.cells[13, StGradS.Row]) <> '')
    and (Trim(StGradS.cells[14, StGradS.Row]) <> '') then
  begin
    Sugestao.obBuscaClasse.ProdutoTemSimilar(
    	StGradS.Cells[13, StGradS.Row],
      StrToInt((trim(StGradS.Cells[12, StGradS.Row]))),
      trim(StGradS.Cells[14, StGradS.Row]));
    if Sugestao.obBuscaClasse.buscas.IsEmpty then
    begin
      Application.MessageBox(Pchar('Produto: ' + trim(StGradS.Cells[12, StGradS.Row])
        + '  ' + trim(StGradS.Cells[13, StGradS.Row])
        + '  ' + trim(StGradS.Cells[11, StGradS.Row]) + ' não possui similar'), 'Aviso', MB_OK +
        MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    end
    else
    begin
      TabSheet6.Show;
      TabSheet6.TabVisible := true;
      TabSheet5.Caption := 'Produtos similares ao produto: ' + trim(StGradS.Cells[12, StGradS.Row])
        + '  ' + trim(StGradS.Cells[13, StGradS.Row])
        + '  ' + trim(StGradS.Cells[11, StGradS.Row]);
    end;
  end;
end;

procedure TFrmSugestaoCompra.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('SUGESTAO_COMPRA', 'A', Sugestao.buscas) then
    Exit;
  Sugestao.alteraSugestao;
end;

procedure TFrmSugestaoCompra.BitBtn13Click(Sender: TObject);
var
  vpar: ArrayBi;
  i,ix,j: integer;
  vexcep: string;
begin
  inherited;
  i:=1;
  SetLength(vpar, i, 2);
  if CheckExcGrupo.Checked then
   vexcep:=' EXCETO'
  else
   vexcep:='';
  vpar[i-1,0]:='GRUPO INICIAL......: ';
  vpar[i-1,1]:=vDadosIni.StrZero(floattostr(EditGrupoProdSugIni.Valor),4)+' '+DBLookupComboBoxGrupoProdSugIni.Text+vexcep;
  i:=i+1;
  SetLength(vpar, i, 2);
  vpar[i-1,0]:='GRUPO FINAL........: ';
  vpar[i-1,1]:=vDadosIni.StrZero(floattostr(EditGrupoProdSugFim.Valor),4)+' '+DBLookupComboBoxGrupoProdSugIni.Text+vexcep;
  
  i:=i+1;
  SetLength(vpar, i, 2);
  if CheckExcSubGrupo.Checked then
   vexcep:=' EXCETO'
  else
   vexcep:='';
  vpar[i-1,0]:='SUBGRUPO INICIAL...: ';
  vpar[i-1,1]:=vDadosIni.StrZero(floattostr(EditSubGrupoProdSugIni.Valor),4)+' '+DBLookupComboBoxSubGrupoProdSugIni.Text+vexcep;
  i:=i+1;
  SetLength(vpar, i, 2);
  vpar[i-1,0]:='SUBGRUPO FINAL.....: ';
  vpar[i-1,1]:=vDadosIni.StrZero(floattostr(EditSubGrupoProdSugFim.Valor),4)+' '+DBLookupComboBoxSubGrupoProdSugFim.Text+vexcep;

  i:=i+1;
  SetLength(vpar, i, 2);
  if CheckExcGrades.Checked then
   vexcep:=' EXCETO'
  else
   vexcep:='';
  vpar[i-1,0]:='GRADE INICIAL......: ';
  vpar[i-1,1]:=vDadosIni.StrZero(floattostr(EditGradeProdSugIni.Valor),4)+' '+DBLookupComboBoxGradeProdSugIni.Text+vexcep;
  i:=i+1;
  SetLength(vpar, i, 2);
  vpar[i-1,0]:='GRADE FINAL........: ';
  vpar[i-1,1]:=vDadosIni.StrZero(floattostr(EditGradeProdSugFim.Valor),4)+' '+DBLookupComboBoxGradeProdSugFim.Text+vexcep;

  i:=i+1;
  SetLength(vpar, i, 2);
  if CheckexecMarcas.Checked then
   vexcep:=' EXCETO'
  else
   vexcep:='';
  vpar[i-1,0]:='MARCA INICIAL......: ';
  vpar[i-1,1]:=vDadosIni.StrZero(floattostr(EditMarcaProdSugIni.Valor),4)+' '+DBLookupComboBoxMarcaProdSugIni.Text+vexcep;
  i:=i+1;
  SetLength(vpar, i, 2);
  vpar[i-1,0]:='MARCA FINAL........: ';
  vpar[i-1,1]:=vDadosIni.StrZero(floattostr(EditMarcaProdSugFim.Valor),4)+' '+DBLookupComboBoxMarcaProdSugFim.Text+vexcep;

  i:=i+1;
  SetLength(vpar, i, 2);
  vpar[i-1,0]:='ATRIBUTOS..........: ';
  vpar[i-1,1]:=ComboVlDem.text+ComboVlEstoque.text+ComboPrecoUn.text+ComboPopularidade.text+
  	ComboVolume.text+ComboFrequencia.text+ComboAtualidade.text;

  i:=i+1;
  SetLength(vpar, i, 2);
  vpar[i-1,0]:='MERCADO............: ';
  vpar[i-1,1]:='';
  vexcep:='';
  j:=0;
  for ix := 0 to CheckListBoxMercado.Items.Count - 1 do
  begin
    if CheckListBoxMercado.Checked[ix] then
    begin
   	 if Length('MERCADO............: ' + vexcep + CheckListBoxMercado.Items[ix] + '|') >= 132 then
     begin
     	 j:=j+1;
     	 vpar[i-1,1]:=vexcep;
			 i:=i+1;
       vexcep:='                     ' + CheckListBoxMercado.Items[ix] + '|';
       SetLength(vpar, i, 2+j);
     end
     else
     	 vexcep := vexcep + CheckListBoxMercado.Items[ix] + '|';
    end;
  end;
  vpar[i-1,1]:=vexcep;

  i:=i+1;
  SetLength(vpar, i, 2);
  vpar[i-1,0]:='ORIGEM.............: ';
  vpar[i-1,1]:='';
  vexcep:='';
  j:=0;
  for ix := 0 to CheckListBoxOrigem.Items.Count - 1 do
  begin
    if CheckListBoxOrigem.Checked[ix] then
    begin
   	 if Length('ORIGEM.............: ' + vexcep + CheckListBoxOrigem.Items[ix] + '|') >= 132 then
     begin
     	 j:=j+1;
     	 vpar[i-1,1]:=vexcep;
			 i:=i+1;
       vexcep:='                     ' + CheckListBoxOrigem.Items[ix] + '|';
       SetLength(vpar, i, 2+j);
     end
     else
     	 vexcep := vexcep + CheckListBoxOrigem.Items[ix] + '|';
    end;
  end;
  vpar[i-1,1]:=vexcep;

  try
		Sugestao.vEmpresasSugestao.dataSet.Filtered := false;
    Sugestao.vEmpresasSugestao.dataSet.Filter := 'SEL = ''S'' ';
    Sugestao.vEmpresasSugestao.dataSet.Filtered := true;

    i:=i+1;
    SetLength(vpar, i, 2);
    vpar[i-1,0]:='EMPRESA............: ';
    vpar[i-1,1]:='';
    vexcep:='';
    j:=0;
    if Sugestao.vEmpresasSugestao.dataSet.RecordCount > 0 then
    begin
      Sugestao.vEmpresasSugestao.dataSet.First;
      while not Sugestao.vEmpresasSugestao.dataSet.Eof do
      begin
      	if Length('EMPRESA............: ' + vexcep +
          Sugestao.vEmpresasSugestao.dataSet.FieldByName('COD_EMPRESA').AsString + ' - ' +
          Sugestao.vEmpresasSugestao.dataSet.FieldByName('IDENTIFICACAO_EMP').AsString + '|') >= 132 then
        begin
        	j:=j+1;
          vpar[i-1,1]:=vexcep;
          i:=i+1;
          vexcep:='                     ' +
          	Sugestao.vEmpresasSugestao.dataSet.FieldByName('COD_EMPRESA').AsString + ' - ' +
          	Sugestao.vEmpresasSugestao.dataSet.FieldByName('IDENTIFICACAO_EMP').AsString + '|';
          SetLength(vpar, i, 2+j);
        end
        else
	      	vexcep := vexcep +
          	Sugestao.vEmpresasSugestao.dataSet.FieldByName('COD_EMPRESA').AsString + ' - ' +
          	Sugestao.vEmpresasSugestao.dataSet.FieldByName('IDENTIFICACAO_EMP').AsString + '|';

        Sugestao.vEmpresasSugestao.dataSet.Next;
      end;
    end
    else
    begin
    	if Length('EMPRESA............: ' + vexcep +
      	vDadosIni.codEmpresa + ' - ' +
      	vDadosIni.vEmp.vnomeEmpresa + ' - ' + vDadosIni.vEmp.vCNPJ + '|') >= 132 then
      begin
        j:=j+1;
        vpar[i-1,1]:=vexcep;
        i:=i+1;
        vexcep:='                     ' +
        	vDadosIni.codEmpresa + ' - ' +
        	vDadosIni.vEmp.vnomeEmpresa + ' - ' + vDadosIni.vEmp.vCNPJ + '|';
        SetLength(vpar, i, 2+j);
      end
      else
	    	vexcep := vexcep +
        	vDadosIni.codEmpresa + ' - ' +
        	vDadosIni.vEmp.vnomeEmpresa + ' - ' + vDadosIni.vEmp.vCNPJ + '|';
    end;

    vpar[i-1,1]:=vexcep;
  finally
    Sugestao.vEmpresasSugestao.dataSet.Filtered := false;
  end;
//      i:=i+1;
//    SetLength(vpar, i, 2);
//    vpar[i-1,0]:='';
//    vpar[i-1,1]:=vexcep;
  Sugestao.imprimirSugestao(vpar);
end;

procedure TFrmSugestaoCompra.BitBtn14Click(Sender: TObject);
var
  somenteGradeTemp: boolean;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('SUGESTAO_COMPRA', 'I', Sugestao.buscas) then
    Exit;
  try
    strtoint(maskedit4.text);
    strtoint(maskedit14.text);
    strtoint(maskedit15.text);
    strtoint(maskedit16.text);
    strtoint(maskedit17.text);
  except
    Application.MessageBox('Erro de Conversão dos dados do tempo cíclico', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TMaskEdit(sender).CanFocus) then
    	TMaskEdit(sender).setfocus;
    exit;
  end;
  try
    strtoint(combobox13.text);
  except
    Application.MessageBox('Erro de Conversão dos dados do tempo cíclico', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TComboBox(sender).CanFocus) then
    	TComboBox(sender).setfocus;
    exit;
  end;

  try
    Screen.Cursor := crHourGlass;
    Panel3.Enabled := false;
    GroupBox1.Enabled := false;
    GroupBox4.Enabled := false;
    GroupBox11.Enabled := false;
    GroupBox6.Enabled := false;
    Panel3.Enabled := false;
    Panel3.Visible := false;
    BitBtn14.Enabled := false;
    btDefinirEmp.Enabled := false;

    BitBtn15.Enabled := true;
    BitBtn20.Enabled := true;
    
    if RadioGroup1.ItemIndex = 0 then
      somenteGradeTemp := true
    else
      somenteGradeTemp := false;

    PageControl3.ActivePage := tsSugestao;
    tsSugestao.TabVisible := true;
//    GroupBox9.Enabled:=false;

    BitBtn10.Enabled := false;
    BitBtn11.Enabled := false;
    BitBtn12.Enabled := false;
    BitBtn9.Enabled := false;
    BitBtn16.Enabled := false;
    BitBtn19.Enabled := false;
    SpeedButtonSelTodos.Enabled := false;
    SpeedButtonDesTodos.Enabled := false;
    SpeedButtonBuscasProdutosSug.Enabled := false;
    BitBtn13.Enabled := false;
    pnProgressBar.Visible := true;

	  if Sugestao.ExecutaSugestao(StrToInt(MaskEdit4.Text), StrToInt(MaskEdit14.Text),
      StrToInt(MaskEdit15.Text), StrToInt(MaskEdit16.Text), StrToInt(MaskEdit17.Text),
      StrToInt(ComboBox13.Text), CheckSugPorGrade.Checked, somenteGradeTemp, CheckProdMov.Checked,
      CheckListBoxMercado, CheckListBoxOrigem, FloatToStr(EditGrupoProdSugIni.Valor), FloatToStr(EditGrupoProdSugFim.Valor),
      FloatToStr(EditSubGrupoProdSugIni.Valor), FloatToStr(EditSubGrupoProdSugFim.Valor),
      FloatToStr(EditGradeProdSugIni.Valor), FloatToStr(EditGradeProdSugFim.Valor),
      FloatToStr(EditMarcaProdSugIni.Valor), FloatToStr(EditMarcaProdSugFim.Valor),
      ComboVlDem.Text, ComboVlEstoque.Text, ComboPrecoUn.Text, ComboPopularidade.Text,
      ComboVolume.Text, ComboFrequencia.Text, ComboAtualidade.Text,CheckArrendVlSug.checked,
      CheckExcGrupo,CheckExcSubGrupo,CheckExcGrades,CheckexecMarcas,
      CheckMostrarUltimaVnd,CheckDescrRed,CheckExibirTransf) then
    begin
    	BitBtn15.Enabled := false;
    	BitBtn20.Enabled := false;
      
      BitBtn4.Enabled := true;
//      GroupBox9.Enabled:=true;
      tsSugestao.Caption := 'Sugestão de compra feita em ' + DateToStr(vDadosIni.getDataBanco(Sugestao.buscas));
//      BitBtn16.Visible := (Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger > 0);
      TabSheet3.TabVisible := false;
      TabSheet5.TabVisible := false;
      TabSheet6.TabVisible := false;
      TabSheet7.TabVisible := false;
      TabSheet4.Show;
    end
    else
    begin
      BitBtn4.Enabled := false;
    end;
  finally
    Screen.Cursor := crDefault;

    BitBtn10.Enabled := true;
    BitBtn11.Enabled := true;
    BitBtn12.Enabled := true;
    BitBtn9.Enabled := true;
    BitBtn16.Enabled := true;

    if Sugestao.vExisteGrade then
    	BitBtn19.Enabled := (Sugestao.vExisteGrade) and (CheckExibirTransf.Checked)
    else
			BitBtn19.Enabled := CheckExibirTransf.Checked;

    SpeedButtonSelTodos.Enabled := true;
    SpeedButtonDesTodos.Enabled := true;
    SpeedButtonBuscasProdutosSug.Enabled := true;
    BitBtn13.Enabled := true;
    pnProgressBar.Visible := false;
    
    GroupBox1.Enabled := true;
    GroupBox4.Enabled := true;
    GroupBox11.Enabled := true;
    GroupBox6.Enabled := true;
    Panel3.Enabled := true;
    Panel3.Visible := true;
    BitBtn14.Enabled := true;
    btDefinirEmp.Enabled := true;
    BitBtn15.Enabled := false;
    BitBtn20.Enabled := false;
//    GroupBox9.Enabled:=true;
  end;
end;

procedure TFrmSugestaoCompra.BitBtn15Click(Sender: TObject);
begin
  inherited;
  Sugestao.Parar := true;
  if Sugestao.PararProcessamento then
  begin
    GroupBox1.Enabled := true;
    GroupBox4.Enabled := true;
    GroupBox11.Enabled := true;
    GroupBox6.Enabled := true;
    Panel3.Enabled := true;
    Panel3.Visible := true;
    BitBtn4.Enabled := false;
    BitBtn14.Enabled := true;
    btDefinirEmp.Enabled := true;
    BitBtn15.Enabled := false;
    BitBtn20.Enabled := false;
  end;
end;

procedure TFrmSugestaoCompra.BitBtn16Click(Sender: TObject);
var
	vOK: Boolean;
  I: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LISTA_COTACAO', 'I', Sugestao.buscas) then
    Exit;

  vOK := false;
  for i := 1 to StGradS.RowCount - 1 do
  	if (trim(StGradS.cells[9, i]) = 'SEL')
    	and (trim(StGradS.Cells[7, I]) <> '')
    	and (trim(StGradS.Cells[7, I]) <> '0') then
  	begin
    	vOK := True;
      Break;
    end;

  if not vOK then
  begin
    Application.MessageBox(Pchar('Nenhum produto com quantidade sugerida selecionado, favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger <= 0 then
  begin
		if not Sugestao.Post then
  		exit;
	  BitBtn4.Enabled := false;
    if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger > 0 then
	    tsSugestao.Caption := 'Sugestão de compra Nº: ' + inttostr(Sugestao.dataSet.FieldByName('COD_SUGESTAO').asinteger) + ' feita em ' + Sugestao.dataSet.FieldByName('DT_SUGESTAO').AsString;
  end;

  if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger <= 0 then
  begin
  	Application.MessageBox(Pchar('Favor salvar a sugestão de compra antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  Sugestao.abreListaCotacao;
end;

procedure TFrmSugestaoCompra.BitBtn17Click(Sender: TObject);
begin
  inherited;
  TForm(pnListaCotacao.Parent).ModalResult := IDCANCEL; 
  TabSheet4.Show;
  PageControl2.ActivePage := TabSheet4;
end;

procedure TFrmSugestaoCompra.BitBtn18Click(Sender: TObject);
var
 vSel: boolean;
begin
  inherited;
  vSel := false;

  if trim(Edit1.Text) = '' then
  begin
   Application.MessageBox('Descrição da lista de cotação deve ser informada', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
   if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
     Edit1.SetFocus;
   exit;
  end;

  try
  	Sugestao.fTempListaCotacao.DisableControls;
    Sugestao.fTempListaCotacao.First;
    while not Sugestao.fTempListaCotacao.Eof do
    begin
      if Sugestao.fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
        vSel := true;
      Sugestao.fTempListaCotacao.Next;
    end;
  finally
  	Sugestao.fTempListaCotacao.First;
    Sugestao.fTempListaCotacao.DisableControls;
  end;

  if not vSel then
  begin
    Application.MessageBox('Nenhum produto se encontra selecionado na lista de cotação.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  TForm(pnListaCotacao.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestaoCompra.BitBtn19Click(Sender: TObject);
var
  vOK: Boolean;
  I: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_COMPRA', 'I', Sugestao.buscas) then
    Exit;

  vOK := false;
  for i := 1 to StGradS.RowCount - 1 do
  	if (trim(StGradS.cells[9, i]) = 'SEL')
    	and (trim(copy(StGradS.cells[1, I], 1, 3)) = 'TRF') then
  	begin
    	vOK := True;
      Break;
    end;

  if not vOK then
  begin
    Application.MessageBox(Pchar('Nenhuma transferência selecionada, favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger <= 0 then
  begin
    if not Sugestao.Post then
      exit;
	  BitBtn4.Enabled := false;
    if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger > 0 then
	    tsSugestao.Caption := 'Sugestão de compra Nº: ' + inttostr(Sugestao.dataSet.FieldByName('COD_SUGESTAO').asinteger) + ' feita em ' + Sugestao.dataSet.FieldByName('DT_SUGESTAO').AsString;
  end;

  if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger <= 0 then
  begin
  	Application.MessageBox(Pchar('Favor salvar a sugestão de compra antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  try
	  GroupBoxMontarTrasferenciasTop.Height := _LerConfiguracoesRegistroInteger(GroupBoxMontarTrasferenciasTop.Name, 95);
  except
  end;
  if GroupBoxMontarTrasferenciasTop.Height <= 80 then
  	GroupBoxMontarTrasferenciasTop.Height := 80;
  Sugestao.abreListaTransferencia;
end;

procedure TFrmSugestaoCompra.BitBtnLocalizarProdSugOKClick(Sender: TObject);
begin
  inherited;
  try
	  RadioGroupOrdenarCliente.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroupOrdenarCliente.Name, 0);
  except
  end;

  try
	  GroupBoxMontarPedidoCompraTop.Height := _LerConfiguracoesRegistroInteger(GroupBoxMontarPedidoCompraTop.Name, 95);
  except
  end;
  if GroupBoxMontarPedidoCompraTop.Height <= 80 then
  	GroupBoxMontarPedidoCompraTop.Height := 80;

  try
	  DBGridMontarPedidoCompraProdDet.Height := _LerConfiguracoesRegistroInteger(DBGridMontarPedidoCompraProdDet.Name, 105);
  except
  end;
  if DBGridMontarPedidoCompraProdDet.Height <= 80 then
  	DBGridMontarPedidoCompraProdDet.Height := 80;

  TForm(pnLocalizarProdSug.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestaoCompra.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [SUG022]';
  if vDadosIni.PesqPros('SUG020', 'PESQUISAR', '','SUGESTAOCOMPRA','', Sugestao.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Sugestao.ConsultaCampos('SUGESTAOCOMPRA', ComboBox1.Text,
        'COD_SUGESTAO', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if Sugestao.ConsultaCampos('SUGESTAOCOMPRA', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'COD_SUGESTAO', true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton6.Visible := true;
    SpeedButton5.Visible := false;

    Sugestao.ultimasql := Sugestao.dataSet.CommandText;
    if Sugestao.StatusLixeira(false) then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmSugestaoCompra.BitBtnLocalizarProdSugAlClientClick(
  Sender: TObject);
begin
  if not Sugestao.localizarSugestaoProdutos(
  	StrToInt(vDadosIni.IfThen(trim(EditGrupoProd.Text) = '', 0, trim(EditGrupoProd.Text))),
    trim(EditCodProd.Text),
    trim(EditNumFabr.Text),
    trim(EditDescrProd.Text)) then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtnLocalizarProdSugAlClient.CanFocus) then
    	BitBtnLocalizarProdSugAlClient.SetFocus;
    exit;
  end;

	if (Self.Enabled) and (Self.Visible) and (DBGridLocalizarProdSug.CanFocus) then
  	DBGridLocalizarProdSug.SetFocus;
end;

procedure TFrmSugestaoCompra.BitBtnLocalizarProdSugCancelClick(Sender: TObject);
begin
  inherited;
	TForm(pnLocalizarProdSug.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestaoCompra.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('SUGESTAO_COMPRA', 'I', Sugestao.buscas) then
    Exit;

  if not vDadosIni.vSugCompra.vMultiempresa then
  	Sugestao.vEmpresasSugestao._abreTodosEmpresas
  else
  	Sugestao.vEmpresasSugestao._abreTodosEmpresas('0');

  if not Sugestao.abreFormEmpresas then
  	exit;

  inherited;

  btDefinirEmp.Visible := vDadosIni.vSugCompra.vMultiempresa;
  CheckExibirTransf.Visible := vDadosIni.vSugCompra.vMultiempresa;
  if not CheckExibirTransf.Visible then
  	CheckExibirTransf.Checked := false;

  TabSheet3.TabVisible := true;
  TabSheet3.Show;
  BitBtn4.Enabled := false;
  BitBtn15.Enabled := false;
  BitBtn20.Enabled := false;
  Sugestao.Insert;
  sugestao.vedtsug:=1;
  Sugestao.SetaVariaveisSugestao;
  MaskEdit4.Text := inttostr(Sugestao.EstSeguracaPadrao);
  MaskEdit14.Text := inttostr(Sugestao.TpProcessamento);
  MaskEdit15.Text := inttostr(Sugestao.TpEntrega);
  MaskEdit16.Text := inttostr(Sugestao.TpAlocacao);
  MaskEdit17.Text := inttostr(Sugestao.FreqPedido);
  ComboBox13.Text := inttostr(Sugestao.QtdMesEmpresa);

  Sugestao.vExisteGrade := Sugestao.existeGrade;
  CheckSugPorGrade.Checked := Sugestao.vExisteGrade;
  
  BitBtn10.Enabled := false;
  BitBtn11.Enabled := false;
  BitBtn12.Enabled := false;
  BitBtn9.Enabled  := false;
  BitBtn16.Enabled := false;
  BitBtn19.Enabled := false;
  BitBtn19.Visible := vDadosIni.vSugCompra.vMultiempresa;

  BitBtn15.Enabled := false;
  BitBtn20.Enabled := false;
  
  SpeedButtonSelTodos.Enabled := false;
  SpeedButtonDesTodos.Enabled := false;
  SpeedButtonBuscasProdutosSug.Enabled := false;
  BitBtn13.Enabled := false;
  pnProgressBar.Visible := true;

//  BitBtn16.Visible := (Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger > 0);
  if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
	  MaskEdit4.SetFocus;
end;

procedure TFrmSugestaoCompra.BitBtn4Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    if Application.MessageBox('Tem certeza que deseja Gravar esta Sugestão de Compras?',
        'Sugestão de Compras', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
    	Sugestao.vExibirTransf := CheckExibirTransf.Checked;
      if not Sugestao.Post then
        exit;
      Sugestao.montaSelect(Sugestao.ultimasql);
    end;
    TabSheet2.Show;
    if TelaCadastro = 1 then
      inherited;
  finally
    Screen.Cursor := crDefault; 
  end;
end;

procedure TFrmSugestaoCompra.BitBtn5Click(Sender: TObject);
begin
  TabSheet2.Show;
  if TelaCadastro = 1 then
    inherited;
  //  BitBtn4.Visible := true;
  BitBtn4.Enabled := true;
  Sugestao.LimpaSugestao;
  Sugestao.montaSelect(Sugestao.ultimasql);
  tsSugestao.TabVisible := false;
end;

procedure TFrmSugestaoCompra.BitBtn7Click(Sender: TObject);
begin
  inherited;
  Sugestao.obBuscaSugestao.buscas.close;
  TabSheet5.TabVisible := false;
  TabSheet4.Show;
end;

procedure TFrmSugestaoCompra.BitBtn9Click(Sender: TObject);
var
  vOK: Boolean;
  I: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_COMPRA', 'I', Sugestao.buscas) then
    Exit;

  vOK := false;
  for i := 1 to StGradS.RowCount - 1 do
  	if (trim(StGradS.cells[9, i]) = 'SEL')
    	and (trim(StGradS.Cells[7, I]) <> '')
    	and (trim(StGradS.Cells[7, I]) <> '0') then
  	begin
    	vOK := True;
      Break;
    end;

  if not vOK then
  begin
    Application.MessageBox(Pchar('Nenhum produto com quantidade sugerida selecionado, favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger <= 0 then
  begin
    if not Sugestao.Post then
      exit;
	  BitBtn4.Enabled := false;
    if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger > 0 then
	    tsSugestao.Caption := 'Sugestão de compra Nº: ' + inttostr(Sugestao.dataSet.FieldByName('COD_SUGESTAO').asinteger) + ' feita em ' + Sugestao.dataSet.FieldByName('DT_SUGESTAO').AsString;
  end;

  if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger <= 0 then
  begin
  	Application.MessageBox(Pchar('Favor salvar a sugestão de compra antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  try
	  RadioGroupOrdenarCliente.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroupOrdenarCliente.Name, 0);
  except
  end;

  try
	  GroupBoxMontarPedidoCompraTop.Height := _LerConfiguracoesRegistroInteger(GroupBoxMontarPedidoCompraTop.Name, 140);
  except
  end;
  if GroupBoxMontarPedidoCompraTop.Height <= 140 then
  	GroupBoxMontarPedidoCompraTop.Height := 140;

  try
	  DBGridMontarPedidoCompraProdDet.Height := _LerConfiguracoesRegistroInteger(DBGridMontarPedidoCompraProdDet.Name, 90);
  except
  end;
  if DBGridMontarPedidoCompraProdDet.Height <= 90 then
  	DBGridMontarPedidoCompraProdDet.Height := 90;

  Sugestao.abreListaPedidoCompra(false);
end;

procedure TFrmSugestaoCompra.BitBtnMontarPedidoCompra2CancelClick(
  Sender: TObject);
begin
  TForm(pnMontarPedidoCompra2.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestaoCompra.BitBtnMontarPedidoCompra2OKClick(Sender: TObject);
begin
	if Trunc(EditMoedaFornec2.Valor) <= 0 then
  begin
  	Application.MessageBox('Fornecedor não informado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaFornec2.CanFocus) then
    	EditMoedaFornec2.SetFocus;
    exit;
  end;

  if not Sugestao.vFornecPedSug._abreFornecedor(Trunc(EditMoedaFornec2.Valor), Trunc(EditMoedaEmpFornec2.Valor)) then
  begin
  	Application.MessageBox('Fornecedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaFornec2.CanFocus) then
    	EditMoedaFornec2.SetFocus;
    exit;
  end;

  if (Sugestao.vFornecPedSug.dataSet.FieldByName('TIPO').AsString <> 'A')
  	and (Sugestao.vFornecPedSug.dataSet.FieldByName('TIPO').AsString <> 'F') then
  begin
  	Application.MessageBox('Tipo do fornecedor deve ser "A - Ambos" ou "F - Fornecedor":' + #13 + #13 +
    	'Favor entrar no cadastro de Clientes e Fornecedores e verificar antes de continuar.',
      'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaFornec2.CanFocus) then
    	EditMoedaFornec2.SetFocus;
    exit;
  end;

	if Trunc(EditMoedaVend2.Valor) <= 0 then
  begin
  	Application.MessageBox('Vendedor não informado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaVend2.CanFocus) then
    	EditMoedaVend2.SetFocus;
    exit;
  end;

  if Sugestao.localizaCodigo('COLABORADOR', IntToStr(Trunc(EditMoedaVend2.Valor)), Trunc(EditMoedaEmpFornec2.Valor)) <= 0  then
  begin
    Application.MessageBox('Vendedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaVend2.CanFocus) then
    	EditMoedaVend2.SetFocus;
    exit;
  end;

	if Trunc(EditMoedaCondPag2.Valor) <= 0 then
  begin
	  Application.MessageBox('Condição de pagamento não informada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaVend2.CanFocus) then
    	EditMoedaVend2.SetFocus;
    exit;
  end;

  if Sugestao.localizaCodigo('COND_PAG', IntToStr(Trunc(EditMoedaCondPag2.Valor))) <= 0  then
  begin
    Application.MessageBox('Condição de pagamento não encontrada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaVend2.CanFocus) then
    	EditMoedaVend2.SetFocus;
    exit;
  end;

  TForm(pnMontarPedidoCompra2.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestaoCompra.BitBtnMontarTrasferencias3CancelClick(
  Sender: TObject);
begin
  TForm(pnMontarTrasferencias3.Parent).ModalResult := IDCancel;
end;

procedure TFrmSugestaoCompra.BitBtnMontarTrasferencias3OKClick(Sender: TObject);
begin
  TForm(pnMontarTrasferencias3.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestaoCompra.BitBtnMontarTrasferenciasCancelClick(
  Sender: TObject);
begin
  inherited;
	TForm(pnMontarTrasferencias.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestaoCompra.BitBtnMontarTrasferenciasOKClick(Sender: TObject);
var
	vEmpresaSel: boolean;
	vExisteTransferencia: boolean;
begin
	try
  	vEmpresaSel := false;
  	vExisteTransferencia := false;

    if (Sugestao.fTempEmpresasPedido.IsEmpty) then
    begin
      Application.MessageBox(Pchar('Nenhuma empresa encontrada, favor verificar antes de continuar'), 'Aviso', MB_OK +
        MB_ICONEXCLAMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
    	Sugestao.fTempListaCotacao.DisableControls;
      Sugestao.fTempEmpresasPedido.DisableControls;
      Sugestao.fTempEmpresasPedido.First;
      while not Sugestao.fTempEmpresasPedido.Eof do
      begin
        if Sugestao.fTempEmpresasPedido.FieldByName('SEL').AsString = 'S' then
        begin
          vEmpresaSel := true;
          break;
        end;

        Sugestao.fTempEmpresasPedido.Next;
      end;

      if (not vEmpresaSel) then
      begin
        Application.MessageBox(Pchar('Nenhuma empresa selecionada, favor verificar antes de continuar'), 'Aviso', MB_OK +
          MB_ICONEXCLAMATION + MB_DEFBUTTON1);
        exit;
      end;
    finally
    	Sugestao.fTempEmpresasPedido.First;
    	Sugestao.fTempEmpresasPedido.EnableControls;
      Sugestao.fTempListaCotacao.EnableControls;
    end;

  	Sugestao.fTempListaCotacao.DisableControls;
    Sugestao.fTempListaCotacao.First;
    while not Sugestao.fTempListaCotacao.Eof do
    begin
    	if Sugestao.fTempListaCotacao.FieldByName('NUM_TRANS').AsInteger > 0 then
      begin
      	vExisteTransferencia := true;
        break;
      end;

      Sugestao.fTempListaCotacao.Next;
    end;
  finally
  	Sugestao.fTempListaCotacao.First;
    Sugestao.fTempListaCotacao.EnableControls;
  end;

  if vExisteTransferencia then
  begin
  	if Application.MessageBox('Alguns produtos da sugestão já existem em um requisição de transferência. Deseja continuar assim mesmo?',
	    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYES then
    begin
      if not vDadosIni.PesqPros('SUG029', 'PERMITIR', 'SUG ' + IntToStr(Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger),
       'PEDIDO', '', Sugestao.buscas, true) then
	    	exit;
    end
    else
    	exit;
  end;

	TForm(pnMontarTrasferencias.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestaoCompra.btDefinirEmpClick(Sender: TObject);
begin
  inherited;
  if not Sugestao.abreFormEmpresas then
  	exit;
end;

procedure TFrmSugestaoCompra.btMontarPedidoCompraCancelarClick(Sender: TObject);
begin
  TForm(pnMontarPedidoCompra.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestaoCompra.btMontarPedidoCompraOKClick(Sender: TObject);
var
	vFornecedorSel: boolean;
  vEmpresaSel: boolean;
	vExistePedido: boolean;
begin
  vExistePedido := false;
  vEmpresaSel := false;
  vFornecedorSel := false;

  if (ckFiltrarPorFornecedor.Checked) and (Sugestao.fTempClientesPedido.IsEmpty) then
  begin
    Application.MessageBox(Pchar('Nenhum fornecedor encontrado, favor verificar antes de continuar'), 'Aviso', MB_OK +
      MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    exit;
  end
  else if (ckFiltrarPorEmpresa.Checked) and (Sugestao.fTempEmpresasPedido.IsEmpty) then
  begin
    Application.MessageBox(Pchar('Nenhuma empresa encontrada, favor verificar antes de continuar'), 'Aviso', MB_OK +
      MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    exit;
  end;

  if (ckFiltrarPorFornecedor.Checked) then
  begin
  	try
    	Sugestao.fTempListaCotacao.DisableControls;
      Sugestao.fTempClientesPedido.DisableControls;
      Sugestao.fTempClientesPedido.First;
      while not Sugestao.fTempClientesPedido.Eof do
      begin
        if Sugestao.fTempClientesPedido.FieldByName('SEL').AsString = 'S' then
        begin
          vFornecedorSel := true;
          break;
        end;

        Sugestao.fTempClientesPedido.Next;
      end;

      if (not vFornecedorSel) then
      begin
        Application.MessageBox(Pchar('Nenhum fornecedor selecionado, favor verificar antes de continuar'), 'Aviso', MB_OK +
          MB_ICONEXCLAMATION + MB_DEFBUTTON1);
        exit;
      end;
    finally
    	Sugestao.fTempClientesPedido.First;
    	Sugestao.fTempClientesPedido.EnableControls;
      Sugestao.fTempListaCotacao.EnableControls;
    end;
  end
  else if (ckFiltrarPorEmpresa.Checked) then
  begin
  	try
    	Sugestao.fTempListaCotacao.DisableControls;
      Sugestao.fTempEmpresasPedido.DisableControls;
      Sugestao.fTempEmpresasPedido.First;
      while not Sugestao.fTempEmpresasPedido.Eof do
      begin
        if Sugestao.fTempEmpresasPedido.FieldByName('SEL').AsString = 'S' then
        begin
          vEmpresaSel := true;
          break;
        end;

        Sugestao.fTempEmpresasPedido.Next;
      end;

      if (not vEmpresaSel) then
      begin
        Application.MessageBox(Pchar('Nenhuma empresa selecionada, favor verificar antes de continuar'), 'Aviso', MB_OK +
          MB_ICONEXCLAMATION + MB_DEFBUTTON1);
        exit;
      end;
    finally
    	Sugestao.fTempEmpresasPedido.First;
    	Sugestao.fTempEmpresasPedido.EnableControls;
      Sugestao.fTempListaCotacao.EnableControls;
    end;
  end;

	try
  	Sugestao.fTempListaCotacao.DisableControls;
    Sugestao.fTempListaCotacao.First;
    while not Sugestao.fTempListaCotacao.Eof do
    begin
    	if Sugestao.fTempListaCotacao.FieldByName('NUM_PED').AsInteger > 0 then
      begin
      	vExistePedido := true;
        break;
      end;

      Sugestao.fTempListaCotacao.Next;
    end;
  finally
  	Sugestao.fTempListaCotacao.First;
    Sugestao.fTempListaCotacao.EnableControls;
  end;

  if vExistePedido then
  begin
  	if Application.MessageBox('Alguns produtos da sugestão já existem em um pedido de compra. Deseja continuar assim mesmo?',
	    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYES then
    begin
      if not vDadosIni.PesqPros('SUG028', 'PERMITIR', 'SUG ' + IntToStr(Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger),
       'PEDIDO', '', Sugestao.buscas, true) then
	    	exit;
    end
    else
    	exit;
  end;

  TForm(pnMontarPedidoCompra.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestaoCompra.btnMultiempresaCancelarClick(Sender: TObject);
begin
	TForm(pnMultiempresa.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestaoCompra.btnMultiempresaOKClick(Sender: TObject);
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
      Sugestao.vEmpresasSugestao.dataSet.First;
      while not Sugestao.vEmpresasSugestao.dataSet.Eof do
      begin
        if Sugestao.vEmpresasSugestao.dataSet.FieldByName('SEL').AsString = 'S' then
        begin
          vEmpresa := true;
          break;
        end;

        Sugestao.vEmpresasSugestao.dataSet.Next;
      end;

    finally
      Sugestao.vEmpresasSugestao.dataSet.First;
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

procedure TFrmSugestaoCompra.btSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
	  Sugestao._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.btUnSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
	  Sugestao._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.CheckSugPorGradeClick(Sender: TObject);
begin
  inherited;
  if not CheckSugPorGrade.Checked then
  begin
    RadioGroup1.Enabled := false;
//    RadioGroup1.ItemIndex := -1;

    BitBtn19.Enabled := not Sugestao.vExisteGrade;
  end
  else
  begin
    RadioGroup1.Enabled := true;
//    RadioGroup1.ItemIndex := 0;
    RadioGroup1.ItemIndex := 1;
    if (Self.Enabled) and (Self.Visible) and (RadioGroup1.CanFocus) then
    	RadioGroup1.SetFocus;

    BitBtn19.Enabled := true;
  end;
end;

procedure TFrmSugestaoCompra.ckFiltrarPorEmpresaClick(Sender: TObject);
var
	I: Integer;
begin
	try
    Screen.Cursor := crHourGlass;

    RadioGroupOrdenarCliente.Visible := not ckFiltrarPorEmpresa.Checked;
    SpeedButtonSelTodosEmpFornec.Visible := (ckFiltrarPorEmpresa.Checked) or (ckFiltrarPorFornecedor.Checked);
    SpeedButtonDesTodosEmpFornec.Visible := (ckFiltrarPorEmpresa.Checked) or (ckFiltrarPorFornecedor.Checked);

    if ckFiltrarPorEmpresa.Checked then
    begin
      ckFiltrarPorFornecedor.Checked := not ckFiltrarPorEmpresa.Checked;
      GroupBoxMontarPedidoCompraTop.Caption := 'Empresas';
    end
    else
      GroupBoxMontarPedidoCompraTop.Caption := 'Fornecedores (Compras realizadas nos últimos 365 dias)';

    if ckFiltrarPorEmpresa.Checked then
    begin
      DBGridMontarPedidoCompraProdTop.Visible := false;
      DBGridMontarPedidoCompraProdTop2.Visible := true;
      DBGridMontarPedidoCompraProdTop2.Align := alClient;
    end
    else
    begin
      DBGridMontarPedidoCompraProdTop2.Visible := false;
      DBGridMontarPedidoCompraProdTop.Visible := true;
      DBGridMontarPedidoCompraProdTop.Align := alClient;
    end;

  //  DBGridMontarPedidoCompraProdTop.DataSource := nil;
  //  if ckFiltrarPorEmpresa.Checked then
  //  	DBGridMontarPedidoCompraProdTop.DataSource := Sugestao.fTempEmpresasPedidoDtSource
  //  else
  //	  DBGridMontarPedidoCompraProdTop.DataSource := Sugestao.fTempClientesPedidoDtSource;

    Sugestao.fTempListaCotacao.AfterScroll := nil;
    Sugestao.fTempEmpresasPedido.AfterScroll := nil;
    Sugestao.fTempClientesPedido.AfterScroll := nil;

    if (not ckFiltrarPorEmpresa.Checked) and (not ckFiltrarPorFornecedor.Checked) then
      Sugestao.removerFiltros
    else if ckFiltrarPorEmpresa.Checked then
      Sugestao.filtrarPorEmpresa(Sugestao.fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger)
    else if ckFiltrarPorFornecedor.Checked then
      Sugestao.filtrarPorFornecedor(
        Sugestao.fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger,
        Sugestao.fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger);

    Sugestao.vCustoPedSug._abreCustoProd(
      Sugestao.fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger,
      Sugestao.fTempListaCotacao.FieldByName('COD_PROD').AsString,
      Sugestao.fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger);

    if not ckFiltrarPorEmpresa.Checked then
      Sugestao.fTempEmpresasPedido.AfterScroll := nil
    else
      Sugestao.fTempEmpresasPedido.AfterScroll := Sugestao.datasetAfterScrollEmpresa;
    Sugestao.fTempListaCotacao.AfterScroll := Sugestao.datasetAfterScrollCusto;

  //  Sugestao.fTempEmpresasPedido.FieldByName('SEL').Visible :=
  //  	vDadosIni.IfThen(ckFiltrarPorEmpresa.Checked, true, false);
    Sugestao.fTempClientesPedido.FieldByName('SEL').Visible :=
      vDadosIni.IfThen(ckFiltrarPorFornecedor.Checked, true, false);

    for i := 0 to DBGridMontarPedidoCompraProdTop.FieldCount - 1 do
      if (UpperCase(trim(DBGridMontarPedidoCompraProdTop.Fields[i].FieldName)) = 'SEL') then
      begin
         DBGridMontarPedidoCompraProdTop.Fields[i].Visible :=
           vDadosIni.IfThen((ckFiltrarPorEmpresa.Checked) or (ckFiltrarPorFornecedor.Checked), true, false);
         break;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.ckFiltrarPorFornecedorClick(Sender: TObject);
var
	I: Integer;
begin
	try
    Screen.Cursor := crHourGlass;

    RadioGroupOrdenarCliente.Visible := not ckFiltrarPorEmpresa.Checked;
    SpeedButtonSelTodosEmpFornec.Visible := (ckFiltrarPorEmpresa.Checked) or (ckFiltrarPorFornecedor.Checked);
    SpeedButtonDesTodosEmpFornec.Visible := (ckFiltrarPorEmpresa.Checked) or (ckFiltrarPorFornecedor.Checked);

    if ckFiltrarPorFornecedor.Checked then
      ckFiltrarPorEmpresa.Checked := not ckFiltrarPorFornecedor.Checked;

    if ckFiltrarPorEmpresa.Checked then
    begin
      DBGridMontarPedidoCompraProdTop.Visible := false;
      DBGridMontarPedidoCompraProdTop2.Visible := true;
      DBGridMontarPedidoCompraProdTop2.Align := alClient;
    end
    else
    begin
      DBGridMontarPedidoCompraProdTop2.Visible := false;
      DBGridMontarPedidoCompraProdTop.Visible := true;
      DBGridMontarPedidoCompraProdTop.Align := alClient;
    end;

  //  DBGridMontarPedidoCompraProdTop.DataSource := nil;
  //  if ckFiltrarPorEmpresa.Checked then
  //  	DBGridMontarPedidoCompraProdTop.DataSource := Sugestao.fTempEmpresasPedidoDtSource
  //  else
  //	  DBGridMontarPedidoCompraProdTop.DataSource := Sugestao.fTempClientesPedidoDtSource;

    Sugestao.fTempListaCotacao.AfterScroll := nil;
    Sugestao.fTempEmpresasPedido.AfterScroll := nil;
    Sugestao.fTempClientesPedido.AfterScroll := nil;

    if (not ckFiltrarPorEmpresa.Checked) and (not ckFiltrarPorFornecedor.Checked) then
      Sugestao.removerFiltros
    else if ckFiltrarPorEmpresa.Checked then
      Sugestao.filtrarPorEmpresa(Sugestao.fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger)
    else if ckFiltrarPorFornecedor.Checked then
      Sugestao.filtrarPorFornecedor(
        Sugestao.fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger,
        Sugestao.fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger);

    Sugestao.vCustoPedSug._abreCustoProd(
      Sugestao.fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger,
      Sugestao.fTempListaCotacao.FieldByName('COD_PROD').AsString,
      Sugestao.fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger);

    if not ckFiltrarPorFornecedor.Checked then
      Sugestao.fTempClientesPedido.AfterScroll := nil
    else
      Sugestao.fTempClientesPedido.AfterScroll := Sugestao.datasetAfterScrollFornecedor;
    Sugestao.fTempListaCotacao.AfterScroll := Sugestao.datasetAfterScrollCusto;

  //  Sugestao.fTempEmpresasPedido.FieldByName('SEL').Visible :=
  //  	vDadosIni.IfThen(ckFiltrarPorEmpresa.Checked, true, false);
    Sugestao.fTempClientesPedido.FieldByName('SEL').Visible :=
      vDadosIni.IfThen(ckFiltrarPorFornecedor.Checked, true, false);

    for i := 0 to DBGridMontarPedidoCompraProdTop.FieldCount - 1 do
      if (UpperCase(trim(DBGridMontarPedidoCompraProdTop.Fields[i].FieldName)) = 'SEL') then
      begin
         DBGridMontarPedidoCompraProdTop.Fields[i].Visible :=
          vDadosIni.IfThen(not ckFiltrarPorFornecedor.Checked, false, true);
         break;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
  begin
  	if (SpeedButton6.Enabled) and (SpeedButton6.Visible) then
	    SpeedButton6Click(Sender);
  end
  else if key = VK_DELETE then
  begin
  	if (SpeedButton2.Enabled) and (SpeedButton2.Visible) then
	    SpeedButton2Click(Sender);
  end
  else if key = VK_INSERT then
  begin
  	if (BitBtn3.Enabled) and (BitBtn3.Visible) then
    	BitBtn3Click(Sender);
  end;
end;

procedure TFrmSugestaoCompra.DBGrid4CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if not Sugestao.fTempListaCotacao.IsEmpty then
      Sugestao.marcaDesmarcaLinha;
end;

procedure TFrmSugestaoCompra.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
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
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmSugestaoCompra.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
  begin
    if not Sugestao.fTempListaCotacao.IsEmpty then
      Sugestao.marcaDesmarcaLinha;
  end
  else if ((Key = VK_RETURN) or (Key = VK_TAB)) then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn18.CanFocus) then
      BitBtn18.SetFocus;
  end;
end;

procedure TFrmSugestaoCompra.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
  exit;
  vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;

procedure TFrmSugestaoCompra.DBGridMontarPedidoCompraProdCellClick(
  Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if not Sugestao.fTempListaCotacao.IsEmpty then
      Sugestao.marcaDesmarcaLinha;
end;

procedure TFrmSugestaoCompra.DBGridMontarPedidoCompraProdDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
//  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
//      TDBGrid(sender).canvas.brush.color := clHighlight;
//      TDBGrid(sender).canvas.Font.color := clWhite;
//    end;

  if (Column.Field.Dataset.FieldbyName('NUM_PED').AsInteger > 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnInfPedido.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
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

procedure TFrmSugestaoCompra.DBGridMontarPedidoCompraProdKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_SPACE then
  begin
    if not Sugestao.fTempListaCotacao.IsEmpty then
      Sugestao.marcaDesmarcaLinha;
  end
end;

procedure TFrmSugestaoCompra.DBGridMontarPedidoCompraProdTitleClick(
  Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGridMontarPedidoCompraProd, Column);
end;

procedure TFrmSugestaoCompra.DBGridMontarPedidoCompraProdTopCellClick(
  Column: TColumn);
begin
  if UpperCase(trim(Column.FieldName)) = 'SEL' then
  begin
    if ckFiltrarPorEmpresa.Checked then
      Sugestao.marcaDesmarcaLinhaDtTemp(Sugestao.fTempEmpresasPedido)
    else
      Sugestao.marcaDesmarcaLinhaDtTemp(Sugestao.fTempClientesPedido);
  end;
end;

procedure TFrmSugestaoCompra.DBGridMontarPedidoCompraProdTopDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
//  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
//      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end;
//  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

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

procedure TFrmSugestaoCompra.DBGridMontarPedidoCompraProdTopKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if Key = VK_SPACE then
  begin
    if ckFiltrarPorEmpresa.Checked then
      Sugestao.marcaDesmarcaLinhaDtTemp(Sugestao.fTempEmpresasPedido)
    else
      Sugestao.marcaDesmarcaLinhaDtTemp(Sugestao.fTempClientesPedido);
  end;
end;

procedure TFrmSugestaoCompra.DBGridMontarTrasferenciasAlClientCellClick(
  Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if not Sugestao.fTempListaCotacao.IsEmpty then
      Sugestao.marcaDesmarcaLinha;
end;

procedure TFrmSugestaoCompra.DBGridMontarTrasferenciasAlClientDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
//  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
//      TDBGrid(sender).canvas.brush.color := clHighlight;
//      TDBGrid(sender).canvas.Font.color := clWhite;
//    end;

  if (Column.Field.Dataset.FieldbyName('NUM_TRANS').AsInteger > 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnInfPedido.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
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

procedure TFrmSugestaoCompra.DBGridMontarTrasferenciasAlClientKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_SPACE then
  begin
    if not Sugestao.fTempListaCotacao.IsEmpty then
      Sugestao.marcaDesmarcaLinha;
  end
end;

procedure TFrmSugestaoCompra.DBGridMontarTrasferenciasTopCellClick(
  Column: TColumn);
begin
  if UpperCase(trim(Column.FieldName)) = 'SEL' then
  	Sugestao.marcaDesmarcaLinhaDtTemp(Sugestao.fTempEmpresasPedido);
end;

procedure TFrmSugestaoCompra.DBGridMontarTrasferenciasTopDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
//  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
//      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end;
//  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

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

procedure TFrmSugestaoCompra.DBGridMontarTrasferenciasTopKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if Key = VK_SPACE then
  	Sugestao.marcaDesmarcaLinhaDtTemp(Sugestao.fTempEmpresasPedido);
end;

procedure TFrmSugestaoCompra.DBGridMultiempresaCellClick(Column: TColumn);
begin
	if Column.FieldName = 'SEL' then
  	Sugestao.vEmpresasSugestao._marcaDesmarcaLinha;
end;

procedure TFrmSugestaoCompra.DBGridMultiempresaDrawColumnCell(Sender: TObject;
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

    DBGrid2.Canvas.FillRect(Rect);
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

procedure TFrmSugestaoCompra.DBGridMultiempresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
  	Perform(WM_NEXTDLGCTL, 0, 0)
	else if Key = VK_RETURN then
  	btnMultiempresaOKClick(Sender)  
	else if Key = VK_SPACE then
    Sugestao.vEmpresasSugestao._marcaDesmarcaLinha;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxGrupoProdSugIniExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).Text <> '' then
    EditGrupoProdSugIni.Valor := TDBLookupComboBox(sender).KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxGrupoProdSugFimExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).Text <> '' then
    EditGrupoProdSugFim.Valor := TDBLookupComboBox(sender).KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxSubGrupoProdSugIniExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).Text <> '' then
    EditSubGrupoProdSugIni.Valor := TDBLookupComboBox(sender).KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxSubGrupoProdSugFimExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).Text <> '' then
    EditSubGrupoProdSugFim.Valor := TDBLookupComboBox(sender).KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxGradeProdSugIniExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).Text <> '' then
    EditGradeProdSugIni.Valor := TDBLookupComboBox(sender).KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxGradeProdSugFimExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).Text <> '' then
    EditGradeProdSugFim.Valor := TDBLookupComboBox(sender).KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxMarcaProdSugIniExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).Text <> '' then
    EditMarcaProdSugIni.Valor := TDBLookupComboBox(sender).KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxMarcaProdSugFimExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).Text <> '' then
    EditMarcaProdSugFim.Valor := TDBLookupComboBox(sender).KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxCliente3Exit(Sender: TObject);
begin
  if DBLookupComboBoxCliente3.KeyValue = null then
  	EditMoedaCliente3.Valor := 0
  else
	  EditMoedaCliente3.Valor := DBLookupComboBoxCliente3.KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxCondPag2Exit(Sender: TObject);
begin
	if DBLookupComboBoxCondPag2.KeyValue = null then
  	EditMoedaCondPag2.Valor := 0
  else
	  EditMoedaCondPag2.Valor := DBLookupComboBoxCondPag2.KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxCondPag3Exit(Sender: TObject);
begin
  if DBLookupComboBoxCondPag3.KeyValue = null then
  	EditMoedaCondPag3.Valor := 0
  else
	  EditMoedaCondPag3.Valor := DBLookupComboBoxCondPag3.KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxFornec2Exit(Sender: TObject);
begin
  if DBLookupComboBoxFornec2.KeyValue = null then
  	EditMoedaFornec2.Valor := 0
  else
	  EditMoedaFornec2.Valor := DBLookupComboBoxFornec2.KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxFornecedor3Exit(Sender: TObject);
begin
	if DBLookupComboBoxFornecedor3.KeyValue = null then
  	EditMoedaFornecedor3.Valor := 0
  else
	  EditMoedaFornecedor3.Valor := DBLookupComboBoxFornecedor3.KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxVend2Exit(Sender: TObject);
begin
  if DBLookupComboBoxVend2.KeyValue = null then
  	EditMoedaVend2.Valor := 0
  else
	  EditMoedaVend2.Valor := DBLookupComboBoxVend2.KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxVend3Exit(Sender: TObject);
begin
  if DBLookupComboBoxVend3.KeyValue = null then
  	EditMoedaVend3.Valor := 0
  else
	  EditMoedaVend3.Valor := DBLookupComboBoxVend3.KeyValue;
end;

procedure TFrmSugestaoCompra.DBLookupComboBoxVendPed3Exit(Sender: TObject);
begin
  if DBLookupComboBoxVendPed3.KeyValue = null then
  	EditMoedaVendPed3.Valor := 0
  else
	  EditMoedaVendPed3.Valor := DBLookupComboBoxVendPed3.KeyValue;
end;

procedure TFrmSugestaoCompra.EditCodProdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in ['0'..'9'] = false) then
	 key := #0;
end;

procedure TFrmSugestaoCompra.EditGrupoProdKeyPress(Sender: TObject;
  var Key: Char);
begin
	if (key in ['0'..'9'] = false) then
	 key := #0;
end;

procedure TFrmSugestaoCompra.EditGrupoProdSugIniExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBoxGrupoProdSugIni.KeyValue := Sugestao.localizaCodigo('GRUPOS', floattostr(TEditMoeda(sender).Valor));
  TEditMoeda(sender).Valor := DBLookupComboBoxGrupoProdSugIni.KeyValue;
end;

procedure TFrmSugestaoCompra.EditGrupoProdSugFimExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBoxGrupoProdSugFim.KeyValue := Sugestao.localizaCodigo('GRUPOS', floattostr(TEditMoeda(sender).Valor));
  TEditMoeda(sender).Valor := DBLookupComboBoxGrupoProdSugFim.KeyValue;
end;

procedure TFrmSugestaoCompra.EditSubGrupoProdSugIniExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBoxSubGrupoProdSugIni.KeyValue := Sugestao.localizaCodigo('SUB_GRUPO', floattostr(TEditMoeda(sender).Valor));
  TEditMoeda(sender).Valor := DBLookupComboBoxSubGrupoProdSugIni.KeyValue;
end;

procedure TFrmSugestaoCompra.EditSubGrupoProdSugFimExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBoxSubGrupoProdSugFim.KeyValue := Sugestao.localizaCodigo('SUB_GRUPO', floattostr(TEditMoeda(sender).Valor));
  TEditMoeda(sender).Valor := DBLookupComboBoxSubGrupoProdSugFim.KeyValue;
end;

procedure TFrmSugestaoCompra.EditGradeProdSugIniExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBoxGradeProdSugIni.KeyValue := Sugestao.localizaCodigo('GRADE', floattostr(TEditMoeda(sender).Valor));
  TEditMoeda(sender).Valor := DBLookupComboBoxGradeProdSugIni.KeyValue;
end;

procedure TFrmSugestaoCompra.EditGradeProdSugFimExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBoxGradeProdSugFim.KeyValue := Sugestao.localizaCodigo('GRADE', floattostr(TEditMoeda(sender).Valor));
  TEditMoeda(sender).Valor := DBLookupComboBoxGradeProdSugFim.KeyValue;
end;

procedure TFrmSugestaoCompra.EditMarcaProdSugIniExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBoxMarcaProdSugIni.KeyValue := Sugestao.localizaCodigo('MARCA_PROD', floattostr(TEditMoeda(sender).Valor));
  TEditMoeda(sender).Valor := DBLookupComboBoxMarcaProdSugIni.KeyValue;
end;

procedure TFrmSugestaoCompra.EditMarcaProdSugFimExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBoxMarcaProdSugFim.KeyValue := Sugestao.localizaCodigo('MARCA_PROD', floattostr(TEditMoeda(sender).Valor));
  TEditMoeda(sender).Valor := DBLookupComboBoxMarcaProdSugFim.KeyValue;
end;

procedure TFrmSugestaoCompra.EditMoedaCondPag3Exit(Sender: TObject);
begin
  if (ActiveControl = BitBtnMontarTrasferencias3Cancel) then
    Exit;

  DBLookupComboBoxCondPag3.KeyValue := Trunc(EditMoedaCondPag3.Valor);

  if Trunc(EditMoedaCondPag3.Valor) <= 0 then
  	exit;

  if Sugestao.localizaCodigo('COND_PAG', IntToStr(Trunc(EditMoedaCondPag3.Valor))) <= 0  then
  begin
    Application.MessageBox('Condição de pagamento não encontrada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaCondPag3.CanFocus) then
    	EditMoedaCondPag3.SetFocus;
    exit;
  end;
end;

procedure TFrmSugestaoCompra.EditMoedaCliente3Exit(Sender: TObject);
begin
  if (ActiveControl = BitBtnMontarTrasferencias3Cancel) then
    Exit;

  DBLookupComboBoxCliente3.KeyValue := Trunc(EditMoedaCliente3.Valor);

  if Trunc(EditMoedaCliente3.Valor) <= 0 then
  	exit;

  if not Sugestao.vClientePedSug._abreCliente(Trunc(EditMoedaCliente3.Valor), Trunc(EditMoedaEmpCliente3.Valor)) then
  begin
    Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaCliente3.CanFocus) then
    	EditMoedaCliente3.SetFocus;
    exit;
  end;
end;

procedure TFrmSugestaoCompra.EditMoedaCliente3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vCodEmpresa: Integer;
	vCodigo: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;

      vCodEmpresa := StrToInt(vDadosIni.codEmpresa);
      vDadosIni.codEmpresa := IntToStr(Trunc(EditMoedaEmpCliente3.Valor));
      
      vCodigo := vDadosIni.pesquisaRapida('CLIENTES');
      EditMoedaCliente3.Valor := StrToInt(vDadosIni.IfThen(trim(vCodigo) = '', '0', trim(vCodigo)));
    finally
			vDadosIni.codEmpresa := IntToStr(vCodEmpresa);

      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestaoCompra.EditMoedaCondPag2Exit(Sender: TObject);
begin
  if (ActiveControl = BitBtnMontarPedidoCompra2Cancel) then
    Exit;

  DBLookupComboBoxCondPag2.KeyValue := Trunc(EditMoedaCondPag2.Valor);

  if Trunc(EditMoedaCondPag2.Valor) <= 0 then
  	exit;

  if Sugestao.localizaCodigo('COND_PAG', IntToStr(Trunc(EditMoedaCondPag2.Valor))) <= 0  then
  begin
    Application.MessageBox('Condição de pagamento não encontrada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaCondPag2.CanFocus) then
    	EditMoedaCondPag2.SetFocus;
    exit;
  end;
end;

procedure TFrmSugestaoCompra.EditMoedaFornec2Exit(Sender: TObject);
begin
	if (ActiveControl = BitBtnMontarPedidoCompra2Cancel) then
    Exit;

  DBLookupComboBoxFornec2.KeyValue := Trunc(EditMoedaFornec2.Valor);

  if Trunc(EditMoedaFornec2.Valor) <= 0 then
  	exit;

  if not Sugestao.vFornecPedSug._abreFornecedor(Trunc(EditMoedaFornec2.Valor), Trunc(EditMoedaEmpFornec2.Valor)) then
  begin
    Application.MessageBox('Fornecedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaFornec2.CanFocus) then
    	EditMoedaFornec2.SetFocus;
    exit;
  end;
end;

procedure TFrmSugestaoCompra.EditMoedaFornec2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vCodEmpresa: Integer;
	vCodigo: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;

      vCodEmpresa := StrToInt(vDadosIni.codEmpresa);
      vDadosIni.codEmpresa := IntToStr(Trunc(EditMoedaEmpFornec2.Valor));
      
      vCodigo := vDadosIni.pesquisaRapida('CLIENTES', ' and (CLIENTES.TIPO=''F'' or CLIENTES.TIPO=''A'') ', 'Consulta de Fornecedores');
      EditMoedaFornec2.Valor := StrToInt(vDadosIni.IfThen(trim(vCodigo) = '', '0', trim(vCodigo)));
    finally
			vDadosIni.codEmpresa := IntToStr(vCodEmpresa);

      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestaoCompra.EditMoedaFornecedor3Exit(Sender: TObject);
begin
  if (ActiveControl = BitBtnMontarTrasferencias3Cancel) then
    Exit;

  DBLookupComboBoxFornecedor3.KeyValue := Trunc(EditMoedaFornecedor3.Valor);

  if Trunc(EditMoedaFornecedor3.Valor) <= 0 then
  	exit;

  if not Sugestao.vFornecPedSug._abreFornecedor(Trunc(EditMoedaFornecedor3.Valor), Trunc(EditMoedaEmpFornecedor3.Valor)) then
  begin
    Application.MessageBox('Fornecedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaFornecedor3.CanFocus) then
    	EditMoedaFornecedor3.SetFocus;
    exit;
  end;
end;

procedure TFrmSugestaoCompra.EditMoedaFornecedor3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vCodEmpresa: Integer;
	vCodigo: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;

      vCodEmpresa := StrToInt(vDadosIni.codEmpresa);
      vDadosIni.codEmpresa := IntToStr(Trunc(EditMoedaEmpFornecedor3.Valor));
      
      vCodigo := vDadosIni.pesquisaRapida('CLIENTES', ' and (CLIENTES.TIPO=''F'' or CLIENTES.TIPO=''A'') ', 'Consulta de Fornecedores');
      EditMoedaFornecedor3.Valor := StrToInt(vDadosIni.IfThen(trim(vCodigo) = '', '0', trim(vCodigo)));
    finally
			vDadosIni.codEmpresa := IntToStr(vCodEmpresa);

      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestaoCompra.EditMoedaVend2Exit(Sender: TObject);
begin
  if (ActiveControl = BitBtnMontarPedidoCompra2Cancel) then
    Exit;

  DBLookupComboBoxVend2.KeyValue := Trunc(EditMoedaVend2.Valor);

  if Trunc(EditMoedaVend2.Valor) <= 0 then
  	exit;

  if Sugestao.localizaCodigo('COLABORADOR', IntToStr(Trunc(EditMoedaVend2.Valor)), Trunc(EditMoedaEmpFornec2.Valor)) <= 0  then
  begin
    Application.MessageBox('Vendedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaVend2.CanFocus) then
    	EditMoedaVend2.SetFocus;
    exit;
  end;
end;

procedure TFrmSugestaoCompra.EditMoedaVend2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vCodEmpresa: Integer;
	vCodigo: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      
      vCodEmpresa := StrToInt(vDadosIni.codEmpresa);
      vDadosIni.codEmpresa := IntToStr(Trunc(EditMoedaEmpFornec2.Valor));

      vCodigo := vDadosIni.pesquisaRapida('COLABORADOR');
      EditMoedaVend2.Valor := StrToInt(vDadosIni.IfThen(trim(vCodigo) = '', '0', trim(vCodigo)));
    finally
    	vDadosIni.codEmpresa := IntToStr(vCodEmpresa);

      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestaoCompra.EditMoedaVend3Exit(Sender: TObject);
begin
  if (ActiveControl = BitBtnMontarTrasferencias3Cancel) then
    Exit;

  DBLookupComboBoxVend3.KeyValue := Trunc(EditMoedaVend3.Valor);

  if Trunc(EditMoedaVend3.Valor) <= 0 then
  	exit;

  if Sugestao.localizaCodigo('COLABORADOR', IntToStr(Trunc(EditMoedaVend3.Valor)), Trunc(EditMoedaEmpCliente3.Valor)) <= 0  then
  begin
    Application.MessageBox('Vendedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaVend3.CanFocus) then
    	EditMoedaVend3.SetFocus;
    exit;
  end;
end;

procedure TFrmSugestaoCompra.EditMoedaVend3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vCodEmpresa: Integer;
	vCodigo: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;

      vCodEmpresa := StrToInt(vDadosIni.codEmpresa);
      vDadosIni.codEmpresa := IntToStr(Trunc(EditMoedaEmpCliente3.Valor));

      vCodigo := vDadosIni.pesquisaRapida('COLABORADOR');
      EditMoedaVend3.Valor := StrToInt(vDadosIni.IfThen(trim(vCodigo) = '', '0', trim(vCodigo)));
    finally
    	vDadosIni.codEmpresa := IntToStr(vCodEmpresa);

      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestaoCompra.EditMoedaVendPed3Exit(Sender: TObject);
begin
  if (ActiveControl = BitBtnMontarTrasferencias3Cancel) then
    Exit;

  DBLookupComboBoxVendPed3.KeyValue := Trunc(EditMoedaVendPed3.Valor);

  if Trunc(EditMoedaVendPed3.Valor) <= 0 then
  	exit;

  if Sugestao.localizaCodigo('COLABORADOR', IntToStr(Trunc(EditMoedaVendPed3.Valor)), Trunc(EditMoedaEmpFornecedor3.Valor)) <= 0  then
  begin
    Application.MessageBox('Vendedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoedaVendPed3.CanFocus) then
    	EditMoedaVendPed3.SetFocus;
    exit;
  end;
end;

procedure TFrmSugestaoCompra.EditMoedaVendPed3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vCodEmpresa: Integer;
	vCodigo: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;

      vCodEmpresa := StrToInt(vDadosIni.codEmpresa);
      vDadosIni.codEmpresa := IntToStr(Trunc(EditMoedaEmpFornec2.Valor));

      vCodigo := vDadosIni.pesquisaRapida('COLABORADOR');
      EditMoedaVend2.Valor := StrToInt(vDadosIni.IfThen(trim(vCodigo) = '', '0', trim(vCodigo)));
    finally
    	vDadosIni.codEmpresa := IntToStr(vCodEmpresa);

      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestaoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Sugestao.Cancel;
  Sugestao.RollBackTransacao;
  Sugestao.free;
  Action := caFree;
  FrmSugestaoCompra := nil;
end;

procedure TFrmSugestaoCompra.FormCreate(Sender: TObject);
var
  i: integer;
begin
	vCriou := 0;
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Sugestao := TSugestao.Create;
  Sugestao.abreSugestao(true);
  Sugestao.montarCheckListBoxTipV(CheckListBoxMercado);
  DBGrid1.DataSource := dtmSugestaoCompras.dsSugestao;
  tsSugestao.TabVisible := false;
  tsMultiempresa.TabVisible := false;
  for I := 0 to CheckListBoxMercado.Items.Count - 1 do
    CheckListBoxMercado.Checked[i] := true;
  for I := 0 to CheckListBoxOrigem.Items.Count - 1 do
    CheckListBoxOrigem.Checked[i] := true;
//  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := false;
  tsMontarPedidoCompra.TabVisible := false;
  tsMontarPedidoCompra2.TabVisible := false;
  tsBuscarProdutosSugCompras.TabVisible := false;
  tsOpcoesSug.TabVisible := false;
  tsMontarTransferencias.TabVisible := false;
  tsOpcoesTransf.TabVisible := false;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle:= fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmSugestaoCompra.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (PageControl3.ActivePage = TabSheet3) and (BitBtn14.Enabled) and (btDefinirEmp.Enabled) then
      BitBtn5Click(Sender);
  end;
end;

procedure TFrmSugestaoCompra.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  try
    if vShow <> 1 then
    begin
      inherited;
      if vCriou = 0 then
      	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    end;
    if TelaCadastro = 1 then
      BitBtn3Click(Sender);
    tabsheet3.TabVisible:=true;
//    tsSugestao.TabVisible:=true;
    TabSheet4.TabVisible:=true;

    if vCriou = 0 then
      vCriou := 1;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmSugestaoCompra.MaskEdit14Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) or (ActiveControl <> BitBtn6) then
  begin
    if (ActiveControl is TMaskEdit) and (TMaskEdit(sender).Text = '') then
    begin

      if TMaskEdit(sender) = MaskEdit4 then
        Application.MessageBox('Estoque de Segurança não Informado', 'Atenção', MB_ICONWARNING + MB_OK)
      else if TMaskEdit(sender) = MaskEdit14 then
        Application.MessageBox('Tempo Processamento não Informado', 'Atenção', MB_ICONWARNING + MB_OK)
      else if TMaskEdit(sender) = MaskEdit15 then
        Application.MessageBox('Tempo de Entrega não Informado', 'Atenção', MB_ICONWARNING + MB_OK)
      else if TMaskEdit(sender) = MaskEdit16 then
        Application.MessageBox('Tempo de Alocação não Informado', 'Atenção', MB_ICONWARNING + MB_OK)
      else if TMaskEdit(sender) = MaskEdit17 then
        Application.MessageBox('Frequência Pedido não Informado', 'Atenção', MB_ICONWARNING + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (TMaskEdit(sender).CanFocus) then
      	TMaskEdit(sender).setfocus;
      exit;
    end;

    if (ActiveControl is TComboBox) and (TComboBox(sender).Text = '') then
    begin
      if TComboBox(sender) = ComboBox13 then
        Application.MessageBox('Quantidade de meses para a sugestão não Informado', 'Atenção', MB_ICONWARNING + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (TComboBox(sender).CanFocus) then
      	TComboBox(sender).setfocus;
      exit;
    end;

    try
      strtoint(maskedit4.text);
      strtoint(maskedit14.text);
      strtoint(maskedit15.text);
      strtoint(maskedit16.text);
      strtoint(maskedit17.text);
      strtoint(combobox13.text);
    except
      Application.MessageBox(PChar('Erro de Conversão dos dados do tempo cíclico.' + chr(13) + 'Valores devem ser números inteiros.'), 'Atenção', MB_ICONWARNING + MB_OK);
      if ActiveControl is TMaskEdit then
      begin
      	if (Self.Enabled) and (Self.Visible) and (TMaskEdit(sender).CanFocus) then
        	TMaskEdit(sender).setfocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (TComboBox(sender).CanFocus) then
        TComboBox(sender).SetFocus;
    end;
  end;
end;

procedure TFrmSugestaoCompra.pnLocalizarProdSugEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (EditGrupoProd.CanFocus) then
  	EditGrupoProd.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditCodProd.CanFocus) then
  	EditCodProd.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditNumFabr.CanFocus) then
  	EditNumFabr.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditDescrProd.CanFocus) then
  	EditDescrProd.SetFocus;
end;

procedure TFrmSugestaoCompra.pnMontarPedidoCompra2Enter(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (EditMoedaFornec2.CanFocus) then
  	EditMoedaFornec2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxFornec2.CanFocus) then
  	DBLookupComboBoxFornec2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditMoedaVend2.CanFocus) then
  	EditMoedaVend2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxVend2.CanFocus) then
  	DBLookupComboBoxVend2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditMoedaCondPag2.CanFocus) then
  	EditMoedaCondPag2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxCondPag2.CanFocus) then
  	DBLookupComboBoxCondPag2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ComboBoxTipoPedido2.CanFocus) then
  	ComboBoxTipoPedido2.SetFocus;
end;

procedure TFrmSugestaoCompra.pnMontarTrasferencias3Enter(Sender: TObject);
begin
	if EditMoedaCliente3.Valor > 0 then
		EditMoedaCliente3Exit(Sender);
  if (Self.Enabled) and (Self.Visible) and (EditMoedaCliente3.CanFocus) then
  	EditMoedaCliente3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxCliente3.CanFocus) then
  	DBLookupComboBoxCliente3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditMoedaVend3.CanFocus) then
  	EditMoedaVend3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxVend3.CanFocus) then
  	DBLookupComboBoxVend3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditMoedaCondPag3.CanFocus) then
  	EditMoedaCondPag3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxCondPag3.CanFocus) then
  	DBLookupComboBoxCondPag3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ComboBoxTipoVenda3.CanFocus) then
  	ComboBoxTipoVenda3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ComboBoxOrigemVenda3.CanFocus) then
		ComboBoxOrigemVenda3.SetFocus;
end;

procedure TFrmSugestaoCompra.pnMultiempresaEnter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (DBGridMultiempresa.CanFocus) then
  	DBGridMultiempresa.SetFocus;
end;

procedure TFrmSugestaoCompra.pnOpcoesSugCancelClick(Sender: TObject);
begin
  TForm(pnOpcoesSug.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestaoCompra.pnOpcoesSugEnter(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (CheckMostrarDescrRed2.CanFocus) then
  	CheckMostrarDescrRed2.SetFocus
	else if (Self.Enabled) and (Self.Visible) and (CheckMostrarUltimaVnd2.CanFocus) then
  	CheckMostrarUltimaVnd2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (CheckExibirTransf2.CanFocus) then
  	CheckExibirTransf2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (pnOpcoesSugOK.CanFocus) then
  	pnOpcoesSugOK.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (pnOpcoesSugCancel.CanFocus) then
  	pnOpcoesSugCancel.SetFocus;
end;

procedure TFrmSugestaoCompra.pnOpcoesSugOKClick(Sender: TObject);
begin
	try
		_GravaConfiguracoesBoolean(CheckMostrarDescrRed2.Name, CheckMostrarDescrRed2.Checked);
  except
  end;
  try
		_GravaConfiguracoesBoolean(CheckMostrarUltimaVnd2.Name, CheckMostrarUltimaVnd2.Checked);
  except
  end;
  try
	  _GravaConfiguracoesBoolean(CheckExibirTransf2.Name, CheckExibirTransf2.Checked);
  except
  end;

  TForm(pnOpcoesSug.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestaoCompra.RadioGroupOrdenarClienteClick(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

    if RadioGroupOrdenarCliente.ItemIndex = 0 then
      Sugestao.fTempClientesPedido.IndexFieldNames := 'COD_EMPRESA;COD_CLIENTE'
    else if RadioGroupOrdenarCliente.ItemIndex = 1 then
      Sugestao.fTempClientesPedido.IndexFieldNames := 'COD_CLIENTE;COD_EMPRESA'
    else if RadioGroupOrdenarCliente.ItemIndex = 2 then
      Sugestao.fTempClientesPedido.IndexFieldNames := 'NOME_CLIENTE'
    else if RadioGroupOrdenarCliente.ItemIndex = 3 then
      Sugestao.fTempClientesPedido.IndexFieldNames := 'RAZAO';

    if ckFiltrarPorFornecedor.Checked then
      Sugestao.filtrarPorFornecedor(
          Sugestao.fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger,
          Sugestao.fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger);

    Sugestao.vCustoPedSug._abreCustoProd(
      Sugestao.fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger,
      Sugestao.fTempListaCotacao.FieldByName('COD_PROD').AsString,
      Sugestao.fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger);

    if not ckFiltrarPorFornecedor.Checked then
      Sugestao.fTempClientesPedido.AfterScroll := nil
    else
      Sugestao.fTempClientesPedido.AfterScroll := Sugestao.datasetAfterScrollFornecedor;
    Sugestao.fTempListaCotacao.AfterScroll := Sugestao.datasetAfterScrollCusto;

    try
      _GravaConfiguracoesInteger(RadioGroupOrdenarCliente.Name, RadioGroupOrdenarCliente.ItemIndex);
    except
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  Sugestao.obBuscaSugestao.buscas.close;
  TabSheet5.TabVisible := false;
  TabSheet4.Show;
end;

procedure TFrmSugestaoCompra.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  //Não tire este comentário
end;

procedure TFrmSugestaoCompra.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('SUG021', 'ACESSAR', '','SUGESTAOCOMPRA','', Sugestao.buscas, true) then
//  if vDadosIni.PesqPros('SUG007', '', Sugestao.buscas, true) then
  begin
    inherited;
    if not Sugestao.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [SUG022]';
      SpeedButton6.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [SUG022]';
      SpeedButton6.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButton2Click(Sender: TObject);
begin
	if Sugestao.dataSet.IsEmpty then
  	exit;

  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('SUGESTAO_COMPRA', 'E', Sugestao.buscas) then
    Exit;
  if Sugestao.dataSet.FieldByName('ATIVO').AsInteger = 0 then
  begin
    if vDadosIni.PesqPros('SUG022', 'EXCLUIR', '','SUGESTAOCOMPRA','', Sugestao.buscas, true) then
//    if vDadosIni.PesqPros('SUG004', '', Sugestao.buscas, false) then
    begin
      if Sugestao.DeletarRegistro then
        if Sugestao.StatusLixeira(false) then
          SpeedButton25.Visible := true
        else
          SpeedButton25.Visible := false;
    end;
  end
  else if Sugestao.dataSet.FieldByName('ATIVO').AsInteger = 1 then
  begin
    if vDadosIni.PesqPros('SUG022', 'EXCLUIR', '','SUGESTAOCOMPRA','', Sugestao.buscas, true) then
    begin
      if Sugestao.EnviarParaLixeira then
        if Sugestao.StatusLixeira(false) then
          SpeedButton25.Visible := true
        else
          SpeedButton25.Visible := false;
    end;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButton3Click(Sender: TObject);
begin
	if Sugestao.dataSet.IsEmpty then
		exit;
    
  inherited;
  try
    Screen.Cursor := crHourGlass;

    SpeedButton6Click(sender);
    BitBtn13Click(sender);
    BitBtn5Click(sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButton59Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('sug_compra_%', Sugestao.buscas);
end;

procedure TFrmSugestaoCompra.SpeedButton5Click(Sender: TObject);
begin
	if Sugestao.dataSet.IsEmpty then
		exit;
    
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('SUGESTAO_COMPRA', 'A', Sugestao.buscas) then
    Exit;
    
  if not vDadosIni.PesqPros('SUG023', 'RESTAURAR', '','SUGESTAOCOMPRA','', Sugestao.buscas, true) then
  	exit;
//  if vDadosIni.PesqPros('SUG008', Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsString, Sugestao.buscas, false) then

  if not Sugestao.RestaurarRegistro then
  	exit;

  if Sugestao.StatusLixeira(false) then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

procedure TFrmSugestaoCompra.SpeedButton6Click(Sender: TObject);
begin
  if Sugestao.dataSet.IsEmpty then
  	exit;
    
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Abrindo Sugestão de Compra');

    CheckExibirTransf.Visible := true;

    try
	    CheckMostrarDescrRed2.Checked := _LerConfiguracoesRegistroBoolean(CheckMostrarDescrRed2.Name, false);
    except
    end;
    try
	    CheckMostrarUltimaVnd2.Checked := _LerConfiguracoesRegistroBoolean(CheckMostrarUltimaVnd2.Name, false);
    except
    end;
    try
	    CheckExibirTransf2.Checked := Sugestao.existeTransf;//_LerConfiguracoesRegistroBoolean(CheckExibirTransf2.Name, false);

      if (not CheckExibirTransf2.Checked) and (not vDadosIni.vSugCompra.vMultiempresa) then
	      CheckExibirTransf.Visible := false;
    except
    end;

    if not vDadosIni.vSugCompra.vMultiempresa then
      Sugestao.vEmpresasSugestao._abreTodosEmpresas
    else
      Sugestao.vEmpresasSugestao._abreTodosEmpresas(Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsString);

    if not Sugestao.VisualizarSugestao then
    	exit;

    btDefinirEmp.Visible := vDadosIni.vSugCompra.vMultiempresa;
    
    TabSheet3.TabVisible := false;
    TabSheet5.TabVisible := false;
    TabSheet6.TabVisible := false;
    TabSheet7.TabVisible := false;
    tsSugestao.TabVisible := true;
    //  BitBtn4.Visible := false;
    BitBtn4.Enabled := false;

    BitBtn10.Enabled := true;
    BitBtn11.Enabled := true;
    BitBtn12.Enabled := true;
    BitBtn9.Enabled  := true;
    BitBtn16.Enabled := true;

    Sugestao.vExisteGrade := Sugestao.existeGrade;
    try
      if Sugestao.existeGrade('U') then
        CheckSugPorGrade.Checked := true
      else
        CheckSugPorGrade.Checked := false;
    except
    end;

    BitBtn19.Enabled := CheckExibirTransf2.Checked;

    BitBtn19.Visible := vDadosIni.vSugCompra.vMultiempresa;

    BitBtn15.Enabled := false;
    BitBtn20.Enabled := false;

    SpeedButtonSelTodos.Enabled := true;
    SpeedButtonDesTodos.Enabled := true;
    SpeedButtonBuscasProdutosSug.Enabled := true;
    BitBtn13.Enabled := true;
    pnProgressBar.Visible := true;

//    BitBtn16.Visible := (Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger > 0);
    tsSugestao.Caption := 'Sugestão de compra Nº: ' + inttostr(Sugestao.dataSet.FieldByName('COD_SUGESTAO').asinteger) + ' feita em ' + Sugestao.dataSet.FieldByName('DT_SUGESTAO').AsString;
    SpeedButton1Click(Sender);
    TabSheet4.Show;
  finally
    Screen.Cursor := crDefault;
    pnProgressBar.Visible := false;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonBuscasProdutosSugClick(Sender: TObject);
var
	I: Integer;
begin
	if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_COMPRA', 'I', Sugestao.buscas) then
    Exit;

  if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger <= 0 then
  begin
	  if not Sugestao.Post then
  		exit;
	  BitBtn4.Enabled := false;
  end;

  if Sugestao.dataSet.FieldByName('COD_SUGESTAO').AsInteger <= 0 then
  begin
  	Application.MessageBox(Pchar('Favor salvar a sugestão de compra antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;   

  Sugestao.abreListaPedidoCompra(true);
end;

procedure TFrmSugestaoCompra.SpeedButtonDesTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
		Sugestao.MarcarDesmarTodosItemSugestao(false);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonDesTodosEmpFornecClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;

    Sugestao.fTempEmpresasPedido.AfterScroll := nil;
    Sugestao.fTempClientesPedido.AfterScroll := nil;
    Sugestao.fTempListaCotacao.AfterScroll := nil;
    
    if ckFiltrarPorEmpresa.Checked then
      Sugestao.MarcarDesmarTodosDtTemp(Sugestao.fTempEmpresasPedido, false)
    else if ckFiltrarPorFornecedor.Checked then
      Sugestao.MarcarDesmarTodosDtTemp(Sugestao.fTempClientesPedido, false);
  finally
  	if ckFiltrarPorEmpresa.Checked then
    	Sugestao.fTempEmpresasPedido.AfterScroll := Sugestao.datasetAfterScrollEmpresa
    else if ckFiltrarPorFornecedor.Checked then
    	Sugestao.fTempClientesPedido.AfterScroll := Sugestao.datasetAfterScrollFornecedor;
    Sugestao.fTempListaCotacao.AfterScroll := Sugestao.datasetAfterScrollCusto;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonDesTodosEmpTranfClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;

    Sugestao.fTempEmpresasPedido.AfterScroll := nil;
    Sugestao.fTempListaCotacao.AfterScroll := nil;

		Sugestao.MarcarDesmarTodosDtTemp(Sugestao.fTempEmpresasPedido, false);
  finally
    Sugestao.fTempEmpresasPedido.AfterScroll := Sugestao.datasetAfterScrollEmpresa;
    Sugestao.fTempListaCotacao.AfterScroll := Sugestao.datasetAfterScrollCusto;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonDesTodosProdClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;

    Sugestao.MarcarDesmarTodosDtTemp(Sugestao.fTempListaCotacao, false)
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonMultiempresaDesmClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    Sugestao.vEmpresasSugestao._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonMultiempresaSelClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    Sugestao.vEmpresasSugestao._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonSelTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
	  Sugestao.MarcarDesmarTodosItemSugestao(true);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonSelTodosEmpFornecClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    Sugestao.fTempEmpresasPedido.AfterScroll := nil;
    Sugestao.fTempClientesPedido.AfterScroll := nil;
    Sugestao.fTempListaCotacao.AfterScroll := nil;

    if ckFiltrarPorEmpresa.Checked then
      Sugestao.MarcarDesmarTodosDtTemp(Sugestao.fTempEmpresasPedido, true)
    else if ckFiltrarPorFornecedor.Checked then
      Sugestao.MarcarDesmarTodosDtTemp(Sugestao.fTempClientesPedido, true);
  finally
  	if ckFiltrarPorEmpresa.Checked then
    	Sugestao.fTempEmpresasPedido.AfterScroll := Sugestao.datasetAfterScrollEmpresa
    else if ckFiltrarPorFornecedor.Checked then
    	Sugestao.fTempClientesPedido.AfterScroll := Sugestao.datasetAfterScrollFornecedor;
    Sugestao.fTempListaCotacao.AfterScroll := Sugestao.datasetAfterScrollCusto;

    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonSelTodosEmpTransfClick(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

    Sugestao.fTempEmpresasPedido.AfterScroll := nil;
    Sugestao.fTempListaCotacao.AfterScroll := nil;

    Sugestao.MarcarDesmarTodosDtTemp(Sugestao.fTempEmpresasPedido, true);
  finally
    Sugestao.fTempEmpresasPedido.AfterScroll := Sugestao.datasetAfterScrollEmpresa;
    Sugestao.fTempListaCotacao.AfterScroll := Sugestao.datasetAfterScrollCusto;

    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.SpeedButtonSelTodosProdClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    Sugestao.MarcarDesmarTodosDtTemp(Sugestao.fTempListaCotacao, true)
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.Splitter3Moved(Sender: TObject);
begin
	if DBGridMontarPedidoCompraProdDet.Height <= 80 then
  	DBGridMontarPedidoCompraProdDet.Height := 80;

  try
		_GravaConfiguracoesInteger(DBGridMontarPedidoCompraProdDet.Name, DBGridMontarPedidoCompraProdDet.Height);
  except
  end;
end;

procedure TFrmSugestaoCompra.Splitter4Moved(Sender: TObject);
begin
	if GroupBoxMontarTrasferenciasTop.Height <= 80 then
  	GroupBoxMontarTrasferenciasTop.Height := 80;

  try
		_GravaConfiguracoesInteger(GroupBoxMontarTrasferenciasTop.Name, GroupBoxMontarTrasferenciasTop.Height);
  except
  end;
end;

procedure TFrmSugestaoCompra.Splitter5Moved(Sender: TObject);
begin
  if GroupBoxMontarPedidoCompraTop.Height <= 80 then
  	GroupBoxMontarPedidoCompraTop.Height := 80;

  try
		_GravaConfiguracoesInteger(GroupBoxMontarPedidoCompraTop.Name, GroupBoxMontarPedidoCompraTop.Height);
  except
  end;
end;

procedure TFrmSugestaoCompra.StGradSDblClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
	  Sugestao.SelecionaItemSugestao;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestaoCompra.StGradSDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  Sugestao.SelecionaItemSimilar(ACol, ARow, Rect);
end;

end.

