unit UCadControles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DB, DBCtrls , UClassesCadastrosBasicosCx, QuickRpt, QRCtrls, grimgctrl,
  AppEvnts, uEditMoeda, uEditHw, uDataSet_OOP;

type
  TfrmCadControles = class(TfrmCadPadraoM)
    OpenDialog1: TOpenDialog;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TsSaldoCTrl: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid4: TDBGrid;
    Panel6: TPanel;
    BitBtn9: TBitBtn;
    DtSaldoCtrl: TDataSource;
    TsSaldoBanco: TTabSheet;
    Panel7: TPanel;
    Label31: TLabel;
    MaskEdit4: TMaskEdit;
    Label34: TLabel;
    EdtValorBanco: TEditMoeda;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    CheckBox2: TCheckBox;
    tsDefinirControlePorEmpresa: TTabSheet;
    pnDefinirControlePorEmpresa: TPanel;
    Panel12: TPanel;
    pnDefinirControlePorEmpresaBottom: TPanel;
    pnDefinirControlePorEmpresaTop: TPanel;
    DBGridDefinirControlePorEmpresa: TDBGrid;
    btSelectAllDefControleEmpresa: TSpeedButton;
    btUnSelectAllDefControleEmpresa: TSpeedButton;
    tsTaxaEcommerce: TTabSheet;
    pnTaxasCadastro: TPanel;
    pnTaxaNomeControle: TPanel;
    Panel13: TPanel;
    pnTaxasCadastroCancel: TBitBtn;
    pnTaxasCadastroOK: TBitBtn;
    pnTaxaClienteG: TPanel;
    pnTaxaGeral: TPanel;
    pnTaxaRight: TPanel;
    GrTaxaParcelas: TGroupBox;
    Label66: TLabel;
    Label67: TLabel;
    DBEditDe: TDBEdit;
    DBEditAte: TDBEdit;
    GrTaxaProd: TGroupBox;
    lbPercProd: TLabel;
    DBEditPercProd: TDBEdit;
    GrTaxaAdicionalPedido: TGroupBox;
    lbValorPorPedido: TLabel;
    DBEditTaxaPorPedido: TDBEdit;
    pnDescSimulacao: TPanel;
    pnExFrete: TPanel;
    pnExProd: TPanel;
    pnExPedido: TPanel;
    pnDescTaxa: TPanel;
    pnExTaxaAdPedido: TPanel;
    pnExQtdeItens: TPanel;
    pnExTaxaProd: TPanel;
    pnExTaxaAdItem: TPanel;
    pnExTaxaFrete: TPanel;
    pnExTaxaAdTot: TPanel;
    pnExConsFreteTaxa: TPanel;
    pnDescAreceber: TPanel;
    pnExValorReceber: TPanel;
    pnTaxasConsulta: TPanel;
    pnTaxaNomeControle2: TPanel;
    pnTaxasConsultaButtom: TPanel;
    pnTaxasConsultaAlterar: TBitBtn;
    pnTaxasConsultaNovo: TBitBtn;
    pnTaxasConsultaDeletar: TBitBtn;
    pnTaxasConsultaCancel: TBitBtn;
    DBGridTaxaConsulta: TDBGrid;
    DBCheckBoxTaxaAdicionalPorPedido: TDBCheckBox;
    DBCheckBoxTaxaProduto: TDBCheckBox;
    GrTaxaAdicionalItemPedido: TGroupBox;
    lbValorPorItem: TLabel;
    DBEditTaxaPorItem: TDBEdit;
    DBCheckBoxTaxaAdicionalPorItem: TDBCheckBox;
    GroupBox10: TGroupBox;
    DBCheckBoxConsVlFreteTaxa: TDBCheckBox;
    GrTaxaFrete: TGroupBox;
    DBCheckBoxTaxaFrete: TDBCheckBox;
    lbPercFrete: TLabel;
    DBEditPercFrete: TDBEdit;
    pnEmpUnif: TPanel;
    lbEmpUnif: TLabel;
    DBLookupComboBoxEmpUnif: TDBLookupComboBox;
    EditHwEmpUnif: TEditHw;
    GrTaxaValor: TGroupBox;
    lbValorDe: TLabel;
    DBEditValorDe: TDBEdit;
    DBEditValorAte: TDBEdit;
    lbValorAte: TLabel;
    GrTaxaRegra: TGroupBox;
    ckConsProd: TCheckBox;
    DBCheckBoxConsFrete: TDBCheckBox;
    lbValorDe2: TLabel;
    lbValorAte2: TLabel;
    pnVlProd: TPanel;
    lbDesVlPord: TLabel;
    EditHwVlProd: TEditHw;
    lbDesVlFrete: TLabel;
    EditHwVlFrete: TEditHw;
    lbDesQtdeItens: TLabel;
    EditHwQtdeItens: TEditHw;
    Panel14: TPanel;
    GrTaxaAdicionalUnidadePedido: TGroupBox;
    lbValorPorUnidade: TLabel;
    DBEditTaxaPorUnidade: TDBEdit;
    DBCheckBoxTaxaAdicionalPorUnidade: TDBCheckBox;
    pnExTaxaAdUnidade: TPanel;
    lbDesPorUnidade: TLabel;
    EditHwQtdeUnidade: TEditHw;
    pnExQtdeUnidades: TPanel;
    pnControlesTop: TPanel;
    pnControlesBottom: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label40: TLabel;
    Label48: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit23: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    DBComboBox9: TDBComboBox;
    DBComboBox10: TDBComboBox;
    DBEdit14: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit22: TDBEdit;
    Label35: TLabel;
    DBEditCodEmpresa: TDBEdit;
    ComboBoxCodEmpresa: TComboBox;
    tsControleUnificados: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    DBText1: TDBText;
    Label195: TLabel;
    DBText2: TDBText;
    Label62: TLabel;
    DBText3: TDBText;
    GroupBox13: TGroupBox;
    Label63: TLabel;
    Label65: TLabel;
    DBEdit27: TDBEdit;
    DBComboBox25: TDBComboBox;
    CheckBox4: TCheckBox;
    lbEmpUnif2: TLabel;
    lb_cliente_inst_pagto2: TLabel;
    tsControlesCliente: TTabSheet;
    pnControlesCliente: TPanel;
    pnTopAlterarVendCli: TPanel;
    BitBtn47: TBitBtn;
    BitBtn53: TBitBtn;
    RadioGroup1: TRadioGroup;
    GroupBox15: TGroupBox;
    DBText4: TDBText;
    Label71: TLabel;
    DBText5: TDBText;
    ScrollBox5: TScrollBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    lb_cliente_inst_pagto: TLabel;
    DBEdit3: TDBEdit;
    DBComboBox11: TDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    lkFormaPagamento: TDBLookupComboBox;
    lkBandeira: TDBLookupComboBox;
    GroupBox9: TGroupBox;
    Label39: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label49: TLabel;
    DBEdit16: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Edit1: TEdit;
    DBEdit24: TDBEdit;
    Panel15: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    lbDiasEntFluxo: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    LabelClasseProgFid: TLabel;
    DBComboBox12: TDBComboBox;
    DBEdit15: TDBEdit;
    DBComboBox13: TDBComboBox;
    DBComboBox14: TDBComboBox;
    DBComboBox15: TDBComboBox;
    DBEdit21: TDBEdit;
    DBComboBox16: TDBComboBox;
    DBComboBox17: TDBComboBox;
    DBComboBox18: TDBComboBox;
    DBEdit25: TDBEdit;
    DBComboBox19: TDBComboBox;
    DBComboBox20: TDBComboBox;
    DBComboBox21: TDBComboBox;
    DBEdit26: TDBEdit;
    DBComboBox22: TDBComboBox;
    DBComboBox23: TDBComboBox;
    DBComboBox24: TDBComboBox;
    DBComboBoxClasseProgFid: TDBComboBox;
    GroupBox14: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    edTefTipo: TDBLookupComboBox;
    edTefIdCartDig: TDBLookupComboBox;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    lb_cliente_inst_intermed_transacao: TLabel;
    Label73: TLabel;
    edRegistro1601: TDBLookupComboBox;
    Label74: TLabel;
    DBEdit30: TDBEdit;
    Label72: TLabel;
    lb_cliente_inst_intermed_transacao2: TLabel;
    Label75: TLabel;
    DBComboBox26: TDBComboBox;
    ScrollBox6: TScrollBox;
    Panel8: TPanel;
    GroupBox8: TGroupBox;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox7: TGroupBox;
    DBGrid3: TDBGrid;
    Panel9: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn46: TBitBtn;
    Panel10: TPanel;
    BitBtn45: TBitBtn;
    Panel11: TPanel;
    Label36: TLabel;
    Label64: TLabel;
    Label76: TLabel;
    DBComboBox27: TDBComboBox;
    btDefinirEmp: TBitBtn;
    btnMultiempresaOK: TBitBtn;
    btnMultiempresaCancelar: TBitBtn;
    MarcarTodosControles: TMenuItem;
    DesmarcarTodosControles: TMenuItem;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DesmarcarTodosControlesClick(Sender: TObject);
    procedure MarcarTodosControlesClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnMultiempresaCancelarClick(Sender: TObject);
    procedure btnMultiempresaOKClick(Sender: TObject);
    procedure btDefinirEmpClick(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure DBEdit29Exit(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEditTaxaPorUnidadeExit(Sender: TObject);
    procedure DBCheckBoxTaxaAdicionalPorUnidadeClick(Sender: TObject);
    procedure EditHwQtdeUnidadeExit(Sender: TObject);
    procedure EditHwQtdeItensExit(Sender: TObject);
    procedure EditHwVlFreteExit(Sender: TObject);
    procedure EditHwVlProdExit(Sender: TObject);
    procedure DBLookupComboBoxEmpUnifExit(Sender: TObject);
    procedure EditHwEmpUnifExit(Sender: TObject);
    procedure DBCheckBoxConsVlFreteTaxaClick(Sender: TObject);
    procedure DBEditTaxaPorItemExit(Sender: TObject);
    procedure DBEditTaxaPorPedidoExit(Sender: TObject);
    procedure DBEditPercFreteExit(Sender: TObject);
    procedure DBEditPercProdExit(Sender: TObject);
    procedure DBCheckBoxTaxaAdicionalPorItemClick(Sender: TObject);
    procedure DBCheckBoxTaxaAdicionalPorPedidoClick(Sender: TObject);
    procedure DBCheckBoxTaxaFreteClick(Sender: TObject);
    procedure DBCheckBoxTaxaProdutoClick(Sender: TObject);
    procedure pnTaxasCadastroEnter(Sender: TObject);
    procedure pnTaxasConsultaDeletarClick(Sender: TObject);
    procedure pnTaxasConsultaAlterarClick(Sender: TObject);
    procedure pnTaxasConsultaNovoClick(Sender: TObject);
    procedure pnTaxasConsultaCancelClick(Sender: TObject);
    procedure pnTaxasCadastroCancelClick(Sender: TObject);
    procedure pnTaxasCadastroOKClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBGridDefinirControlePorEmpresaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBGridDefinirControlePorEmpresaCellClick(Column: TColumn);
    procedure btUnSelectAllDefControleEmpresaClick(Sender: TObject);
    procedure btSelectAllDefControleEmpresaClick(Sender: TObject);
    procedure DBGridDefinirControlePorEmpresaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure DBComboBox8Exit(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure DBEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2Enter(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBComboBox10Exit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBComboBox10KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox9KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox8KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
  	vCriou: Smallint;
    tefTipos: TDadosLookUp_OOP;
    tefIdsCartDig: TDadosLookUp_OOP;
    spedRegistro1601: TDadosLookUp_OOP;

    procedure montarComponentes;
  public
    { Public declarations }
  end;

var
  frmCadControles: TfrmCadControles;
  obControle : TControle;
  vControleBalanco : Integer;

implementation
{$R *.dfm}

uses
   udtmAtivo, UDtmCadastrosBasicosCx, uPadrao, uDadosIni, StrUtils, hw_utils;

procedure TfrmCadControles.BitBtn10Click(Sender: TObject);
var
 vdata: Tdate;
begin
  inherited;
  try
   vdata:=StrToDate(MaskEdit4.Text)
  except
   Application.MessageBox('Erro de Conversão de data, verifique!','Atenção', MB_ICONINFORMATION + MB_OK );
   exit;
  end;
 if not obControle.modificaSaldoB(vdata,EdtValorBanco.Valor,1) then
 begin
 	 if (Self.Enabled) and (Self.Visible) and (maskedit4.CanFocus) then
   	 maskedit4.setfocus;
 end
 else
  TForm(Panel7.Parent).ModalResult := IDOK;
end;

procedure TfrmCadControles.BitBtn11Click(Sender: TObject);
begin
  inherited;
TForm(Panel7.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadControles.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG120', 'ATIVAR VINCULO COM O BALANCO',
  	 'COD.CONTROLE: '+obControle.dataSet.FieldByName('CODIGO_CTRL').AsString,
    'CONTROLES','' ,obControle.buscas , true) then
     exit;

  obControle.removerAtivarVinculoBalanco(true);
  Label64.Visible := obControle.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
end;

procedure TfrmCadControles.BitBtn1Click(Sender: TObject);
var
 vSqlAdicional: string;
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira - [CXG005]';
  
  if not vDadosIni.PesqPros('CXG001', 'PESQUISAR CONTROLE','','CONTROLES','' ,obControle.buscas , true) then
     exit;

  if MaskEdit2.Visible then
  begin
  	if (CheckBox4.Visible) and (CheckBox4.Checked) then
    begin
      if not obControle.ConsultaCampos('CONTROLES', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        'controles.* ',
        ' left join empresa on empresa.cod_empresa = controles.codigo_emp ',
        vSqlAdicional,
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (empresa.financeiro_unificado = ''S'') then ' +
          ' empresa.codigo_unificadora else controles.codigo_emp end) ',
          '')) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
    begin
      if not obControle.ConsultaCampos('CONTROLES', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end;
  end
  else
    if CheckBox2.Checked then
      vSqlAdicional:=' AND (SELECT COUNT(*) FROM CONTROLES_BALANCO CBAL ' +
      ' WHERE CBAL.CODIGO_CTRL = CONTROLES.CODIGO_CTRL AND CBAL.COD_EMPRESA = CONTROLES.CODIGO_EMP ) = 0'
    else
      vSqlAdicional:='';

    if (CheckBox4.Visible) and (CheckBox4.Checked) then
    begin
	 		if not obControle.ConsultaCampos('CONTROLES', MaskEdit3.text, ComboBox1.Text,
    		combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
    		'controles.* ',
        ' left join empresa on empresa.cod_empresa = controles.codigo_emp ',
        vSqlAdicional,
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (empresa.financeiro_unificado = ''S'') then ' +
          ' empresa.codigo_unificadora else controles.codigo_emp end) ',
          '')) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;
    end
    else
    begin
      if not obControle.ConsultaCampos('CONTROLES', MaskEdit3.text, ComboBox1.Text,
    		combobox3.Text, ComboBox2.text, vSqlAdicional, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
		    		ComboBox1.SetFocus;
    end;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton6.Visible := true;
  SpeedButton8.Visible := true;
  SpeedButton7.Visible := true;
  SpeedButton11.Visible := (vDadosIni.vEmp.vFinanceiroUnificado)
  	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  SpeedButton23.Visible := true;
  SpeedButton12.Visible := true;
  SpeedButton24.Visible := true;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadControles.pnTaxasConsultaAlterarClick(Sender: TObject);
begin
	if obControle.vControleTaxaEcommerce.IsEmpty then
  	exit;

	if not vDadosIni.PesqPros('CXG128', 'ALTERAR', 'CTRL: ' + obControle.dataSet.FieldByName('CODIGO_CTRL').AsString,
  	'CONTROLES_TAXAS_ECOMMERCE', obControle.vControleTaxaEcommerce.dataSet.FieldByName('SEQID').AsString, obControle.buscas , true) then
     exit;

  if not obControle.vControleTaxaEcommerce.Edit then
  	exit;

  DBCheckBoxConsFrete.Enabled := false;
  DBEditValorDe.Enabled := false;
  DBEditValorAte.Enabled := false;
  DBEditDe.Enabled := false;
  DBEditAte.Enabled := false;
    
	pnTaxaNomeControle.Caption := IntToStr(obControle.dataSet.FieldByName('codigo_ctrl').AsInteger) +
  	' - ' + trim(obControle.dataSet.FieldByName('nome_ctrl').AsString);
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
  if not obControle.vControleTaxaEcommerce.abreFormTaxaEcommerceCad(true) then
  	exit;
end;

procedure TfrmCadControles.pnTaxasConsultaCancelClick(Sender: TObject);
begin
  TForm(pnTaxasConsulta.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadControles.pnTaxasConsultaDeletarClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CXG130', 'EXCLUIR', 'CTRL: ' + obControle.dataSet.FieldByName('CODIGO_CTRL').AsString,
  	'CONTROLES_TAXAS_ECOMMERCE', obControle.vControleTaxaEcommerce.dataSet.FieldByName('SEQID').AsString, obControle.buscas , true) then
     exit;

  if not obControle.vControleTaxaEcommerce.Delete then
  	exit;
end;

procedure TfrmCadControles.pnTaxasConsultaNovoClick(Sender: TObject);
var
	vConsRegraFrete: string;
begin
	if not vDadosIni.PesqPros('CXG127', 'INCLUIR', 'CTRL: ' + obControle.dataSet.FieldByName('CODIGO_CTRL').AsString,
  	'CONTROLES_TAXAS_ECOMMERCE', '', obControle.buscas, true) then
     exit;

	vConsRegraFrete := 'N';
  if not obControle.vControleTaxaEcommerce.dataSet.IsEmpty then
  	vConsRegraFrete := obControle.vControleTaxaEcommerce.dataSet.FieldByName('CONS_FRETE_REGRA').AsString;

  DBCheckBoxConsFrete.Enabled := obControle.vControleTaxaEcommerce.dataSet.IsEmpty;
  DBEditValorDe.Enabled := true;
  DBEditValorAte.Enabled := true;
  DBEditDe.Enabled := true;
  DBEditAte.Enabled := true;

  if not obControle.vControleTaxaEcommerce.Insert(
  	obControle.dataSet.FieldByName('codigo_ctrl').AsInteger,
  	vDadosIni.IfThen(EditHwEmpUnif.Visible, Trunc(EditHwEmpUnif.AsValue), 0),
    vConsRegraFrete) then
  	exit;

	pnTaxaNomeControle.Caption := IntToStr(obControle.dataSet.FieldByName('codigo_ctrl').AsInteger) +
  	' - ' + trim(obControle.dataSet.FieldByName('nome_ctrl').AsString);
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
  if not obControle.vControleTaxaEcommerce.abreFormTaxaEcommerceCad then
  	exit;
end;

procedure TfrmCadControles.BitBtn2Click(Sender: TObject);
begin
  inherited;
//
//  if not vDadosIni.PesqPros('CXG003', 'SAIR CADASTRO DE CONTROLES','','CONTROLES','' ,obControle.buscas , true) then
//     exit;
//
//  obControle.Cancel;
//  vControleBalanco := 0;
//
end;

procedure TfrmCadControles.BitBtn3Click(Sender: TObject);
var
	vNomeEmpresa: string;
  I: Integer;
begin          
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    exit;
  end;

  if not vDadosIni.PesqPros('CXG002', 'INCLUIR', '', 'CONTROLES', '', obControle.buscas, true) then
    exit;

	if not obControle.Insert then
    exit;

  if (vDadosIni.vEmp.vFinanceiroUnificado) then
  begin
  	obControle.vEmpresaDefControle.abreEmpresaDefControle(0);

    if obControle.vEmpresaDefControle.dataSet.RecordCount > 1 then
    	if not obControle.abreFormDefinirContolesPorEmpresa then
      begin
      	obControle.Cancel;
			  obControle.RollBackTransacao;
  			exit;
      end;
  end;

  ActiveControl := BitBtn3;

  inherited;

  for I := 0 to ComponentCount - 1 do
   	if (Components[I] is TScrollBox) then
    	TScrollBox(Components[I]).VertScrollBar.Position := 0;

  PageControl1.ActivePage:=TabSheet1;
  DBEdit1.Enabled := true;
  DBComboBox8.Enabled := true;
  TabSheet3.TabVisible := True;
  TabSheet4.TabVisible := True;
  TabSheet3.Caption:= 'Cadastro Controle';
  PageControl3.ActivePage := TabSheet3;
  TabSheet3.TabVisible := True;
  TabSheet5.TabVisible := True;
  tsControleUnificados.TabVisible := False;
  montarComponentes;
  obControle.abreFpProgFid(DBComboBoxClasseProgFid, LabelClasseProgFid);
  obControle.vCodigoControle := obControle.dataSet.FieldByName('CODIGO_CTRL').AsString;
  Label64.Visible := obControle.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
  DBComboBox27.Enabled := False;
  DBComboBox24.Enabled := False;
  DBComboBox22.Enabled := False;
  DBComboBox6.Enabled := True;
  Panel10.Visible := False;
  Label36.Caption := '';
  pnControlesTop.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    vNomeEmpresa := trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger));
    ComboBoxCodEmpresa.Clear;
    ComboBoxCodEmpresa.Items.Add(vNomeEmpresa);
    ComboBoxCodEmpresa.ItemIndex := 0;
  end;

  Label50.Visible := vDadosIni.vEmp.vUsarControlesCliente = 'S';
  DBComboBox16.Visible := vDadosIni.vEmp.vUsarControlesCliente = 'S';
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadControles.BitBtn45Click(Sender: TObject);
begin
  inherited;
   TabSheet5.TabVisible := False;
//  TabSheet1.TabVisible := False;
//  TabSheet2.TabVisible := True;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;

  Panel3.Visible := True;
end;

procedure TfrmCadControles.BitBtn46Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG118', 'DESATIVAR VINCULO COM O BALANCO',
  	 'COD.CONTROLE: '+obControle.dataSet.FieldByName('CODIGO_CTRL').AsString,
    'CONTROLES','' ,obControle.buscas , true) then
     exit;

  obControle.removerAtivarVinculoBalanco;
  Label64.Visible := obControle.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
end;

procedure TfrmCadControles.BitBtn47Click(Sender: TObject);
begin
  inherited;
	TForm(pnControlesCliente.Parent).ModalResult := IDOK;
end;

procedure TfrmCadControles.BitBtn4Click(Sender: TObject);
begin
  if vControleBalanco = 1 then
  begin
    inherited;
//    obControle.abreControle;
    obControle.Refresh;
    vControleBalanco := 0;
    Exit;
  end;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not obControle.Post then
  begin
     setFocusCampoErro(obControle.vNomeCampoErro, obControle.vMensagemErro);
     exit;
  end
  else
  begin
     if CheckCadSeq.Checked then
     begin
       if obControle.Insert then
       begin
       	 PageControl3.ActivePage := TabSheet3;
         if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
         	 DBEdit1.SetFocus;
       end;
       MudaCor;
     end
     else
     begin
       inherited;
       TabSheet3.TabVisible := False;
		   TabSheet5.TabVisible := False;
//       obControle.abreControle;
     end;
  end;

end;

procedure TfrmCadControles.BitBtn53Click(Sender: TObject);
begin
  inherited;
	TForm(pnControlesCliente.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadControles.BitBtn5Click(Sender: TObject);
begin
  inherited;

//  if not vDadosIni.PesqPros('CXG010', 'CANCELAR CONTROLE','','CONTROLES','' ,obControle.buscas , true) then
//   exit;

  obControle.Cancel;
  obControle.RollBackTransacao;

  TabSheet3.TabVisible := False;
  TabSheet5.TabVisible := False;
  vControleBalanco := 0;
end;

procedure TfrmCadControles.BitBtn7Click(Sender: TObject);
begin
  inherited;

  if obControle.dataSet.FieldByName('CODIGO_CTRL').AsFloat <= 0 then
  begin
     Application.MessageBox('Código do controle não informado.','Atenção',MB_ICONINFORMATION + MB_OK );
     PageControl3.ActivePage := TabSheet3;
     if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
       DBEdit1.SetFocus;
     exit;
  end;

  if obControle.vCtrlBalanco.dataSet.Locate('CODIGO_CTRL; CODSEQ_BALANCO; COD_EMPRESA',
  		VarArrayOf([obControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger,
      obControle.vBalanco.dataSet.FieldByName('CODSEQ_BALANCO').AsInteger,
      vDadosIni.codEmpresa]), []) then
  begin
    Application.MessageBox('Sequência de Balanço já existe para este controle','Atenção', MB_ICONINFORMATION + MB_OK );
    Exit;
  end;

  if not vDadosIni.PesqPros('CXG012', 'INCLUIR CONTROLE DE BALANCO',
  	  'COD.CONTROLE: '+obControle.dataSet.FieldByName('codigo_ctrl').AsString +
     'COD.BALANCO: '+ obControle.vBalanco.dataSet.FieldByName('codseq_balanco').AsString,
    'CONTROLES','', obControle.buscas, true) then
     exit;

  if obControle.verificaControle_e_balanco then
  begin
    if obControle.PesquisaControleCadastrado then
    begin
      Application.MessageBox('Sequência de balanco já existe para este controle, verifique!','Atenção', MB_ICONINFORMATION + MB_OK );
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
       	DBGrid2.SetFocus;
    end
    else
       obControle.IncluirControleBalanco;
  end;
end;

procedure TfrmCadControles.BitBtn8Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG011', 'EXCLUIR CONTROLE DE BALANCO',
  	 'COD.CONTROLE: '+obControle.dataSet.FieldByName('codigo_ctrl').AsString +
    'COD.BALANCO:'+obControle.vCtrlBalanco.dataSet.FieldByName('codseq_balanco').AsString,
  'CONTROLES','' ,obControle.buscas , true) then
     exit;

  obControle.vCtrlBalanco.Delete;
end;

procedure TfrmCadControles.BitBtn9Click(Sender: TObject);
begin
  inherited;
 PageControl1.ActivePage:=TabSheet2;
end;

procedure TfrmCadControles.btDefinirEmpClick(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vEmp.vFinanceiroUnificado)
     and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
   begin
     Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
       'Empresa selecionada: ' +
       IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
       trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
     Exit;
   end;

  if not obControle.abreFormDefinirContolesPorEmpresa then
  	Exit;
end;

procedure TfrmCadControles.btnMultiempresaCancelarClick(Sender: TObject);
begin
  inherited;
  TForm(pnDefinirControlePorEmpresa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadControles.btnMultiempresaOKClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (btnMultiempresaOK.CanFocus) then
  	btnMultiempresaOK.SetFocus;

  TForm(pnDefinirControlePorEmpresa.Parent).ModalResult := IDOK;
end;

procedure TfrmCadControles.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obControle._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadControles.btSelectAllDefControleEmpresaClick(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    obControle.vEmpresaDefControle._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadControles.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obControle._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadControles.btUnSelectAllDefControleEmpresaClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    obControle.vEmpresaDefControle._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadControles.DBCheckBoxConsVlFreteTaxaClick(Sender: TObject);
begin
//	if DBCheckBoxConsVlFreteTaxa.Checked then
//  begin
//  	DBCheckBoxTaxaFrete.Checked := false;
//  	DBCheckBoxTaxaAdicionalPorPedido.Checked := false;
//    DBCheckBoxTaxaAdicionalPorItem.Checked := false;
//
//    DBCheckBoxTaxaFrete.Enabled := false;
//  	DBCheckBoxTaxaAdicionalPorPedido.Enabled := false;
//    DBCheckBoxTaxaAdicionalPorItem.Enabled := false;
//  end
//  else
//  begin
//    DBCheckBoxTaxaFrete.Enabled := true;
//  	DBCheckBoxTaxaAdicionalPorPedido.Enabled := true;
//    DBCheckBoxTaxaAdicionalPorItem.Enabled := true;
//  end;
  
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
    obControle.vControleTaxaEcommerce.dataSet.FieldByName('FRETE_CONTA_SMART_PLACE').AsString :=
      vDadosIni.IfThen(DBCheckBoxConsVlFreteTaxa.Checked, 'S', 'N');
      
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
end;

procedure TfrmCadControles.DBCheckBoxTaxaAdicionalPorItemClick(Sender: TObject);
begin
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
  begin
    obControle.vControleTaxaEcommerce.dataSet.FieldByName('HAB_TAXA_POR_ITEM').AsString :=
      vDadosIni.IfThen(DBCheckBoxTaxaAdicionalPorItem.Checked, 'S', 'N');
    if not DBCheckBoxTaxaAdicionalPorItem.Checked then
		  obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_ITEM').AsFloat := 0;
  end;

  DBEditTaxaPorItem.Enabled := DBCheckBoxTaxaAdicionalPorItem.Checked;
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
  if (Self.Enabled) and (Self.Visible) and (DBEditTaxaPorItem.CanFocus) then
    DBEditTaxaPorItem.SetFocus;
end;

procedure TfrmCadControles.DBCheckBoxTaxaAdicionalPorPedidoClick(
  Sender: TObject);
begin
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
  begin
    obControle.vControleTaxaEcommerce.dataSet.FieldByName('HAB_TAXA_POR_PEDIDO').AsString :=
      vDadosIni.IfThen(DBCheckBoxTaxaAdicionalPorPedido.Checked, 'S', 'N');
    if not DBCheckBoxTaxaAdicionalPorPedido.Checked then
		  obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_PEDIDO').AsFloat := 0;
  end;

  DBEditTaxaPorPedido.Enabled := DBCheckBoxTaxaAdicionalPorPedido.Checked;
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
  if (Self.Enabled) and (Self.Visible) and (DBEditTaxaPorPedido.CanFocus) then
  	DBEditTaxaPorPedido.SetFocus;
end;

procedure TfrmCadControles.DBCheckBoxTaxaAdicionalPorUnidadeClick(
  Sender: TObject);
begin
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
  begin
    obControle.vControleTaxaEcommerce.dataSet.FieldByName('HAB_TAXA_POR_UNIDADE').AsString :=
      vDadosIni.IfThen(DBCheckBoxTaxaAdicionalPorUnidade.Checked, 'S', 'N');
    if not DBCheckBoxTaxaAdicionalPorUnidade.Checked then
		  obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_UNIDADE').AsFloat := 0;
  end;

  DBEditTaxaPorUnidade.Enabled := DBCheckBoxTaxaAdicionalPorUnidade.Checked;
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
  if (Self.Enabled) and (Self.Visible) and (DBEditTaxaPorUnidade.CanFocus) then
    DBEditTaxaPorUnidade.SetFocus;
end;

procedure TfrmCadControles.DBCheckBoxTaxaFreteClick(Sender: TObject);
begin
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
  begin
    obControle.vControleTaxaEcommerce.dataSet.FieldByName('HAB_TAXA_FRETE').AsString :=
      vDadosIni.IfThen(DBCheckBoxTaxaFrete.Checked, 'S', 'N');
    if not DBCheckBoxTaxaFrete.Checked then
		  obControle.vControleTaxaEcommerce.dataSet.FieldByName('TAXA_FRETE').AsFloat := 0;
  end;

  DBEditPercFrete.Enabled := DBCheckBoxTaxaFrete.Checked;
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
  if (Self.Enabled) and (Self.Visible) and (DBEditPercFrete.CanFocus) then
  	DBEditPercFrete.SetFocus;
end;

procedure TfrmCadControles.DBCheckBoxTaxaProdutoClick(Sender: TObject);
begin
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
	begin
    obControle.vControleTaxaEcommerce.dataSet.FieldByName('HAB_TAXA_PROD').AsString :=
      vDadosIni.IfThen(DBCheckBoxTaxaProduto.Checked, 'S', 'N');
    if not DBCheckBoxTaxaProduto.Checked then
		  obControle.vControleTaxaEcommerce.dataSet.FieldByName('TAXA_PROD').AsFloat := 0;
  end;

	DBEditPercProd.Enabled := DBCheckBoxTaxaProduto.Checked;
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
  if (Self.Enabled) and (Self.Visible) and (DBEditPercProd.CanFocus) then
  	DBEditPercProd.SetFocus;
end;

procedure TfrmCadControles.DBComboBox10Exit(Sender: TObject);
begin
  inherited;
	PageControl3.ActivePage:=TabSheet4;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox12.CanFocus) then
		DBComboBox12.SetFocus;
end;

procedure TfrmCadControles.DBComboBox10KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox8Exit(Sender: TObject);
begin
  inherited;
  if (trim(obControle.dataSet.FieldByName('DOCS').AsString) <> 'S2') then
  	DBComboBox6.ItemIndex := 1;
//  DBComboBox24.Enabled := DBComboBox8.ItemIndex = 1;
  if Trim(obControle.dataSet.FieldByName('DOCS').AsString) <> 'S2' then
    obControle.dataSet.FieldByName('RECEBER_CTP').AsString := 'N';
  if Trim(obControle.dataSet.FieldByName('DOCS').asString) = 'N' then
    obControle.dataSet.FieldByName('CONTRAPARTIDA').AsString := 'N';
  DBComboBox27.Enabled := IndexText(obControle.fstr('DOCS'), ['S1', 'S2']) >= 0;
  DBComboBox24.Enabled := IndexText(obControle.fstr('DOCS'), ['S1', 'S2']) >= 0;
  DBComboBox22.Enabled := trim(obControle.dataSet.FieldByName('DOCS').AsString) <> 'N';
  DBComboBox6.Enabled := trim(obControle.dataSet.FieldByName('DOCS').AsString) = 'S2';
  obControle.abreFpProgFid(DBComboBoxClasseProgFid, LabelClasseProgFid);
end;

procedure TfrmCadControles.DBComboBox8KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBComboBox9KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadControles.DBEdit19Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn5 then
    Exit;
    
  if obControle.dataSet.FieldByName('N_CONTA_PLC_TX_CARTAO').AsFloat > 0 then
  begin
    obControle.buscas.Close;
    obControle.buscas.SQL.Text := 'select N_CONTA_PLC, STHAB, ativo from P_CONTAS' +
      ' where N_CONTA_PLC = :N_CONTA_PLC';
    obControle.buscas.ParamByName('N_CONTA_PLC').AsFloat :=
      obControle.dataSet.FieldByName('N_CONTA_PLC_TX_CARTAO').AsFloat;
    obControle.buscas.Open;
    if obControle.buscas.IsEmpty then
    begin               
      Application.MessageBox('N° Conta informada para taxa de cartão não encontrada, tente outra', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) then
      	DBEdit19.SetFocus;
    end
    else if (obControle.buscas.FieldByName('STHAB').AsString = 'N') or
      (obControle.buscas.FieldByName('ativo').AsInteger = 0) then
    begin
      Application.MessageBox('N° Conta informada para taxa de cartão desabilitada, tente outra', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) then
      	DBEdit19.SetFocus;
    end;
  end;
end;

procedure TfrmCadControles.DBEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('P_CONTAS');
    if obControle.dataSet.State in [dsInsert, dsEdit] then
      obControle.dataSet.FieldByName('N_CONTA_PLC_TX_CARTAO').AsString := vDadosIni.vPesquisa;
  end;
end;

procedure TfrmCadControles.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn5 then
    Exit;  
  
  if obControle.dataSet.FieldByName('CTRL_SAIDA_TX_CARTAO').AsFloat > 0 then
  begin
    obControle.buscas.Close;
    obControle.buscas.SQL.Text := 'select nome_ctrl, ativo, docs, CONTR_BANC from controles' +
      ' where codigo_ctrl = ' + IntToStr(obControle.dataSet.FieldByName('CTRL_SAIDA_TX_CARTAO').AsInteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    obControle.buscas.Open;
    Edit1.Text := obControle.buscas.FieldByName('nome_ctrl').AsString;

    if obControle.buscas.IsEmpty then
    begin
      Application.MessageBox('Controle informado para saida de taxa de cartão (Banco) não encontrado, tente outro', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      	DBEdit20.SetFocus;
    end
    else if (obControle.buscas.FieldByName('ativo').AsInteger = 0) then
    begin
      Application.MessageBox('Controle informado para saida de taxa de cartão (Banco) desativado, tente outro', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      	DBEdit20.SetFocus;
    end
    else if (Trim(obControle.buscas.FieldByName('docs').AsString) <> 'N') then
    begin
      Application.MessageBox('Controle informado para saida de taxa de cartão (Banco) deve ser do tipo documentos deve ser "N - Dinheiro"', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      	DBEdit20.SetFocus;
    end
    else if (Trim(obControle.buscas.FieldByName('CONTR_BANC').AsString) <> 'S') then
    begin
      Application.MessageBox('Controle informado para saida de taxa de cartão (Banco) não definido como controle bancário', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      	DBEdit20.SetFocus;
    end;
  end
  else
  	Edit1.Text := '';
end;

procedure TfrmCadControles.DBEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CONTROLES');
    if obControle.dataSet.State in [dsInsert, dsEdit] then
      obControle.dataSet.FieldByName('CTRL_SAIDA_TX_CARTAO').AsString := vDadosIni.vPesquisa;

    DBEdit20Exit(DBEdit20);
  end;
end;

procedure TfrmCadControles.DBEdit29Exit(Sender: TObject);
begin
  inherited;
  lb_cliente_inst_intermed_transacao.Caption := obControle.GetNomeClienteAdmCartao(ipTransacao);
  lb_cliente_inst_intermed_transacao2.Caption := lb_cliente_inst_intermed_transacao.Caption;
end;

procedure TfrmCadControles.DBEdit2Enter(Sender: TObject);
begin
  inherited;
if obControle.dataSet.State = dsInsert then
 obControle.dataSet.FieldByName('NOME_CONTABIL').AsString:=obControle.dataSet.FieldByName('NOME_CTRL').AsString;
end;

procedure TfrmCadControles.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  lb_cliente_inst_pagto.Caption := obControle.GetNomeClienteAdmCartao(ipPagadora);
  lb_cliente_inst_pagto2.Caption := lb_cliente_inst_pagto.Caption;
end;

procedure TfrmCadControles.DBEditPercFreteExit(Sender: TObject);
begin
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
		if obControle.vControleTaxaEcommerce.dataSet.FieldByName('TAXA_FRETE').AsFloat < 0 then
    	obControle.vControleTaxaEcommerce.dataSet.FieldByName('TAXA_FRETE').AsFloat := 0;

  if not obControle.vControleTaxaEcommerce.atualizarCamposValores then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEditPercProd.CanFocus) then
    	DBEditPercProd.SetFocus;
    exit;
  end;
end;

procedure TfrmCadControles.DBEditPercProdExit(Sender: TObject);
begin
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
		if obControle.vControleTaxaEcommerce.dataSet.FieldByName('TAXA_PROD').AsFloat < 0 then
    	obControle.vControleTaxaEcommerce.dataSet.FieldByName('TAXA_PROD').AsFloat := 0;

	if not obControle.vControleTaxaEcommerce.atualizarCamposValores then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEditPercProd.CanFocus) then
    	DBEditPercProd.SetFocus;
    exit;
  end;
end;

procedure TfrmCadControles.DBEditTaxaPorItemExit(Sender: TObject);
begin
  if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
		if obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_ITEM').AsFloat < 0 then
    	obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_ITEM').AsFloat := 0;

  if not obControle.vControleTaxaEcommerce.atualizarCamposValores then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEditPercProd.CanFocus) then
    	DBEditPercProd.SetFocus;
    exit;
  end;
end;

procedure TfrmCadControles.DBEditTaxaPorPedidoExit(Sender: TObject);
begin
	if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
		if obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_PEDIDO').AsFloat < 0 then
    	obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_PEDIDO').AsFloat := 0;

  if not obControle.vControleTaxaEcommerce.atualizarCamposValores then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEditPercProd.CanFocus) then
    	DBEditPercProd.SetFocus;
    exit;
  end;
end;

procedure TfrmCadControles.DBEditTaxaPorUnidadeExit(Sender: TObject);
begin
  if (obControle.vControleTaxaEcommerce.dataSet.State in [dsInsert, dsEdit]) then
		if obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_UNIDADE').AsFloat < 0 then
    	obControle.vControleTaxaEcommerce.dataSet.FieldByName('VL_TAXA_POR_UNIDADE').AsFloat := 0;

  if not obControle.vControleTaxaEcommerce.atualizarCamposValores then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEditPercProd.CanFocus) then
    	DBEditPercProd.SetFocus;
    exit;
  end;
end;

procedure TfrmCadControles.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    obControle._marcaDesmarcaLinha;
end;

procedure TfrmCadControles.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCadControles.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
     SpeedButton1Click(Sender)
  else if (key = VK_DELETE) then
     SpeedButton2Click(sender)
  else if (key = VK_INSERT) then
     BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not obControle.dataSet.IsEmpty then
      obControle._marcaDesmarcaLinha;;
end;

procedure TfrmCadControles.DBGridDefinirControlePorEmpresaCellClick(
  Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    obControle.vEmpresaDefControle._marcaDesmarcaLinha;
end;

procedure TfrmCadControles.DBGridDefinirControlePorEmpresaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if obControle.vEmpresaDefControle.dataSet.FieldByName('SEL').AsString = 'S' then
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
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadControles.DBGridDefinirControlePorEmpresaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not obControle.dataSet.IsEmpty then
      obControle.vEmpresaDefControle._marcaDesmarcaLinha;
end;

procedure TfrmCadControles.DBLookupComboBoxEmpUnifExit(Sender: TObject);
begin
  if DBLookupComboBoxEmpUnif.KeyValue = null then
  	EditHwEmpUnif.AsValue := 0
  else
	  EditHwEmpUnif.AsValue := DBLookupComboBoxEmpUnif.KeyValue;

  if not obControle.vControleTaxaEcommerce.vEmpresasUnificadas._BuscarEmpresas(DBLookupComboBoxEmpUnif.KeyValue) then
  begin
  	Application.MessageBox('Código Empresa Unificada não existe ou não encontrada!', 'Atenção', MB_ICONERROR + MB_OK );
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxEmpUnif.CanFocus) then
    	DBLookupComboBoxEmpUnif.SetFocus;
    exit;
  end;
  
  obControle.vControleTaxaEcommerce.abreControleEcommerce(
  	obControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger,
    DBLookupComboBoxEmpUnif.KeyValue);
end;

procedure TfrmCadControles.DesmarcarTodosControlesClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obControle._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadControles.EditHwEmpUnifExit(Sender: TObject);
begin
  if (ActiveControl = pnTaxasConsultaCancel) then
    Exit;

  DBLookupComboBoxEmpUnif.KeyValue := EditHwEmpUnif.AsInteger;

  if EditHwEmpUnif.AsInteger <= 0 then
  	exit;

  if not obControle.vControleTaxaEcommerce.vEmpresasUnificadas._BuscarEmpresas(EditHwEmpUnif.AsInteger) then
  begin
  	Application.MessageBox('Código Empresa Unificada não existe ou não encontrada!', 'Atenção', MB_ICONERROR + MB_OK );
    if (Self.Enabled) and (Self.Visible) and (EditHwEmpUnif.CanFocus) then
    	EditHwEmpUnif.SetFocus;
    exit;
  end;

  obControle.vControleTaxaEcommerce.abreControleEcommerce(
  	obControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger,
    EditHwEmpUnif.AsInteger);
end;

procedure TfrmCadControles.EditHwQtdeUnidadeExit(Sender: TObject);
begin
	if EditHwQtdeUnidade.AsValue <= 0 then
  begin
  	Application.MessageBox('Quantidade de unidades deve ser informada!','Atenção', MB_ICONINFORMATION + MB_OK );
    if (Self.Enabled) and (Self.Visible) and (EditHwQtdeUnidade.CanFocus) then
    	EditHwQtdeUnidade.SetFocus;
  	exit;
  end;

  if EditHwQtdeItens.AsValue > EditHwQtdeUnidade.AsValue then
  begin
    Application.MessageBox('Quantidade de unidades não deve ser menor que a quantidade de itens!','Atenção', MB_ICONINFORMATION + MB_OK );
    if (Self.Enabled) and (Self.Visible) and (EditHwQtdeUnidade.CanFocus) then
    	EditHwQtdeUnidade.SetFocus;
  	exit;
  end;

  _GravaConfiguracoesDouble(EditHwQtdeUnidade.Name, EditHwQtdeUnidade.AsValue);
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
end;

procedure TfrmCadControles.EditHwQtdeItensExit(Sender: TObject);
begin
  if EditHwQtdeItens.AsValue <= 0 then
  begin
  	Application.MessageBox('Quantidade de itens deve ser informada!','Atenção', MB_ICONINFORMATION + MB_OK );
    if (Self.Enabled) and (Self.Visible) and (EditHwQtdeItens.CanFocus) then
    	EditHwQtdeItens.SetFocus;
  	exit;
  end;

  if EditHwQtdeItens.AsValue > EditHwQtdeUnidade.AsValue then
  	EditHwQtdeUnidade.AsValue := EditHwQtdeItens.AsValue;


  _GravaConfiguracoesDouble(EditHwQtdeItens.Name, EditHwQtdeItens.AsValue);
  _GravaConfiguracoesDouble(EditHwQtdeUnidade.Name, EditHwQtdeUnidade.AsValue);
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
end;

procedure TfrmCadControles.EditHwVlFreteExit(Sender: TObject);
begin
	if EditHwVlFrete.AsValue < 0 then
  	EditHwVlFrete.AsValue := 0;
//  if EditHwVlFrete.AsValue <= 0 then
//  begin
//  	Application.MessageBox('Valor do frete não informado!','Atenção', MB_ICONINFORMATION + MB_OK );
//    if (Self.Enabled) and (Self.Visible) and (EditHwVlFrete.CanFocus) then
//    	EditHwVlFrete.SetFocus;
//  	exit;
//  end;

  _GravaConfiguracoesDouble(EditHwVlFrete.Name, EditHwVlFrete.AsValue);
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
end;

procedure TfrmCadControles.EditHwVlProdExit(Sender: TObject);
begin
	if EditHwVlProd.AsValue <= 0 then
  begin
  	Application.MessageBox('Valor dos produtos deve ser informado!','Atenção', MB_ICONINFORMATION + MB_OK );
    if (Self.Enabled) and (Self.Visible) and (EditHwVlProd.CanFocus) then
    	EditHwVlProd.SetFocus;
  	exit;
  end;

  _GravaConfiguracoesDouble(EditHwVlProd.Name, EditHwVlProd.AsValue);
  obControle.vControleTaxaEcommerce.atualizarCamposValores;
end;

procedure TfrmCadControles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  tefTipos.Free;
  tefIdsCartDig.Free;
  spedRegistro1601.Free;

  Action := caFree;
  frmCadControles := nil;
end;

procedure TfrmCadControles.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  inherited;
  obControle := TControle.create;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
  tefTipos := TDadosLookUp_OOP.create;
  tefIdsCartDig := TDadosLookUp_OOP.create;
  spedRegistro1601 := TDadosLookUp_OOP.create;
end;

procedure TfrmCadControles.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
     BitBtn5Click(sender);
end;

procedure TfrmCadControles.FormShow(Sender: TObject);
var
I : Integer;
begin
	if not Self.Enabled then
    Exit;

	CheckBox4.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
	obControle.dataSet.FieldByName('CODIGO_EMP').Tag :=
  	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);

	vControleBalanco := 0;
  if vCriou = 0 then
  	obControle.abreControle;
  DBGrid1.DataSource:= DtmCadBasicosCx.dsControles;

  inherited;
  if vCriou = 0 then
  	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).CharCase:= ecUpperCase;

    if Components[I] is TDBComboBox then
      if TDBComboBox(Components[I]).Tag = 0 then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;

  if obControle.StatusLixeira then
     lixeiraVazia(false)
  else
     lixeiraVazia(true);

  TabSheet5.TabVisible := false;
  TsSaldoCTrl.TabVisible := false;
  TsSaldoBanco.TabVisible := false;
  tsDefinirControlePorEmpresa.TabVisible := false;
  tsTaxaEcommerce.TabVisible := false;
  tsControleUnificados.TabVisible := false;
  tsControlesCliente.TabVisible := false;

  SpeedButton23.Visible := vDadosIni.vEmp.vUsarControlesCliente = 'S';

  SpeedButton11.Visible := (vDadosIni.vEmp.vFinanceiroUnificado)
  	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  btDefinirEmp.Visible := (vDadosIni.vEmp.vFinanceiroUnificado)
  	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));

  SpeedButton12.Visible := ((vDadosIni.vEcommerce.vHabilitarEcommerce) or (vDadosIni.vEmp.vFinanceiroUnificado));

  PageControl1.ActivePage := TabSheet2;
  
  Label55.Hint := DBComboBox20.Items.Text;
  DBComboBox20.Hint := DBComboBox20.Items.Text;

  DBComboBox21.Items.Clear;
  DBComboBox21.Items.Add('D1 - Dia de vencimento do cliente, se não existir será o dia atual. Mesmo dia nas demais parcelas');
  DBComboBox21.Items.Add('D2 - Dia de vencimento do cliente, se não existir o usuário deve digitar. Mesmo dia nas demais parcelas');
  DBComboBox21.Items.Add('D3 - Dia atual atribuido automaticamente. Mesmo dia nas demais parcelas');
  DBComboBox21.Items.Add('D4 - Dia digitado pelo usuário no momento do parcelamento. Mesmo dia nas demais parcelas');
  DBComboBox21.Items.Add('D5 - 30 dias acrescidos em cada vencimento. Primeiro vencimento dia D+30. Provavelmente terá dias diferentes nas demais parcelas');
  DBComboBox21.Items.Add('N - Não usar para este controle. Usar do config');

  Label56.Hint := DBComboBox21.Items.Text;
  DBComboBox21.Hint := 'Configuração funciona apenas paras condições de pagamento fixas em meses. E: 3X, 5X, 6X, etc' + #13 + #13 +
  DBComboBox21.Items.Text;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "CXG116" SALVAR CONTROLES SEM VINCULAR AO BALANCO' + #13 +
    'Processo "CXG122" PERMITIR SALVAR CONTROLE SEM VINCULAR CLASSE PROGRAMA FIDELIDADE';

  if not vDadosIni.validarAcessoEmpresasUnificadas(obControle.buscas) then
  begin
  	frmCadControles.fechar := True;
    PostMessage(frmCadControles.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadControles.GroupBox4Enter(Sender: TObject);
var
	vTipoParcelamento: string;
  vDiaBaseParcelamento: string;
  I: Integer;
begin
  inherited;
  DBEdit16.Enabled := Trim(obControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C';
//  DBComboBox20.Enabled := not (Trim(obControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C');

  if (DBComboBox20.Items.Count <> 2) and (Trim(obControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C') then
  begin
  	vTipoParcelamento := trim(obControle.dataSet.FieldByName('TIPO_PARCELAMENTO').AsString);

  	DBComboBox20.Clear;
  	DBComboBox20.Items.Add('I1 - Parcelas iguais e diferença na primeira');
		DBComboBox20.Items.Add('IN - Parcelas iguais e diferença na última');

    if trim(vTipoParcelamento) <> '' then
    begin
      for I := 0 to DBComboBox20.Items.Count - 1 do
      begin
        if ContainsStr(DBComboBox20.Items[I], vTipoParcelamento + ' - ') then
        begin
          DBComboBox20.ItemIndex := I;
          Break;
        end;
      end;
    end;
  end
  else if (DBComboBox20.Items.Count = 2) and (Trim(obControle.dataSet.FieldByName('TP_PLANO').AsString) <> 'C') then
  begin
  	vTipoParcelamento := trim(obControle.dataSet.FieldByName('TIPO_PARCELAMENTO').AsString);
    
  	DBComboBox20.Clear;
	  DBComboBox20.Items.Add('I1 - Parcelas iguais e diferença na primeira');
		DBComboBox20.Items.Add('IN - Parcelas iguais e diferença na última');
		DBComboBox20.Items.Add('T1 - Truncamento de parcelas e diferença na primeira');
		DBComboBox20.Items.Add('TN - Truncamento de parcelas e diferença na última');
		DBComboBox20.Items.Add('N - Não usar para este controle. Usar do config');

    if trim(vTipoParcelamento) <> '' then
		begin
	    for I := 0 to DBComboBox20.Items.Count - 1 do
  	  begin
    		if ContainsStr(DBComboBox20.Items[I], vTipoParcelamento + ' - ') then
	      begin
  	    	DBComboBox20.ItemIndex := I;
    	    Break;
      	end;
	    end;
    end;
  end;

  {Cartão quando descontado precisa informar o dia de vencimento de 1 a 2 dias uteis, por isso comentado abaixo
  if Trim(obControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
  begin
    DBComboBox21.Items.Clear;
    DBComboBox21.Items.Add('D3 - Dia atual atribuido automaticamente. Mesmo dia nas demais parcelas');
    DBComboBox21.Items.Add('D5 - 30 dias acrescidos em cada vencimento. Primeiro vencimento dia D+30. Provavelmente terá dias diferentes nas demais parcelas');
    if obControle.dataSet.State in [dsEdit, dsInsert] then
      obControle.dataSet.FieldByName('TIPO_PARCELAMENTO').AsString := 'I1';
  end
  else
  }
//  begin
  	vDiaBaseParcelamento := trim(obControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString);

    DBComboBox21.Items.Clear;
    DBComboBox21.Items.Add('D1 - Dia de vencimento do cliente, se não existir será o dia atual. Mesmo dia nas demais parcelas');
    DBComboBox21.Items.Add('D2 - Dia de vencimento do cliente, se não existir o usuário deve digitar. Mesmo dia nas demais parcelas');
    DBComboBox21.Items.Add('D3 - Dia atual atribuido automaticamente. Mesmo dia nas demais parcelas');
    DBComboBox21.Items.Add('D4 - Dia digitado pelo usuário no momento do parcelamento. Mesmo dia nas demais parcelas');
    DBComboBox21.Items.Add('D5 - 30 dias acrescidos em cada vencimento. Primeiro vencimento dia D+30. Provavelmente terá dias diferentes nas demais parcelas');
    DBComboBox21.Items.Add('N - Não usar para este controle. Usar do config');

    if trim(vDiaBaseParcelamento) <> '' then
    begin
      for I := 0 to DBComboBox21.Items.Count - 1 do
      begin
        if ContainsStr(DBComboBox21.Items[I], vDiaBaseParcelamento + ' - ') then
        begin
          DBComboBox21.ItemIndex := I;
          Break;
        end;
      end;
    end;
//  end;
  DBEdit20Exit(DBEdit20);
end;

procedure TfrmCadControles.MarcarTodosControlesClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obControle._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadControles.montarComponentes;
begin
  {
  obControle.lkTipoPagamento.setDadosDataSet([
    '0', '1','2','3','4','5','10','11','12','13','15','99'], [
    '', '01 - Dinheiro', '02 - Cheque', '03 - Cartão de Crédito', '04 - Cartão de Débito',
    '05 - Crédito Loja', '10 - Vale Alimentação', '11 - Vale Refeição',
    '12 - Vale Presente', '13 - Vale Combustível', '15 - Boleto Bancario', '99 - Outros'], lkFormaPagamento);
  }
  obControle.lkTipoPagamento.setDadosDataSet('tpag', 'descricao',
      obControle.SqlOpen('select s.tpag, (lpad(s.tpag,2,''0'')  || '' - '' || s.descricao) as descricao from sp_nfe_meios_pag s' +
                   ' where s.tpag not in (0)'), lkFormaPagamento);

  obControle.lkBandeira.setDadosDataSet([
    '0', '1','2','3','4','5','6','7','8','9','99'], [
    '', '01 - Visa', '02 - Mastercard', '03 - American Express', '04 - Sorocred',
    '05 - Diners Club', '06 - Elo', '07 - Hipercard', '08 - Aura', '09 - Cabal',
    '99 - Outros'], lkBandeira);

  tefTipos.setDadosDataSet(['0', '1'], ['Não, Nenhum', 'Sim, Cartão/Carteiras Digitais'], edTefTipo);

  tefIdsCartDig.setDadosDataSet('id', 'descricao', obControle.SqlOpen('select t.id, t.descricao from sp_tef_cartdig t'), edTefIdCartDig);

  spedRegistro1601.setDadosDataSet(['0', '1', '2', '3', '4'], ['0 - Não', '1 - Sim (débito)', '2 - Sim (crédito)', '3 - Sim (instantâneo)', '4 - Sim (não instantâneo)'], edRegistro1601);

  lb_cliente_inst_pagto.Caption := obControle.GetNomeClienteAdmCartao(ipPagadora);
  lb_cliente_inst_pagto2.Caption := lb_cliente_inst_pagto.Caption;
  lb_cliente_inst_intermed_transacao.Caption := obControle.GetNomeClienteAdmCartao(ipTransacao);
  lb_cliente_inst_intermed_transacao2.Caption := lb_cliente_inst_intermed_transacao.Caption;
end;

procedure TfrmCadControles.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
	for I := 0 to ComponentCount - 1 do
   	if (Components[I] is TScrollBox) then
    	TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TfrmCadControles.pnTaxasCadastroCancelClick(Sender: TObject);
begin
	obControle.vControleTaxaEcommerce.Cancel;
  TForm(pnTaxasCadastro.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadControles.pnTaxasCadastroEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (DBCheckBoxConsFrete.CanFocus) then
  	DBCheckBoxConsFrete.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditValorDe.CanFocus) then
  	DBEditValorDe.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditValorAte.CanFocus) then
  	DBEditValorAte.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditDe.CanFocus) then
  	DBEditDe.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditAte.CanFocus) then
  	DBEditAte.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBCheckBoxTaxaProduto.CanFocus) then
  	DBCheckBoxTaxaProduto.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditPercProd.CanFocus) then
  	DBEditPercProd.SetFocus
	else if (Self.Enabled) and (Self.Visible) and (DBCheckBoxTaxaFrete.CanFocus) then
  	DBCheckBoxTaxaFrete.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditPercFrete.CanFocus) then
  	DBEditPercFrete.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBCheckBoxTaxaAdicionalPorPedido.CanFocus) then
  	DBCheckBoxTaxaAdicionalPorPedido.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditTaxaPorPedido.CanFocus) then
  	DBEditTaxaPorPedido.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBCheckBoxTaxaAdicionalPorItem.CanFocus) then
  	DBCheckBoxTaxaAdicionalPorItem.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditTaxaPorItem.CanFocus) then
  	DBEditTaxaPorItem.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBCheckBoxTaxaAdicionalPorUnidade.CanFocus) then
  	DBCheckBoxTaxaAdicionalPorUnidade.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditTaxaPorUnidade.CanFocus) then
  	DBEditTaxaPorUnidade.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBCheckBoxConsVlFreteTaxa.CanFocus) then
  	DBCheckBoxConsVlFreteTaxa.SetFocus;
end;

procedure TfrmCadControles.pnTaxasCadastroOKClick(Sender: TObject);
begin
	if not obControle.vControleTaxaEcommerce.Post then
  begin
  	setFocusCampoErro(obControle.vControleTaxaEcommerce.vNomeCampoErro, obControle.vControleTaxaEcommerce.vMensagemErro);
  	exit;
  end;

	TForm(pnTaxasCadastro.Parent).ModalResult := IDOK;
end;

procedure TfrmCadControles.SpeedButton11Click(Sender: TObject);
begin
  if obControle.dataSet.IsEmpty then
  	Exit;

  if (vDadosIni.vEmp.vFinanceiroUnificado)
     and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
   begin
     Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
       'Empresa selecionada: ' +
       IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
       trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
     Exit;
   end;

  obControle.vEmpresaDefControle.abreEmpresaDefControle(obControle.dataSet.FieldByName('codigo_ctrl').AsInteger);

  if not obControle.abreFormDefinirContolesPorEmpresa then
  	Exit;

  if not obControle.definirContolesPorEmpresa then
  	Exit;
end;

procedure TfrmCadControles.SpeedButton12Click(Sender: TObject);
begin
  if obControle.dataSet.IsEmpty then
  	exit;

  if trim(obControle.dataSet.FieldByName('DOCS').AsString) <> 'S2' then
  begin
  	Application.MessageBox('Controle selecionda deve ser do tipo de documentos "S2 - SIM CRÉDITOS"','Atenção', MB_ICONINFORMATION + MB_OK );
  	exit;
  end;

	if (vDadosIni.vEmp.vFinanceiroUnificado)
     and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
   begin
     Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
       'Empresa selecionada: ' +
       IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
       trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
     exit;
   end;

  pnEmpUnif.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  if (pnEmpUnif.Visible) then
  begin
  	EditHwEmpUnif.AsValue := vDadosIni.cod_empresa;
    DBLookupComboBoxEmpUnif.KeyValue := vDadosIni.cod_empresa;
  end
  else
  begin
    EditHwEmpUnif.AsValue := 0;
  	DBLookupComboBoxEmpUnif.KeyValue := 0;
  end;

  EditHwVlProd.AsValue := _LerConfiguracoesRegistroDouble(EditHwVlProd.Name, 90.00);
  EditHwVlFrete.AsValue := _LerConfiguracoesRegistroDouble(EditHwVlFrete.Name, 10.00);
  EditHwQtdeItens.AsValue := _LerConfiguracoesRegistroDouble(EditHwQtdeItens.Name, 3);
  EditHwQtdeUnidade.AsValue := _LerConfiguracoesRegistroDouble(EditHwQtdeUnidade.Name, 3);

  pnTaxaNomeControle2.Caption := IntToStr(obControle.dataSet.FieldByName('codigo_ctrl').AsInteger) +
  	' - ' + trim(obControle.dataSet.FieldByName('nome_ctrl').AsString);
  if not obControle.vControleTaxaEcommerce.abreFormTaxaEcommerce(obControle.dataSet.FieldByName('codigo_ctrl').AsInteger) then
  	exit;
end;

procedure TfrmCadControles.SpeedButton1Click(Sender: TObject);
var
	vNomeEmpresa: string;
  I: Integer;
begin
	if obControle.dataSet.IsEmpty then
  	exit;

  if not vDadosIni.PesqPros('CXG004', 'ALTERAR','','CONTROLES', obControle.dataSet.FieldByName('codigo_ctrl').AsString, obControle.buscas, true) then
  	exit;

  if not obControle.Edit then
  	exit;

  if (vDadosIni.vEmp.vFinanceiroUnificado) then
  	obControle.vEmpresaDefControle.abreEmpresaDefControle(obControle.dataSet.FieldByName('codigo_ctrl').AsInteger);

  inherited;

  for I := 0 to ComponentCount - 1 do
   	if (Components[I] is TScrollBox) then
    	TScrollBox(Components[I]).VertScrollBar.Position := 0;

  PageControl1.ActivePage:=TabSheet1;
  DBEdit1.Enabled := false;
  DBComboBox8.Enabled := false;

  if (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger = StrToInt(vDadosIni.codEmpresa)) then
  begin
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.TabVisible := True;
    TabSheet3.TabVisible := True;
	  TabSheet4.TabVisible := True;
    TabSheet5.TabVisible := True;
    tsControleUnificados.TabVisible := False;
    TabSheet3.Caption := 'Alterando Controle';
  end
  else
  begin
  	PageControl3.ActivePage := tsControleUnificados;
    TabSheet3.TabVisible := False;
    TabSheet3.TabVisible := False;
	  TabSheet4.TabVisible := False;
    TabSheet5.TabVisible := False;
    tsControleUnificados.TabVisible := True;
  end;

  montarComponentes;
  obControle.abreFpProgFid(DBComboBoxClasseProgFid, LabelClasseProgFid);
  obControle.vCodigoControle := obControle.dataSet.FieldByName('CODIGO_CTRL').AsString;

  Label50.Visible := vDadosIni.vEmp.vUsarControlesCliente = 'S';
  DBComboBox16.Visible := vDadosIni.vEmp.vUsarControlesCliente = 'S';
  DBComboBox27.Enabled := IndexText(obControle.fstr('DOCS'), ['S1', 'S2']) >= 0;
  DBComboBox24.Enabled := IndexText(obControle.fstr('DOCS'), ['S1', 'S2']) >= 0;
  DBComboBox22.Enabled := trim(obControle.dataSet.FieldByName('DOCS').AsString) <> 'N';
  DBComboBox6.Enabled := trim(obControle.dataSet.FieldByName('DOCS').AsString) = 'S2';
  Label64.Visible := obControle.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
  Label36.Caption := obControle.dataSet.FieldByName('codigo_ctrl').AsString + ' - '+
                   obControle.dataSet.FieldByName('nome_ctrl').AsString;
  pnControlesTop.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    vNomeEmpresa := trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger));
    ComboBoxCodEmpresa.Clear;
    ComboBoxCodEmpresa.Items.Add(vNomeEmpresa);
    ComboBoxCodEmpresa.ItemIndex := 0;
    lbEmpUnif2.Caption := vNomeEmpresa;
  end;

  Panel10.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    DBComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBComboBox25.CanFocus) then
    DBComboBox25.SetFocus;
end;

procedure TfrmCadControles.SpeedButton23Click(Sender: TObject);
begin
	if not vDadosIni.PesqPros('CXG131', 'ABRIR','','CONTROLES', obControle.dataSet.FieldByName('codigo_ctrl').AsString ,obControle.buscas , true) then
     exit;

  if obControle.dataSet.IsEmpty then
  	exit;

	obControle.abreFormIncluirControleClienteVenda;
end;

procedure TfrmCadControles.SpeedButton24Click(Sender: TObject);
begin
  inherited;
	if not obControle._replicarControles then
    exit;

  SpeedButton1Click(Sender);
end;

procedure TfrmCadControles.SpeedButton25Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG007', 'ACESSAR LIXEIRA','','CONTROLES', '' ,obControle.buscas , true) then
     exit;

  if (vDadosIni.vEmp.vFinanceiroUnificado)
  	and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
  begin
  	Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
    	'Empresa selecionada: ' +
      IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
      trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
	  exit;
  end;

  if not obControle.abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira - [CXG005]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := true;
    SpeedButton8.Visible := true;
    SpeedButton7.Visible := true;
    SpeedButton11.Visible := (vDadosIni.vEmp.vFinanceiroUnificado)
  		and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
    SpeedButton23.Visible := true;
    SpeedButton12.Visible := true;
    SpeedButton24.Visible := true;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente - [CXG003]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    SpeedButton6.Visible := False;
    SpeedButton8.Visible := False;
    SpeedButton7.Visible := False;
    SpeedButton11.Visible := False;
    SpeedButton23.Visible := False;
    SpeedButton12.Visible := False;
    SpeedButton24.Visible := False;
  end;
end;

procedure TfrmCadControles.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  if (vDadosIni.vEmp.vFinanceiroUnificado)
  	and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
  begin
  	Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
    	'Empresa selecionada: ' +
      IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
      trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
	  exit;
  end;

  try
  	inherited;

    if not obControle.Delete then
      Exit;

    vStatusLixeira := obControle.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
    
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obControle.Cancel;
      obControle.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadControles.SpeedButton5Click(Sender: TObject);
begin
  if (vDadosIni.vEmp.vFinanceiroUnificado)
  	and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
  begin
  	Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
    	'Empresa selecionada: ' +
      IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
      trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
	  exit;
  end;

  inherited;

  if not obControle.restauraLixeira then
  	Exit;

  if obControle.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCadControles.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG008', 'ACESSAR CONTROLE DE BALANCO','','CONTROLES', '' ,obControle.buscas , true) then
     exit;

  if (vDadosIni.vEmp.vFinanceiroUnificado)
  	and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
  begin
  	Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
    	'Empresa selecionada: ' +
      IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
      trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
	  exit;
  end;

  if obControle.dataSet.IsEmpty then
     raise Exception.Create('Favor selecionar um Controle.');

  vControleBalanco := 1;
  PageControl1.ActivePage:=TabSheet1;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := True;
  PageControl3.ActivePage := TabSheet5;

  Label36.Caption := obControle.dataSet.FieldByName('codigo_ctrl').AsString + ' - '+
                     obControle.dataSet.FieldByName('nome_ctrl').AsString;

  Panel3.Visible := False;
  Panel10.Visible := True;
  obControle.vCtrlBalanco.abreCtrlBalanco(obControle.dataSet.FieldByName('codigo_ctrl').AsString);
  Label64.Visible := obControle.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
  obControle.vCtrlBalanco.vComitar := True;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadControles.SpeedButton7Click(Sender: TObject);
var
  formulario: TfrmPadrao;
begin
  inherited;
  if obControle.dataSet.FieldByName('CONTR_BANC').value = 'S' then
  begin
   if not vDadosIni.PesqPros('CXG072', 'ALTERAR','','CONTROLES', obControle.dataSet.FieldByName('codigo_ctrl').AsString ,obControle.buscas , true) then
    exit;

   if (vDadosIni.vEmp.vFinanceiroUnificado)
     and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
   begin
     Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
       'Empresa selecionada: ' +
       IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
       trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
     exit;
   end;

   try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 248;
    formulario.Height := 130;
    formulario.Position := poMainFormCenter;
    formulario.Caption := 'Modificando Saldo de controle Bancário';
    Panel7.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowModal;
   finally
    Panel7.Parent := TsSaldoBanco;
    formulario.free;
   end;
  end
  else
   messagedlg('Controle não é Bancário', mtinformation, [mbOK], 0);
end;

procedure TfrmCadControles.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG071', 'VISUALIZAR','','CONTROLES', obControle.dataSet.FieldByName('codigo_ctrl').AsString ,obControle.buscas , true) then
    exit;

  if (vDadosIni.vEmp.vFinanceiroUnificado)
  	and (obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
  begin
  	Application.MessageBox(PChar('Favor selecionar controle da empresa logada antes de continuar. ' + #13 + #13 +
    	'Empresa selecionada: ' +
      IntToStr(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger) + ' ' +
      trim(obControle.retornaIdentificacaoEmp(obControle.dataSet.FieldByName('CODIGO_EMP').AsInteger))),'Atenção', MB_ICONINFORMATION + MB_OK );
	  exit;
  end;

  vDadosIni.abreStatusProcessamento('', 'Abrindo Rastro de Saldo do Controle Selecionado...');
  obControle.VerificarSaldoCtrl(DtSaldoCtrl);
  Panel4.Caption:='VISUALIZAÇÃO DO CONTROLE: '+obControle.dataSet.FieldByName('nome_ctrl').AsString;
  PageControl1.ActivePage:=TsSaldoCTrl;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadControles.TabSheet4Show(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox11.CanFocus) then
  	DBComboBox11.SetFocus;
end;

end.
