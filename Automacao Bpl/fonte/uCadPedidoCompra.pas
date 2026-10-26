unit uCadPedidoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, UDtmSugestaoCompras, UClasseSugestaoCompras,
  uDadosIni, uDtmAtivo, QRCtrls, QuickRpt, ExtDlgs, AppEvnts, DB, uEditMoeda,
  Spin;

type
	Tcl_cadCliente = function(ATipoForm: Integer): Boolean;
  
  TfrmCadPedidoCompra = class(TfrmCadPadraoM)
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    DBEdit2: TDBEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    DBGrid2: TDBGrid;
    SpeedButton13: TSpeedButton;
    tsRelPedidoCompra: TTabSheet;
    qrpPedidoCompra: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    DetailBandPedidoCompra: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    tsArquivoPedido: TTabSheet;
    SaveTextFileDialog1: TSaveTextFileDialog;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn12: TBitBtn;
    pnArquivoPedido: TGroupBox;
    Label37: TLabel;
    DBEdit53: TDBEdit;
    tsSelecionaGradeProd: TTabSheet;
    dsSelecionaGradeProd: TDataSource;
    ScrollBox4: TScrollBox;
    pnSelecionaGradeProd: TPanel;
    GroupBox7: TGroupBox;
    BitBtn8: TBitBtn;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    Panel4: TPanel;
    GroupBox8: TGroupBox;
    Label23: TLabel;
    SpeedButton9: TSpeedButton;
    Edit2: TEdit;
    GroupBox6: TGroupBox;
    GroupBox9: TGroupBox;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label24: TLabel;
    SpeedButton10: TSpeedButton;
    Edit1: TEdit;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn7: TBitBtn;
    QRLabel16: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit11: TDBEdit;
    Label27: TLabel;
    DBEdit12: TDBEdit;
    Label28: TLabel;
    DBEdit13: TDBEdit;
    Label29: TLabel;
    DBEdit14: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    tsLancamento: TTabSheet;
    PageControl2: TPageControl;
    tsLancParcelas: TTabSheet;
    pnLancParcelas: TPanel;
    tsLancEditParcelas: TTabSheet;
    pnLancEditParcelas: TPanel;
    Panel7: TPanel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edCrDoc: TEdit;
    edCrVenc: TMaskEdit;
    mValorParcelaCr: TEditMoeda;
    Panel9: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Panel10: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    edcreditoQtdeParcelas: TSpinEdit;
    GroupBox10: TGroupBox;
    edcreditoCondicaoPagamento: TComboBox;
    edCreditoValorCredito: TEditMoeda;
    btGerar: TBitBtn;
    Panel11: TPanel;
    Panel12: TPanel;
    GroupBox11: TGroupBox;
    ListBox1: TListBox;
    btSalvar: TBitBtn;
    ListBox2: TListBox;
    Label33: TLabel;
    Edit3: TEdit;
    DBEdit15: TDBEdit;
    Label36: TLabel;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    Label201: TLabel;
    Label202: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    tsPendencias: TTabSheet;
    pnItensPendentes: TPanel;
    Panel8: TPanel;
    gridPendencias: TDBGrid;
    Panel13: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    dsPendencias: TDataSource;
    GroupBox12: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    edDataIni: TMaskEdit;
    edDataFim: TMaskEdit;
    btPesquisar: TBitBtn;
    rbRazaoSocial: TRadioButton;
    rbNomeFantasia: TRadioButton;
    tsObservacao: TTabSheet;
    pnObservacao: TPanel;
    DBMemo4: TDBMemo;
    Panel74: TPanel;
    BitBtn63: TBitBtn;
    BitBtn20: TBitBtn;
    QRMemo1: TQRMemo;
    QRLabel17: TQRLabel;
    groupAdicional: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    tsImprimirRel: TTabSheet;
    pnImpressao: TPanel;
    GroupBox14: TGroupBox;
    RadioButtonGrafico: TRadioButton;
    RadioButtonMatricial: TRadioButton;
    CheckBoxExibirLocacaoPeso: TCheckBox;
    Panel67: TPanel;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    CheckBoxExibirIpiMva: TCheckBox;
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox3Click(Sender: TObject);
    procedure pnImpressaoEnter(Sender: TObject);
    procedure CheckBoxExibirLocacaoPesoClick(Sender: TObject);
    procedure CheckBoxExibirIpiMvaClick(Sender: TObject);
    procedure BitBtn56Click(Sender: TObject);
    procedure RadioButtonGraficoClick(Sender: TObject);
    procedure BitBtn55Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure gridPendenciasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridPendenciasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridPendenciasTitleClick(Column: TColumn);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QRExpr1Print(sender: TObject; var Value: string);
    procedure QRDBText2Print(sender: TObject; var Value: string);
    procedure QRDBText11Print(sender: TObject; var Value: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qrpPedidoCompraPreview(Sender: TObject);
    procedure qrpPedidoCompraBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure habilitarCamposIncluir;
    procedure habilitarCamposEditar;
    procedure desabilitarCampos;
  private
  var
    { Private declarations }
    vCriou: Smallint;
    vtotultped: Double;
    vNumDocV, vDataVencV: arraystring;
    vValorV: arrayextended;
  public
    { Public declarations }
  end;

var
  frmCadPedidoCompra: TfrmCadPedidoCompra;
  Pedido: TPedidoCompra;
  vCampoAdcional: string;

implementation

uses
  funcoes, uDataSet_OOP;


{$R *.dfm}

procedure TfrmCadPedidoCompra.BitBtn11Click(Sender: TObject);
var
  hdTemp: THandle;
  formulario: TForm;
begin

  vDadosIni.vPesquisa := 'MONTARARQUIVOPEDIDO|'+ Pedido.dataSet.FieldByName('NUM_PED').AsString +'|'+ trim(Edit2.Text)+'|';
  formulario := Funcoes.AbreForm('pkFabrica', 'TFrmFabrica', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
//  if UpperCase(vDadosIni.vfabrica) = 'HONDA' then
//  begin
//   obFabr.free;
//   obFabr := TFabricaHonda.create;
//   if not obFabr.MontarArquivoPedido(Pedido, Pedido.vItemPedido, Edit2.Text) then
//     exit;
//
//   _GravaConfiguracoesString('EndMontaPedHonda', Edit2.text);
//   TForm(pnArquivoPedido.Parent).ModalResult := IDOK;
//  end;

//  if Pedido.MontarArquivoPedido(Edit2.Text) then
//  begin
//    inherited;
//    _GravaConfiguracoesString('EndMontaPedHonda', Edit2.text);
//    TForm(pnArquivoPedido.Parent).ModalResult := IDOK;
////    tsArquivoPedido.TabVisible := false;
////    TabSheet2.Show;
//  end;
end;

procedure TfrmCadPedidoCompra.BitBtn12Click(Sender: TObject);
begin
    inherited;
  Label33.Visible := false;
  Edit3.Visible := false;
  Pedido.vItemPedido.Delete;
end;

procedure TfrmCadPedidoCompra.BitBtn13Click(Sender: TObject);
begin
  inherited;

  if Pedido.MontarArquivoPedidoHw(Edit1.Text) then
  begin
    inherited;
    _GravaConfiguracoesString('EndMontaPedHW', Edit1.text);
    TForm(pnArquivoPedido.Parent).ModalResult := IDOK;
//    tsArquivoPedido.TabVisible := false;
//    TabSheet2.Show;
  end;

end;

procedure TfrmCadPedidoCompra.BitBtn14Click(Sender: TObject);
begin
  inherited;

  if (not gridPendencias.DataSource.DataSet.Active) or (gridPendencias.DataSource.DataSet.IsEmpty) then
    Exit;

  vDadosIni.montarExcel(gridPendencias, 'Pendencias');
end;

procedure TfrmCadPedidoCompra.BitBtn15Click(Sender: TObject);
begin
  inherited;
  TForm(pnItensPendentes.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPedidoCompra.BitBtn16Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('SUG012', 'INCLUIR', Pedido.dataSet.FieldByName('NUM_PED').AsString, 'ITEM_PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
  begin
    inherited;
    if Pedido.vItemPedido.insert(Pedido) then
    begin
    	habilitarCamposIncluir;
    	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
	      DBEdit3.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
      	DBEdit16.SetFocus;
    end
    else
    begin
      PageControl3.ActivePage := TabSheet3;
    	setFocusCampoErro(pedido.vItemPedido.vNomeCampoErro, pedido.vItemPedido.vMensagemErro);
    end;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn17Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('SUG013', 'SALVAR', Pedido.dataSet.FieldByName('NUM_PED').AsString, 'ITEM_PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
  begin
    inherited;
    if not Pedido.vItemPedido.post then
    begin
      PageControl3.ActivePage := TabSheet3;
    	setFocusCampoErro(pedido.vItemPedido.vNomeCampoErro, pedido.vItemPedido.vMensagemErro);
      exit;
    end;

    desabilitarCampos;

    Pedido.CalculaValorPedido;

    Label33.Visible := false;
    Edit3.Visible := false;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn18Click(Sender: TObject);
begin
  Label33.Visible := false;
  Edit3.Visible := false;

  if vDadosIni.PesqPros('SUG014', 'ALTERAR', Pedido.dataSet.FieldByName('NUM_PED').AsString, 'ITEM_PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
  begin
    inherited;
    if Pedido.vItemPedido.IsEmpty then
    begin
      BitBtn16Click(Sender);
      exit;
    end;

    Pedido.vItemPedido.Edit;
    if Pedido.vItemPedido.dataSet.State = dsEdit then
    begin
    	habilitarCamposEditar;
    	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
	      DBEdit3.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
      	DBEdit16.SetFocus;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn19Click(Sender: TObject);
begin
  Label33.Visible := false;
  Edit3.Visible := false;

  if Pedido.vItemPedido.Cancel then
  begin
  	desabilitarCampos;
    if (Self.Enabled) and (Self.Visible) and (BitBtn17.CanFocus) then
	    BitBtn17.SetFocus;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn1Click(Sender: TObject);
var
 I: Integer;
begin
	inherited;
  try
    SpeedButton2.Hint := 'Enviar para Lixeira -  [SUG004]';

    if not vDadosIni.PesqPros('SUG001', 'PESQUISAR','', 'PEDIDO', '', Pedido.buscas, true) then
      exit;

    Pedido.vCons.campo := ComboBox1.Text;
    Pedido.vCons.ordem := ComboBox2.Text;
    Pedido.vCons.condicao := ComboBox3.Text;
    Pedido.vCons.valor := MaskEdit3.Text;
    Pedido.vCons.dataIni := MaskEdit1.Text;
    Pedido.vCons.dataFim := MaskEdit2.Text;
    Pedido.vCons.porData := MaskEdit1.Visible;

    Pedido.vCons.adicional := CheckBox1.Checked;
    Pedido.vCons.campoAd := ComboBox11.Text;
    Pedido.vCons.valorAd := MaskEdit7.Text;
    Pedido.vCons.dataIniAd := MaskEdit9.Text;
    Pedido.vCons.dataFimAd := MaskEdit8.Text;
    Pedido.vCons.condicaoAd := ComboBox12.Text;
    Pedido.vCons.porDataAd := MaskEdit9.Visible;

    Pedido.consulta;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;

    Pedido.ultimasql := Pedido.dataSet.CommandText;
    if Pedido.StatusLixeira(false) then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

    if Pedido.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[i].FieldName = 'OBS' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn20Click(Sender: TObject);
begin
  inherited;
  Pedido.marcarItemComoRecebido;
end;

procedure TfrmCadPedidoCompra.BitBtn2Click(Sender: TObject);
begin
inherited;
 TForm(pnArquivoPedido.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPedidoCompra.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_COMPRA', 'I', Pedido.buscas) then
    Exit;
  if vDadosIni.PesqPros('SUG002', 'INCLUIR', '', 'PEDIDO', '', Pedido.buscas, true) then
  begin
  	desabilitarCampos;
    if Pedido.Insert then
    begin
      inherited;
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      TabSheet3.Caption := 'Adicionando Novo Pedido';
      GroupBox1.Enabled := true;
      GroupBox4.Enabled := true;
      Edit3.Text := '';
      DBComboBox1.ItemIndex := 0;
      BitBtn4.Enabled := true;
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
      if TelaCadastro = 1 then
      begin
        Pedido.MontarPedido2;
        if trim(Pedido.dataSet.FieldByName('TIPO_PED').AsString) = 'URGENTE' then
          DBComboBox1.ItemIndex := 1
        else
          DBComboBox1.ItemIndex := 0;
      end;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
		BitBtn4.SetFocus;
  if vDadosIni.PesqPros('SUG010', 'SALVAR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, false) then
  begin
    if not Pedido.Post then
    begin
    	PageControl3.ActivePage := TabSheet3;
    	setFocusCampoErro(pedido.vNomeCampoErro, pedido.vMensagemErro);
    end
    else
    begin
      vDadosIni.GravaAuditoria('SUG010', 'SALVAR', Pedido.dataSet.FieldByName('NUM_PED').AsString + ' Sucesso', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas);
      Pedido.RelPedidoCompra;
      if CheckCadSeq.Checked then
      begin
        if Pedido.Insert then
        begin
          Pedido.PreencheCampos;
          DBEdit2.SetFocus;
        end;
        MudaCor;
      end
      else
      begin
        Pedido.Refresh;
        Pedido.vItemPedido.Close;
        if TelaCadastro = 2 then
          BitBtn5.Click
        else
          inherited;
      end;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn55Click(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
    if RadioButtonGrafico.Checked then
      Pedido.RelPedidoCompra
    else
      Pedido.imprimirPed(CheckBoxExibirIpiMva.Checked, CheckBoxExibirLocacaoPeso.Checked);
  finally
  	if RadioButtonGrafico.Checked then
	    _GravaConfiguracoesString('RadioButtonGraficoMatricialPedidoCompra', 'G')
    else
	    _GravaConfiguracoesString('RadioButtonGraficoMatricialPedidoCompra', 'M');
    _GravaConfiguracoesBoolean(CheckBoxExibirIpiMva.Name, CheckBoxExibirIpiMva.Checked);
    _GravaConfiguracoesBoolean(CheckBoxExibirLocacaoPeso.Name, CheckBoxExibirLocacaoPeso.Checked);
  	TForm(pnImpressao.Parent).ModalResult := IDOK;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn56Click(Sender: TObject);
begin
  inherited;
	TForm(pnImpressao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPedidoCompra.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('SUG011', Pedido.vItemPedido.dataSet.FieldByName('NUM_PED').asstring, Pedido.buscas, true) then
  begin
    Pedido.Cancel;
    Pedido.vItemPedido.Cancel;
    Pedido.RollBackTransacao;
    TabSheet2.Show;
    if TelaCadastro <> 2 then
      inherited;
  end;
end;

procedure TfrmCadPedidoCompra.BitBtn63Click(Sender: TObject);
begin
  TForm(pnObservacao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadPedidoCompra.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnSelecionaGradeProd.Parent).ModalResult := IDOK;
end;

procedure TfrmCadPedidoCompra.btGerarClick(Sender: TObject);
begin
  inherited;
 Pedido.SetLancamentos(1);
end;

procedure TfrmCadPedidoCompra.btPesquisarClick(Sender: TObject);
begin
  inherited;
  if Pedido.abrePendenciasPorPeriodo(edDataIni.Text, edDataFim.Text, rbRazaoSocial.Checked) then
  begin
    gridPendencias.Visible := True;
    pnItensPendentes.Caption := '';
  end
  else
  begin
    gridPendencias.Visible := False;
    pnItensPendentes.Caption := 'Sem pendências para o período informado';
  end;

  _GravaConfiguracoesString(edDataIni.Name, edDataIni.Text);
  _GravaConfiguracoesString(edDataFim.Name, edDataFim.Text);
  _GravaConfiguracoesBoolean(rbRazaoSocial.Name, rbRazaoSocial.Checked);

end;

procedure TfrmCadPedidoCompra.btSalvarClick(Sender: TObject);
var
 pValorItens: Extended;
 I: Integer;
begin
  inherited;

  pValorItens := 0;

  for I := 0 to ListBox2.Items.Count - 1 do
    pValorItens := pValorItens + StrToFloat(ListBox2.Items.Strings[I]);

   if (vDadosIni.StrToFloatFormat(pValorItens, 2) > 0) and (vDadosIni.StrToFloatFormat(pValorItens, 2) >  vDadosIni.StrToFloatFormat(Pedido.dataSet.FieldByName('VAL_TOT_PED').AsFloat, 2)) then
   begin
     Application.MessageBox(Pchar('Valor das condições de pagamento = '''+ 'R$ ' + FormatFloat('0.00', pValorItens) + ''' maior que valor do pedido = '''+ 'R$ ' +FormatFloat('0.00', Pedido.dataSet.FieldByName('VAL_TOT_PED').AsFloat) +'''! '), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     exit;
   end
   else if (vDadosIni.StrToFloatFormat(pValorItens, 2) > 0) and (vDadosIni.StrToFloatFormat(pValorItens, 2) < vDadosIni.StrToFloatFormat(Pedido.dataSet.FieldByName('VAL_TOT_PED').AsFloat, 2)) then
   begin
     Application.MessageBox(Pchar('Valor das condições de pagamento = ''' + 'R$ ' + FormatFloat('0.00',pValorItens) + ''' menor que valor do pedido = '''+ 'R$ ' +FormatFloat('0.00', Pedido.dataSet.FieldByName('VAL_TOT_PED').AsFloat) +'''!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     exit;
   end;

  TForm(pnLancParcelas.Parent).ModalResult := IDOK;
end;

procedure TfrmCadPedidoCompra.CheckBox1Click(Sender: TObject);
begin
  inherited;
	if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 193
  else
    GroupBox3.Height := 73;

  groupAdicional.Visible := CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then  
    ComboBox11.SetFocus;
end;

procedure TfrmCadPedidoCompra.CheckBox3Click(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus;
end;

procedure TfrmCadPedidoCompra.CheckBoxExibirIpiMvaClick(Sender: TObject);
begin
  inherited;
//  if (not CheckBoxExibirLocacaoPeso.Checked) then
//  	exit;

	CheckBoxExibirLocacaoPeso.Checked := not CheckBoxExibirIpiMva.Checked;
end;

procedure TfrmCadPedidoCompra.CheckBoxExibirLocacaoPesoClick(Sender: TObject);
begin
  inherited;
//  if (not CheckBoxExibirIpiMva.Checked) then
//  	exit;

  CheckBoxExibirIpiMva.Checked := not CheckBoxExibirLocacaoPeso.Checked;
end;

procedure TfrmCadPedidoCompra.ComboBox11Exit(Sender: TObject);
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
    if (Self.Enabled) and (Self.Visible) and (MaskEdit9.CanFocus) then
      MaskEdit9.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
      MaskEdit7.SetFocus;
end;

procedure TfrmCadPedidoCompra.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadPedidoCompra.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> bitbtn5) and (activecontrol <> bitbtn6)
    and (activecontrol <> bitbtn19) and (activecontrol <> DBEdit9) then
  begin
    if not (Pedido.vItemPedido.dataSet.State in [dsInsert, dsEdit]) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
      	BitBtn16.SetFocus;
      exit;
    end;
    if trim(TDBEdit(Sender).Text) <> '' then
    begin
      if not Pedido.vItemPedido.buscaProduto(Pedido,'', Pedido.vItemPedido.dataSet.FieldByName('GRUPO_PROD').asinteger,
        Pedido.vItemPedido.dataSet.FieldByName('COD_PROD').asstring, false) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        	TDBEdit(Sender).SetFocus;
        Exit;
      end;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
      DBEdit16.SetFocus;
  end;
end;

procedure TfrmCadPedidoCompra.DBEdit13Exit(Sender: TObject);
begin
  inherited;
  if Pedido.vItemPedido.dataSet.State in [dsInsert, dsedit] then
   if Pedido.vItemPedido.dataSet.FieldByName('PERC_FRETE').AsFloat > 0 then
     Pedido.vItemPedido.dataSet.FieldByName('FRETE').AsFloat := 0;
end;

procedure TfrmCadPedidoCompra.DBEdit14Exit(Sender: TObject);
begin
  inherited;
 if (activecontrol <> bitbtn5) and (activecontrol <> bitbtn6) then
  begin
    if trim(TDBEdit(Sender).Text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        Pedido.dataSet.FieldByName('COD_COND_PAG').AsString := vDadosIni.pesquisaRapida('COND_PAG');
      finally
        Screen.Cursor := crDefault;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
        	DBLookupComboBox3.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.DBEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      Pedido.dataSet.FieldByName('COD_COND_PAG').AsString := vDadosIni.pesquisaRapida('COND_PAG');
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.DBEdit15Exit(Sender: TObject);
begin
  inherited;
 if Pedido.vItemPedido.dataSet.State in [dsInsert, dsedit] then
  if Pedido.vItemPedido.dataSet.FieldByName('FRETE').AsFloat > 0 then
    Pedido.vItemPedido.dataSet.FieldByName('PERC_FRETE').AsFloat := 0;
end;

procedure TfrmCadPedidoCompra.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  if not (Pedido.vItemPedido.dataSet.State in [dsInsert, dsEdit]) then
    exit;
  if (activecontrol <> bitbtn5) and (activecontrol <> bitbtn6)
    and (activecontrol <> bitbtn19) and (activecontrol <> bitbtn12) then
    if not Pedido.checaQtdItens then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
      	DBEdit16.SetFocus;
      exit;
    end;
end;

procedure TfrmCadPedidoCompra.DBEdit19Exit(Sender: TObject);
begin
  inherited;
  DBEdit16Exit(sender);
end;

procedure TfrmCadPedidoCompra.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> bitbtn5) and (activecontrol <> bitbtn6) then
  begin
    Pedido.abreFornecedor;
    if trim(TDBEdit(Sender).Text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (CLIENTES.TIPO=''F'' or CLIENTES.TIPO=''A'') ', 'Consulta de Fornecedores');
        if vDadosIni.vPesquisa <> '' then
        	if (Pedido.dataSet.State in [dsInsert, dsEdit]) then
          	Pedido.dataSet.FieldByName('CODIGO_F').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
        	DBLookupComboBox2.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	AProcedure: Tcl_cadCliente;
begin
	if not (Pedido.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('SUG017', 'PESQUISAR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (CLIENTES.TIPO=''F'' or CLIENTES.TIPO=''A'') ', 'Consulta de Fornecedores');
        if vDadosIni.vPesquisa <> '' then
        	if (Pedido.dataSet.State in [dsInsert, dsEdit]) then
						Pedido.dataSet.FieldByName('CODIGO_F').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
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
      	if (Pedido.dataSet.State in [dsInsert, dsEdit]) then
        	Pedido.dataSet.FieldByName('CODIGO_F').asinteger := strtoint(vDadosIni.vPesquisa);
    finally
    end;

//  	try
//      vCliente := TCadClientes.create;
//      vCliente.CadCliente(1);
//      if vDadosIni.vPesquisa <> '' then
//        CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
//    finally
//      if Assigned(vCliente) then
//      	FreeAndNil(vCliente);
//    end;

  end;
end;

procedure TfrmCadPedidoCompra.DBEdit3Enter(Sender: TObject);
begin
  inherited;
  if not (Pedido.vItemPedido.dataSet.State in [dsInsert, dsEdit]) then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
    	BitBtn16.SetFocus;
end;

procedure TfrmCadPedidoCompra.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  Label33.Visible := false;
  Edit3.Visible := false;
  
  if (activecontrol <> bitbtn4) and (activecontrol <> bitbtn5) and (activecontrol <> bitbtn6)
  and not clicouNoX and (activecontrol <> bitbtn19) then
  begin
    if not (Pedido.vItemPedido.dataSet.State in [dsInsert, dsEdit]) then
    begin
      if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
      	BitBtn16.SetFocus;
      exit;
    end;

    if trim(TDBEdit(Sender).Text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        if Pedido.vItemPedido.dataSet.State in [dsInsert, dsEdit] then
        begin
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
          if vDadosIni.vPesquisa <> '' then
          begin
            Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring := vDadosIni.vPesquisa;
//            Pedido.vItemPedido.buscaProduto(Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring, 0,
//              '', Pedido, true);
            Pedido.vItemPedido.buscaProduto(Pedido,Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring, 0,
              '', true);
          end;
        end;
      finally
        Screen.Cursor := crDefault;
        if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        	DBEdit3.setfocus;
      end;
    end
    else
    begin
//      if not Pedido.vItemPedido.buscaProduto(Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring, 0,
//        '', Pedido, true) then
      if not Pedido.vItemPedido.buscaProduto(Pedido,Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring, 0,
        '', true) then
      begin
        if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        	TDBEdit(Sender).SetFocus;
        Exit;
      end
      else
      begin
        Pedido.buscas.Close;
        Pedido.buscas.SQL.Text := ' select first 1 codigo, grupo_prod, cod_prod, cod_empresa, pr_cusc_prod from custos ' +
         ' where fornec = ' + IntToStr(Pedido.dataSet.FieldByName('CODIGO_F').AsInteger) +
         ' and grupo_prod = '+ IntToStr(Pedido.vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
         ' and cod_prod = ' + QuotedStr(trim(Pedido.vItemPedido.dataSet.FieldByName('COD_PROD').AsString)) +
         ' and cod_empresa = ' + vDadosIni.codEmpresa + ' order by codigo desc';
        Pedido.buscas.Prepare;
        Pedido.buscas.Open;

        if not Pedido.buscas.IsEmpty then
        begin
          Label33.Visible := true;
          Edit3.Visible := true;
          Edit3.Text := FormatFloat('0.00' , Pedido.buscas.FieldByName('PR_CUSC_PROD').AsFloat);
        end
        else
        begin
           Pedido.buscas.Close;
           Pedido.buscas.SQL.Text := ' select grupo_prod, cod_prod, cod_empresa, prec_cus_prod from produtos ' +
            ' where grupo_prod = '+ IntToStr(Pedido.vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
            ' and cod_prod = ' + QuotedStr(trim(Pedido.vItemPedido.dataSet.FieldByName('COD_PROD').AsString)) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
           Pedido.buscas.Prepare;
           Pedido.buscas.Open;

          Label33.Visible := true;
          Edit3.Visible := true;
          Edit3.Text := FormatFloat('0.00' , Pedido.buscas.FieldByName('PREC_CUS_PROD').AsFloat) + ' *';
        end;
        if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
        	DBEdit16.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> bitbtn5) and (activecontrol <> bitbtn6) and (activecontrol <> bitbtn19) then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
    	DBEdit10.SetFocus;
end;

procedure TfrmCadPedidoCompra.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('SUG019', 'PESQUISAR', '', 'ITEM_PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        if Pedido.vItemPedido.dataSet.State in [dsInsert, dsEdit] then
          if vDadosIni.vPesquisa <> '' then
          begin
            Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring := vDadosIni.vPesquisa;
            Pedido.vItemPedido.buscaProduto(Pedido,Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring, 0,
              '', true);
          end;
      finally
        Screen.Cursor := crDefault;
        if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
        	DBEdit16.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BitBtn8Click(Sender) ;
end;

procedure TfrmCadPedidoCompra.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
    BitBtn3Click(Sender);
end;

procedure TfrmCadPedidoCompra.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	BitBtn18Click(Sender)
  else if Key = VK_DELETE then
    BitBtn12Click(Sender)
  else if Key = VK_INSERT then
  	BitBtn16Click(Sender);
end;

procedure TfrmCadPedidoCompra.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn8Click(Sender)
  else if Key = VK_TAB then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
    	BitBtn8.SetFocus;
end;

procedure TfrmCadPedidoCompra.DBLookupComboBox1Enter(Sender: TObject);
begin
  inherited;
  Pedido.abreVendedor;
end;

procedure TfrmCadPedidoCompra.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if not Pedido.checaVendedor then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
    exit;
  end;
end;

procedure TfrmCadPedidoCompra.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('SUG018', 'PESQUISAR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
        if vDadosIni.vPesquisa <> '' then
        begin
          Pedido.dataSet.FieldByName('COD_VENDEDOR').asinteger := strtoint(vDadosIni.vPesquisa);
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  {if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('SUG000', '', Pedido.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        //        pedi//        vFornec.CadCliente(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;}
end;

procedure TfrmCadPedidoCompra.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if not Pedido.checaFornecedor then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
    	DBLookupComboBox2.SetFocus;
    exit;
  end;
end;

procedure TfrmCadPedidoCompra.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  if not Pedido.checaCondPag then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
    	DBLookupComboBox3.SetFocus;
    exit;
  end;
end;

procedure TfrmCadPedidoCompra.desabilitarCampos;
begin
	DBEdit3.Enabled := false;
  SpeedButton13.Enabled := false;
  DBEdit53.Enabled := false;
  DBEdit5.Enabled := false;
  DBEdit9.Enabled := false;
  DBEdit10.Enabled := false;

  DBEdit16.Enabled := false;
  DBEdit17.Enabled := false;
  DBEdit18.Enabled := false;
  DBEdit19.Enabled := false;
  DBEdit20.Enabled := false;
  DBEdit11.Enabled := false;
  DBEdit12.Enabled := false;
  DBEdit13.Enabled := false;
  DBEdit15.Enabled := false;
end;

procedure TfrmCadPedidoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 	if frmCadPedidoCompra <> nil then
 		if frmCadPedidoCompra.pnArquivoPedido.Parent <> frmCadPedidoCompra.tsArquivoPedido then
		 exit;

  Pedido.Cancel;
  Pedido.RollBackTransacao;
  Pedido.free;
  Action := caFree;
  frmCadPedidoCompra := nil;
end;

procedure TfrmCadPedidoCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if frmCadPedidoCompra <> nil then
    if frmCadPedidoCompra.pnArquivoPedido.Parent <> frmCadPedidoCompra.tsArquivoPedido then
    begin
      Canclose := false;
      exit;
    end;
  inherited;
end;

procedure TfrmCadPedidoCompra.FormCreate(Sender: TObject);
begin
	vCriou := 0;
//  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDIDO' then
//  begin
//    vDadosIni.vPesquisa := '';
//    vDadosIni.vTipoForm := 6;
//    vDadosIni.vModalOuChild := 'M';
//  end;
  tsRelPedidoCompra.TabVisible := false;
  tsArquivoPedido.TabVisible := false;
  tsSelecionaGradeProd.TabVisible := false;
  tsLancamento.TabVisible := false;
  tsPendencias.TabVisible := false;
  tsObservacao.TabVisible := false;
  tsImprimirRel.TabVisible := false;
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Pedido := TPedidoCompra.Create;
  DBGrid1.DataSource := dtmSugestaoCompras.dsPedidoCompra;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle:= fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadPedidoCompra.FormKeyDown(Sender: TObject; var Key: Word;
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
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end;
end;

procedure TfrmCadPedidoCompra.FormShow(Sender: TObject);
var
  vNumItem: Integer;
begin
	if not Self.Enabled then
    Exit;

  try
  	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDIDO' then
    begin
      vDadosIni.vPesquisa := '';
      vDadosIni.vTipoForm := 6;
      vDadosIni.vModalOuChild := 'M';
    end;

    if vShow <> 1 then
    begin
      inherited;
      if vCriou = 0 then
      	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
      SpeedButton8.Visible := (vDadosIni.vEmp.vUsarProducao = 'S') or (vDadosIni.vEmp.vUsarProducao = 'D');
      SpeedButton8.Enabled := SpeedButton8.Visible;
    end;
    if TelaCadastro = 1 then
      BitBtn3Click(Sender);


  if (TelaCadastro = 6) then
  begin
    frmCadPedidoCompra := TfrmCadPedidoCompra(self);
    BitBtn3Click(Sender);
    Pedido.dataSet.FieldByName('COD_VENDEDOR').AsInteger :=  vDadosIni.vDtSetTmp.FieldByName('COD_VENDEDOR').AsInteger;
    Pedido.dataSet.FieldByName('CODIGO_F').AsInteger :=  vDadosIni.vDtSetTmp.FieldByName('COD_FORNECEDOR').AsInteger;
    Pedido.dataSet.FieldByName('COD_COND_PAG').AsInteger :=  vDadosIni.vDtSetTmp.FieldByName('COD_COND_PAG').AsInteger;
    Pedido.dataSet.FieldByName('NUM_COTACAO').AsInteger := vDadosIni.vDtSetTmp.FieldByName('NUM_COTACAO').AsInteger;
    Pedido.dataSet.FieldByName('TIPO_PED').AsString := 'NORMAL';
    Pedido.dataSet.FieldByName('DATA_ENV_PED').AsDateTime := vDadosIni.getDataBanco(Pedido.buscas);
    Pedido.dataSet.FieldByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codEmpresa);
    Pedido.dataSet.FieldByName('FRETE_BASE_IPI').AsString := 'N';
    Pedido.dataSet.FieldByName('IPI_BASE_ICM').AsString := 'N';
    Pedido.dataSet.FieldByName('ATIVO').AsInteger := 1;

    vNumItem := 0;
    while not vDadosIni.vDtSetTmpItens.Eof do
    begin
      if (vDadosIni.vDtSetTmpItens.FieldByName('SEL').AsString = 'S') then
      begin
        BitBtn16Click(Sender);
        Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.vDtSetTmpItens.FieldByName('NUM_FAB_PROD').AsString;
        Pedido.vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger := vDadosIni.vDtSetTmpItens.FieldByName('GRUPO_PROD').AsInteger;
        Pedido.vItemPedido.dataSet.FieldByName('COD_PROD').AsString := vDadosIni.vDtSetTmpItens.FieldByName('COD_PROD').AsString;
        Pedido.vItemPedido.dataSet.FieldByName('COD_EMP_MULT').AsInteger := vDadosIni.vDtSetTmpItens.FieldByName('COD_EMP_MULT').AsInteger;
        Pedido.vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat := vDadosIni.vDtSetTmpItens.FieldByName('QTDE_SIMULADA').AsFloat;
        Pedido.vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat := vDadosIni.vDtSetTmpItens.FieldByName('VALOR_EQUILIBRIO').AsFloat;
        Pedido.vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat := vDadosIni.vDtSetTmpItens.FieldByName('CMV_PRODUTO').AsFloat;
        Pedido.vItemPedido.dataSet.FieldByName('DESCR_PROD').AsString := Copy(vDadosIni.vDtSetTmpItens.FieldByName('DESCR_PROD').AsString, 1, 60);
        Pedido.vItemPedido.dataSet.FieldByName('COD_GRADE').AsInteger := vDadosIni.vDtSetTmpItens.FieldByName('COD_GRADE').AsInteger;
        Pedido.vItemPedido.dataSet.FieldByName('NUM_COTACAO').AsInteger := vDadosIni.vDtSetTmpItens.FieldByName('NUM_COTACAO').AsInteger;
        Pedido.vItemPedido.dataSet.FieldByName('MVA').AsFloat := vDadosIni.vDtSetTmpItens.FieldByName('MVA_SIM').AsFloat;
        Pedido.vItemPedido.dataSet.FieldByName('PERC_IPI').AsFloat := vDadosIni.vDtSetTmpItens.FieldByName('IPI_SIM').AsFloat;
        Pedido.vItemPedido.dataSet.FieldByName('PERC_FRETE').AsFloat := vDadosIni.vDtSetTmpItens.FieldByName('FRETE_SIM').AsFloat;
        if Pedido.vItemPedido.dataSet.FieldByName('COD_GRADE').AsInteger <= 0 then
          Pedido.vItemPedido.buscaProduto(Pedido,Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring, 0,           '', true);
        BitBtn17Click(Sender);
      end;
      vDadosIni.vDtSetTmpItens.Next;
    end;
    Pedido.CalculaValorPedido;
  end;

  if vCriou = 0 then
    vCriou := 1;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadPedidoCompra.gridPendenciasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  vDadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TfrmCadPedidoCompra.gridPendenciasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;  
end;

procedure TfrmCadPedidoCompra.gridPendenciasTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(gridPendencias, Column);
end;

procedure TfrmCadPedidoCompra.groupAdicionalExit(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmCadPedidoCompra.GroupBox1Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
  	BitBtn16.SetFocus;
end;

procedure TfrmCadPedidoCompra.habilitarCamposEditar;
begin
	DBEdit3.Enabled := false;
  SpeedButton13.Enabled := false;
  DBEdit53.Enabled := false;
  DBEdit5.Enabled := false;
  DBEdit9.Enabled := false;
  DBEdit10.Enabled := false;

  DBEdit16.Enabled := true;
  DBEdit17.Enabled := true;
  DBEdit18.Enabled := true;
  DBEdit19.Enabled := true;
  DBEdit20.Enabled := false;
  DBEdit11.Enabled := true;
  DBEdit12.Enabled := true;
  DBEdit13.Enabled := true;
  DBEdit15.Enabled := true;
end;

procedure TfrmCadPedidoCompra.habilitarCamposIncluir;
begin
	DBEdit3.Enabled := true;
  SpeedButton13.Enabled := true;
  DBEdit53.Enabled := true;
  DBEdit5.Enabled := true;
  DBEdit9.Enabled := true;
  DBEdit10.Enabled := true;

  DBEdit16.Enabled := true;
  DBEdit17.Enabled := true;
  DBEdit18.Enabled := true;
  DBEdit19.Enabled := true;
  DBEdit20.Enabled := false;
  DBEdit11.Enabled := true;
  DBEdit12.Enabled := true;
  DBEdit13.Enabled := true;
  DBEdit15.Enabled := true;
end;

procedure TfrmCadPedidoCompra.ListBox1DblClick(Sender: TObject);
begin
  inherited;
   Pedido.abreLancEditParcelas;
end;

procedure TfrmCadPedidoCompra.pnImpressaoEnter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn55.CanFocus) then
  	BitBtn55.SetFocus;
end;

procedure TfrmCadPedidoCompra.QRDBText11Print(sender: TObject;
  var Value: string);
begin
  inherited;

 if Pedido.dataSet.IsEmpty then
   exit;

 Pedido.buscas.Close;
 Pedido.buscas.SQL.Text := ' select first 1 codigo, grupo_prod, cod_prod, cod_empresa, pr_cusc_prod from custos ' +
  ' where fornec = ' + IntToStr(Pedido.dataSet.FieldByName('CODIGO_F').AsInteger) +
  ' and grupo_prod = '+ IntToStr(Pedido.vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
  ' and cod_prod = ' + QuotedStr(trim(Pedido.vItemPedido.dataSet.FieldByName('COD_PROD').AsString)) +
  ' and cod_empresa = ' + vDadosIni.codEmpresa + ' order by codigo desc';
 Pedido.buscas.Prepare;
 Pedido.buscas.Open;

 if not Pedido.buscas.IsEmpty then
   Value := FormatFloat('0.00' , Pedido.buscas.FieldByName('PR_CUSC_PROD').AsFloat)
 else
   Value := '* ' + FormatFloat('0.00' , Pedido.vItemPedido.dataSet.FieldByName('VL_ULT_COMPRA').AsFloat);
end;

procedure TfrmCadPedidoCompra.QRDBText2Print(sender: TObject;
  var Value: string);
begin
  inherited;
  if not Pedido.buscas.IsEmpty then
  begin
    Value := FormatFloat('0.00' , (Pedido.vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat * Pedido.buscas.FieldByName('PR_CUSC_PROD').AsFloat));
    vtotultped := vtotultped + (Pedido.vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat * Pedido.buscas.FieldByName('PR_CUSC_PROD').AsFloat);
  end
  else
  begin
   Value := '* ' + FormatFloat('0.00' , (Pedido.vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat * Pedido.vItemPedido.dataSet.FieldByName('VL_ULT_COMPRA').AsFloat));
   vtotultped := vtotultped + (Pedido.vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat * Pedido.vItemPedido.dataSet.FieldByName('VL_ULT_COMPRA').AsFloat);
  end;
end;

procedure TfrmCadPedidoCompra.qrpPedidoCompraBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  vtotultped := 0;
end;

procedure TfrmCadPedidoCompra.qrpPedidoCompraPreview(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vtotultped := 0;
    vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Pedidos de Compra');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPedidoCompra.RadioButtonGraficoClick(Sender: TObject);
begin
  inherited;
//  if (not RadioButtonGrafico.Enabled) and (not RadioButtonMatricial.Enabled) then
//  	exit;

  CheckBoxExibirIpiMva.Enabled      := RadioButtonMatricial.Checked;
	CheckBoxExibirLocacaoPeso.Enabled := RadioButtonMatricial.Checked;
end;

procedure TfrmCadPedidoCompra.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if SaveTextFileDialog1.Execute then
    Edit1.Text := SaveTextFileDialog1.FileName;
end;

procedure TfrmCadPedidoCompra.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  Pedido.marcarPedidoComoRecebido;
end;

procedure TfrmCadPedidoCompra.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if Pedido.vItemPedido.dataSet.State in [dsInsert, dsEdit] then
      if vDadosIni.vPesquisa <> '' then
      begin
        Pedido.vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').asstring := vDadosIni.vPesquisa;
      end;
  finally
    Screen.Cursor := crDefault;
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;
  end;
end;

procedure TfrmCadPedidoCompra.SpeedButton14Click(Sender: TObject);
begin
  inherited;

   if trim(edCrDoc.Text) = '' then
   begin
     Application.MessageBox(Pchar('Numero do Documento não informado!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     if (Self.Enabled) and (Self.Visible) and (edCrDoc.CanFocus) then
       edCrDoc.SetFocus;
     exit;
   end;

   try
     StrToDate(edCrVenc.Text);
   except
     Application.MessageBox(Pchar('Data de Vencimento inválida!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     if (Self.Enabled) and (Self.Visible) and (edCrVenc.CanFocus) then
       edCrVenc.SetFocus;
     exit;
   end;

   if mValorParcelaCr.Valor <= 0 then
   begin
     Application.MessageBox(Pchar('Valor do Documento não informado!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     if (Self.Enabled) and (Self.Visible) and (mValorParcelaCr.CanFocus) then
       mValorParcelaCr.SetFocus;
     exit;
   end;

 TForm(pnLancEditParcelas.Parent).ModalResult := IDOK;
end;

procedure TfrmCadPedidoCompra.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  TForm(pnLancEditParcelas.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPedidoCompra.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_COMPRA', 'A', Pedido.buscas) then
    Exit;
  if vDadosIni.PesqPros('SUG003', 'ALTERAR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
  begin
    if not Pedido.dataSet.IsEmpty then
    begin
      if Pedido.dataSet.FieldByName('ATIVO').AsInteger = 1 then
      begin
      	desabilitarCampos;
        if Pedido.Edit then
        begin
          inherited;
          PageControl1.ActivePage := TabSheet1;
          TabSheet1.Show;
          TabSheet3.Caption := 'Alterando o Pedido de Compra Número: ' + Pedido.dataSet.FieldByName('NUM_PED').AsString;
          TabSheet3.TabVisible := true;
          PageControl3.ActivePage := TabSheet3;
        	if trim(Pedido.dataSet.FieldByName('TIPO_PED').AsString) = 'URGENTE' then
          	DBComboBox1.ItemIndex := 1
          else
	          DBComboBox1.ItemIndex := 0;
          if Pedido.dataSet.FieldByName('STATUS_PED').AsString = '' then
          begin
            GroupBox1.Enabled := true;
            GroupBox4.Enabled := true;
            BitBtn4.Enabled := true;
            if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
            	DBEdit2.SetFocus;
          end
          else
          begin
            GroupBox1.Enabled := false;
            GroupBox4.Enabled := false;
            BitBtn4.Enabled := false;
          end;
        end;
      end
      else
        Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

procedure TfrmCadPedidoCompra.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('SUG007', 'LIXEIRA', '', 'PEDIDO', '', Pedido.buscas, true) then
  begin
    inherited;
    if not Pedido.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [SUG004]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [SUG005]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_COMPRA', 'E', Pedido.buscas) then
    Exit;
  if Pedido.dataSet.FieldByName('ATIVO').AsInteger = 0 then
  begin
    if vDadosIni.PesqPros('SUG004', 'EXCLUIR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, false) then
    begin
      if Pedido.DeletarRegistro then
        if Pedido.StatusLixeira(false) then
          SpeedButton25.Visible := true
        else
          SpeedButton25.Visible := false;
    end;
  end
  else if Pedido.dataSet.FieldByName('ATIVO').AsInteger = 1 then
  begin
    if vDadosIni.PesqPros('SUG005', 'EXCLUIR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, false) then
    begin
      if Pedido.EnviarParaLixeira then
        if Pedido.StatusLixeira(false) then
          SpeedButton25.Visible := true
        else
          SpeedButton25.Visible := false;
    end;
  end;
end;

procedure TfrmCadPedidoCompra.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  if not vDadosIni.PesqPros('SUG006', 'IMPRIMIR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
   exit;

//  RadioButtonGrafico.Enabled        := False;
//  RadioButtonMatricial.Enabled      := False;
//  RadioButtonGrafico.Checked        := False;
//  RadioButtonMatricial.Checked      := False;
  if trim(_LerConfiguracoesRegistroString('RadioButtonGraficoMatricialPedidoCompra')) = 'M' THEN
  	RadioButtonMatricial.Checked    := True
  else
	  RadioButtonGrafico.Checked      := True;
  CheckBoxExibirIpiMva.Checked      := _LerConfiguracoesRegistroBoolean(CheckBoxExibirIpiMva.Name);
  CheckBoxExibirLocacaoPeso.Checked := _LerConfiguracoesRegistroBoolean(CheckBoxExibirLocacaoPeso.Name);

  RadioButtonGrafico.Enabled        := True;
  RadioButtonMatricial.Enabled      := True;

  CheckBoxExibirIpiMva.Checked      := regGetConfBool(CheckBoxExibirIpiMva.Name);
  CheckBoxExibirLocacaoPeso.Checked := not CheckBoxExibirIpiMva.Checked;

  try
    if not vDadosIni.abreForm('Impressão', pnImpressao, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
      exit;
  finally
    regSetConfBool(CheckBoxExibirIpiMva.Name, CheckBoxExibirIpiMva.Checked);
  end;
end;

procedure TfrmCadPedidoCompra.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_COMPRA', 'A', Pedido.buscas) then
    Exit;
  if vDadosIni.PesqPros('SUG008', 'RESTAURAR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, false) then
    Pedido.RestaurarRegistro;
  if Pedido.StatusLixeira(false) then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

procedure TfrmCadPedidoCompra.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('SUG009', 'EXPORTAR', '', 'PEDIDO',  Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, false) then
    Exit;

  if Pedido.dataSet.IsEmpty then
    Exit;

  begin
    Edit2.text:=_LerConfiguracoesRegistroString('EndMontaPedHonda');
    Edit1.text:=_LerConfiguracoesRegistroString('EndMontaPedHW');

    Edit1.text:= ExtractFilePath(Edit1.text)+ 'Pedido_'+ vDadosIni.StrZero(Pedido.dataSet.FieldByName('num_ped').AsInteger,6)+'.txt';

    Pedido._abreFormExportarPedidoCompra;

//    tsArquivoPedido.TabVisible := true;
//    tsArquivoPedido.Show;
//    Edit2.Text := vDadosIni.vPedHonda;
  end;
end;

procedure TfrmCadPedidoCompra.SpeedButton7Click(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if not vDadosIni.PesqPros('SUG024', 'VISUALIZAR', '', 'PEDIDO', '', Pedido.buscas, false) then
    Exit;
  try
    vDadosIni.vShiftClick := False;

    vTemp := _LerConfiguracoesRegistroString(edDataIni.Name);
    if Trim(vTemp) <> '' then
      edDataIni.Text := vTemp
    else
      edDataIni.Text := DateToStr(Date);

    vTemp := _LerConfiguracoesRegistroString(edDataFim.Name);
    if Trim(vTemp) <> '' then
      edDataFim.Text := vTemp
    else
      edDataFim.Text := DateToStr(Date);

    rbRazaoSocial.Checked := _LerConfiguracoesRegistroBoolean(rbRazaoSocial.Name);
    gridPendencias.Visible := False;
    pnItensPendentes.Caption := 'Informe o período acima e clique em "Pesquisar"';

    Pedido.abreFormPendenciasPedidos;
  finally
    vDadosIni.vShiftClick := False;
  end;
end;

procedure TfrmCadPedidoCompra.SpeedButton8Click(Sender: TObject);
begin
  inherited;
    if not vDadosIni.PesqPros('SUG024', 'ALTERAR', '', 'PEDIDO', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, false) then
    Exit;

  Pedido._marcarParaProducao;
end;

procedure TfrmCadPedidoCompra.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if SaveTextFileDialog1.Execute then
    Edit2.Text := SaveTextFileDialog1.FileName;
end;

procedure TfrmCadPedidoCompra.QRExpr1Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'R$' + FormatFloat('0.00' , vtotultped);
end;

initialization
  RegisterClass(TfrmCadPedidoCompra);
finalization
  UnRegisterClass(TfrmCadPedidoCompra);

end.

