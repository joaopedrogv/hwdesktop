unit UMovVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, TabNotBk, ImgList, uClassesVeiculosCCIA, DB, AppEvnts, uDadosIni,
  uEditHw;

const
  Conf: string = 'Software\Hw\Configuracao\Telas\';

type
  TfrmMovVeiculosCCIA = class(TfrmCadPadraoM)
    TabSheet_DadosdaNota: TTabSheet;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ScrollBox4: TScrollBox;
    TabSheet_ContratoVndConsignado: TTabSheet;
    ScrollBox6: TScrollBox;
    TabSheet_Venda: TTabSheet;
    ScrollBox7: TScrollBox;
    GroupBox_Comando: TGroupBox;
    GroupBox_Dados: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox5: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox9: TGroupBox;
    BitBtn10: TBitBtn;
    BitBtn13: TBitBtn;
    TabSheet_Pesquisa: TTabSheet;
    GroupBox24: TGroupBox;
    groupAvancadas: TGroupBox;
    Label64: TLabel;
    TabSheet_ContratoCompra: TTabSheet;
    ScrollBox5: TScrollBox;
    GroupBox_Compra: TGroupBox;
    GroupBox20: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit14: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit39: TDBEdit;
    GroupBox25: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label80: TLabel;
    DBMemo10: TDBMemo;
    DBMemo11: TDBMemo;
    DBMemo12: TDBMemo;
    DBMemo13: TDBMemo;
    DBMemo14: TDBMemo;
    GroupBox37: TGroupBox;
    Label85: TLabel;
    Label96: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    GroupBox35: TGroupBox;
    BitBtn24: TBitBtn;
    GroupBox27: TGroupBox;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    BitBtn25: TBitBtn;
    CheckBox13: TCheckBox;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    GroupBox30: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    DBLookupComboBox11: TDBLookupComboBox;
    DBLookupComboBox12: TDBLookupComboBox;
    DBLookupComboBox13: TDBLookupComboBox;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    DBEdit49: TDBEdit;
    BitBtn21: TBitBtn;
    Panel4: TPanel;
    Label20: TLabel;
    Label17: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    BitBtn20: TBitBtn;
    Panel5: TPanel;
    DBEdit50: TDBEdit;
    Label100: TLabel;
    Memo1: TMemo;
    TabSheet_ContratoVndResDomInterm: TTabSheet;
    ScrollBox9: TScrollBox;
    GroupBox_Venda: TGroupBox;
    groupAdicional: TGroupBox;
    Label8: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    BitBtn11: TBitBtn;
    DBComboBox3: TDBComboBox;
    RadioGroup2: TRadioGroup;
    GroupBox4: TGroupBox;
    ckCtrCompra: TCheckBox;
    ckCtrEntCons: TCheckBox;
    GroupBox28: TGroupBox;
    ckCFTVnd: TCheckBox;
    ckCtrVnd: TCheckBox;
    ckCtrResDom: TCheckBox;
    ckCtrVndCons: TCheckBox;
    ckCtrInterm: TCheckBox;
    DBEdit7: TDBEdit;
    Label22: TLabel;
    tsCondicoes: TTabSheet;
    pnCondPag: TPanel;
    Panel8: TPanel;
    DBMemo1: TDBMemo;
    Label119: TLabel;
    Label123: TLabel;
    DBMemo3: TDBMemo;
    DBComboBox4: TDBComboBox;
    Label68: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox21: TDBLookupComboBox;
    Label126: TLabel;
    DBEdit62: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    tsPesquisaVeic: TTabSheet;
    pnPesquisaVeic: TPanel;
    BitBtn38: TBitBtn;
    Panel14: TPanel;
    Label589: TLabel;
    Label590: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    EditHwNF: TEditHw;
    MaskEditDataEntIni: TMaskEdit;
    EditChassi: TEdit;
    EditEspecie: TEdit;
    EditMarca: TEdit;
    EditModelo: TEdit;
    EditCor: TEdit;
    Panel145: TPanel;
    Panel13: TPanel;
    DBGrid4: TDBGrid;
    DBEdit61: TDBEdit;
    DBEdit74: TDBEdit;
    PopupMenu3: TPopupMenu;
    MenuItem5: TMenuItem;
    Panel24: TPanel;
    Panel15: TPanel;
    MaskEditDataEntFim: TMaskEdit;
    tsPerguntasVeic: TTabSheet;
    pnPerguntasVeic: TPanel;
    Panel17: TPanel;
    DBComboBox6: TDBComboBox;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBComboBox7: TDBComboBox;
    Panel18: TPanel;
    BitBtn39: TBitBtn;
    GroupBox34: TGroupBox;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    BitBtn28: TBitBtn;
    CheckBox17: TCheckBox;
    DBEdit54: TDBEdit;
    DBEdit56: TDBEdit;
    DBComboBox5: TDBComboBox;
    DBEdit63: TDBEdit;
    GroupBox36: TGroupBox;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    DBEdit57: TDBEdit;
    DBLookupComboBox26: TDBLookupComboBox;
    BitBtn29: TBitBtn;
    BitBtn31: TBitBtn;
    DBEdit58: TDBEdit;
    DBLookupComboBox27: TDBLookupComboBox;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    DBEdit59: TDBEdit;
    DBLookupComboBox28: TDBLookupComboBox;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    DBEdit60: TDBEdit;
    DBLookupComboBox29: TDBLookupComboBox;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    GroupBox38: TGroupBox;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label120: TLabel;
    Label124: TLabel;
    DBMemo2: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBMemo9: TDBMemo;
    DBMemo15: TDBMemo;
    DBMemo16: TDBMemo;
    DBMemo17: TDBMemo;
    GroupBox32: TGroupBox;
    Label105: TLabel;
    Label106: TLabel;
    Label121: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    DBLookupComboBox10: TDBLookupComboBox;
    DBEdit12: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit37: TDBEdit;
    GroupBox33: TGroupBox;
    Panel6: TPanel;
    Panel10: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Label35: TLabel;
    Label41: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    ComboBox4: TComboBox;
    BitBtn16: TBitBtn;
    EditHw5: TEditHw;
    EditHw6: TEditHw;
    EditHw7: TEditHw;
    Edit2: TEdit;
    Panel21: TPanel;
    Panel22: TPanel;
    DBGrid3: TDBGrid;
    BitBtn17: TBitBtn;
    Label24: TLabel;
    Label29: TLabel;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    Label57: TLabel;
    BitBtn46: TBitBtn;
    DBEdit80: TDBEdit;
    Label140: TLabel;
    Label122: TLabel;
    DBEdit23: TDBEdit;
    BitBtn52: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    BitBtn51: TBitBtn;
    Edit3: TEdit;
    Label143: TLabel;
    Panel16: TPanel;
    Label37: TLabel;
    Label81: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    DBEdit89: TDBEdit;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    DBEdit92: TDBEdit;
    DBEdit93: TDBEdit;
    DBEdit94: TDBEdit;
    cbxNovo: TCheckBox;
    cbxUsado: TCheckBox;
    DtVeiculosXML: TDataSource;
    GroupBox_VndCons: TGroupBox;
    GroupBox26: TGroupBox;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    GroupBox7: TGroupBox;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    GroupBox19: TGroupBox;
    BitBtn30: TBitBtn;
    Panel23: TPanel;
    Label34: TLabel;
    Label36: TLabel;
    DBEdit15: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    DBEdit16: TDBEdit;
    BitBtn14: TBitBtn;
    DBEdit64: TDBEdit;
    GroupBox_Nota: TGroupBox;
    GroupBox23: TGroupBox;
    Label73: TLabel;
    DBMemo6: TDBMemo;
    DBMemo7: TDBMemo;
    GroupBox22: TGroupBox;
    Label58: TLabel;
    DBEdit40: TDBEdit;
    Panel30: TPanel;
    Label40: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label79: TLabel;
    Label18: TLabel;
    Label52: TLabel;
    Label104: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    DBEdit24: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBEdit26: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit53: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    BitBtn27: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn53: TBitBtn;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    BitBtn8: TBitBtn;
    ckCFTTransf: TCheckBox;
    Label15: TLabel;
    DBEdit87: TDBEdit;
    BitBtn12: TBitBtn;
    DBCheckBox6: TDBCheckBox;
    btStatusNFe: TBitBtn;
    Label16: TLabel;
    DBEdit88: TDBEdit;
    Label38: TLabel;
    DBEdit95: TDBEdit;
    Label39: TLabel;
    DBComboBox8: TDBComboBox;
    GroupBox6: TGroupBox;
    Panel9: TPanel;
    Panel11: TPanel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Label204: TLabel;
    Label43: TLabel;
    ckCFTDemonst: TCheckBox;
    ckCFTDevolucao: TCheckBox;
    ckCFTOutrasSaidas: TCheckBox;
    Label103: TLabel;
    EditPlaca: TEdit;
    Label101: TLabel;
    DBEdit51: TDBEdit;
    DBLookupComboBox14: TDBLookupComboBox;
    Label102: TLabel;
    DBEdit52: TDBEdit;
    DBLookupComboBox23: TDBLookupComboBox;
    DBGrid2: TDBGrid;
    Label63: TLabel;
    DBEdit13: TDBEdit;
    Label86: TLabel;
    DBEdit65: TDBEdit;
    Label87: TLabel;
    DBEdit66: TDBEdit;
    Label74: TLabel;
    GroupBox10: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    Panel7: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label67: TLabel;
    BitBtn15: TBitBtn;
    EditHw3: TEditHw;
    EditHw4: TEditHw;
    imgInformationTipoOP: TImage;
    ckCFTAtivo: TCheckBox;
    ckEntrada: TCheckBox;
    ckSaida: TCheckBox;
    Panel28: TPanel;
    Panel12: TPanel;
    btAlterarChassi: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    Label88: TLabel;
    DBEdit67: TDBEdit;
    DBLookupComboBox15: TDBLookupComboBox;
    SpeedButton40: TSpeedButton;
    procedure PageControl3Change(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure ComboBox12Enter(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure btAlterarChassiClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageControl3Exit(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit94Exit(Sender: TObject);
    procedure DBEdit53KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btStatusNFeClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBEdit33Exit(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure DBEdit21Exit(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure DBEdit34Exit(Sender: TObject);
    procedure EditHw4Exit(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBMemo17KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBComboBox6Exit(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure MaskEditDataEntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEditDataEntFimEnter(Sender: TObject);
    procedure MaskEditDataEntIniEnter(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    function habilitaControlesParaEdicao(pModelo, pTipoVenda, pTipoOP: string): Boolean;
    function habilitaControlesParaInsercao(pModelo, pTipoVenda, pTipoOP: string): Boolean;
    procedure habilitaCampoComFat(pModelo, pTipoVenda, pTipoOP, pOperacao: string);
    procedure configuraEntrada;
    procedure exitCondPag(Sender: TObject);
    procedure exitChassi(Sender: TObject);
    procedure exitCliente(Sender: TObject);
    procedure exitColaborador(Sender: TObject);
    procedure exitCFOP(Sender: TObject);
    procedure exitPrecoVenda(Sender: TObject);
    procedure exitValorNota(Sender: TObject);
    procedure keydownChassi(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure keydownCliente(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure keydownVendedor(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure keydownCFOP(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    procedure NovoComando(pTipoV: string);
    function buscarNaturezaOp: boolean;
    procedure SetFocusTabSheetDadosNota;
    procedure FocarEditarChassi;
    procedure FocarCampos;
    procedure ConfigurarForm(pValor: string);
    procedure bitbtnEditarObs(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    { Private declarations }
    vCriou: SmallInt;
  public
    { Public declarations }
    function _atualizarCombobox: Boolean;
    procedure _habilitardesabilitarCampos(vtp: integer = 0; vObs: integer = 0);
  end;

var
  frmMovVeiculosCCIA: TfrmMovVeiculosCCIA;
  ComFat: TComFat;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;
  vFechar: boolean;

implementation
uses
  uDtmAtivo, UDtmVeiculosCCIA, uDataSet_OOP, DBClient, Clipbrd, Registry, UClassesClientes, uClassesNotasFiscais;
{$R *.dfm}

procedure TfrmMovVeiculosCCIA.BitBtn10Click(Sender: TObject);
begin
  inherited;
  ComFat.ImprimirContratoComando;
end;

procedure TfrmMovVeiculosCCIA.BitBtn11Click(Sender: TObject);
var
	I: Integer;
begin
	try
    Screen.Cursor := crHourGlass;
    ComFat.vEstMoto.abreFormSaidaCCIA(1, ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString, true);

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn15Click(Sender: TObject);
begin
  if (EditHw7.AsValue > 0) and (EditHw1.AsValue > 0) then
  begin
    Application.MessageBox('Valor da Operação ainda não foi atingido!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    exit;
  end
  else
  begin
    TForm(pnCondPag.Parent).ModalResult := IDOK;
    ComFat.dataSet.FieldByName('VALOR_REAL').AsFloat := EditHw2.AsValue;
    ComFat.dataSet.FieldByName('VALOR_A_REC').AsFloat := EditHw3.AsValue;
    if ComFat.dataSet.FieldByName('VALOR_REAL').AsFloat > 0 then
      Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if not ComFat.addPlano then
  begin
    Application.MessageBox(PChar(ComFat.vMensagemErro), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
    exit;
  end;

  Edit2.Clear;
  Edit3.Clear;
  EditHw5.AsValue := 0;
  if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
    ComboBox4.SetFocus;
end;

procedure TfrmMovVeiculosCCIA.BitBtn17Click(Sender: TObject);
begin
  inherited;
  ComFat.removerPlano;
end;

procedure TfrmMovVeiculosCCIA.BitBtn1Click(Sender: TObject);
var
  I: integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('VEI034', 'CONSULTAR', '', 'COM_FAT', '', ComFat.buscas, False) then
      Exit;

    ComFat.vCons.campo := ComboBox1.Text;
    ComFat.vCons.ordem := ComboBox2.Text;
    ComFat.vCons.condicao := ComboBox3.Text;
    ComFat.vCons.valor := MaskEdit3.Text;
    ComFat.vCons.dataIni := MaskEdit1.Text;
    ComFat.vCons.dataFim := MaskEdit2.Text;
    ComFat.vCons.porData := MaskEdit1.Visible;

    ComFat.vCons.avancada := CheckBox3.Checked;
    ComFat.vCons.adicional := CheckBox1.Checked;
    ComFat.vCons.entrada := ckEntrada.Checked;
    ComFat.vCons.saida := ckSaida.Checked;
    ComFat.vCons.statusAv := RadioGroup2.Items[RadioGroup2.ItemIndex];

    ComFat.vCons.ctrCompra := ckCtrCompra.Checked;
    ComFat.vCons.ctrEntCons := ckCtrEntCons.Checked;
    ComFat.vCons.cftVenda := ckCFTVnd.Checked;
    ComFat.vCons.ctrVnd := ckCtrVnd.Checked;
    ComFat.vCons.ctrVndCons := ckCtrVndCons.Checked;
    ComFat.vCons.ctrResDom := ckCtrResDom.Checked;
    ComFat.vCons.ctrInterm := ckCtrInterm.Checked;
    ComFat.vCons.cftTransf := ckCFTTransf.Checked;
    ComFat.vCons.cftDemonst := ckCFTDemonst.Checked;
    ComFat.vCons.cftDevo := ckCFTDevolucao.Checked;
    ComFat.vCons.cftOutrasS := ckCFTOutrasSaidas.Checked;
    ComFat.vCons.cftAtivo := ckCFTAtivo.Checked;

    ComFat.vCons.campoAd := ComboBox11.Text;
    ComFat.vCons.valorAd := MaskEdit7.Text;
    ComFat.vCons.dataIniAd := MaskEdit9.Text;
    ComFat.vCons.dataFimAd := MaskEdit8.Text;
    ComFat.vCons.condicaoAd := ComboBox12.Text;
    ComFat.vCons.porDataAd := MaskEdit9.Visible;

    ComFat.consulta;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;

    if ComFat.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
      begin
        if DBGrid1.Columns[i].FieldName = 'OBS_V' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'INF_CORPO_V' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'DADOS_V' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'COND_NEGOCIACAO' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'DOC_CHAVE_MAN' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'MULTAS' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'OPCIONAIS' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'PROMESSAS' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'OBS' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'COND_REAIS' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        if DBGrid1.Columns[i].FieldName = 'LOCAL_FOMENTO' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
      end;

  finally
  	gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn20Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not ComFat.abreFormCondPag(Sender) then
      exit;

    if (ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0)
    and (ComFat.dataSet.FieldByName('NATOP_V').AsFloat > 0) then
      buscarNaturezaOp;
    exitValorNota(Sender);
    ComFat.PrecoTabela(ComFat.buscas);
    
    if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
      ComboBox4.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn22Click(Sender: TObject);
begin
  inherited;
  TForm(pnPesquisaVeic.Parent).ModalResult := IDOK;

  if ComFat.vEstMoto.dataSet.FieldByName('CODIGO').AsInteger > 0 then
  begin
    ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger := ComFat.vEstMoto.dataSet.FieldByName('CODIGO').AsInteger;
    ComFat.dataSet.FieldByName('CHASSIV').AsString := ComFat.vEstMoto.dataSet.FieldByName('CHASSI_C').AsString;
    ComFat.dataSet.FieldByName('PLACAV').AsString := ComFat.vEstMoto.dataSet.FieldByName('PLACAEST').AsString;
    if (ComFat.vSing.vMod = 'CTRCOMPRA') or (ComFat.vSing.vMod = 'CTRENTCONS') or (ComFat.vSing.vMod = 'CTRVND') or
       (ComFat.vSing.vMod = 'CTRRESDOM') or (ComFat.vSing.vMod = 'CTRINTERM') then
    begin
      ComFat.dataSet.FieldByName('CLIENTES_V').AsInteger := ComFat.vEstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsInteger;
      ComFat.vClienteComFat.abreClientes(ComFat.dataSet.FieldByName('CLIENTES_V').AsInteger, 'E');
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn23Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    ComFat.vEstMoto._chassi := EditChassi.Text;
    ComFat.vEstMoto._placa := EditPlaca.Text;
    ComFat.vEstMoto._modelo := EditModelo.Text;
    ComFat.vEstMoto._marca := EditMarca.Text;
    ComFat.vEstMoto._especie := EditEspecie.Text;
    ComFat.vEstMoto._cor := EditCor.Text;
    ComFat.vEstMoto._numNf := EditHwNF.AsInteger;
    ComFat.vEstMoto._dtIni := MaskEditDataEntIni.Text;
    ComFat.vEstMoto._dtFim := MaskEditDataEntFim.Text;
    ComFat.vEstMoto.pesquisar(ComFat);
    if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then    
     DBGrid4.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn25Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not ComFat.abreFormPesquisaVeiculo then
      exit;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn27Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('VEI081', 'IMPRIMIR CONTRATO', 'CHASSI - ' + ComFat.dataSet.FieldByName('CHASSIV').AsString + '', 'COM_FAT',
    ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, true) then
  begin
    Application.MessageBox(Pchar('Reimpressão Declaração não é permitido.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  if ComFat.dataSet.FieldByName('IMP_DECLARACAO').AsString = 'S' then
    ComFat.ImprimirContrato(ComFat.vModContratos.BuscarContrato(' AND TIPO_CONTRATO = ''TERMO DE COMPROMISSO'' '));
end;

procedure TfrmMovVeiculosCCIA.bitbtnEditarObs(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VEI124', 'EDITAR', 'CHASSI - ' + ComFat.dataSet.FieldByName('CHASSIV').AsString + '', 'COM_FAT',
    ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, true) then
    exit;
 _habilitardesabilitarCampos(1, 1);
end;

procedure TfrmMovVeiculosCCIA.btAlterarChassiClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja alterar o Chassi?', 'Confirmação', MB_YESNO + MB_DEFBUTTON2) <> mrYes then
   exit;
   
  if not vDadosIni.PesqPros('VEI111', 'ALTERAR',
    'CODIGO: ' + IntToStr(ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
    'CHASSI: '+trim(ComFat.dataSet.FieldByName('CHASSIV').AsString),
    'COM_FAT', ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, true) then
   Exit;

  vDadosIni.vHistV.vChassi := Comfat.dataSet.FieldByName('CHASSIV').AsString;
  vDadosIni.vHistV.vCodigo := Comfat.dataSet.FieldByName('COD_ESTMOTO').AsInteger;
  vDadosIni.vHistV.vNatureza := Comfat.dataSet.FieldByName('NATUREZA').AsString;
  vDadosIni.vHistV.vNumDoc := Comfat.dataSet.FieldByName('N_COMANDO').AsInteger;
  vDadosIni.vHistV.vPlaca := Comfat.dataSet.FieldByName('PLACAV').AsString;
  vDadosIni.vHistV.vTipo := Comfat.dataSet.FieldByName('TIPO').AsString;
  vDadosIni.GravarHistEstMoto(Comfat.buscas, DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.vHistV, true);
  FocarEditarChassi;
  btAlterarChassi.Enabled := False;
  ComFat.vChassiOld := Comfat.dataSet.FieldByName('CHASSIV').AsString;
  ComFat.vCodigoOld := Comfat.dataSet.FieldByName('COD_ESTMOTO').AsInteger;
  if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
    ComFat.dataset.Edit;
  ComFat.dataSet.FieldByName('PRVEN_V').AsFloat := 0;
  ComFat.dataSet.FieldByName('VALTOT_V').AsFloat := 0;
  ComFat.vMensDemonst := true;
end;

procedure TfrmMovVeiculosCCIA.BitBtn34Click(Sender: TObject);
begin
  inherited;
  TForm(pnPesquisaVeic.Parent).ModalResult := IDCANCEL;

  if (ComFat.dataSet.FieldByName('CHASSIV').AsString = '') or
    (ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger <= 0) then
    if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CFT' then
    begin
      Application.MessageBox('Veiculo não informado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit74.CanFocus) then
        DBEdit74.SetFocus;
    end
    else if (trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRCOMPRA')
      or (trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRENTCONS') then
    begin
      Application.MessageBox('Veiculo não informado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit61.CanFocus) then
        DBEdit61.SetFocus;
    end
    else if (trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRVND')
      or (trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRRESDOM')
      or (trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRINTERM') then
    begin
      Application.MessageBox('Veiculo não informado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit63.CanFocus) then
        DBEdit63.SetFocus;
    end
    else if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRVNDCONS' then
    begin
      Application.MessageBox('Veiculo não informado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit64.CanFocus) then
        DBEdit64.SetFocus;
    end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn35Click(Sender: TObject);
begin
  inherited;
 ComFat.DemonstracaoVeiculo;
end;

procedure TfrmMovVeiculosCCIA.BitBtn36Click(Sender: TObject);
begin
// if ComFat.vEstMoto.dataSet.IsEmpty then
//    exit;
//    
//  ComFat.ReservaVeiculo;
 try
    if ComFat.vEstMoto.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('VEI062', 'CONSULTA', '', 'EST_MOTO', '',
      ComFat.buscas, true) then
      Exit;

    Screen.Cursor := crHourGlass;
    if ComFat.vEstMoto.IsEmpty then
      exit;

    if not ComFat.vEstMoto.vReserva.abreFormReserva(
    	1,
      ComFat.vEstMoto.dataSet.FieldByName('CODIGO').AsInteger,
      ComFat.vEstMoto.dataSet.FieldByName('COD_EMPRESA').AsInteger,
      ComFat.vEstMoto.dataSet.FieldByName('CHASSI_C').AsString) then
        exit;

    ComFat.vEstMoto.Refresh;  
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn37Click(Sender: TObject);
begin
  inherited;
  if ComFat.vEstMoto.dataSet.IsEmpty then
    exit;

  ComFat.vTransfDep.abreFormTransfDep(ComFat.vEstMoto.dataSet.FieldByName('VERSAOEST').AsInteger);
end;

procedure TfrmMovVeiculosCCIA.BitBtn39Click(Sender: TObject);
begin
  inherited;
  if (ComFat.dataSet.FieldByName('PRIMEIROVEICULO').AsString <> 'N') and (ComFat.dataSet.FieldByName('PRIMEIROVEICULO').AsString <> 'S') then
  begin
    Application.MessageBox('É necessário preencher ''S'' ou ''N'' para a pergunta de primeiro veículo!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TDBComboBox(Sender).CanFocus) then
      TDBComboBox(Sender).SetFocus;
    exit;
  end;
  if ComFat.dataSet.FieldByName('PRIMEIROVEICULO').AsString = 'N' then
  begin
    if (ComFat.dataSet.FieldByName('MARCAVEICULOANT').AsString = '') or (ComFat.dataSet.FieldByName('MODELOVEICULOANT').AsString = '') then
    begin
      Application.MessageBox('É necessário preencher os dados da marca e modelo do veículo anterior!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).SetFocus;
      exit;
    end;
  end;
  if (ComFat.dataSet.FieldByName('ACEITA_CONTATO').AsString <> 'N') and (ComFat.dataSet.FieldByName('ACEITA_CONTATO').AsString <> 'S') then
  begin
    Application.MessageBox('É necessário preencher ''S'' ou ''N'' para a pergunta de aceita contato!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TDBComboBox(Sender).CanFocus) then
      TDBComboBox(Sender).SetFocus;
    exit;
  end;

  TForm(pnPerguntasVeic.Parent).ModalResult := IDOK;
end;

procedure TfrmMovVeiculosCCIA.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
	try
    Screen.Cursor := crHourGlass;
    ComFat.vEstMoto.abreFormEntradaCCIA(1, ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString, true);

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;
        
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn46Click(Sender: TObject);
begin
  inherited;
  if not ComFat.ChecaCamposObrigatorios(true) then
  begin
    setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
    exit;
  end;
  if (trim(ComFat.dataset.FieldByName('MODELO').AsString) <> trim(ComFat.vSing.vMod)) then
  begin
    try
      if (ComFat.dataSet.State in [dsInsert, dsEdit]) then
        ComFat.dataSet.Post;
      ComFat.dataSet.ApplyUpdates(-1);
      ComFat.CommitaTransacao;
      if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
        ComFat.dataset.Edit;
      habilitaControlesParaEdicao(ComFat.vSing.vMod, ComFat.vSing.vTipoVenda, ComFat.vSing.vTipoVendaCFOP);
    finally
      Screen.Cursor := crDefault;
    end;
    ComFat.ImprimirContratoComando;
    if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
      ComFat.dataset.Edit;
  end
  else
    ComFat.ImprimirContratoComando;

end;

procedure TfrmMovVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
   BitBtn4.SetFocus;

  if not ComFat.ChecaCamposObrigatorios then
  begin
    setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
    exit;
  end;

  if not ComFat._VerificarEstoqueVeiculo(Memo1, 'S', 'S') then
  begin
    setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
    exit;
  end;

  if not ComFat.Post  then
  begin
    setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
    exit;
  end;
  inherited;
end;

procedure TfrmMovVeiculosCCIA.BitBtn52Click(Sender: TObject);
begin
  inherited;
  if ComFat.vEstMoto.abreFormSaidaCCIA(1, ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString, true, true) then
  begin
     ComFat.vSing.vTipoVenda := ComFat.dataset.FieldByName('TIPO_VENDA_V').AsString;
     ComFat.vSing.vTipo := vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString;
     ComFat.vSing.vNatureza := vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString;
     ComFat.vSing.vMod := vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString;
     ComFat.vSing.vTipoVendaCFOP := vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString;
     ComFat.vSing.vNomeContrato := vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString;
     ComFat.vSing.vAlterarEstoque := vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString;
     habilitaCampoComFat(vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString, ComFat.vEstMoto.dataSet.FieldByName('STATUS_USO').AsString, vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString, 'ALTERAR');
     _atualizarCombobox;
     FocarCampos;
  end;
end;

procedure TfrmMovVeiculosCCIA.BitBtn5Click(Sender: TObject);
begin
  if UpperCase(trim(BitBtn5.Caption)) = '&CONTINUAR' then
  begin
    vDadosIni.vPesquisa := '';
    if not ComFat._VerificarEstoqueVeiculo(ComFat.buscas, 2) then
    begin
      ComFat.Cancel;
      setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
    end
    else
     vDadosIni.vPesquisa := 'COM_FATCXLEDITOK'
  end;
  ComFat.Cancel;
  ComFat.RollBackTransacao;
  ComFat.Refresh;
  inherited;
end;


procedure TfrmMovVeiculosCCIA.BitBtn8Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      vNf := TNFCab.create;
      vNf.selecionaNotaFiscal(ComFat.dataSet.FieldByName('COD_NF').AsInteger);
      if vNf.dataSet.FieldByName('emissao_propria').AsString = 'S' then
        vNf.imprimeNotaFiscal
      else
        vNf.imprimeEspelhoNF;
      vNf.Free;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.btStatusNFeClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if ComFat.dataSet.IsEmpty then
     exit;

   if not (ComFat.MontarNFe(ComFat.dataSet.FieldByName('N_COMANDO').AsInteger, ComFat.dataSet.FieldByName('MODELO').AsString, ComFat.dataSet.FieldByName('NATUREZA').AsString)) then
   begin
      setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
      exit;
   end;

  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 289
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

procedure TfrmMovVeiculosCCIA.CheckBox3Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 289
  else
    GroupBox3.Height := 73;

  groupAvancadas.Visible := CheckBox3.Checked;
end;

procedure TfrmMovVeiculosCCIA.ComboBox11Exit(Sender: TObject);
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

procedure TfrmMovVeiculosCCIA.ComboBox12Enter(Sender: TObject);
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

procedure TfrmMovVeiculosCCIA.ComboBox12Exit(Sender: TObject);
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
        break;
      end;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmMovVeiculosCCIA.ComboBox4Exit(Sender: TObject);
begin
  inherited;
  if trim(TComboBox(Sender).Text) = 'MTUSADAS' then
  begin
      Label143.Visible := true;
      Edit3.Visible := true;

      Edit2.Top := 29;
      Label41.Top := Edit2.Top + 3;

      Edit3.Top := 53;
      Label143.Top := Edit3.Top + 3;

      EditHw5.Top := 77;
      Label55.Top := EditHw5.Top + 3;

      BitBtn16.Top := 102;
  end
  else
  begin
    Label143.Visible := false;
    Edit3.Visible := false;

    Edit2.Top := 32;
    Label41.Top := Edit2.Top + 3;

    EditHw5.Top := 58;
    Label55.Top := EditHw5.Top + 3;

    BitBtn16.Top := 87;
  end;
end;

procedure TfrmMovVeiculosCCIA.configuraEntrada;
begin
  DBEdit2.OnExit := exitChassi;
  DBEdit16.OnExit := exitChassi;
  DBEdit48.OnExit := exitChassi;
  DBEdit56.OnExit := exitChassi;

  DBEdit65.OnExit := exitChassi;
  DBEdit13.OnExit := exitChassi;
  DBEdit66.OnExit := exitChassi;
  DBEdit7.OnExit := exitChassi;

  DBEdit24.OnExit := exitCondPag;
  DBLookupComboBox7.OnExit := exitCondPag;


  DBEdit14.OnExit := exitCliente;
  DBEdit39.OnExit := exitCliente;
  DBEdit57.OnExit := exitCliente;
  DBEdit58.OnExit := exitCliente;
  DBEdit59.OnExit := exitCliente;
  DBEdit60.OnExit := exitCliente;
  DBEdit67.OnExit := exitCliente;

  DBEdit15.OnExit := exitCliente;
  DBEdit51.OnExit := exitCliente;
  DBEdit15.OnExit := exitCliente;

  DBEdit62.OnExit := exitColaborador;
  DBEdit8.OnExit := exitColaborador;
  DBEdit25.OnExit := exitColaborador;
  DBEdit37.OnExit := exitColaborador;
  DBEdit82.OnExit := exitColaborador;
  DBEdit83.OnExit := exitColaborador;
  DBEdit52.OnExit := exitColaborador;

  DBEdit26.OnExit := exitCFOP;
  DBLookupComboBox8.OnExit := exitCFOP;

  DBEdit12.OnExit := exitPrecoVenda;
  DBEdit81.OnExit := exitPrecoVenda;
  DBEdit5.OnExit := exitPrecoVenda;

  DBEdit10.OnExit := exitValorNota;
  DBEdit28.OnExit := exitValorNota;
  DBEdit29.OnExit := exitValorNota;
  DBEdit30.OnExit := exitValorNota;
  DBEdit31.OnExit := exitValorNota;
  DBEdit32.OnExit := exitValorNota;

//  DBEdit26.OnExit := exitValorNota;
  DBEdit53.OnExit := exitValorNota;

  DBEdit26.OnKeyDown := keydownCFOP;

  DBEdit2.OnKeyDown := keydownChassi;
  DBEdit16.OnKeyDown := keydownChassi;
  DBEdit48.OnKeyDown := keydownChassi;
  DBEdit56.OnKeyDown := keydownChassi;

  DBEdit65.OnKeyDown := keydownChassi;
  DBEdit13.OnKeyDown := keydownChassi;
  DBEdit66.OnKeyDown := keydownChassi;

  DBEdit14.OnKeyDown := keydownCliente;
  DBEdit39.OnKeyDown := keydownCliente;
  DBEdit57.OnKeyDown := keydownCliente;
  DBEdit58.OnKeyDown := keydownCliente;
  DBEdit59.OnKeyDown := keydownCliente;
  DBEdit60.OnKeyDown := keydownCliente;
  DBEdit67.OnKeyDown := keydownCliente;
  DBEdit15.OnKeyDown := keydownCliente;
  DBEdit51.OnKeyDown := keydownCliente;
  DBEdit15.OnKeyDown := keydownCliente;

  DBEdit62.OnKeyDown := keydownVendedor;
  DBEdit8.OnKeyDown := keydownVendedor;
  DBEdit25.OnKeyDown := keydownVendedor;
  DBEdit37.OnKeyDown := keydownVendedor;
  DBEdit82.OnKeyDown := keydownVendedor;
  DBEdit83.OnKeyDown := keydownVendedor;
  DBEdit52.OnKeyDown := keydownVendedor;

  BitBtn32.OnClick := bitbtnEditarObs;
  BitBtn33.OnClick := bitbtnEditarObs;
end;

procedure TfrmMovVeiculosCCIA.ConfigurarForm(pValor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    if (TelaCadastro <= 0 ) then
      exit;
      
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + 'TfrmPrincipalS', True);
      // Grava as informações do form
      Registro.WriteString('JanelasMaximizadas', pValor);
      Registro.WriteString('ExibirPropagandaFlash', 'N');
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmMovVeiculosCCIA.Copiarparareadetransferncia1Click(
  Sender: TObject);
begin
  inherited;
  Clipboard.AsText := DBGrid4.DataSource.DataSet.FieldByName(DBGrid4.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TfrmMovVeiculosCCIA.DBComboBox1Exit(Sender: TObject);
var
  flgl, i: integer;
  tpv: string;
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  flgl := 0;
  DBComboBox2.ItemIndex := 0;
  ComFat.dataset.FieldByName('TPREST').AsString := '0 - Não há';
  tpv := trim(ComFat.dataset.FieldByName('TIPO_V').AsString);
  for i := 0 to DBComboBox1.Items.Count - 1 do
  begin
    if tpv = trim(DBComboBox1.Items[i]) then
    begin
      dbcombobox1.Text := tpv;
      flgl := 1;
      break;
    end;
  end;
  if flgl = 0 then
  begin
    Application.MessageBox('Tipo de Venda Nao existe!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.setfocus;
    exit;
  end;
  ComFat.setarTipoVendas;
//  if (Trim(ComFat.dataSet.FieldByName('TIPO_V').AsString) <> 'PP') and (Trim(ComFat.dataSet.FieldByName('TIPO_V').AsString) <> 'AV') then
//  begin
//    Label138.Visible := true;
//    DBEdit78.Visible := true;
//    ComFat.dataset.FieldByName('TPREST').AsString := '3 - Reserva de Domínio';
//  end
//  else
//  begin
//    Label138.Visible := false;
//    DBEdit78.Visible := false;
//  end;
//  if Trim(ComFat.dataSet.FieldByName('TIPO_V').AsString) = 'CP' then
//  begin
//    Label137.visible := true;
//    DBEdit77.visible := true;
//    Label139.visible := true;
//    DBEdit79.visible := true;
//    if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
//      DBEdit77.setfocus;
//    DBMemo7.Lines.Add('RESERVA DE DOMINIO A FAVOR DE ' + vDadosIni.vEmp.vnomeEmpresa);
//    ComFat.dataSet.FieldByName('TPREST').AsString := '3 - Reserva de Domínio';
//  end
//  else
//  begin
//    Label137.visible := false;
//    DBEdit77.visible := false;
//    Label139.visible := false;
//    DBEdit79.visible := false;
//  end;
//  if Trim(ComFat.dataSet.FieldByName('TIPO_V').AsString) = 'CNH' then
//  begin
//    DBMemo7.Lines.Add('ALIENACAO FIDUCIARIA A FAVOR DE');
//    DBMemo7.Lines.Add('ADMINISTRADORA DE CONSORCIO NACIONAL HONDA LTDA');
//    ComFat.dataSet.FieldByName('TPREST').AsString := '1 - Alienação Fiduciária';
//  end;
end;

procedure TfrmMovVeiculosCCIA.DBComboBox6Exit(Sender: TObject);
begin
  inherited;
  if ComFat.dataSet.FieldByName('PRIMEIROVEICULO').AsString = 'N' then
  begin
    DBEdit75.Enabled := True;
    DBEdit76.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit75.CanFocus) then
      DBEdit75.SetFocus;
  end
  else if ComFat.dataSet.FieldByName('PRIMEIROVEICULO').AsString = 'S' then
  begin
    ComFat.dataSet.FieldByName('MARCAVEICULOANT').Value := Null;
    ComFat.dataSet.FieldByName('MODELOVEICULOANT').Value := Null;
    DBEdit75.Enabled := False;
    DBEdit76.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox7.CanFocus) then
      DBComboBox7.SetFocus;
  end
  else
  begin
    Application.MessageBox('É necessário responder S ou N para a pergunta!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TDBComboBox(Sender).CanFocus) then
      TDBComboBox(Sender).SetFocus;
  end;
end;

procedure TfrmMovVeiculosCCIA.DBEdit18Exit(Sender: TObject);
begin
if TDBEdit(Sender).text <> '' then
  ComFat.dataSet.FieldByName('VALOR_A_REC').AsFloat :=
    ComFat.dataSet.FieldByName('VALOBS1').AsFloat +
    ComFat.dataSet.FieldByName('VALOBS2').AsFloat +
    ComFat.dataSet.FieldByName('VALOBS3').AsFloat +
    ComFat.dataSet.FieldByName('VALOBS4').AsFloat +
    ComFat.dataSet.FieldByName('VALOBS5').AsFloat;
end;

procedure TfrmMovVeiculosCCIA.DBEdit19Exit(Sender: TObject);
begin
  inherited;
  if ComFat.dataSet.FieldByName('MESES_CONTRATO').AsFloat <= 0 then
  begin
   Application.MessageBox(Pchar('Favor informar a quantidade de meses do contrato.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
   exit;
  end;
end;

procedure TfrmMovVeiculosCCIA.DBEdit21Exit(Sender: TObject);
var
  Mes, Duracao: Integer;
begin
  try
    ComFat.dataSet.FieldByName('DATA_TERMINO').AsString :=
    DateToStr(StrToDate(ComFat.dataSet.FieldByName('DATA_INICIO').AsString) + ComFat.dataSet.FieldByName('MESES_CONTRATO').AsInteger * 30);
  except
  end;
end;

procedure TfrmMovVeiculosCCIA.DBEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COND_PAG');
      if vDadosIni.vPesquisa <> '' then
         ComFat.dataSet.FieldByName('CONDPAG_V').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      BitBtn25Click(Sender);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.DBEdit33Exit(Sender: TObject);
begin
  inherited;
 if (ComFat.dataSet.FieldByName('NATUREZA').AsString <> 'S') then
    exit;

 if ComFat.dataSet.FieldByName('PERC_RED_V').AsFloat > 0 then
   ComFat.dataSet.FieldByName('REDB_V').AsString := 'S'
 else
   ComFat.dataSet.FieldByName('REDB_V').AsString := '';
end;

procedure TfrmMovVeiculosCCIA.DBEdit34Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if (ComFat.dataSet.FieldByName('NATUREZA').AsString <> 'S') then
    exit;
    
  if (ComFat.dataSet.FieldByName('PERC_RED_V').AsFloat <> 0) and (ComFat.dataSet.FieldByName('ALICM_V').AsFloat = 0) then
  begin
    Application.MessageBox(Pchar('Favor colocar a base de cálculo por que este veículo possue redução de base'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then    
      TDBEdit(Sender).SetFocus;
  end
  else
  begin
    ComFat.CalcularRedLucro;
  end;
end;

procedure TfrmMovVeiculosCCIA.DBEdit53KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP_DESCRICAO');
      if vDadosIni.vPesquisa <> '' then
         ComFat.dataSet.FieldByName('DESC_NATOP').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.DBEdit94Exit(Sender: TObject);
begin
  inherited;
  DBEdit18Exit(Sender);
end;

procedure TfrmMovVeiculosCCIA.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.Field.Dataset.FieldbyName('N_COMANDO').AsInteger > 0)
  	and (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_V').AsString)) = 'CANCELADO') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (Column.Field.Dataset.FieldbyName('N_COMANDO').AsInteger > 0)
  	and ((UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_V').AsString)) = '')
  		or (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_V').AsString)) = 'ABERTO')) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clMenuHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmMovVeiculosCCIA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender);
end;

procedure TfrmMovVeiculosCCIA.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Classes.ssShift in Shift) and (Key = VK_TAB) then
  begin
   if (Self.Enabled) and (Self.Visible) and (BitBtn20.CanFocus) then
     BitBtn20.SetFocus;
  end
  else if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmMovVeiculosCCIA.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_TAB then
  begin
    if (Self.Enabled) and (Self.Visible) and (pnCondPag.CanFocus) then
      pnCondPag.SetFocus;
  end;
end;

procedure TfrmMovVeiculosCCIA.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($008C9A9A);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_RES').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($008F7C3B);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmMovVeiculosCCIA.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn22.Click
  else if Key = VK_ESCAPE then
    BitBtn34.Click
  else if Key = VK_TAB then
  begin
    if (Self.Enabled) and (Self.Visible) and (Panel14.CanFocus) then
      Panel14.SetFocus;
  end;
end;

procedure TfrmMovVeiculosCCIA.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;


procedure TfrmMovVeiculosCCIA.DBMemo17KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  key := #0;
end;

procedure TfrmMovVeiculosCCIA.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('EST_MOTO', ' AND (COALESCE(STATUS_ESTOQUE, '''') =''S'') ' +
          ' AND (TRIM(COALESCE(POSICAO, ''VIVO'')) <> ''MORTO'') ', 'Consultar Veículos');
      if vDadosIni.vPesquisa <> '' then
        Edit3.Text := vDadosIni.vPesquisaChassi;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.EditHw4Exit(Sender: TObject);
begin
  inherited;
  if (StrToFloat(Format('%0.2f', [TEditHw(Sender).AsValue])) < StrToFloat(Format('%0.2f', [ComFat.vminNF]))) or (StrToFloat(Format('%0.2f', [TEditHw(Sender).AsValue])) >
    StrToFloat(Format('%0.2f', [ComFat.vmaxNF]))) then
  begin
    Application.MessageBox('Valor da NF fora da Faixa Estabelecida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TEditHw(Sender).CanFocus) then
      TEditHw(Sender).SetFocus;
  end;
end;

procedure TfrmMovVeiculosCCIA.exitCFOP(Sender: TObject);
var
 vPrecCusto: Double;
 cfop, vTemp: string;
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if not buscarNaturezaOp then
    exit;
      
  ComFat.checarRegraCfopCST;
  if (ComFat.dataSet.FieldByName('NATOP_V').AsInteger > 0) and (ComFat.vSing.vTipoVendaCFOP <> 'I') then
    if (ComFat.vSing.vNatureza = 'E') and (not ComFat.dataSet.FieldByName('COD_CLI_VENDE').IsNull) then
    begin
      if not ComFat.vNaturezaOp.buscarNaturezaOp(ComFat.vSing.vTipoVendaCFOP, ComFat.vSing.vNatureza,
      	ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger,
        ComFat.dataSet.FieldByName('NATOP_V').AsInteger, ComFat.vSing.vTipoVenda) then
      begin
        cfop := IntToStr(Trunc(ComFat.dataSet.FieldByName('NATOP_V').AsFloat));
        if (ComFat.dataSet.FieldByName('NATUREZA').AsString = 'E') then
        begin
           if (cfop[1] <> '1') and (cfop[1] <> '2') and (cfop[1] <> '3') then
             vTemp := 'CFOP de entrada deve iniciar em 1, 2 ou 3!'
           else if (vDadosIni.vEmp.vCodigo_Uf <> ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)
           and (cfop[1] = '1') then
             vTemp := 'CFOP não encontrado para está operação ou ' +
               'CFOP de entrada de fora do estado não deve iniciar em 1!'
           else if (vDadosIni.vEmp.vCodigo_Uf = ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)
           and (cfop[1] = '2') then
             vTemp := 'CFOP não encontrado para está operação ou ' +
               'CFOP de entrada para dentro do estado não deve iniciar em 2!';
           Application.MessageBox(PChar(vTemp), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
           if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
             DBEdit26.SetFocus;
           exit;    
        end;
      end
    end
    else if (ComFat.vSing.vNatureza = 'S') and (not ComFat.dataSet.FieldByName('CLIENTES_V').IsNull) then
    begin
      if not ComFat.vNaturezaOp.buscarNaturezaOp(ComFat.vSing.vTipoVendaCFOP, ComFat.vSing.vNatureza,
      	ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger,
        ComFat.dataSet.FieldByName('NATOP_V').AsInteger, ComFat.vSing.vTipoVenda) then
        begin
           if (cfop[1] <> '5') and (cfop[1] <> '6') and (cfop[1] <> '7') then
             vTemp := 'CFOP de saída deve iniciar em 5, 6 ou 7!'
           else if (vDadosIni.vEmp.vCodigo_Uf <> ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)
            and (cfop[1] = '5') then
             vTemp := 'CFOP não encontrado para está operação ou ' +
               'CFOP de saída para fora do estado não deve iniciar em 5!'
           else if (vDadosIni.vEmp.vCodigo_Uf = ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)
           and (cfop[1] = '6') then
             vTemp := 'CFOP não encontrado para está operação ou ' +
               'CFOP de saída para dentro do estado não deve iniciar em 6!';
           Application.MessageBox(PChar(vTemp), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
           if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
             DBEdit26.SetFocus;
           exit;
        end;
    end;
  ComFat.PrecoTabela(ComFat.buscas);
  ComFat.CalcularRedLucro;
  exitValorNota(Sender);
  ComFat.vCFOPOld := ComFat.dataSet.FieldByName('NATOP_V').AsFloat;
end;

procedure TfrmMovVeiculosCCIA.exitChassi(Sender: TObject);
var
 pTipo: Integer;
begin
 try
   if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
      Exit;

    if ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0 then
    begin
      if not ComFat.vEstMoto.BuscarEstMoto(ComFat, ComFat.dataSet.Fieldbyname('COD_ESTMOTO').AsString, 0, ComFat.dataSet.Fieldbyname('PLACAV').AsString, ComFat.dataSet.Fieldbyname('CHASSIV').AsString) then
      begin
        if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
          TDBEdit(Sender).SetFocus;
        exit;
      end;
    end
    else
    begin
      if trim(ComFat.dataSet.Fieldbyname('PLACAV').AsString) <> '' then
        pTipo := 1
      else
        pTipo := 2;

        if not ComFat.vEstMoto.BuscarEstMoto(ComFat, TDBEdit(sender).Text, pTipo) then
        begin
          if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
          	TDBEdit(Sender).SetFocus;
          exit;
        end;
    end;

    if ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0 then
    begin
      if (ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0)
      and (ComFat.dataSet.FieldByName('NATOP_V').AsFloat > 0) then
       if buscarNaturezaOp then
         if not ComFat._VerificarEstoqueVeiculo(Memo1, ComFat.dataSet.Fieldbyname('ALTERA_ESTOQUE_CFOP').AsString) then
         begin
           setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
           exit;
         end;

      ComFat.existeNotaFiscalDeEntrada(ComFat.vEstMoto.dataSet.Fieldbyname('COD_NF').AsInteger);

      memo1.Clear;
      memo1.lines.Add('MARCA....: ' + ComFat.vEstMoto.dataSet.Fieldbyname('MARCAEST').asstring);
      memo1.lines.Add('MODELO...: ' + ComFat.vEstMoto.dataSet.fieldbyname('DESCRICAO_VERSAOEST').asstring);
      memo1.lines.Add('ANO FAB..: ' + ComFat.vEstMoto.dataSet.fieldbyname('ANO_FABEST').asstring);
      memo1.lines.Add('ANO MOD..: ' + ComFat.vEstMoto.dataSet.fieldbyname('ANO_MODEST').asstring);
      memo1.lines.Add('PLACA....: ' + ComFat.vEstMoto.dataSet.fieldbyname('PLACAEST').asstring);
      memo1.lines.Add('COR......: ' + ComFat.vEstMoto.dataSet.fieldbyname('COREST').asstring);
    end;
    exitValorNota(Sender);
 finally
   ComFat.verplanopag(4);
 end;
end;

procedure TfrmMovVeiculosCCIA.exitCliente(Sender: TObject);
var
  vCliente: TCadClientes;
  vTemp: string;
  vcfop: string;
  vatualizarcfop: boolean;
  vstatusestoque: string;
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger <= 0 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
        ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
          vDadosIni.pesquisaRapida('CLIENTES', ' ', 'Consulta de Cliente')
      else if (TDBEdit(Sender).Field.FieldName) = 'COD_CONCESS' then
        ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
          vDadosIni.pesquisaRapida('CLIENTES', ' ', //AND ((TIPO <> ''C'') OR (TIPO IS NULL))  ',
          vDadosIni.retornoPorCondicao(trim(ComFat.dataSet.FieldByName('TIPO').AsString) = 'CFT',
          'Consulta de Proprietário', 'Consulta de Concessionária'))
      else if (TDBEdit(Sender).Field.FieldName) = 'COD_INTERMED' then
        ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
          vDadosIni.pesquisaRapida('CLIENTES', ' ', 'Consulta de Intermediador')
      else if (TDBEdit(Sender).Field.FieldName) = 'COD_CLI_VENDE' then
      begin
         if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'E' then
           ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
            vDadosIni.pesquisaRapida('CLIENTES', ' ', 'Consulta de Cliente Vendedor')
         else
           ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
             vDadosIni.pesquisaRapida('CLIENTES', ' ', //AND ((TIPO <> ''C'') OR (TIPO IS NULL)) ',
             vDadosIni.retornoPorCondicao(trim(ComFat.dataSet.FieldByName('TIPO').AsString) = 'CFT',
             'Consulta de Proprietário', 'Consulta de Cliente Vendedor'));
      end;
      if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
        TDbedit(sender).SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger > 0 then
  begin
    if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
    begin
      if not ComFat.vClienteComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger) then
      begin
        if (ComFat.vSing.vMod = 'CFT') then
          Application.MessageBox('Cliente não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
        else if (Comfat.vSing.vMod = 'CTRVNDCONS') then
          Application.MessageBox('Consignante não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
        else
          Application.MessageBox('Comprador não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);

        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).SetFocus;
        exit;
      end;
    end
    else if (TDBEdit(Sender).Field.FieldName) = 'COD_CLI_VENDE' then
    begin
      if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'E' then
      begin
        if not ComFat.vClienteVendComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger) then
        begin
          Application.MessageBox('Cliente Vendedor não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
            TDbedit(sender).SetFocus;
          exit;
        end;
      end
      else if not ComFat.vClienteVendComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger, 'E') then
      begin
        vTemp := vDadosIni.retornoPorCondicao(trim(ComFat.dataSet.FieldByName('TIPO').AsString) = 'CFT',
         'Proprietário não encontrado!', 'Cliente Vendedor não encontrado!');

        Application.MessageBox(PChar(vTemp), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).SetFocus;
        exit;
      end;
    end
    else if (TDBEdit(Sender).Field.FieldName) = 'COD_CONCESS' then
    begin
      if not ComFat.vConcessionariaComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger, 'E') then
      begin
        vTemp := vDadosIni.retornoPorCondicao(trim(ComFat.dataSet.FieldByName('TIPO').AsString) = 'CFT',
        'Proprietário não encontrado!', 'Concessionária não encontrado!');

        Application.MessageBox(PChar(vTemp), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).SetFocus;
        exit;
      end;
    end
    else if (TDBEdit(Sender).Field.FieldName) = 'COD_INTERMED' then
    begin
      if not ComFat.vIntermediadorComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger) then
      begin
        Application.MessageBox('Intermediador não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).SetFocus;
        exit;
      end;
    end
  end;

  if trim(ComFat.dataSet.FieldByName('STATUS_V').AsString) <> 'ABERTO' then //ComFat.dataSet.State <> dsInsert then
    exit;

//  if ComFat.dataSet.FieldByName('NATUREZA').AsString <> 'S' then
//   exit;

  if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'S' then
    if ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger > 0 then
    begin
      if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
      begin
        if not ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_FATURAMENTO').IsNull then
          if ComFat.vClienteComFat.faturamentoBarrado(
            ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger) then
          begin
            if Application.MessageBox('Deseja continuar a venda?', 'Confirmação', MB_YESNO +
              MB_DEFBUTTON1) = mrYes then
  //          begin
  //            if not vDadosIni.PesqPros('VND049', 'LIBERAR', ComFat.dataSet.FieldByName('CLIENTES_V').asstring + ' ' +
  //              ComFat.vClienteComFat.dataSet.FieldByName('NOME_CLIENTE').AsString, 'COM_FAT',
  //              ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, True) then
  //            begin
  //              if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
  //                TDbedit(sender).SetFocus;
  //              Exit;
  //            end;
  //          end
            else
            begin
              if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
                TDbedit(sender).SetFocus;
              Exit;
            end;
          end;
      end;
    end;

  if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'S' then
    if ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger > 0 then
    begin
      if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
        if ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger <> strtoint(vDadosIni.vCliente.vCodClientePadrao) then
        begin
          vCliente := TCadClientes.create;
          vCliente.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger);

          if vCliente.SituacaoDeCaixa(false, true) = false then
          begin
            if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
              TDbedit(sender).SetFocus;
            exit;
          end;

          if not vCliente.formClienteAberto then
          begin
            vCliente.Free;
            vCliente := nil;
          end;
        end;
    end;

  if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'S' then
    if ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger > 0 then
    begin
      if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
        if ComFat.vClienteComFat.limiteDeCreditoEstouradoFechamento(ComFat.dataSet.FieldByName('VALOR_A_REC').AsCurrency) then
        begin
          if not vDadosIni.PesqPros('VND048', 'LIBERAR', 'Cliente:' +
            ComFat.dataSet.FieldByName('CLIENTES_V').asstring, 'COM_FAT', ComFat.dataSet.FieldByName('N_COMANDO').asstring,
            ComFat.buscas, true) then
          begin
            if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
              TDbedit(sender).SetFocus;
            Exit;
          end;

          if Application.MessageBox(pchar('Deseja continuar a venda?'), 'Informação',
            MB_ICONQUESTION + MB_YESNO) = IDNO then
          begin
            if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
              TDbedit(sender).SetFocus;
            Exit;
          end;
        end;
    end;

  if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'S' then
    if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
      if (ComFat.dataSet.FieldByName('CLIENTES_V').AsInteger > 0) and
        (vDadosIni.vEmp.vEditarCliVenda = 'S') then
      begin
        try
          Screen.Cursor := crHourGlass;
          vDadosIni.vPesquisa := ComFat.dataSet.FieldByName('CLIENTES_V').AsString;
          ComFat.cadCliente(2);
        finally
          Screen.Cursor := crDefault;
        end;
      end;

    if ComFat.vSing.vNatureza = 'E' then
    begin
      if not ComFat.dataSet.FieldByName('COD_CLI_VENDE').IsNull then
      begin
        if ComFat.vSing.vTipoVendaCFOP <> 'I' then
        begin
        	vatualizarcfop := false;
        	vcfop := FloatToStr(ComFat.dataSet.FieldByName('NATOP_V').AsFloat);

          if (Comfat.dataSet.Fieldbyname('COD_CLI_VENDE').AsInteger > 0)
          	and (vDadosIni.vEmp.vCodigo_Uf = ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) and (vcfop[1] <> '1') then
          	vatualizarcfop := true
          else if (Comfat.dataSet.Fieldbyname('COD_CLI_VENDE').AsInteger > 0)
          	and (vDadosIni.vEmp.vCodigo_Uf <> ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) and (vcfop[1] <> '2') then
            vatualizarcfop := true;

          if vatualizarcfop then
          begin
            if ComFat.vNaturezaOp.buscarNaturezaOp(ComFat.vSing.vTipoVendaCFOP, ComFat.vSing.vNatureza,
              ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger, ComFat.vSing.vTipoVenda) then
            begin
              ComFat.dataSet.FieldByName('NATOP_V').AsFloat := ComFat.vNaturezaOp.buscas.FieldByName('CODIGO_NOP').AsFloat;
              ComFat.dataSet.FieldByName('DESC_NATOP').AsString := ComFat.vNaturezaOp.buscas.FieldByName('DESCRICAO_NOP').AsString;
              ComFat.vCFOPOld := ComFat.dataSet.FieldByName('NATOP_V').AsFloat;
            end;
          end;
        end;
      end;
    end
    else
    begin
      if not ComFat.dataSet.FieldByName('CLIENTES_V').IsNull then
      begin
        if ComFat.vSing.vTipoVendaCFOP <> 'I' then
        begin
        	vatualizarcfop := false;
          vstatusestoque := '';
          vcfop := FloatToStr(ComFat.dataSet.FieldByName('NATOP_V').AsFloat);
          
          if (Comfat.dataSet.Fieldbyname('CLIENTES_V').AsInteger > 0)
          	and (vDadosIni.vEmp.vCodigo_Uf = ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) and (vcfop[1] <> '5') then
          	vatualizarcfop := true
          else if (Comfat.dataSet.Fieldbyname('CLIENTES_V').AsInteger > 0)
          	and (vDadosIni.vEmp.vCodigo_Uf <> ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) and (vcfop[1] <> '6') then
            vatualizarcfop := true
          else if (ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0)
          	and (trim(ComFat.vEstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString) <> trim(ComFat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString)) then
          begin
		        vatualizarcfop := true;
            vstatusestoque := trim(ComFat.vEstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString);
          end
          else if (ComFat.dataSet.FieldByName('NATOP_V').AsFloat > 0)
          	and	(vDadosIni.IfThen(trim(ComFat.vNaturezaOp.dataSet.FieldByName('ALT_EST').AsString) = 'N', 'N', 'S') <> trim(ComFat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString)) then
          begin
            vatualizarcfop := true;
            vstatusestoque := trim(ComFat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString);
          end;

          if vatualizarcfop then
          begin
            if ComFat.vNaturezaOp.buscarNaturezaOp(ComFat.vSing.vTipoVendaCFOP, ComFat.vSing.vNatureza,
              ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger, ComFat.vSing.vTipoVenda, vstatusestoque) then
            begin
              ComFat.dataSet.FieldByName('NATOP_V').AsFloat := ComFat.vNaturezaOp.buscas.FieldByName('CODIGO_NOP').AsFloat;
              ComFat.dataSet.FieldByName('DESC_NATOP').AsString := ComFat.vNaturezaOp.buscas.FieldByName('DESCRICAO_NOP').AsString;
              ComFat.vCFOPOld := ComFat.dataSet.FieldByName('NATOP_V').AsFloat;
            end;
          end;
        end;
      end;
    end;
end;

procedure TfrmMovVeiculosCCIA.exitColaborador(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger > 0 then
  begin
    if not ComFat.vColaborador.buscarColaborador(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger) then
    begin
      if (TDBEdit(Sender).Field.FieldName) = 'COVEND_V' then
        Application.MessageBox('Vendedor não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
      else if (TDBEdit(Sender).Field.FieldName) = 'COD_GERENTE' then
        Application.MessageBox('Gerente não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);

      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).SetFocus;
      exit;
    end;
    if (TDBEdit(Sender).Field.FieldName) = 'COVEND_V' then
    begin
       if not ComFat.vColaborador.buscarVendedor(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger) then
       begin
         Application.MessageBox('Usuário informado não é Vendedor!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
           TDBEdit(Sender).SetFocus;
       end;
    end
    else if (TDBEdit(Sender).Field.FieldName) = 'COD_GERENTE' then
    begin
       if not ComFat.vColaborador.buscarGerente(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).asinteger) then
       begin
         Application.MessageBox('Usuário informado não é Gerente!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
           TDBEdit(Sender).SetFocus;
       end;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.exitCondPag(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
  if (ComFat.vCodCondPagOld <> ComFat.dataSet.FieldByName('CONDPAG_V').AsInteger) then
    if vDadosIni.vCliente.vendaVistaClientesBarrados then
      if not ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_FATURAMENTO').IsNull then
        if ComFat.vClienteComFat.faturamentoBarrado(ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger, false) then
          if ComFat.dataSet.FieldByName('CONDPAG_V').AsInteger > 0 then
            if not vDadosIni.verificarControlesCondPagBarrados(ComFat.buscas,
              ComFat.dataSet.FieldByName('N_COMANDO').AsInteger, ComFat.dataSet.FieldByName('CLIENTES_V').AsInteger,
              ComFat.dataSet.FieldByName('CONDPAG_V').AsInteger, 'MOT') then
            begin
              if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
                TDBEdit(Sender).SetFocus;
              exit;
            end;

   ComFat.vCodCondPagOld := ComFat.dataSet.FieldByName('CONDPAG_V').AsInteger;
end;

procedure TfrmMovVeiculosCCIA.exitPrecoVenda(Sender: TObject);
begin
  if Comfat.vSing.vNatureza <> 'S' then
    exit;

  if vDadosIni.vUsarPlanoVeic = 'S' then
    exit;
    
  if not (Comfat.dataSet.State in [dsInsert, dsEdit]) then
    exit;

  if ComFat.dataSet.FieldByName('VALOR_REAL').AsFloat > 0 then   
    ComFat.dataSet.FieldByName('PRVEN_V').AsFloat :=
     ComFat.dataSet.FieldByName('VALOR_REAL').AsFloat - ComFat.dataSet.FieldByName('FRETE_V').AsFloat;
  exitValorNota(Sender);
end;

procedure TfrmMovVeiculosCCIA.exitValorNota(Sender: TObject);
begin
  if not (Comfat.dataSet.State in [dsInsert, dsEdit]) then
    exit;
    
   if (Comfat.dataSet.FieldByName('NATUREZA').AsString = 'S') then
     ComFat.dataSet.FieldByName('VALTOT_V').AsFloat := (ComFat.dataSet.FieldByName('PRVEN_V').AsFloat +
     ComFat.dataSet.FieldByName('FRETE_V').AsFloat + ComFat.dataSet.FieldByName('SEGURO_V').AsFloat +
     ComFat.dataSet.FieldByName('OUTDESP_V').AsFloat)
   else
     ComFat.dataSet.FieldByName('VALTOT_V').AsFloat := (ComFat.dataSet.FieldByName('VALOR_REAL').AsFloat +
     ComFat.dataSet.FieldByName('FRETE_V').AsFloat + ComFat.dataSet.FieldByName('SEGURO_V').AsFloat +
     ComFat.dataSet.FieldByName('OUTDESP_V').AsFloat);
end;

procedure TfrmMovVeiculosCCIA.FocarCampos;
begin
  if Comfat.vSing.vMod = 'CFT' then
  begin
    if (Self.Enabled) and (Self.Visible) and (TabSheet_Venda.CanFocus) then    
      TabSheet_Venda.SetFocus;
  end
  else if (Comfat.vSing.vMod = 'CTRCOMPRA') or (Comfat.vSing.vMod = 'CTRENTCONS') then
  begin
    if (Self.Enabled) and (Self.Visible) and (TabSheet_ContratoCompra.CanFocus) then
      TabSheet_ContratoCompra.SetFocus;
  end
  else if (Comfat.vSing.vMod = 'CTRVND') or (Comfat.vSing.vMod = 'CTRRESDOM') or (Comfat.vSing.vMod = 'CTRINTERM') then
  begin
    if (Self.Enabled) and (Self.Visible) and (TabSheet_ContratoVndResDomInterm.CanFocus) then    
      TabSheet_ContratoVndResDomInterm.SetFocus;
  end
  else if Comfat.vSing.vMod = 'CTRVNDCONS' then
  begin
    if (Self.Enabled) and (Self.Visible) and (TabSheet_ContratoVndConsignado.CanFocus) then
      TabSheet_ContratoVndConsignado.SetFocus;
  end;
  Perform(WM_NEXTDLGCTL, 0, 0);
//  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmMovVeiculosCCIA.FocarEditarChassi;
var
 z, i: Integer;
begin
  i := 0;
  if Comfat.vSing.vMod = 'CFT' then
    TabSheet_Venda.Show
  else if (Comfat.vSing.vMod = 'CTRCOMPRA') or (Comfat.vSing.vMod = 'CTRENTCONS') then
    TabSheet_ContratoCompra.Show
  else if (Comfat.vSing.vMod = 'CTRVND') or (Comfat.vSing.vMod = 'CTRRESDOM') or (Comfat.vSing.vMod = 'CTRINTERM') then
    TabSheet_ContratoVndResDomInterm.Show
  else if Comfat.vSing.vMod = 'CTRVNDCONS' then
    TabSheet_ContratoVndConsignado.Show;

  for z := 0 to ComponentCount - 1 do
  begin
    if (z = ComponentCount -1) then
      break;

    if (Components[z] is TDBEdit) then
    begin
      if (trim(TDBEdit(Components[z]).DataField) = 'CHASSIV') then
      begin
        TDBEdit(Components[z]).Enabled := true;
        if (TDBEdit(Components[z]).CanFocus) then
        begin
          i := z;
          break;
        end;
      end;
    end;
  end;

  for z := 0 to ComponentCount - 1 do
  begin
    if (z = ComponentCount -1) then
      break;

    if (Components[z] is TDBEdit) then
    begin
      if trim(Comfat.dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U' then
        if (trim(TDBEdit(Components[z]).DataField) = 'PLACAV') then
        begin
          TDBEdit(Components[z]).Enabled := true;
          if (TDBEdit(Components[z]).CanFocus) then
            break;
        end;
    end;
  end;

  BitBtn25.enabled := true;
  BitBtn28.enabled := true;
  BitBtn14.enabled := true;
  BitBtn38.enabled := true;

  if i > 0 then
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(Components[i]).CanFocus) then
      TDBEdit(Components[i]).SetFocus;
end;

procedure TfrmMovVeiculosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;

  if (ComFat <> nil) then
  begin
    ComFat.Cancel;
    ComFat.RollBackTransacao;
  end;

  ComFat.free;
  ComFat := nil;

  Action := caFree;
  if (frmMovVeiculosCCIA <> nil) then
    frmMovVeiculosCCIA := nil;
end;

procedure TfrmMovVeiculosCCIA.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if vFechar then
   exit;

  inherited;
end;

procedure TfrmMovVeiculosCCIA.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  btStatusNFe.Visible := True;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATCXL' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 11;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATCXLEDIT' then
  begin
    BitBtn6.Visible :=False;
    BitBtn5.Caption := '&Continuar';
    BitBtn5.Hint := 'Continuar';
    BitBtn5.Glyph := BitBtn4.Glyph;
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 12;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
    btStatusNFe.Visible := False;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATEDIT' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 8;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FAT' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3) = 'U' then
      vDadosIni.vTipoForm := 7
    else
      vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COMFAT_EQUIP' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 9;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATEABRIR' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 10;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ComFat := TComFat.create;
  ComFat.abreComFat;
  tsCondicoes.TabVisible := false;
  tsPesquisaVeic.TabVisible := false;
  TabSheet_Pesquisa.TabVisible := false;
  TabSheet_ContratoCompra.TabVisible := false;
  TabSheet_ContratoVndResDomInterm.TabVisible := false;
  TabSheet_ContratoVndConsignado.TabVisible := false;
  TabSheet_Venda.TabVisible := false;
  TabSheet_DadosdaNota.TabVisible := false;
  TabSheet3.TabVisible := false;
  tsPerguntasVeic.TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmMovVeiculosCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PageControl1.ActivePage = TabSheet2  then
    if Key = VK_F11 then
      ckEntrada.Checked := not ckEntrada.Checked
    else if Key = VK_F12 then
      ckSaida.Checked := not ckSaida.Checked
end;

procedure TfrmMovVeiculosCCIA.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;
    
  vFechar := False;

  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATCXL' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 11;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATCXLEDIT' then
  begin
    BitBtn6.Visible :=False;
    BitBtn5.Caption := '&Continuar';
    BitBtn5.Hint := 'Continuar';
    BitBtn5.Glyph := BitBtn4.Glyph;
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 12;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
    btStatusNFe.Visible := False;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATEDIT' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 8;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FAT' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3) = 'U' then
      vDadosIni.vTipoForm := 7
    else
      vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COMFAT_EQUIP' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 9;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATEABRIR' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 10;
    vDadosIni.vModalOuChild := 'M';
    frmMovVeiculosCCIA := TfrmMovVeiculosCCIA(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmVeiculosCCIA.dsComFat;
    if vCriou = 0 then
    begin
      inherited;
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    end;
  end;

  leConfiguracoesFormRegistro;

//  MaskEdit1.Visible := false;
//  MaskEdit2.Visible := false;
//  CheckBox1.visible := false;
  configuraEntrada;
  ConfigurarForm('N');

//  ConfigurarForm('S');
  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "VEI065" PERMITIR CADASTRAR VEICULO COM MESMO CHASSI SEM ESTOQUE' + #13 +
    'Processo "VEI066" PERMITIR VENDA VL.REAL < VL.NF' + #13 +
    'Processo "VEI068" LIBERAR VENDA FORA PEPS' + #13 +
    'Processo "VEI070" EMISSAO DE NF DE DEMONSTRACAO' + #13 +
    'Processo "VEI071" PERMITIR CANCELAMENTO DE CONTRATO SEM O CANCELAMENTO DA NOTA FISCAL' + #13 +
    'Processo "VEI086" CANCELAMENTO DE NF RECEBIDAS' + #13 +
    'Processo "VEI087" CANCELAMENTO NF VEICULOS' + #13 +
    'Processo "VEI097" PERMITIR VENDA DE VEICULO < PRECO MINIMO' + #13 +
    'Processo "VEI098" PERMITIR VENDA DE VEICULO SEM PRECO MINIMO DEFINIDO' + #13 +
    'Processo "VEI099" CONFIRM RETORNO DEMONSTRACAO SEM NF ENTRADA DE OUTRA EMPRESA' + #13 +
    'Processo "VEI167" DESABILITAR MENSAGEM DEMONSTRACAO PARA VEICULO RETORNADO ' + #13 +
    'Processo "VEI168" HABILITAR RECEBIMENTO DAS SAÍDAS DE VEÍCULOS PELO FINANCEIRO' + #13 +
    'Processo "VND048" LIBERAR VENDA CLIENTE LIMITE ESTOURADO' + #13 +
    'Processo "VND049" LIBERAR VENDA CLIENTE FATURAMENTO BARRADO' + #13 +
    'Processo "VND157" LIBERAR VENDA PRA CLIENTE COM DEBITO' + #13 +
    'Processo "VND048" LIBERAR VENDA CLIENTE LIMITE ESTOURADO' + #13 +
    'Processo "VND049" LIBERAR VENDA CLIENTE FATURAMENTO BARRADO' + #13 +
    'Processo "VND233" LIBERAR CONDICOES DE PAGAMENTO A VISTA PARA CLIENTE COM FATURAMENTO BARRADO' + #13 +
    'Processo "VND234" LIBERAR FORMAS DE PAGAMENTO A VISTA PARA CLIENTE COM FATURAMENTO BARRADO' + #13 +
    'Processo "VND235" LIBERAR FORMAS DE PAGAMENTO NÃO DEFINIDAS PARA CLIENTE COM FATURAMENTO BARRADO';

   imgInformationTipoOP.Hint := 'TIPO OP' + #13 + #13 +
    'A - ATIVO IMOBILIZADO' + #13 +
    'C - CONSIGNAÇÃO' + #13 +
    'D - DEMONSTRAÇÃO DE MERCADORIAS' + #13 +
    'E - DEVOLUÇÃO' + #13 +
    'I - INTERMEDIAÇÃO' + #13 +
    'O - OUTRAS OPERAÇÕES' + #13 +
    'R - RETORNO DE DEMONSTRAÇÃO' + #13 +
    'T - TRANSFERÊNCIA' + #13 +
    'V - MERCADORIA ADQUIRIDA';

  if (TelaCadastro <= 0) and (vDadosIni.vSistema <> 'Cxl') then
  	ComFat.verificarNotasFiscaisSuzuki;
  
  if (TelaCadastro = 6) or (TelaCadastro = 7) then
  begin
    if (TelaCadastro = 6) then
      NovoComando('N')
    else
      NovoComando('U');
  end
  else if (TelaCadastro = 8) or (TelaCadastro = 12) then
  begin
    ComFat.abreComFat(vDadosIni.vDtSetTmp.FieldByName('N_COMANDO').AsInteger);
    if not ComFat.dataSet.IsEmpty then
    begin
      ComFat.vEstMoto.AbreEstMoto(ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger, ComFat.dataSet.FieldByName('CHASSIV').AsString);
      if (TelaCadastro = 12) then
        if not ComFat._VerificarRecebimento(vDadosIni.vDtSetTmp.FieldByName('N_COMANDO').AsInteger) then
        begin
          ComFat.dataSet.Cancel;
          vFechar := True;
          frmMovVeiculosCCIA.fechar := True;
          PostMessage(frmMovVeiculosCCIA.Handle, WM_CLOSE, 0, 0);
        end;
      SpeedButton1Click(Sender);
      if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COM_FATCXLEDIT' then
        if (Self.Enabled) and (Self.Visible) and (BitBtn5.CanFocus) then
          BitBtn5.SetFocus;
    end;
  end
  else if (TelaCadastro = 9) then
  begin
   try
     if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
     begin
       Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
       vDadosIni.fechaStatusProcessamento;
       ComFat.dataSet.Cancel;
       frmMovVeiculosCCIA.fechar := True;
       PostMessage(frmMovVeiculosCCIA.Handle, WM_CLOSE, 0, 0);
     end;
     ComFat.vEstMoto.AbreEstMoto(StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2)));
     if not ComFat.vEstMoto.dataSet.IsEmpty then
     begin
       ComFat.abreComFat(StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2)), 1);
       if (not ComFat.dataSet.IsEmpty)
        and (trim(ComFat.dataSet.FieldByName('STATUS_V').AsString) <> 'CANCELADO') then
         SpeedButton1Click(Sender)
       else
       begin
         ComFat.vEstMoto.PreencherDatasetvDadosIni(ComFat.vEstMoto.dataSet, false, 'A', false);
         if vDadosIni.vDtSetTmp.State <> dsEdit then
           vDadosIni.vDtSetTmp.Edit;
         vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CFT';
         vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
         vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CFT';
         vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'A';
         vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando Faturamento';
         vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
         vDadosIni.vDtSetTmp.Post;
         NovoComando(ComFat.vEstMoto.dataSet.FieldByName('STATUS_USO').AsString);
       end;
     end
     else
     begin
      Application.MessageBox(Pchar('Veículo não encontrado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      ComFat.dataSet.Cancel;
      frmMovVeiculosCCIA.fechar := True;
      PostMessage(frmMovVeiculosCCIA.Handle, WM_CLOSE, 0, 0);
     end;
   finally
     vDadosIni.vPesquisa :='';
   end;
  end
  else if (TelaCadastro = 10) then
  begin
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    MaskEdit3.Visible := True;
    MaskEdit3.Text := vDadosIni.vDtSetTmp.FieldByName('N_COMANDO').AsString;
    ComboBox1.Text := ComFat.dataSet.FieldByName('N_COMANDO').DisplayLabel;
    ComboBox3.Text := 'Igual';
    BitBtn1Click(Sender);
  end;

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmMovVeiculosCCIA.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(ckEntrada.Name, ckEntrada.Checked);
    _GravaConfiguracoesBoolean(ckSaida.Name, ckSaida.Checked);
  end;

	if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
    _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);

    _GravaConfiguracoesBoolean(ckCtrCompra.Name, ckCtrCompra.Checked);
    _GravaConfiguracoesBoolean(ckCtrEntCons.Name, ckCtrEntCons.Checked);

  	_GravaConfiguracoesBoolean(ckCFTVnd.Name, ckCFTVnd.Checked);
    _GravaConfiguracoesBoolean(ckCtrVnd.Name, ckCtrVnd.Checked);
    _GravaConfiguracoesBoolean(ckCtrVndCons.Name, ckCtrVndCons.Checked);
    _GravaConfiguracoesBoolean(ckCtrResDom.Name, ckCtrResDom.Checked);
    _GravaConfiguracoesBoolean(ckCtrInterm.Name, ckCtrInterm.Checked);
    _GravaConfiguracoesBoolean(ckCFTTransf.Name, ckCFTTransf.Checked);
    _GravaConfiguracoesBoolean(ckCFTDemonst.Name, ckCFTDemonst.Checked);
    _GravaConfiguracoesBoolean(ckCFTAtivo.Name, ckCFTAtivo.Checked);
    _GravaConfiguracoesBoolean(ckCFTDevolucao.Name, ckCFTDevolucao.Checked);
    _GravaConfiguracoesBoolean(ckCFTOutrasSaidas.Name, ckCFTOutrasSaidas.Checked);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
  end;
end;

procedure TfrmMovVeiculosCCIA.groupAdicionalExit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmMovVeiculosCCIA.habilitaCampoComFat(pModelo, pTipoVenda, pTipoOP, pOperacao: string);
begin
  if (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO')
   or (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'CANCELADO') then
     _habilitardesabilitarCampos
  else
    _habilitardesabilitarCampos(1);

  TabSheet_DadosdaNota.TabVisible := false;
  TabSheet_ContratoVndConsignado.TabVisible := false;
  TabSheet_Venda.TabVisible := false;
  TabSheet_ContratoCompra.TabVisible := false;
  TabSheet_ContratoVndResDomInterm.TabVisible := false;
  DBCheckBox5.Visible := true;

  Label110.Visible := false;
  Label113.Visible := false;
  DBEdit57.Visible := false;
  DBEdit60.Visible := false;
  DBEdit67.Visible := false;
  Label88.Visible := false;
  Label101.Visible := false;
  Label102.Visible := false;
  LabelSeq.Visible := false;
  CheckCadSeq.Visible := false;
  DBEdit41.Enabled := not ((ComFat.dataSet.FieldByName('NATUREZA').AsString= 'E') and (ComFat.dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0));
  DBEdit51.Visible := false;
  DBEdit52.Visible := false;
  DBLookupComboBox26.Visible := false;
  DBLookupComboBox29.Visible := false;
  DBLookupComboBox14.Visible := false;
  DBLookupComboBox23.Visible := false;
  DBLookupComboBox15.Visible := false;
  BitBtn24.Enabled := false;
  BitBtn26.Enabled := false;
  BitBtn13.Enabled := false;
  BitBtn10.Enabled := false;
  BitBtn46.Enabled := false;
  BitBtn30.Enabled := false;

  DBComboBox3.Clear;
  DBComboBox4.Clear;
  DBComboBox5.Clear;
  DBComboBox8.Clear;
  DBEdit1.Enabled := false;
  DBEdit23.Enabled := false;
  DBEdit28.Enabled := false;
//  DBEdit29.Enabled := false;
  DBEdit47.Enabled := false;
  DBEdit50.Enabled := false;
  DBEdit54.Enabled := false;
  DBEdit47.Enabled := false;
  DBEdit87.Enabled := false;
  DBEdit88.Enabled := false;
  DBEdit95.Enabled := false;
  DBEdit33.Enabled := (ComFat.dataSet.FieldByName('NATUREZA').AsString <> 'E') and (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'FECHADO')
   and (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'CANCELADO');
  DBEdit34.Enabled := (ComFat.dataSet.FieldByName('NATUREZA').AsString <> 'E') and (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'FECHADO')
   and (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'CANCELADO');
  DBEdit35.Enabled := false;
  DBEdit36.Enabled := false;
  DBEdit40.Enabled := false;
//  DBEdit53.Enabled := false;
  DBEdit61.Enabled := false;
  DBEdit63.Enabled := false;
  DBEdit64.Enabled := false;
  DBEdit74.Enabled := false;

  BitBtn33.Visible := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');
  BitBtn32.Visible := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');

  if pTipoVenda = 'N' then
  begin
    DBEdit7.Enabled := false;
    DBEdit65.Enabled := false;
    DBEdit13.Enabled := false;
    DBEdit66.Enabled := false;
    DBComboBox3.Items.Add('N - NOVO');
    DBComboBox4.Items.Add('N - NOVO');
    DBComboBox5.Items.Add('N - NOVO');
    DBComboBox8.Items.Add('N - NOVO');
  end
  else if pTipoVenda = 'U' then
  begin
    DBEdit7.Enabled := true;
    DBEdit65.Enabled := true;
    DBEdit13.Enabled := true;
    DBEdit66.Enabled := true;
    DBComboBox3.Items.Add('U - USADO');
    DBComboBox4.Items.Add('U - USADO');
    DBComboBox5.Items.Add('U - USADO');
    DBComboBox8.Items.Add('U - USADO');
  end;

  DBEdit2.enabled := (pOperacao = 'INSERIR');
  DBEdit48.enabled := (pOperacao = 'INSERIR');
  DBEdit56.enabled := (pOperacao = 'INSERIR');
  DBEdit16.enabled := (pOperacao = 'INSERIR');

  DBEdit7.enabled := (pOperacao = 'INSERIR') and (pTipoVenda = 'U');
  DBEdit65.enabled := (pOperacao = 'INSERIR') and (pTipoVenda = 'U');
  DBEdit13.enabled := (pOperacao = 'INSERIR') and (pTipoVenda = 'U');
  DBEdit66.enabled := (pOperacao = 'INSERIR') and (pTipoVenda = 'U');

  BitBtn25.enabled := (pOperacao = 'INSERIR');
  BitBtn28.enabled := (pOperacao = 'INSERIR');
  BitBtn14.enabled := (pOperacao = 'INSERIR');
  BitBtn38.enabled := (pOperacao = 'INSERIR');

  Bitbtn4.enabled := ((pOperacao = 'INSERIR') or (pOperacao = 'ALTERAR'));
  BitBtn12.Enabled := (pOperacao <> 'INSERIR');
  BitBtn13.Enabled := (pOperacao <> 'INSERIR');
  BitBtn20.Visible := vDadosIni.vUsarPlanoVeic = 'S';
  BitBtn20.enabled := ((pOperacao = 'INSERIR') or (pOperacao = 'ALTERAR'));

  BitBtn30.Enabled := pOperacao = 'ALTERAR';
  BitBtn51.Visible := vDadosIni.vUsarPlanoVeic = 'S';

  DBEdit5.Enabled := vDadosIni.vUsarPlanoVeic <> 'S';
  DBEdit6.Enabled := vDadosIni.vUsarPlanoVeic <> 'S';
  DBEdit12.Enabled := vDadosIni.vUsarPlanoVeic <> 'S';
  DBEdit51.Visible := pModelo = 'CFT';
  DBEdit52.Visible := pModelo = 'CFT';
  DBEdit57.Visible := (pModelo = 'CTRINTERM') or (pModelo = 'CTRRESDOM');
  DBEdit58.Visible := true;
  DBEdit59.Visible := (pModelo = 'CTRVND') or (pModelo = 'CTRVNDCONS') or (pModelo = 'CTRRESDOM') or
     ((pModelo = 'CTRINTERM') and (pTipoVenda = 'U'));
  DBEdit60.Visible := ((pModelo = 'CTRRESDOM') or (pModelo = 'CTRINTERM')) and (pTipoVenda = 'N');
  if ((pModelo = 'CFT') and (pTipoOP = 'I')) then
  begin
   if (pTipoVenda = 'N') then
   begin
     DBEdit67.DataField := 'COD_CONCESS';
     DBLookupComboBox15.DataField := 'COD_CONCESS';
     DBLookupComboBox15.ListSource := DtmVeiculosCCIA.dsConcessionariaComFat;
   end
   else
   begin
     DBEdit67.DataField := 'COD_CLI_VENDE';
     DBLookupComboBox15.DataField := 'COD_CLI_VENDE';
     DBLookupComboBox15.ListSource := DtmVeiculosCCIA.dsFornecedorComFat;
   end;
  end;
  Label88.Visible := ((pModelo = 'CFT') and (pTipoOP = 'I'));
  DBEdit67.Visible := ((pModelo = 'CFT') and (pTipoOP = 'I'));
  DBLookupComboBox15.Visible := ((pModelo = 'CFT') and (pTipoOP = 'I'));

  DBEdit80.Enabled := vDadosIni.vUsarPlanoVeic <> 'S';

  DBLookupComboBox14.Visible := pModelo = 'CFT';
  DBLookupComboBox23.Visible := pModelo = 'CFT';
  DBLookupComboBox26.Visible := (pModelo = 'CTRINTERM') or (pModelo = 'CTRRESDOM');
  DBLookupComboBox27.Visible := true;
  DBLookupComboBox28.Visible :=(pModelo = 'CTRVND') or (pModelo = 'CTRVNDCONS') or (pModelo = 'CTRRESDOM') or
     ((pModelo = 'CTRINTERM') and (pTipoVenda = 'U'));
  DBLookupComboBox29.Visible := ((pModelo = 'CTRRESDOM') or (pModelo = 'CTRINTERM')) and (pTipoVenda = 'N');

//  GroupBox6.Visible := pOperacao = 'ALTERAR';
  Label101.Visible := pModelo = 'CFT';
  Label102.Visible := pModelo = 'CFT';
  Label110.Visible := (pModelo = 'CTRINTERM') or (pModelo = 'CTRRESDOM');
  Label111.Visible := true;
  Label112.Visible :=  (pModelo = 'CTRVND') or (pModelo = 'CTRVNDCONS') or (pModelo = 'CTRRESDOM') or
     ((pModelo = 'CTRINTERM') and (pTipoVenda = 'U'));
  Label113.Visible := ((pModelo = 'CTRRESDOM') or (pModelo = 'CTRINTERM')) and (pTipoVenda = 'N');

  Panel16.Visible := vDadosIni.vUsarPlanoVeic <> 'S';

  if pOperacao = 'ALTERAR' then
  begin
    BitBtn4.Enabled := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'FECHADO') and
       (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'CANCELADO');
    BitBtn20.Enabled :=  (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'FECHADO') and
      (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'CANCELADO');
   GroupBox6.Visible := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'FECHADO') and
      (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) <> 'CANCELADO');
    BitBtn8.Enabled :=  (ComFat.dataSet.FieldByName('COD_NF').AsInteger > 0);
    BitBtn12.Enabled := (ComFat.dataSet.FieldByName('COD_NF').AsInteger > 0);
    BitBtn13.Enabled :=  (ComFat.dataSet.FieldByName('COD_NF').AsInteger > 0);
    if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'E' then
      btStatusNFe.Enabled := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO')
    else
    begin
      if vDadosIni.vEmp.vModoFaturamento = 'S' then
        btStatusNFe.Enabled := (trim(ComFat.dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R')
         and (ComFat.dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0)
         and (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO')
      else
        btStatusNFe.Enabled := (ComFat.dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0)
         and (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');
    end;

    BitBtn10.Enabled := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');
    BitBtn24.Enabled := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');
    BitBtn26.Enabled := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');
    BitBtn27.Enabled := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');
    BitBtn46.Enabled := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');

    BitBtn52.Visible := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');// and (pModelo = 'CFT');
    BitBtn53.Visible := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO');// and (pModelo = 'CFT');
  end;

  btAlterarChassi.Enabled := (UpperCase(trim(ComFat.dataSet.FieldByName('STATUS_V').AsString)) = 'ABERTO')
  and (ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0);

  if vDadosIni.vUsarPlanoVeic = 'S' then
  begin
   DBMemo17.Left := 130;
   DBMemo17.Width := 598;
   GroupBox5.Height := 196;
  end
  else
  begin
   DBMemo17.Left := 8;
   DBMemo17.Width := 722;
   GroupBox5.Height := 200;
  end;

  if pModelo = 'CTRCOMPRA' then
  begin
    GroupBox_Compra.Caption := 'Contrato de Compra';
    TabSheet_ContratoCompra.Caption := 'Contrato de Compra';
    TabSheet_DadosdaNota.Caption := 'Dados da Nota';
    TabSheet_ContratoCompra.TabVisible := true;
    TabSheet_DadosdaNota.TabVisible := true;
    PageControl3.ActivePage := TabSheet_ContratoCompra;
    TabSheet_ContratoCompra.Show;

    if (Self.Enabled) and (Self.Visible) and (DBEdit48.CanFocus) then
      DBEdit48.SetFocus;
  end
  else if pModelo = 'CTRENTCONS' then
  begin
    GroupBox_Compra.Caption := 'Contrato de Entrada em Consignação';
    TabSheet_ContratoCompra.Caption := 'Contrato de Entrada em Consignação';
    TabSheet_DadosdaNota.Caption := 'Dados da Nota';
    TabSheet_ContratoCompra.TabVisible := true;
    TabSheet_DadosdaNota.TabVisible := true;
    PageControl3.ActivePage := TabSheet_ContratoCompra;
    TabSheet_ContratoCompra.Show;

    if (Self.Enabled) and (Self.Visible) and (DBEdit48.CanFocus) then
      DBEdit48.SetFocus;
  end
  else if pModelo = 'CFT' then
  begin
    GroupBox_Dados.Height := 206;
    if pTipoOP = 'V' then
    begin
      GroupBox_Comando.Caption := 'Venda de Veículos';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Venda de Veículos';
    end
    else if pTipoOP = 'T' then
    begin
      GroupBox_Comando.Caption := 'Transferência';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Transferência';
    end
    else if pTipoOP = 'C' then
    begin
      GroupBox_Comando.Caption := 'Saída para Venda em Consignação';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Saída para Venda em Consignação';
    end
    else if pTipoOP = 'I' then
    begin
      GroupBox_Comando.Caption := 'Intermediação';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Intermediação';
      GroupBox_Dados.Height := 235;
    end
    else if pTipoOP = 'D' then
    begin
      GroupBox_Comando.Caption := 'Demonstração';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Demonstração';
    end
    else if pTipoOP = 'R' then
    begin
      GroupBox_Comando.Caption := 'Retorno de Demonstração';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Retorno de Demonstração';
    end
    else if pTipoOP = 'E' then
    begin
      GroupBox_Comando.Caption := 'Devolução';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Devolução';
    end
    else if pTipoOP = 'A' then
    begin
      GroupBox_Comando.Caption := 'Ativo Imobilizado';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Ativo Imobilizado';
    end
    else if pTipoOP = 'O' then
    begin
      GroupBox_Comando.Caption := 'Outras Saídas';
      GroupBox_Venda.Caption := 'Comando de Faturamento';
      TabSheet_Venda.Caption := 'Outras Saídas';
    end;

    TabSheet_DadosdaNota.Caption := 'Dados da Nota';
    TabSheet_Venda.TabVisible := true;
    TabSheet_DadosdaNota.TabVisible := true;
    PageControl3.ActivePage := TabSheet_Venda;
    TabSheet_Venda.Show;

    memo1.Clear;
    if pOperacao = 'ALTERAR' then
      if ComFat.vEstMoto.AbreEstMoto(ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger, ComFat.dataSet.FieldByName('CHASSIV').AsString) then
      begin
        memo1.lines.Add('MARCA....: ' + ComFat.vEstMoto.dataSet.Fieldbyname('MARCAEST').asstring);
        memo1.lines.Add('MODELO...: ' + ComFat.vEstMoto.dataSet.fieldbyname('DESCRICAO_VERSAOEST').asstring);
        memo1.lines.Add('ANO FAB..: ' + ComFat.vEstMoto.dataSet.fieldbyname('ANO_FABEST').asstring);
        memo1.lines.Add('ANO MOD..: ' + ComFat.vEstMoto.dataSet.fieldbyname('ANO_MODEST').asstring);
        memo1.lines.Add('PLACA....: ' + ComFat.vEstMoto.dataSet.fieldbyname('PLACAEST').asstring);
        memo1.lines.Add('COR......: ' + ComFat.vEstMoto.dataSet.fieldbyname('COREST').asstring);
      end;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  end
  else if pModelo = 'CTRVND' then
  begin
    GroupBox_Venda.Caption := 'Contrato de Venda';
    TabSheet_ContratoVndResDomInterm.Caption := 'Contrato de Venda';
    TabSheet_DadosdaNota.Caption := 'Dados da Nota';
    GroupBox_Venda.Height := 550;
    GroupBox36.Height := 60;
    Label111.Top := 12;
    DBEdit58.Top := 9;
    DBLookupComboBox27.Top := 9;
    Label112.Top := 39;
    DBEdit59.Top := 36;
    DBLookupComboBox28.Top := 36;

    TabSheet_ContratoVndResDomInterm.TabVisible := true;
    TabSheet_DadosdaNota.TabVisible := true;
    PageControl3.ActivePage := TabSheet_ContratoVndResDomInterm;
    TabSheet_ContratoVndResDomInterm.Show;

    if (Self.Enabled) and (Self.Visible) and (DBEdit56.CanFocus) then
      DBEdit56.SetFocus;
  end
  else if pModelo = 'CTRVNDCONS' then
  begin
    GroupBox_VndCons.Caption := 'Contrato de Saída Venda em Consignação';
    TabSheet_ContratoVndConsignado.Caption := 'Contrato de Saída para Venda Consignação';
    TabSheet_DadosdaNota.Caption := 'Dados da Nota';

    TabSheet_ContratoVndConsignado.TabVisible := true;
    TabSheet_DadosdaNota.TabVisible := (trim(ComFat.dataSet.FieldByName('CONS_DEV').AsString) <> '');
    PageControl3.ActivePage := TabSheet_ContratoVndConsignado;
    TabSheet_ContratoVndConsignado.Show;

    if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
      DBEdit16.SetFocus;
  end
  else if pModelo = 'CTRRESDOM' then
  begin
    GroupBox_Venda.Caption := 'Contrato de Reserva Domínio';
    TabSheet_ContratoVndResDomInterm.Caption := 'Contrato de Reserva Domínio';
    TabSheet_DadosdaNota.Caption := 'Dados da Nota';

    if pTipoVenda = 'U' then
    begin
      GroupBox_Venda.Height := 570;
      Label111.Top := 39;
      DBEdit58.Top := 36;
      DBLookupComboBox27.Top := 36;
      Label112.Top := 63;
      DBEdit59.Top := 61;
      DBLookupComboBox28.Top := 61;
      GroupBox36.Height := 86;
    end
    else
    begin
      GroupBox_Venda.Height := 610;
      Label111.Top := 39;
      DBEdit58.Top := 36;
      DBLookupComboBox27.Top := 36;
      Label112.Top := 63;
      DBEdit59.Top := 61;
      DBLookupComboBox28.Top := 61;
      Label113.Top := 88;
      DBEdit60.Top := 86;
      DBLookupComboBox29.Top := 86;
      GroupBox36.Height := 111;
    end;

    TabSheet_ContratoVndResDomInterm.TabVisible := true;
    TabSheet_DadosdaNota.TabVisible := true;
    PageControl3.ActivePage := TabSheet_ContratoVndResDomInterm;
    TabSheet_ContratoVndResDomInterm.Show;

    if (Self.Enabled) and (Self.Visible) and (DBEdit56.CanFocus) then
      DBEdit56.SetFocus;
  end
  else if pModelo = 'CTRINTERM' then
  begin
    GroupBox_Venda.Caption := 'Contrato de Intermediação';
    TabSheet_ContratoVndResDomInterm.Caption := 'Contrato de Intermediação';
    TabSheet_DadosdaNota.Caption := 'Dados da Nota';

    GroupBox_Venda.Height := 570;
    GroupBox36.Height := 86;

    if pTipoVenda = 'U' then
    begin
      Label111.Top := 39;
      DBEdit58.Top := 36;
      DBLookupComboBox27.Top := 36;
      Label112.Top := 63;
      DBEdit59.Top := 61;
      DBLookupComboBox28.Top := 61;
    end
    else
    begin
      Label111.Top := 39;
      DBEdit58.Top := 36;
      DBLookupComboBox27.Top := 36;
      Label113.Top := 63;
      DBEdit60.Top := 61;
      DBLookupComboBox29.Top := 61;
    end;

    TabSheet_ContratoVndResDomInterm.TabVisible := true;
    TabSheet_DadosdaNota.TabVisible := true;
    PageControl3.ActivePage := TabSheet_ContratoVndResDomInterm;
    TabSheet_ContratoVndResDomInterm.Show;

    if (Self.Enabled) and (Self.Visible) and (DBEdit56.CanFocus) then
      DBEdit56.SetFocus;
  end;
  DBComboBox3.ItemIndex := 0;
  DBComboBox4.ItemIndex := 0;
  DBComboBox5.ItemIndex := 0;
  DBComboBox8.ItemIndex := 0;
end;

function TfrmMovVeiculosCCIA.habilitaControlesParaEdicao(pModelo, pTipoVenda, pTipoOP: string): Boolean;
begin
  Result := false;
//  BitBtn4.Enabled := false;
  BitBtn10.Enabled := true;

  if trim(pModelo) = '' then
  begin
   Application.MessageBox(Pchar('Tipo do Comando/Contrato não foi encontrado!'), 'Atenção', MB_ICONINFORMATION + MB_OK);
   exit;
  end;

  Result := true;
  habilitaCampoComFat(pModelo, pTipoVenda, pTipoOP, 'ALTERAR');
end;

function TfrmMovVeiculosCCIA.habilitaControlesParaInsercao(
  pModelo, pTipoVenda, pTipoOP: string): Boolean;
begin
  Result := false;
//  BitBtn4.Enabled := true;
  BitBtn10.Enabled := false;
  BitBtn13.Enabled := false;
  BitBtn46.Enabled := false;
  BitBtn24.Enabled := false;
  BitBtn26.Enabled := false;
  BitBtn27.Enabled := false;
  BitBtn52.Visible := false;
  BitBtn53.Visible := false;
  btStatusNFe.Enabled := false;
  BitBtn12.Enabled := false;
  BitBtn8.Enabled := false;

  Result := true;
  habilitaCampoComFat(pModelo, pTipoVenda, pTipoOP, 'INSERIR');
end;

procedure TfrmMovVeiculosCCIA.keydownCFOP(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'E' then
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP',
         ' AND TIPV_VEICULO = ' + QuotedStr(Trim(ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString))
          + ' AND CODIGO_NOP <= 3999', 'Consulta de Natureza de Operaçao')
      else
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP',
         ' AND TIPV_VEICULO = ' + QuotedStr(Trim(ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString))
          + ' AND CODIGO_NOP > 4999', 'Consulta de Natureza de Operaçao');

      if vDadosIni.vPesquisa <> '' then
         ComFat.dataSet.FieldByName('NATOP_V').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.keydownChassi(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      BitBtn25Click(Sender);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TFrmEstMotosCCIA', 'O formulário Estoque e Movimento Veículos se encontra aberto!') then
      exit;

    ComFat.AbrirEstMoto;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        ComFat.dataSet.FieldByName('CHASSIV').asinteger := strtoint(vDadosIni.vPesquisa);
        ComFat.vEstMoto.AbreEstMoto(ComFat.dataSet.FieldByName('CHASSIV').AsString);
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmMovVeiculosCCIA.keydownCliente(Sender: TObject; var Key: Word;
      Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
        ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
          vDadosIni.pesquisaRapida('CLIENTES', ' ', 'Consulta de Cliente')
      else if (TDBEdit(Sender).Field.FieldName) = 'COD_CONCESS' then
        ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
          vDadosIni.pesquisaRapida('CLIENTES', ' ', //AND ((TIPO <> ''C'') OR (TIPO IS NULL))  ',
          vDadosIni.retornoPorCondicao(trim(ComFat.dataSet.FieldByName('TIPO').AsString) = 'CFT',
          'Consulta de Proprietário', 'Consulta de Concessionária'))
      else if (TDBEdit(Sender).Field.FieldName) = 'COD_INTERMED' then
        ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
          vDadosIni.pesquisaRapida('CLIENTES', ' ', 'Consulta de Intermediador')
      else if (TDBEdit(Sender).Field.FieldName) = 'COD_CLI_VENDE' then
      begin
         if ComFat.dataSet.FieldByName('NATUREZA').AsString = 'E' then
          ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
            vDadosIni.pesquisaRapida('CLIENTES', ' ', 'Consulta de Cliente Vendedor')
         else
           ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString :=
            vDadosIni.pesquisaRapida('CLIENTES', ' ', //AND ((TIPO <> ''C'') OR (TIPO IS NULL)) ',
            vDadosIni.retornoPorCondicao(trim(ComFat.dataSet.FieldByName('TIPO').AsString) = 'CFT',
            'Consulta de Proprietário', 'Consulta de Cliente Vendedor'));
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes', 'O formulário de Clientes se encontra aberto!') then
      exit;
    if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
       ComFat.vClienteComFat.AbrirCliente(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString)
    else if (TDBEdit(Sender).Field.FieldName) = 'COD_CLI_VENDE' then
       ComFat.vClienteVendComFat.AbrirCliente(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString)
    else if (TDBEdit(Sender).Field.FieldName) = 'COD_CONCESS' then
       ComFat.vConcessionariaComFat.AbrirCliente(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString)
    else if (TDBEdit(Sender).Field.FieldName) = 'COD_INTERMED' then
       ComFat.vIntermediadorComFat.AbrirCliente(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString);

    if vDadosIni.vPesquisa <> '' then
    begin
      try
        ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString := vDadosIni.vPesquisa;

        if (TDBEdit(Sender).Field.FieldName) = 'CLIENTES_V' then
          ComFat.vClienteComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger)
        else if (TDBEdit(Sender).Field.FieldName) = 'COD_CLI_VENDE' then
          ComFat.vClienteVendComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger, 'E')
        else if (TDBEdit(Sender).Field.FieldName) = 'COD_CONCESS' then
          ComFat.vConcessionariaComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger, 'E')
        else if (TDBEdit(Sender).Field.FieldName) = 'COD_INTERMED' then
          ComFat.vIntermediadorComFat.abreClientes(ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsInteger);
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmMovVeiculosCCIA.keydownVendedor(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      ComFat.dataSet.FieldByName(TDBEdit(Sender).Field.FieldName).AsString := vDadosIni.pesquisaRapida('COLABORADOR');
      if vDadosIni.vPesquisa <> '' then
        Edit3.Text := vDadosIni.vPesquisaChassi;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    ckEntrada.Checked := _LerConfiguracoesRegistroBoolean(ckEntrada.Name);
    ckSaida.Checked   := _LerConfiguracoesRegistroBoolean(ckSaida.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
  	RadioGroup2.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup2.Name);

    ckCtrCompra.Checked   := _LerConfiguracoesRegistroBoolean(ckCtrCompra.Name);
    ckCtrEntCons.Checked  := _LerConfiguracoesRegistroBoolean(ckCtrEntCons.Name);

    ckCFTVnd.Checked := _LerConfiguracoesRegistroBoolean(ckCFTVnd.Name);
    ckCtrVnd.Checked := _LerConfiguracoesRegistroBoolean(ckCtrVnd.Name);
    ckCtrVndCons.Checked := _LerConfiguracoesRegistroBoolean(ckCtrVndCons.Name);
    ckCtrResDom.Checked := _LerConfiguracoesRegistroBoolean(ckCtrResDom.Name);
    ckCtrInterm.Checked := _LerConfiguracoesRegistroBoolean(ckCtrInterm.Name);
    ckCFTTransf.Checked := _LerConfiguracoesRegistroBoolean(ckCFTTransf.Name);
    ckCFTDemonst.Checked := _LerConfiguracoesRegistroBoolean(ckCFTDemonst.Name);
    ckCFTAtivo.Checked := _LerConfiguracoesRegistroBoolean(ckCFTAtivo.Name);
    ckCFTDevolucao.Checked := _LerConfiguracoesRegistroBoolean(ckCFTDevolucao.Name);
    ckCFTOutrasSaidas.Checked := _LerConfiguracoesRegistroBoolean(ckCFTOutrasSaidas.Name);
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

    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text        := _LerConfiguracoesRegistroString(MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text        := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text        := _LerConfiguracoesRegistroString(MaskEdit9.Name);
  end;
end;

procedure TfrmMovVeiculosCCIA.MaskEditDataEntIniEnter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(MaskEditDataEntIni.Handle, PChar('Data inicial para pesquisar os registros salvos' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmMovVeiculosCCIA.MaskEditDataEntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    TMaskEdit(Sender).Text := '99/99/9999';
    TMaskEdit(Sender).Clear;
  end;
  inherited;
end;

procedure TfrmMovVeiculosCCIA.NovoComando(pTipoV: string);
var
 vCodProcesso: string;
begin
 try
   Screen.Cursor := crHourGlass;
   ComFat.vChassiOld := '';
   ComFat.vCodigoOld := 0;
   ComFat.vSing.vTipoVenda := pTipoV;
   ComFat.vSing.vTipo := vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString;
   ComFat.vSing.vNatureza := vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString;
   ComFat.vSing.vMod := vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString;
   ComFat.vSing.vTipoVendaCFOP := vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString;
   ComFat.vSing.vNomeContrato := vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString;
   ComFat.vSing.vAlterarEstoque := vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString;

   if trim(ComFat.vSing.vMod) = 'CFT' then
     vCodProcesso := 'VEI037'
   else if trim(ComFat.vSing.vMod) = 'CTRCOMPRA' then
     vCodProcesso := 'VEI035'
   else if trim(ComFat.vSing.vMod) = 'CTRENTCONS' then
     vCodProcesso := 'VEI036'
   else if trim(ComFat.vSing.vMod) = 'CTRVND' then
     vCodProcesso := 'VEI038'
   else if trim(ComFat.vSing.vMod) = 'CTRVNDCONS' then
     vCodProcesso := 'VEI039'
   else if trim(ComFat.vSing.vMod) = 'CTRRESDOM' then
     vCodProcesso := 'VEI040'
   else if trim(ComFat.vSing.vMod) = 'CTRINTERM' then
     vCodProcesso := 'VEI041';

    if not vDadosIni.PesqPros(vCodProcesso, 'INSERIR', 'CHASSI - ' + ComFat.dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT',
      ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, true) then
      exit;

   if not ComFat.Insert then
     exit;

   if not habilitaControlesParaInsercao(ComFat.vSing.vMod, ComFat.vSing.vTipoVenda, ComFat.vSing.vTipoVendaCFOP) then
     exit;

   if ComFat.vNaturezaOp.IsEmpty then
   begin
     Application.MessageBox(Pchar('Nenhum CFOP se encontra configurado para este tipo de operação!'), 'Atenção', MB_ICONINFORMATION + MB_OK);
     BitBtn5.Click;
     frmMovVeiculosCCIA.fechar := True;
     PostMessage(frmMovVeiculosCCIA.Handle, WM_CLOSE, 0, 0);
     exit;
   end;

   inherited;

   ComFat.dataSet.FieldByName('TIPO_VENDA_V').ReadOnly := False;
   ComFat.dataSet.FieldByName('TIPO_VENDA_V').AsString := ComFat.vSing.vTipoVenda;
   ComFat.dataSet.FieldByName('TIPO_VENDA_V').ReadOnly := True;
   ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString := ComFat.vSing.vTipoVendaCFOP;
   ComFat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := ComFat.vSing.vAlterarEstoque;
   if vDadosIni.vDtSetTmp.FieldByName('COMFAT').AsBoolean = false then
   begin
     ComFat.dataSet.FieldByName('COD_ESTMOTO').AsString := vDadosIni.vDtSetTmp.FieldByName('CODIGO').AsString;
     ComFat.dataSet.FieldByName('CHASSIV').AsString := vDadosIni.vDtSetTmp.FieldByName('CHASSI_C').AsString;
     ComFat.dataSet.FieldByName('PLACAV').AsString := vDadosIni.vDtSetTmp.FieldByName('PLACAEST').AsString;
   end;
   DBComboBox3.ItemIndex := 0;
   DBComboBox4.ItemIndex := 0;
   DBComboBox5.ItemIndex := 0;
   DBComboBox8.ItemIndex := 0;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
	for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TfrmMovVeiculosCCIA.PageControl3Exit(Sender: TObject);
begin
  SetFocusTabSheetDadosNota;
end;

function TfrmMovVeiculosCCIA.buscarNaturezaOp: boolean;
var
 vPrecCusto: Double;
begin
  Result := False;

//  if (ComFat.vCFOPOld <> ComFat.dataSet.FieldByName('NATOP_V').AsFloat) then
  if ComFat.dataSet.FieldByName('NATOP_V').AsInteger <= 0 then
  begin
    Result := True;
    if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
      ComFat.dataSet.Edit;
    ComFat.dataSet.FieldByName('DESC_NATOP').AsString := '';
    exit;
  end;

  if (ComFat.vSing.vTipoVendaCFOP = 'I') then
  begin
    if not ComFat.vNaturezaOp.buscarNaturezaInterm(ComFat.dataSet.FieldByName('NATOP_V').AsFloat) then
    begin
      Application.MessageBox('Natureza de Operação não encontrada para este tipo de operação!', 'Informação', MB_OK + MB_ICONINFORMATION +
       MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
        DBEdit26.SetFocus;
      exit;
    end
    else
    begin
      Result := True;
      if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
        ComFat.dataSet.Edit;
      ComFat.dataSet.FieldByName('DESC_NATOP').AsString := ComFat.vNaturezaOp.dataSet.FieldByName('DESCRICAO_NOP').AsString;
      exit;
    end;
  end;

  if not ComFat.vNaturezaOp.buscarNaturezaOp(ComFat.vSing.vTipoVendaCFOP, ComFat.vSing.vNatureza,
  	vDadosIni.IfThen(ComFat.vSing.vNatureza = 'E',
    	vDadosIni.IfThen(ComFat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger <= 0, -1, ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger),
	 	  vDadosIni.IfThen(ComFat.dataSet.FieldByName('CLIENTES_V').AsInteger <= 0, -1, ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)),
  	ComFat.dataSet.FieldByName('NATOP_V').AsFloat, ComFat.vSing.vTipoVenda) then
  begin
  	if not ComFat.vNaturezaOp.testarNaturezaOpNovoUsado(ComFat.vSing.vTipoVendaCFOP, ComFat.vSing.vNatureza,
    	vDadosIni.IfThen(ComFat.vSing.vNatureza = 'E',
      	vDadosIni.IfThen(ComFat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger <= 0, -1, ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger),
		    vDadosIni.IfThen(ComFat.dataSet.FieldByName('CLIENTES_V').AsInteger <= 0, -1, ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)),
    	ComFat.dataSet.FieldByName('NATOP_V').AsFloat, ComFat.vSing.vTipoVenda) then
    	// Não fazer nada
    else
    begin
    	if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
        ComFat.dataSet.Edit;
      ComFat.dataSet.FieldByName('DESC_NATOP').AsString := '';

	    Application.MessageBox('Natureza de Operação não encontrada para este tipo de operação!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    end;
    if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
      DBEdit26.SetFocus;
    exit;
  end
  else
  begin
    Result := True;
    if ComFat.vSing.vNatureza = 'S' then
    begin
      if (ComFat.vSing.vTipoVendaCFOP = 'O') or (ComFat.vSing.vTipoVendaCFOP = 'E') then
      begin
        if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
          ComFat.dataSet.Edit;
        if trim(ComFat.vNaturezaOp.buscas.FieldByName('ALT_EST').AsString) = 'N' then
          ComFat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N'
        else
          ComFat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'S';
        ComFat.vSing.vAlterarEstoque := ComFat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString;
        if ComFat.dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0 then
          if not ComFat._VerificarEstoqueVeiculo(ComFat.buscas) then
          begin
            Result := False;
            if ComFat.vEstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString = 'S' then
              Application.MessageBox(PChar('Veículo informado possui estoque!' + #13 +
              'CFOP: ' + IntToStr(ComFat.dataSet.FieldByName('NATOP_V').AsInteger) +
              ' está configurado para não alterar estoque!'),'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
            else
              Application.MessageBox(PChar('Veículo informado não possui estoque!' +#13 +
              'CFOP: ' + IntToStr(ComFat.dataSet.FieldByName('NATOP_V').AsInteger) +
              ' está configurado para alterar estoque!'),'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
              DBEdit26.SetFocus;
            exit;
          end;
      end
    end;

    if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
      ComFat.dataSet.Edit;
    ComFat.dataSet.FieldByName('DESC_NATOP').AsString := ComFat.vNaturezaOp.dataSet.FieldByName('DESCRICAO_NOP').AsString;
    DBEdit28.Enabled := ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString = 'T';
    if (ComFat.dataSet.FieldByName('NATUREZA').AsString = 'E')
    	or (ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
    begin
      vPrecCusto := ComFat.retornaValorCusto;
      if vPrecCusto > 0 then
        ComFat.dataSet.FieldByName('PRVEN_V').AsCurrency := vPrecCusto
      else
        ComFat.dataSet.FieldByName('PRVEN_V').AsCurrency := ComFat.vEstMoto.dataSet.FieldByName('PRECO_CUSTO').AsFloat;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.MaskEditDataEntFimEnter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(MaskEditDataEntFim.Handle, PChar('Data final para pesquisar os registros salvos' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmMovVeiculosCCIA.SetFocusTabSheetDadosNota;
begin
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = Panel3)
  or (ActiveControl = btStatusNFe) or (ActiveControl = btAlterarChassi) then
   exit;

  if TabSheet_DadosdaNota.TabVisible then
  begin
    if PageControl3.ActivePage <> TabSheet_DadosdaNota then
    begin
      PageControl3.ActivePage := TabSheet_DadosdaNota;
      TabSheet_DadosdaNota.Show;
      if (Self.Enabled) and (Self.Visible) and (GroupBox_Nota.CanFocus) then
        GroupBox_Nota.SetFocus;
      if (Self.Enabled) and (Self.Visible) and (DBEdit24.CanFocus) then
        DBEdit24.SetFocus;
    end;
  end;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     if ComFat.dataSet.IsEmpty then
      exit;

     if not vDadosIni.PesqPros('VEI056', 'CONFIRMAR', 'CHASSI - ' + ComFat.dataSet.FieldByName('CHASSIV').AsString,
       'COM_FAT', ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, true) then
        Exit;

      if not ComFat.verificaFechamento(1) then
      begin
        Application.MessageBox(Pchar('Documento não se encontra aberto no momento!'), 'Informação', MB_OK + MB_ICONINFORMATION);
        ComFat.dataSet.Cancel;
        ComFat.RollBackTransacao;
        exit;
      end;

     if not ComFat.Edit then
       exit;

     ComFat.verplanopag(2);

     if not habilitaControlesParaEdicao(trim(ComFat.dataSet.FieldByName('MODELO').AsString), trim(ComFat.dataSet.FieldByName('TIPO_VENDA_V').AsString), trim(ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString)) then
 	    exit;

      if not ComFat.ChecaCamposObrigatorios then
      begin
        setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
        ComFat.dataSet.Cancel;
        ComFat.RollBackTransacao;
        exit;
      end;

      if not ComFat._VerificarEstoqueVeiculo(Memo1, 'S', 'S') then
      begin
        setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
        ComFat.dataSet.Cancel;
        ComFat.RollBackTransacao;
        exit;
      end;

     if not ComFat.Post  then
      exit;

     ComFat.Refresh;
     PageControl1.ActivePage := TabSheet2;
     TabSheet2.Show;
     if Panel1.Visible then
       if DBGrid1.CanFocus then
         DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  ComFat.detalhesFormaDePagamento;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  ComFat.dataSet.FieldByName('CONS_DEV').AsString := 'C';
  ComFat.dataSet.FieldByName('NATOP_V').AsFloat := 0;
  ComFat.dataSet.FieldByName('DESC_NATOP').AsString := '';
  ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString := '';
  habilitaCampoComFat(ComFat.vSing.vMod, ComFat.vEstMoto.dataSet.FieldByName('STATUS_USO').AsString, 'C', 'ALTERAR');

  if ComFat.vNaturezaOp.abreNaturezaOp('C', ComFat.vSing.vNatureza, ComFat.vSing.vTipoVenda,
  	vDadosIni.IfThen(ComFat.vSing.vNatureza = 'E',
      vDadosIni.IfThen(ComFat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger <= 0, -1, ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger),
      vDadosIni.IfThen(ComFat.dataSet.FieldByName('CLIENTES_V').AsInteger <= 0, -1, ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger))) then
  begin
    ComFat.dataSet.FieldByName('NATOP_V').AsFloat := ComFat.vNaturezaOp.dataSet.FieldByName('CODIGO_NOP').AsFloat;
    ComFat.dataSet.FieldByName('DESC_NATOP').AsString := Copy(trim(ComFat.vNaturezaOp.dataSet.FieldByName('DESCRICAO_NOP').AsString), 1, 40);
    ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString := ComFat.vNaturezaOp.dataSet.FieldByName('TIPV_VEICULO').AsString;
    ComFat.vSing.vTipoVendaCFOP := ComFat.vNaturezaOp.dataSet.FieldByName('TIPV_VEICULO').AsString;
    ComFat.vCFOPOld := ComFat.dataSet.FieldByName('NATOP_V').AsFloat;
  end;
  SetFocusTabSheetDadosNota;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  ComFat.dataSet.FieldByName('CONS_DEV').AsString := 'D';
  ComFat.dataSet.FieldByName('NATOP_V').AsFloat := 0;
  ComFat.dataSet.FieldByName('DESC_NATOP').AsString := '';
  ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString := '';
  habilitaCampoComFat(ComFat.vSing.vMod, ComFat.vEstMoto.dataSet.FieldByName('STATUS_USO').AsString, 'E', 'ALTERAR');
  if ComFat.vNaturezaOp.abreNaturezaOp('E', ComFat.vSing.vNatureza, ComFat.vSing.vAlterarEstoque,
  	vDadosIni.IfThen(ComFat.vSing.vNatureza = 'E',
      vDadosIni.IfThen(ComFat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger <= 0, -1, ComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger),
      vDadosIni.IfThen(ComFat.dataSet.FieldByName('CLIENTES_V').AsInteger <= 0, -1, ComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger))) then
  begin
    ComFat.dataSet.FieldByName('NATOP_V').AsFloat := ComFat.vNaturezaOp.dataSet.FieldByName('CODIGO_NOP').AsFloat;
    ComFat.dataSet.FieldByName('DESC_NATOP').AsString := Copy(trim(ComFat.vNaturezaOp.dataSet.FieldByName('DESCRICAO_NOP').AsString), 1, 40);
    ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString := ComFat.vNaturezaOp.dataSet.FieldByName('TIPV_VEICULO').AsString;
    ComFat.vSing.vTipoVendaCFOP := ComFat.vNaturezaOp.dataSet.FieldByName('TIPV_VEICULO').AsString;
    ComFat.vCFOPOld := ComFat.dataSet.FieldByName('NATOP_V').AsFloat;
  end;
  SetFocusTabSheetDadosNota;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton1Click(Sender: TObject);
var
  vCodProcesso: string;
  I: Integer;
begin
 try
   Screen.Cursor := crHourGlass;

   if ComFat.dataSet.IsEmpty then
     Exit;

   ComFat.vChassiOld := '';
   ComFat.vCodigoOld := 0;

   inherited;
   if TelaCadastro <> 12 then
   begin
     if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CFT' then
       vCodProcesso := 'VEI044'
     else if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRCOMPRA' then
       vCodProcesso := 'VEI042'
     else if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRENTCONS' then
       vCodProcesso := 'VEI043'
     else if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRVND' then
       vCodProcesso := 'VEI045'
     else if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRVNDCONS' then
       vCodProcesso := 'VEI046'
     else if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRRESDOM' then
       vCodProcesso := 'VEI047'
     else if trim(ComFat.dataSet.FieldByName('MODELO').AsString) = 'CTRINTERM' then
       vCodProcesso := 'VEI048';

     if not vDadosIni.PesqPros(vCodProcesso, 'EDITAR', 'CHASSI - ' + ComFat.dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT',
       ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, true) then
       exit;
   end;

  if not ComFat.edit then
     exit;

  if not habilitaControlesParaEdicao(trim(ComFat.dataSet.FieldByName('MODELO').AsString), trim(ComFat.dataSet.FieldByName('TIPO_VENDA_V').AsString), trim(ComFat.dataSet.FieldByName('TIPV_VEICULO').AsString)) then
     exit;

   if ComFat.vNaturezaOp.IsEmpty then
   begin
     Application.MessageBox(Pchar('Nenhum CFOP se encontra configurado para este tipo de operação!'), 'Atenção', MB_ICONINFORMATION + MB_OK);
     BitBtn5Click(Sender);
     exit;
   end;

   _atualizarCombobox;
   ComFat.verplanopag(2);
   DBComboBox3.ItemIndex := 0;
   DBComboBox4.ItemIndex := 0;
   DBComboBox5.ItemIndex := 0;
   DBComboBox8.ItemIndex := 0;

   for I := 0 to ComponentCount - 1 do
     if (Components[I] is TScrollBox) then
       TScrollBox(Components[I]).VertScrollBar.Position := 0;

   FocarCampos;

 finally
   Screen.Cursor := crDefault;
 end;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI082', 'ALTERAR', 'CHASSI ' + ComFat.dataSet.FieldByName('CHASSIV').AsString,
    'COM_FAT', ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, false) then
    Exit;

  if ComFat.dataSet.IsEmpty then
    Exit;

  if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
    ComFat.dataSet.Edit;
  _atualizarCombobox;

  ComFat.EditarFormPerguntasVeiculo;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if ComFat.dataSet.IsEmpty then
     exit;

   if (trim(ComFat.dataSet.FieldByName('STATUS_V').AsString) <> 'FECHADO')
    and (trim(ComFat.dataSet.FieldByName('STATUS_V').AsString) <> 'CANCELADO') then
   begin
     Application.MessageBox(Pchar('Documento não está fechado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
     exit;
   end;

   if ComFat.dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0 then
   begin
     if not (ComFat.MontarNFe(ComFat.dataSet.FieldByName('N_COMANDO').AsInteger, ComFat.dataSet.FieldByName('MODELO').AsString, ComFat.dataSet.FieldByName('NATUREZA').AsString)) then
     begin
        setFocusCampoErro(ComFat.vNomeCampoErro, ComFat.vMensagemErro);
        exit;
     end;
   end
   else
   begin
     Application.MessageBox(Pchar('Documento não possui Nota Fiscal.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
     exit;
   end;

  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if ComFat.dataSet.IsEmpty then
     exit;

    if not vDadosIni.PesqPros('VEI095', 'CONFIRMAR RETORNO', 'CHASSI ' + ComFat.dataSet.FieldByName('CHASSIV').AsString,
     'COM_FAT', ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, true) then
      Exit;

    ComFat.ConfirmarRetornoDemonst;
  finally
   Screen.Cursor := crDefault;
 end;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
   Screen.Cursor := crHourGlass;

  if ComFat.dataSet.IsEmpty then
    Exit;

  ComFat.CancelarComando;
  ComFat.Refresh;
  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not ComFat.verificarImpressaoPerm(True, True) then
  		exit;

    ComFat.ImprimirContratoComando;
    ComFat.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMovVeiculosCCIA.SpeedButton40Click(Sender: TObject);
begin
  vDadosIni.configurarSistema('vei_%', ComFat.buscas);
end;

procedure TfrmMovVeiculosCCIA.SpeedButton6Click(Sender: TObject);
begin
  inherited;
{
Se for só contrato o botão de voltar para o estoque funciona,
se for NF ele volta pelo estoque pelo cancelamento da nota
ou pela nota de devolução.
}
end;

procedure TfrmMovVeiculosCCIA.SpeedButton7Click(Sender: TObject);
begin
  inherited;
//Quando selecionar um tipo diferente do tipo venda habilitar botão
//  Veiculos._AbreFormVendaVeiculos(0);

end;

procedure TfrmMovVeiculosCCIA.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if ComFat.dataSet.IsEmpty then
      exit;

    if not vDadosIni.PesqPros('VEI104', 'REABRIR', 'CHASSI - ' + ComFat.dataSet.FieldByName('CHASSIV').AsString,
     'COM_FAT', ComFat.dataSet.FieldByName('N_COMANDO').AsString, ComFat.buscas, true) then
       Exit;

    if not ComFat.Edit then
      exit;

    ComFat.ReabrirComando;
    ComFat.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmMovVeiculosCCIA._atualizarCombobox: Boolean;
begin
  if not (ComFat.dataSet.FieldByName('TIPO_VENDA_V').IsNull) then
  begin
     DBComboBox3.ItemIndex := 0;
     DBComboBox4.ItemIndex := 0;
     DBComboBox5.ItemIndex := 0;
     DBComboBox8.ItemIndex := 0;
  end;

  if ComFat.dataSet.FieldByName('PRIMEIROVEICULO').AsString = 'N' then
    DBComboBox6.ItemIndex := 1
  else
    DBComboBox6.ItemIndex := 0;

  if ComFat.dataSet.FieldByName('ACEITA_CONTATO').AsString = 'N' then
    DBComboBox7.ItemIndex := 1
  else
    DBComboBox7.ItemIndex := 0;


  if not (ComFat.dataSet.FieldByName('TPREST').IsNull) then
  begin
    if ComFat.dataSet.FieldByName('TPREST').AsString = '0' then
      DBComboBox2.ItemIndex := 0
    else if ComFat.dataSet.FieldByName('TPREST').AsString = '1' then
      DBComboBox2.ItemIndex := 1
    else if ComFat.dataSet.FieldByName('TPREST').AsString = '2' then
      DBComboBox2.ItemIndex := 2
    else if ComFat.dataSet.FieldByName('TPREST').AsString = '3' then
      DBComboBox2.ItemIndex := 3
    else if ComFat.dataSet.FieldByName('TPREST').AsString = '4' then
      DBComboBox2.ItemIndex := 4
    else if ComFat.dataSet.FieldByName('TPREST').AsString = '9' then
      DBComboBox2.ItemIndex := 9;
  end;
end;

procedure TfrmMovVeiculosCCIA._habilitardesabilitarCampos(vtp: integer = 0; vObs: integer = 0);
var
   z: integer;
   vSair: boolean;
begin
  if vtp = 0 then
  begin
     for z := 0 to ComponentCount - 1 do
     begin
       if (z = ComponentCount -1) or (vSair) then
         break;

       if (Components[z] is TDBEdit) then
       begin
          if (trim(TDBEdit(Components[z]).DataField) <> '') and
          (trim(ComFat.dataSet.FieldByName(TDBEdit(Components[z]).DataField).AsString) <> '')  then
         begin
            if (Components[z] as TDBEdit).ReadOnly then
              (Components[z] as TDBEdit).Tag := 99
            else
              (Components[z] as TDBEdit).Tag := 97;
           (Components[z] as TDBEdit).ReadOnly := True;
           (Components[z] as TDBEdit).Font.Color := clBtnShadow;
         end;
       end
       else
       if (Components[z] is TDBComboBox) then
       begin
          if (trim(TDBComboBox(Components[z]).DataField) <> '') and
          (trim(ComFat.dataSet.FieldByName(TDBComboBox(Components[z]).DataField).AsString) <> '')  then
         begin
            if (Components[z] as TDBComboBox).ReadOnly then
              (Components[z] as TDBComboBox).Tag := 99
            else
              (Components[z] as TDBComboBox).Tag := 97;
           (Components[z] as TDBComboBox).ReadOnly := True;
           (Components[z] as TDBComboBox).Font.Color := clBtnShadow;
         end;
       end
       else if (Components[z] is TDBMemo) then
       begin
          if (trim(TDBMemo(Components[z]).DataField) <> '') and
          (trim(ComFat.dataSet.FieldByName(TDBMemo(Components[z]).DataField).AsString) <> '')  then
         begin
            if (Components[z] as TDBMemo).ReadOnly then
              (Components[z] as TDBMemo).Tag := 99
            else
              (Components[z] as TDBMemo).Tag := 97;
           (Components[z] as TDBMemo).ReadOnly := True;
           (Components[z] as TDBMemo).Font.Color := clBtnShadow;
         end;
       end
//       else if (Components[z] is TDBCheckBox) then
//       begin
//          if (trim(TDBCheckBox(Components[z]).DataField) <> '') and
//          (trim(ComFat.dataSet.FieldByName(TDBCheckBox(Components[z]).DataField).AsString) <> '')  then
//         begin
//            if (Components[z] as TDBCheckBox).ReadOnly then
//              (Components[z] as TDBCheckBox).Tag := 99
//            else
//              (Components[z] as TDBCheckBox).Tag := 97;
//           (Components[z] as TDBCheckBox).ReadOnly := True;
//           (Components[z] as TDBCheckBox).Font.Color := clBtnShadow;
//         end;
//       end
       else if (Components[z] is TDBLookupComboBox) then
       begin
          if (trim(TDBLookupComboBox(Components[z]).DataField) <> trim(TDBLookupComboBox(Components[z]).KeyField)) then
          if (trim(TDBLookupComboBox(Components[z]).DataField) <> '') and
          (trim(ComFat.dataSet.FieldByName(TDBLookupComboBox(Components[z]).DataField).AsString) <> '')  then
         begin
            if (Components[z] as TDBLookupComboBox).ReadOnly then
              (Components[z] as TDBLookupComboBox).Tag := 99
            else
              (Components[z] as TDBLookupComboBox).Tag := 97;
           (Components[z] as TDBLookupComboBox).ReadOnly := True;
           (Components[z] as TDBLookupComboBox).Font.Color := clBtnShadow;
         end;
       end;
     end
  end
  else
  begin
    if vObs = 1 then
    begin
      for z := 0 to ComponentCount - 1 do
      begin
        if (Components[z] is TDBMemo) then
        begin
           if (trim((Components[z] as TDBMemo).DataField) = 'COND_NEGOCIACAO')
           or (trim((Components[z] as TDBMemo).DataField) = 'DOC_CHAVE_MAN')
           or (trim((Components[z] as TDBMemo).DataField) = 'MULTAS')
           or (trim((Components[z] as TDBMemo).DataField) = 'OPCIONAIS')
           or (trim((Components[z] as TDBMemo).DataField) = 'PROMESSAS')
           or (trim((Components[z] as TDBMemo).DataField) = 'OBS')
           or (trim((Components[z] as TDBMemo).DataField) = 'COND_REAIS') then
           begin
             (Components[z] as TDBMemo).Tag := 0;
             (Components[z] as TDBMemo).ReadOnly := False;
             (Components[z] as TDBMemo).Font.Color := clWindowText;
             if (trim((Components[z] as TDBMemo).DataField) = 'COND_NEGOCIACAO') then
               if (Self.Enabled) and (Self.Visible) and ((Components[z] as TDBMemo).CanFocus) then
                (Components[z] as TDBMemo).SetFocus;
           end;
        end;
      end;
    end
    else
    begin
      for z := 0 to ComponentCount - 1 do
        Components[z].Tag := 0;
      for z := 0 to ComponentCount - 1 do
      begin
        if (Components[z] is TDBEdit) then
        begin
          if ((Components[z] as TDBEdit).Tag <> 97) then
          begin
            (Components[z] as TDBEdit).Tag := 0;
            (Components[z] as TDBEdit).ReadOnly := False;
            (Components[z] as TDBEdit).Font.Color := clWindowText;
          end;
        end
        else if (Components[z] is TDBComboBox) then
        begin
          if ((Components[z] as TDBComboBox).Tag <> 97)  then
          begin
            (Components[z] as TDBComboBox).Tag := 0;
            (Components[z] as TDBComboBox).ReadOnly := False;
            (Components[z] as TDBComboBox).Font.Color := clWindowText;
          end;
        end
        else if (Components[z] is TDBMemo) then
        begin
          if ((Components[z] as TDBMemo).Tag <> 97)  then
          begin
            (Components[z] as TDBMemo).Tag := 0;
            (Components[z] as TDBMemo).ReadOnly := False;
            (Components[z] as TDBMemo).Font.Color := clWindowText;
          end;
        end
  //       else if (Components[z] is TDBCheckBox) then
  //       begin
  //         if ((Components[z] as TDBCheckBox).Tag <> 97)  then
  //         begin
  //           (Components[z] as TDBCheckBox).Tag := 0;
  //           (Components[z] as TDBCheckBox).ReadOnly := False;
  //           (Components[z] as TDBCheckBox).Font.Color := clWindowText;
  //         end;
  //       end
        else if (Components[z] is TDBLookupComboBox) then
        begin
          if ((Components[z] as TDBLookupComboBox).Tag <> 97)  then
          begin
            (Components[z] as TDBLookupComboBox).Tag := 0;
            (Components[z] as TDBLookupComboBox).ReadOnly := False;
            (Components[z] as TDBLookupComboBox).Font.Color := clWindowText;
          end;
        end;
      end;
    end;
  end;
  ComFat.dataSet.FieldByName('TIPO_VENDA_V').ReadOnly := true;
end;

function TfrmMovVeiculosCCIA._mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;

end;

initialization
  RegisterClass(TfrmMovVeiculosCCIA);
finalization
  UnRegisterClass(TfrmMovVeiculosCCIA);

end.

