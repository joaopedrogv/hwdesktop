unit UCadVeiculosCCIA;
(************************ Hw Sistemas e Computadores ***************************
1 - Listar o cadastro Simples
2 - Quando telacadastro é '0' o Cadastro de Oficina (Sem o campo Posição) e
consulta simples de cadastro de veículos, quando telacadastro é '5' Cadastro
para estoque (Com o campo Posição obrigatório).
3 - Salvar na tabela de Histórico (Estoque) ao utilizar o campo Posição. Também
alteração diferente do que já está cadastrado.
4 - Toda vez que tiver algum registro respectivo as abas que estão
no cadastro de veículos atualizar na tabela de veículo o status e ativar a
propriedade Highlighted da aba.
*******************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, Buttons, Grids, DBGrids, StdCtrls, Mask,
  ComCtrls, DBCtrls, uDtmAtivo, uDtmVeiculosCCIA, UClassesVeiculosCCIA, db, uDadosIni,
  UClassesClientes, AppEvnts, DBClient, IBDatabase;


type
  TFrmCadVeiculosCCIA = class(TfrmCadPadraoM)
    TabSheet_Contratos: TTabSheet;
    TabSheet_Notas: TTabSheet;
    TabSheet_Oficina: TTabSheet;
    TabSheet_MaisInformacoes: TTabSheet;
    ScrollBox5: TScrollBox;
    ScrollBox9: TScrollBox;
    ScrollBox10: TScrollBox;
    ScrollBox11: TScrollBox;
    BitBtn_Reserva: TBitBtn;
    BitBtn_Venda: TBitBtn;
    GroupBox20: TGroupBox;
    GroupBox_Posicao: TGroupBox;
    CheckBox_Transito: TCheckBox;
    CheckBox_Reserva: TCheckBox;
    CheckBox_TransfDep: TCheckBox;
    CheckBox_Demonstracao: TCheckBox;
    GroupBox21: TGroupBox;
    CheckBox_Novo: TCheckBox;
    CheckBox_Estoque: TCheckBox;
    CheckBox_SemEstoque: TCheckBox;
    CheckBox_Usado: TCheckBox;
    CheckBox_EstReal: TCheckBox;
    CheckBox_Cons: TCheckBox;
    CheckBox_Inter: TCheckBox;
    TabSheet_Dados: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label33: TLabel;
    Label37: TLabel;
    Label63: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label34: TLabel;
    Label75: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label92: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label70: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit14: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit30: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit31: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit43: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    DBEdit12: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Panel11: TPanel;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    DBGridNFE: TDBGrid;
    GroupBox9: TGroupBox;
    Panel15: TPanel;
    BitBtn29: TBitBtn;
    BitBtn20: TBitBtn;
    DBGridNFS: TDBGrid;
    Panel10: TPanel;
    GroupBox10: TGroupBox;
    rbNomeFantasia: TRadioButton;
    rbRazaoSocial: TRadioButton;
    GroupBox6: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn16: TBitBtn;
    GroupBox12: TGroupBox;
    Panel5: TPanel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    DBGridCTRE: TDBGrid;
    GroupBox13: TGroupBox;
    DBGridCTRS: TDBGrid;
    Panel14: TPanel;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    Panel17: TPanel;
    GroupBox11: TGroupBox;
    Panel18: TPanel;
    GroupBox14: TGroupBox;
    Label77: TLabel;
    Label76: TLabel;
    DBMemo_Observacoes: TDBMemo;
    DBMemo_Adicionais: TDBMemo;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    GroupBox15: TGroupBox;
    Panel6: TPanel;
    BitBtn8: TBitBtn;
    BitBtn11: TBitBtn;
    DBGridOrcamento: TDBGrid;
    GroupBox16: TGroupBox;
    DBGridOficina: TDBGrid;
    Panel4: TPanel;
    Label40: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Panel23: TPanel;
    Panel8: TPanel;
    Label7: TLabel;
    Panel9: TPanel;
    Label8: TLabel;
    BitBtn120: TBitBtn;
    Panel21: TPanel;
    Label38: TLabel;
    Panel33: TPanel;
    Label23: TLabel;
    Panel7: TPanel;
    Label6: TLabel;
    Panel22: TPanel;
    Label13: TLabel;
    BitBtn36: TBitBtn;
    BitBtn12: TBitBtn;
    Panel24: TPanel;
    Label41: TLabel;
    Panel19: TPanel;
    Label35: TLabel;
    Panel38: TPanel;
    Label48: TLabel;
    Panel12: TPanel;
    Label9: TLabel;
    Panel13: TPanel;
    Label10: TLabel;
    Panel16: TPanel;
    Label11: TLabel;
    BitBtn38: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn14: TBitBtn;
    GroupBoxNFE: TGroupBox;
    ScrollBoxNFE: TScrollBox;
    GroupBoxNFS: TGroupBox;
    ScrollBoxNFS: TScrollBox;
    GroupBoxCTRE: TGroupBox;
    ScrollBoxCTRE: TScrollBox;
    GroupBoxCTRS: TGroupBox;
    ScrollBoxCTRS: TScrollBox;
    GroupBoxORC: TGroupBox;
    ScrollBoxORC: TScrollBox;
    GroupBoxOS: TGroupBox;
    ScrollBoxOS: TScrollBox;
    PopupMenuNFE: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    PopupMenuNFS: TPopupMenu;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    PopupMenuCTRE: TPopupMenu;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    PopupMenuCTRS: TPopupMenu;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    PopupMenuORC: TPopupMenu;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    PopupMenuOS: TPopupMenu;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    TabSheet_NotasTransito: TTabSheet;
    GroupBox30: TGroupBox;
    Panel40: TPanel;
    GroupBox31: TGroupBox;
    DBGridNFT: TDBGrid;
    Panel44: TPanel;
    Label12: TLabel;
    Label90: TLabel;
    BitBtn42: TBitBtn;
    Panel46: TPanel;
    Panel48: TPanel;
    GroupBoxNFT: TGroupBox;
    ScrollBoxNFT: TScrollBox;
    PopupMenuNFT: TPopupMenu;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    btAlterarChassiPlaca: TSpeedButton;
    SpeedButton40: TSpeedButton;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosVeiculosClick: TMenuItem;
    DesmarcarTodosVeiculosClick: TMenuItem;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DesmarcarTodosVeiculosClickClick(Sender: TObject);
    procedure MarcarTodosVeiculosClickClick(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure btAlterarChassiPlacaClick(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure DBGridNFTDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridNFTColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure ScrollBoxNFTExit(Sender: TObject);
    procedure ScrollBoxNFTEnter(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure DBGridOficinaColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridOrcamentoColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridCTRSColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridCTREColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ScrollBoxOSExit(Sender: TObject);
    procedure ScrollBoxORCExit(Sender: TObject);
    procedure ScrollBoxCTRSExit(Sender: TObject);
    procedure ScrollBoxCTREExit(Sender: TObject);
    procedure ScrollBoxCTRSEnter(Sender: TObject);
    procedure ScrollBoxCTREEnter(Sender: TObject);
    procedure ScrollBoxOSEnter(Sender: TObject);
    procedure ScrollBoxORCEnter(Sender: TObject);
    procedure DBGridNFSColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridNFEColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ScrollBoxNFSExit(Sender: TObject);
    procedure ScrollBoxNFEExit(Sender: TObject);
    procedure ScrollBoxNFSEnter(Sender: TObject);
    procedure ScrollBoxNFEEnter(Sender: TObject);
    procedure BitBtn120Click(Sender: TObject);
    procedure DBGridOrcamentoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure rbNomeFantasiaClick(Sender: TObject);
    procedure DBGridOficinaTitleClick(Column: TColumn);
    procedure DBGridOficinaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridCTRSTitleClick(Column: TColumn);
    procedure DBGridCTRETitleClick(Column: TColumn);
    procedure DBGridCTRDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridNFSTitleClick(Column: TColumn);
    procedure DBGridNFETitleClick(Column: TColumn);
    procedure DBGridNFDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridNFEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PageControl3Change(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure DBEdit27Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit31KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit31Exit(Sender: TObject);
    procedure DBEdit_Valor_PendenciaKeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo_AdicionaisKeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo_ObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_PercentualReducaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_AliquotaICMSKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_ReajusteKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_PrecoCompraKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_PrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_PrecoCompraExit(Sender: TObject);
    procedure DBLookupComboBox_ModeloDropDown(Sender: TObject);
    procedure DBLookupComboBox_CorDropDown(Sender: TObject);
    procedure DBLookupComboBox_CorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox_CombustivelDropDown(Sender: TObject);
    procedure DBLookupComboBox_CombustivelKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBLookupComboBox_DescricaoMarcaDropDown(Sender: TObject);
    procedure DBLookupComboBox_DescricaoMarcaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBEdit_PlacaChange(Sender: TObject);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure DBMemo_ObsKeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo_OpcionaisKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox_NomeClienteExit(Sender: TObject);
    procedure DBEdit_CodigoClienteExit(Sender: TObject);
    procedure DBLookupComboBox_NomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label14Click(Sender: TObject);
    procedure BitBtn_ReservaClick(Sender: TObject);
    procedure BitBtn_VendaClick(Sender: TObject);
    procedure Label30Click(Sender: TObject);
    procedure DBLookupComboBox_ModeloClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBLookupComboBox_ModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_CodigoClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function _mdiAberto(pNomeFormMDI: string;  pMensagem: string = ''): Boolean;
    function _atualizarCombobox: Boolean;
    procedure AtualizarHistorico(pAtualizar: boolean = False; pAtualizarTudo: boolean = false);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
  	vCriou: Smallint;
    cdsColunasNFE, cdsColunasNFS, cdsColunasNFT, cdsColunasCTRE, cdsColunasCTRS, cdsColunasORC, cdsColunasOS: TClientDataSet;
    trans: TIBTransaction;
    vCheck: TCheckBox;
    vTabela, vCampoPadrao, vAlterarNomeDtSet: string;
    fReset: boolean;
    { Private declarations }
    procedure _buscarModelo;

  public
    { Public declarations }
    procedure HabilitarDesabilitarCamposTipoFormulario(Campos: TStrings);
  end;

var
  FrmCadVeiculosCCIA: TFrmCadVeiculosCCIA;
  Veiculo: TVeiculosCCIA;
  vCodModelo: Integer;


implementation
uses
  UReservaVeiculosCCIA, UClassesCadastrosBasicos, UDtmCadastrosBasicos, uClassesNotasFiscais,
  UDtmClientes, UListar, uDataSet_OOP;
{$R *.dfm}

procedure TFrmCadVeiculosCCIA.AtualizarHistorico(pAtualizar: boolean = False; pAtualizarTudo: boolean = False);
var
 pChassi, pPlaca: string;
begin
  pChassi := trim(Veiculo.dataSet.FieldByName('CHASSI').AsString);
  pPlaca := trim(Veiculo.dataSet.FieldByName('PLACA').AsString);
  if (PageControl3.ActivePage = TabSheet_Contratos) or pAtualizarTudo then
  begin
     if Veiculo.vHistCTRE.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       Veiculo.vHistCTRE.buscarHist(pChassi, pPlaca, 'CTR', 'E', rbRazaoSocial.Checked);
       Veiculo.vHistCTRE.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridCTRE.DataSource.DataSet.Last;
     end;
     if Veiculo.vHistCTRS.dataset.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       Veiculo.vHistCTRS.buscarHist(pChassi, pPlaca, 'CFT', 'S');
       Veiculo.vHistCTRS.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridCTRS.DataSource.DataSet.Last;
     end;
  end;
  if (PageControl3.ActivePage = TabSheet_Notas) or pAtualizarTudo then
  begin
     if Veiculo.vHistNFE.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       Veiculo.vHistNFE.buscarHist(pChassi, pPlaca, 'NF', 'E', rbRazaoSocial.Checked);
       Veiculo.vHistNFE.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridNFE.DataSource.DataSet.Last;
     end;

     if Veiculo.vHistNFS.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       Veiculo.vHistNFS.buscarHist(pChassi, pPlaca, 'NF', 'S', rbRazaoSocial.Checked);
       Veiculo.vHistNFS.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridNFS.DataSource.DataSet.Last;
     end;
  end;
  if (PageControl3.ActivePage = TabSheet_Oficina) or pAtualizarTudo then
  begin
     if Veiculo.vHistORC.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       Veiculo.vHistORC.buscarHist(pChassi, pPlaca, 'ORC', 'S', rbRazaoSocial.Checked);
       Veiculo.vHistORC.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridOrcamento.DataSource.DataSet.Last;
     end;

     if Veiculo.vHistOS.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       Veiculo.vHistOS.buscarHist(pChassi, pPlaca, 'OS', 'S', rbRazaoSocial.Checked);
       Veiculo.vHistOS.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridOficina.DataSource.DataSet.Last;
     end;
  end;
  if (PageControl3.ActivePage = TabSheet_NotasTransito) or pAtualizarTudo then
  begin
     if Veiculo.vHistNFT.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       Veiculo.vHistNFT.buscarHist(pChassi, pPlaca, 'NF', 'T', rbRazaoSocial.Checked);
       Veiculo.vHistNFT.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridNFT.DataSource.DataSet.Last;
     end;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn10Click(Sender: TObject);
begin
  inherited;
   try
     Screen.Cursor := crHourGlass;

     if DBGridOficina.DataSource.DataSet.IsEmpty then
      exit;
     if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
       Veiculo.vHistOS.ImprimirPedVenda(DBGridOficina.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, DBGridOficina.DataSource.DataSet.FieldByName('TIPO').AsString);
   finally
     vDadosIni.vPesquisa := '';
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn11Click(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;

     if DBGridOrcamento.DataSource.DataSet.IsEmpty then
      exit;
     if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
       Veiculo.vHistORC.ImprimirPedVenda(DBGridOrcamento.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, DBGridOrcamento.DataSource.DataSet.FieldByName('TIPO').AsString);
   finally
     vDadosIni.vPesquisa := '';
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn120Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    AtualizarHistorico(true, true);
    vDadosIni.montarExcel(DBGridNFE, 'Notas Fiscal de Entrada', 'A');
    vDadosIni.montarExcel(DBGridNFS, 'Nota Fiscais de Saída', 'N');
    vDadosIni.montarExcel(DBGridNFT, 'Nota Fiscais em Trânsito', 'N');
    vDadosIni.montarExcel(DBGridCTRE, 'Contrato de Entrada', 'N');
    if (vDadosIni.vEmp.vTipoEmpVeiculos <> 'C') then
      vDadosIni.montarExcel(DBGridCTRS, 'Contrato de Saída', 'N')
    else
      vDadosIni.montarExcel(DBGridCTRS, 'Comando de Faturamento', 'N');
    vDadosIni.montarExcel(DBGridOrcamento, 'Orçamento', 'N');
    vDadosIni.montarExcel(DBGridOficina, 'Ordem de Serviço', 'F');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn12Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFS.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        Veiculo.vHistNFS.GravarCodNFdatasetTemp(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        vNf.cadAbrirNfIntegracaoCanc(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn13Click(Sender: TObject);
begin
  inherited;
   try
     Screen.Cursor := crHourGlass;

     if DBGridCTRS.DataSource.DataSet.IsEmpty then
      exit;

     if _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
       Veiculo.vHistCTRS.abrirComFat(DBGridCTRS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, 1);
   finally
      AtualizarHistorico(true);
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn14Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridOficina.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
      Veiculo.vHistOS.abrirPedVenda(DBGridOficina.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, DBGridOficina.DataSource.DataSet.FieldByName('TIPO').AsString, 1);
  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn1Click(Sender: TObject);
begin
	try
    inherited;
    if not vDadosIni.PesqPros('VEI025', 'CONSULTA', '', 'VEICULOS', '',
      Veiculo.buscas, true) then
        Exit;
        
    SpeedButton2.Hint := 'Enviar para Lixeira - [VEI008]';

    Screen.Cursor := crHourGlass;
    Veiculo.vCons.campo := ComboBox1.Text;
    Veiculo.vCons.ordem := ComboBox2.Text;
    Veiculo.vCons.condicao := ComboBox3.Text;
    Veiculo.vCons.valor := MaskEdit3.Text;
    Veiculo.vCons.dataIni := MaskEdit1.Text;
    Veiculo.vCons.dataFim := MaskEdit2.Text;
    Veiculo.vCons.porData := MaskEdit1.Visible;
    Veiculo.consulta;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if not Veiculo.IsEmpty then
      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
  finally
  	gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn20Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridNFS.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        vNf.selecionaNotaFiscal(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        if DBGridNFS.DataSource.DataSet.FieldByName('emissao_propria').AsString = 'S' then
          vNf.imprimeNotaFiscal
        else
          vNf.imprimeEspelhoNF;
      finally
         vNf.Free;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn21Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridCTRE.DataSource.DataSet.IsEmpty then
    exit;

    if _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
       Veiculo.vHistCTRE.abrirComFat(DBGridCTRE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);

  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn22Click(Sender: TObject);
var
  vComFatEstMoto: TComFat;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridCTRE.DataSource.DataSet.IsEmpty then
      exit;

    try
      vComFatEstMoto := TComFat.create;
      vComFatEstMoto.abreComFat(DBGridCTRE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      if not (vComFatEstMoto.dataSet.State in [dsInsert, dsEdit]) then
         vComFatEstMoto.Edit;
      vComFatEstMoto.ImprimirContratoComando;
      vComFatEstMoto.dataSet.Cancel;
    finally
      vComFatEstMoto.Free;
    end;
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn23Click(Sender: TObject);
begin
  inherited;
   try
     Screen.Cursor := crHourGlass;

     if DBGridCTRS.DataSource.DataSet.IsEmpty then
      exit;

     if _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
       Veiculo.vHistCTRS.abrirComFat(DBGridCTRS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
   finally
      AtualizarHistorico(true);
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn24Click(Sender: TObject);
var
  vComFatEstMoto: TComFat;
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;

     if DBGridCTRS.DataSource.DataSet.IsEmpty then
      exit;
     if trim(DBGridCTRS.DataSource.DataSet.FieldByName('TIPO').AsString) = 'CFT' then
       if not _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
         exit;
     try
       vComFatEstMoto := TComFat.create;
       vComFatEstMoto.abreComFat(DBGridCTRS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
       if not (vComFatEstMoto.dataSet.State in [dsInsert, dsEdit]) then
         vComFatEstMoto.Edit;
       vComFatEstMoto.ImprimirContratoComando;
       vComFatEstMoto.dataSet.Cancel;
     finally
       vComFatEstMoto.Free;
     end;
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn25Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFE.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        vNf.cadAbrirNfIntegracao(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn26Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
     Screen.Cursor := crHourGlass;

     if DBGridNFE.DataSource.DataSet.IsEmpty then
      exit;
     if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
     begin
       try
         vNf := TNFCab.create;
         vNf.selecionaNotaFiscal(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
         if DBGridNFE.DataSource.DataSet.FieldByName('emissao_propria').AsString = 'S' then
           vNf.imprimeNotaFiscal
         else
           vNf.imprimeEspelhoNF;
       finally
         vNf.Free;
       end;
     end;
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn29Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridNFS.DataSource.DataSet.IsEmpty then
     exit;

    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        vNf.cadAbrirNfIntegracao(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn32Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFE.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      Application.MessageBox('Será aberto o módulo de Nota Fiscal. Faça a consulta da nota e efetue o Cancelamento ou a exclusão!',
        'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      try
        vNf := TNFCab.create;
        Veiculo.vHistNFE.GravarCodNFdatasetTemp(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        vNf.cadAbrirNfIntegracaoCanc(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn33Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFS.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      Application.MessageBox('Será aberto o módulo de Nota Fiscal. Faça a consulta da nota e efetue o Cancelamento ou a exclusão!',
        'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      try
        vNf := TNFCab.create;
        Veiculo.vHistNFS.GravarCodNFdatasetTemp(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        vNf.cadAbrirNfIntegracaoCanc(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn36Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFE.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        Veiculo.vHistNFE.GravarCodNFdatasetTemp(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        vNf.cadAbrirNfIntegracaoCanc(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn38Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridCTRE.DataSource.DataSet.IsEmpty then
    exit;

    if _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
       Veiculo.vHistCTRE.abrirComFat(DBGridCTRE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, 1);

  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
	try
  // Se ele tive clicado em Novo na telacadastro tipo '5'
  // e clicar em abas diferentes
  // de Dados do Veículo e Dados Complementares para continuar
  // o cadastro verificar se foram preechidos todos os campos obrigatórios
  // e incluir veículo na tabela e utilizar código do veículo para os demais
  // cadastros.
    if not vDadosIni.PesqPros('VEI006', 'INCLUIR', '', 'VEICULOS', '', veiculo.buscas, true) then
      exit;

    Screen.Cursor := crHourGlass;

    if not Veiculo.Insert then
      exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    inherited;

    TabSheet3.TabVisible := false;
    TabSheet_Dados.TabVisible := true;
    TabSheet_Contratos.TabVisible := false;
    TabSheet_Notas.TabVisible := false;
    TabSheet_NotasTransito.TabVisible := false;
    TabSheet_Oficina.TabVisible := false;
    TabSheet_MaisInformacoes.TabVisible := true;
    PageControl3.ActivePage := TabSheet_Dados;
    TabSheet_Dados.Show;
    ComboBox4.Text := '';
    ComboBox5.Text := '';
    ComboBox4.Visible := false;
    ComboBox5.Visible := false;
    Label65.Visible := false;
    Label70.Visible := false;
    Label14.Visible := (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S');
    DBEdit7.Visible := (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S');
    TabSheet_Dados.Caption := 'Dados do Veículo';
    Veiculo.verificatipovenda(1, DBComboBox1, 'OS', '');
    vCodModelo := 0;

    Label80.Enabled := true;
    DBEdit18.Enabled := true;
    Label81.Enabled := true;
    DBEdit26.Enabled := true;
    btAlterarChassiPlaca.Visible := false;

    if vDadosIni.vVeic.vDesabilitarChassi then
    begin
      Label80.Visible := false;
    	DBEdit18.Visible := false;
    end
    else
    begin
    	Label80.Visible := true;
    	DBEdit18.Visible := true;
    end;

    if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
      DBEdit18.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
    	DBEdit26.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit31.CanFocus) then
    	DBEdit31.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn40Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridOrcamento.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
      Veiculo.vHistORC.abrirPedVenda(DBGridOrcamento.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, DBGridOrcamento.DataSource.DataSet.FieldByName('TIPO').AsString, 1);
  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn42Click(Sender: TObject);
var
 vEstMotoTransito: TEstMotoTransitoCCIA;
begin
  try
    Screen.Cursor := crHourGlass;

    if DBGridNFT.DataSource.dataSet.IsEmpty then
     exit;

    if _mdiAberto('FrmTransitoVeiculosCCIA', 'O modulo de Nota Fiscal em Transito se encontra aberto!') then
    begin
      try
        vEstMotoTransito := TEstMotoTransitoCCIA.create;
        vEstMotoTransito.CadEstMotoTransito(1, DBGridNFT.DataSource.DataSet.FieldByName('NUM_NOTA').AsInteger);
      finally
        vEstMotoTransito.Free;
      end;
    end;
  finally
     vDadosIni.fechaStatusProcessamento;
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not vDadosIni.PesqPros('VEI011', 'SALVAR', 'CHASSI ' + Veiculo.dataSet.FieldByName('CHASSI').AsString,
    'VEICULOS', Veiculo.dataSet.FieldByName('CODIGO').AsString, veiculo.buscas, true) then
    exit;
  try
    Screen.Cursor := crHourGlass;
    if not Veiculo.Post then
      setFocusCampoErro(Veiculo.vNomeCampoErro, Veiculo.vMensagemErro)
    else
    begin
      if TelaCadastro = 1 then
      begin
        BitBtn6.Click;
        Exit;
      end;
      if CheckCadSeq.Checked then
      begin
        if Veiculo.Insert then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
          	DBEdit18.SetFocus;
        MudaCor;
      end
      else
        inherited;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn5Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn5.CanFocus) then
  	BitBtn5.SetFocus;
    
  ActiveControl := BitBtn5;
  PageControl1.ActivePage := TabSheet2;
  Veiculo.Cancel;
  Veiculo.RollBackTransacao;
  Veiculo.Refresh;

  if (TelaCadastro = 5) then
  begin
    TelaCadastro := 0;
    inherited;
    TelaCadastro := 5;
  end
  else
  begin
    inherited;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn8Click(Sender: TObject);
begin
  inherited;
 try
    Screen.Cursor := crHourGlass;

    if DBGridOrcamento.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
      Veiculo.vHistORC.abrirPedVenda(DBGridOrcamento.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, DBGridOrcamento.DataSource.DataSet.FieldByName('TIPO').AsString);
  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn9Click(Sender: TObject);
begin
 inherited;
 try
    Screen.Cursor := crHourGlass;

    if DBGridOficina.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
      Veiculo.vHistOS.abrirPedVenda(DBGridOficina.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, DBGridOficina.DataSource.DataSet.FieldByName('TIPO').AsString);
  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.BitBtn_ReservaClick(Sender: TObject);
//var
//  FrmReserva: TFrmReservaVeiculosCCIA;
begin
//  inherited;
//  Application.CreateForm(TFrmReservaVeiculosCCIA, FrmReserva);
//  FrmReserva.ShowModal;
end;

procedure TFrmCadVeiculosCCIA.BitBtn_VendaClick(Sender: TObject);
begin
(*
//Exibir opções de acordo com o tipo de veículo ex: Veículo Novo - Diretamente
//no formulário de vendas ou exibir outras opções.
1 - Pegar veículos em posição estoque e transito e não estiver em demonstração
nem vendido
2 - Ao vender veículo verificar PEPS(Primeiro que saí primeiro que entra)
*)
//  inherited;
//  Veiculo._VendaVeiculos(1);
end;


procedure TFrmCadVeiculosCCIA.btAlterarChassiPlacaClick(Sender: TObject);
var
  vChassi: string;
  vPlaca: string;
  vCodigo: Integer;
begin
  inherited;
  vCodigo := Veiculo.dataset.FieldByName('CODIGO').AsInteger;
  vChassi := trim(Veiculo.dataset.FieldByName('CHASSI').AsString);
  vPlaca  := trim(Veiculo.dataset.FieldByName('PLACA').AsString);

	if not vDadosIni.AtualizarChassiPlaca(vChassi, vPlaca, Veiculo.buscas) then
  	exit;

  Veiculo.abreVeiculos(vPlaca, vChassi, vCodigo);
  if not (Veiculo.dataset.State in [dsEdit, dsInsert]) then
	 	Veiculo.dataset.Edit;
end;

procedure TFrmCadVeiculosCCIA.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Veiculo._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadVeiculosCCIA.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Veiculo._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadVeiculosCCIA.CheckBox3Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 210
  else
    GroupBox3.Height := 73;
end;

procedure TFrmCadVeiculosCCIA.DBEdit_AliquotaICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadVeiculosCCIA.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (DBComboBox1.text <> '') and (ActiveControl <> bitbtn5) then
    if not Veiculo.verificatipovenda(2, DBComboBox1, 'OS', DBComboBox1.text) then
      if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      	DBComboBox1.setfocus;
end;

procedure TFrmCadVeiculosCCIA.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  if Veiculo.dataSet.FieldByName('COD_MARCA').AsInteger > 0 then
  begin
    if not Veiculo.vMarcaVeic.buscarMarca(Veiculo.dataSet.FieldByName('COD_MARCA').AsInteger) then
    begin
      Veiculo.dataSet.FieldByName('MARCA_V').AsVariant := Null;
      Application.MessageBox('Marca não encontrado', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit14.CanFocus) then
        DBEdit14.SetFocus;
      exit;
    end;
    Veiculo.dataSet.FieldByName('MARCA_V').AsString := copy(trim(Veiculo.vMarcaVeic.buscas.FieldByName('DESCRICAO_MARCA').AsString), 1, 15);
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vMarcaVeic: TMarcas;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD',
        ' AND TIPO_MARCA =''V''', 'Consulta de Marcas');
      if vDadosIni.vPesquisa <> '' then
        Veiculo.dataSet.FieldByName('COD_MARCA').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadMarcas') then
      exit;
    Veiculo.vModVeic.AbrirMarca;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        Veiculo.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
        Veiculo.vMarcaVeic._AbreMarca;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit18Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if Veiculo.verificajacad(1) then
  begin
    if Application.MessageBox('Veiculo já cadastrado com este chassi, Deseja alterar seus dados?',
      'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      Veiculo.abreVeiculos;
      Veiculo.verificatipovenda(1, DBComboBox1, 'OS', '');
      _atualizarCombobox;
      _buscarModelo;
      if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
        DBEdit26.SetFocus;
    end
    else
    begin
      if Application.MessageBox('Existe um veículo com este mesmo chassi, Deseja continuar com o cadastro?',
        'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if not vDadosIni.PesqPros('VEI032', 'PERMITIR CADASTRAR VEICULO COM MESMO CHASSI',
         'CHASSI ' + Veiculo.dataSet.FieldByName('CHASSI').AsString, 'VEICULOS', Veiculo.dataSet.FieldByName('CODIGO').AsString,
         Veiculo.buscas, true) then
        begin
          if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
            DBEdit18.SetFocus;
        end;
      end
      else
      begin
        if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
          DBEdit18.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit26Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if Veiculo.verificajacad(2) then
  begin
    if Application.MessageBox('Veiculo já cadastrado com esta placa, Deseja alterar seus dados?',
      'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      Veiculo.abreVeiculos;
      Veiculo.verificatipovenda(1, DBComboBox1, 'OS', '');
      _atualizarCombobox;
      _buscarModelo;
      if (Self.Enabled) and (Self.Visible) and (DBEdit31.CanFocus) then
        DBEdit31.setfocus;
    end
    else
    begin
      if Application.MessageBox('Existe um veículo com esta mesma placa, Deseja continuar com o cadastro?',
        'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if not vDadosIni.PesqPros('VEI031', 'PERMITIR CADASTRAR VEICULO COM MESMA PLACA',
        'PLACA ' + Veiculo.dataSet.FieldByName('PLACA').AsString, 'VEICULOS', Veiculo.dataSet.FieldByName('CODIGO').AsString,
        Veiculo.buscas, true) then
        begin
          if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
            DBEdit26.SetFocus;
        end;
      end
      else
      begin
        if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
          DBEdit26.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit27Exit(Sender: TObject);
begin
  inherited;
 if Veiculo.dataSet.FieldByName('COD_COR').AsInteger > 0 then
  begin
    if not Veiculo.vCoresVeic.buscarCor(Veiculo.dataSet.FieldByName('COD_COR').AsInteger) then
    begin
      Veiculo.dataSet.FieldByName('COR').AsVariant := Null;
      Application.MessageBox('Cor não encontrada', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit27.CanFocus) then
        DBEdit27.SetFocus;
      exit;
    end;
    Veiculo.dataSet.FieldByName('COR').AsString := copy(trim(Veiculo.vCoresVeic.buscas.FieldByName('DESCRICAO_COR').AsString), 1, 10);
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCor: TCores;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      Veiculo.dataSet.FieldByName('COD_COR').AsString := vDadosIni.pesquisaRapida('CODIGO_CORFAB');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadCores') then
      exit;
    Veiculo.AbrirCores;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        Veiculo.dataSet.FieldByName('COD_COR').AsString := vDadosIni.vPesquisa;
        Veiculo.vCoresVeic._AbreCores;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if Veiculo.verificajacad(2) then
  begin
    if Application.MessageBox('Veiculo já cadastrado, Deseja alterar seus dados?',
      'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      Veiculo.abreVeiculos;
      if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
      	DBEdit18.setfocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
      DBEdit18.SetFocus;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit31Exit(Sender: TObject);
begin
  inherited;

   if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if (vCodModelo <= 0) and (Veiculo.dataSet.State = dsEdit) then
    vCodModelo := Veiculo.dataSet.FieldByName('MODELO').AsInteger;

  if Veiculo.dataSet.FieldByName('MODELO').AsInteger > 0 then
  begin
    if not Veiculo.vModVeic.buscarModelo(Veiculo.dataSet.FieldByName('MODELO').AsInteger) then
    begin
      Application.MessageBox('Modelo não encontrado!', 'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit31.CanFocus) then
        DBEdit31.SetFocus;
      exit;
    end;

      if vCodModelo <> Veiculo.dataSet.FieldByName('MODELO').AsInteger then
      begin
        vCodModelo := Veiculo.dataSet.FieldByName('MODELO').AsInteger;
        Veiculo.dataSet.FieldByName('COD_MARCA').AsVariant := Null;
        Veiculo.dataSet.FieldByName('COD_COMBUSTIVEL').AsVariant := Null;
        Veiculo.dataSet.FieldByName('LOTACAO').AsVariant := Null;
        Veiculo.dataSet.FieldByName('COD_ESPE_SEG').AsVariant := Null;
        Veiculo.dataSet.FieldByName('ANOFAB').AsVariant := Null;
        Veiculo.dataSet.FieldByName('ANOMOD').AsVariant := Null;
        Veiculo.dataSet.FieldByName('HP').AsVariant := Null;
        Veiculo.dataSet.FieldByName('CILINDROS').AsVariant := Null;
        Veiculo.dataSet.FieldByName('CILINDRADA').AsVariant := Null;
        Veiculo.dataSet.FieldByName('RENAVAM').AsVariant := Null;
        Veiculo.dataSet.FieldByName('DESCMODELO').AsVariant := Null;
        Veiculo.dataSet.FieldByName('MARCA_V').AsVariant := Null;
        Veiculo.dataSet.FieldByName('COMBUSTIVEL').AsVariant := Null;
        ComboBox4.Text := '';
        ComboBox5.Text := '';
        ComboBox4.Visible := false;
        ComboBox5.Visible := false;
        Label65.Visible := false;
        Label70.Visible := false;

        Veiculo.dataSet.FieldByName('COD_MARCA').AsInteger := Veiculo.vModVeic.buscas.FieldByName('COD_MARCA').AsInteger;
        Veiculo.dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger := Veiculo.vModVeic.buscas.FieldByName('COD_COMBUSTIVEL').AsInteger;
        Veiculo.dataSet.FieldByName('LOTACAO').AsString := Veiculo.vModVeic.buscas.FieldByName('LOTACAO').AsString;
        Veiculo.dataSet.FieldByName('COD_ESPE_SEG').AsInteger := Veiculo.vModVeic.buscas.FieldByName('COD_TIPO_ESP').AsInteger;
        Veiculo.dataSet.FieldByName('ANOFAB').AsInteger := Veiculo.vModVeic.buscas.FieldByName('ANO1').AsInteger;
        Veiculo.dataSet.FieldByName('ANOMOD').AsInteger := Veiculo.vModVeic.buscas.FieldByName('MODELO1').AsInteger;
        Veiculo.dataSet.FieldByName('HP').AsFloat := Veiculo.vModVeic.buscas.FieldByName('HP').AsFloat;
        Veiculo.dataSet.FieldByName('CILINDROS').AsFloat := Veiculo.vModVeic.buscas.FieldByName('CILINDROS').AsFloat;
        Veiculo.dataSet.FieldByName('CILINDRADA').AsFloat := Veiculo.vModVeic.buscas.FieldByName('CILINDRADA').AsFloat;
        Veiculo.dataSet.FieldByName('RENAVAM').AsString := Veiculo.vModVeic.buscas.FieldByName('RENAVAM').AsString;

        Veiculo.dataSet.FieldByName('DESCMODELO').AsString := copy(Veiculo.vModVeic.buscas.FieldByName('DESCRICAO').AsString, 1, 30);
        Veiculo.dataSet.FieldByName('MARCA_V').AsString := copy(Veiculo.vModVeic.buscas.FieldByName('MARCA_DESC').AsString, 1, 15);
        Veiculo.dataSet.FieldByName('COMBUSTIVEL').AsString := copy(Veiculo.vModVeic.buscas.FieldByName('COMBUSTIVEL').AsString, 1, 8);
      end;
//    end;

    _buscarModelo;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit31KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vModeloVeic: TModVeiculoCCIA;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      Veiculo.dataSet.FieldByName('MODELO').AsString := vDadosIni.pesquisaRapida('TIPMODELO');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TFrmCadModVeiculosCCIA') then
      exit;
    Veiculo.AbrirModeloVeic;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        Veiculo.dataSet.FieldByName('MODELO').AsString := vDadosIni.vPesquisa;
        Veiculo.vModVeic.abreModVeiculos;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if Veiculo.verificajacad(1) then
  begin
    if Application.MessageBox('Veiculo já cadastrado, Deseja alterar seus dados?',
      'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      Veiculo.abreVeiculos;
      if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
      	DBEdit18.setfocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
      DBEdit18.SetFocus;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit4Exit(Sender: TObject);
begin
  inherited;
   if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if Veiculo.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
    if not Veiculo.vClientesVeic.abreClientes(Veiculo.dataSet.FieldByName('COD_CLIENTE').asinteger) then
    begin
      Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
    end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      Veiculo.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes') then
      exit;
    Veiculo.vClientesVeic.AbrirCliente(Veiculo.dataSet.FieldByName('COD_CLIENTE').AsString);
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        Veiculo.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
        Veiculo.vClientesVeic.abreClientes(Veiculo.dataSet.FieldByName('COD_CLIENTE').AsInteger);
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;


procedure TFrmCadVeiculosCCIA.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if Veiculo.dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger > 0 then
  begin
    if not Veiculo.vCombustivelVeic.buscarCombustivel(Veiculo.dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger) then
    begin
      Veiculo.dataSet.FieldByName('COMBUSTIVEL').AsVariant := Null;
      Application.MessageBox('Combustível não encontrado', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
        DBEdit8.SetFocus;
      exit;
    end;
    Veiculo.dataSet.FieldByName('COMBUSTIVEL').AsString := copy(trim(Veiculo.vCombustivelVeic.buscas.FieldByName('DESCR_COMB').AsString), 1, 8);
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCombustivel: TCombustivel;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      Veiculo.dataSet.FieldByName('COD_COMBUSTIVEL').AsString := vDadosIni.pesquisaRapida('TP_COMB_RENAVAM');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadCombustivel') then
      exit;
    Veiculo.vModVeic.AbrirCombustivel;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        Veiculo.dataSet.FieldByName('COD_COMBUSTIVEL').AsString := vDadosIni.vPesquisa;
        Veiculo.vCombustivelVeic.abreTipoCombustiveis;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit_CodigoClienteExit(Sender: TObject);
begin
  inherited;
  if TDbedit(sender).text = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
      if (Trim(vDadosIni.vPesquisa) = '') then
        vDadosIni.vPesquisa := '0';
      Veiculo.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if TDbedit(sender).text <> '' then
  begin
    Veiculo.vClientesVeic.abreClientes(Veiculo.dataSet.FieldByName('COD_CLIENTE').AsInteger);
  end;

end;

procedure TFrmCadVeiculosCCIA.DBEdit_CodigoClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Cliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('VEI001', 'PESQUISAR', '', 'VEICULOS', '', veiculo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
        if vDadosIni.vPesquisa <> '' then
          Veiculo.dataSet.FieldByName('COD_CLIENTE').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('VEI002', 'INCLUIR', '', 'VEICULOS', '', veiculo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := inttostr(Veiculo.dataSet.FieldByName('COD_CLIENTE').AsInteger);
        Cliente.CadCliente(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBEdit_PercentualReducaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadVeiculosCCIA.DBEdit_PlacaChange(Sender: TObject);
begin
  inherited;
{
  Marcara de campos opcionais, pois campos obrigatórios quando é vazio gera erro.
  Mascara grava no banco por causa dos registros antigos, se não grava a mascara
  no banco ele fica na exibução do grid com dois traços = '--'
}
end;

procedure TFrmCadVeiculosCCIA.DBEdit_PrecoCompraExit(Sender: TObject);
//
//  function _VerificaMargemPrecoMinimoModelo(): Double;
//  begin
//    if (Veiculo.dataSet.FieldByName('MODELO').IsNull) then
//    begin
//      result := 0;
//    end
//    else
//      result := Veiculo.vModVeic.dataSet.FieldByName('MARGEM_PRECO_MIN').AsFloat;
//  end;
//
begin
//  inherited;
//  if Veiculo.dataSet.FieldByName('PRECO_COMPRA').IsNull then
//  begin
//    Veiculo.dataSet.FieldByName('PRECO_COMPRA').AsInteger := 0;
//  end;
//  Veiculo.dataSet.FieldByName('PRECO_COMPRA_DESPESA').AsFloat :=
//         {colocar despesas}0 + Veiculo.dataSet.FieldByName('PRECO_COMPRA').AsFloat;
//
//  DBEdit_PrecoMinSistema.Text :=
//    FloatToStrF((Veiculo.dataSet.FieldByName('PRECO_COMPRA_DESPESA').AsFloat
//    + _VerificaMargemPrecoMinimoModelo),
//    ffFixed, 4, 2);
//  DBEdit_ReajusteExit(Sender);
//

end;

procedure TFrmCadVeiculosCCIA.DBEdit_PrecoCompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadVeiculosCCIA.DBEdit_PrecoVendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadVeiculosCCIA.DBEdit_ReajusteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadVeiculosCCIA.DBEdit_Valor_PendenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadVeiculosCCIA.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    Veiculo._marcaDesmarcaLinha;
end;

procedure TFrmCadVeiculosCCIA.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmCadVeiculosCCIA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    if not Veiculo.dataSet.IsEmpty then
      Veiculo._marcaDesmarcaLinha;
end;

procedure TFrmCadVeiculosCCIA.DBGridCTRDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CTR')
      or (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CFT'))
       and ((UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString)) = 'ABERTO')
       or (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = '')) then
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
    end
    else if ((trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CTR')
      or (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CFT'))
       and (UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString)) = 'CANCELADO') then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
         TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
         TDBGrid(sender).canvas.Font.color := clWhite;
       end;
    end
    else if (((trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CTR')
          and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('MODELO').AsString) <> 'CTRINTERM'))
          or (TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString = 'CFT'))
         and (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_NF_CFT').AsInteger <= 0)
         and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('MODELO_NF').AsString) = '55') then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
           TDBGrid(sender).canvas.brush.color := clRed;
           TDBGrid(sender).canvas.Font.color := clWhite;
       end;
    end;
      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadVeiculosCCIA.DBGridCTREColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridCTRE.Columns.Count - 1 do
    DBGridCTRE.Columns[i].Title.Font.Style := [];
  DBGridCTRE.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasCTRE, DBGridCTRE, vDadosIni.vNomeUsuario, 'cdsHistCTREVeiculos', self, ScrollBoxCTRE, trans);
end;

procedure TFrmCadVeiculosCCIA.DBGridCTRETitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGridCTRE, Column);
end;

procedure TFrmCadVeiculosCCIA.DBGridCTRSColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridCTRS.Columns.Count - 1 do
    DBGridCTRS.Columns[i].Title.Font.Style := [];
  DBGridCTRS.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasCTRS, DBGridCTRS, vDadosIni.vNomeUsuario, 'cdsHistCTRSVeiculos', self, ScrollBoxCTRS, trans);
end;

procedure TFrmCadVeiculosCCIA.DBGridCTRSTitleClick(Column: TColumn);
begin
  inherited;
vDadosIni.DBGridOnTitleClick(DBGridCTRS, Column);
end;

procedure TFrmCadVeiculosCCIA.DBGridNFEColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridNFE.Columns.Count - 1 do
    DBGridNFE.Columns[i].Title.Font.Style := [];
  DBGridNFE.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFE, DBGridNFE, vDadosIni.vNomeUsuario, 'cdsHistNFEVeiculos', self, ScrollBoxNFE, trans);
end;

procedure TFrmCadVeiculosCCIA.DBGridNFEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
vDadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TFrmCadVeiculosCCIA.DBGridNFETitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGridNFE, Column);
end;

procedure TFrmCadVeiculosCCIA.DBGridNFDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
 if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'NF')
   and ((UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_NFE').AsString)) = 'ABERTA')
   or   (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_NFE').AsString) = '')) then
 begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clRed;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
 end
 else  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'NF')
  and ((UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_NFE').AsString)) = 'CANCELADA')
  or   (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_NFE').AsString) = '')) then
 begin
   if (gdFocused in State) then
   begin
     TDBGrid(sender).canvas.brush.color := clWindow;
     TDBGrid(sender).canvas.Font.color := clWindowText;
   end
   else
   begin
     TDBGrid(sender).canvas.brush.color := TColor($00009BDD);;
     TDBGrid(sender).canvas.Font.color := clWhite;
   end;
 end;
 TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadVeiculosCCIA.DBGridNFSColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridNFS.Columns.Count - 1 do
    DBGridNFS.Columns[i].Title.Font.Style := [];
  DBGridNFS.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFS, DBGridNFS, vDadosIni.vNomeUsuario, 'cdsHistNFSVeiculos', self, ScrollBoxNFS, trans);
end;

procedure TFrmCadVeiculosCCIA.DBGridNFSTitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGridNFS, Column);
end;

procedure TFrmCadVeiculosCCIA.DBGridNFTColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridNFT.Columns.Count - 1 do
    DBGridNFT.Columns[i].Title.Font.Style := [];
  DBGridNFT.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFT, DBGridNFT, vDadosIni.vNomeUsuario, 'cdsHistNFTEstmotos', self, ScrollBoxNFT, trans);
end;

procedure TFrmCadVeiculosCCIA.DBGridNFTDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = 'CANCELADA') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = '')
  and (TDBGrid(sender).DataSource.DataSet.FieldByName('NUM_NOTA').AsInteger > 0) then
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

procedure TFrmCadVeiculosCCIA.DBGridOficinaColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridOficina.Columns.Count - 1 do
    DBGridOficina.Columns[i].Title.Font.Style := [];
  DBGridOficina.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasOS, DBGridOficina, vDadosIni.vNomeUsuario, 'cdsHistOSVeiculos', self, ScrollBoxOS, trans);
end;

procedure TFrmCadVeiculosCCIA.DBGridOficinaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'OS')
   and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) <> 'CANCELADO')
   and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) <> 'FECHADA') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clRed;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'OS')
   and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = 'CANCELADO') then
  begin 
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadVeiculosCCIA.DBGridOficinaTitleClick(Column: TColumn);
begin
  inherited;
vDadosIni.DBGridOnTitleClick(DBGridOficina, Column);
end;

procedure TFrmCadVeiculosCCIA.DBGridOrcamentoColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridOrcamento.Columns.Count - 1 do
    DBGridOrcamento.Columns[i].Title.Font.Style := [];
  DBGridOrcamento.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasORC, DBGridOrcamento, vDadosIni.vNomeUsuario, 'cdsHistORCVeiculos', self, ScrollBoxORC, trans);
end;

procedure TFrmCadVeiculosCCIA.DBGridOrcamentoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'ORC')
   and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = 'CANCELADO') then
  begin 
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_NomeClienteExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).text = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
      if (Trim(vDadosIni.vPesquisa) = '') then
        vDadosIni.vPesquisa := '0';
      Veiculo.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if TDBLookupComboBox(sender).text <> '' then
  begin
    if not Veiculo.vClientesVeic.abreClientes(Veiculo.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
      exit;
    end;
  end;
 {
  if trim(TDBLookupComboBox(sender).Text) = '' then
  begin
    Application.MessageBox('Campo Cliente não pode ser vazio', 'Informação', MB_OK +
      MB_DEFBUTTON1);
    TDBLookupComboBox(sender).setfocus;
    exit;
  end;
  }
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_NomeClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      //      vDadosIni.vPesquisa := inttostr(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
      Veiculo.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    vCliente := TCadClientes.create;
    vCliente.CadCliente(1);
  end;
end;

procedure TFrmCadVeiculosCCIA.DBMemo_AdicionaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//Deixa os caracteres maiusculos
  Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TFrmCadVeiculosCCIA.DBMemo_ObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//Deixa os caracteres maiusculos
  Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TFrmCadVeiculosCCIA.DBMemo_ObsKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//Deixa os caracteres maiusculos
  Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TFrmCadVeiculosCCIA.DBMemo_OpcionaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //Deixa os caracteres maiusculos
  Key := AnsiUpperCase(Key)[Length(Key)];


end;

procedure TFrmCadVeiculosCCIA.DesmarcarTodosVeiculosClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Veiculo._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_CombustivelDropDown(Sender: TObject);
begin
  inherited;
  DtmVeiculosCCIA.qrAbreTPComb.Active := false;
  DtmVeiculosCCIA.qrAbreTPComb.Active := true;
end;


procedure TFrmCadVeiculosCCIA.DBLookupComboBox_CombustivelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Comb: TCombustivel;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('VEI003', 'PESQUISAR', '', '', '', Veiculo.buscas, true) then
    begin
      try
        Comb := TCombustivel.create;
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('TP_COMB_RENAVAM');
        if vDadosIni.vPesquisa <> '' then
          Veiculo.dataSet.FieldByName('TPCOMB').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('VEI004', 'INCLUIR', '', '', '', Veiculo.buscas, true) then
    begin
      try
        Comb := TCombustivel.create;
        Comb._AbreCombustivel;
        Screen.Cursor := crHourGlass;
        Comb._CadCombustivel(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_CorDropDown(Sender: TObject);
begin
  inherited;
  DtmCadBasicos.qrAbreCor.Active := false;
  DtmCadBasicos.qrAbrecor.Active := true;
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_CorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Cores: TCores;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('VEI003', 'PESQUISAR', '', '', '', Veiculo.buscas, true) then
    begin
      try
        Cores := TCores.create;
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CODIGO_CORFAB');
        if vDadosIni.vPesquisa <> '' then
          Veiculo.dataSet.FieldByName('COD_CORFAB').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('VEI004', 'INCLUIR', '', '', '', Veiculo.buscas, true) then
    begin
      try
        Cores := TCores.create;
        Cores._AbreCores;
        Screen.Cursor := crHourGlass;
        Cores._CadCores(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_DescricaoMarcaDropDown(
  Sender: TObject);
begin
  inherited;
//  DtmVeiculosCCIA.qrAbreMarca.Active := false;
//  DtmVeiculosCCIA.qrAbreMarca.Active := true;
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_DescricaoMarcaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Marcas: TMarcas;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('VEI003', 'PESQUISAR', '', '', '', Veiculo.buscas, true) then
    begin
      try
        Marcas := TMarcas.create;
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD', ' and MARCA_PROD.TIPO_MARCA=''V'' ', 'Consulta Marcas');
        if vDadosIni.vPesquisa <> '' then
          Veiculo.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('VEI004', 'INCLUIR', '', '', '', Veiculo.buscas, true) then
    begin
      try
        Marcas := TMarcas.create;
        Marcas.abreMarcas;
        Screen.Cursor := crHourGlass;
        Marcas.CadMarcas(2);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_ModeloClick(Sender: TObject);
begin
  inherited;
//Preenche os demais campos respectivos em seu cadastro
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_ModeloDropDown(Sender: TObject);
begin
  inherited;
  DtmVeiculosCCIA.qrLocModV.Active := false;
  DtmVeiculosCCIA.qrLocModV.Active := true;
end;

procedure TFrmCadVeiculosCCIA.DBLookupComboBox_ModeloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('VEI003', 'PESQUISAR', '', 'VEICULOS', '', veiculo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('TIPMODELO');
        if vDadosIni.vPesquisa <> '' then
          Veiculo.dataSet.FieldByName('MODELO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('VEI004', 'INCLUIR', '', 'VEICULOS', '', veiculo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Veiculo.vModVeic.CadModVeiculos(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

end;

procedure TFrmCadVeiculosCCIA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (cdsColunasNFE <> nil) and (DBGridNFE.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridNFE.DataSource.DataSet), self);
  if (cdsColunasNFS <> nil) and (DBGridNFS.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridNFS.DataSource.DataSet), self);
  if (cdsColunasNFT <> nil) and (DBGridNFT.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridNFT.DataSource.DataSet), self);  
  if (cdsColunasCTRE <> nil) and (DBGridCTRE.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridCTRE.DataSource.DataSet), self);
  if (cdsColunasCTRS <> nil) and (DBGridCTRS.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridCTRS.DataSource.DataSet), self);
  if (cdsColunasORC <> nil) and (DBGridOrcamento.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridOrcamento.DataSource.DataSet), self);
  if (cdsColunasOS <> nil) and (DBGridOficina.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridOficina.DataSource.DataSet), self);
  inherited;

  gravaConfiguracoesFormRegistro;

  if (Veiculo <> nil) then
    Veiculo.Cancel;

  Veiculo.free;
  Veiculo := nil;

  Action := caFree;
  if (FrmCadVeiculosCCIA <> nil) then
    FrmCadVeiculosCCIA := nil;
end;

procedure TFrmCadVeiculosCCIA.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'VEICULOS' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  Veiculo := TVeiculosCCIA.create;
  Veiculo.abreVeic;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadVeiculosCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end;
end;

procedure TFrmCadVeiculosCCIA.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;
    
	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'VEICULOS' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  leConfiguracoesFormRegistro;
  
  if vShow <> 1 then
  begin                    
    vTabela := 'HIST_ESTMOTO';
    vCampoPadrao := 'COD_HIST';
    trans := vDadosIni.transacaoCol;

    DBGridNFE.DataSource := dtmVeiculosCCIA.dsHistNFEVeiculos;
    if vCriou = 0 then
    begin
      cdsColunasNFE := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasNFE,
      'cdsHistNFEVeiculos', DBGridNFE, vTabela, vCampoPadrao, self, vCheck, ScrollBoxNFE);
    end;

    DBGridNFS.DataSource := dtmVeiculosCCIA.dsHistNFSVeiculos;
    if vCriou = 0 then
    begin
      cdsColunasNFS := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasNFS,
      'cdsHistNFSVeiculos', DBGridNFS, vTabela, vCampoPadrao, self, vCheck, ScrollBoxNFS);
    end;

    DBGridNFT.DataSource := dtmVeiculosCCIA.dsHistNFTVeiculos;
    if vCriou = 0 then
    begin
      cdsColunasNFT := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasNFT,
      'cdsHistNFTVeiculos', DBGridNFT, vTabela, vCampoPadrao, self, vCheck, ScrollBoxNFT);
    end;

    DBGridCTRE.DataSource := dtmVeiculosCCIA.dsHistCTREVeiculos;
    if vCriou = 0 then
    begin
      cdsColunasCTRE := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasCTRE,
      'cdsHistCTREVeiculos', DBGridCTRE, vTabela, vCampoPadrao, self, vCheck, ScrollBoxCTRE);
    end;

    DBGridCTRS.DataSource := dtmVeiculosCCIA.dsHistCTRSVeiculos;
    if vCriou = 0 then
    begin
      cdsColunasCTRS := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasCTRS,
      'cdsHistCTRSVeiculos', DBGridCTRS, vTabela, vCampoPadrao, self, vCheck, ScrollBoxCTRS);
    end;

    DBGridOrcamento.DataSource := dtmVeiculosCCIA.dsHistORCVeiculos;
    if vCriou = 0 then
    begin
      cdsColunasORC := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasORC,
      'cdsHistORCVeiculos', DBGridOrcamento, vTabela, vCampoPadrao, self, vCheck, ScrollBoxORC);
    end;

    DBGridOficina.DataSource := dtmVeiculosCCIA.dsHistOSVeiculos;
    if vCriou = 0 then
    begin
      cdsColunasOS := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasOS,
      'cdsHistOSVeiculos', DBGridOficina, vTabela, vCampoPadrao, self, vCheck, ScrollBoxOS);
    end;

    DBGrid1.DataSource := DtmVeiculosCCIA.dsVeiculos;
    if vCriou = 0 then
    	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  inherited;

  //Campos do formulário
  CheckBox1.Visible := false;
  CheckBox3.Visible := false;
  BitBtn_Venda.Visible := false;
  BitBtn_Reserva.Visible := false;
  TabSheet_Contratos.tabVisible := False;
  TabSheet_Notas.tabVisible := False;
  TabSheet_NotasTransito.TabVisible := false;
  TabSheet_Oficina.tabVisible := False;
  TabSheet_MaisInformacoes.tabVisible := False;

   if (TelaCadastro = 6) then
    BitBtn3.Click;

  vDadosIni.fechaStatusProcessamento;
  DBGrid1.Refresh;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "VEI031" PERMITIR CADASTRAR UM NOVO VEÍCULO COM A MESMA PLACA DE UM VEÍCULO EXISTENTE' + #13 +
    'Processo "VEI032" PERMITIR CADASTRAR UM NOVO VEÍCULO COM O MESMO CHASSI DE ALGUM VEICULO EXISTENTE';

  if vCriou = 0 then
    vCriou := 1;
end;

procedure TFrmCadVeiculosCCIA.gravaConfiguracoesFormRegistro;
begin
	if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
    _GravaConfiguracoesBoolean(CheckBox_TransfDep.Name, CheckBox_TransfDep.Checked);
    _GravaConfiguracoesBoolean(CheckBox_Demonstracao.Name, CheckBox_Demonstracao.Checked);
    _GravaConfiguracoesBoolean(CheckBox_Reserva.Name, CheckBox_Reserva.Checked);
  	_GravaConfiguracoesBoolean(CheckBox_Transito.Name, CheckBox_Transito.Checked);


    _GravaConfiguracoesBoolean(CheckBox_Novo.Name, CheckBox_Novo.Checked);
  	_GravaConfiguracoesBoolean(CheckBox_Usado.Name, CheckBox_Usado.Checked);
    _GravaConfiguracoesBoolean(CheckBox_EstReal.Name, CheckBox_EstReal.Checked);
    _GravaConfiguracoesBoolean(CheckBox_Cons.Name, CheckBox_Cons.Checked);
    _GravaConfiguracoesBoolean(CheckBox_Inter.Name, CheckBox_Inter.Checked);
    _GravaConfiguracoesBoolean(CheckBox_Estoque.Name, CheckBox_Estoque.Checked);
    _GravaConfiguracoesBoolean(CheckBox_SemEstoque.Name, CheckBox_SemEstoque.Checked);
  end;
end;

procedure TFrmCadVeiculosCCIA.HabilitarDesabilitarCamposTipoFormulario(Campos: TStrings);
var I: integer;
begin
    { Habilita os campos do grid de acordo com o formulário
    }

  for I := 0 to Campos.Count - 1 do
  begin
    if (vDadosIni.vTipoForm = 0) then
      DBGrid1.DataSource.DataSet.FieldByName(Campos[I]).tag := 1
    else
      DBGrid1.DataSource.DataSet.FieldByName(Campos[I]).Tag := 0;
  end;
end;

procedure TFrmCadVeiculosCCIA.Label14Click(Sender: TObject);
begin
  inherited;
{
  Verificar se veículo não foi cadastrado se for perguntar ao usuário se deseja
  carregar os dados do veículo, verificar se o veículo já está vendido
}
end;

procedure TFrmCadVeiculosCCIA.Label30Click(Sender: TObject);
begin
  inherited;
//Aparecer se tiver em alteração no Estoque de Veículos e for veículo de
// demonstração

end;

procedure TFrmCadVeiculosCCIA.leConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
  	CheckBox_TransfDep.Checked    := _LerConfiguracoesRegistroBoolean(CheckBox_TransfDep.Name);
    CheckBox_Demonstracao.Checked := _LerConfiguracoesRegistroBoolean(CheckBox_Demonstracao.Name);
    CheckBox_Reserva.Checked      := _LerConfiguracoesRegistroBoolean(CheckBox_Reserva.Name);
    CheckBox_Transito.Checked     := _LerConfiguracoesRegistroBoolean(CheckBox_Transito.Name);

    CheckBox_Novo.Checked         := _LerConfiguracoesRegistroBoolean(CheckBox_Novo.Name);
    CheckBox_Usado.Checked        := _LerConfiguracoesRegistroBoolean(CheckBox_Usado.Name);
    CheckBox_EstReal.Checked      := _LerConfiguracoesRegistroBoolean(CheckBox_EstReal.Name);
    CheckBox_Cons.Checked         := _LerConfiguracoesRegistroBoolean(CheckBox_Cons.Name);
    CheckBox_Inter.Checked        := _LerConfiguracoesRegistroBoolean(CheckBox_Inter.Name);
    CheckBox_Estoque.Checked      := _LerConfiguracoesRegistroBoolean(CheckBox_Estoque.Name);
    CheckBox_SemEstoque.Checked   := _LerConfiguracoesRegistroBoolean(CheckBox_SemEstoque.Name);
  end;
end;

procedure TFrmCadVeiculosCCIA.MarcarTodosVeiculosClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Veiculo._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadVeiculosCCIA.MaskEdit3Enter(Sender: TObject);
var
  teste: integer;
begin
  inherited;
  teste := 1;
end;

procedure TFrmCadVeiculosCCIA.MenuItem10Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridNFS);
end;

procedure TFrmCadVeiculosCCIA.MenuItem11Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI118', 'CONFIGURAR', '', 'EST_MOTO', '', Veiculo.buscas, true) then
  vDadosIni.Configurarcolunas(cdsColunasCTRE, DBGridCTRE, GroupBoxCTRE, ScrollBoxCTRE, Self);
end;

procedure TFrmCadVeiculosCCIA.MenuItem12Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasCTRE, 'cdsHistCTREVeiculos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TFrmCadVeiculosCCIA.MenuItem13Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridCTRE, 'Contrato de Entrada');
end;

procedure TFrmCadVeiculosCCIA.MenuItem14Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridCTRE);
end;

procedure TFrmCadVeiculosCCIA.MenuItem15Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridCTRE);
end;

procedure TFrmCadVeiculosCCIA.MenuItem16Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI119', 'CONFIGURAR', '', 'EST_MOTO', '', Veiculo.buscas, true) then
  vDadosIni.Configurarcolunas(cdsColunasCTRS, DBGridCTRS, GroupBoxCTRS, ScrollBoxCTRS, Self);
end;

procedure TFrmCadVeiculosCCIA.MenuItem17Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasCTRS, 'cdsHistCTRSVeiculos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TFrmCadVeiculosCCIA.MenuItem18Click(Sender: TObject);
begin
  if (vDadosIni.vEmp.vTipoEmpVeiculos <> 'C') then
    vDadosIni.montarExcel(DBGridCTRS, 'Contrato de Saída')
  else
    vDadosIni.montarExcel(DBGridCTRS, 'Comando de Faturamento');
end;

procedure TFrmCadVeiculosCCIA.MenuItem19Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridCTRS);
end;

procedure TFrmCadVeiculosCCIA.MenuItem1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('VEI115', 'CONFIGURAR', '', 'EST_MOTO', '', Veiculo.buscas, true) then
    vDadosIni.Configurarcolunas(cdsColunasNFE, DBGridNFE, GroupBoxNFE, ScrollBoxNFE, Self);
end;

procedure TFrmCadVeiculosCCIA.MenuItem20Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridCTRS);
end;

procedure TFrmCadVeiculosCCIA.MenuItem21Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI121', 'CONFIGURAR', '', 'EST_MOTO', '', Veiculo.buscas, true) then
  vDadosIni.Configurarcolunas(cdsColunasORC, DBGridOrcamento, GroupBoxORC, ScrollBoxORC, Self);
end;

procedure TFrmCadVeiculosCCIA.MenuItem22Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasORC, 'cdsHistORCVeiculos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TFrmCadVeiculosCCIA.MenuItem23Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridOrcamento, 'Orçamento');
end;

procedure TFrmCadVeiculosCCIA.MenuItem24Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridOrcamento);
end;

procedure TFrmCadVeiculosCCIA.MenuItem25Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridOrcamento);
end;

procedure TFrmCadVeiculosCCIA.MenuItem26Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI120', 'CONFIGURAR', '', 'EST_MOTO', '', Veiculo.buscas, true) then
   vDadosIni.Configurarcolunas(cdsColunasOS, DBGridOficina, GroupBoxOS, ScrollBoxOS, Self);
end;

procedure TFrmCadVeiculosCCIA.MenuItem27Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasOS, 'cdsHistOSVeiculos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TFrmCadVeiculosCCIA.MenuItem28Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridOficina, 'Ordem de Serviço');
end;

procedure TFrmCadVeiculosCCIA.MenuItem29Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridOficina);
end;

procedure TFrmCadVeiculosCCIA.MenuItem2Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasNFE, 'cdsHistNFEVeiculos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TFrmCadVeiculosCCIA.MenuItem30Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridOficina);
end;

procedure TFrmCadVeiculosCCIA.MenuItem31Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('VEI117', 'CONFIGURAR', '', 'EST_MOTO', '', Veiculo.buscas, true) then
    vDadosIni.Configurarcolunas(cdsColunasNFT, DBGridNFT, GroupBoxNFT, ScrollBoxNFT, Self);
end;

procedure TFrmCadVeiculosCCIA.MenuItem32Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasNFT, 'cdsHistNFTEstmotos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TFrmCadVeiculosCCIA.MenuItem33Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridNFT, 'Nota Fiscais em Trânsito');
end;

procedure TFrmCadVeiculosCCIA.MenuItem34Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridNFT);
end;

procedure TFrmCadVeiculosCCIA.MenuItem35Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridNFT);
end;

procedure TFrmCadVeiculosCCIA.MenuItem3Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridNFE, 'Notas Fiscal de Entrada');
end;

procedure TFrmCadVeiculosCCIA.MenuItem4Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridNFE);
end;

procedure TFrmCadVeiculosCCIA.MenuItem5Click(Sender: TObject);
begin
   vDadosIni.Copiarparareadetransferncia(DBGridNFE);
end;

procedure TFrmCadVeiculosCCIA.MenuItem6Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI116', 'CONFIGURAR', '', 'EST_MOTO', '', Veiculo.buscas, true) then
  vDadosIni.Configurarcolunas(cdsColunasNFS, DBGridNFS, GroupBoxNFS, ScrollBoxNFS, Self);
end;

procedure TFrmCadVeiculosCCIA.MenuItem7Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasNFS, 'cdsHistNFSVeiculos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TFrmCadVeiculosCCIA.MenuItem8Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridNFS, 'Nota Fiscais de Saída');
end;

procedure TFrmCadVeiculosCCIA.MenuItem9Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridNFS);
end;

procedure TFrmCadVeiculosCCIA.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if PageControl3.ActivePage = TabSheet_Contratos then
    begin
       GroupBox10.Parent := Panel17;
       GroupBox12.Height := Trunc((GroupBox6.Height / 2) - 28);
       GroupBox13.Height := Trunc((GroupBox6.Height / 2) - 28);
       GroupBox12.Align := alTop;
       GroupBox13.Align := alClient;
    end
    else if PageControl3.ActivePage = TabSheet_Notas then
    begin
       GroupBox10.Parent := Panel10;
       GroupBox8.Height := Trunc((GroupBox7.Height / 2) - 28);
       GroupBox9.Height := Trunc((GroupBox7.Height / 2) - 28);
       GroupBox8.Align := alTop;
       GroupBox9.Align := alClient;
    end
    else if PageControl3.ActivePage = TabSheet_Oficina then
    begin
       GroupBox10.Parent := Panel18;
       GroupBox15.Height := Trunc((GroupBox11.Height / 2) - 28);
       GroupBox16.Height := Trunc((GroupBox11.Height / 2) - 28);
       GroupBox15.Align := alTop;
       GroupBox16.Align := alClient;
    end
    else if PageControl3.ActivePage = TabSheet_NotasTransito then
    begin
      GroupBox10.Parent := Panel40;
    end;
  finally
    AtualizarHistorico;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;
        
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.rbNomeFantasiaClick(Sender: TObject);
var
  I: Integer;
  vGrid, vGrid2: TDBGrid;
begin
  inherited;
    if PageControl3.ActivePage = TabSheet_Notas then
  begin
    vGrid := DBGridNFE;
    vGrid2 := DBGridNFS;
  end
  else if PageControl3.ActivePage = TabSheet_Contratos then
  begin
    vGrid := DBGridCTRE;
    vGrid2 := DBGridCTRS;
  end
  else if PageControl3.ActivePage = TabSheet_Oficina then
  begin
    vGrid := DBGridOrcamento;
    vGrid2 := DBGridOficina;
  end
  else if PageControl3.ActivePage = TabSheet_NotasTransito then
  begin
    vGrid := DBGridNFT;
  end;

  if rbNomeFantasia.Checked then
  begin
    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CLIENTE' then
        vGrid.Columns[i].Title.Caption := 'Cliente Nome Fantasia';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
       if vGrid2.Columns[i].FieldName = 'CLIENTE' then
         vGrid2.Columns[i].Title.Caption := 'Cliente Nome Fantasia';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'INTERMEDIADOR' then
        vGrid.Columns[i].Title.Caption := 'Intermediador Nome Fantasia';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'INTERMEDIADOR' then
          vGrid2.Columns[i].Title.Caption := 'Intermediador Nome Fantasia';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CONCESSIONARIA' then
        vGrid.Columns[i].Title.Caption := 'Concessionaria Nome Fantasia';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CONCESSIONARIA' then
          vGrid2.Columns[i].Title.Caption := 'Concessionaria Nome Fantasia';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CLIENTE_VENDEDOR' then
        vGrid.Columns[i].Title.Caption := 'Cliente Vendedor Nome Fantasia';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CLIENTE_VENDEDOR' then
          vGrid2.Columns[i].Title.Caption := 'Cliente Vendedor Nome Fantasia';

  end
  else if rbRazaoSocial.Checked then
  begin
    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CLIENTE' then
        vGrid.Columns[i].Title.Caption := 'Cliente Razao Social';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CLIENTE' then
          vGrid2.Columns[i].Title.Caption := 'Cliente Razao Social';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'INTERMEDIADOR' then
        vGrid.Columns[i].Title.Caption := 'Intermediador Razao Social';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'INTERMEDIADOR' then
          vGrid2.Columns[i].Title.Caption := 'Intermediador Razao Social';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CONCESSIONARIA' then
        vGrid.Columns[i].Title.Caption := 'Concessionaria Razao Social';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CONCESSIONARIA' then
          vGrid2.Columns[i].Title.Caption := 'Concessionaria Razao Social';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CLIENTE_VENDEDOR' then
        vGrid.Columns[i].Title.Caption := 'Cliente Vendedor Razao Social';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CLIENTE_VENDEDOR' then
          vGrid2.Columns[i].Title.Caption := 'Cliente Vendedor Razao Social';

  end;
  AtualizarHistorico(true);
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxCTREEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxCTREExit(Sender: TObject);
begin
  if (cdsColunasCTRE = nil) or (not cdsColunasCTRE.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasCTRE, DBGridCTRE, vDadosIni.vNomeUsuario, 'cdsHistCTREVeiculos', self, ScrollBoxCTRE, trans);
  GroupBoxCTRE.Visible := false;
  vDadosIni.mostraColunas(cdsColunasCTRE, DBGridCTRE, vDadosIni.vNomeUsuario, 'cdsHistCTREVeiculos', vTabela, vCampoPadrao);
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxCTRSEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxCTRSExit(Sender: TObject);
begin
  if (cdsColunasCTRS = nil) or (not cdsColunasCTRS.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasCTRS, DBGridCTRS, vDadosIni.vNomeUsuario, 'cdsHistCTRSVeiculos', self, ScrollBoxCTRS, trans);
  GroupBoxCTRS.Visible := false;
  vDadosIni.mostraColunas(cdsColunasCTRS, DBGridCTRS, vDadosIni.vNomeUsuario, 'cdsHistCTRSVeiculos', vTabela, vCampoPadrao);
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxNFEEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxNFEExit(Sender: TObject);
begin
  if (cdsColunasNFE = nil) or (not cdsColunasNFE.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFE, DBGridNFE, vDadosIni.vNomeUsuario, 'cdsHistNFEVeiculos', self, ScrollBoxNFE, trans);
  GroupBoxNFE.Visible := false;
  vDadosIni.mostraColunas(cdsColunasNFE, DBGridNFE, vDadosIni.vNomeUsuario, 'cdsHistNFEVeiculos', vTabela, vCampoPadrao);
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxNFSEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxNFSExit(Sender: TObject);
begin
  if (cdsColunasNFS = nil) or (not cdsColunasNFS.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFS, DBGridNFS, vDadosIni.vNomeUsuario, 'cdsHistNFSVeiculos', self, ScrollBoxNFS, trans);
  GroupBoxNFS.Visible := false;
  vDadosIni.mostraColunas(cdsColunasNFS, DBGridNFS, vDadosIni.vNomeUsuario, 'cdsHistNFSVeiculos', vTabela, vCampoPadrao);
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxNFTEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxNFTExit(Sender: TObject);
begin
  if (cdsColunasNFT = nil) or (not cdsColunasNFT.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFT, DBGridNFT, vDadosIni.vNomeUsuario, 'cdsHistNFTEstmotos', self, ScrollBoxNFT, trans);
  GroupBoxNFT.Visible := false;
  vDadosIni.mostraColunas(cdsColunasNFT, DBGridNFT, vDadosIni.vNomeUsuario, 'cdsHistNFTEstmotos', vTabela, vCampoPadrao);
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxORCEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxORCExit(Sender: TObject);
begin
  if (cdsColunasORC = nil) or (not cdsColunasORC.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasORC, DBGridOrcamento, vDadosIni.vNomeUsuario, 'cdsHistORCVeiculos', self, ScrollBoxORC, trans);
  GroupBoxORC.Visible := false;
  vDadosIni.mostraColunas(cdsColunasORC, DBGridOrcamento, vDadosIni.vNomeUsuario, 'cdsHistORCVeiculos', vTabela, vCampoPadrao);
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxOSEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmCadVeiculosCCIA.ScrollBoxOSExit(Sender: TObject);
begin
  if (cdsColunasOS = nil) or (not cdsColunasOS.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasOS, DBGridOficina, vDadosIni.vNomeUsuario, 'cdsHistOSVeiculos', self, ScrollBoxOS, trans);
  GroupBoxOS.Visible := false;
  vDadosIni.mostraColunas(cdsColunasOS, DBGridOficina, vDadosIni.vNomeUsuario, 'cdsHistOSVeiculos', vTabela, vCampoPadrao);
end;

procedure TFrmCadVeiculosCCIA.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
	try
    if Veiculo.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('VEI007', 'EDITAR', '', 'VEICULOS',
     Veiculo.dataSet.FieldByName('CODIGO').AsString, veiculo.buscas, true) then
      exit;

    Screen.Cursor := crHourGlass;

    if not Veiculo.Edit then
      exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;
      
    inherited;
    ComboBox4.Text := '';
    ComboBox5.Text := '';
    ComboBox4.Visible := false;
    ComboBox5.Visible := false;
    Label65.Visible := false;
    Label70.Visible := false;
    TabSheet3.TabVisible := false;
    TabSheet_Dados.TabVisible := true;
    TabSheet_Contratos.TabVisible := true;
    TabSheet_Notas.TabVisible := true;
    TabSheet_NotasTransito.TabVisible := true;
    TabSheet_Oficina.TabVisible := true;
    TabSheet_MaisInformacoes.TabVisible := true;
    PageControl3.ActivePage := TabSheet_Dados;
    TabSheet_Dados.Show;
    Veiculo.verificatipovenda(1, DBComboBox1, 'OS', '');
    _atualizarCombobox;
    _buscarModelo;
    vCodModelo := 0;
    Label14.Visible := (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S');
    DBEdit7.Visible := (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S');

    Label80.Enabled := false;
    DBEdit18.Enabled := false;
    Label81.Enabled := false;
    DBEdit26.Enabled := false;
    btAlterarChassiPlaca.Visible := true;

    if vDadosIni.vVeic.vDesabilitarChassi then
    begin
      Label80.Visible := false;
    	DBEdit18.Visible := false;
    end
    else
    begin
    	Label80.Visible := true;
    	DBEdit18.Visible := true;
    end;
    
    if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
      DBEdit18.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
    	DBEdit26.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit31.CanFocus) then
    	DBEdit31.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculosCCIA.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('VEI009', 'ACESSAR', '', 'VEICULOS', '', veiculo.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not Veiculo.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira - [VEI008]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente - [VEI012]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadVeiculosCCIA.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  try
    inherited;
    if not Veiculo.Delete then
      exit;

    vStatusLixeira := Veiculo.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Veiculo.Cancel;
    Veiculo.RollBackTransacao;
  end;
end;

procedure TFrmCadVeiculosCCIA.SpeedButton40Click(Sender: TObject);
begin
  vDadosIni.configurarSistema('vei_%', Veiculo.buscas);
end;

procedure TFrmCadVeiculosCCIA.SpeedButton5Click(Sender: TObject);
begin
  if not Veiculo.restaurarRegistro then
  	Exit;

  if Veiculo.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadVeiculosCCIA.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('VEI005', 'ACESSAR', '', 'VEICULOS', '', veiculo.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      Veiculo.vModVeic.CadModVeiculos(0);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadVeiculosCCIA.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if Veiculo.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

function TFrmCadVeiculosCCIA._atualizarCombobox: Boolean;
begin
  if not (Veiculo.dataSet.FieldByName('LOTACAO').IsNull) then
    DBComboBox2.Field.AsString := Veiculo.dataSet.FieldByName('LOTACAO').asstring;
  if not (Veiculo.dataSet.FieldByName('TIPO_OS').IsNull) then
    DBComboBox1.Field.AsString := Veiculo.dataSet.FieldByName('TIPO_OS').asstring;
end;

procedure TFrmCadVeiculosCCIA._buscarModelo;
begin
  ComboBox4.Text := '';
  ComboBox5.Text := '';
  
  if Veiculo.dataSet.FieldByName('MODELO').AsInteger <= 0 then
    exit;

  ComboBox4.Visible := false;
  ComboBox5.Visible := false;
  Label65.Visible := false;
  Label70.Visible := false;
    
  if Veiculo.vModVeic.buscarModelo(Veiculo.dataSet.FieldByName('MODELO').AsInteger) then
  begin
    Label70.Visible := trim(Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString) <> '';
    ComboBox4.Visible := trim(Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString) <> '';
    Label65.Visible := trim(Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString) <> '';
    ComboBox5.Visible := trim(Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString) <> '';
    
    if Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '01' then
      ComboBox4.Text := Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'PASSAGEIRO'
    else if Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '02' then
      ComboBox4.Text := Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'CARGA'
    else if Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '03' then
      ComboBox4.Text := Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'MISTO'
    else
      ComboBox4.Text := Veiculo.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString;

    if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '01' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + ' CICLOMOTO'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '02' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TRICICLO'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '03' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTONETA'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '04' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTOCICLO'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '05' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TRICICLO'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '06' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'AUTOMÓVEL'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '07' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MICROÔNIBUS'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '08' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'ÔNIBUS'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '10' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'REBOQUE'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '11' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'SEMIRREBOQUE'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '13' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'CAMINHONETA'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '14' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'CAMINHÃO'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '17' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'CAMINHÃO TRATOR'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '18' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TR RODAS'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '19' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TR ESTEIRAS'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '20' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TR MISTO'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '21' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'QUADRICICLO'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '22' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'ESPECIAL / ÔNIBUS'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '23' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MISTO / CAMINHONETE'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '25' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'UTILITÁRIO'
    else if Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '26' then
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTOR CASA'
    else
      ComboBox5.Text := Veiculo.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString;
  end;
end;

function TFrmCadVeiculosCCIA._mdiAberto(pNomeFormMDI: string;  pMensagem: string = ''): Boolean;
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
        if trim(pMensagem) <> ''  then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;

end;

initialization
  RegisterClass(TFrmCadVeiculosCCIA);
finalization
  UnRegisterClass(TFrmCadVeiculosCCIA);

end.

