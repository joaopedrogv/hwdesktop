
unit uLocalizar;

(************************ Hw Sistemas e Computadores ***************************
*   1. Formulário padrao de consulta                                           *
*   2. Coloca em ordem alfabética os itens dos combobox                        *
*   3. Ordena os campos ao clicar no titulo do grid(Ascendente e Descendente)  *
*   4. Configura as colunas em visivel ou invisivel e a ordem da coluna        *
*   5. A configuração é feita por usuário, na tabela CONFIG_COLUNAS            *
*   6. É feita a leitura do componente TClientDataSet passado como parametro,  *
*      verifica se o tag de cada Field para funcionamento: (0=configuravel),   *
*      (1=invisivel) e (2=semprevisivel)                                       *
*   7. Se nao for passado nenhum ClientDataSet ao formulário ele irá trabalhar *
*      conforme foi definido no grid, não irá tentar efetuar nenhuma           *
*      configuração. Podendo assim definir os campos visiveis no próprio       *
*      DBGrid.                                                                 *
*    8. A funcao :setTClientDataSet(dtSet: TClientDataSet; nomeUsuario: string)*
*      onde o dtSet é o componente das configuracoes
*    9. Adicionar esta rotina no create do seu DataModule
*var
*  J, I: Integer;
*begin
*  for J := 0 to Self.ComponentCount - 1 do
*    if Self.Components[J] is TClientDataSet then
*      for I := 0 to TClientDataSet(Self.Components[J]).FieldCount - 1 do
*      begin
*        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXA' +
*          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
*          TClientDataSet(Self.Components[J]).Fields[I].FieldName, []);
*        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXD' +
*          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
*          TClientDataSet(Self.Components[J]).Fields[I].FieldName, [ixDescending]);
*      end;
*******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, StdCtrls, Mask, Grids, DBGrids, ExtCtrls,
  DbClient, IBDatabase, ConsultasU, DB, Menus, ComCtrls, DBCtrls, uEditMoeda,
  AppEvnts, DdeMan, config_sistema_class;

type
  THackDBGrid   = class(TCustomDBGrid);
  TfrmLocalizar = class(TfrmPadrao)
    Panel1: TPanel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    ComboBox3: TComboBox;
    Panel4: TPanel;
    PanelEstF: TPanel;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    ConfigurarColunas1: TMenuItem;
    PanelEstR: TPanel;
    dsPesquisa: TDataSource;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Panel13: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    TabSheet4: TTabSheet;
    Panel8: TPanel;
    TabSheet5: TTabSheet;
    Panel9: TPanel;
    TabSheet6: TTabSheet;
    Panel10: TPanel;
    TabSheet7: TTabSheet;
    Panel11: TPanel;
    TabSheet8: TTabSheet;
    Panel12: TPanel;
    Label6: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label7: TLabel;
    Panel14: TPanel;
    DBGrid3: TDBGrid;
    dsBuscas: TDataSource;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    Label8: TLabel;
    Label9: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    EditMoeda1: TEditMoeda;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label12: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    Label14: TLabel;
    BitBtn13: TBitBtn;
    TabSheet9: TTabSheet;
    Panel15: TPanel;
    Panel16: TPanel;
    Label15: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DBGrid6: TDBGrid;
    ApplicationEvents1: TApplicationEvents;
    Label16: TLabel;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Panel17: TPanel;
    tsProdutosKit: TTabSheet;
    BitBtn14: TBitBtn;
    Panel18: TPanel;
    BitBtn15: TBitBtn;
    DBGrid7: TDBGrid;
    Panel19: TPanel;
    Panel20: TPanel;
    GroupBox7: TGroupBox;
    DBGrid8: TDBGrid;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    TabSheet10: TTabSheet;
    GroupBox1: TGroupBox;
    DBText27: TDBText;
    Label201: TLabel;
    DBText28: TDBText;
    Label202: TLabel;
    DBText29: TDBText;
    Label203: TLabel;
    DBText30: TDBText;
    Label216: TLabel;
    DBText32: TDBText;
    Label218: TLabel;
    DBText33: TDBText;
    Panel21: TPanel;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    Panel22: TPanel;
    Label83: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    GroupBox4: TGroupBox;
    DBGrid9: TDBGrid;
    Panel23: TPanel;
    Panel24: TPanel;
    ckConsumo: TCheckBox;
    imgInformation: TImage;
    LabelEstR: TLabel;
    PopupMenu2: TPopupMenu;
    ConfigurarColunas2: TMenuItem;
    PopupMenu3: TPopupMenu;
    ConfigurarColunas3: TMenuItem;
    Panel25: TPanel;
    Label23: TLabel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    GroupBox5: TGroupBox;
    DdeClientConv1: TDdeClientConv;
    DBText3: TDBText;
    Label195: TLabel;
    DBText4: TDBText;
    Label196: TLabel;
    DBText25: TDBText;
    Label197: TLabel;
    DBText26: TDBText;
    Panel26: TPanel;
    PanelEstPrima: TPanel;
    LabelEstPrima: TLabel;
    TabSheet11: TTabSheet;
    GroupBox6: TGroupBox;
    DBText1: TDBText;
    Label22: TLabel;
    DBText2: TDBText;
    Label24: TLabel;
    DBText5: TDBText;
    Label25: TLabel;
    DBText6: TDBText;
    Label26: TLabel;
    DBText7: TDBText;
    Label27: TLabel;
    DBText8: TDBText;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    DBGrid10: TDBGrid;
    DBGrid11: TDBGrid;
    btMateriaPrima: TBitBtn;
    Label28: TLabel;
    Label29: TLabel;
    lbEstF: TLabel;
    lbEstD: TLabel;
    lbDescQtdeProduzir: TLabel;
    lbQtdeProduzir: TLabel;
    BitBtn23: TBitBtn;
    Panel129: TPanel;
    Panel2: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel62: TPanel;
    pnDevParc: TPanel;
    pnDevTot: TPanel;
    pnOpcaoDireitaProdutos: TPanel;
    Splitter2: TSplitter;
    ckMenuLateral: TCheckBox;
    bt_outros_prod: TSpeedButton;
    pmOutros: TPopupMenu;
    MenuLateralExibirObservacaoProd: TMenuItem;
    MenuLateralExibirDetalhesCaractersticasProd: TMenuItem;
    pnObservacaoProd: TGroupBox;
    DBMemoObsProd: TDBMemo;
    SplitterObservacaoBottomProd: TSplitter;
    pnCaracteristicaProd: TGroupBox;
    DBMemoDetCaracProd: TDBMemo;
    pnOpcaoDireitaClientes: TPanel;
    SplitterObservacaoBottomCl: TSplitter;
    pnObservacaoCl: TGroupBox;
    DBMemoObsCl: TDBMemo;
    pnObservacaoSpcCl: TGroupBox;
    DBMemoObsSpcCli: TDBMemo;
    pnObservacaoReqOsCl: TGroupBox;
    DBMemoObsReqOSCli: TDBMemo;
    SplitterObservacaoSpcBottomCl: TSplitter;
    MenuLateralExibirObservacaoCl: TMenuItem;
    MenuLateralExibirObservacaoSpcCl: TMenuItem;
    MenuLateralExibirObservacaoReqOSCl: TMenuItem;
    SplitterCaracteristicaBottomProd: TSplitter;
    pnCodigoProd: TGroupBox;
    DBGridCodigoProd: TDBGrid;
    MenuLateralExibirCodigosProd: TMenuItem;
    DataSource3: TDataSource;
    PopupMenu4: TPopupMenu;
    ConfigurarColunas4: TMenuItem;
    GroupBoxVerGrades: TGroupBox;
    SplitterVerGrades: TSplitter;
    DBGridVerGrades: TDBGrid;
    pnVerGrades: TPanel;
    ckVerGrades: TCheckBox;
    procedure SplitterVerGradesMoved(Sender: TObject);
    procedure ckVerGradesClick(Sender: TObject);
    procedure ConfigurarColunas4Click(Sender: TObject);
    procedure MenuLateralExibirCodigosProdClick(Sender: TObject);
    procedure SplitterObservacaoSpcBottomClMoved(Sender: TObject);
    procedure SplitterObservacaoBottomClMoved(Sender: TObject);
    procedure MenuLateralExibirObservacaoReqOSClClick(Sender: TObject);
    procedure MenuLateralExibirObservacaoSpcClClick(Sender: TObject);
    procedure MenuLateralExibirObservacaoClClick(Sender: TObject);
    procedure MenuLateralExibirDetalhesCaractersticasProdClick(Sender: TObject);
    procedure MenuLateralExibirObservacaoProdClick(Sender: TObject);
    procedure SplitterObservacaoBottomProdMoved(Sender: TObject);
    procedure bt_outros_prodClick(Sender: TObject);
    procedure ckMenuLateralClick(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid11DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid10DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn23Click(Sender: TObject);
    procedure btMateriaPrimaClick(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConfigurarColunas3Click(Sender: TObject);
    procedure ConfigurarColunas2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn20Click(Sender: TObject);
    procedure DBGrid9DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure tsProdutosKitShow(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ConfigurarColunas1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure ScrollBox2Exit(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
  private
    FConsulta: TConsulta;
    naoOrdenar: boolean; // Variavel auxiliar de ordenacao das colunas
    vCheck: TCheckBox;
    // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
    usuario: string;
    // variaveis que sao setadas dos formularios filhos informando o nome do clientdataset e o nome do usuario
    campoPesquisa, vCampoPadrao: string;
    cdsColunas: TClientDataSet;
    trans: TIBTransaction;
    vCtrlClick, vShiftClick: Boolean;

    cdsGrid: TClientDataSet;
    GridCfg: TDBGrid;
    ListGridsAndDataSets: TStrings;

    vCamposPadraoRegistro: Boolean;
    procedure fDataseAfterClose(DataSet: TDataSet);
    procedure configuraVisual(nomeCampo: string);
    procedure SetConsulta(const Value: TConsulta);
    procedure gravaConfiguracoesRegistro;
    procedure leConfiguracoesRegistro;

    function getDataSetNameByGrid(DBGridName, DataSetNameDefault: string): string;
    procedure setDataSetNameByGrid(DBGridName, DataSetName: string);
  public
    procedure setTClientDataSet(dtSet: TClientDataSet; nomeUsuario: string; transacao: TIBTransaction); overload;
    procedure setTClientDataSet(dtSet: TClientDataSet; PGridCfg: TDBGrid; nomeUsuario: string; transacao: TIBTransaction; pAlterarNomeDtSet: string = ''); overload;
    function AddFieldEditButton(fieldEditButton: string): TfrmLocalizar;
    procedure AjustarBarraLateral(pAjustar: Boolean = True);
    property Consulta: TConsulta read FConsulta write FConsulta;//SetConsulta;
  protected
    vShow: integer;
    fieldsEditButton: array of string;

    procedure configurarGridPeloConfigColunas(PGridCfg: TDBGrid);
    procedure configurarGridPeloCheckListBox(PGridCfg: TDBGrid);
    procedure salvarGridNoConfigColunas(PGridCfg: TDBGrid);
    procedure ListCheckClickCheck(Sender: TObject);
    procedure PopMnSelAllClick(Sender: TObject);
    procedure PopMnUnSelAllClick(Sender: TObject);
    procedure gridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
  end;

var
  frmLocalizar: TfrmLocalizar;
  vcrHSplit, crH, vcrSizeWE: integer;
  vHabObservacaoCl: boolean;
  vHabObservacaoSpcCl: boolean;
  vHabObservacaoReqOsCl: boolean;
  vHabObservacaoProd: boolean;
  vHabCaracteristicaProd: boolean;
  vHabCodigoProd: boolean;

implementation

uses
  uDtmAtivo, uDtmConsultas, uDadosIni, Registry, uGridPesquisa, funcoes,
  CheckLst, StrUtils, hw_utils;

{$R *.dfm}

function TfrmLocalizar.AddFieldEditButton(
  fieldEditButton: string): TfrmLocalizar;
var
  I: Integer;
begin
  Result := Self;
  for I := Low(fieldsEditButton) to High(fieldsEditButton) do
    if AnsiUpperCase(Trim(fieldEditButton)) = fieldsEditButton[I] then
      Exit;

  SetLength(fieldsEditButton, Length(fieldsEditButton) + 1);
  fieldsEditButton[High(fieldsEditButton)] := AnsiUpperCase(Trim(fieldEditButton));
end;

procedure TfrmLocalizar.AjustarBarraLateral(pAjustar: Boolean);
var
	vQtdeMenu: Integer;
begin
	if (pnOpcaoDireitaClientes.Visible) and (Consulta.getNomeTabela = 'CLIENTES') then
  begin
    if (pnObservacaoCl.Visible) then
      if pnObservacaoCl.Height < 25 then
        pnObservacaoCl.Height := 25;

    if (pnObservacaoSpcCl.Visible) then
      if pnObservacaoSpcCl.Height < 25 then
        pnObservacaoSpcCl.Height := 25;

    if (pnObservacaoReqOsCl.Visible) then
      if pnObservacaoReqOsCl.Height < 25 then
        pnObservacaoReqOsCl.Height := 25;

    if (vDadosIni.IfThen(pnObservacaoCl.Visible, pnObservacaoCl.Height, 0) +  
        vDadosIni.IfThen(SplitterObservacaoBottomCl.Visible, SplitterObservacaoBottomCl.Height, 0) +
        vDadosIni.IfThen(pnObservacaoSpcCl.Visible, pnObservacaoSpcCl.Height, 0) +
        vDadosIni.IfThen(SplitterObservacaoSpcBottomCl.Visible, SplitterObservacaoSpcBottomCl.Height, 0) +
        vDadosIni.IfThen(pnObservacaoReqOsCl.Visible, pnObservacaoReqOsCl.Height, 0) > pnOpcaoDireitaClientes.Height) then
    begin
      pnObservacaoCl.Height := 25;
      pnObservacaoSpcCl.Height := 25;
      pnObservacaoReqOsCl.Height := 25;
    end;

    pnObservacaoCl.Align := alNone;
    pnObservacaoSpcCl.Align := alNone;
    pnObservacaoReqOsCl.Align := alNone;

    SplitterObservacaoBottomCl.Align := alNone;
    SplitterObservacaoSpcBottomCl.Align := alNone;

    vQtdeMenu := 0;
    if MenuLateralExibirObservacaoCl.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirObservacaoSpcCl.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirObservacaoReqOSCl.Checked then
      Inc(vQtdeMenu);

    if pAjustar then
    begin
      pnObservacaoCl.Height := Trunc((pnOpcaoDireitaClientes.Height / vQtdeMenu));
      pnObservacaoSpcCl.Height := Trunc((pnOpcaoDireitaClientes.Height / vQtdeMenu));
      pnObservacaoReqOsCl.Height := Trunc((pnOpcaoDireitaClientes.Height / vQtdeMenu));
    end;

    if MenuLateralExibirObservacaoCl.Checked then
    begin
      if (not MenuLateralExibirObservacaoSpcCl.Checked)
      	and (not MenuLateralExibirObservacaoSpcCl.Checked) then
        	pnObservacaoCl.Align := alClient
      else
      begin
      		pnObservacaoCl.Align := alTop;
          SplitterObservacaoBottomCl.Align := alTop;
      end;

      DBMemoObsCl.Align := alClient;
    end
    else
    begin
    	DBMemoObsCl.Align := alNone;
      SplitterObservacaoBottomCl.Align := alNone;
    end;

    if MenuLateralExibirObservacaoSpcCl.Checked then
    begin
      if (not MenuLateralExibirObservacaoSpcCl.Checked)
      	and (not MenuLateralExibirObservacaoSpcCl.Checked) then
        	pnObservacaoSpcCl.Align := alClient
      else
      begin
      		pnObservacaoSpcCl.Align := alTop;
          SplitterObservacaoSpcBottomCl.Align := alTop;
      end;

      DBMemoObsSpcCli.Align := alClient;
    end
    else
    begin
    	DBMemoObsSpcCli.Align := alNone;
      SplitterObservacaoSpcBottomCl.Align := alNone;
    end;

    if MenuLateralExibirObservacaoReqOSCl.Checked then
    begin
      pnObservacaoReqOsCl.Align := alClient;

      DBMemoObsReqOSCli.Align := alClient;
    end
    else
    	DBMemoObsReqOSCli.Align := alNone;

    if MenuLateralExibirObservacaoCl.Checked then
    begin
      pnObservacaoCl.Top := 0;

      if SplitterObservacaoBottomCl.Visible then
      	SplitterObservacaoBottomCl.Top := pnObservacaoCl.Top + pnObservacaoCl.Height;
    end;

    if MenuLateralExibirObservacaoSpcCl.Checked then
    begin
      pnObservacaoSpcCl.Top := SplitterObservacaoBottomCl.Top + SplitterObservacaoBottomCl.Height;

      if SplitterObservacaoSpcBottomCl.Visible then
      	SplitterObservacaoSpcBottomCl.Top := pnObservacaoSpcCl.Top + pnObservacaoSpcCl.Height;
    end;

    if MenuLateralExibirObservacaoReqOSCl.Checked then
      pnObservacaoReqOsCl.Top := SplitterObservacaoSpcBottomCl.Top + SplitterObservacaoBottomCl.Height;

    Splitter2.Align := alLeft;
    Splitter2.Align := alRight;
  end
  else if (pnOpcaoDireitaProdutos.Visible) and (Consulta.getNomeTabela = 'PRODUTOS') then
  begin
  	if (pnObservacaoProd.Visible) then
      if pnObservacaoProd.Height < 25 then
        pnObservacaoProd.Height := 25;

    if (pnCaracteristicaProd.Visible) then
      if pnCaracteristicaProd.Height < 25 then
        pnCaracteristicaProd.Height := 25;

    if (pnCodigoProd.Visible) then
    	if pnCodigoProd.Height < 25 then
      	pnCodigoProd.Height := 25;

    if (vDadosIni.IfThen(pnObservacaoProd.Visible, pnObservacaoProd.Height, 0) +
        vDadosIni.IfThen(SplitterObservacaoBottomProd.Visible, SplitterObservacaoBottomProd.Height, 0) +
        vDadosIni.IfThen(pnCaracteristicaProd.Visible, pnCaracteristicaProd.Height, 0) +
        vDadosIni.IfThen(SplitterCaracteristicaBottomProd.Visible, SplitterCaracteristicaBottomProd.Height, 0) +
        vDadosIni.IfThen(pnCodigoProd.Visible, pnCodigoProd.Height, 0) > pnOpcaoDireitaProdutos.Height) then
    begin
    	pnObservacaoProd.Height := 25;
      pnCaracteristicaProd.Height := 25;
      pnCodigoProd.Height := 25;
    end;

    pnObservacaoProd.Align := alNone;
    pnCaracteristicaProd.Align := alNone;
    pnCodigoProd.Align := alNone;

    SplitterObservacaoBottomProd.Align := alNone;
    SplitterCaracteristicaBottomProd.Align := alNone;

    vQtdeMenu := 0;
    if MenuLateralExibirObservacaoProd.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirDetalhesCaractersticasProd.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirCodigosProd.Checked then
      Inc(vQtdeMenu);

    if pAjustar then
    begin
      pnObservacaoProd.Height := Trunc((pnOpcaoDireitaProdutos.Height / vQtdeMenu));
      pnCaracteristicaProd.Height := Trunc((pnOpcaoDireitaProdutos.Height / vQtdeMenu));
    	pnCodigoProd.Height := Trunc((pnOpcaoDireitaProdutos.Height / vQtdeMenu));
    end;

    if MenuLateralExibirObservacaoProd.Checked then
    begin
      if (not MenuLateralExibirDetalhesCaractersticasProd.Checked)
      	and (not MenuLateralExibirCodigosProd.Checked) then
        	pnObservacaoProd.Align := alClient
      else
      begin
      		pnObservacaoProd.Align := alTop;
          SplitterObservacaoBottomProd.Align := alTop;
      end;

      DBMemoObsProd.Align := alClient;
    end
    else
    begin
    	pnObservacaoProd.Align := alNone;
      SplitterObservacaoBottomProd.Align := alNone;
    end;

    if MenuLateralExibirDetalhesCaractersticasProd.Checked then
    begin
    	if (not MenuLateralExibirCodigosProd.Checked) then
      		pnCaracteristicaProd.Align := alClient
      else
      begin
      		pnCaracteristicaProd.Align := alTop;
        	SplitterCaracteristicaBottomProd.Align := alTop;
      end;

      DBMemoDetCaracProd.Align := alClient;
    end
    else
    begin
      pnCaracteristicaProd.Align := alNone;
      SplitterCaracteristicaBottomProd.Align := alNone;
    end;

    if MenuLateralExibirCodigosProd.Checked then
    begin
    	pnCodigoProd.Align := alClient;
      DBGridCodigoProd.Align := alClient;
    end
    else
    	pnCodigoProd.Align := alNone;

    if MenuLateralExibirObservacaoProd.Checked then
    begin
      pnObservacaoProd.Top := 0;

      if SplitterObservacaoBottomProd.Visible then
      	SplitterObservacaoBottomProd.Top := pnObservacaoProd.Top + pnObservacaoProd.Height;
    end;

    if MenuLateralExibirDetalhesCaractersticasProd.Checked then
    begin
      pnCaracteristicaProd.Top := SplitterObservacaoBottomProd.Top + SplitterObservacaoBottomProd.Height;

      if SplitterCaracteristicaBottomProd.Visible then
        SplitterCaracteristicaBottomProd.Top := pnCaracteristicaProd.Top + pnCaracteristicaProd.Height;
    end;

    if MenuLateralExibirCodigosProd.Checked then
      pnCodigoProd.Top := SplitterCaracteristicaBottomProd.Top + SplitterCaracteristicaBottomProd.Height;

    Splitter2.Align := alLeft;
    Splitter2.Align := alRight;
  end;
end;

procedure TfrmLocalizar.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  inherited;
  if pos(uppercase('Invalid input value.  Use escape key to abandon changes'), uppercase(E.Message))
    > 0 then
    Application.MessageBox(PChar('Valor de entrada para o campo está incorreto.' + chr(13) +
      'Precione a tecla ESC para abandonar as alterações no campo.'), 'Erro', MB_OK + MB_ICONERROR +
      MB_DEFBUTTON1)
  else
    Application.MessageBox(Pchar(E.Message), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
end;

procedure TfrmLocalizar.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if Consulta.dataSet.IsEmpty then
   exit;
   
  if vDadosIni.PesqPros('PES006', 'VISUALIZAR', '', 'PESQUISARAPIDA',
    Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then
  begin
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TabSheet6.TabVisible := true;
    TabSheet6.Show;

    if (PageControl2.ActivePage = TabSheet6) then
    begin
      DBText3.DataField := 'DESCR_PROD';
      DBText3.DataSource := DataSource1;
      DBText4.DataField := 'GRUPO_PROD';
      DBText4.DataSource := DataSource1;
      DBText25.DataField := 'COD_PROD';
      DBText25.DataSource := DataSource1;
      DBText26.DataField := 'NUM_FAB_PROD';
      DBText26.DataSource := DataSource1;
    end;
  end;
end;

procedure TfrmLocalizar.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if Consulta.dataSet.IsEmpty then
   exit;
   
  if vDadosIni.PesqPros('PES008', 'VISUALIZAR', '', 'PESQUISARAPIDA',
    Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then
    PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
  TabSheet7.TabVisible := true;
  TabSheet7.Show;
end;

procedure TfrmLocalizar.BitBtn12Click(Sender: TObject);
var
  X: Byte;
  hdTemp: THandle;
  formulario: TForm;
begin
	if Consulta.dataSet.IsEmpty then
   exit;
   
  inherited;

  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase('TfrmCadVendaPerdida') then
      begin
        Application.MessageBox('Cadastro já esta aberto, use as janelas ja abertas para efetuar o cadastramento', 'Atenção', 64);
        Exit;
      end;

  if vDadosIni.PesqPros('PES009', 'VISUALIZAR', '', 'PESQUISARAPIDA',
    Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then

  vDadosIni.vTipoForm := 1;
  vDadosIni.vModalOuChild := 'M';
  try
    vDadosIni.vPesquisa := 'PESQRAPVNDPERD|' +
    	Consulta.dataSet.FieldByName('num_fab_prod').asstring + '|' +
    	Consulta.dataSet.FieldByName('grupo_prod').asstring + '|' +
      Consulta.dataSet.FieldByName('cod_prod').asstring + '|';

    formulario := Funcoes.AbreForm('pkPedidoVenda', 'TfrmCadVendaPerdida', hdTemp);

    try
      formulario.ShowModal;
    finally
      formulario.Free;
      unLoadPackage(hdTemp);
    end;
  finally
    vDadosIni.vPesquisa := '';
  end;

//  inherited;
//  if vDadosIni.PesqPros('PES009', 'VISUALIZAR', '', 'PESQUISARAPIDA',
//    Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then
//  begin
//    PageControl1.ActivePage := TabSheet2;
//    TabSheet2.Show;
//    TabSheet8.TabVisible := true;
//    TabSheet8.Show;
//  end;
end;

procedure TfrmLocalizar.BitBtn13Click(Sender: TObject);
begin
	if Consulta.dataSet.IsEmpty then
   exit;
   
  inherited;
  try
    if vDadosIni.PesqPros('PES005', 'VISUALIZAR', '', 'PESQUISARAPIDA',
      Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then
    begin
      Screen.Cursor := crHourGlass;
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      TabSheet9.TabVisible := true;
      TabSheet9.Show;
      Consulta.FichadeVenda('');
      if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
      	DBGrid6.SetFocus;
      Edit1.Text := '';
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLocalizar.BitBtn14Click(Sender: TObject);
begin
	if Consulta.dataSet.IsEmpty then
   exit;
   
  inherited;
  if vDadosIni.PesqPros('PES010', 'VISUALIZAR', '', 'PESQUISARAPIDA',
    Consulta.dataSet.FieldByName('CODIGO_KIT').asstring, Consulta.buscas, true) then
  begin
    tsProdutosKit.TabVisible := true;
    tsProdutosKit.Show;
  end;
end;

procedure TfrmLocalizar.BitBtn15Click(Sender: TObject);
begin
  inherited;
  tsProdutosKit.TabVisible := false;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  if DBGrid1.DataSource.DataSet.Active then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	  DBGrid1.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
    MaskEdit3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
    MaskEdit6.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
    MaskEdit1.SetFocus;
end;

procedure TfrmLocalizar.BitBtn16Click(Sender: TObject);
begin
  if Consulta.dataSet.IsEmpty then
   exit;
   
  inherited;

  if not (dbgrid2.DataSource.DataSet.IsEmpty) then
  begin
    Consulta._PesquisaGradeProdOutrasEmpresas._PesquisaGrade(
      Consulta.dataset.FieldByName('grupo_prod').asstring,
      Consulta.dataset.FieldByName('cod_prod').asstring,
      dsPesquisa.DataSet.FieldByName('cod_empresa').asstring,
      dsPesquisa.DataSet.FieldByName('IDENTIFICACAO_EMP').asstring);
  end
  else
  begin
    ShowMessage('Não existe grade para este produto em outras empresas.');
  end;
end;

procedure TfrmLocalizar.BitBtn17Click(Sender: TObject);
var
  vQtdTotal, vQtdTotalP: real;
begin
  inherited;
  if Consulta.dataSet.IsEmpty then
   exit;
   
  if vDadosIni.PesqPros('PRO031', 'ABRIR', '', 'PRODUTOS',
    Consulta.dataSet.FieldByName('NUM_FAB_PROD').AsString, Consulta.buscas, true) then
  begin
    inherited;
    try
      Screen.Cursor := crHourGlass;
      Consulta._PedidoVendaAberto._ExibeItensPedidoAberto(
        Consulta.dataSet.FieldByName('GRUPO_PROD').AsString,
        Consulta.dataSet.FieldByName('COD_PROD').AsString);
      Consulta._PedidoVendaAberto._ExibeReservas(
        Consulta.dataSet.FieldByName('GRUPO_PROD').AsString,
        Consulta.dataSet.FieldByName('COD_PROD').AsString);
      Consulta._PedidoVendaAberto.buscas.First;
      Consulta._PedidoVendaAberto.buscas2.First;
      vQtdTotal := 0;
      vQtdTotalP := 0;
//      if Consulta._PedidoVendaAberto.buscas.eof then
//      begin
//        ShowMessage('Não existe pedidos de venda em aberto deste produto.');
//        Screen.Cursor := crDefault;
//        exit;
//      end;
      while not Consulta._PedidoVendaAberto.buscas.eof do
      begin
        vQtdTotal := vQtdTotal +
          Consulta._PedidoVendaAberto.buscas.FieldByName('quant_ped_item').AsCurrency;
        Consulta._PedidoVendaAberto.buscas.Next;
      end;
      while not Consulta._PedidoVendaAberto.buscas2.eof do
      begin
        vQtdTotalP := vQtdTotalP +
          Consulta._PedidoVendaAberto.buscas2.FieldByName('quant').AsCurrency;
        Consulta._PedidoVendaAberto.buscas2.Next;
      end;

      Application.CreateForm(TfrmGridPesquisa, frmGridPesquisa);

      frmGridPesquisa.label172.Caption := format('%n', [vQtdTotal]);
      frmGridPesquisa.label2.Caption := format('%n', [vQtdTotalP]);
      frmGridPesquisa.DBGrid12.DataSource.DataSet := Consulta._PedidoVendaAberto.buscas;
      frmGridPesquisa.DBGrid1.DataSource.DataSet := Consulta._PedidoVendaAberto.buscas2;
      frmGridPesquisa.Caption := 'Quantidade do produto ' +
        trim(Consulta.dataSet.FieldByName('DESCR_PROD').AsString) + ' - ' +
        trim(Consulta.dataSet.FieldByName('GRUPO_PROD').AsString) + '  ' +
        trim(Consulta.dataSet.FieldByName('COD_PROD').AsString) + '  ' +
        trim(Consulta.dataSet.FieldByName('NUM_FAB_PROD').AsString) +
        ' nos seguintes pedidos em aberto:';
      frmGridPesquisa.GroupBox1.Visible := vDadosIni.vEmp.vAlmox = 'S2';
      frmGridPesquisa.Label1.Visible := vDadosIni.vEmp.vAlmox = 'S2';
      frmGridPesquisa.Label2.Visible := vDadosIni.vEmp.vAlmox = 'S2';
      frmGridPesquisa.ShowModal;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

end;

procedure TfrmLocalizar.BitBtn18Click(Sender: TObject);
var
  X: Byte;
begin
  inherited;  
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;

  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(Consulta.NomeFormulario) then
      begin
        Application.MessageBox('Cadastro já esta aberto, use as janelas ja abertas para efetuar o cadastramento', 'Atenção', 64);
        Exit;
      end;

  Consulta.incluirRegistro;
  ModalResult := mrYes;
end;

procedure TfrmLocalizar.BitBtn19Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
end;

procedure TfrmLocalizar.BitBtn1Click(Sender: TObject);
var
  sqlAdicional: string;
  vCampoConteudo: string;
  I: Integer;
  AList: TStrings;
  ASqlMult: string;
  vValorTmp: string;
  vCondicaoTmp: string;
  vCampoTemp: string;
  vsqlAdicional: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    BitBtn21.Visible := false;
    //    if (UpperCase(ComboBox1.Text) = 'TODOS') then
    //      MaskEdit3.Text := '';
    if (UpperCase(ComboBox1.Text) = 'TODOS') then
    begin
      MaskEdit1.Visible := false;
      MaskEdit2.Visible := false;
      MaskEdit3.Visible := true;
      MaskEdit3.Text := '';
    end;
//    Panel20.Height := 1; //Utilizado para visualizar grade de produto
    Label16.Visible := true;
    Label16.Refresh;
    if MaskEdit3.Visible then
    begin
      if (trim(MaskEdit3.Text) = '') and (UpperCase(ComboBox1.Text) <> 'TODOS') then
      begin
        Application.MessageBox('Conteúdo da pesquisa está vazio.', 'Alerta', MB_OK + MB_ICONWARNING
          + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
        	MaskEdit3.SetFocus;
        exit;
      end;
    end
    else
    begin
      MaskEdit3.Text := '';
      if (trim(MaskEdit1.Text) = MaskEdit1.EditMask) then
      begin
        Application.MessageBox('Conteúdo da pesquisa está vazio.', 'Alerta', MB_OK + MB_ICONWARNING
          + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
        	MaskEdit1.SetFocus;
        exit;
      end;
    end;
    if Consulta is TConsultaProdutoP then
    begin
      SqlAdicional := '';
      Height:=600;
//      vCampoConteudo := MaskEdit3.Text;
//      if (not MaskEdit2.Visible) and (not MaskEdit6.Visible) and (Copy(vCampoConteudo, 1, 2) = 'G-') then
//      begin
//        if (pos(';', vCampoConteudo) > 0) then //compatibilidade com etiquetas antigas
//        begin
//          MaskEdit6.Text := Copy(vCampoConteudo, 5, (pos(';', vCampoConteudo) - 5 -
//            strtoint(vDadosIni.vProduto.vDigitosProd)));
//          MaskEdit8.Text := Copy(vCampoConteudo, (pos(';', vCampoConteudo) -
//            strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd));
//        end
//        else if (pos('/', vCampoConteudo) > 0) then //compatibilidade com etiquetas antigas
//        begin
//          MaskEdit6.Text := Copy(vCampoConteudo, 5, (pos('/', vCampoConteudo) - 5 -
//            strtoint(vDadosIni.vProduto.vDigitosProd)));
//          MaskEdit8.Text := Copy(vCampoConteudo, (pos('/', vCampoConteudo) -
//            strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd));
//        end
//        else
//        begin
//          MaskEdit6.Text := Copy(vCampoConteudo, 3 + vDadosIni.vEmp.vDigitosEmp,
//            vDadosIni.vEmp.vDidgitosGrup);
//          MaskEdit8.Text := Copy(vCampoConteudo, 3 + vDadosIni.vEmp.vDigitosEmp +
//            vDadosIni.vEmp.vDidgitosGrup, strtoint(vDadosIni.vProduto.vDigitosProd));
//        end;
//        if (Trim(MaskEdit6.text) <> '') and (Trim(MaskEdit8.text) <> '') then
//          SqlAdicional := SqlAdicional + ' and PRODUTOS.GRUPO_PROD = ' + MaskEdit6.text +
//            ' and PRODUTOS.cod_prod = ' + QuotedStr(MaskEdit8.text);
//
//        if not ckConsumo.Checked then
//          SqlAdicional := SqlAdicional + ' and COALESCE(PRODUTOS.CONSUMO, ''N'') <> ''S'' ';
//
//        if UpperCase(Copy(trim(SqlAdicional), 1, 3)) = 'AND' then
//	        SqlAdicional :=  ' ' + Copy(trim(SqlAdicional), 4, Length(trim(SqlAdicional))  - 3);
//
//        if not Consulta.ConsultaCampos('PRODUTOS', '', 'Todos', combobox3.Text, ComboBox2.text,
//          true, vDadosIni.codEmpresa,
//          ' DISTINCT PRODUTOS.* ',
//          ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ',
//          SqlAdicional) then
//        begin
//					if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
//          	ComboBox1.SetFocus;
//				end
//        else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//          DBGrid1.SetFocus;
//      end;

      vDadosIni.vEtiqProd.CodProd := '';
      if (not MaskEdit2.Visible) and (not MaskEdit6.Visible) then
        vDadosIni.vEtiqProd := vDadosIni.retornaDadosEtiqueta(
          Consulta.buscas,
          MaskEdit3.Text);

      if (not MaskEdit2.Visible) and (not MaskEdit6.Visible)
      	//and ((Copy(MaskEdit3.Text, 1, 2) = 'A-') or (Copy(MaskEdit3.Text, 1, 2) = 'G-')) then     
        and (vDadosIni.vEtiqProd.CodProd <> '') then
      begin
//        vDadosIni.vEtiqProd := vDadosIni.retornaDadosEtiqueta(
//          Consulta.buscas,
//          MaskEdit3.Text);

        MaskEdit6.Text := IntToStr(vDadosIni.vEtiqProd.GrupoProd);
        MaskEdit8.Text := vDadosIni.vEtiqProd.CodProd;

        if (Trim(MaskEdit6.text) <> '') and (Trim(MaskEdit8.text) <> '') then
          SqlAdicional := SqlAdicional + ' and PRODUTOS.GRUPO_PROD = ' + MaskEdit6.text +
            ' and PRODUTOS.cod_prod = ' + QuotedStr(MaskEdit8.text);

        if not ckConsumo.Checked then
          SqlAdicional := SqlAdicional + ' and COALESCE(PRODUTOS.CONSUMO, ''N'') <> ''S'' ';

        if UpperCase(Copy(trim(SqlAdicional), 1, 3)) = 'AND' then
	        SqlAdicional :=  ' ' + Copy(trim(SqlAdicional), 4, Length(trim(SqlAdicional))  - 3);

        if not Consulta.ConsultaCampos('PRODUTOS', '', 'Todos', combobox3.Text, ComboBox2.text,
          true, vDadosIni.codEmpresa,
          ' DISTINCT PRODUTOS.* ',
          ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ',
          SqlAdicional) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
          	ComboBox1.SetFocus;
        end
        else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
          DBGrid1.SetFocus;
      end
      else
      if MaskEdit2.Visible then
      begin
        if not ckConsumo.Checked then
          SqlAdicional := SqlAdicional + ' and COALESCE(PRODUTOS.CONSUMO, ''N'') <> ''S'' ';

        if UpperCase(Copy(trim(SqlAdicional), 1, 3)) = 'AND' then
	        SqlAdicional :=  ' ' + Copy(trim(SqlAdicional), 4, Length(trim(SqlAdicional))  - 3);

        if not Consulta.ConsultaCampos('PRODUTOS', ComboBox1.Text,
          ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
          ' DISTINCT PRODUTOS.* ',
          ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ',
          SqlAdicional) then
        begin
          Panel1.Visible := false;
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	combobox1.setfocus;
          EXIT;
        end;
      end
      else if MaskEdit6.Visible then
      begin
        if (Trim(MaskEdit6.text) <> '') and (Trim(MaskEdit7.text) <> '') and (Trim(MaskEdit8.text)
          <>
          '') then
          sqlAdicional := ' and PRODUTOS.SUB_G_PROD = ' + MaskEdit7.text +
          	' and PRODUTOS.grupo_prod = ' + MaskEdit6.text +
            ' and PRODUTOS.cod_prod = ' + QuotedStr(MaskEdit8.text)
        else if (Trim(MaskEdit6.text) = '') and (Trim(MaskEdit7.text) <> '') and
          (Trim(MaskEdit8.text)
          <> '') then
          sqlAdicional := ' AND PRODUTOS.SUB_G_PROD = ' + MaskEdit7.text +
            ' and PRODUTOS.cod_prod = ' + QuotedStr(MaskEdit8.text)
        else if (Trim(MaskEdit6.text) <> '') and (Trim(MaskEdit7.text) = '') and
          (Trim(MaskEdit8.text)
          <> '') then
          sqlAdicional := ' AND PRODUTOS.GRUPO_PROD = ' + MaskEdit6.text +
            ' and PRODUTOS.COD_PROD = ' + QuotedStr(MaskEdit8.text)
        else if (Trim(MaskEdit6.text) <> '') and (Trim(MaskEdit7.text) <> '') and
          (Trim(MaskEdit8.text) = '') then
          sqlAdicional := ' AND PRODUTOS.SUB_G_PROD = ' + MaskEdit7.text + ' and ' +
            'PRODUTOS.grupo_prod = ' + MaskEdit6.text
        else if (Trim(MaskEdit6.text) = '') and (Trim(MaskEdit7.text) = '') and
          (Trim(MaskEdit8.text) <> '') then
          sqlAdicional := ' AND PRODUTOS.COD_PROD = ' + QuotedStr(MaskEdit8.text)
        else
        begin
          Application.MessageBox('Preencha no mínimo 2 campos para consulta.', 'Alerta', MB_OK
            + MB_ICONWARNING + MB_DEFBUTTON1);
          if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
          	MaskEdit6.SetFocus;
          exit;
        end;
        
        if not ckConsumo.Checked then
          SqlAdicional := SqlAdicional + ' and COALESCE(PRODUTOS.CONSUMO, ''N'') <> ''S'' ';

        if UpperCase(Copy(trim(SqlAdicional), 1, 3)) = 'AND' then
	        SqlAdicional :=  ' ' + Copy(trim(SqlAdicional), 4, Length(trim(SqlAdicional))  - 3);

        if not Consulta.ConsultaCampos('PRODUTOS', MaskEdit3.text, ComboBox1.Text,
          combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
          ' DISTINCT PRODUTOS.* ',
          ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ',
          sqlAdicional) then
        begin
          Panel1.Visible := false;
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	combobox1.setfocus;
          EXIT;
        end;
      end
      else
      begin
        if not ckConsumo.Checked then
          SqlAdicional := SqlAdicional + ' and COALESCE(PRODUTOS.CONSUMO, ''N'') <> ''S'' ';
        ASqlMult := '';
        if (Trim(MaskEdit3.Text) <> '') and (vDadosIni.getConfSisBool('prod_cons_mult_descr_pesqrapida', Consulta.buscas)) and
          (ComboBox1.Text = Consulta.dataSet.FieldByName('DESCR_PROD').DisplayLabel) then
        begin
          AList := TStringList.Create;
          try
            AList := vDadosIni.SplitS(MaskEdit3.Text, ' ', False);
            for I := 0 to AList.Count - 1 do
              if Trim(AList[I]) <> '' then
                ASqlMult := ASqlMult + IfThen(ASqlMult <> '', ' and ') + '(PRODUTOS.DESCR_PROD LIKE ''%' + Trim(AList[I]) + '%'')';
          finally
            FreeAndNil(AList);
          end;
        end;
        if ASqlMult <> '' then
        begin
          sqlAdicional := sqlAdicional + ' and (' + ASqlMult + ')';

          SqlAdicional := Consulta.CondicaosqlAdicional + SqlAdicional;

          if UpperCase(Copy(trim(SqlAdicional), 1, 3)) = 'AND' then
		        SqlAdicional :=  ' ' + Copy(trim(SqlAdicional), 4, Length(trim(SqlAdicional))  - 3);

          if not Consulta.ConsultaCampos('PRODUTOS', '', 'Todos',
            combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
            ' DISTINCT PRODUTOS.* ',
            ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ',
            SqlAdicional) then
          begin
            Panel1.Visible := false;
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            	combobox1.setfocus;
            EXIT;
          end;
        end
        else
        begin
        	SqlAdicional := Consulta.CondicaosqlAdicional + SqlAdicional;

          if UpperCase(Copy(trim(SqlAdicional), 1, 3)) = 'AND' then
		        SqlAdicional :=  ' ' + Copy(trim(SqlAdicional), 4, Length(trim(SqlAdicional))  - 3);

          if not Consulta.ConsultaCampos('PRODUTOS', MaskEdit3.text, ComboBox1.Text,
            combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
              ' DISTINCT PRODUTOS.* ',
              ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ',
              SqlAdicional) then
          begin
            Panel1.Visible := false;
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            	combobox1.setfocus;
            EXIT;
          end;
        end;
      end; //    Height := 500;
    end
    else if Consulta is TConsultaAparelhos then
    begin
    	vCampoTemp := '';
      vCondicaoTmp := '';
      vsqlAdicional := '';
    	Consulta.campo := ComboBox1.Text;
      Consulta.condicao := combobox3.Text;
      Consulta.ordem := ComboBox2.text;
      if MaskEdit2.Visible then
      begin
        Consulta.dataIni := maskedit1.text;
        Consulta.dataFim := maskedit2.text;
      end
      else
      	Consulta.valor := MaskEdit3.text;

    	if UpperCase(trim(Consulta.campo)) = 'NOME PROPRIETARIO (NOME FANTASIA)' then
	  		vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.NOME_CLIENTE ELSE COLABORADOR.NOME_VENDEDOR END '
      else if UpperCase(trim(Consulta.campo)) = 'NOME PROPRIETARIO (RAZAO SOCIAL)' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.RAZAO ELSE COLABORADOR.NOME_VENDEDOR END '
      else if UpperCase(trim(Consulta.campo)) = 'CEP PROPRIETARIO' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.CEP ELSE COLABORADOR.CEP_VENDEDOR END '
      else if UpperCase(trim(Consulta.campo)) = 'ENDERECO PROPRIETARIO' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.ENDERECO ELSE COLABORADOR.END_VENDEDOR END '
      else if UpperCase(trim(Consulta.campo)) = 'NUM ENDERECO PROPRIETARIO' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.NUM_END_CLIENTE ELSE '''' END '
      else if UpperCase(trim(Consulta.campo)) = 'TELEFONE PROPRIETARIO' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.FONE_CLIENTE ELSE COLABORADOR.FONE_VENDEDOR END '
      else if UpperCase(trim(Consulta.campo)) = 'CELULAR PROPRIETARIO' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.FONE_CELULAR ELSE '''' END '
      else if UpperCase(trim(Consulta.campo)) = 'EMAIL PROPRIETARIO' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.EMAIL ELSE COLABORADOR.EMAIL END '
      else if UpperCase(trim(Consulta.campo)) = 'ESTADO' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ESTADOS.SIGLA_UF ELSE EST.SIGLA_UF END '
      else if UpperCase(trim(Consulta.campo)) = 'CIDADE' THEN
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CIDADES.NOME_CIDADE ELSE CID.NOME_CIDADE END '
      else if UpperCase(trim(Consulta.campo)) = 'BAIRRO' THEN
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN BAIRROS.NOME_BAIRRO ELSE BAI.NOME_BAIRRO END '
      else if UpperCase(trim(Consulta.campo)) = 'LOCALIDADE' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN LOCALIDADE.LOCALIDADE ELSE '''' END '
      else if UpperCase(trim(Consulta.campo)) = 'SETOR' then
        vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN SETOR.SETOR ELSE '''' END ';

      if Trim(vCampoTemp) <> '' then
      begin
        vCondicaoTmp := ComboBox3.Text;
        if UpperCase(trim(vCondicaoTmp)) = 'IGUAL' then
          vCondicaoTmp := '='
        else if UpperCase(trim(vCondicaoTmp)) = 'MAIOR' then
          vCondicaoTmp := '>'
        else if UpperCase(trim(vCondicaoTmp)) = 'MAIOR OU IGUAL' then
          vCondicaoTmp := '>='
        else if UpperCase(trim(vCondicaoTmp)) = 'MENOR' then
          vCondicaoTmp := '<'
        else if UpperCase(trim(vCondicaoTmp)) = 'MENOR OU IGUAL' then
          vCondicaoTmp := '<='
        else if UpperCase(trim(vCondicaoTmp)) = 'DIFERENTE' then
          vCondicaoTmp := '<>'
        else if UpperCase(trim(vCondicaoTmp)) = 'ESTA CONTIDO' then
          vCondicaoTmp := 'like'
        else if LowerCase(trim(vCondicaoTmp)) = 'começa' then
          vCondicaoTmp := 'Começa'
        else
          vCondicaoTmp := '=';
        if trim(vsqlAdicional) <> '' then
          vsqlAdicional := vsqlAdicional + ' and ';
        if vCondicaoTmp = 'like' then
          vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(Consulta.valor)) + '%')
        else if vCondicaoTmp = 'Começa' then
          vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(Consulta.valor)) + '%')
        else
          vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(Consulta.valor)));
        Consulta.valor := '';
        Consulta.campo := '';
        Consulta.ordem := vCampoTemp;
      end;

      if trim(Consulta.CondicaosqlAdicional) <> '' then
      begin
      	if trim(vsqlAdicional) <> '' then
	      	vsqlAdicional := vsqlAdicional + Consulta.CondicaosqlAdicional
      	else if Copy(UpperCase(trim(Consulta.CondicaosqlAdicional)), 1, 3) = 'AND' then
        	vsqlAdicional := vsqlAdicional + Copy(trim(Consulta.CondicaosqlAdicional), 4, Length(trim(Consulta.CondicaosqlAdicional)) - 3)
        else
		      vsqlAdicional := vsqlAdicional + Consulta.CondicaosqlAdicional;
      end;

      if MaskEdit2.Visible then
      begin
        if not Consulta.ConsultaCampos(Consulta.getNomeTabela, Consulta.campo,
          Consulta.ordem, Consulta.dataIni, Consulta.dataFim, vDadosIni.codEmpresa, 1,
          ' EQUIPAMENTO.*, ' +
       	  ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '     CLIENTES.NOME_CLIENTE ' +
          ' ELSE ' +
          '     COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '     CLIENTES.RAZAO ' +
          ' ELSE ' +
          '     COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '		CLIENTES.CEP ' +
          '	ELSE ' +
          ' 	COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '     CLIENTES.ENDERECO ' +
          ' ELSE ' +
          '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          ' 		CLIENTES.NUM_END_CLIENTE ' +
          '	ELSE ' +
          '     '''' END NUM_END_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '     CLIENTES.FONE_CLIENTE ' +
          ' ELSE ' +
          '     COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '     CLIENTES.FONE_CELULAR ' +
          ' ELSE ' +
          '     '''' END CELULAR_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '     CLIENTES.EMAIL ' +
          ' ELSE ' +
          '     COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '    ESTADOS.SIGLA_UF ' +
          ' ELSE ' +
          '    EST.SIGLA_UF END SIGLA_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '    CIDADES.NOME_CIDADE ' +
          ' ELSE ' +
          '    CID.NOME_CIDADE END CIDADE_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '		BAIRROS.NOME_BAIRRO ' +
          '	ELSE ' +
          '   BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '     LOCALIDADE.LOCALIDADE ' +
          ' ELSE ' +
          '     '''' END LOCALIDADE_PROPRIETARIO, ' +
          ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
          '     SETOR.SETOR ' +
          ' ELSE ' +
          '     '''' END SETOR_PROPRIETARIO ',
          ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PROP AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
          ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
          ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
          ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
          ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
          ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
          ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
          ' LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF ' +
          ' LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE ' +
          ' LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO ',
          vsqlAdicional) then
        begin
          Panel1.Visible := false;
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	combobox1.setfocus;
          EXIT;
        end;
      end
      else if not Consulta.ConsultaCampos(Consulta.getNomeTabela, Consulta.valor, Consulta.campo,
        Consulta.condicao, Consulta.ordem, False, vDadosIni.codEmpresa,
        ' EQUIPAMENTO.*, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.NOME_CLIENTE ' +
        ' ELSE ' +
        '     COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.RAZAO ' +
        ' ELSE ' +
        '     COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '		CLIENTES.CEP ' +
        '	ELSE ' +
        ' 	COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.ENDERECO ' +
        ' ELSE ' +
        '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        ' 		CLIENTES.NUM_END_CLIENTE ' +
        '	ELSE ' +
        '     '''' END NUM_END_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.FONE_CLIENTE ' +
        ' ELSE ' +
        '     COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.FONE_CELULAR ' +
        ' ELSE ' +
        '     '''' END CELULAR_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.EMAIL ' +
        ' ELSE ' +
        '     COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '    ESTADOS.SIGLA_UF ' +
        ' ELSE ' +
        '    EST.SIGLA_UF END SIGLA_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '    CIDADES.NOME_CIDADE ' +
        ' ELSE ' +
        '    CID.NOME_CIDADE END CIDADE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '		BAIRROS.NOME_BAIRRO ' +
        '	ELSE ' +
        '   BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     LOCALIDADE.LOCALIDADE ' +
        ' ELSE ' +
        '     '''' END LOCALIDADE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     SETOR.SETOR ' +
        ' ELSE ' +
        '     '''' END SETOR_PROPRIETARIO ',
        ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PROP AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
        ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
        ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
        ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
        ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
        ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
        ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
        ' LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF ' +
        ' LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE ' +
        ' LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO ',
        vsqlAdicional) then
      begin
        Panel1.Visible := false;
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        	ComboBox1.SetFocus;
        EXIT;
      end;
    end
    else if Consulta is TConsultaVeiculos then
    begin
    	vCampoTemp := '';
      vCondicaoTmp := '';
      vsqlAdicional := '';
    	Consulta.campo := ComboBox1.Text;
      Consulta.condicao := combobox3.Text;
      Consulta.ordem := ComboBox2.text;
      if MaskEdit2.Visible then
      begin
        Consulta.dataIni := maskedit1.text;
        Consulta.dataFim := maskedit2.text;
      end
      else
      	Consulta.valor := MaskEdit3.text;

      if (UpperCase(trim(Consulta.campo)) = 'PLACA') then
        vCampoTemp := 'VEICULOS.PLACA'
    	else if UpperCase(trim(Consulta.campo)) = 'NOME CLIENTE (NOME FANTASIA)' then
	  		vCampoTemp := 'CLIENTES.NOME_CLIENTE'
      else if UpperCase(trim(Consulta.campo)) = 'NOME CLIENTE (RAZAO SOCIAL)' then
        vCampoTemp := 'CLIENTES.RAZAO'
      else if UpperCase(trim(Consulta.campo)) = 'CEP CLIENTE' then
        vCampoTemp := 'CLIENTES.CEP'
      else if UpperCase(trim(Consulta.campo)) = 'ENDERECO CLIENTE' then
        vCampoTemp := 'CLIENTES.ENDERECO'
      else if UpperCase(trim(Consulta.campo)) = 'NUM ENDERECO CLIENTE' then
        vCampoTemp := 'CLIENTES.NUM_END_CLIENTE'
      else if UpperCase(trim(Consulta.campo)) = 'TELEFONE CLIENTE' then
        vCampoTemp := 'CLIENTES.FONE_CLIENTE'
      else if UpperCase(trim(Consulta.campo)) = 'CELULAR CLIENTE' then
        vCampoTemp := 'CLIENTES.FONE_CELULAR'
      else if UpperCase(trim(Consulta.campo)) = 'EMAIL CLIENTE' then
        vCampoTemp := 'CLIENTES.EMAIL'
      else if UpperCase(trim(Consulta.campo)) = 'ESTADO' then
        vCampoTemp := 'ESTADOS.SIGLA_UF'
      else if UpperCase(trim(Consulta.campo)) = 'CIDADE' THEN
        vCampoTemp := 'CIDADES.NOME_CIDADE'
      else if UpperCase(trim(Consulta.campo)) = 'BAIRRO' THEN
        vCampoTemp := 'BAIRROS.NOME_BAIRRO'
      else if UpperCase(trim(Consulta.campo)) = 'LOCALIDADE' then
        vCampoTemp := 'LOCALIDADE.LOCALIDADE'
      else if UpperCase(trim(Consulta.campo)) = 'SETOR' then
        vCampoTemp := 'SETOR.SETOR';

      if Trim(vCampoTemp) <> '' then
      begin
        vCondicaoTmp := ComboBox3.Text;
        if UpperCase(trim(vCondicaoTmp)) = 'IGUAL' then
          vCondicaoTmp := '='
        else if UpperCase(trim(vCondicaoTmp)) = 'MAIOR' then
          vCondicaoTmp := '>'
        else if UpperCase(trim(vCondicaoTmp)) = 'MAIOR OU IGUAL' then
          vCondicaoTmp := '>='
        else if UpperCase(trim(vCondicaoTmp)) = 'MENOR' then
          vCondicaoTmp := '<'
        else if UpperCase(trim(vCondicaoTmp)) = 'MENOR OU IGUAL' then
          vCondicaoTmp := '<='
        else if UpperCase(trim(vCondicaoTmp)) = 'DIFERENTE' then
          vCondicaoTmp := '<>'
        else if UpperCase(trim(vCondicaoTmp)) = 'ESTA CONTIDO' then
          vCondicaoTmp := 'like'
        else if LowerCase(trim(vCondicaoTmp)) = 'começa' then
          vCondicaoTmp := 'Começa'
        else
          vCondicaoTmp := '=';
        if trim(vsqlAdicional) <> '' then
          vsqlAdicional := vsqlAdicional + ' and ';

        if (UpperCase(trim(Consulta.campo)) = 'PLACA') then
        begin
          if vCondicaoTmp = 'like' then
            vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(Consulta.valor)) + '%') + ') ' +
              ' or (' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(Consulta.valor))) + '%') + ')) '
          else if vCondicaoTmp = 'Começa' then
            vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(Consulta.valor)) + '%') + ') ' +
              ' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(Consulta.valor))) + '%') + ')) '
          else
            vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' +QuotedStr(trim(Consulta.valor)) + ') ' +
              ' or (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(trim(vDadosIni.retornaPlacaNovaAntiga(Consulta.valor))) + ')) ';
        end
        else
        begin
          if vCondicaoTmp = 'like' then
            vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(Consulta.valor)) + '%')
          else if vCondicaoTmp = 'Começa' then
            vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(Consulta.valor)) + '%')
          else
            vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(Consulta.valor)));
        end;
        Consulta.valor := '';
        Consulta.campo := '';
        Consulta.ordem := vCampoTemp;
      end;

      if trim(Consulta.CondicaosqlAdicional) <> '' then
      begin
      	if trim(vsqlAdicional) <> '' then
        	vsqlAdicional := vsqlAdicional + Consulta.CondicaosqlAdicional
      	else if Copy(UpperCase(trim(Consulta.CondicaosqlAdicional)), 1, 3) = 'AND' then
        	vsqlAdicional := vsqlAdicional + Copy(trim(Consulta.CondicaosqlAdicional), 4, Length(trim(Consulta.CondicaosqlAdicional)) - 3)
        else
		      vsqlAdicional := vsqlAdicional + Consulta.CondicaosqlAdicional;
      end;

    	if MaskEdit2.Visible then
      begin
        if not Consulta.ConsultaCampos(Consulta.getNomeTabela, Consulta.campo,
          Consulta.ordem, Consulta.dataIni, Consulta.dataFim, vDadosIni.codEmpresa, 1,
          ' VEICULOS.*, ' +
       	  ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
          ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
          ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR ',
          ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
          ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
          ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
          ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
          ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
          ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ',
          vsqlAdicional) then
        begin
          Panel1.Visible := false;
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	combobox1.setfocus;
          EXIT;
        end;
      end
      else if not Consulta.ConsultaCampos(Consulta.getNomeTabela, Consulta.valor, Consulta.campo,
        Consulta.condicao, Consulta.ordem, False, vDadosIni.codEmpresa,
        ' VEICULOS.*, ' +
        ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
        ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
        ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR ',
        ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
        ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
        ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
        ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
        ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
        ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ',
        vsqlAdicional) then
      begin
        Panel1.Visible := false;
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        	ComboBox1.SetFocus;
        EXIT;
      end;
    end
    else if Consulta.CondicaosqlAdicional <> '' then
    begin
      if MaskEdit2.Visible then
      begin
        if not Consulta.ConsultaCampos(Consulta.getNomeTabela, ComboBox1.Text,
          ComboBox2.text, maskedit1.text, maskedit2.text, Consulta.CondicaosqlAdicional,
          IntToStr(vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado
          and (vDadosIni.vPesquisaCodEmpresa > 0),
          vDadosIni.vPesquisaCodEmpresa , StrToInt(vDadosIni.codEmpresa)))) then
        begin
          Panel1.Visible := false;
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	combobox1.setfocus;
          EXIT;
        end;
      end
      else
      begin
        if not Consulta.ConsultaCampos(Consulta.getNomeTabela, MaskEdit3.text, ComboBox1.Text,
          combobox3.Text, ComboBox2.text, Consulta.CondicaosqlAdicional, true,
          IntToStr(vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado
          and (vDadosIni.vPesquisaCodEmpresa > 0),
          vDadosIni.vPesquisaCodEmpresa , StrToInt(vDadosIni.codEmpresa)))) then
        begin
          Panel1.Visible := false;
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	combobox1.setfocus;
          EXIT;
        end;
      end;
    end
    else
    begin
      if MaskEdit2.Visible then
      begin
        if not Consulta.ConsultaCampos(Consulta.getNomeTabela, ComboBox1.Text,
          ComboBox2.text, maskedit1.text, maskedit2.text,
          IntToStr(vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado
          and (vDadosIni.vPesquisaCodEmpresa > 0),
          vDadosIni.vPesquisaCodEmpresa , StrToInt(vDadosIni.codEmpresa)))) then
        begin
          Panel1.Visible := false;
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	combobox1.setfocus;
          EXIT;
        end;
      end
      else
      begin
      	if ((UpperCase(trim(Consulta.getNomeTabela)) = 'VEICULOS') or (UpperCase(trim(Consulta.getNomeTabela)) = 'EST_MOTO'))
        	and (UpperCase(trim(ComboBox1.Text)) = 'PLACA')
          and (trim(vDadosIni.retornaPlacaNovaAntiga(MaskEdit3.text)) <> trim(MaskEdit3.text)) then
        begin
        	vValorTmp     := MaskEdit3.text;
        	vCondicaoTmp  := combobox3.Text;
          if (UpperCase(trim(Consulta.getNomeTabela)) = 'VEICULOS') then
	          vCampoTemp := Consulta.getNomeTabela + '.PLACA'
          else if (UpperCase(trim(Consulta.getNomeTabela)) = 'EST_MOTO') then
          	vCampoTemp := Consulta.getNomeTabela + '.PLACAEST';
          vsqlAdicional := '';

          if vCondicaoTmp = 'Igual' then
            vCondicaoTmp := '='
          else if vCondicaoTmp = 'Maior' then
            vCondicaoTmp := '>'
          else if vCondicaoTmp = 'Maior ou Igual' then
            vCondicaoTmp := '>='
          else if vCondicaoTmp = 'Menor' then
            vCondicaoTmp := '<'
          else if vCondicaoTmp = 'Menor ou Igual' then
            vCondicaoTmp := '<='
          else if vCondicaoTmp = 'Diferente' then
            vCondicaoTmp := '<>'
          else if (vCondicaoTmp = 'Esta contido') then
            vCondicaoTmp := 'like'
          else if (vCondicaoTmp = 'Começa') then
            vCondicaoTmp := 'Começa'
          else
            vCondicaoTmp := '=';

          if vCondicaoTmp = 'like' then
            vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vValorTmp)) + '%') + ') ' +
            	' or (' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vValorTmp))) + '%') + ')) '
          else if vCondicaoTmp = 'Começa' then
            vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vValorTmp)) + '%') + ') ' +
         			' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vValorTmp))) + '%') + ')) '
          else
          	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' +QuotedStr(trim(vValorTmp)) + ') ' +
		  	      ' or (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(trim(vDadosIni.retornaPlacaNovaAntiga(vValorTmp))) + ')) ';

        	if not Consulta.ConsultaCampos(Consulta.getNomeTabela, '', '',
            combobox3.Text, ComboBox2.text, true,
            IntToStr(vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado
            and (vDadosIni.vPesquisaCodEmpresa > 0),
            vDadosIni.vPesquisaCodEmpresa , StrToInt(vDadosIni.codEmpresa))),
            Consulta.getNomeTabela + '.* ', '', vsqlAdicional) then
          begin
            Panel1.Visible := false;
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            	ComboBox1.SetFocus;
            EXIT;
          end;
        end
        else if not Consulta.ConsultaCampos(Consulta.getNomeTabela, MaskEdit3.text, ComboBox1.Text,
          combobox3.Text, ComboBox2.text, true,
          IntToStr(vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado
          and (vDadosIni.vPesquisaCodEmpresa > 0),
          vDadosIni.vPesquisaCodEmpresa , StrToInt(vDadosIni.codEmpresa)))) then
        begin
          Panel1.Visible := false;
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	ComboBox1.SetFocus;
          EXIT;
        end;
      end;
    end;
    if Consulta is TConsultaProdutoP then
      Height := 600
    else
    	Height := 500;

  	if Consulta is TConsultaProdutoP then
    begin
    	if Consulta.dataSet.IsEmpty then
	    begin
      	LabelEstPrima.Visible :=
          (vDadosIni.vEmp.vUsarProducao = 'S') and (Consulta.dataSet.FieldByName('CRIAR_PRODUCAO_AUT').AsString = 'S');
        PanelEstPrima.Visible :=
          (vDadosIni.vEmp.vUsarProducao = 'S') and (Consulta.dataSet.FieldByName('CRIAR_PRODUCAO_AUT').AsString = 'S');

        Consulta.buscas.Close;
        Consulta.buscas.SQL.Text :=  ' SELECT COUNT(*) FROM INDICE_TECNICO ' +
          '	WHERE INDICE_TECNICO.GRUPO_PROD_ACABADO = ' + IntToStr(Consulta.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
          ' AND INDICE_TECNICO.COD_PROD_ACABADO = ' + QuotedStr(Consulta.dataSet.FieldByName('COD_PROD').AsString) +
          ' AND INDICE_TECNICO.COD_EMPRESA = ' + vDadosIni.codEmpresa;
        Consulta.buscas.Open;
        
        btMateriaPrima.Visible := Consulta.buscas.FieldByName('COUNT').AsInteger > 0;

        if (vDadosIni.vEmp.vAlmox = 'S2')
          and (vDadosIni.vEmp.vUsarProducao = 'S')
          and (Consulta.dataSet.FieldByName('CRIAR_PRODUCAO_AUT').AsString = 'S') then
        begin
          PanelEstF.Width     := 120;
          PanelEstR.Width     := 120;
          PanelEstPrima.Width := 120;

          PanelEstF.Left      := 243;
          PanelEstR.Left      := 369;
          PanelEstPrima.Left  := 496;
        end
        else if vDadosIni.vEmp.vAlmox = 'S2' then
        begin
          PanelEstF.Left      := 243;
          PanelEstR.Left      := 436;

          PanelEstF.Width     := 180;
          PanelEstR.Width     := 180;
        end
        else if (vDadosIni.vEmp.vUsarProducao = 'S')
          and (Consulta.dataSet.FieldByName('CRIAR_PRODUCAO_AUT').AsString = 'S') then
        begin
          PanelEstF.Left      := 243;
          PanelEstPrima.Left  := 436;

          PanelEstF.Width     := 180;
          PanelEstPrima.Width := 180;
        end
        else
        begin
          PanelEstF.Width := 373;
        end;
  	  end;
    end;
    Panel1.Visible := true;
    //if(not dtmConsultas.qrGradeProd.IsEmpty) then
   // GroupBox1.Visible := true
   // else
   // GroupBox1.Visible := false;
    for I := 0 to DBGrid1.Columns.Count - 1 do
      DBGrid1.Columns[i].Title.Font.Style := [];
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
    _GravaConfiguracoesBoolean('ckConsumo', ckConsumo.Checked);
  finally
    Label16.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLocalizar.BitBtn20Click(Sender: TObject);
begin
  inherited;
  if Consulta.dataSet.IsEmpty then
   exit;

 PageControl1.ActivePage := TabSheet10;

  if (PageControl1.ActivePage = TabSheet10) then
  begin
    DBText27.DataSource := DataSource1;
    DBText27.DataField := 'DESCR_PROD';
    DBText28.DataSource := DataSource1;
    DBText28.DataField := 'GRUPO_PROD';
    DBText29.DataSource := DataSource1;
    DBText29.DataField := 'COD_PROD';
    DBText30.DataSource := DataSource1;
    DBText30.DataField := 'NUM_FAB_PROD';
    DBText32.DataSource := DataSource1;
    DBText32.DataField := 'PREC_TAB_PROD';
    DBText33.DataSource := DataSource1;
    DBText33.DataField := 'PREC_PUBLICO';
    Consulta.vPromocaoProd := TPromocaoTab.Create;
    Consulta.vPromocaoProd._abrePromocaoTab(DBText28.Caption, DBText29.Caption);
  end;
end;

procedure TfrmLocalizar.BitBtn21Click(Sender: TObject);
begin
	if Consulta.dataSet.IsEmpty then
   exit;
   
  inherited;
  if Consulta.getNomeTabela = 'PRODUTOS' then
	 vDadosIni.abreFormImagensProduto(Consulta.dataSet.FieldByName('DESCR_PROD').AsString,
    	Consulta.dataSet.FieldByName('GRUPO_PROD').AsString, Consulta.dataSet.FieldByName('COD_PROD').AsString,
      Consulta.dataSet.FieldByName('NUM_FAB_PROD').AsString, Consulta.dataSet.FieldByName('PREC_TAB_PROD').AsFloat,
      Consulta.dataSet.FieldByName('PREC_PUBLICO').AsFloat, Consulta.buscas);
end;

procedure TfrmLocalizar.BitBtn22Click(Sender: TObject);
begin
  if (Consulta.getNomeTabela = 'CLIENTES') then
    if Consulta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
    	Consulta.cl_abreExtrato_form(Consulta.dataSet.FieldByName('COD_CLIENTE').AsInteger);
//      vDadosIni.cl_abreFormValeResgateTroca(Consulta.dataSet.FieldByName('COD_CLIENTE').AsInteger, '');
end;

procedure TfrmLocalizar.BitBtn23Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
end;

procedure TfrmLocalizar.BitBtn2Click(Sender: TObject);
begin
  inherited;
  //  Consulta.Pegacodigo;
  //  vDadosIni.vPesquisa := Consulta.valorindex;
  gravaConfiguracoesRegistro;
  ModalResult := mrOk;
end;

procedure TfrmLocalizar.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if PageControl2.ActivePage = TabSheet3 then
  begin
    Consulta.alteraLocacao(maskedit4.text, maskedit5.text);
  end
  else if PageControl2.ActivePage = TabSheet4 then
  begin
    Consulta.UltBProd.buscas.Close;
    Consulta.UltBProd := nil;
    Consulta.UltBProd.Free;
  end
  else if PageControl2.ActivePage = TabSheet5 then
  begin
    Consulta.buscas.Close;
  end
  else if PageControl2.ActivePage = TabSheet6 then
  begin
    Consulta.buscas.Close;
  end
  else if PageControl2.ActivePage = TabSheet7 then
  begin
    if not Consulta.TransferirDepositoLoja(EditMoeda1.Valor) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (EditMoeda1.CanFocus) then
      	EditMoeda1.SetFocus;
      exit;
    end
    else
      Consulta.Funcionario.Close;
  end
  else if PageControl2.ActivePage = TabSheet8 then
  begin
    //    if (Consulta.VendaPerdida.dataSet.FieldByName('CODIGO_VP').IsNull)  or (trim(DBLookupComboBox3.Text)='') then
    DBLookupComboBox3Exit(Sender);
    DBLookupComboBox2Exit(Sender);
    DBEdit5Exit(Sender);
    if not
      Consulta.ManterVendaPerdida(Consulta.VendaPerdida.dataSet.FieldByName('COD_VENDEDOR').AsInteger,
      Consulta.VendaPerdida.dataSet.FieldByName('CODIGO_VP').AsInteger,
      Consulta.VendaPerdida.dataSet.FieldByName('QUANT_PROD_VP').Asfloat) then
      Application.MessageBox('Erro ao gravar venda perdida', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
    Consulta.Funcionario.Close;
    Consulta.TipoVndPerdida.Close;
    Consulta.VendaPerdida.Close;
  end;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := false;
  TabSheet8.TabVisible := false;
  TabSheet9.TabVisible := false;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  Panel1.Visible := true;
  if DBGrid1.DataSource.DataSet.Active then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end
  else if MaskEdit3.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
    	MaskEdit3.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
    MaskEdit6.SetFocus
  else if MaskEdit1.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
    	MaskEdit1.SetFocus;
  end;
end;

procedure TfrmLocalizar.BitBtn4Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  if Consulta is TConsultaProdutoP then
    if Consulta.buscas.Active then
      Consulta.buscas.Close;
  Close;
end;

procedure TfrmLocalizar.BitBtn5Click(Sender: TObject);
begin
  inherited;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := false;
  TabSheet8.TabVisible := false;
  TabSheet9.TabVisible := false;
  if Consulta is TConsultaProdutoP then
    if Consulta.buscas.Active then
      Consulta.buscas.Close;
  if Consulta.UltCProd <> nil then
  begin
    Consulta.UltCProd.buscas.Close;
    Consulta.UltCProd := nil;
    Consulta.UltCProd.Free;
  end;
  if Consulta.UltBProd <> nil then
  begin
    Consulta.UltBProd.buscas.Close;
    Consulta.UltBProd := nil;
    Consulta.UltBProd.Free;
  end;
  if Consulta.Pesquisa <> nil then
  begin
    Consulta.Pesquisa.buscas.Close;
    Consulta.Pesquisa := nil;
    Consulta.Pesquisa.Free;
  end;
  if Consulta.Funcionario <> nil then
  begin
    Consulta.Funcionario.Close;
    Consulta.Funcionario := nil;
    Consulta.Funcionario.Free;
  end;
  if Consulta.TipoVndPerdida <> nil then
  begin
    Consulta.TipoVndPerdida.Close;
    Consulta.TipoVndPerdida := nil;
    Consulta.TipoVndPerdida.Free;
  end;
  if Consulta.VendaPerdida <> nil then
  begin
    Consulta.VendaPerdida.Close;
    Consulta.VendaPerdida := nil;
    Consulta.VendaPerdida.Free;
  end;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  if DBGrid1.DataSource.DataSet.Active then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end
  else if MaskEdit3.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
    	MaskEdit3.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
    MaskEdit6.SetFocus
  else if MaskEdit1.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
    	MaskEdit1.SetFocus;
  end;
end;

procedure TfrmLocalizar.BitBtn6Click(Sender: TObject);
begin
	if Consulta.dataSet.IsEmpty then
   exit;
   
  inherited;
  if vDadosIni.PesqPros('PES003', 'VISUALIZAR', '', 'PESQUISARAPIDA',
    Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then
  begin
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TabSheet5.TabVisible := true;
    TabSheet5.Show;
    Consulta.UltCProd := TUltimasComprasProd.Create;
    Consulta.UltCProd.abreUltimasCompras(Consulta.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      trim(Consulta.dataSet.FieldByName('COD_PROD').AsString));
  end;
end;

procedure TfrmLocalizar.BitBtn7Click(Sender: TObject);
begin
	if Consulta.dataSet.IsEmpty then
   exit;
   
  inherited;
  if vDadosIni.PesqPros('PES007', 'VISUALIZAR', '', 'PESQUISARAPIDA',
    Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then
    Consulta.MediaVendaMes;
end;

procedure TfrmLocalizar.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if Consulta.dataSet.IsEmpty then
   exit;

  if vDadosIni.PesqPros('PES002', 'ALTERAR', '', 'PESQUISARAPIDA',
    Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then
  begin
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TabSheet3.TabVisible := true;
    TabSheet3.Show;
  end;
end;

procedure TfrmLocalizar.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if Consulta.dataSet.IsEmpty then
   exit;
   
  if not vDadosIni.PesqPros('PES004', 'VISUALIZAR', '', 'PESQUISARAPIDA', Consulta.dataSet.FieldByName('NUM_FAB_PROD').asstring, Consulta.buscas, true) then
  	Exit;

  if not Assigned(Consulta.UltBProd) then
  	Consulta.UltBProd := TUltimoBalancoProd.Create;

  Consulta.UltBProd.abreUltimoBalancoProd(
    Consulta.dataSet.FieldByName('GRUPO_PROD').AsInteger,
    trim(Consulta.dataSet.FieldByName('COD_PROD').AsString));

  ckVerGrades.Checked     := _LerConfiguracoesRegistroBoolean(ckVerGrades.Name, False);

  GroupBoxVerGrades.Width := _LerConfiguracoesRegistroInteger(GroupBoxVerGrades.Name, vDadosIni.IfThen(GroupBoxVerGrades.Width < 220, 220, GroupBoxVerGrades.Width));

  ckVerGradesClick(Sender);

	PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
  TabSheet4.TabVisible := true;
  TabSheet4.Show;
end;

procedure TfrmLocalizar.btMateriaPrimaClick(Sender: TObject);
begin
  inherited;
	if Consulta.dataSet.IsEmpty then
    exit;

  PageControl1.ActivePage := TabSheet11;

  if (PageControl1.ActivePage = TabSheet11) then
  begin
    DBText1.DataSource := DataSource1;
    DBText1.DataField := 'DESCR_PROD';
    DBText2.DataSource := DataSource1;
    DBText2.DataField := 'GRUPO_PROD';
    DBText5.DataSource := DataSource1;
    DBText5.DataField := 'COD_PROD';
    DBText6.DataSource := DataSource1;
    DBText6.DataField := 'NUM_FAB_PROD';
    DBText7.DataSource := DataSource1;
    DBText7.DataField := 'PREC_TAB_PROD';
    DBText8.DataSource := DataSource1;
    DBText8.DataField := 'PREC_PUBLICO';
    Consulta.vProdutoAcabado := TProdutoAcabado.Create;
    Consulta.vProdutoAcabado._abreProdutoAcabado(DBText2.Caption, DBText5.Caption, PanelEstPrima.Visible);
  end;
end;

procedure TfrmLocalizar.bt_outros_prodClick(Sender: TObject);
begin
  inherited;
	pmOutros.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmLocalizar.ckMenuLateralClick(Sender: TObject);
begin
	// CLIENTES
  if (not MenuLateralExibirObservacaoCl.Checked) 
  	and (not MenuLateralExibirObservacaoSpcCl.Checked)
    and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
    	MenuLateralExibirObservacaoCl.Checked := True;

  // PRODUTOS
  if (not MenuLateralExibirObservacaoProd.Checked)
    and (not MenuLateralExibirDetalhesCaractersticasProd.Checked)
    and (not MenuLateralExibirCodigosProd.Checked) then
      MenuLateralExibirObservacaoProd.Checked := True;

  try
    if (PageControl1.ActivePage <> TabSheet1) then
    begin
      // CLIENTES
      pnObservacaoCl.Visible := false;
      pnObservacaoSpcCl.Visible := false;
      pnObservacaoReqOsCl.Visible := false;
      pnOpcaoDireitaClientes.Visible := false;

      // PRODUTOS
      pnObservacaoProd.Visible := false;
      pnCaracteristicaProd.Visible := false;
      pnOpcaoDireitaProdutos.Visible := false;

      exit;
    end;

    // CLIENTES
    vHabObservacaoCl := MenuLateralExibirObservacaoCl.Checked;
    vHabObservacaoSpcCl := MenuLateralExibirObservacaoSpcCl.Checked;
    vHabObservacaoReqOsCl := MenuLateralExibirObservacaoReqOSCl.Checked;

    // PRODUTOS
    vHabObservacaoProd := MenuLateralExibirObservacaoProd.Checked;
    vHabCaracteristicaProd := MenuLateralExibirDetalhesCaractersticasProd.Checked;
  	vHabCodigoProd := MenuLateralExibirCodigosProd.Checked;

    // CLIENTES
    pnObservacaoCl.Visible := vHabObservacaoCl;

    SplitterObservacaoBottomCl.Visible := (vHabObservacaoCl) and ((vHabObservacaoSpcCl) or (vHabObservacaoReqOsCl));

    pnObservacaoSpcCl.Visible := vHabObservacaoSpcCl;

    SplitterObservacaoSpcBottomCl.Visible := (vHabObservacaoCl) and (vHabObservacaoSpcCl) and (vHabObservacaoReqOsCl);

    pnObservacaoReqOsCl.Visible := vHabObservacaoReqOsCl;

    pnOpcaoDireitaClientes.Visible := (ckMenuLateral.Checked) and (Consulta.getNomeTabela = 'CLIENTES');

    // PRODUTOS
    pnObservacaoProd.Visible := vHabObservacaoProd;

    SplitterObservacaoBottomProd.Visible := (vHabObservacaoProd) and ((vHabCaracteristicaProd) or (vHabCodigoProd));

    pnCaracteristicaProd.Visible := vHabCaracteristicaProd;

    SplitterCaracteristicaBottomProd.Visible := (vHabCaracteristicaProd) and (vHabCodigoProd);

    pnCodigoProd.Visible := vHabCodigoProd;

    pnOpcaoDireitaProdutos.Visible := (ckMenuLateral.Checked) and (Consulta.getNomeTabela = 'PRODUTOS');

    if ckMenuLateral.Tag = 99 then
    	AjustarBarraLateral(True)
    else
			AjustarBarraLateral(False);
  finally
    if (PageControl1.ActivePage = TabSheet1) then
    begin
      if (Consulta.getNomeTabela = 'CLIENTES') then
      begin
      	if pnOpcaoDireitaClientes.Width < 150 then
	        pnOpcaoDireitaClientes.Width := 150;

        if pnObservacaoCl.Height <= 25 then
          pnObservacaoCl.Height := 25;

        if pnObservacaoSpcCl.Height <= 25 then
          pnObservacaoSpcCl.Height := 25;

        if pnObservacaoReqOsCl.Height <= 25 then
          pnObservacaoReqOsCl.Height := 25;

      	_GravaConfiguracoesBoolean(ckMenuLateral.Name + 'Cl', ckMenuLateral.Checked);
      end
      else if (Consulta.getNomeTabela = 'PRODUTOS') then
      begin
      	if pnOpcaoDireitaProdutos.Width < 150 then
	        pnOpcaoDireitaProdutos.Width := 150;

        if pnObservacaoProd.Height <= 25 then
          pnObservacaoProd.Height := 25;

        if pnCaracteristicaProd.Height <= 25 then
          pnCaracteristicaProd.Height := 25;

        _GravaConfiguracoesBoolean(ckMenuLateral.Name + 'Prod', ckMenuLateral.Checked);
      end;
    end;
  end;
end;

procedure TfrmLocalizar.ckVerGradesClick(Sender: TObject);
begin
  inherited;
  SplitterVerGrades.Visible := ckVerGrades.Checked;
	GroupBoxVerGrades.Visible := ckVerGrades.Checked;
  SplitterVerGrades.Align := alLeft;
  SplitterVerGrades.Align := alRight;

  if ckVerGrades.Checked then
  begin
  	if not Assigned(Consulta.UltBProd) then
  		Consulta.UltBProd := TUltimoBalancoProd.Create;

    if Consulta.UltBProd.buscas.IsEmpty then
    begin
      Consulta.UltBProd.vUltimoBalancoProdGrade.abreUltimoBalancoGrade(
        0,
        '000000',
        Date,
        Date);
    end
    else
    begin
      Consulta.UltBProd.vUltimoBalancoProdGrade.abreUltimoBalancoGrade(
        Consulta.UltBProd.buscas.FieldByName('grupo_prod').AsInteger,
        Consulta.UltBProd.buscas.FieldByName('cod_prod').AsString,
        Consulta.UltBProd.buscas.FieldByName('data_cadastro').AsDateTime,
        Consulta.UltBProd.buscas.FieldByName('data_confirm').AsDateTime);
    end;
    
    Consulta.UltBProd.buscas.AfterScroll := Consulta.UltBProd.datasetAfterScrollUltimoBalancoProdGrade;
  end
  else
  	Consulta.UltBProd.buscas.AfterScroll := nil;
end;

procedure TfrmLocalizar.ComboBox1Enter(Sender: TObject);
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

procedure TfrmLocalizar.ComboBox1Exit(Sender: TObject);
var
  I: Integer;
begin
  Height := 111;
  vShow := 111;
  if ActiveControl = BitBtn4 then
    Exit;

  if ComboBox1.Text <> 'TODOS' then
    ComboBox1.Text := ComboBox1.Items[ComboBox1.ItemIndex];
  if ComboBox1.Text <> 'TODOS' then
    ComboBox2.Text := ComboBox1.Text
  else
    ComboBox2.Text := ComboBox1.Items[0];
  if DBGrid1.DataSource <> nil then
    //    for I := 0 to DBGrid1.Columns.Count - 1 do
    if UpperCase(ComboBox1.Text) = 'TODOS' then
      configuraVisual('*****')
    else
    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    begin
      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
      begin
        naoOrdenar := true;
        configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName);
        if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i] is TMemoField then
          MaskEdit3.CharCase := ecNormal
        else
          MaskEdit3.CharCase := ecUpperCase;

        if (Consulta.getNomeTabela = 'PRODUTOS') then
        begin
          if (ComboBox1.Text = 'Cod. Produto') then
          begin
            ComboBox3.Items.clear;
            ComboBox3.Items.Add('Igual');
          end
          else
            if ((ComboBox3.Items.Count = 1) and (ComboBox3.Items[0] = 'Igual')) then
            begin
              ComboBox3.Items.clear;
              ComboBox3.Items.Add('Começa');
              ComboBox3.Items.add('Igual');
              ComboBox3.Items.add('Diferente');
              ComboBox3.Items.add('Maior');
              ComboBox3.Items.add('Menor');
              ComboBox3.Items.add('Esta contido');
            end;
        end;
        naoOrdenar := false;
        Exit;
      end;
    end;

end;

procedure TfrmLocalizar.ConfigurarColunas1Click(Sender: TObject);
begin
  inherited;
  if Consulta is TConsultaProdutoP then
  begin
    if not vDadosIni.PesqPros('PES001', 'CONFIGURAR', '', 'PESQUISARAPIDA', '', Consulta.buscas,
      true) then
      exit;
  end;

  if (cdsColunas = nil) or (not cdsColunas.Active) or (DBGrid1.DataSource = nil) then
    exit;

  configurarGridPeloCheckListBox(DBGrid1);
  salvarGridNoConfigColunas(DBGrid1);
end;

procedure TfrmLocalizar.ConfigurarColunas2Click(Sender: TObject);
begin
  inherited;
  configurarGridPeloCheckListBox(DBGrid2);
  salvarGridNoConfigColunas(DBGrid2);
end;

procedure TfrmLocalizar.ConfigurarColunas3Click(Sender: TObject);
begin
  inherited;
  configurarGridPeloCheckListBox(DBGrid8);
  salvarGridNoConfigColunas(DBGrid8);
end;

procedure TfrmLocalizar.ConfigurarColunas4Click(Sender: TObject);
begin
  inherited;
  configurarGridPeloCheckListBox(DBGridCodigoProd);
  salvarGridNoConfigColunas(DBGridCodigoProd);
end;

procedure TfrmLocalizar.configurarGridPeloCheckListBox(PGridCfg: TDBGrid);
var
  frmConfCol: TForm;
  PanelAllClient, PanelBottom: TPanel;
  ListCk: TCheckListBox;
  BotaoSair: TBitBtn;
  PopMn: TPopupMenu;
  PopMnSelAl, PopMnUnSelAll: TMenuItem;
  I, J: Integer;
begin
  if PGridCfg = nil then
    Exit;
  GridCfg := TDBGrid(PGridCfg);
  if not Assigned(GridCfg.DataSource) then
    Exit;
  if not Assigned(GridCfg.DataSource.DataSet) then
    Exit;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);

  frmConfCol := TForm.Create(Application); frmConfCol.Width := 600; frmConfCol.Height := 400; frmConfCol.Position := poScreenCenter; frmConfCol.Caption := 'Configuração de Colunas';
  PanelAllClient := TPanel.Create(frmConfCol); PanelAllClient.Parent := frmConfCol; PanelAllClient.Align := alClient; PanelAllClient.Caption := ''; PanelAllClient.BevelOuter := bvNone; PanelAllClient.BorderWidth := 6; PanelAllClient.Name := 'ContentPanelListCheck999';
  PanelBottom := TPanel.Create(PanelAllClient); PanelBottom.Parent := PanelAllClient; PanelBottom.Align := alBottom; PanelBottom.Caption := ''; PanelBottom.BevelOuter := bvNone; PanelBottom.BevelKind := bkTile; PanelBottom.BorderWidth := 7;
  PopMn := TPopupMenu.Create(frmConfCol);
  ListCk := TCheckListBox.Create(PanelAllClient); ListCk.Parent := PanelAllClient; ListCk.Style := lbOwnerDrawVariable; ListCk.Align := alClient; ListCk.OnClickCheck := ListCheckClickCheck; ListCk.Name := 'ListCheck999'; ListCk.PopupMenu := PopMn;
  ListCk.Clear;
  for I := 0 to cdsGrid.Fields.Count - 1 do
  begin
    J := ListCk.Items.Add(cdsGrid.Fields[I].DisplayLabel);
    ListCk.ItemEnabled[J] := (cdsGrid.Fields[I].Tag = 0) or (cdsGrid.Fields[I].Tag = 3);
    ListCk.Checked[J] := cdsGrid.Fields[I].Visible;
  end;
  ListCk.Sorted := True;

  PopMnSelAl := TMenuItem.Create(ListCk); PopMnSelAl.Caption := 'Selecionar todos'; PopMnSelAl.OnClick := PopMnSelAllClick;
  PopMn.Items.Add(PopMnSelAl);
  PopMnUnSelAll := TMenuItem.Create(ListCk); PopMnUnSelAll.Caption := 'Remover a seleção de todos'; PopMnUnSelAll.OnClick := PopMnUnSelAllClick;
  PopMn.Items.Add(PopMnUnSelAll);

  BotaoSair := TBitBtn.Create(PanelBottom); BotaoSair.Parent := PanelBottom; BotaoSair.Caption := 'Sair'; BotaoSair.Align := alRight; BotaoSair.ModalResult := mrAbort;

  frmConfCol.ShowModal;

  FreeAndNil(BotaoSair);
  FreeAndNil(PopMnSelAl);
  FreeAndNil(PopMnUnSelAll);
  FreeAndNil(PopMn);
  FreeAndNil(ListCk);
  FreeAndNil(PanelBottom);
  FreeAndNil(PanelAllClient);
  FreeAndNil(frmConfCol);
end;

procedure TfrmLocalizar.configurarGridPeloConfigColunas(PGridCfg: TDBGrid);
var
  I: Integer;
  Field: TField;
  FieldName: string;
  Visivel: Boolean;
  Column: TColumn;
  List, ListDelete: TStrings;
begin
  if PGridCfg = nil then
    Exit;
  GridCfg := TDBGrid(PGridCfg);
  if not Assigned(GridCfg.DataSource) then
    Exit;
  if not Assigned(GridCfg.DataSource.DataSet) then
    Exit;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);

  cdsGrid.DisableControls;
  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas where usuario = ' +
    QuotedStr(usuario)+' and componente = '+QuotedStr(getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name));
  cdsColunas.Open;
  cdsColunas.IndexFieldNames := 'ordem';

  for I := 0 to cdsGrid.Fields.Count - 1 do
    if not cdsColunas.Locate('campos', cdsGrid.Name + cdsGrid.Fields[I].FieldName, []) then
    begin
      Field := cdsGrid.Fields[I];
      if (Field.Tag = 0) or (Field.Tag = 2) then Field.Visible := True
      else Field.Visible := False;
      cdsColunas.Insert;
      if Field.Visible then
        cdsColunas.FieldByName('visivel').AsInteger := 1
      else
        cdsColunas.FieldByName('visivel').AsInteger := 0;
      cdsColunas.FieldByName('usuario').AsString           := usuario;
      cdsColunas.FieldByName('componente').AsString        := getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name);
      cdsColunas.FieldByName('campos').AsString            := cdsGrid.Name + Field.FieldName;
      cdsColunas.FieldByName('ordem').AsInteger            := 9999 + Field.Index;
      cdsColunas.Post;
    end;
  try
    cdsColunas.First;
    I := 0;
    while not cdsColunas.Eof do
    begin
      FieldName := cdsColunas.FieldByName('campos').AsString;
      Delete(FieldName, 1, Length(cdsGrid.Name));
      Field := cdsGrid.FindField(FieldName);
      if Field <> nil then
      begin
        Visivel := cdsColunas.FieldByName('visivel').AsInteger = 1;
        if (Field.Tag = 1) then
          Visivel := False
        else if (Field.Tag = 2) then
          Visivel := True;
        Field.Visible := Visivel;
        Field.Index := I;

        if (GridCfg.Columns.Count) < (I + 1) then
          Column := TColumn.Create(GridCfg.Columns)
        else
          Column := GridCfg.Columns[Field.Index];
        if cdsColunas.FieldByName('largura_exibicao').AsInteger > 0 then
          Column.Width := cdsColunas.FieldByName('largura_exibicao').AsInteger;
        Column.Index := Field.Index;
        Column.Visible := Field.Visible;
        Column.FieldName := Field.FieldName;
      end
      else
      begin
        if ListDelete = nil then
        begin
          ListDelete := TStringList.Create;
          ListDelete.Clear;
        end;
        ListDelete.Add(Trim(cdsColunas.FieldByName('campos').AsString));
      end;
      I := I + 1;
      cdsColunas.Next;
    end;
    if ListDelete <> nil then
    begin
      for I := 0 to ListDelete.Count - 1 do
        if cdsColunas.Locate('campos', ListDelete[I], []) then
          cdsColunas.Delete;
      if cdsColunas.ChangeCount > 0 then
      begin
        cdsColunas.ApplyUpdates(-1);
        trans.Commit;
        trans.StartTransaction;
      end;
    end;
  finally
  end;
  cdsGrid.EnableControls;
end;

procedure TfrmLocalizar.configuraVisual(nomeCampo: string);
var
  Field: TField;
begin
  if DBGrid1.DataSource = nil then
    Exit;

  Field := TClientDataSet(DBGrid1.DataSource.DataSet).FindField(nomeCampo);
  if Field = nil then
  begin
    MaskEdit6.Visible := False;
    MaskEdit7.Visible := False;
    MaskEdit8.Visible := False;
    Label17.Visible := False;
    Label18.Visible := False;
    Label19.Visible := False;

    MaskEdit3.Visible := true;
    MaskEdit1.Visible := false;
    MaskEdit2.Visible := false;
    Label4.Visible := false;
    Label2.Visible := true;
    MaskEdit3.EditMask := '';
    if (DBGrid1.DataSource.DataSet.Active) and (Height > 111) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      	DBGrid1.SetFocus
    end
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
      MaskEdit3.SetFocus;
  end
    else
    if Field is TDateTimeField then
    begin
      MaskEdit3.Visible := false;
      MaskEdit1.Visible := true;
      MaskEdit2.Visible := true;
      Label4.Visible := true;
      Label2.Visible := True;
      MaskEdit6.Visible := False;
      MaskEdit7.Visible := False;
      MaskEdit8.Visible := False;
      Label17.Visible := False;
      Label18.Visible := False;
      Label19.Visible := False;

      if uppercase(ShortDateFormat[1]) <> 'D' then
        ShortDateFormat := 'dd/mm/yyyy';
      if (length(ShortDateFormat) <= 8) and (pos('yyyy', ShortDateFormat) = 0) then
      begin
        MaskEdit1.EditMask := '!99/99/00;1;_';
        MaskEdit2.EditMask := '!99/99/00;1;_';
        if MaskEdit1.Text = '  /  /    ' then
          MaskEdit1.Text := DateToStr(Date);
        if MaskEdit2.Text = '  /  /    ' then
          MaskEdit2.Text := DateToStr(Date);
      end
      else
      begin
        MaskEdit1.EditMask := '!99/99/0000;1;_';
        MaskEdit2.EditMask := '!99/99/0000;1;_';
        if MaskEdit1.Text = '  /  /    ' then
          MaskEdit1.Text := DateToStr(Date);
        if MaskEdit2.Text = '  /  /    ' then
          MaskEdit2.Text := DateToStr(Date);
      end;
      ComboBox1.Text := Field.DisplayLabel;
      ComboBox2.Text := Field.DisplayLabel;
      if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
      	MaskEdit1.SetFocus;
    end
    else
    begin
      if (Consulta.getNomeTabela = 'PRODUTOS') and (Field.FieldName = 'COD_PROD') then
      begin
        MaskEdit6.Visible := true;
        MaskEdit7.Visible := true;
        MaskEdit8.Visible := true;
        Label17.Visible := true;
        Label18.Visible := true;
        Label19.Visible := true;
        if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
        	MaskEdit6.SetFocus;

        MaskEdit3.Visible := false;
        MaskEdit1.Visible := false;
        MaskEdit2.Visible := false;
        Label4.Visible := false;
        Label2.Visible := false;
      end
      else
      begin
        MaskEdit6.Visible := False;
        MaskEdit7.Visible := False;
        MaskEdit8.Visible := False;
        Label17.Visible := False;
        Label18.Visible := False;
        Label19.Visible := False;

        MaskEdit3.Visible := true;
        MaskEdit1.Visible := false;
        MaskEdit2.Visible := false;
        Label4.Visible := false;
        Label2.Visible := true;
        MaskEdit3.EditMask := Field.EditMask;
        if (DBGrid1.DataSource.DataSet.Active) and (Height > 111) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
          	DBGrid1.SetFocus;
        end
        else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
          MaskEdit3.SetFocus;
      end;
      ComboBox1.Text := Field.DisplayLabel;
      ComboBox2.Text := Field.DisplayLabel;
    end;
end;

procedure TfrmLocalizar.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) then
    if Consulta.VendaPerdida.dataSet.FieldByName('QUANT_PROD_VP').asfloat = 0 then
    begin
      Application.MessageBox(PChar('Quantidade perdida na venda deve ser informado.'),
        'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
      	DBEdit5.SetFocus;
      abort;
    end;
end;

procedure TfrmLocalizar.DBGrid10DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if ((Column.Field.Dataset.FieldbyName('GRUPO_PROD').AsInteger > 0) or (trim(Column.Field.Dataset.FieldbyName('COD_PROD').AsString) <> ''))
  	and (Column.Field.Dataset.FieldbyName('ID_IND').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;

    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TfrmLocalizar.DBGrid11DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if ((Column.Field.Dataset.FieldbyName('GRUPO_PROD').AsInteger > 0) or (trim(Column.Field.Dataset.FieldbyName('COD_PROD').AsString) <> ''))
  	and (Column.Field.Dataset.FieldbyName('ID_IND_IT').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;

    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TfrmLocalizar.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  Screen.Cursor := crDefault;
  crH := GetCursor;
  vcrSizeWE := GetCursor;
end;

procedure TfrmLocalizar.DBGrid1ColEnter(Sender: TObject);
var
  iGrid, iArr: Integer;
begin
  if (Length(fieldsEditButton) > 0) and Assigned(DBGrid1.DataSource) and DBGrid1.DataSource.DataSet.Active then
    for iArr := Low(fieldsEditButton) to High(fieldsEditButton) do
      for iGrid := 0 to DBGrid1.Columns.Count - 1 do
        if AnsiUpperCase(DBGrid1.Columns[iGrid].FieldName) = AnsiUpperCase(fieldsEditButton[iArr]) then
        begin
          DBGrid1.Columns[iGrid].ButtonStyle := cbsEllipsis;
          Break;
        end;
end;

procedure TfrmLocalizar.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  {crH := GetCursor;
  screen.Cursor := crHSplit;
  vcrHSplit := GetCursor;
  if crH = vcrHSplit then
  begin
    AjustaLaguraColunas(DBGrid1);
  end
  else
  begin
    screen.Cursor := crSizeWE;
    crH := GetCursor;
    if crH <> vcrSizeWE then
      BitBtn2Click(Sender);
  end;
  Screen.Cursor := crDefault;
  crH := GetCursor;
  vcrSizeWE := GetCursor; }
end;

procedure TfrmLocalizar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Consulta.getNomeTabela = 'CLIENTES' then
  begin
    if (Column.Field.Dataset.FieldbyName('CODIGO_FATURAMENTO').Asinteger =
      vDadosIni.vEmp.vCodigoBarrado)
      and (vDadosIni.vEmp.vCodigoBarrado <> 0) then
      if (gdFocused in State) then
        TDBGrid(sender).canvas.brush.color := clGray
      else
        TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
  if Consulta.getNomeTabela = 'PRODUTOS' then
  begin
    if (UpperCase(Column.Field.Dataset.FieldbyName('CONSUMO').AsString) = 'S') then
    begin
     if (gdFocused in State) then
     begin
       TDBGrid(sender).canvas.brush.color := clWindow;
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end
     else
     begin
       TDBGrid(sender).canvas.brush.color := TColor($00C6FFFF);
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end;
    end
    else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('FORA_LINHA').AsString)) = 'S') then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (vDadosIni.vProduto.GridConsultaRapidaLinhaSelecionada) and (THackDBGrid(Sender).DataLink.ActiveRecord = THackDBGrid(Sender).Row - 1) then
      with TDBGrid(sender).canvas do
      begin
        Font.Color := clWhite;
        if gdSelected in State then
          Brush.Color := clMenuHighlight
        else
          Brush.Color := clHighlight;
      end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

end;

procedure TfrmLocalizar.DBGrid1EditButtonClick(Sender: TObject);
var
  I: Integer;
  formMemo: TForm;
  memoDados: TMemo;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    if DBGrid1.Columns[I].FieldName = DBGrid1.SelectedField.FieldName then
    begin
      try
        formMemo := TForm.Create(Application);
        formMemo.Position := poScreenCenter;
        formMemo.Caption := DBGrid1.Columns[I].Title.Caption;
        formMemo.AutoSize := True;
        formMemo.AutoScroll := False;
        formMemo.KeyPreview := True;
        formMemo.BorderIcons:=[biSystemMenu];
        formMemo.Width := 600;
        formMemo.Height := 300;

        memoDados := TMemo.Create(formMemo);
        memoDados.Parent := formMemo;
        memoDados.AlignWithMargins := True;
        memoDados.Align := alClient;
        memoDados.Lines.Text := DBGrid1.SelectedField.AsString;
        memoDados.ReadOnly := True;

        formMemo.ShowModal;

      finally
        formMemo.Free;
        formMemo := nil;
      end;

    end;
end;

procedure TfrmLocalizar.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn2Click(Sender);
end;

procedure TfrmLocalizar.DBGrid1TitleClick(Column: TColumn);
var
  i,k: integer;
  vInverterOrdem: Boolean;
  vTemp, vNomeIdx: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if DBGrid1.DataSource = nil then
      exit;
    if TClientDataSet(DBGrid1.DataSource.DataSet) <> nil then
      TClientDataSet(DBGrid1.DataSource.DataSet).AfterClose := fDataseAfterClose;

    if (Column.Field<>nil) and (Column.Field.FieldKind = fkInternalCalc) then
      exit;
    if vCtrlClick then
    begin
      configuraVisual(Column.FieldName);
      vCtrlClick:=false;
      exit;
    end;
    try
      if vShiftClick then
      begin
        vInverterOrdem:=false;
        if (TClientDataSet(DBGrid1.DataSource.DataSet).IndexName = '') then//or (copy(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName, 1, 4) = 'IDX$') then
        begin
          vTemp := Column.Field.FieldName;
          vNomeIdx:='IDX$A'+vTemp;
          for I := 0 to DBGrid1.Columns.Count - 1 do
            DBGrid1.Columns[i].Title.Font.Style := [];
          TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
          TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( 'IDX$A'+vTemp, vTemp , []);
        end else if not(pos(Column.Field.FieldName,TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Items[0].FieldExpression)>0) then
        begin
          vNomeIdx := copy(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName,6,length(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName)-5);
          vTemp := TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Items[0].FieldExpression;
          vTemp := vTemp + ';' + Column.Field.FieldName;
          k:=0;
          for I := 1 to Length(vTemp) do
            if vTemp[i]=';' then
              inc(k);
          vNomeIdx:= vNomeIdx+inttostr(k);
          TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
          if pos('IDX$A',TClientDataSet(DBGrid1.DataSource.DataSet).IndexName)>0 then
          begin
             TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( 'IDX$A'+vNomeIdx, vTemp , []);
             vNomeIdx := 'IDX$A'+vNomeIdx;
          end
          else begin
            TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( 'IDX$D'+vNomeIdx, vTemp , [ixDescending]);
            vNomeIdx := 'IDX$D'+vNomeIdx
          end;
        end else begin
          vTemp := TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Items[0].FieldExpression;
          k:=0;
          for I := 1 to Length(vTemp) do
            if vTemp[i]=';' then
              inc(k);
          if TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Find(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName).Options = [ixDescending] then
          begin
            vNomeIdx := StringReplace(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName,'IDX$D','IDX$A',[]);
            vNomeIdx := vNomeIdx + inttostr(k);
            TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
            TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( vNomeIdx, vTemp , []);
          end
          else begin
            vNomeIdx := StringReplace(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName,'IDX$A','IDX$D',[]);
            vNomeIdx := vNomeIdx + inttostr(k);
            TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
            TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( vNomeIdx, vTemp , [ixDescending]);
          end;
    //      TClientDataSet(DBGrid1.DataSource.DataSet).IndexFieldNames:='';
          vInverterOrdem:=true;
        end;

        try
    //      Application.MessageBox(pchar(vNomeIdx+' '+TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Items[0].FieldExpression), 'Alerta', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
          TClientDataSet(DBGrid1.DataSource.DataSet).IndexName := vNomeIdx;
          Column.Title.Font.Style := [fsBold];
        except
        end;

      end
      else
      if (not naoOrdenar) and (TClientDataSet(DBGrid1.DataSource.DataSet).Active) then
      begin
        // Aqui todas as colunas voltam para fonte normal
        for I := 0 to DBGrid1.Columns.Count - 1 do
          DBGrid1.Columns[i].Title.Font.Style := [];
    
        TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
        if TClientDataSet(DBGrid1.DataSource.DataSet).Tag = 0 then // a Propriedade TAG do clientDataSet serve para definir a ordem ascendente quando 1 e descendent quando 2
        begin
          TClientDataSet(DBGrid1.DataSource.DataSet).Tag := 1;
          vTemp := 'IDX$A' + Column.Field.FieldName;
          TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add(vTemp, Column.Field.FieldName,[]);
        end
        else if TClientDataSet(DBGrid1.DataSource.DataSet).Tag = 1 then
        begin
          TClientDataSet(DBGrid1.DataSource.DataSet).Tag := 0;
          vTemp := 'IDX$D' + Column.Field.FieldName;
          TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add(vTemp, Column.Field.FieldName,[ixDescending]);
        end;    
        TClientDataSet(DBGrid1.DataSource.DataSet).IndexName := vTemp;
        Column.Title.Font.Style := [fsBold];
      end;
      //Aqui a coluna que foi clicada fica em negrito para destaque.  
  
      if DBGrid1.DataSource <> nil then
        if TClientDataSet(DBGrid1.DataSource.DataSet).active then
          TClientDataSet(DBGrid1.DataSource.DataSet).First;
    finally
      vShiftClick := false;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLocalizar.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if Column.Field.Dataset.FieldbyName('STATUS').AsString <> 'CANCELADO' then
  begin
  	if (gdFocused in State) then
    begin
      TDBGrid(sender).Canvas.Font.Color := clWhite;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QTDE').AsFloat > 0)
      and (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat >= Column.Field.Dataset.FieldbyName('QTDE').AsFloat) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00C1FFC1);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0095FFFF);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end;

    if ((Column.FieldName = 'VL_UNIT') or (Column.FieldName = 'VL_UNIT_CONV') or (Column.FieldName = 'TABPRATICADA')) then
    begin
      if (gdFocused in State) then
        TDBGrid(sender).Canvas.Font.Color := clBlack
      else if (TDBGrid(sender).DataSource.dataSet.FieldByName('tabpraticada').AsString = 'P') then
        TDBGrid(sender).Canvas.Brush.Color := clGreen
      else if (TDBGrid(sender).DataSource.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
        TDBGrid(sender).Canvas.Brush.Color := $00FFFFD2
      else if (TDBGrid(sender).DataSource.dataSet.FieldByName('tabpraticada').AsString = 'T') then
        TDBGrid(sender).Canvas.Brush.Color := clGradientActiveCaption
      else
      	TDBGrid(sender).Canvas.Brush.Color := clWhite;
        
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;
end;

procedure TfrmLocalizar.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) or (key = VK_RETURN) then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
    	BitBtn3.SetFocus;
end;

procedure TfrmLocalizar.DBGrid9DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (Consulta.vPromocaoProd.buscas.FieldByName('DESCR_TIPO').AsString = 'PROMOCAO') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := $009F9FFF;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end
  else if (Consulta.vPromocaoProd.buscas.FieldByName('DESCR_TIPO').AsString = 'QUANTIDADE') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := $00C1FFC1;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end
  else if (gdFocused in State) then
  begin
    TDBGrid(sender).canvas.brush.color := clWindow;
    TDBGrid(sender).canvas.Font.color := clWindowText;
  end
  else if (trim(Consulta.vPromocaoProd.buscas.FieldByName('DESCR_TIPO').AsString) <> '') then
  begin
    TDBGrid(sender).canvas.brush.color := $00FFFD9F;
      TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmLocalizar.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) then
    if (Consulta.TipoVndPerdida.dataSet.FieldByName('CODIGO_VP').IsNull) or
      (trim(DBLookupComboBox2.Text) = '') then
    begin
      Application.MessageBox(PChar('Tipo de Venda Perdida deve ser informado.'), 'Informação',
        MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
      	DBLookupComboBox2.SetFocus;
      abort;
    end;
end;

procedure TfrmLocalizar.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) then
    if (Consulta.Funcionario.dataSet.FieldByName('COD_VENDEDOR').IsNull) or
      (trim(DBLookupComboBox3.Text) = '') then
    begin
      Application.MessageBox(PChar('Vendedor deve ser informado.'), 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
      	DBLookupComboBox3.SetFocus;
      abort;
    end;
end;

procedure TfrmLocalizar.Edit1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn3) or (ActiveControl <> BitBtn5) then
    SpeedButton1Click(Sender);
end;

procedure TfrmLocalizar.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(Sender);
end;

procedure TfrmLocalizar.fDataseAfterClose(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).IndexName := '';
end;

procedure TfrmLocalizar.FormActivate(Sender: TObject);
begin
  inherited;
  Height := 111;
  vShow := 111;
  if Consulta is TConsultaProdutoP then
    top := 100;
end;

procedure TfrmLocalizar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  salvarGridNoConfigColunas(DBGrid1);
  if Consulta.getNomeTabela = 'PRODUTOS' then
  begin
    salvarGridNoConfigColunas(DBGrid2);
    salvarGridNoConfigColunas(DBGrid8);
    salvarGridNoConfigColunas(DBGridCodigoProd);
  end;
  Action := cafree;
  frmLocalizar := nil;
end;

procedure TfrmLocalizar.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	Self.fechar := True; 
  inherited;
end;

procedure TfrmLocalizar.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := false;
  TabSheet8.TabVisible := false;
  TabSheet9.TabVisible := false;
  TabSheet10.TabVisible := false;
  TabSheet11.TabVisible := false;
  tsProdutosKit.TabVisible := false;
  vCtrlClick := False; vShiftClick := False;
  SetLength(fieldsEditButton, 0);

  vHabObservacaoCl := False;
  vHabObservacaoSpcCl := False;
  vHabObservacaoReqOsCl := False;

  vHabObservacaoProd := False;
  vHabCaracteristicaProd := False;
  vHabCodigoProd := False;
end;

procedure TfrmLocalizar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, k: integer;
begin
  inherited;
  vCtrlClick := Key = VK_CONTROL;
  vShiftClick := Key = VK_SHIFT;
  if PageControl1.ActivePage = TabSheet1 then
  begin
  	if (Key = VK_F2) then
    	ckConsumo.Checked := not ckConsumo.Checked
    else if Key = VK_F3 then
    begin
      if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
        MaskEdit3.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
        MaskEdit6.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
        MaskEdit1.SetFocus;
    end
    else if ((Key = VK_F10) and (BitBtn21.visible)) then
      BitBtn21Click(Sender)
    else if (Key = VK_F12) and (ckMenuLateral.Visible) and (ckMenuLateral.Enabled) then
    	ckMenuLateral.Checked := not ckMenuLateral.Checked
    else if key = VK_F7 then
    begin
      if Consulta.getNomeTabela = 'PRODUTOS' then
      begin
        MaskEdit3.Visible := true;
        MaskEdit1.Visible := false;
        MaskEdit2.Visible := false;

        if ComboBox1.Text = 'Todos' then
        begin
          configuraVisual('NUM_FAB_PROD');
          Exit;
        end;

        for i := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
        begin
          if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'COD_PROD')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'DESCR_PROD')
              then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'COD_PROD' then
                begin
                  ComboBox1.Text :=
                    TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
                    ComboBox1.SetFocus;
                  naoOrdenar := true;
                  configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName);
                  naoOrdenar := false;
                  MaskEdit3.Visible := false;
                  MaskEdit1.Visible := false;
                  MaskEdit2.Visible := false;
                  Label4.Visible := false;
                  Label2.Visible := false;
                  MaskEdit6.Visible := true;
                  MaskEdit7.Visible := true;
                  MaskEdit8.Visible := true;
                  Label17.Visible := true;
                  Label18.Visible := true;
                  Label19.Visible := true;
                  if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
                  	MaskEdit6.SetFocus;
                  exit;
                end;
            end
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'DESCR_PROD')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NUM_FAB_PROD')
              then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'DESCR_PROD'
                  then
                begin
                  ComboBox1.Text :=
                    TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
                    ComboBox1.SetFocus;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if MaskEdit1.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    	MaskEdit1.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
                    MaskEdit6.SetFocus;
                  naoOrdenar := true;
                  configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName);
                  naoOrdenar := false;
                  exit;
                end;
            end
            else if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NUM_FAB_PROD'
              then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'NUM_FAB_PROD'
                  then
                begin
                  ComboBox1.Text :=
                    TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
                    ComboBox1.SetFocus;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if MaskEdit1.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    	MaskEdit1.SetFocus
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
                    MaskEdit6.SetFocus;
                  naoOrdenar := true;
                  configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName);
                  naoOrdenar := false;
                  exit;
                end;
            end;
          end
        end;
      end
      else if Consulta.getNomeTabela = 'CLIENTES' then
      begin
        MaskEdit3.Visible := true;
        MaskEdit1.Visible := false;
        MaskEdit2.Visible := false;

        if ComboBox1.Text = 'Todos' then
        begin
          configuraVisual('NOME_CLIENTE');
          Exit;
        end;

        for i := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
        begin
          if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'COD_CLIENTE')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NOME_CLIENTE')
              then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'COD_CLIENTE'
                  then
                begin
                  ComboBox1.Text :=
                    TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  ComboBox1Enter(sender);
                  naoOrdenar := true;
                  configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName);
                  naoOrdenar := false;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <>
              'NOME_CLIENTE')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'CPFCGC') then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'NOME_CLIENTE'
                  then
                begin
                  ComboBox1.Text :=
                    TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  ComboBox1Enter(sender);
                  naoOrdenar := true;
                  configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName);
                  naoOrdenar := false;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end
            else if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'CPFCGC' then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'CPFCGC' then
                begin
                  ComboBox1.Text :=
                    TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  ComboBox1Enter(sender);
                  naoOrdenar := true;
                  configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName);
                  naoOrdenar := false;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end;
          end
        end;
      end;
    end;
  end;
end;

procedure TfrmLocalizar.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_CONTROL then
    vCtrlClick := False;
  if Key = VK_SHIFT then
    vShiftClick := False;
end;

procedure TfrmLocalizar.FormResize(Sender: TObject);
begin
  inherited;
  if Height <= 111 then
    vShow := 111
  else
    vShow := 400;

  if (pnOpcaoDireitaProdutos.Visible) then
  begin
  	if (Consulta.getNomeTabela = 'CLIENTES') then
    begin
    	if (vDadosIni.IfThen(pnObservacaoCl.Visible, pnObservacaoCl.Height, 0) +
      		vDadosIni.IfThen(SplitterObservacaoBottomCl.Visible, SplitterObservacaoBottomCl.Height, 0) +
          vDadosIni.IfThen(pnObservacaoSpcCl.Visible, pnObservacaoSpcCl.Height, 0) +
          vDadosIni.IfThen(SplitterObservacaoSpcBottomCl.Visible, SplitterObservacaoSpcBottomCl.Height, 0) +
          vDadosIni.IfThen(pnObservacaoReqOsCl.Visible, pnObservacaoReqOsCl.Height, 0) > pnOpcaoDireitaClientes.Height) then
      begin
        AjustarBarraLateral(False);

        Splitter2.Align := alLeft;
        Splitter2.Align := alRight;
      end;
    end
    else if (Consulta.getNomeTabela = 'PRODUTOS') then
   	begin
    	if (vDadosIni.IfThen(pnObservacaoProd.Visible, pnObservacaoProd.Height, 0) +
          vDadosIni.IfThen(SplitterObservacaoBottomProd.Visible, SplitterObservacaoBottomProd.Height, 0) +
          vDadosIni.IfThen(pnCaracteristicaProd.Visible, pnCaracteristicaProd.Height, 0) > pnOpcaoDireitaProdutos.Height) then
      begin
        AjustarBarraLateral(False);

        Splitter2.Align := alLeft;
        Splitter2.Align := alRight;
      end;
    end;
  end;
end;

procedure TfrmLocalizar.FormShow(Sender: TObject);
var
  I: Integer;
begin
	inherited;
  BitBtn22.Visible := (vDadosIni.vProgFid.vHabilitarProgFid) and (Consulta.getNomeTabela = 'CLIENTES');
  ckConsumo.Visible := Consulta.getNomeTabela = 'PRODUTOS';
  ckMenuLateral.Visible := (Consulta.getNomeTabela = 'CLIENTES') or (Consulta.getNomeTabela = 'PRODUTOS');
  bt_outros_prod.Visible := (Consulta.getNomeTabela = 'CLIENTES') or (Consulta.getNomeTabela = 'PRODUTOS');
  Panel4.Visible := Consulta.getNomeTabela = 'PRODUTOS';
  Panel5.Visible := Consulta.getNomeTabela = 'PRODUTOS';
  Panel20.Visible := Consulta.getNomeTabela = 'PRODUTOS';
  Panel17.Visible := Consulta.getNomeTabela = 'PRODUTOS';
  BitBtn14.Visible := Consulta.getNomeTabela = 'KITS_PROD';

  MenuLateralExibirObservacaoCl.Visible := Consulta.getNomeTabela = 'CLIENTES';
  MenuLateralExibirObservacaoSpcCl.Visible := Consulta.getNomeTabela = 'CLIENTES';
  MenuLateralExibirObservacaoReqOSCl.Visible := Consulta.getNomeTabela = 'CLIENTES';

  MenuLateralExibirObservacaoProd.Visible := Consulta.getNomeTabela = 'PRODUTOS';
  MenuLateralExibirDetalhesCaractersticasProd.Visible := Consulta.getNomeTabela = 'PRODUTOS';
  MenuLateralExibirCodigosProd.Visible := Consulta.getNomeTabela = 'PRODUTOS';

  if Consulta.getNomeTabela = 'CLIENTES' then
  begin
    DBMemoObsCl.DataSource := DataSource1;
    DBMemoObsSpcCli.DataSource := DataSource1;
    DBMemoObsReqOSCli.DataSource := DataSource1;
  end
  else if Consulta.getNomeTabela = 'PRODUTOS' then
  begin
    DBMemoObsProd.DataSource := DataSource1;
    DBMemoDetCaracProd.DataSource := DataSource1;
    DBGridCodigoProd.DataSource := DataSource3;
  end;

  InibirEstatisticas := True;
  vCamposPadraoRegistro := (vDadosIni.GetIni('Sistema', 'CamposPadraoPesquisaNoRegistro', 'N') = 'S');
  TabSheet1.Show;
  vShow := 400;
  naoOrdenar := true;
  if Consulta is TConsultaProdutoP then
    Height := 600
  else
  	Height := 400;
  naoOrdenar := false;

  ComboBox1.Clear;
  ComboBox2.Clear;
  BitBtn21.Visible       := false;
  Panel24.Visible        := false;
  Panel26.Visible        := false;
  LabelEstR.Visible      := vDadosIni.vEmp.vAlmox = 'S2';
  PanelEstR.Visible      := vDadosIni.vEmp.vAlmox = 'S2';
  LabelEstPrima.Visible  := false;
  btMateriaPrima.Visible := false;

  if vDadosIni.vEmp.vAlmox = 'S2' then
  begin
    PanelEstF.Left      := 234;
    PanelEstR.Left      := 348;

    PanelEstF.Width     := 111;
    PanelEstR.Width     := 111;
  end
  else
  begin
    PanelEstF.Width := 222;
  end;
  BitBtn22.Visible := (vDadosIni.vProgFid.vHabilitarProgFid) and (Consulta.getNomeTabela = 'CLIENTES');
  if Consulta.getNomeTabela = 'CLIENTES' then
  begin
  	pnOpcaoDireitaClientes.Width := _LerConfiguracoesRegistroInteger(pnOpcaoDireitaClientes.Name, vDadosIni.IfThen(pnOpcaoDireitaClientes.Width < 150, 150, pnOpcaoDireitaClientes.Width));

  	MenuLateralExibirObservacaoCl.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirObservacaoCl.Name);
  	MenuLateralExibirObservacaoSpcCl.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirObservacaoSpcCl.Name);
    MenuLateralExibirObservacaoReqOSCl.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirObservacaoReqOSCl.Name);
    ckMenuLateral.Checked := _LerConfiguracoesRegistroBoolean(ckMenuLateral.Name + 'Cl', True);

    pnObservacaoCl.Height := _LerConfiguracoesRegistroInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 25, 25, pnObservacaoCl.Height));
  	pnObservacaoSpcCl.Height := _LerConfiguracoesRegistroInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 25, 25, pnObservacaoSpcCl.Height));
    pnObservacaoReqOsCl.Height := _LerConfiguracoesRegistroInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 25, 25, pnObservacaoReqOsCl.Height));
  end
  else if Consulta.getNomeTabela = 'PRODUTOS' then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    ckConsumo.Visible := vDadosIni.PesqPros('PRO283', 'CONSULTAR', '', 'PRODUTOS', '', Consulta.buscas);
    if not ckConsumo.Visible then
      ckConsumo.Checked := False
    else
    begin
      if trim(_LerConfiguracoesRegistroString('ckConsumoTeste')) = '' then
      begin
        _GravaConfiguracoesString('ckConsumoTeste', '1');
        ckConsumo.Checked := True;
        _GravaConfiguracoesBoolean('ckConsumo', ckConsumo.Checked);
      end
      else
        ckConsumo.Checked := _LerConfiguracoesRegistroBoolean(ckConsumo.Name);
    end;

    pnOpcaoDireitaProdutos.Width := _LerConfiguracoesRegistroInteger(pnOpcaoDireitaProdutos.Name, vDadosIni.IfThen(pnOpcaoDireitaProdutos.Width < 150, 150, pnOpcaoDireitaClientes.Width));

    MenuLateralExibirObservacaoProd.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirObservacaoProd.Name);
  	MenuLateralExibirDetalhesCaractersticasProd.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirDetalhesCaractersticasProd.Name);
    MenuLateralExibirCodigosProd.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirCodigosProd.Name);
    ckMenuLateral.Checked := _LerConfiguracoesRegistroBoolean(ckMenuLateral.Name + 'Prod', True);

    pnObservacaoProd.Height := _LerConfiguracoesRegistroInteger(pnObservacaoProd.Name, vDadosIni.IfThen(pnObservacaoProd.Height < 25, 25, pnObservacaoProd.Height));
  	pnCaracteristicaProd.Height := _LerConfiguracoesRegistroInteger(pnCaracteristicaProd.Name, vDadosIni.IfThen(pnCaracteristicaProd.Height < 25, 25, pnCaracteristicaProd.Height));
  	pnCodigoProd.Height := _LerConfiguracoesRegistroInteger(pnCodigoProd.Name, vDadosIni.IfThen(pnCodigoProd.Height < 25, 25, pnCodigoProd.Height));
  end;

  if DBGrid1.DataSource <> nil then
  begin
    ComboBox1.Items.Add('Todos');
    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    begin
      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible then
      begin
        ComboBox1.Items.Add(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName);
        ComboBox2.Items.Add(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName);
        if Consulta.getNomeTabela = 'PRODUTOS' then
        begin
          DBGrid8.DataSource := dtmConsultas.dsGradeProd;
          Panel24.Visible := true;
          Panel26.Visible := true;
          if (trim(vDadosIni.vEmp.vCampoPadraoProd) = '') then
          begin
            ComboBox1.Text := 'Todos';
          	vCampoPadrao := '';
          end
          else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vDadosIni.vEmp.vCampoPadraoProd) then
          begin
            ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
            vCampoPadrao := vDadosIni.vEmp.vCampoPadraoProd;
          end;
        end
        else if Consulta.getNomeTabela = 'CLIENTES' then
        begin
          if (trim(vDadosIni.vEmp.vCampoPadraoCli) = '') then
          begin
            ComboBox1.Text := 'Todos';
          	vCampoPadrao := '';
          end
          else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vDadosIni.vEmp.vCampoPadraoCli) then
          begin
            ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
            vCampoPadrao := vDadosIni.vEmp.vCampoPadraoCli;
          end;
        end
        else if Consulta.getNomeTabela = 'VEICULOS' then
        begin
          if (trim(vDadosIni.vEmp.vCampoPadraoVei) = '') then
          begin
            ComboBox1.Text := 'Todos';
          	vCampoPadrao := '';
          end
          else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vDadosIni.vEmp.vCampoPadraoVei) then
          begin
            ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
            vCampoPadrao := vDadosIni.vEmp.vCampoPadraoVei;
          end;
        end
          {else if Consulta.getNomeTabela = 'BAIRROS' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'NOME_BAIRRO') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'CIDADES' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'NOME_CIDADE') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'ESTADOS' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'NOME_UF') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'FORNECEDOR' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'NOME') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'GRUPOS' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'DESCRICAO') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'SUB_GRUPO' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'DESCRICAO') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'TRANSPORTADOR' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'NOME_TR') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'NBM' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'NOME_NBM') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'EQUIPAMENTO' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'NOM_EQUIP') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'COLABORADOR' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'NOME_VENDEDOR') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'VENDA_PERDIDA' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'COD_PROD') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'TIPOVP' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'DESCRICAO_VP') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'TIPO_FATURAMENTO' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'DESC_FAT') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'MARCA_PROD' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'DESCRICAO_MARCA') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'G_DSGS' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'COD_DSGS') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'KITS_PROD' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'DESCRICAO_KIT') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end
          else if Consulta.getNomeTabela = 'TIPO_SERVICO' then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = 'DESC_SERVICO') then
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
          end}
        else
        begin
          ComboBox1.Text := 'Todos';
          vCampoPadrao := '';
        end;
      end;
    end;
  end;
  ComboBox1.Sorted := True;
//  ComboBox2.Items := ComboBox1.Items;
  ComboBox2.Text := ComboBox2.Items[0];
  if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
  	ComboBox1.SetFocus;
  if DBGrid1.DataSource <> nil then
  begin
    leConfiguracoesRegistro;
    if (vCampoPadrao <> '') and (not vCamposPadraoRegistro) then
    begin
      for I := 0 to DBGrid1.Columns.Count - 1 do
        //  TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
      begin
        if DBGrid1.Columns[i].FieldName = vCampoPadrao then
          //if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao then
        begin
          DBGrid1TitleClick(DBGrid1.Columns[i]);
          Break;
        end;
      end;
    end
    else
    begin
      i := ComboBox1.Items.IndexOf(ComboBox1.Text);
      if i > -1 then
      begin
        ComboBox1.ItemIndex := i;
        ComboBox1Exit(ComboBox1);
      end
      else
        DBGrid1TitleClick(DBGrid1.Columns[0]);
      {Exit;

      if (UpperCase(ComboBox1.Text) <> 'TODOS') then
      begin
        for I := 0 to ComboBox1.Items.Count - 1 do
          if ComboBox1.Items[i] = ComboBox1.Text then
          begin
            ComboBox1.ItemIndex := i;
            Break;
          end;
        ComboBox1Exit(ComboBox1);
      end
      else
        DBGrid1TitleClick(DBGrid1.Columns[0]);}
    end;
  end;
  if not Self.KeyPreview then
    Self.KeyPreview := true;
  if Consulta is TConsultaProdutoP then
  begin
    panel20.Visible := true;
    panel5.Visible := true;
    panel4.Visible := true;
    Consulta.PanelEstF := TPanel(PanelEstF);
    Consulta.PanelEstR := TPanel(PanelEstR);
    Consulta.PanelEstPrima := TPanel(PanelEstPrima);
    Consulta.BitBtnFoto := TBitBtn(BitBtn21);
    if (vDadosIni.vSistema = 'Fiscal') and (vDadosIni.bancoConectado = 'local') then
    begin
      BitBtn6.Enabled := False;
      BitBtn7.Enabled := False;
      BitBtn8.Enabled := False;
      BitBtn9.Enabled := False;
      BitBtn10.Enabled := False;
      BitBtn11.Enabled := False;
      BitBtn12.Enabled := False;
      BitBtn13.Enabled := False;
      BitBtn17.Enabled := False;
      BitBtn18.Enabled := False;

      BitBtn14.Enabled := False;
      BitBtn16.Enabled := False;
      BitBtn20.Enabled := False;
    end;
    if Assigned(TConsultaProdutoP(Consulta).PesquisaProd.dataSet) then
      dsPesquisa.DataSet := TConsultaProdutoP(Consulta).PesquisaProd.dataSet;
  end
  else if Consulta is TConsultaKits then
  begin
    panel17.Visible := true;
    Consulta.PanelValorKit := TPanel(Panel19);
  end
  else
		inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if Consulta.getNomeTabela = 'PRODUTOS' then
  begin
    setTClientDataSet(vDadosIni.dataSetCol, DBGrid2, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, '@');
    setTClientDataSet(vDadosIni.dataSetCol, DBGrid8, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, '@');
    setTClientDataSet(vDadosIni.dataSetCol, DBGridCodigoProd, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, '@');
  end;
  if MaskEdit3.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
    	MaskEdit3.SetFocus;
  end
  else if MaskEdit1.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
    	MaskEdit1.SetFocus
  end
  else if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
    MaskEdit6.SetFocus;
  if Consulta is TConsultaProdutoP then
    Height := 600
  else  Height := 400;
  BitBtn18.Visible := Consulta.HabilitarBotao;
  if Consulta is TConsultaPlanoContasContabil then
    MaskEdit3.CharCase := ecNormal;
  imgInformation.Hint := imgInformation.Hint +
  	'Processo "PES011" HABILITAR MENSAGEM DE PRODUTOS SIMILARES NO SHIFT F3' + #13 +
  	'Processo "PRO283" HABILITAR CONSULTA DE PRODUTOS PARA CONSUMO NA CONSULTA RAPIDA';
end;

function TfrmLocalizar.getDataSetNameByGrid(DBGridName,
  DataSetNameDefault: string): string;
var
  I: Integer;
begin
  Result := DataSetNameDefault;
  if ListGridsAndDataSets = nil then
    Exit;
  for I := 0 to ListGridsAndDataSets.Count - 1 do
    if vDadosIni.getValue(ListGridsAndDataSets[I], 1) = DBGridName then
    begin
      Result := vDadosIni.getValue(ListGridsAndDataSets[I], 2);
      Break;
    end;
end;

procedure TfrmLocalizar.gravaConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Consulta.ClassName, True);
      // Grava as informações do form
      Registro.WriteString('Campo', ComboBox1.Text);
      Registro.WriteString('Condicao', ComboBox3.Text);
      Registro.WriteString('DataIni', MaskEdit1.Text);
      Registro.WriteString('DataFim', MaskEdit2.Text);
      Registro.WriteString('PalavraChave', MaskEdit3.Text);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmLocalizar.gridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  salvarGridNoConfigColunas(TDBGrid(Sender));
end;

procedure TfrmLocalizar.leConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Consulta.ClassName, True);
      // Grava as informações do form
      vTemp := Registro.ReadString('Campo');
      if ((vCampoPadrao = '') or (vCamposPadraoRegistro)) and (vTemp <> '') then
        ComboBox1.Text := vTemp;
      vTemp := Registro.ReadString('Condicao');
      if vTemp <> '' then
        ComboBox3.Text := vTemp;
      vTemp := Registro.ReadString('DataIni');
      if vTemp <> '' then
        MaskEdit1.Text := vTemp;
      vTemp := Registro.ReadString('DataFim');
      if vTemp <> '' then
        MaskEdit2.Text := vTemp;
      vTemp := Registro.ReadString('PalavraChave');
      if vTemp <> '' then
        MaskEdit3.Text := vTemp;
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmLocalizar.ListCheckClickCheck(Sender: TObject);
var
  DisplayLabel: string;
  ListCheck: TCheckListBox;
  I: Integer;
  J: Integer;
  Columns: TColumn;
begin
  if GridCfg = nil then
    Exit;
  if cdsGrid = nil then
    Exit;

  ListCheck := TCheckListBox(Sender);
  if ListCheck.ItemIndex <= -1 then
    Exit;

  DisplayLabel := ListCheck.Items[ListCheck.ItemIndex];
  for I := 0 to cdsGrid.Fields.Count - 1 do
    if cdsGrid.Fields[I].DisplayLabel = DisplayLabel then
    begin
      cdsGrid.Fields[I].Visible := ListCheck.Checked[ListCheck.ItemIndex];
      for J := 0 to GridCfg.Columns.Count - 1 do
        if GridCfg.Columns[J].FieldName = cdsGrid.Fields[I].FieldName then
        begin
          Columns := GridCfg.Columns[J];
          Columns.Visible := ListCheck.Checked[ListCheck.ItemIndex];
          Columns.Index := GridCfg.Columns.Count - 1;
          Break;
        end;
      Break;
    end;
end;

procedure TfrmLocalizar.MaskEdit1Exit(Sender: TObject);
var
  vDataI: string;
begin
  if (ActiveControl <> BitBtn4) then
  begin
    vDataI := StringReplace(MaskEdit1.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    try
      if ((vDataI <> '      ') and (vDataI <> '        ')) then
        StrToDate(MaskEdit1.Text);
    except
      Application.MessageBox(Pchar('Data informada errada.' + chr(13) + 'Preencha no formato ' +
        StringReplace(ShortDateFormat, 'y', 'a', [rfReplaceAll, rfIgnoreCase])), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
      	MaskEdit1.SetFocus;
    end;
  end;
end;

procedure TfrmLocalizar.MaskEdit2Exit(Sender: TObject);
var
  vDataF: string;
begin
  if (ActiveControl <> BitBtn4) then
  begin
    vDataF := StringReplace(MaskEdit2.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    try
      if ((vDataF <> '      ') and (vDataF <> '        ')) then
        StrToDate(MaskEdit2.Text);
    except
      Application.MessageBox(Pchar('Data informada errada.' + chr(13) + 'Preencha no formato ' +
        StringReplace(ShortDateFormat, 'y', 'a', [rfReplaceAll, rfIgnoreCase])), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (MaskEdit2.CanFocus) then
      	MaskEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmLocalizar.MaskEdit3Enter(Sender: TObject);
begin
  inherited;
  if vShow = 400 then
    Height := 111;
end;

procedure TfrmLocalizar.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, k: integer;
begin
  if Key = VK_UP then
  begin
    if ComboBox1.ItemIndex > 0 then
    begin
      ComboBox1.ItemIndex := ComboBox1.ItemIndex - 1;
      ComboBox1Exit(Sender);
    end;
  end
  else if Key = VK_DOWN then
  begin
    if ComboBox1.ItemIndex < (ComboBox1.Items.Count - 1) then
    begin
      ComboBox1.ItemIndex := ComboBox1.ItemIndex + 1;
      ComboBox1Exit(Sender);
    end;
  end
    (*else if key = VK_F7 then
    begin
      if Consulta.getNomeTabela = 'PRODUTOS' then
      begin
        for i := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
        begin
          if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'COD_PROD')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'DESCR_PROD') then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'COD_PROD' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  ComboBox1Enter(sender);
                  if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                  	MaskEdit3.SetFocus;
                  //if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
                  	//ComboBox1.SetFocus;
                  exit;
                end;
            end
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'DESCR_PROD')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NUM_FAB_PROD') then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'DESCR_PROD' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  ComboBox1Enter(sender);
                  if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                  	MaskEdit3.SetFocus;
                  // if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
                  //ComboBox1.SetFocus;
                  exit;
                end;
            end
            else if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NUM_FAB_PROD' then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'NUM_FAB_PROD' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  ComboBox1Enter(sender);

                  //if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
                  //ComboBox1.SetFocus;
                  if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                  	MaskEdit3.SetFocus;
                  exit;
                end;
            end;
          end
        end;
      end;
    end*);
end;

procedure TfrmLocalizar.MenuLateralExibirCodigosProdClick(
  Sender: TObject);
begin
  try
    MenuLateralExibirCodigosProd.Checked := not MenuLateralExibirCodigosProd.Checked;

    if (not MenuLateralExibirObservacaoProd.Checked)
    	and (not MenuLateralExibirDetalhesCaractersticasProd.Checked)
      and (not MenuLateralExibirCodigosProd.Checked) then
        MenuLateralExibirObservacaoProd.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
  	_GravaConfiguracoesBoolean(MenuLateralExibirCodigosProd.Name, MenuLateralExibirCodigosProd.Checked);
    _GravaConfiguracoesInteger(pnObservacaoProd.Name, vDadosIni.IfThen(pnObservacaoProd.Height < 25, 25, pnObservacaoProd.Height));
    _GravaConfiguracoesInteger(pnCaracteristicaProd.Name, vDadosIni.IfThen(pnCaracteristicaProd.Height < 25, 25, pnCaracteristicaProd.Height));
    _GravaConfiguracoesInteger(pnCodigoProd.Name, vDadosIni.IfThen(pnCodigoProd.Height < 25, 25, pnCodigoProd.Height));
  end;
end;

procedure TfrmLocalizar.MenuLateralExibirDetalhesCaractersticasProdClick(
  Sender: TObject);
begin
  try
    MenuLateralExibirDetalhesCaractersticasProd.Checked := not MenuLateralExibirDetalhesCaractersticasProd.Checked;

    if (not MenuLateralExibirObservacaoProd.Checked)
    	and (not MenuLateralExibirDetalhesCaractersticasProd.Checked)
      and (not MenuLateralExibirCodigosProd.Checked) then
        MenuLateralExibirObservacaoProd.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
  	_GravaConfiguracoesBoolean(MenuLateralExibirDetalhesCaractersticasProd.Name, MenuLateralExibirDetalhesCaractersticasProd.Checked);
  	_GravaConfiguracoesInteger(pnObservacaoProd.Name, vDadosIni.IfThen(pnObservacaoProd.Height < 25, 25, pnObservacaoProd.Height));
    _GravaConfiguracoesInteger(pnCaracteristicaProd.Name, vDadosIni.IfThen(pnCaracteristicaProd.Height < 25, 25, pnCaracteristicaProd.Height));
    _GravaConfiguracoesInteger(pnCodigoProd.Name, vDadosIni.IfThen(pnCodigoProd.Height < 25, 25, pnCodigoProd.Height));
  end;
end;

procedure TfrmLocalizar.MenuLateralExibirObservacaoClClick(Sender: TObject);
begin
  try
    MenuLateralExibirObservacaoCl.Checked := not MenuLateralExibirObservacaoCl.Checked;

    if (not MenuLateralExibirObservacaoCl.Checked)
    	and (not MenuLateralExibirObservacaoSpcCl.Checked)
      and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
        MenuLateralExibirObservacaoCl.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
    _GravaConfiguracoesBoolean(MenuLateralExibirObservacaoCl.Name, MenuLateralExibirObservacaoCl.Checked);
    _GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 25, 25, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 25, 25, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 25, 25, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TfrmLocalizar.MenuLateralExibirObservacaoProdClick(Sender: TObject);
begin
  try
    MenuLateralExibirObservacaoProd.Checked := not MenuLateralExibirObservacaoProd.Checked;

    if (not MenuLateralExibirObservacaoProd.Checked)
    	and (not MenuLateralExibirDetalhesCaractersticasProd.Checked)
      and (not MenuLateralExibirCodigosProd.Checked) then
        MenuLateralExibirObservacaoProd.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
  	_GravaConfiguracoesBoolean(MenuLateralExibirObservacaoProd.Name, MenuLateralExibirObservacaoProd.Checked);
		_GravaConfiguracoesInteger(pnObservacaoProd.Name, vDadosIni.IfThen(pnObservacaoProd.Height < 25, 25, pnObservacaoProd.Height));
    _GravaConfiguracoesInteger(pnCaracteristicaProd.Name, vDadosIni.IfThen(pnCaracteristicaProd.Height < 25, 25, pnCaracteristicaProd.Height));
    _GravaConfiguracoesInteger(pnCodigoProd.Name, vDadosIni.IfThen(pnCodigoProd.Height < 25, 25, pnCodigoProd.Height));
  end;
end;

procedure TfrmLocalizar.MenuLateralExibirObservacaoReqOSClClick(
  Sender: TObject);
begin
  try
    MenuLateralExibirObservacaoReqOSCl.Checked := not MenuLateralExibirObservacaoReqOSCl.Checked;

    if (not MenuLateralExibirObservacaoCl.Checked)
    	and (not MenuLateralExibirObservacaoSpcCl.Checked)
      and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
        MenuLateralExibirObservacaoCl.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
    _GravaConfiguracoesBoolean(MenuLateralExibirObservacaoReqOSCl.Name, MenuLateralExibirObservacaoReqOSCl.Checked);
    _GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 25, 25, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 25, 25, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 25, 25, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TfrmLocalizar.MenuLateralExibirObservacaoSpcClClick(Sender: TObject);
begin
  try
    MenuLateralExibirObservacaoSpcCl.Checked := not MenuLateralExibirObservacaoSpcCl.Checked;

    if (not MenuLateralExibirObservacaoCl.Checked)
    	and (not MenuLateralExibirObservacaoSpcCl.Checked)
      and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
        MenuLateralExibirObservacaoCl.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
  	_GravaConfiguracoesBoolean(MenuLateralExibirObservacaoSpcCl.Name, MenuLateralExibirObservacaoSpcCl.Checked);
    _GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 25, 25, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 25, 25, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 25, 25, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TfrmLocalizar.PopMnSelAllClick(Sender: TObject);
var
  I: Integer;
  ListCk: TCheckListBox;
begin
  try
    ListCk := TCheckListBox(TMenuItem(Sender).Owner);
    for I := 0 to ListCk.Items.Count - 1 do
      if ListCk.ItemEnabled[I] then
      begin
        ListCk.ItemIndex := I;
        ListCk.Checked[i] := True;
        ListCheckClickCheck(ListCk);
      end;
  except
  end;
end;

procedure TfrmLocalizar.PopMnUnSelAllClick(Sender: TObject);
var
  I: Integer;
  ListCk: TCheckListBox;
begin
  try
    ListCk := TCheckListBox( TMenuItem(Sender).Owner);
    for I := 0 to ListCk.Items.Count - 1 do
      if ListCk.ItemEnabled[I] then
      begin
        ListCk.ItemIndex := I;
        ListCk.Checked[i] := False;
        ListCheckClickCheck(ListCk);
      end;
  except
  end;
end;

procedure TfrmLocalizar.salvarGridNoConfigColunas(PGridCfg: TDBGrid);
var
  I, K: Integer;
  Largura, Ordem: Integer;
  ListOrder: TStrings;

  procedure obterDadosExibicaoFieldGrid(FieldName: string);
  var
    J: Integer;
  begin
    for J := 0 to GridCfg.Columns.Count - 1 do
      if GridCfg.Columns[J].FieldName = FieldName then
      begin
        Largura := GridCfg.Columns[J].Width;
//        Ordem := GridCfg.Columns[J].Index;
        Break;
      end;
  end;

begin
  if PGridCfg = nil then
    Exit;
  GridCfg := TDBGrid(PGridCfg);
  if not Assigned(GridCfg.DataSource) then
    Exit;
  if not Assigned(GridCfg.DataSource.DataSet) then
    Exit;
  if cdsColunas = nil then
    Exit;  
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);

  ListOrder := TStringList.Create;
  ListOrder.Clear;
  for I := 0 to cdsGrid.Fields.Count - 1 do
    ListOrder.Add(cdsGrid.Fields[i].FieldName);
  for K := GridCfg.Columns.Count - 1 downto 0 do
    if GridCfg.Columns[K].Visible then    
    begin
      I := ListOrder.IndexOf(GridCfg.Columns[K].FieldName);
      if I > -1 then
      begin
        ListOrder.Delete(I);
        ListOrder.Insert(0, GridCfg.Columns[K].FieldName);
      end;
    end;
  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas where usuario = ' +
    QuotedStr(usuario)+' and componente = '+QuotedStr(getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name));
  cdsColunas.Open;
  for I := 0 to cdsGrid.Fields.Count - 1 do
  begin
//    Ordem := -1;
    Ordem := ListOrder.IndexOf(cdsGrid.Fields[I].FieldName);
    Largura := 0;
    if cdsGrid.Fields[I].Visible then
      obterDadosExibicaoFieldGrid(cdsGrid.Fields[I].FieldName);
    if cdsColunas.Locate('campos', cdsGrid.Name + cdsGrid.Fields[I].FieldName, []) then
    begin
      cdsColunas.Edit;
      if cdsGrid.Fields[I].Visible then
      begin
        cdsColunas.FieldByName('visivel').AsInteger := 1;
        cdsColunas.FieldByName('ordem').AsInteger   := Ordem;
      end
      else
        cdsColunas.FieldByName('visivel').AsInteger := 0;
      if Largura > 0 then
        cdsColunas.FieldByName('largura_exibicao').AsInteger :=  Largura;
      cdsColunas.Post;
    end
    else
    begin
      cdsColunas.Insert;
      if cdsGrid.Fields[I].Visible then
        cdsColunas.FieldByName('visivel').AsInteger := 1
      else
        cdsColunas.FieldByName('visivel').AsInteger := 0;
      cdsColunas.FieldByName('usuario').AsString           := usuario;
      cdsColunas.FieldByName('componente').AsString        := getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name);
      cdsColunas.FieldByName('campos').AsString            := cdsGrid.Name + cdsGrid.Fields[I].FieldName;
      cdsColunas.FieldByName('ordem').AsInteger            := Ordem;
      if Largura > 0 then
        cdsColunas.FieldByName('largura_exibicao').AsInteger :=  Largura;
      cdsColunas.Post;
    end;
  end;

  if cdsColunas.ChangeCount > 0 then
  begin
    cdsColunas.ApplyUpdates(-1);
    trans.Commit;
    trans.StartTransaction;
  end;
end;

procedure TfrmLocalizar.ScrollBox2Exit(Sender: TObject);
begin
  inherited;
  if (cdsColunas = nil) or (not cdsColunas.Active) then
    exit;
  GroupBox2.Visible := false;
end;

procedure TfrmLocalizar.SetConsulta(const Value: TConsulta);
begin
  FConsulta := Value;
  DBGrid1.DataSource.DataSet := Value.dataSet;
end;

procedure TfrmLocalizar.setDataSetNameByGrid(DBGridName, DataSetName: string);
var
  Adicionar: Boolean;
  I: Integer;
begin
  if ListGridsAndDataSets = nil then
    ListGridsAndDataSets := TStringList.Create;
  Adicionar := True;
  for I := 0 to ListGridsAndDataSets.Count - 1 do
    if vDadosIni.getValue(ListGridsAndDataSets[I], 1) = DBGridName then
    begin
      ListGridsAndDataSets[I] := '|' + DBGridName + '|' + DataSetName + '|';
      Adicionar := False;
      Break;
    end;
  if Adicionar then
    ListGridsAndDataSets.Add('|' + DBGridName + '|' + DataSetName + '|');
end;

procedure TfrmLocalizar.setTClientDataSet(dtSet: TClientDataSet;
  PGridCfg: TDBGrid; nomeUsuario: string; transacao: TIBTransaction;
  pAlterarNomeDtSet: string);
var
  I: Integer;
begin
  cdsColunas := TClientDataSet(dtSet);
  GridCfg := PGridCfg;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);
  usuario := nomeUsuario;
  setDataSetNameByGrid(GridCfg.Name, cdsGrid.Name + pAlterarNomeDtSet);
  if not Assigned(GridCfg.OnColumnMoved) then
    GridCfg.OnColumnMoved := gridColumnMoved;
  GridCfg.Columns.Clear;
  GridCfg.Columns.RebuildColumns;

  for I := 0 to cdsGrid.Fields.Count - 1 do
    if cdsGrid.Fields[i].Tag = 0 then
      cdsGrid.Fields[i].Visible := True
    else if cdsGrid.Fields[i].Tag = 1 then
      cdsGrid.Fields[i].Visible := False
    else if cdsGrid.Fields[i].Tag = 2 then
      cdsGrid.Fields[i].Visible := True
    else if cdsGrid.Fields[i].Tag = 3 then
      cdsGrid.Fields[i].Visible := False;

  configurarGridPeloConfigColunas(GridCfg);
end;

procedure TfrmLocalizar.setTClientDataSet(dtSet: TClientDataSet;
  nomeUsuario: string; transacao: TIBTransaction);
var
  I: Integer;
begin
  cdsColunas := TClientDataSet(dtSet);
  cdsGrid := TClientDataSet(DBGrid1.DataSource.DataSet);
  GridCfg := DBGrid1;
  usuario := nomeUsuario;
  cdsColunas.IndexFieldNames := 'ordem';
  trans := TIBTransaction(transacao);
  setDataSetNameByGrid(GridCfg.Name, cdsGrid.Name);
  if not Assigned(GridCfg.OnColumnMoved) then
    GridCfg.OnColumnMoved := gridColumnMoved;
  GridCfg.Columns.Clear;
  GridCfg.Columns.RebuildColumns;

  for I := 0 to cdsGrid.Fields.Count - 1 do
    if cdsGrid.Fields[i].Tag = 0 then
       cdsGrid.Fields[i].Visible := True
    else if cdsGrid.Fields[i].Tag = 1 then
       cdsGrid.Fields[i].Visible := False
    else if cdsGrid.Fields[i].Tag = 2 then
       cdsGrid.Fields[i].Visible := True
    else if cdsGrid.Fields[i].Tag = 3 then
       cdsGrid.Fields[i].Visible := False;

  configurarGridPeloConfigColunas(DBGrid1);
end;

procedure TfrmLocalizar.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if Consulta.FichadeVenda(TrimRight(Edit1.Text)) then
  begin
    //    DBGrid6.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
    	DBGrid6.SetFocus;
  end;
end;

procedure TfrmLocalizar.Splitter2Moved(Sender: TObject);
begin
  if Consulta.getNomeTabela = 'CLIENTES' then
  	_GravaConfiguracoesInteger(pnOpcaoDireitaClientes.Name, vDadosIni.IfThen(pnOpcaoDireitaClientes.Width < 150, 150, pnOpcaoDireitaClientes.Width))
  else if Consulta.getNomeTabela = 'PRODUTOS' then
		_GravaConfiguracoesInteger(pnOpcaoDireitaProdutos.Name, vDadosIni.IfThen(pnOpcaoDireitaProdutos.Width < 150, 150, pnOpcaoDireitaProdutos.Width));
end;

procedure TfrmLocalizar.SplitterObservacaoBottomClMoved(Sender: TObject);
begin
  try
  	AjustarBarraLateral(False);
  finally
  	_GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 25, 25, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 25, 25, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 25, 25, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TfrmLocalizar.SplitterObservacaoBottomProdMoved(Sender: TObject);
begin
  try
  	AjustarBarraLateral(False);
  finally
  	_GravaConfiguracoesInteger(pnObservacaoProd.Name, vDadosIni.IfThen(pnObservacaoProd.Height < 25, 25, pnObservacaoProd.Height));
    _GravaConfiguracoesInteger(pnCaracteristicaProd.Name, vDadosIni.IfThen(pnCaracteristicaProd.Height < 25, 25, pnCaracteristicaProd.Height));
    _GravaConfiguracoesInteger(pnCodigoProd.Name, vDadosIni.IfThen(pnCodigoProd.Height < 25, 25, pnCodigoProd.Height));
  end;
end;

procedure TfrmLocalizar.SplitterObservacaoSpcBottomClMoved(Sender: TObject);
begin
  try
  	AjustarBarraLateral(False);
  finally
  	_GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 25, 25, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 25, 25, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 25, 25, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TfrmLocalizar.SplitterVerGradesMoved(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesBoolean(ckVerGrades.Name, ckVerGrades.Checked);

	_GravaConfiguracoesInteger(GroupBoxVerGrades.Name, vDadosIni.IfThen(GroupBoxVerGrades.Width < 220, 220, GroupBoxVerGrades.Width));
end;

procedure TfrmLocalizar.TabSheet3Show(Sender: TObject);
begin
  inherited;
  MaskEdit4.EditMask := vDadosIni.vMascaraLocacao;
  MaskEdit5.EditMask := vDadosIni.vMascaraLocacao;
  if (Self.Enabled) and (Self.Visible) and (maskedit4.CanFocus) then
  	maskedit4.setfocus;
  MaskEdit4.Text := Consulta.dataSet.FieldByName('LOCACAO_PROD').AsString;
  MaskEdit5.Text := Consulta.dataSet.FieldByName('LOCACAO_PROD_1').AsString;
  Panel14.Caption := Consulta.dataSet.FieldByName('DESCR_PROD').AsString;
end;

procedure TfrmLocalizar.TabSheet4Show(Sender: TObject);
begin
  inherited;
  //  Consulta.UltimoBalancoProd;
end;

procedure TfrmLocalizar.TabSheet6Show(Sender: TObject);
begin
  inherited;
  Consulta.produtoSimilar;
end;

procedure TfrmLocalizar.TabSheet7Show(Sender: TObject);
begin
  inherited;
  if Consulta.TransferirDepositoLoja then
  begin
    EditMoeda1.Valor := 0;
    if (Self.Enabled) and (Self.Visible) and (EditMoeda1.CanFocus) then
    	EditMoeda1.SetFocus;
    DBLookupComboBox1.KeyValue := vDadosIni.vCodUsuario;
  end;
end;

procedure TfrmLocalizar.TabSheet8Show(Sender: TObject);
begin
  inherited;
  if Consulta.AbrirVendaPerdida then
  begin
    Consulta.VendaPerdida.dataSet.FieldByName('GRUPO_PROD').AsInteger :=
      Consulta.dataSet.FieldByName('GRUPO_PROD').AsInteger;
    Consulta.VendaPerdida.dataSet.FieldByName('COD_PROD').AsString :=
      Consulta.dataSet.FieldByName('COD_PROD').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
    	DBLookupComboBox2.SetFocus;
  end;
end;

procedure TfrmLocalizar.tsProdutosKitShow(Sender: TObject);
begin
  inherited;
  Consulta.itensDoKit;
end;

end.

