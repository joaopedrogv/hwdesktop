unit uFormPag2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Spin, DBCtrls, Mask, ComCtrls,
  uEditMoeda, Grids, DBGrids, ExtCtrls, uClasseFP, QRCtrls, QuickRpt, uEditHw,
  Menus, DBClient, IBDatabase;

type
  TfrmFormPag2 = class(TfrmPadrao)
    Panel1: TPanel;
    grupoControle: TGroupBox;
    gridControle: TDBGrid;
    Panel2: TPanel;
    PageControl1: TPageControl;
    tabDinheiro: TTabSheet;
    tabCheque: TTabSheet;
    tabCreditos: TTabSheet;
    tabRecibos: TTabSheet;
    GroupBox1: TGroupBox;
    gridRecibos: TDBGrid;
    Panel5: TPanel;
    btQuitar: TSpeedButton;
    btSomar: TSpeedButton;
    btValeCredito: TSpeedButton;
    tabInicial: TTabSheet;
    Panel4: TPanel;
    Panel3: TPanel;
    tabLancamentos: TTabSheet;
    tabDadosRecibos: TTabSheet;
    pnBotoes: TPanel;
    ckContabil: TCheckBox;
    Panel7: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    edReciboValorRecibo: TEditMoeda;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    tabPromissoria: TTabSheet;
    ScrollBox2: TScrollBox;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel3: TQRLabel;
    tsVale: TTabSheet;
    pnVale: TPanel;
    EditHw5: TEditHw;
    DBLookupComboBox2: TDBLookupComboBox;
    tsContasBacarias: TTabSheet;
    pnConsultaContasBancarias: TPanel;
    Panel23: TPanel;
    DBGrid3: TDBGrid;
    Panel24: TPanel;
    SpeedButton32: TSpeedButton;
    SpeedButton34: TSpeedButton;
    pnCreditos: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    label66: TLabel;
    edcreditoQtdeParcelas: TSpinEdit;
    GroupBox3: TGroupBox;
    edcreditoCondicaoPagamento: TComboBox;
    edCreditoNomeTerceiro: TEdit;
    edCreditoHistorico: TEdit;
    edCreditoValorCredito: TEditMoeda;
    edCreditoJurosUtil: TEditMoeda;
    edCreditoCodigoTerceiro: TEditMoeda;
    ckCreditoImprimirCarne: TCheckBox;
    btGerar: TBitBtn;
    Label33: TLabel;
    Label46: TLabel;
    edcreditoNumAutoCartao: TEdit;
    edCreditoNSUTransacao: TEdit;
    Panel8: TPanel;
    grupoValor: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edValorVenda: TEditMoeda;
    edValorInformado: TEditMoeda;
    edValorQueFaltaInformar: TEditMoeda;
    edValorTroco: TEditMoeda;
    grupoDisti: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edTotalCarteira: TEditMoeda;
    edTotalCheque: TEditMoeda;
    edTotalCreditos: TEditMoeda;
    edTotalRecibos: TEditMoeda;
    Label47: TLabel;
    edcreditoCodTermAdmCartao: TDBLookupComboBox;
    imgInformation: TImage;
    tsPesquisa: TTabSheet;
    pnPesquisa: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label28: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    SpeedButton4: TSpeedButton;
    BitBtn9: TBitBtn;
    lkedcreditoCondicaoPagamento: TDBLookupComboBox;
    gridLancamentos: TDBGrid;
    Panel9: TPanel;
    btAlterar: TBitBtn;
    btApagar: TBitBtn;
    btCarne: TBitBtn;
    Panel10: TPanel;
    edReciboNumeroRecibo: TEdit;
    Label27: TLabel;
    BitBtn26: TBitBtn;
    Panel11: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel12: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel31: TQRLabel;
    tsFormasEC: TTabSheet;
    GroupBox5: TGroupBox;
    gridEcommerce: TDBGrid;
    Panel14: TPanel;
    btQuitarEC: TSpeedButton;
    btSomarEC: TSpeedButton;
    btSalvar: TBitBtn;
    btCancela: TBitBtn;
    btRecibo: TSpeedButton;
    btEcommerce: TSpeedButton;
    Panel13: TPanel;
    Label29: TLabel;
    pnDinheiro: TPanel;
    Label5: TLabel;
    edCarteiraValorCarteira: TEditMoeda;
    Label6: TLabel;
    edCarteiraHistorico: TEdit;
    pnBotoesN: TPanel;
    btSalvarN: TBitBtn;
    btCancelN: TBitBtn;
    pnCheque: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    spbContasBancarias: TSpeedButton;
    edChequeAgencia: TEdit;
    edChequeConta: TEdit;
    edChequeHistorico: TEdit;
    edChequeNomeTerceiro: TEdit;
    edChequeValorCheque: TEditMoeda;
    edChequeDataVencimento: TMaskEdit;
    edChequeNumeroBanco12: TEditMoeda;
    edChequeCodigoTerceiro: TEditMoeda;
    DBLookupComboBox1: TDBLookupComboBox;
    edChequeNumeroCheque: TEdit;
    edChequeNumBanco: TEdit;
    edChequeNomeBanco: TEdit;
    pnBotoesS1: TPanel;
    btSalvarS1: TBitBtn;
    btCancelS1: TBitBtn;
    Panel6: TPanel;
    GroupBox4: TGroupBox;
    ListBox1: TListBox;
    pnBotoesS2: TPanel;
    btSalvarS2: TBitBtn;
    btCancelS2: TBitBtn;
    BitBtn33: TBitBtn;
    CheckBox_LancarTaxa: TCheckBox;
    Panel15: TPanel;
    Label83: TLabel;
    tsValesCupom: TTabSheet;
    pnValeCupom: TPanel;
    GroupBoxResgatarVale: TGroupBox;
    DBGridResgatarVale: TDBGrid;
    PanelButtonResgatarVale: TPanel;
    BitBtnVoltarResgatarVale: TBitBtn;
    BitBtnOKResgatarVale: TBitBtn;
    Panel16: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Panel79: TPanel;
    Label373: TLabel;
    RadioGroupVales: TRadioGroup;
    lbBandCartao: TLabel;
    edcreditoCodBandeiraAdmCartao: TDBLookupComboBox;
    btTEF: TBitBtn;
    pnObsIdEcommerce: TPanel;
    pnObsFreteEcommerce: TPanel;
    pnObsIntermediador: TPanel;
    pnInfCliente: TPanel;
    pnLocalVenda: TPanel;
    bt_outras_nf: TSpeedButton;
    popActions: TPopupMenu;
    SaldoprogramaFidelidade1: TMenuItem;
    Configuraes1: TMenuItem;
    N1: TMenuItem;
    UsartransalaoeletrnicaAvulsa1: TMenuItem;
    SpeedButton55: TSpeedButton;
    GroupBoxRecibos: TGroupBox;
    ScrollBoxRecibos: TScrollBox;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    procedure gridRecibosColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure gridRecibosDblClick(Sender: TObject);
    procedure gridRecibosCellClick(Column: TColumn);
    procedure SpeedButton55Click(Sender: TObject);
    procedure UsartransalaoeletrnicaAvulsa1Click(Sender: TObject);
    procedure bt_outras_nfClick(Sender: TObject);
    procedure btTEFClick(Sender: TObject);
    procedure SaldoprogramaFidelidade1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure DBGridResgatarValeCellClick(Column: TColumn);
    procedure DBGridResgatarValeDblClick(Sender: TObject);
    procedure BitBtnOKResgatarValeClick(Sender: TObject);
    procedure DBGridResgatarValeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGridResgatarValeDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure RadioGroupValesClick(Sender: TObject);
    procedure BitBtnVoltarResgatarValeClick(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure CheckBox_LancarTaxaClick(Sender: TObject);
    procedure pnCreditosEnter(Sender: TObject);
    procedure pnChequeEnter(Sender: TObject);
    procedure pnDinheiroEnter(Sender: TObject);
    procedure btSalvarS2Click(Sender: TObject);
    procedure btCancelS2Click(Sender: TObject);
    procedure btCancelS1Click(Sender: TObject);
    procedure btSalvarS1Click(Sender: TObject);
    procedure btCancelNClick(Sender: TObject);
    procedure btSalvarNClick(Sender: TObject);
    procedure btQuitarECClick(Sender: TObject);
    procedure btSomarECClick(Sender: TObject);
    procedure gridEcommerceDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridEcommerceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridEcommerceTitleClick(Column: TColumn);
    procedure btEcommerceClick(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure gridRecibosTitleClick(Column: TColumn);
    procedure gridRecibosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edChequeNumBancoExit(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure spbContasBancariasClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure EditHw5Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btGerarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRep1Preview(Sender: TObject);
    procedure btCarneClick(Sender: TObject);
    procedure edChequeCodigoTerceiroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCreditoCodigoTerceiroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCarteiraValorCarteiraEnter(Sender: TObject);
    procedure btValeCreditoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure edChequeNumeroBanco12Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edReciboNumeroReciboExit(Sender: TObject);
    procedure edReciboNumeroReciboEnter(Sender: TObject);
    procedure edReciboNumeroReciboChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btReciboClick(Sender: TObject);
    procedure gridRecibosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btQuitarClick(Sender: TObject);
    procedure btSomarClick(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure edChequeCodigoTerceiroExit(Sender: TObject);
    procedure edCreditoCodigoTerceiroExit(Sender: TObject);
    procedure PageControl1Exit(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure grupoControleExit(Sender: TObject);
    procedure grupoControleEnter(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure ckContabilClick(Sender: TObject);
    procedure gridControleDblClick(Sender: TObject);
    procedure gridControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure formDinheiroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure formChequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure formCreditosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    chamarTEF: Boolean;

    procedure Form_DesativarBotoesPrincipais;
    procedure Form_ReativarBotoesPrincipais;
  public
    { Public declarations }
    procedure Form_PreparaTela;
  end;

var
  frmFormPag2: TfrmFormPag2;
  obFormPag2: TformPag2;
  vLancarTarifa: boolean;

  PrimeiraPesquisa: Boolean;
  TemColunasComPosicaoAlteradas: Boolean;
  vConfigColuna : boolean;
  campoPesquisa: string;
  cdsColunas: TClientDataSet;

  cdsGrid: TClientDataSet;
  GridCfg: TDBGrid;
  ListGridsAndDataSets: TStrings;
  ListPositions: TStrings;

  trans: TIBTransaction;
  vTabela, vCampoPadrao: string;
  fReset, vCtrlClick, vShiftClick: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt,vAlterarNomeDtSet, usuario: string;
  vCamposPadraoRegistro: Boolean;

implementation

uses uDtmFormPag, uDtmAtivo, uDadosIni, DB, uDataSet_OOP, StrUtils, hw_utils, 
  config_sistema_class, Clipbrd;

{$R *.dfm}

procedure TfrmFormPag2.btCarneClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('FPG006','ABRIR','','FORMPAGAMENTO','',obFormPag2.buscas,True) then
    Exit;
  if Application.MessageBox('Impressora Carnê?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    if Application.MessageBox('Carnê em forma de boletas?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      obFormPag2.GeraBoleta(obFormPag2.dataSet.RecordCount)
    else
      obFormPag2.imprimeCarne;
  end
  else if Application.MessageBox('Impressora Promissória?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
    obFormPag2.imprimePromissoria;
end;

procedure TfrmFormPag2.btEcommerceClick(Sender: TObject);
begin
  inherited;
  if obFormPag2.valorVenda <= 0 then
  begin
    Application.MessageBox('Valor para receber é igual a Zero. Apenas clique em Confirmar', 'Atenção', 0 + 64);
    Exit;
  end;
  if not vDadosIni.PesqPros('FPG041','ABRIR','','FORMPAGAMENTO','',obFormPag2.buscas,True) then
    Exit;

  obFormPag2.habilitaControleEcommerce;

  Form_DesativarBotoesPrincipais;
end;

procedure TfrmFormPag2.BitBtn26Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('Impressão de recibo', 'Processando informações...');
    if obFormPag2.vRecibo.dataSet.FieldByName('NRECIBO').AsInteger > 0 then
    begin
      vDadosIni.vPesquisa := 'IMPRIMIRRECIBO|' +  IntToStr(obFormPag2.vRecibo.dataSet.FieldByName('NRECIBO').AsInteger) + '|';
      if obFormPag2._mdiAberto('TFrmCadRecibo', 'O modulo do Recibo se encontra aberto') then
      	obFormPag2.abreFormRecibo;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmFormPag2.BitBtn2Click(Sender: TObject);
begin
  inherited;
  TForm(pnVale.Parent).ModalResult := IDOK;
end;

procedure TfrmFormPag2.BitBtn33Click(Sender: TObject);
var
  id: string;
begin
  try
    id := obFormPag2.SqlOpen('select idcadinttran from INTERMEDIADOR_CONTROLE_EC' +
                             ' where LOCAL_VENDA = %s and INTERMEDIADOR = %s and METODO_PAG_ID = %d',
                             [obFormPag2.vEcommerce.fstrq('LOCAL_VENDA'),
                              obFormPag2.vEcommerce.fstrq('INTERMEDIADOR'),
                              obFormPag2.vEcommerce.fint('METODO_PAG_ID')]
                             ).FieldByName('idcadinttran').AsString;
  except
  end;

   vDadosIni.vPesquisaLocalVenda := obFormPag2.vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString;
   vDadosIni.vPesquisaInterPag := obFormPag2.vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString;
   vDadosIni.vPesquisaMetodoId := obFormPag2.vEcommerce.dataSet.FieldByName('METODO_PAG_ID').AsInteger;
   obFormPag2.vVincIntermPag._cadVincIntermPag(1, id);
end;

procedure TfrmFormPag2.BitBtn3Click(Sender: TObject);
begin
  inherited;
 TForm(pnVale.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmFormPag2.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if obFormPag2.confirmaFormaPagamento then
    ModalResult := mrOk;
end;

procedure TfrmFormPag2.BitBtn5Click(Sender: TObject);
const
  NAO_EXCLUI: array[0..7] of string = ('B', 'V', 'C', 'P', 'L', 'F', 'R', 'I');
begin
  inherited;

  obFormPag2.dataSet.First;
  while not obFormPag2.dataSet.Eof do
  begin
    if obFormPag2.fmatchText('PERMITIR_EXCLUIR', NAO_EXCLUI ) then
    begin
      Application.MessageBox('Existe forma(s) de pagamento gerada(s) que não é permitido alterar ou excluir', 'Atenção', 0 + 64);
      Exit;
    end;

    obFormPag2.dataSet.Next;
  end;

  Form_ReativarBotoesPrincipais;

  obFormPag2.vRecibo.dataSet.CancelUpdates;
  if obFormPag2.vRecibo.vHistRec.dataSet.Active then
    obFormPag2.vRecibo.vHistRec.dataSet.CancelUpdates;
  if obFormPag2.vLancCxl.dataSet.Active then
    obFormPag2.vLancCxl.dataSet.CancelUpdates;
  if obFormPag2.numeroVendaEcommerce > 0 then
    obFormPag2.vEcommerce.selecionaFormasEcommerce(obFormPag2.numeroVenda, obFormPag2.tipoVenda);
  obFormPag2.Cancel;
  obFormPag2.CancelUpdates;
  obFormPag2.RollBackTransacao;
  obFormPag2.cancelar;
end;

procedure TfrmFormPag2.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('FPG021', 'SAIR',' VENDA '+
  obFormPag2.tipoVenda+':'+vDadosIni.StrZero(obFormPag2.numeroVenda,6), 'FORMPAGAMENTO', '', obFormPag2.buscas, True) then
   Exit;
  obFormPag2.CancelUpdates;
  ModalResult := mrCancel;
end;

procedure TfrmFormPag2.BitBtn7Click(Sender: TObject);
begin
  MaskEdit1Change(Sender);
  TForm(pnPesquisa.Parent).ModalResult := IDOK;
end;

procedure TfrmFormPag2.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnPesquisa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmFormPag2.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if obFormPag2.usarTransacaAvulsaPOSVirtual then
  begin
    btCancela.Click;
    if edValorQueFaltaInformar.Valor = 0 then
    	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
	      BitBtn4.SetFocus;
  end;
end;

procedure TfrmFormPag2.BitBtnOKResgatarValeClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not obFormPag2.utilizarValePrgFid then
      exit;
    TForm(pnValeCupom.Parent).ModalResult := IDOK;  
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFormPag2.BitBtnVoltarResgatarValeClick(Sender: TObject);
begin
  TForm(pnValeCupom.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmFormPag2.btAlterarClick(Sender: TObject);
begin
  inherited;
  obFormPag2.alteracao := true;
  obFormPag2.habilitaControlesFormaPagamento(False);
end;

procedure TfrmFormPag2.btApagarClick(Sender: TObject);
begin
  inherited;
  obFormPag2.Delete;
end;

procedure TfrmFormPag2.btCancelaClick(Sender: TObject);
begin
  inherited;
  obFormPag2.cancelar;

  Form_ReativarBotoesPrincipais;
end;

procedure TfrmFormPag2.btCancelNClick(Sender: TObject);
begin
  obFormPag2.cancelar;

  Form_ReativarBotoesPrincipais;

  TForm(pnDinheiro.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmFormPag2.btCancelS1Click(Sender: TObject);
begin
  obFormPag2.cancelar;

  Form_ReativarBotoesPrincipais;

  TForm(pnCheque.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmFormPag2.btCancelS2Click(Sender: TObject);
begin
  obFormPag2.cancelar;

  Form_ReativarBotoesPrincipais;

  TForm(pnCreditos.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmFormPag2.btGerarClick(Sender: TObject);
begin
  inherited;
  if edCreditoValorCredito.Valor <= 0 then
  begin
    Application.MessageBox('Valor zerado!', 'Atenção', 0 + 64);
    exit;
  end;

  if (Pos('VALE FUNC', obFormPag2.vControle.dataSet.FieldByName('NOME_CTRL').AsString) > 0) or
    (Pos('VALE COLAB', obFormPag2.vControle.dataSet.FieldByName('NOME_CTRL').AsString) > 0) then
  begin
    EditHw5.AsValue := 0;
    obFormPag2._abreValeFuncionario;

    if not obFormPag2.vFunc._verificarFuncionarios(EditHw5.AsInteger) then
    begin
      Application.MessageBox('Funcionário não encontrado! ', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
        DBLookupComboBox2.SetFocus;
      exit;
    end;
  end;

  obFormPag2.montarParcelamento(pnBotoesS2.Visible);
  if (Self.Enabled) and (Self.Visible) and (ListBox1.CanFocus) then
    ListBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (btSalvar.CanFocus) then
    btSalvar.SetFocus;
end;

procedure TfrmFormPag2.btGerarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmFormPag2.btQuitarClick(Sender: TObject);
begin
  inherited;
  if btQuitar.Enabled then
    if obFormPag2.receberRecibo then
    begin
      btQuitar.Enabled := true;

      Form_ReativarBotoesPrincipais;
    end;
end;

procedure TfrmFormPag2.btQuitarECClick(Sender: TObject);
begin
   inherited;
   vDadosIni.vPesquisaLocalVenda := obFormPag2.vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString;
   vDadosIni.vPesquisaInterPag := obFormPag2.vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString;
   vDadosIni.vPesquisaMetodoId := obFormPag2.vEcommerce.dataSet.FieldByName('METODO_PAG_ID').AsInteger;
	 try
     obFormPag2.vControle.selecionaControlesFormPag(''); // Habilitar todos controles
     if btQuitarEC.Enabled then
       if obFormPag2.utilizarCreditoEC(orNormal, CheckBox_LancarTaxa.Checked) then
       begin
         btQuitarEC.Enabled := true;

         Form_ReativarBotoesPrincipais;

        if edValorQueFaltaInformar.Valor = 0 then
          if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
            BitBtn4.SetFocus;
       end;
   finally
      obFormPag2._selecionaControles; // Habilitar apenas controles definidos para o cliente
   end;
end;

procedure TfrmFormPag2.btReciboClick(Sender: TObject);
begin
  inherited;
  if obFormPag2.valorVenda <= 0 then
  begin
    Application.MessageBox('Valor para receber é igual a Zero. Apenas clique em Confirmar', 'Atenção', 0 + 64);
    Exit;
  end;
  if not vDadosIni.PesqPros('FPG006','ABRIR','','FORMPAGAMENTO','',obFormPag2.buscas,True) then
    Exit;

  obFormPag2.habilitaControleRecibos;

  if PrimeiraPesquisa then
  begin
    PrimeiraPesquisa := False;
    vDadosIni.configurarGridPeloConfigColunas(gridRecibos, GridCfg, cdsGrid, cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  end;

  Form_DesativarBotoesPrincipais;
end;

procedure TfrmFormPag2.btSalvarClick(Sender: TObject);
begin
  inherited;
  if (PageControl1.ActivePage <> tabInicial) and (PageControl1.ActivePage <> tabLancamentos) then
    if obFormPag2.salvarDadosInformados then
    begin

      Form_ReativarBotoesPrincipais;
    end;

  if edValorQueFaltaInformar.Valor = 0 then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
	    BitBtn4.SetFocus;
end;

procedure TfrmFormPag2.btSalvarNClick(Sender: TObject);
begin
  if obFormPag2.salvarDadosInformados(obFormPag2.numeroVendaEcommerce > 0) then
  begin

    Form_ReativarBotoesPrincipais;

    TForm(pnDinheiro.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmFormPag2.btSalvarS1Click(Sender: TObject);
begin
  if obFormPag2.salvarDadosInformados(obFormPag2.numeroVendaEcommerce > 0) then
  begin

    Form_ReativarBotoesPrincipais;

    TForm(pnCheque.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmFormPag2.btSalvarS2Click(Sender: TObject);
begin
  if obFormPag2.salvarDadosInformados(obFormPag2.numeroVendaEcommerce > 0) then
  begin

    Form_ReativarBotoesPrincipais;

    TForm(pnCreditos.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmFormPag2.btSomarClick(Sender: TObject);
begin
  inherited;
  Label27.Caption := Format('%m', [obFormPag2.vRecibo.somatorioRecibos]);
end;

procedure TfrmFormPag2.btSomarECClick(Sender: TObject);
begin
  inherited;
  Label29.Caption := Format('%m', [obFormPag2.vEcommerce.somatorioEcommerce(obFormPag2.numeroVenda, obFormPag2.tipoVenda)]);
end;

procedure TfrmFormPag2.btTEFClick(Sender: TObject);
begin
  inherited;
  obFormPag2.vControle.filterStr('tef_tipo = 1');

  if obFormPag2.vControle.dataSet.RecordCount = 0 then
  begin
    ShowAtencao('Nenhum controle configurado para transação eletrônica');
    obFormPag2.vControle.filterClear;
    Exit;
  end;

  Form_DesativarBotoesPrincipais;

  chamarTEF := True;
  if (Self.Enabled) and (Self.Visible) and (gridControle.CanFocus) then
	  gridControle.SetFocus;
end;

procedure TfrmFormPag2.btValeCreditoClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmFormPag2.bt_outras_nfClick(Sender: TObject);
begin
  inherited;
  popActions.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmFormPag2.CheckBox1Click(Sender: TObject);
begin
  inherited;
  obFormPag2.habilitaControleRecibos;
end;

procedure TfrmFormPag2.CheckBox_LancarTaxaClick(Sender: TObject);
begin
  if not vLancarTarifa then
    exit;
    
  if not vdadosini.PesqPros('FPG047', 'LANCAR', 'LANCAR DIF TARIFA INTERM PAG', '', '', obFormPag2.buscas, true) then
  begin
    vLancarTarifa := false;
    CheckBox_LancarTaxa.Checked := not CheckBox_LancarTaxa.Checked;
    vLancarTarifa := true;
    exit;
  end;

  _GravaConfiguracoesBoolean(CheckBox_LancarTaxa.Name, CheckBox_LancarTaxa.Checked);
end;

procedure TfrmFormPag2.ckContabilClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (gridControle.CanFocus) then  
    gridControle.SetFocus;
end;

procedure TfrmFormPag2.ComboBox1Enter(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        exit;
      end;
    end;
  end;
end;

procedure TfrmFormPag2.ComboBox1Exit(Sender: TObject);
begin
  if uppercase(ComboBox1.Text) <> 'TODOS' then
    ComboBox1.Text := ComboBox1.Items[ComboBox1.ItemIndex]
  else
    ComboBox1.Text := 'Todos';
end;

procedure TfrmFormPag2.Configuraes1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('pos_virtual_%', obFormPag2.buscas);
  obFormPag2.HandleBotaoTefAtivo;
  btTEF.Visible := obFormPag2.botaoTefAtivo;
  UsartransalaoeletrnicaAvulsa1.Visible := btTEF.Visible;
end;

procedure TfrmFormPag2.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas, gridRecibos, GridCfg, cdsGrid, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
end;

procedure TfrmFormPag2.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := gridRecibos.DataSource.DataSet.FieldByName(gridRecibos.Columns[gridRecibos.SelectedIndex].FieldName).AsString;
end;

procedure TfrmFormPag2.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    SpeedButton34.Click
  else if Key = VK_RETURN then
    SpeedButton32.Click;
end;

procedure TfrmFormPag2.DBGridResgatarValeCellClick(Column: TColumn);
begin
  inherited;
  if (Column.FieldName = 'SEL') then
	  obFormPag2.vValeCupomPrgFid._marcaDesmarcaLinha;
end;

procedure TfrmFormPag2.DBGridResgatarValeDblClick(Sender: TObject);
begin
  inherited;
  obFormPag2.vValeCupomPrgFid._marcaDesmarcaLinha;
end;

procedure TfrmFormPag2.DBGridResgatarValeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (Trim(Column.Field.Dataset.FieldbyName('VALIDADO').AsString) <> '') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clBlue
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  
	if gridRecibos.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
     if Rect.Top = TStringGrid(gridRecibos).CellRect(0,TStringGrid(gridRecibos).Row).Top then
     begin
       gridRecibos.Canvas.FillRect(Rect);
       gridRecibos.Canvas.Brush.Color := TColor($F0CAA6);
       gridRecibos.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
	  if gdSelected in State then //Cor da célula selecionada
     begin
       gridRecibos.Canvas.Brush.Color := TColor($F0CAA6);
       gridRecibos.Canvas.FillRect(Rect);
       gridRecibos.DefaultDrawDataCell(Rect,Column.Field,State)
     end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmFormPag2.DBGridResgatarValeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    obFormPag2.vValeCupomPrgFid._marcaDesmarcaLinha;
end;

procedure TfrmFormPag2.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
//  edChequeNumeroBanco.Valor := DBLookupComboBox1.KeyValue;
end;

procedure TfrmFormPag2.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
 EditHw5.AsValue := DBLookupComboBox2.KeyValue;

// if not obFormPag2.vFunc._verificarFuncionarios(EditHw5.AsInteger) then
// Application.MessageBox('Funcionário não encontrado! ', 'Atenção', 0 + 64);

end;

procedure TfrmFormPag2.edCarteiraValorCarteiraEnter(Sender: TObject);
begin
  inherited;
  edCarteiraValorCarteira.SelectAll;
end;

procedure TfrmFormPag2.edChequeCodigoTerceiroExit(Sender: TObject);
begin
  inherited;
  obFormPag2.verificaTerceiro;
end;

procedure TfrmFormPag2.edChequeCodigoTerceiroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa:=vDadosIni.pesquisaRapida('CLIENTES');
    if Trim(vDadosIni.vPesquisa) <> '' then
      edChequeCodigoTerceiro.Valor := StrToInt(Trim(vDadosIni.vPesquisa));
  end;
end;

procedure TfrmFormPag2.edChequeNumBancoExit(Sender: TObject);
begin
  inherited;
  edChequeNumBanco.Text := vDadosIni.StrZero(Trim(edChequeNumBanco.Text), 3);
  if Trim(edChequeNumBanco.Text) = '001' then
    edChequeNomeBanco.Text := 'BANCO DO BRASIL'
  else if Trim(edChequeNumBanco.Text) = '003' then
    edChequeNomeBanco.Text := 'BANCO DA AMAZONIA'
  else if Trim(edChequeNumBanco.Text) = '004' then
    edChequeNomeBanco.Text := 'BANCO DO NORDESTE DO BRASIL'
  else if Trim(edChequeNumBanco.Text) = '021' then
    edChequeNomeBanco.Text := 'BANCO DO ESTADO DO ESPIRITO SANTO'
  else if Trim(edChequeNumBanco.Text) = '024' then
    edChequeNomeBanco.Text := 'BANCO DO ESTADO DE PERNAMBUCO'
  else if Trim(edChequeNumBanco.Text) = '025' then
    edChequeNomeBanco.Text := 'BANCO ALFA S/A'
  else if Trim(edChequeNumBanco.Text) = '027' then
    edChequeNomeBanco.Text := 'BANCO DO ESTADO DE SANTA CATARINA'
  else if Trim(edChequeNumBanco.Text) = '033' then
    edChequeNomeBanco.Text := 'BANCO SANTANDER (BRASIL)'
  else if Trim(edChequeNumBanco.Text) = '041' then
    edChequeNomeBanco.Text := 'BANCO DO ESTADO DO RIO GRANDE DO SUL'
  else if Trim(edChequeNumBanco.Text) = '044' then
    edChequeNomeBanco.Text := 'BANCO BVA'
  else if Trim(edChequeNumBanco.Text) = '047' then
    edChequeNomeBanco.Text := 'BANCO DO ESTADO DE SERGIPE'
  else if Trim(edChequeNumBanco.Text) = '069' then
    edChequeNomeBanco.Text := 'BPN BRASIL BANCO MÚTIPLO'
  else if Trim(edChequeNumBanco.Text) = '070' then
    edChequeNomeBanco.Text := 'BANCO DE BRASILIA'
  else if Trim(edChequeNumBanco.Text) = '074' then
    edChequeNomeBanco.Text := 'BANCO J. SAFRA'
  else if Trim(edChequeNumBanco.Text) = '104' then
    edChequeNomeBanco.Text := 'CAIXA ECONOMICA FEDERAL'
  else if Trim(edChequeNumBanco.Text) = '107' then
    edChequeNomeBanco.Text := 'BANCO BBM'
  else if Trim(edChequeNumBanco.Text) = '151' then
    edChequeNomeBanco.Text := 'NOSSA CAIXA - NOSSO BANCO'
  else if Trim(edChequeNumBanco.Text) = '224' then
    edChequeNomeBanco.Text := 'BANCO FIBRA'
  else if Trim(edChequeNumBanco.Text) = '237' then
    edChequeNomeBanco.Text := 'BANCO BRADESCO'
  else if Trim(edChequeNumBanco.Text) = '246' then
    edChequeNomeBanco.Text := 'BANCO ABC BRASIL'
  else if Trim(edChequeNumBanco.Text) = '263' then
    edChequeNomeBanco.Text := 'BANCO CACIQUE'
  else if Trim(edChequeNumBanco.Text) = '266' then
    edChequeNomeBanco.Text := 'BANCO CEDULA'
  else if Trim(edChequeNumBanco.Text) = '320' then
    edChequeNomeBanco.Text := 'BANCO INDL E COML S/A - BICBANCO'
  else if Trim(edChequeNumBanco.Text) = '341' then
    edChequeNomeBanco.Text := 'BANCO ITAU'
  else if Trim(edChequeNumBanco.Text) = '346' then
    edChequeNomeBanco.Text := 'BFB'
  else if Trim(edChequeNumBanco.Text) = '347' then
    edChequeNomeBanco.Text := 'BANCO SUDAMERIS BRASIL'
  else if Trim(edChequeNumBanco.Text) = '353' then
    edChequeNomeBanco.Text := 'BANCO SANTANDER BRASIL'
  else if Trim(edChequeNumBanco.Text) = '356' then
    edChequeNomeBanco.Text := 'BANCO ABN AMRO'
  else if Trim(edChequeNumBanco.Text) = '389' then
    edChequeNomeBanco.Text := 'BANCO MERCANTIL DO BRASIL'
  else if Trim(edChequeNumBanco.Text) = '394' then
    edChequeNomeBanco.Text := 'BANCO BMC'
  else if Trim(edChequeNumBanco.Text) = '399' then
    edChequeNomeBanco.Text := 'HSBC BANK BRASIL'
  else if Trim(edChequeNumBanco.Text) = '409' then
    edChequeNomeBanco.Text := 'BANCO UNIBANCO'
  else if Trim(edChequeNumBanco.Text) = '422' then
    edChequeNomeBanco.Text := 'BANCO SAFRA'
  else if Trim(edChequeNumBanco.Text) = '453' then
    edChequeNomeBanco.Text := 'BANCO RURAL'
  else if Trim(edChequeNumBanco.Text) = '479' then
    edChequeNomeBanco.Text := 'BANKBOSTON BCO MULTIPLO'
  else if Trim(edChequeNumBanco.Text) = '600' then
    edChequeNomeBanco.Text := 'BANCO LUSO BRASILEIRO'
  else if Trim(edChequeNumBanco.Text) = '604' then
    edChequeNomeBanco.Text := 'BANCO INDUSTRIAL DO BRASIL'
  else if Trim(edChequeNumBanco.Text) = '611' then
    edChequeNomeBanco.Text := 'BANCO PAULISTA'
  else if Trim(edChequeNumBanco.Text) = '623' then
    edChequeNomeBanco.Text := 'BANCO PANAMERICANO'
  else if Trim(edChequeNumBanco.Text) = '630' then
    edChequeNomeBanco.Text := 'BANCO INTERCAP'
  else if Trim(edChequeNumBanco.Text) = '633' then
    edChequeNomeBanco.Text := 'BANCO RENDIMENTO'
  else if Trim(edChequeNumBanco.Text) = '634' then
    edChequeNomeBanco.Text := 'BANCO TRIBANCO'
  else if Trim(edChequeNumBanco.Text) = '637' then
    edChequeNomeBanco.Text := 'BANCO SOFISA'
  else if Trim(edChequeNumBanco.Text) = '643' then
    edChequeNomeBanco.Text := 'BANCO PINE'
  else if Trim(edChequeNumBanco.Text) = '653' then
    edChequeNomeBanco.Text := 'BANCO INDUSVAL'
  else if Trim(edChequeNumBanco.Text) = '655' then
    edChequeNomeBanco.Text := 'BANCO VOTORANTIM'
  else if Trim(edChequeNumBanco.Text) = '707' then
    edChequeNomeBanco.Text := 'BANCO DAYCOVAL'
  else if Trim(edChequeNumBanco.Text) = '719' then
    edChequeNomeBanco.Text := 'BANCO BANIF PRIMUS'
  else if Trim(edChequeNumBanco.Text) = '721' then
    edChequeNomeBanco.Text := 'BANCO CREDIBEL'
  else if Trim(edChequeNumBanco.Text) = '734' then
    edChequeNomeBanco.Text := 'BANCO GERDAU'
  else if Trim(edChequeNumBanco.Text) = '738' then
    edChequeNomeBanco.Text := 'BANCO MORADA'
  else if Trim(edChequeNumBanco.Text) = '739' then
    edChequeNomeBanco.Text := 'BANCO GALVAO DE NEGOCIOS'
  else if Trim(edChequeNumBanco.Text) = '741' then
    edChequeNomeBanco.Text := 'BANCO RIBEIRAO PRETO'
  else if Trim(edChequeNumBanco.Text) = '745' then
    edChequeNomeBanco.Text := 'BANCO CITIBANK'
  else if Trim(edChequeNumBanco.Text) = '748' then
    edChequeNomeBanco.Text := 'BANCO COOPERATIVO SICREDI'
  else if Trim(edChequeNumBanco.Text) = '749' then
    edChequeNomeBanco.Text := 'BR BANCO MERCANTIL'
  else if Trim(edChequeNumBanco.Text) = '753' then
    edChequeNomeBanco.Text := 'NBC BANK BRASIL - BANCO MULTIPLO'
  else if Trim(edChequeNumBanco.Text) = '756' then
    edChequeNomeBanco.Text := 'BANCO COOPERATIVO DO BRASIL';  
end;

procedure TfrmFormPag2.edChequeNumeroBanco12Exit(Sender: TObject);
begin
  inherited;
//  DBLookupComboBox1.KeyValue := trunc(edChequeNumeroBanco.Valor);
end;

procedure TfrmFormPag2.edCreditoCodigoTerceiroExit(Sender: TObject);
begin
  inherited;
  obFormPag2.verificaTerceiro;
end;

procedure TfrmFormPag2.edCreditoCodigoTerceiroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa:=vDadosIni.pesquisaRapida('CLIENTES');
    if Trim(vDadosIni.vPesquisa) <> '' then
      edCreditoCodigoTerceiro.Valor := StrToInt(Trim(vDadosIni.vPesquisa));
  end;
end;

procedure TfrmFormPag2.EditHw5Exit(Sender: TObject);
begin
  inherited;
 DBLookupComboBox2.KeyValue := EditHw5.AsInteger;

// if EditHw5.AsInteger > 0 then
// if not obFormPag2.vFunc._verificarFuncionarios(EditHw5.AsInteger) then
// Application.MessageBox('Funcionário não encontrado! ', 'Atenção', 0 + 64);

end;

procedure TfrmFormPag2.edReciboNumeroReciboChange(Sender: TObject);
begin
  inherited;
  obFormPag2.vRecibo.FindNearest([edReciboNumeroRecibo.Text]);
end;

procedure TfrmFormPag2.edReciboNumeroReciboEnter(Sender: TObject);
begin
  inherited;
  edReciboNumeroRecibo.OnChange := edReciboNumeroReciboChange;
  if not vDadosIni.vRecibo.HabRecPorDepart then
  	obFormPag2.vRecibo.IndexFieldNames := 'NRECIBO'
  else
	  obFormPag2.vRecibo.IndexFieldNames := 'NUM_REC_DEP';
end;

procedure TfrmFormPag2.edReciboNumeroReciboExit(Sender: TObject);
begin
  inherited;
  edReciboNumeroRecibo.OnChange := nil;
end;

procedure TfrmFormPag2.formChequeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F9 then
    btSalvarS1Click(Sender)
  else if key = VK_F4 then
    btCancelS1Click(Sender);
end;

procedure TfrmFormPag2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not Assigned(gridRecibos.DataSource) then
    Exit;
  if not Assigned(gridRecibos.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(gridRecibos, GridCfg, cdsGrid,
      cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);

  if TemColunasComPosicaoAlteradas then
  	vDadosIni.restoreDataSetDefaultCadPadrao(gridRecibos, GridCfg, true, ListPositions, cdsGrid);

  obFormPag2.RollBackTransacao;

  Action := caFree;
  frmFormPag2 := nil;
end;

procedure TfrmFormPag2.FormCreate(Sender: TObject);
begin
  inherited;
  obFormPag2 := TFormPag2.create;
  chamarTEF := False;
end;

procedure TfrmFormPag2.formCreditosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F9 then
    btSalvarS2Click(Sender)
  else if key = VK_F4 then
    btCancelS2Click(Sender)
  else if key = VK_F6 then
    btGerarClick(Sender);
end;

procedure TfrmFormPag2.formDinheiroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F9 then
    btSalvarNClick(Sender)
  else if key = VK_F4 then
    btCancelNClick(Sender);
end;

procedure TfrmFormPag2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  chave: Char;
begin
  chave := #13;
  inherited;
  if (Classes.ssAlt in Shift) and (key = VK_F4) then
  begin
    Key := 0;
    Application.MessageBox('Opção desabilitada', 'Atenção', 0 + 64);
    Exit;
  end
  else
  if key = VK_F2 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (gridControle.CanFocus) then
	    gridControle.SetFocus;
  end
  else if key = VK_F3 then
  begin
    if (btEcommerce.Visible) and (btEcommerce.Enabled) then
      btEcommerceClick(Sender);
//    btSalvarClick(Sender);
  end
  else if key = VK_F4 then
  begin
    btCancelaClick(Sender);
  end
  else if key = VK_F5 then
  begin
    if (btRecibo.Visible) AND (btRecibo.Enabled) then
      btReciboClick(Sender);
  end
  else if key = VK_F6 then
  begin
    if PageControl1.ActivePage = tabCreditos then
      btGerarClick(Sender)
    else if PageControl1.ActivePage = tabRecibos then
      btQuitarClick(Sender)
    else if PageControl1.ActivePage = tsFormasEC then
      btQuitarECClick(Sender)
    else if PageControl1.ActivePage = tabLancamentos then
      btAlterarClick(Sender);
  end
  else if key = VK_F7 then
  begin
    if PageControl1.ActivePage = tabCreditos then
      ckCreditoImprimirCarne.Checked := not ckCreditoImprimirCarne.Checked
    else if PageControl1.ActivePage = tabRecibos then
      btSomarClick(Sender)
    else if PageControl1.ActivePage = tsFormasEC then
      btSomarECClick(Sender)
    else if PageControl1.ActivePage = tabLancamentos then
      btApagarClick(Sender);
  end
  else if key = VK_F8 then
  begin
    if PageControl1.ActivePage = tabCreditos then
    begin
      if ListBox1.Count > 0 then
      begin
        if ListBox1.ItemIndex < 0 then
          ListBox1.ItemIndex := 0;
        ListBox1DblClick(ListBox1);
      end;
    end
    else if PageControl1.ActivePage = tabRecibos then
    begin
      btValeCreditoClick(Sender);
    end
    else if PageControl1.ActivePage = tabLancamentos then
    begin
      btCarne.Click;
    end;
  end
  else if key = VK_F9 then
  begin
    if PageControl1.ActivePage = tabRecibos then
      obFormPag2.vRecibo.marcaRecibo
    else if PageControl1.ActivePage = tsFormasEC then
      obFormPag2.vEcommerce.marcaEcommerce
    else
      btSalvarClick(Sender);
  end
  else if key = VK_F10 then
  begin
    if PageControl1.ActivePage = tabRecibos then
    begin
      if ActiveControl = edReciboNumeroRecibo then
      begin
      	if (Self.Enabled) and (Self.Visible) and (gridRecibos.CanFocus) then
	        gridRecibos.SetFocus;
      end
      else
      begin
      	if (Self.Enabled) and (Self.Visible) and (edReciboNumeroRecibo.CanFocus) then
	        edReciboNumeroRecibo.SetFocus;
      end;
    end
    else
    begin
//      if obFormPag2.receberDinheiro(obFormPag2.getValorRestante, obFormPag2.getHistorico, ckNF.Checked,
//        alterandoRecebimento) then
//      begin
//        if obFormPag2.confirmaFormaPagamento then
//          ModalResult := mrOk;
//      end;
    end;
  end
  else if key = VK_F11 then
  begin
    if BitBtn4.Enabled then
      BitBtn4.Click;
  end
  else if key = VK_F12 then
  begin
    if (btTEF.Visible) and
      ((PageControl1.ActivePage = tabInicial) or (PageControl1.ActivePage = tabLancamentos)) then
      btTEFClick(btTEF);
    //if ckContabil.Enabled then
      //ckContabil.Checked := not ckContabil.Checked;
  end
  ELSE if Key = VK_ESCAPE then
  begin
    if (ActiveControl = gridControle) and chamarTEF then
    begin
      obFormPag2.cancelar;

      Form_ReativarBotoesPrincipais;
    end
    else
    if (ActiveControl = gridControle) or
    (ActiveControl = gridLancamentos) or
    (ActiveControl = gridRecibos) or
    (ActiveControl = btApagar) or
    (ActiveControl = btAlterar) or
    (ActiveControl = ckContabil) or
    (ActiveControl = pnBotoes)  then
    begin
      BitBtn5.Click;


//      obFormPag2.CancelUpdates;
//      obFormPag2.cancelar;
//      BitBtn4.Enabled := True;
//      btRecibo.Enabled := obFormPag2.tipoVenda <> 'REC';
//      btSalvar.Enabled := True;
    end
    else
    begin
      obFormPag2.cancelar;

      Form_ReativarBotoesPrincipais;
    end;
  end;
end;

procedure TfrmFormPag2.FormShow(Sender: TObject);
var
	ConfigPoliticaPag: TConfig_sistema_class;
  vUsarCondPagVenda: string;
begin
	try
  	vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet, GridCfg, gridRecibos, cdsGrid, cdsColunas, trans, ListGridsAndDataSets,
      ListPositions, nomeDTSEt, PrimeiraPesquisa, vCamposPadraoRegistro, usuario);

    inherited;
    vLancarTarifa := false;
    tsVale.TabVisible := false;
    tsContasBacarias.TabVisible := false;
    tsValesCupom.TabVisible := false;
    tsFormasEC.TabVisible := false;
    tsPesquisa.TabVisible := false;

    ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', obFormPag2.buscas, vDadosIni.cod_empresa);
 		vUsarCondPagVenda := UpperCase(ConfigPoliticaPag.ReadString('COND_PAG', 'Usar'));

    frmFormPag2.edcreditoCondicaoPagamento.text:= obFormPag2.vCondPag.montaCondPag(
      frmFormPag2.edcreditoCondicaoPagamento,
      obFormPag2.codigoCondicaoPagamento,
      obFormPag2.numeroVenda,
      obFormPag2.tipoVenda);

    Label27.Caption :='';
    obFormPag2.cancelar;
    Caption := Caption + ' - Venda Tipo: ' + obFormPag2.tipoVenda+' - Número: '+IntToStr(obFormPag2.numeroVenda);

    obFormPag2.SqlOpen(' select pd.id_commerce, pd.local_venda, fp.descricao, ' +
      ' pd.cod_cliente, cl.nome_cliente from pedvenda pd ' +
      ' inner join clientes cl on pd.cod_cliente = cl.cod_cliente and pd.cod_empresa = cl.cod_empresa ' +
      ' left join formas_envio_ec fp on pd.cod_forma_rast = fp.cod_forma and pd.cod_empresa = fp.cod_empresa ' +
      ' where pd.nped = ' + IntToStr(obFormPag2.numeroVenda) +
      ' and pd.tipo = ' + QuotedStr(trim(obFormPag2.tipoVenda)) +
      ' and pd.cod_empresa = ' + vDadosIni.codEmpresa, obFormPag2.buscas);

    pnObsIdEcommerce.Visible := obFormPag2.buscas.FieldByName('id_commerce').AsInteger > 0;
    pnLocalVenda.Visible := obFormPag2.buscas.FieldByName('id_commerce').AsInteger > 0;
    pnInfCliente.Visible := obFormPag2.buscas.FieldByName('id_commerce').AsInteger > 0;
    pnObsFreteEcommerce.Visible := obFormPag2.buscas.FieldByName('id_commerce').AsInteger > 0;
    pnObsIntermediador.Visible := false;

    pnObsIdEcommerce.Caption := 'Id E-Commerce: ' + IntToStr(obFormPag2.buscas.FieldByName('id_commerce').AsInteger);

    if obFormPag2.buscas.FieldByName('id_commerce').AsInteger > 0 then
    begin
      pnLocalVenda.Visible := trim(obFormPag2.buscas.FieldByName('local_venda').AsString) <> '';
      pnLocalVenda.Caption := 'Local Venda: ' + trim(obFormPag2.buscas.FieldByName('local_venda').AsString);
    end;

    pnInfCliente.Caption := 'Cliente: ' + trim(obFormPag2.buscas.FieldByName('nome_cliente').AsString);

    pnObsFreteEcommerce.Caption := 'Obs Frete: ' + trim(obFormPag2.buscas.FieldByName('descricao').AsString);

    if obFormPag2.buscas.FieldByName('id_commerce').AsInteger > 0 then
    begin
      obFormPag2.SqlOpen(' select fe.intermediador, fe.valordoc from formpagamento_ec fe ' +
        ' where fe.nrequisicao = ' + IntToStr(obFormPag2.numeroVenda) +
        ' and fe.tpdocs = ' + QuotedStr(trim(obFormPag2.tipoVenda)) +
        ' and fe.cod_empresa = ' + vDadosIni.codEmpresa, obFormPag2.buscas).FetchAll;

      pnObsIntermediador.Visible := obFormPag2.buscas.RecordCount = 1;

      if pnObsIntermediador.Visible then
        pnObsIntermediador.Caption := 'Intermediador: ' + trim(obFormPag2.buscas.FieldByName('intermediador').AsString);
    end;

    Form_ReativarBotoesPrincipais;

    btEcommerce.Visible := obFormPag2.numeroVendaEcommerce > 0;
    SaldoprogramaFidelidade1.Visible := (vDadosIni.vProgFid.vHabilitarProgFid)
      and ((obFormPag2.tipoVenda = 'REQ') or (obFormPag2.tipoVenda = 'OS') or (obFormPag2.tipoVenda = 'MOT') or (obFormPag2.tipoVenda = 'PRE'));
    btTEF.Visible := obFormPag2.botaoTefAtivo;
    UsartransalaoeletrnicaAvulsa1.Visible := btTEF.Visible;
    if (obFormPag2.vControle.dataSet.RecordCount = 1) and (edValorQueFaltaInformar.Valor > 0) then
      gridControleDblClick(gridControle);
    if obFormPag2.numeroVendaEcommerce > 0 then
      obFormPag2.vEcommerce.selecionaFormasEcommerce(obFormPag2.numeroVenda, obFormPag2.tipoVenda);

    if vUsarCondPagVenda = 'S' then
    begin
    	obFormPag2.buscas.Close;
      obFormPag2.buscas.SQL.Text := '	select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from pedvenda ' +
      	' inner join cond_pag on ' +
        '   cond_pag.cod_cond_pag = pedvenda.cod_cond_pag ' +
        '   and cond_pag.ativo = 1 ' +
        ' where pedvenda.nped = ' + IntToStr(obFormPag2.numeroVenda) +
        ' and pedvenda.tipo = ' + QuotedStr(trim(obFormPag2.tipoVenda)) +
        ' and pedvenda.cod_empresa = ' + vDadosIni.codEmpresa;
      obFormPag2.buscas.Open;

      if not obFormPag2.buscas.IsEmpty then
      begin
        obFormPag2.ExecutaComandosSql(
          ' select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from pedvenda ' +
          ' inner join cond_pag on ' +
          '    cond_pag.cod_cond_pag = pedvenda.cod_cond_pag ' +
          '    and cond_pag.ativo = 1 ' +
          '    and cond_pag.natureza_cp = ''T'' ' +
          ' where pedvenda.nped = ' + IntToStr(obFormPag2.numeroVenda) +
          ' and pedvenda.tipo = ' + QuotedStr(trim(obFormPag2.tipoVenda)) +
          ' and pedvenda.cod_empresa = ' + vDadosIni.codEmpresa +
          ' union ' +
          ' select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from pedvenda ' +
          ' inner join cond_pag on ' +
          '    cond_pag.cod_cond_pag = pedvenda.cod_cond_pag ' +
          '    and cond_pag.ativo = 1 ' +
          '    and cond_pag.natureza_cp = ''V'' ' +
          ' where pedvenda.nped = ' + IntToStr(obFormPag2.numeroVenda) +
          ' and pedvenda.tipo = ' + QuotedStr(trim(obFormPag2.tipoVenda)) +
          ' and pedvenda.cod_empresa = ' + vDadosIni.codEmpresa +
          ' union' +
          ' select ''NENHUMA'' desc_cond_pag, 0 cod_cond_pag from rdb$database' +
          ' order by 1 ', False);
      end
      else
      begin
      	obFormPag2.ExecutaComandosSql(
          'select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from cond_pag ' +
          ' where cond_pag.ativo = 1 ' +
          ' and cond_pag.natureza_cp = ''T'' ' +
          IfThen(vDadosIni.vCliente.vCondPagPorCliente and (obFormPag2.condicoesCliente <> ''),
            ' and cond_pag.cod_cond_pag in ' + obFormPag2.condicoesCliente) +
          ' union' +
          ' select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from cond_pag ' +
          ' where cond_pag.ativo = 1 ' +
          ' and cond_pag.natureza_cp = ''V'' ' +
          IfThen(vDadosIni.vCliente.vCondPagPorCliente and (obFormPag2.condicoesCliente <> ''),
            ' and cond_pag.cod_cond_pag in ' + obFormPag2.condicoesCliente) +
          ' union' +
          ' select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from cond_pag ' +
          '	where cond_pag.ativo = 1 ' +
          ' and cond_pag.natureza_cp is null ' +
          IfThen(vDadosIni.vCliente.vCondPagPorCliente and (obFormPag2.condicoesCliente <> ''),
            ' and cond_pag.cod_cond_pag in ' + obFormPag2.condicoesCliente) +
          ' union' +
          ' select ''NENHUMA'' desc_cond_pag, 0 cod_cond_pag from rdb$database' +
          ' order by 1 ', False);
      end;
    end
    else
    begin
      obFormPag2.ExecutaComandosSql(
        'select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from cond_pag ' +
        ' where cond_pag.ativo = 1 ' +
        ' and cond_pag.natureza_cp = ''T'' ' +
        IfThen(vDadosIni.vCliente.vCondPagPorCliente and (obFormPag2.condicoesCliente <> ''),
        	' and cond_pag.cod_cond_pag in ' + obFormPag2.condicoesCliente) +
        ' union' +
        ' select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from cond_pag ' +
        ' where cond_pag.ativo = 1 ' +
        ' and cond_pag.natureza_cp = ''V'' ' +
        IfThen(vDadosIni.vCliente.vCondPagPorCliente and (obFormPag2.condicoesCliente <> ''),
          ' and cond_pag.cod_cond_pag in ' + obFormPag2.condicoesCliente) +
        ' union' +
        ' select cond_pag.desc_cond_pag, cond_pag.cod_cond_pag from cond_pag ' +
        '	where cond_pag.ativo = 1 ' +
        ' and cond_pag.natureza_cp is null ' +
        IfThen(vDadosIni.vCliente.vCondPagPorCliente and (obFormPag2.condicoesCliente <> ''),
          ' and cond_pag.cod_cond_pag in ' + obFormPag2.condicoesCliente) +
        ' union' +
        ' select ''NENHUMA'' desc_cond_pag, 0 cod_cond_pag from rdb$database' +
        ' order by 1 ', False);
    end;
    obFormPag2.lkCondPag.setDadosDataSet('COD_COND_PAG', 'DESC_COND_PAG', obFormPag2.buscas,
      lkedcreditoCondicaoPagamento);
    lkedcreditoCondicaoPagamento.KeyValue := obFormPag2.codigoCondicaoPagamento;

    if vUsarCondPagVenda = 'S' then
    	edcreditoQtdeParcelas.Enabled := False
    else
      edcreditoQtdeParcelas.Enabled := not(vDadosIni.vCliente.vCondPagPorCliente and (obFormPag2.condicoesCliente <> ''));

    vDadosIni.forcaFocoNoSistema(Application.Handle);

    CheckBox_LancarTaxa.Checked := _LerConfiguracoesRegistroBoolean(CheckBox_LancarTaxa.Name);
    vLancarTarifa := true;

    imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
    	'Processo "CXL085" PERMITIR REEBER DOCUMENTOS VALOR MENOR CXL' + #13 +
      'Processo "FPG010" RECEBER VALOR MAIOR PARA TIPO = MOT' + #13 +
      'Processo "FPG019" MONTAR BOLETO A PARTIR DE OS' + #13 +
      'Processo "FPG020" EMITIR BOLETO DE OS NA CONFIRMACAO' + #13 +
      'Processo "FPG024" VALIDAR RECEBIMENTO DE BOLETOS COM REMESSA ENVIADA E VALE COMPRA' + #13 +
      'Processo "FPG025" VALIDAR EXCLUSÃO DE BOLETAS COM REMESSA ENVIADA E VALE COMPRA' + #13 +
      'Processo "FPG026" VALIDAR FORMA DE PAGAMENTO COM MAIOR QUE O VALOR DA VENDA E LANCAR TROCO' + #13 +
      'Processo "FPG027" UTILIZAR RECIBO DE CLIENTE DIFERENTE AO RECEBER FORMA DE PAGAMENTO' + #13 +
      'Processo "FPG036" MONTAR BOLETO A PARTIR DE REQ' + #13 +
      'Processo "FPG037" EMITIR BOLETO DE REQ NA CONFIRMACAO' + #13 +
      'Processo "FPG038" MONTAR BOLETO A PARTIR DE RECIBO' + #13 +
      'Processo "FPG039" EMITIR BOLETO DE RECIBO NA CONFIRMACAO' + #13 +
      'Processo "FPG040" PERMITIR UTILIZAR VALES DE LOCACAO' + #13 +
      'Processo "FPG046" RECEBER DOCUMENTO SEM UTILIZAR INTERMEDIADOR E-COMMERCE' + #13 +
      'Processo "FPG050" PERMITIR RECEBER VENDA CANCELADA NO E-COMMERCE' + #13 +
      'Processo "REC024" HABILITAR RECEBIMENTO DE RECIBOS PELO FINANCEIRO' + #13 +
      'Processo "VND234" LIBERAR FORMAS DE PAGAMENTO A VISTA PARA CLIENTE COM FATURAMENTO BARRADO' + #13 +
      'Processo "VND235" LIBERAR FORMAS DE PAGAMENTO NÃO DEFINIDAS PARA CLIENTE COM FATURAMENTO BARRADO' + #13 +
      'Processo "VND254" HABILITAR RECEBIMENTO DE REQUISICOES PELO FINANCEIRO' + #13 +
      'Processo "VND255" HABILITAR RECEBIMENTO DE ORDENS DE SERVICO PELO FINANCEIRO' + #13 +
      'Processo "VEI168" HABILITAR RECEBIMENTO DAS SAÍDAS DE VEÍCULOS PELO FINANCEIRO';

    if edValorQueFaltaInformar.Valor = 0 then
      if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
        BitBtn4.SetFocus;
  finally
  	if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);
  end;
end;

procedure TfrmFormPag2.Form_DesativarBotoesPrincipais;
begin
  BitBtn4.Enabled := False;
  btRecibo.Enabled := False;
  btEcommerce.Enabled := False;
  SaldoprogramaFidelidade1.Enabled := False;
  btTEF.Enabled := False;
  btSalvar.Enabled := False;
end;

procedure TfrmFormPag2.Form_PreparaTela;
begin
  tabDinheiro.TabVisible := False;
  tabCheque.TabVisible := False;
  tabCreditos.TabVisible := False;
  tabRecibos.TabVisible := False;
  tabInicial.TabVisible := False;
  tabLancamentos.TabVisible := False;
  tabDadosRecibos.TabVisible := False;
  tabPromissoria.TabVisible := False;
  PageControl1.ActivePage := frmFormPag2.tabInicial;
end;

procedure TfrmFormPag2.Form_ReativarBotoesPrincipais;
begin

  BitBtn4.Enabled := True;
  btRecibo.Enabled := obFormPag2.tipoVenda <> 'REC';
  btEcommerce.Enabled := obFormPag2.numeroVendaEcommerce > 0;
  SaldoprogramaFidelidade1.Enabled := True;
  btTEF.Enabled := True;
  btSalvar.Enabled := True;
  chamarTEF := False;

  obFormPag2.vControle.RestoreComandFP;
end;

procedure TfrmFormPag2.gridControleDblClick(Sender: TObject);
begin
  inherited;

  if not obFormPag2.botaoTefAtivo then
    chamarTEF := True;

  try
    if not obFormPag2.habilitaControlesFormaPagamento(chamarTEF) then
    begin
      obFormPag2.cancelar;
      Form_ReativarBotoesPrincipais;
    end
    else
    begin
      Form_DesativarBotoesPrincipais;
      btSalvar.Enabled := True;
    end;
    if edValorQueFaltaInformar.Valor = 0 then
      if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
        BitBtn4.SetFocus;
  finally
    chamarTEF := False;
  end;
end;

procedure TfrmFormPag2.gridControleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    gridControleDblClick(gridControle);
end;

procedure TfrmFormPag2.gridEcommerceDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if not (obFormPag2.vEcommerce.dataSet.FieldByName('SEQFORM').IsNull) then
  begin
    if (obFormPag2.vEcommerce.dataSet.FieldByName('UTILIZADO').AsString = 'S') then
     if (gdFocused in State) then
     begin
       TDBGrid(sender).canvas.brush.color := clWindow;
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end
     else
     begin
       TDBGrid(sender).canvas.brush.color := TColor(Panel15.Color);
       TDBGrid(sender).canvas.Font.color := clBlack;
     end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
	else if gridEcommerce.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
     if Rect.Top = TStringGrid(gridEcommerce).CellRect(0,TStringGrid(gridEcommerce).Row).Top then
     begin
       gridEcommerce.Canvas.FillRect(Rect);
       gridEcommerce.Canvas.Brush.Color := TColor($F0CAA6);
       gridEcommerce.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
	  if gdSelected in State then //Cor da célula selecionada
     begin
       gridEcommerce.Canvas.Brush.Color := TColor($F0CAA6);
       gridEcommerce.Canvas.FillRect(Rect);
       gridEcommerce.DefaultDrawDataCell(Rect,Column.Field,State)
     end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmFormPag2.gridEcommerceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    obFormPag2.vEcommerce.marcaEcommerce;
end;

procedure TfrmFormPag2.gridEcommerceTitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(gridEcommerce, Column);
end;

procedure TfrmFormPag2.gridRecibosCellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SELEC' then
    obFormPag2.vRecibo.marcaRecibo;
end;

procedure TfrmFormPag2.gridRecibosColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(gridRecibos, GridCfg, cdsGrid,
    cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas := True;
end;

procedure TfrmFormPag2.gridRecibosDblClick(Sender: TObject);
begin
  inherited;
  obFormPag2.vRecibo.marcaRecibo;
end;

procedure TfrmFormPag2.gridRecibosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if gridRecibos.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
     if Rect.Top = TStringGrid(gridRecibos).CellRect(0,TStringGrid(gridRecibos).Row).Top then
     begin
       gridRecibos.Canvas.FillRect(Rect);
       gridRecibos.Canvas.Brush.Color := TColor($F0CAA6);
       gridRecibos.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
	  if gdSelected in State then //Cor da célula selecionada
     begin
       gridRecibos.Canvas.Brush.Color := TColor($F0CAA6);
       gridRecibos.Canvas.FillRect(Rect);
       gridRecibos.DefaultDrawDataCell(Rect,Column.Field,State)
     end;

  if Column.FieldName = 'SELEC' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end
  else if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmFormPag2.gridRecibosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    obFormPag2.vRecibo.marcaRecibo;
end;

procedure TfrmFormPag2.gridRecibosTitleClick(Column: TColumn);
begin
  inherited;
vDadosIni.DBGridOnTitleClick(gridRecibos, Column);
end;

procedure TfrmFormPag2.grupoControleEnter(Sender: TObject);
begin
  inherited;
grupoControle.Font.Color := clNavy;
end;

procedure TfrmFormPag2.grupoControleExit(Sender: TObject);
begin
  inherited;
grupoControle.Font.Color := clWindowText;
end;

procedure TfrmFormPag2.ListBox1DblClick(Sender: TObject);
begin
  inherited;
  obFormPag2.alterarParcelamentos;
end;

procedure TfrmFormPag2.MaskEdit1Change(Sender: TObject);
var
 I: Integer;
begin
  if (radiobutton1.Checked) AND (Trim(MaskEdit1.Text) <> '')  then
  begin
     for I := 0 to obFormPag2.vRecibo.dataSet.FieldCount - 1 do
     begin
        if obFormPag2.vRecibo.dataSet.Fields[I].DisplayLabel = trim(ComboBox1.Text) then
        begin
          obFormPag2.vRecibo.Pesquisar(obFormPag2.vRecibo.dataSet.Fields[I].FieldName, '',maskedit1.Text, CheckBox1.Checked, obFormPag2.vRecibo.dataSet);
          Break;
        end;
     end;
  end;
end;

procedure TfrmFormPag2.PageControl1Enter(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage.Font.Color := clNavy;
  if PageControl1.ActivePage = tabLancamentos then
  begin
  	if (Self.Enabled) and (Self.Visible) and (gridLancamentos.CanFocus) then
	    gridLancamentos.SetFocus;
  end
  else if PageControl1.ActivePage = tabDinheiro then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edCarteiraValorCarteira.CanFocus) then
	    edCarteiraValorCarteira.SetFocus;
  end
  else if PageControl1.ActivePage = tabCheque then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edChequeNumeroCheque.CanFocus) then
	    edChequeNumeroCheque.SetFocus;
  end
  else if PageControl1.ActivePage = tabCreditos then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edCreditoValorCredito.CanFocus) then
	    edCreditoValorCredito.SetFocus;
  end
  else if PageControl1.ActivePage = tabRecibos then
  begin
  	if (Self.Enabled) and (Self.Visible) and (gridRecibos.CanFocus) then
	    gridRecibos.SetFocus;
  end;
end;

procedure TfrmFormPag2.PageControl1Exit(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage.Font.Color := clWindowText;
end;

procedure TfrmFormPag2.pnChequeEnter(Sender: TObject);
begin
  if obFormPag2.numeroVendaEcommerce <= 0 then
    exit;
    
  TForm(pnCheque.Parent).OnKeyDown := formChequeKeyDown;
  if (Self.Enabled) and (Self.Visible) and (edChequeNumeroCheque.CanFocus) then
    edChequeNumeroCheque.SetFocus;
end;

procedure TfrmFormPag2.pnCreditosEnter(Sender: TObject);
begin
  if obFormPag2.numeroVendaEcommerce <= 0 then
    exit;

  TForm(pnCreditos.Parent).OnKeyDown := formCreditosKeyDown;
  if (Self.Enabled) and (Self.Visible) and (edCreditoValorCredito.CanFocus) then
    edCreditoValorCredito.SetFocus;
end;

procedure TfrmFormPag2.pnDinheiroEnter(Sender: TObject);
begin
  if obFormPag2.numeroVendaEcommerce <= 0 then
    exit;
    
  TForm(pnDinheiro.Parent).OnKeyDown := formDinheiroKeyDown;
  if (Self.Enabled) and (Self.Visible) and (edCarteiraValorCarteira.CanFocus) then
    edCarteiraValorCarteira.SetFocus;
end;

procedure TfrmFormPag2.QuickRep1Preview(Sender: TObject);
begin
  inherited;
 vDadosIni.VisualizaRelQrp(Sender, Pchar('Promissórias da Venda '+obFormPag2.dataSet.FieldByName('NREQUISICAO').AsString));
end;

procedure TfrmFormPag2.RadioGroupValesClick(Sender: TObject);
begin
  inherited;
  obFormPag2.vValeCupomPrgFid._abreValeCupomPrgFid(obFormPag2.codigoCliente,
  	RadioGroupVales.ItemIndex = 1);
  BitBtnOKResgatarVale.Enabled := RadioGroupVales.ItemIndex = 0;  
end;

procedure TfrmFormPag2.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(gridRecibos);
end;

procedure TfrmFormPag2.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(gridRecibos, GridCfg, cdsColunas, cdsGrid, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets, false, ListPositions);
end;

procedure TfrmFormPag2.SaldoprogramaFidelidade1Click(Sender: TObject);
begin
  inherited;
  try          
   if obFormPag2.codigoCliente <= 0 then
   begin
   	 Application.MessageBox('Código do cliente não informado.', 'Informação', MB_OK + MB_DEFBUTTON1);
   	 exit;
   end;

    Screen.Cursor := crHourGlass;
    obFormPag2.cl_abreExtrato_form(obFormPag2.codigoCliente);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFormPag2.SalvardadosnoExcel1Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, gridRecibos, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmFormPag2.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(gridRecibos, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TfrmFormPag2.spbContasBancariasClick(Sender: TObject);
begin
  inherited;
  if obFormPag2._abreFormContasBancarias then
  begin
    edChequeNumBanco.Text := obFormPag2.vContabanc.dataSet.FieldByName('codbanco').AsString;
    edChequeNomeBanco.Text := obFormPag2.vContabanc.dataSet.FieldByName('banco').AsString;
    edChequeConta.Text := obFormPag2.vContabanc.dataSet.FieldByName('conta').AsString;
    edChequeAgencia.Text := obFormPag2.vContabanc.dataSet.FieldByName('agencia').AsString;
  end;
end;

procedure TfrmFormPag2.SpeedButton10Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    obFormPag2.vValeCupomPrgFid._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFormPag2.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  if not obFormPag2.vContabanc.dataSet.IsEmpty then
    TForm(pnConsultaContasBancarias.Parent).ModalResult := IDOK;  
end;

procedure TfrmFormPag2.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  TForm(pnConsultaContasBancarias.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmFormPag2.SpeedButton4Click(Sender: TObject);
begin
  inherited;
 if edTotalRecibos.Valor <= 0 then
   obFormPag2.vRecibo.selecionaRecibosAntecipados;
 if not obFormPag2.vRecibo.IsEmpty then
   obFormPag2._abreFormPesquisa;
end;

procedure TfrmFormPag2.SpeedButton55Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('e-commerce_lancar_taxa_interm_pag', obFormPag2.buscas);
end;

procedure TfrmFormPag2.SpeedButton9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    obFormPag2.vValeCupomPrgFid._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFormPag2.UsartransalaoeletrnicaAvulsa1Click(Sender: TObject);
begin
  inherited;
  if obFormPag2.usarTransacaAvulsaPOSVirtual then
  begin
    btCancela.Click;
    if edValorQueFaltaInformar.Valor = 0 then
    	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
	      BitBtn4.SetFocus;
  end;
end;

end.
