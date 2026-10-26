unit uAlteracaoDePreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, ExtCtrls, UClassesProdutos,
  uEditHw, QRCtrls, QuickRpt, Menus, DBCtrls, Grids, DBGrids, uDataSet_OOP,
  Contnrs, Mask, Spin;

const
  TB_GRUPO      = 'GRUPO';
  TB_SUBGRUPO   = 'SUBGRUPO';
  TB_MARCA      = 'MARCA';
  TB_LOCALIDADE = 'LOCALIDADE';
  TB_SETOR      = 'SETOR';
  TB_CIDADE     = 'CIDADE';
  TB_TABELA     = 'DIFERENCIADA';

  TB_ALL: array[1..7] of string = (TB_GRUPO, TB_SUBGRUPO, TB_MARCA, TB_LOCALIDADE, TB_SETOR, TB_CIDADE, TB_TABELA);

type

  TLogProgress = procedure (msg: string; percent: Integer) of object;

  TFaixaClass = class
  private
    Fid: Integer;
    Fname: string;
    Ftipo: string;
  public
    property id: Integer read Fid write Fid;
    property name: string read Fname write Fname;
    property tipo: string read Ftipo write Ftipo;
  end;

  TFaixasClass = array of TFaixaClass;

  TFaixasOOP = class(TDataset_OOP)
  private
    Ftipo: string;
    procedure SetTipo(const Value: string);
  public
    constructor Create();
    procedure Add(id: Integer; atipo, name: string);
    function GetFaixas(aTipo: string): TFaixasClass;

    property tipo: string read Ftipo write SetTipo;
  end;

  FatorAlteracao = (faPreco, faMarkup, faMargem, faPercAdicionalOuPromo);
  FormaAlteracao = (fmSubstituicao, fmAumento, fmReducao, fmAumentoPerc, fmReducaoPerc);
  TabelaPrecoAlt = (paVarejo, paAtacado, pa30dias, pa60dias, pa90dias, paPromo, paTabPromo, paCidade, paLocalidade, paSetor, paAvulsa);

  TProdPreco = class(TObject)
  private
    Fgrupo: Integer;
    Fcodigo: string;
    Fcusto: Double;
    FtabId: Integer;
    FfatorValue: Double;
    Fprecovarejo: Double;
    Fdescricao: string;
    FtabName: string;
    FtipoTabela: string;
    FtabDifValor: Double;
    FtabDifPerc: Double;
    FtabDifMkt: Double;
  public
    property grupo: Integer read Fgrupo write Fgrupo;
    property codigo: string read Fcodigo write Fcodigo;
    property descricao: string read Fdescricao write Fdescricao;
    property custo: Double read Fcusto write Fcusto;
    property fatorValue: Double read FfatorValue write FfatorValue;
    property tabId: Integer read FtabId write FtabId;
    property tabName: string read FtabName write FtabName;
    property precovarejo: Double read Fprecovarejo write Fprecovarejo;
    property tipoTabela: string read FtipoTabela write FtipoTabela;
    property tabDifValor: Double read FtabDifValor write FtabDifValor;
    property tabDifPerc: Double read FtabDifPerc write FtabDifPerc;
    property tabDifMkt: Double read FtabDifMkt write FtabDifMkt;
  end;

  TProdPrecoList = class(TObjectList)
  strict private
    function GetItem(Index: Integer): TProdPreco;
    procedure SetItem(Index: Integer; const Value: TProdPreco);
  private
    FtabPreco: TabelaPrecoAlt;
    Ffator: FatorAlteracao;
    Fforma: FormaAlteracao;
    Fparametro: Double;
    Ftipo: string;
  public
    function New: TProdPreco;

    property Items[Index: Integer]: TProdPreco read GetItem write SetItem;

    property tipo: string read Ftipo write Ftipo;

    property tabPreco: TabelaPrecoAlt read FtabPreco write FtabPreco;
    property fator: FatorAlteracao read Ffator write Ffator;
    property forma: FormaAlteracao read Fforma write Fforma;
    property parametro: Double read Fparametro write Fparametro;
  end;

  TPrecosOOP = class(TDataset_OOP)
  private
    Fforma: FormaAlteracao;
    Ffator: FatorAlteracao;
    FtabPreco: TabelaPrecoAlt;
    FOnCalculo: TLogProgress;
    FOnApply: TLogProgress;
    Fstop: Boolean;
    Fprocesso: string;
    Fdecimais: Smallint;

    function GetFieldFator(fatorParam: FatorAlteracao; tabPrecoParam: TabelaPrecoAlt): string;

  public
    constructor Create();

    function GetProdutosFaixa(tipo: string; payload: TFaixasClass): TProdPrecoList; overload;
    function GetProdutosFaixa(tipo: string; ids: array of Integer): TProdPrecoList; overload;
    function GetProdutosFaixa(payload: TProdPrecoList): TProdPrecoList; overload;
    function GetRelatorio(dataIni, dataFim: TDateTime): Boolean;

    procedure CalculaPrecos(payload: TProdPrecoList);
    function ApplicarPrecos(): Boolean;

    property forma: FormaAlteracao read Fforma write Fforma;
    property fator: FatorAlteracao read Ffator write Ffator;
    property tabPreco: TabelaPrecoAlt read FtabPreco write FtabPreco;
    property decimais: Smallint read Fdecimais write Fdecimais; 

    property OnCalculo: TLogProgress read FOnCalculo write FOnCalculo;
    property OnApply: TLogProgress read FOnApply write FOnApply;
    property stop: Boolean read Fstop write Fstop;
    property processo: string read Fprocesso write Fprocesso;
  end;


  TfrmAlteracaoDePreco = class(TfrmPadrao)
    pnMeio: TPanel;
    RadioGroup1: TRadioGroup;
    rbAumento: TRadioButton;
    rbReducao: TRadioButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pnInicial: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    ckbAvista: TCheckBox;
    ckb60Dias: TCheckBox;
    ckb30Dias: TCheckBox;
    ckb90Dias: TCheckBox;
    Panel6: TPanel;
    pnFinal: TPanel;
    Panel9: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox45: TGroupBox;
    BitBtn71: TBitBtn;
    Panel7: TPanel;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    edAvista: TEditHw;
    ed30Dias: TEditHw;
    ed60Dias: TEditHw;
    ed90Dias: TEditHw;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ckbEfetuarAlteracaoPreco: TCheckBox;
    Panel3: TPanel;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    BitBtn7: TBitBtn;
    ckbDiferenciado: TCheckBox;
    ckbPromocao: TCheckBox;
    Label4: TLabel;
    edDiferenciado: TEditHw;
    Label9: TLabel;
    edPromocao: TEditHw;
    Label10: TLabel;
    DBLookupComboBox10: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    rbProdutoConsulta: TRadioButton;
    rbProdutoSelecionado: TRadioButton;
    rbAlteracao: TRadioButton;
    rbAjustePreco: TRadioButton;
    Memo1: TMemo;
    Memo2: TMemo;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr27: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    edAtacado: TEditHw;
    Label11: TLabel;
    ckbAtacado: TCheckBox;
    QRLabel19: TQRLabel;
    QRDBText9: TQRDBText;
    ckbDiferenciadoProporcional: TCheckBox;
    rbValorFixo: TRadioButton;
    page: TPageControl;
    tabInicio: TTabSheet;
    tabMeio: TTabSheet;
    tabPrintOptions: TTabSheet;
    tabQuickReport: TTabSheet;
    tabStart: TTabSheet;
    tabFaixa: TTabSheet;
    Panel4: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    radioConsulta: TRadioButton;
    radioSelecao: TRadioButton;
    radioFaixa: TRadioButton;
    Panel11: TPanel;
    btStartNext: TBitBtn;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    PageControl2: TPageControl;
    tabGrupo: TTabSheet;
    Panel16: TPanel;
    radioGrupo: TRadioButton;
    radioSubGrupo: TRadioButton;
    radioMarcas: TRadioButton;
    radioCidades: TRadioButton;
    radioLocalidades: TRadioButton;
    radioSetores: TRadioButton;
    radioTabelasEPromos: TRadioButton;
    Label12: TLabel;
    edFaixa: TEdit;
    SpeedButton3: TSpeedButton;
    edFiltro: TEdit;
    Label13: TLabel;
    gridFiltro: TDBGrid;
    SpeedButton4: TSpeedButton;
    gridSelecao: TDBGrid;
    Label14: TLabel;
    Panel15: TPanel;
    btFaixaNext: TBitBtn;
    btFaixaUndo: TBitBtn;
    tabFinish: TTabSheet;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    btFinish: TBitBtn;
    btFinishUndo: TBitBtn;
    Label17: TLabel;
    gridProdutosPrecos: TDBGrid;
    pnMemoProcessos: TPanel;
    memoProcessos: TMemo;
    btUnSelectAll: TSpeedButton;
    btSelectAll: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label16: TLabel;
    tabApply2: TTabSheet;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    lbParametro2: TLabel;
    edParametro2: TEditHw;
    Panel41: TPanel;
    btApply: TBitBtn;
    btUndoApply: TBitBtn;
    radioTabelaPreco: TRadioGroup;
    radioFator: TRadioGroup;
    radioForma: TRadioGroup;
    btReport: TBitBtn;
    tabReport: TTabSheet;
    Panel40: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label15: TLabel;
    edDataIni: TMaskEdit;
    Label18: TLabel;
    edDataFim: TMaskEdit;
    Panel45: TPanel;
    QuickRep2: TQuickRep;
    QRBand4: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel22: TQRLabel;
    QRSysData4: TQRSysData;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRBand6: TQRBand;
    QRLabel38: TQRLabel;
    QRShape8: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRExpr8: TQRExpr;
    pnLogCalculo: TPanel;
    progressCalculo: TProgressBar;
    lbCalculo: TLabel;
    pnLogUpdate: TPanel;
    lbLogUpdate: TLabel;
    progressUpdate: TProgressBar;
    popDelete: TPopupMenu;
    Removertodos1: TMenuItem;
    Removeritenscomavisos1: TMenuItem;
    btParar: TSpeedButton;
    btParar2: TSpeedButton;
    grupoMultiPreco: TGroupBox;
    edMultVarejo: TEditHw;
    edMultAtacado: TEditHw;
    edMult30dias: TEditHw;
    edMult60dias: TEditHw;
    edMult90dias: TEditHw;
    edMultPromocao: TEditHw;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    switchPrecoBtn: TSpeedButton;
    ckMultVarejo: TCheckBox;
    ckMultAtacado: TCheckBox;
    ckMult30dias: TCheckBox;
    ckMult60dias: TCheckBox;
    ckMult90dias: TCheckBox;
    ckMultPromocao: TCheckBox;
    lbCasasDecimais: TLabel;
    edCasasDecimais: TSpinEdit;
    procedure ckMultPromocaoClick(Sender: TObject);
    procedure ckMult90diasClick(Sender: TObject);
    procedure ckMult60diasClick(Sender: TObject);
    procedure ckMult30diasClick(Sender: TObject);
    procedure ckMultAtacadoClick(Sender: TObject);
    procedure ckMultVarejoClick(Sender: TObject);
    procedure switchPrecoBtnClick(Sender: TObject);
    procedure btPararClick(Sender: TObject);
    procedure Removeritenscomavisos1Click(Sender: TObject);
    procedure Removertodos1Click(Sender: TObject);
    procedure QuickRep2Preview(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure memoProcessosClick(Sender: TObject);
    procedure btReportClick(Sender: TObject);
    procedure btUndoApplyClick(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure radioFatorClick(Sender: TObject);
    procedure radioTabelaPrecoClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure gridProdutosPrecosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridProdutosPrecosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btFinishClick(Sender: TObject);
    procedure edFiltroChange(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure radioGrupoClick(Sender: TObject);
    procedure btFaixaUndoClick(Sender: TObject);
    procedure btFinishUndoClick(Sender: TObject);
    procedure btFaixaNextClick(Sender: TObject);
    procedure btStartNextClick(Sender: TObject);
    procedure rbReducaoClick(Sender: TObject);
    procedure rbAumentoClick(Sender: TObject);
    procedure rbValorFixoClick(Sender: TObject);
    procedure ckbAvistaClick(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ckbDiferenciadoClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr13Print(sender: TObject; var Value: string);
    procedure QRExpr32Print(sender: TObject; var Value: string);
    procedure QRExpr28Print(sender: TObject; var Value: string);
    procedure QRExpr33Print(sender: TObject; var Value: string);
    procedure QRExpr27Print(sender: TObject; var Value: string);
    procedure ALTf41Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure BitBtn71Click(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    // processos
    
    proAlteracaoNormal: Boolean;
    proAlteracaoPorFaixa: Boolean;
    proAlteracaoPercentualAd: Boolean;
    proAumento: Boolean;
    proReducao: Boolean;
    proSubstituicao: Boolean;
    proVarejo: Boolean;
    proAtacado: Boolean;
    pro30dias: Boolean;
    pro60dias: Boolean;
    pro90dias: Boolean;

    precos: TPrecosOOP;
    faixas: TFaixasOOP;
    selecao: TFaixasOOP;
    Fprodutos: TProdutos;


    procedure pesquisaGrupo(Sender: TObject);
    procedure pesquisaProduto(Sender: TObject);
    procedure pesquisaSubGrupo(Sender: TObject);
    procedure pesquisaMarca(Sender: TObject);
    procedure pesquisaDiferenciadoLocalidade(Sender: TObject);
    procedure pesquisaDiferenciadoSetor(Sender: TObject);
    procedure pesquisaDiferenciadoCidade(Sender: TObject);
    procedure pesquisaDiferenciadoAvulso(Sender: TObject);
    procedure pesquisaPromocao(Sender: TObject);

    procedure handleRadiosFaixa;

    procedure LogCalculo(msg: string; percent: Integer);
    procedure LogUpdate(msg: string; percent: Integer);
  public
    property produtos: TProdutos read Fprodutos write Fprodutos;
  end;

var
  frmAlteracaoDePreco: TfrmAlteracaoDePreco;
  altPreco: TAlteracaoPreco;

implementation

uses uDtmAtivo, uDadosIni, UDtmProdutos, DBClient, DB, hw_utils,
  StrUtils, hw_grid_utils, Math, calc_utils, Query_OOP, DateUtils;

{$R *.dfm}

procedure TfrmAlteracaoDePreco.ALTf41Click(Sender: TObject);
begin
  inherited;
  Sleep(1000);
end;

procedure TfrmAlteracaoDePreco.btPararClick(Sender: TObject);
begin
  inherited;
  if ShowConfirmacao('Deseja mesmo para o processamento') <> ID_YES then
    Exit;

  precos.stop := True;
end;

procedure TfrmAlteracaoDePreco.btFaixaUndoClick(Sender: TObject);
begin
  inherited;
  page.ActivePage := tabStart;
end;

procedure TfrmAlteracaoDePreco.btReportClick(Sender: TObject);
begin
  inherited;
  edDataFim.Text := FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);
  page.ActivePage := tabReport;
end;

procedure TfrmAlteracaoDePreco.BitBtn11Click(Sender: TObject);
begin
  inherited;
  QuickRep2.DataSet := precos.buscas;
  QRLabel30.Caption := vDadosIni.vEmp.vnomeEmpresa;
  QRLabel38.Caption := vDadosIni.vEmp.vnomeEmpresa;
  QRExpr3.Expression := 'FORMATNUMERIC(' + QuotedStr(DisplayNumber(2)) + ',QUANTIDADE)';
  QRExpr7.Expression := 'FORMATNUMERIC(' + QuotedStr(DisplayNumber(vDadosIni.vEmp.vCasasDecimais)) + ',PRECO)';
  QRExpr2.Expression := 'FORMATNUMERIC(' + QuotedStr(DisplayNumber(vDadosIni.vProduto.Precos.DigMrkMrg)) + ',MARKUP)';
  QRExpr1.Expression := 'FORMATNUMERIC(' + QuotedStr(DisplayNumber(vDadosIni.vProduto.Precos.DigMrkMrg)) + ',MARGEM)';

  if precos.GetRelatorio(StrToDateTime(edDataIni.Text), StrToDateTime(edDataFim.Text)) then
  begin
    QuickRep2.Preview;
    QuickRep2.DataSet := nil;
  end;  
end;

procedure TfrmAlteracaoDePreco.BitBtn12Click(Sender: TObject);
begin
  inherited;
  page.ActivePage := tabStart;
end;

procedure TfrmAlteracaoDePreco.BitBtn1Click(Sender: TObject);
begin
  inherited;
  altPreco.vTipoPreco._abreTipoPrecoTabela;
  DBLookupComboBox10.KeyValue := altPreco.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
  pnInicial.Visible := False;
  pnMeio.Visible := True;
  Panel6.Caption := '';

  vDadosIni.vInibeMensPesqPros := 'S';
  if vDadosIni.PesqPros('PRO188', 'HABILITAR', 'HABILITAR ITEM RADIOGROUP', 'PRODUTOS', '', altPreco.buscas, False) then
    ckbAvista.Enabled := True;
  ckbEfetuarAlteracaoPreco.Visible := False;

	ckbDiferenciadoProporcional.Visible := not vDadosIni.vProduto.vRecalcularPrecoDiferenciado;
  if vDadosIni.vProduto.vRecalcularPrecoDiferenciado then
  	ckbDiferenciadoProporcional.Checked := false;

  if (rbProdutoConsulta.Checked) or (rbProdutoSelecionado.Checked) then
  begin
    RadioGroup1.Enabled := False;
    RadioGroup1.Items.Clear;
    if rbProdutoConsulta.Checked then
      RadioGroup1.Items.Add('Produtos consultados ( Percentual )')
    else
      RadioGroup1.Items.Add('Produtos selecionados ( Percentual )');
    RadioGroup1.ItemIndex := 0;
    GroupBox1.Visible := False;
    Panel6.Visible := False;

    GroupBox3.Visible := True;
    GroupBox3.Caption := 'Percentual';
    edAvista.FormatSize := '0.4';
    ed30Dias.FormatSize := '0.4';
    ed60Dias.FormatSize := '0.4';
    ed90Dias.FormatSize := '0.4';
    edAtacado.FormatSize := '0.4';
    edDiferenciado.FormatSize := '0.4';
    edPromocao.FormatSize := '0.4';
    Panel2.Visible := True;
    rbAumento.Checked := True;
    rbAumento.Visible := True;
    rbReducao.Visible := True;
    rbValorFixo.Visible := True;
    ckbAvista.Checked := False;
    ckb30Dias.Checked := False;
    ckb60Dias.Checked := False;
    ckb90Dias.Checked := False;
    ckbAtacado.Checked := False;
    ckbDiferenciado.Checked := False;
    ckbPromocao.Checked := False;
    ckbDiferenciado.Visible := false;
    ckbPromocao.Visible := false;
    Label4.Visible := false;
    Label9.Visible := false;
    edDiferenciado.Visible := false;
    edPromocao.Visible := false;
  end
  else if rbAlteracao.Checked then
  begin
    RadioGroup1.Enabled := True;
    RadioGroup1.Items.Clear;
    RadioGroup1.Items.Add('Item ( Preço )');
    RadioGroup1.Items.Add('Item ( Percentual )');
    RadioGroup1.Items.Add('Grupo ( Percentual )');
    RadioGroup1.Items.Add('SubGrupo ( Percentual )');
    RadioGroup1.Items.Add('Tabela Diferenciada ( Percentual )');
    RadioGroup1.Items.Add('Promoção ( Percentual )');
    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('PRO185', 'HABILITAR', 'HABILITAR ITEM RADIOGROUP', 'PRODUTOS', '', altPreco.buscas, False) then
      RadioGroup1.Items.Add('Todos Produtos ( Percentual )');
    RadioGroup1.ItemIndex := 0;

    GroupBox1.Visible := True;
    GroupBox1.Caption := 'Pesquisa de Produto';
    Edit1.Text := '';
    Edit2.Text := '';
    Label1.Caption := 'Grupo do Produto:';
    Label2.Caption := 'Código do Produto:';

    rbAumento.Checked := True;
    rbAumento.Visible := True;
    rbReducao.Visible := True;
    rbValorFixo.Visible := True;
    ckbAvista.Checked := False;
    ckb30Dias.Checked := False;
    ckb60Dias.Checked := False;
    ckb90Dias.Checked := False;
    ckbAtacado.Checked := False;
    ckbDiferenciado.Checked := False;
    ckbPromocao.Checked := False;
    Label4.Visible := true;
    Label9.Visible := true;
    ckbDiferenciado.Visible := True;
    ckbPromocao.Visible := True;
    edDiferenciado.Visible := true;
    edPromocao.Visible := true;

    Panel6.Visible := True;

    Panel2.Visible := True;

    GroupBox3.Visible := True;
    GroupBox3.Caption := 'Valor';

    edAvista.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    ed30Dias.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    ed60Dias.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    ed90Dias.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    edAtacado.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    edDiferenciado.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    edPromocao.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  end
  else if rbAjustePreco.Checked then
  begin
    RadioGroup1.Enabled := True;
    RadioGroup1.Items.Clear;
    RadioGroup1.Items.Add('Marca ( Percentual )');
    RadioGroup1.Items.Add('Grupo ( Percentual )');
    RadioGroup1.Items.Add('SubGrupo ( Percentual )');
    RadioGroup1.ItemIndex := 0;

    GroupBox1.Visible := True;
    GroupBox1.Caption := 'Pesquisa da Marca';
    Edit1.Text := '';
    Edit2.Text := '';
    Label1.Caption := 'Marca Inicial:';
    Label2.Caption := 'Marca Final:';

    rbAumento.Checked := True;
    rbAumento.Visible := True;
    rbReducao.Visible := False;
    rbValorFixo.Visible := False;

    Panel6.Visible := True;

    Panel2.Visible := True;

    GroupBox3.Visible := True;
    GroupBox3.Caption := 'Percentual';

    edAvista.FormatSize := '0.4';
    ed30Dias.FormatSize := '0.4';
    ed60Dias.FormatSize := '0.4';
    ed90Dias.FormatSize := '0.4';
    edAtacado.FormatSize := '0.4';
    edDiferenciado.FormatSize := '0.4';
    edPromocao.FormatSize := '0.4';

    ckbAvista.Enabled := False;
    ckbAvista.Checked := False;
    ckb30Dias.Checked := True;
    ckb60Dias.Checked := True;
    ckb90Dias.Checked := True;
    ckbAtacado.Enabled := False;
    ckbAtacado.Checked := False;
    ckbDiferenciado.Checked := False;
    ckbPromocao.Checked := False;
    ckbDiferenciado.Visible := false;
    ckbPromocao.Visible := false;
    Label4.Visible := false;
    Label9.Visible := false;
    edDiferenciado.Visible := false;
    edPromocao.Visible := false;
    Panel2Exit(Panel2);

    ckbEfetuarAlteracaoPreco.Visible := True;

  end;

end;

procedure TfrmAlteracaoDePreco.btFinishClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  precos.prepare_loop();
  btParar.Visible := True;
  btParar2.Visible := True;
  btFinish.Enabled := False;
  btFinishUndo.Enabled := False;
  try

    if precos.ApplicarPrecos then
    begin
      if ShowConfirmacao('Alteração de preços realizada comm sucesso!' + sLineBreak + sLineBreak +
                         'Deseja alterar mais preços?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      begin
        if selecao.dataSet.Active then
          selecao.dataSet.EmptyDataSet;
        page.ActivePage := tabStart;

      end
      else
        Close;
    end;

  finally
    precos.prepare_loop_done();
    Screen.Cursor := crDefault;
    btParar.Visible := False;
    btParar2.Visible := False;
    btFinish.Enabled := True;
    btFinishUndo.Enabled := True;
  end;
end;

procedure TfrmAlteracaoDePreco.btFinishUndoClick(Sender: TObject);
begin
  inherited;

  if precos.dataSet.RecordCount > 0 then
    if ShowConfirmacao('Se abandonar essa tela a lista de alterações será apagada!' + sLineBreak + sLineBreak +
                       'Deseja mesmo abandonar essa tela e voltar a operação?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> ID_YES then
      Exit
    else
      precos.dataSet.EmptyDataSet;

  page.ActivePage := tabApply2;
end;

procedure TfrmAlteracaoDePreco.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmAlteracaoDePreco.BitBtn3Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    altPreco.vModalidade := Trim(UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex]));
    if ckbDiferenciado.Checked then
      altPreco.vTipo := DBLookupComboBox10.Text;
    if rbProdutoConsulta.Checked then
      altPreco.vFinalidade := 'CONSULTADOS'
    else if rbProdutoSelecionado.Checked then
      altPreco.vFinalidade := 'SELECIONADOS'
    else if rbAlteracao.Checked then
      altPreco.vFinalidade := 'ALTERACAO'
    else if rbAjustePreco.Checked then
      altPreco.vFinalidade := 'AJUSTE';

    altPreco.vCampoIniOuGrupo := Trim(Edit1.Text);
    altPreco.vCampoFimOuCodigo := Trim(Edit2.Text);
  	altPreco.vAumento := rbAumento.Checked;
    altPreco.vReducao := rbReducao.Checked;
	  altPreco.vValorFixo := rbValorFixo.Checked;

    altPreco.vEfetuarAlteracaoPeloAjuste := ckbEfetuarAlteracaoPreco.Checked;
    altPreco.vProgresso := TProgressBar(ProgressBar1);
    altPreco.vLabel := TLabel(Label3);

    altPreco.vAVista := ckbAvista.Checked;
    altPreco.v30Dias := ckb30Dias.Checked;
    altPreco.v60Dias := ckb60Dias.Checked;
    altPreco.v90Dias := ckb90Dias.Checked;
    altPreco.vAtacado := ckbAtacado.Checked;
    altPreco.vDiferenciado := ckbDiferenciado.Checked;
    altPreco.vPromocao := ckbPromocao.Checked;
    altPreco.vDiferenciadoProporcional := ckbDiferenciadoProporcional.Checked;

    altPreco.vCampoAVista := edAvista.AsValue;
    altPreco.vCampo30Dias := ed30Dias.AsValue;
    altPreco.vCampo60Dias := ed60Dias.AsValue;
    altPreco.vCampo90Dias := ed90Dias.AsValue;
    altPreco.vCampoAtacado := edAtacado.AsValue;
    altPreco.vCampoDiferenciado := edDiferenciado.AsValue;
    altPreco.vCampoPromocao := edPromocao.AsValue;

    if altPreco.validaDadosDigitados then
    begin
      pnMeio.Visible := False;
      pnFinal.Visible := True;
      Panel7.Visible := True;
      BitBtn7.Visible := True;
      GroupBox45.Visible := False;
      BitBtn5.Enabled := False;

      if altPreco.efetuarAlteracao then
      begin
        GroupBox45.Visible := True;
        BitBtn5.Enabled := True;
      end
      else
      begin
        if altPreco.vParar = 1 then
        begin
          pnMeio.Visible := True;
          pnFinal.Visible := False;
          Panel7.Visible := False;
        end
        else
        begin
          Panel7.Visible := False;
          BitBtn7.Visible := False;
          BitBtn5.Enabled := False;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAlteracaoDePreco.BitBtn4Click(Sender: TObject);
begin
  inherited;
  pnInicial.Visible := True;
  pnMeio.Visible := False;
end;

procedure TfrmAlteracaoDePreco.BitBtn5Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn71.Enabled := False;
    BitBtn7.Visible := False;
    if altPreco.salvarAlteracoes then
      ModalResult := IDOK;
  finally
    BitBtn5.Enabled := True;
    BitBtn6.Enabled := True;
    BitBtn71.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAlteracaoDePreco.BitBtn6Click(Sender: TObject);
begin
  inherited;
  altPreco.cancelar;
  ModalResult := IDCANCEL;
end;

procedure TfrmAlteracaoDePreco.BitBtn71Click(Sender: TObject);
begin
  inherited;

  QRDBText8.Visible := False;
  QRDBText10.Visible := False;
  QRDBText11.Visible := False;
  QRLabel8.Visible := False;

  QRBand2.Height := 20;
  QRDBText1.Mask := '0.00';
  QRDBText5.Mask := '0.00';
  QRDBText6.Mask := '0.00';

  QRDBText1.DataField := 'PREC_30_PROD';
  QRDBText5.DataField := 'PREC_60_PROD';
  QRDBText6.DataField := 'PREC_90_PROD';

  QRShape4.Top := 20;

  if rbAjustePreco.Checked then
  begin
    if ckbEfetuarAlteracaoPreco.Checked then
    begin
      QRLabel8.Visible := False;
      QRBand2.Height := 39;
      QRDBText8.Visible := True;
      QRDBText10.Visible := True;
      QRDBText11.Visible := True;

      QRShape4.Top := 100;
    end
    else
    begin
      QRBand2.Height := 20;
      QRDBText1.Mask := '0.0000';
      QRDBText5.Mask := '0.0000';
      QRDBText6.Mask := '0.0000';

      QRDBText1.DataField := 'PERC_AD_30';
      QRDBText5.DataField := 'PERC_AD_60';
      QRDBText6.DataField := 'PERC_AD_90';

    end;
  end;

  QRLabel15.Caption := vDadosIni.vEmp.vnomeEmpresa + '     ' + Trim(vDadosIni.vEmp.vMensagem);// 'Hw Sistemas     ' + Trim(vDadosIni.vEmp.vMensagem);
  QRLabel10.Caption := Trim(vDadosIni.vEmp.vnomeEmpresa);

  QuickRep1.Preview;

end;

procedure TfrmAlteracaoDePreco.BitBtn7Click(Sender: TObject);
begin
  inherited;
  altPreco.vParar := 1;
end;

procedure TfrmAlteracaoDePreco.btApplyClick(Sender: TObject);
type
  ModelPreco = record
  	tabPreco: TabelaPrecoAlt;
    parametro: Double;
  end;

var
  I: Integer;
  ids: array of Integer;
  list: TProdPrecoList;
  modelList: array of ModelPreco;
  modelItem: ModelPreco;
  rescueTab: TabelaPrecoAlt;
begin
  inherited;

  if radioTabelaPreco.ItemIndex < 0 then
  begin
    ShowAtencao('Favor preencher a tabela de preço');
    Exit;
  end;

  if radioFator.ItemIndex < 0 then
  begin
    ShowAtencao('Favor preencher o fator de alteração');
    Exit;
  end;

  if radioForma.ItemIndex < 0 then
  begin
    ShowAtencao('Favor preencher a forma de alteração');
    Exit;
  end;

  rescueTab := precos.tabPreco;
  try

    precos.forma := FormaAlteracao(radioForma.ItemIndex);
    precos.decimais := IfThen(edCasasDecimais.Visible, edCasasDecimais.Value, vDadosIni.vEmp.vCasasDecimais);

    if not grupoMultiPreco.Visible then
    begin
      SetLength(modelList, 1);
      modelList[0].tabPreco := precos.tabPreco;
      modelList[0].parametro := edParametro2.AsValue;
    end
    else
    begin
      SetLength(modelList, 0);

      if ckMultVarejo.Checked then
      begin
        SetLength(modelList, Length(modelList) + 1);
        modelList[High(modelList)].tabPreco := paVarejo;
        modelList[High(modelList)].parametro := edMultVarejo.AsValue;
      end;

      if ckMultAtacado.Checked then
      begin
        SetLength(modelList, Length(modelList) + 1);
        modelList[High(modelList)].tabPreco := paAtacado;
        modelList[High(modelList)].parametro := edMultAtacado.AsValue;
      end;

      if ckMult30dias.Checked then
      begin
        SetLength(modelList, Length(modelList) + 1);
        modelList[High(modelList)].tabPreco := pa30dias;
        modelList[High(modelList)].parametro := edMult30dias.AsValue;
      end;

      if ckMult60dias.Checked then
      begin
        SetLength(modelList, Length(modelList) + 1);
        modelList[High(modelList)].tabPreco := pa60dias;
        modelList[High(modelList)].parametro := edMult60dias.AsValue;
      end;

      if ckMult90dias.Checked then
      begin
        SetLength(modelList, Length(modelList) + 1);
        modelList[High(modelList)].tabPreco := pa90dias;
        modelList[High(modelList)].parametro := edMult90dias.AsValue;
      end;

      if ckMultPromocao.Checked then
      begin
        SetLength(modelList, Length(modelList) + 1);
        modelList[High(modelList)].tabPreco := paPromo;
        modelList[High(modelList)].parametro := edMultPromocao.AsValue;
      end;

      if Length(modelList) = 0 then 
      begin
        ShowAtencao('Nenhum campo selecionado para alteração');
        Exit;
      end;
    end;

    for modelItem in modelList do
    begin
      precos.tabPreco := modelItem.tabPreco;

      if (modelItem.parametro < 0) then
      begin
        ShowAtencao('Favor preencher o campo com um valor válido');
        Exit;
      end;

      if (precos.fator = faMargem) and (modelItem.parametro >= 100) then
      begin
        ShowAtencao('Margem não deve ser maior ou igual a 100%. Utilize o markup para este fim');
        Exit;
      end
      else
      if (precos.forma in [fmAumento, fmReducao, fmAumentoPerc, fmReducaoPerc]) and (modelItem.parametro <= 0) then
      begin
        ShowAtencao(lbParametro2.Caption + ' zerado. Para aumento ou redução preencha o campo por favor');
        Exit;
      end
      else
      if (precos.fator = faPreco) and (precos.tabPreco = paVarejo) and (modelItem.parametro <= 0) then
      begin
        ShowAtencao('Preço Varejo não pode ser zerado');
        Exit;
      end
      else
      if (precos.fator in [faMarkup, faMargem]) and (precos.tabPreco = paPromo) and (modelItem.parametro <= 0) then
      begin
        ShowAtencao('Margem ou Markup deve ser preenchido para o preço Promoção. Se deseja zerar o preço Promoção selecione o fator "Preço"');
        Exit;
      end;

      if (precos.fator = faPercAdicionalOuPromo) and (modelItem.parametro <= 0) and (precos.tabPreco <> paTabPromo) then
        if ShowConfirmacao('Percentual Adicional com valor zerado!' + sLineBreak + sLineBreak +
                           'Apenas o percentual será zerado. Caso queira zerar o "Preço" repita a operação e selecione o fator "Preço"' + sLineBreak + sLineBreak +
                           'Deseja continuar mesmo assim?') <> ID_YES then
          Exit;

      if (precos.fator = faPercAdicionalOuPromo) and (modelItem.parametro <= 0) and (precos.tabPreco = paTabPromo)then
      begin
        ShowAtencao('Percentual com valor zerado!' + sLineBreak + sLineBreak +
                    'Tabela de promoção não pode ficar com o percentual zerado');
        Exit;
      end;
    end;

    if precos.forma = fmSubstituicao then
      if not vDadosIni.PesqPros('PRO428', 'VALIDACAO', '', 'PRODUTOS', '', precos.buscas, True) then
        Exit;
      
    if precos.forma in [fmAumento, fmAumentoPerc] then
      if not vDadosIni.PesqPros('PRO186', 'VALIDACAO', '', 'PRODUTOS', '', precos.buscas, True) then
        Exit;

    if precos.forma in [fmReducao, fmReducaoPerc] then
      if not vDadosIni.PesqPros('PRO187', 'VALIDACAO', '', 'PRODUTOS', '', precos.buscas, True) then
        Exit;

    if not vDadosIni.PesqPros(precos.processo, 'VALIDACAO', '', 'PRODUTOS', '', precos.buscas, True) then
      Exit;

    list := TProdPrecoList.Create;
    list.fator := precos.fator;
    list.forma := precos.forma;
    list.parametro := edParametro2.AsValue;

    btParar.Visible := True;
    btParar2.Visible := True;
    btApply.Enabled := False;
    btUndoApply.Enabled := False;
    Screen.Cursor := crHourGlass;
    try

      for modelItem in modelList do
      begin
        precos.tabPreco := modelItem.tabPreco;

        if radioFaixa.Checked then
        begin
          for I := Low(TB_ALL) to High(TB_ALL) do
          begin
    //        list := precos.GetProdutosFaixa(TB_ALL[I],
    //          selecao.filterStr('tipo = ''%s''', [TB_ALL[I]]).GetArrayInts('id', False, ''));
            list := precos.GetProdutosFaixa(TB_ALL[I], selecao.GetFaixas(TB_ALL[I]));
            list.fator := precos.fator;
            list.forma := precos.forma;
            list.parametro := modelItem.parametro;

            precos.CalculaPrecos(list);
          end;
        end
        else
        begin
          produtos.prepare_loop;
          try

            if radioSelecao.Checked then
              produtos.filterStr('sel = ''S''')
            else if radioConsulta.Checked then
            else
              Exit;

            while not produtos.dataSet.Eof do
            begin
              with list.New do
              begin
                grupo := produtos.fint('grupo_prod');
                codigo := produtos.fstr('cod_prod');
              end;

              produtos.dataSet.Next;
            end;

          finally
            produtos.prepare_loop_done;
          end;

          list := precos.GetProdutosFaixa(list);
          list.parametro := modelItem.parametro;

          precos.CalculaPrecos(list);
        end;
      end;

      if gridProdutosPrecos.DataSource = nil then
        gridProdutosPrecos.DataSource := precos._dataSourceOOP;

      page.ActivePage := tabFinish;

    finally
      list.Free;
      Screen.Cursor := crDefault;
      btParar.Visible := False;
      btParar2.Visible := False;
      btApply.Enabled := True;
      btUndoApply.Enabled := True;
    end;


  finally
    precos.tabPreco := rescueTab;
  end;
end;

procedure TfrmAlteracaoDePreco.btUndoApplyClick(Sender: TObject);
begin
  inherited;

  if (radioFaixa.Checked) then
    page.ActivePage := tabFaixa
  else
    page.ActivePage := tabStart;
end;

procedure TfrmAlteracaoDePreco.btFaixaNextClick(Sender: TObject);
begin
  inherited;
  if (not radioGrupo.Checked) and
     (not radioSubGrupo.Checked) and
     (not radioMarcas.Checked) and
     (not radioCidades.Checked) and
     (not radioLocalidades.Checked) and
     (not radioSetores.Checked) and
     (not radioTabelasEPromos.Checked) then
    ShowAtencao('Selecione uma opção por favor')
  else
  if selecao.dataSet.IsEmpty then
    ShowAtencao('Nenhum registro selecionado. Selecione algum para continuar')       
  else if (radioCidades.Checked) or
          (radioLocalidades.Checked) or
          (radioSetores.Checked) or
          (radioTabelasEPromos.Checked) then
  begin
//    page.ActivePage := tabFator;
    precos.tabPreco := paTabPromo;
    if radioTabelaPreco.Items.Count = 6 then
      radioTabelaPreco.Items.Add('Outras');

    radioTabelaPreco.ItemIndex := Ord(precos.tabPreco);

    page.ActivePage := tabApply2;
  end
  else
  begin

    if radioTabelaPreco.Items.Count = 7 then
      radioTabelaPreco.Items.Delete(6);

//    page.ActivePage := tabPreco;
    page.ActivePage := tabApply2;
  end;

  radioTabelaPreco.Enabled := precos.tabPreco <> paTabPromo;
  radioTabelaPreco.Visible := True;
  grupoMultiPreco.Enabled := radioTabelaPreco.Enabled;
  grupoMultiPreco.Visible := not radioTabelaPreco.Visible;
  switchPrecoBtn.Visible := grupoMultiPreco.Enabled;

  edParametro2.Enabled := not grupoMultiPreco.Visible;

  if (radioForma.Items.Count = 5) and (not grupoMultiPreco.Visible) then
  begin
    radioForma.Items[1] := 'Aumento';
    radioForma.Items[2] := 'Redução';
    radioForma.Items.Delete(4);
    radioForma.Items.Delete(3);
  end;

//  pnInfoPreco.Caption := IfThen(radioGrupo.Checked, radioGrupo.Caption) +
//                         IfThen(radioSubGrupo.Checked, radioSubGrupo.Caption) +
//                         IfThen(radioMarcas.Checked, radioMarcas.Caption) +
//                         IfThen(radioCidades.Checked, radioCidades.Caption) +
//                         IfThen(radioLocalidades.Checked, radioLocalidades.Caption) +
//                         IfThen(radioSetores.Checked, radioSetores.Caption) +
//                         IfThen(radioTabelasEPromos.Checked, radioTabelasEPromos.Caption);

//  radioVarejo.Enabled := True;
//  radioAtacado.Enabled := True;
//  radio30dias.Enabled := True;
//  radio60dias.Enabled := True;
//  radio90dias.Enabled := True;
//  radioPrecoPromo.Enabled := True;
end;

procedure TfrmAlteracaoDePreco.btSelectAllClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    faixas.CheckUnCheckAllRows(True);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAlteracaoDePreco.btStartNextClick(Sender: TObject);
begin
  inherited;
  if (not radioConsulta.Checked) and
     (not radioSelecao.Checked) and
     (not radioFaixa.Checked) then
    ShowAtencao('Selecione uma opção por favor')
  else if radioFaixa.Checked then
  begin
    handleRadiosFaixa;

    precos.processo := 'PRO182';

    page.ActivePage := tabFaixa;
  end
  else
  begin
//    page.ActivePage := tabPreco;
    if radioTabelaPreco.Items.Count = 7 then
      radioTabelaPreco.Items.Delete(6);

    precos.processo := 'PRO181';

    page.ActivePage := tabApply2;
  end;

  radioTabelaPreco.Enabled := True;
  radioTabelaPreco.Visible := True;
  grupoMultiPreco.Enabled := radioTabelaPreco.Enabled;
  grupoMultiPreco.Visible := not radioTabelaPreco.Visible;
  switchPrecoBtn.Visible := grupoMultiPreco.Enabled;

  edParametro2.Enabled := not grupoMultiPreco.Visible;

  if (radioForma.Items.Count = 5) and (not grupoMultiPreco.Visible) then
  begin
    radioForma.Items[1] := 'Aumento';
    radioForma.Items[2] := 'Redução';
    radioForma.Items.Delete(4);
    radioForma.Items.Delete(3);
  end;

//  pnInfoPreco.Caption := IfThen(radioConsulta.Checked, 'Consultados') +
//                         IfThen(radioSelecao.Checked , 'Selecionados');

//  radioVarejo.Enabled := True;
//  radioAtacado.Enabled := True;
//  radio30dias.Enabled := True;
//  radio60dias.Enabled := True;
//  radio90dias.Enabled := True;
//  radioPrecoPromo.Enabled := True;
end;

procedure TfrmAlteracaoDePreco.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    faixas.CheckUnCheckAllRows(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAlteracaoDePreco.ckbAvistaClick(Sender: TObject);
begin
  inherited;
  if ckbAvista.Checked then // ao habilitar a alteração do preco a vista o sistema marca para alterar os precos diferenciados
    ckbDiferenciadoProporcional.Checked := True; // se o usuário nao quiser basta desmarcar
  Panel2Exit(Sender);
end;

procedure TfrmAlteracaoDePreco.ckbDiferenciadoClick(Sender: TObject);
begin
  inherited;
  if ActiveControl = ckbDiferenciadoProporcional then
  begin
    if ckbDiferenciadoProporcional.Checked then
    begin
      ckbDiferenciado.Checked := False;
      ckbPromocao.Checked := False;
    end;
  end
  else
  begin
    if ckbDiferenciado.Checked or ckbPromocao.Checked then
      ckbDiferenciadoProporcional.Checked := False;
  end;
  Panel2Exit(Sender);
end;

procedure TfrmAlteracaoDePreco.ckMult30diasClick(Sender: TObject);
begin
  inherited;
  edMult30dias.Enabled := ckMult30dias.Checked;

  if (Self.Enabled) and (Self.Visible) and (edMult30dias.CanFocus) then
    edMult30dias.SetFocus;
end;

procedure TfrmAlteracaoDePreco.ckMult60diasClick(Sender: TObject);
begin
  inherited;
  edMult60dias.Enabled := ckMult60dias.Checked;

  if (Self.Enabled) and (Self.Visible) and (edMult60dias.CanFocus) then
    edMult60dias.SetFocus;
end;

procedure TfrmAlteracaoDePreco.ckMult90diasClick(Sender: TObject);
begin
  inherited;
  edMult90dias.Enabled := ckMult90dias.Checked;

  if (Self.Enabled) and (Self.Visible) and (edMult90dias.CanFocus) then
    edMult90dias.SetFocus;
end;

procedure TfrmAlteracaoDePreco.ckMultAtacadoClick(Sender: TObject);
begin
  inherited;
  edMultAtacado.Enabled := ckMultAtacado.Checked;

  if (Self.Enabled) and (Self.Visible) and (edMultAtacado.CanFocus) then
    edMultAtacado.SetFocus;
end;

procedure TfrmAlteracaoDePreco.ckMultPromocaoClick(Sender: TObject);
begin
  inherited;
  edMultPromocao.Enabled := ckMultPromocao.Checked;

  if (Self.Enabled) and (Self.Visible) and (edMultPromocao.CanFocus) then
    edMultPromocao.SetFocus;
end;

procedure TfrmAlteracaoDePreco.ckMultVarejoClick(Sender: TObject);
begin
  inherited;
  edMultVarejo.Enabled := ckMultVarejo.Checked;

  if (Self.Enabled) and (Self.Visible) and (edMultVarejo.CanFocus) then
    edMultVarejo.SetFocus;
end;

procedure TfrmAlteracaoDePreco.edFiltroChange(Sender: TObject);
begin
  inherited;
  if not faixas.dataSet.Active then
    Exit;

  if edFiltro.Text <> '' then
    faixas.filterStr('tipo = ''' + faixas.tipo + ''' and name like ''%' + edFiltro.Text +  '%''')
  else
    faixas.tipo := faixas.tipo;
end;

procedure TfrmAlteracaoDePreco.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if (RadioGroup1.ItemIndex = 0) or (RadioGroup1.ItemIndex = 1) then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if trim(vDadosIni.vPesquisa) <> '' then
      begin
       Edit1.Text := vDadosIni.vPesquisaGrupo_prod;
       Edit2.Text := vDadosIni.vPesquisaCod_prod;
      end;
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRUPOS');
       if trim(vDadosIni.vPesquisa) <> '' then
         TEdit(Sender).Text := vDadosIni.vPesquisa;
    end
    else if RadioGroup1.ItemIndex = 3 then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SUB_GRUPO');
      if vDadosIni.vPesquisa <> '' then
         TEdit(Sender).Text := vDadosIni.vPesquisa;
    end
    else if RadioGroup1.ItemIndex = 4 then
    begin
      if Trim(DBLookupComboBox10.Text) = 'LOCALIDADE' then
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('LOCALIDADE');
        if trim(vDadosIni.vPesquisa) <> '' then
          TEdit(Sender).Text := vDadosIni.vPesquisa;
      end
      else if Trim(DBLookupComboBox10.Text) = 'SETOR' then
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SETOR');
        if trim(vDadosIni.vPesquisa) <> '' then
          TEdit(Sender).Text := vDadosIni.vPesquisa;
      end
      else if Trim(DBLookupComboBox10.Text) = 'CIDADE' then
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if trim(vDadosIni.vPesquisa) <> '' then
          TEdit(Sender).Text := vDadosIni.vPesquisa;
      end
      else if Trim(DBLookupComboBox10.Text) = 'AVULSO' then
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PROMOCAO', ' and ((data_ini is null) or (data_fim is null)) and cod_promocao > 0 ', 'Tabela de Preço');
        if trim(vDadosIni.vPesquisa) <> '' then
          TEdit(Sender).Text := vDadosIni.vPesquisa;
      end;
    end
    else if RadioGroup1.ItemIndex = 5 then
    begin
       vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PROMOCAO', ' and not ((data_ini is null) or (data_fim is null)) ', 'Promoções');
       if trim(vDadosIni.vPesquisa) <> '' then
         TEdit(Sender).Text := vDadosIni.vPesquisa;
    end;
  end;
end;

procedure TfrmAlteracaoDePreco.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then Key := #0;
end;

procedure TfrmAlteracaoDePreco.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then Key := #0;
end;

procedure TfrmAlteracaoDePreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  altPreco.Free;
  altPreco := nil;

  precos.Free;
  faixas.Free;
  selecao.Free;

  Action := caFree;
  frmAlteracaoDePreco := nil;

end;

procedure TfrmAlteracaoDePreco.FormCreate(Sender: TObject);
begin
  inherited;
  altPreco := TAlteracaoPreco.create;

  tabInicio.TabVisible := False;
  tabMeio.TabVisible := False;
  tabPrintOptions.TabVisible := False;
  tabQuickReport.TabVisible := False;

  tabStart.TabVisible := False;
  tabFaixa.TabVisible := False;
  tabApply2.TabVisible := False;
  tabFinish.TabVisible := False;
  tabReport.TabVisible := False;

  precos := TPrecosOOP.Create;
  faixas := TFaixasOOP.Create();
  selecao := TFaixasOOP.Create();

  precos.OnCalculo := LogCalculo;
  precos.OnApply := LogUpdate;

end;

procedure TfrmAlteracaoDePreco.FormShow(Sender: TObject);
begin
  inherited;

  THwHack_DbGrid.Create(gridFiltro);
  THwHack_DbGrid.Create(gridSelecao);

  AutoSize := true;
  pnInicial.Visible := True;
  pnMeio.Visible := False;
  pnFinal.Visible := False;

  pnInicial.Top := 0;
  pnInicial.Left := 0;

  pnMeio.Top := 0;
  pnMeio.Left := 0;

  pnFinal.Top := 0;
  pnInicial.Left := 0;

//  proAlteracaoNormal := vDadosIni.PesqPros('PRO181', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False, False, True);
//  proAlteracaoPorFaixa := vDadosIni.PesqPros('PRO182', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False, False, True);
////  proAlteracaoPercentualAd
//  proAumento := vDadosIni.PesqPros('PRO186', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False, False, True);
//  proReducao := vDadosIni.PesqPros('PRO187', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False, False, True);
//  proSubstituicao := vDadosIni.PesqPros('PRO428', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False, False, True);
//  pro

  radioConsulta.Enabled := Self.produtos <> nil;// altPreco.ProdutoCriado;
  radioSelecao.Enabled := Self.produtos <> nil;// altPreco.ProdutoCriado;

  if radioConsulta.Enabled then
    radioConsulta.Checked := true
  else
    radioFaixa.Checked := True;
  memoProcessosClick(Sender);

  vDadosIni.vInibeMensPesqPros := 'S';
  if radioConsulta.Enabled then
  begin
    radioConsulta.Enabled := vDadosIni.PesqPros('PRO181', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
    if not radioConsulta.Enabled then
    begin
      memoProcessos.Lines.Add('PRO181 - Alteração de produtos pela Consulta de produtos');
      radioConsulta.Checked := False;
    end;
  end;
  radioSelecao.Enabled := radioConsulta.Enabled;

  vDadosIni.vInibeMensPesqPros := 'S';
  radioFaixa.Enabled := vDadosIni.PesqPros('PRO182', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not radioFaixa.Enabled then
  begin
    memoProcessos.Lines.Add('PRO182 - Alteração de preço por faixa');
    radioFaixa.Checked := False;
  end;

  edDataIni.Text := FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);
  btReport.Enabled := radioConsulta.Enabled or radioSelecao.Enabled or radioFaixa.Enabled;
  {
  vDadosIni.vInibeMensPesqPros := 'S';
  rbAjustePreco.Enabled := vDadosIni.PesqPros('PRO183', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbAjustePreco.Enabled then
    memoProcessos.Lines.Add('PRO183 - Alteração de percentuais de ajuste de preço Grupo/Marca/SubGrupo');

  vDadosIni.vInibeMensPesqPros := 'S';
  ckbEfetuarAlteracaoPreco.Checked := False;
  ckbEfetuarAlteracaoPreco.Enabled := vDadosIni.PesqPros('PRO184', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);

  if not ckbEfetuarAlteracaoPreco.Enabled then
    memoProcessos.Lines.Add('PRO184 - Alteração de preço utilizando os ajustes de preço');

  vDadosIni.vInibeMensPesqPros := 'S';
  rbAumento.Checked := False;
  rbAumento.Enabled := vDadosIni.PesqPros('PRO186', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbAumento.Enabled then
    memoProcessos.Lines.Add('PRO186 - Alteração de preço (Aumento)');

  vDadosIni.vInibeMensPesqPros := 'S';
  rbReducao.Checked := False;
  rbReducao.Enabled := vDadosIni.PesqPros('PRO187', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbReducao.Enabled then
    memoProcessos.Lines.Add('PRO187 - Alteração de preço (Redução)');

  vDadosIni.vInibeMensPesqPros := 'S';
  rbValorFixo.Checked := False;
  rbValorFixo.Enabled := vDadosIni.PesqPros('PRO428', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbValorFixo.Enabled then
    memoProcessos.Lines.Add('PRO428 - Alteração de preço (Alterar preços de venda para o valor informado)');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO188', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    memoProcessos.Lines.Add('PRO188 - Alteração de preço A Vista');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO189', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    memoProcessos.Lines.Add('PRO189 - Alteração de preço de 30 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO190', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    memoProcessos.Lines.Add('PRO190 - Alteração de preço de 60 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO191', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    memoProcessos.Lines.Add('PRO191 - Alteração de preço de 90 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO192', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    memoProcessos.Lines.Add('PRO192 - Alteração de percentual de ajuste de 30 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO193', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    memoProcessos.Lines.Add('PRO193 - Alteração de percentual de ajuste de 60 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO194', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    memoProcessos.Lines.Add('PRO194 - Alteração de percentual de ajuste de 90 dias');
  }


//  memoProcessos.Lines.Text := memoProcessos.Lines.Text;
  pnMemoProcessos.Visible := memoProcessos.Lines.Count > 0;
  edFaixa.Clear;
  edFiltro.Clear;
  edCasasDecimais.Value := Max(Min(vDadosIni.vEmp.vCasasDecimais, 10), 0);

//  radioConsulta.Enabled := False;
//  if Assigned(produtos) and (not produtos.IsEmpty) then
//    radioConsulta.Enabled := True;
//
//  radioSelecao.Enabled := radioConsulta.Enabled;

  page.ActivePage := tabStart;


{
  rbProdutoConsulta.Enabled := altPreco.ProdutoCriado;
  rbProdutoSelecionado.Enabled := altPreco.ProdutoCriado;
  if rbProdutoConsulta.Enabled then
    rbProdutoConsulta.Checked := true
  else
    rbAlteracao.Checked := True;
  Memo1Click(Sender);

  vDadosIni.vInibeMensPesqPros := 'S';
  if rbProdutoConsulta.Enabled then
  begin
    rbProdutoConsulta.Enabled := vDadosIni.PesqPros('PRO181', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
    if not rbProdutoConsulta.Enabled then
      Memo2.Lines.Add('PRO181 - Alteração de produtos pela Consulta de produtos');
  end;
  rbProdutoSelecionado.Enabled := rbProdutoConsulta.Enabled;

  vDadosIni.vInibeMensPesqPros := 'S';
  rbAlteracao.Enabled := vDadosIni.PesqPros('PRO182', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbAlteracao.Enabled then
    Memo2.Lines.Add('PRO182 - Alteração de preço por Grupo/Item/SubGrupo');

  vDadosIni.vInibeMensPesqPros := 'S';
  rbAjustePreco.Enabled := vDadosIni.PesqPros('PRO183', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbAjustePreco.Enabled then
    Memo2.Lines.Add('PRO183 - Alteração de percentuais de ajuste de preço Grupo/Marca/SubGrupo');

  vDadosIni.vInibeMensPesqPros := 'S';
  ckbEfetuarAlteracaoPreco.Checked := False;
  ckbEfetuarAlteracaoPreco.Enabled := vDadosIni.PesqPros('PRO184', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);

  if not ckbEfetuarAlteracaoPreco.Enabled then
    Memo2.Lines.Add('PRO184 - Alteração de preço utilizando os ajustes de preço');

  vDadosIni.vInibeMensPesqPros := 'S';
  rbAumento.Checked := False;
  rbAumento.Enabled := vDadosIni.PesqPros('PRO186', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbAumento.Enabled then
    Memo2.Lines.Add('PRO186 - Alteração de preço (Aumento)');

  vDadosIni.vInibeMensPesqPros := 'S';
  rbReducao.Checked := False;
  rbReducao.Enabled := vDadosIni.PesqPros('PRO187', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbReducao.Enabled then
    Memo2.Lines.Add('PRO187 - Alteração de preço (Redução)');

  vDadosIni.vInibeMensPesqPros := 'S';
  rbValorFixo.Checked := False;
  rbValorFixo.Enabled := vDadosIni.PesqPros('PRO428', 'HABILITAR', 'HABILITAR RADIOBUTTON', 'PRODUTOS', '', altPreco.buscas, False);
  if not rbValorFixo.Enabled then
    Memo2.Lines.Add('PRO428 - Alteração de preço (Alterar preços de venda para o valor informado)');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO188', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    Memo2.Lines.Add('PRO188 - Alteração de preço A Vista');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO189', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    Memo2.Lines.Add('PRO189 - Alteração de preço de 30 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO190', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    Memo2.Lines.Add('PRO190 - Alteração de preço de 60 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO191', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    Memo2.Lines.Add('PRO191 - Alteração de preço de 90 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO192', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    Memo2.Lines.Add('PRO192 - Alteração de percentual de ajuste de 30 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO193', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    Memo2.Lines.Add('PRO193 - Alteração de percentual de ajuste de 60 dias');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO194', 'HABILITAR', '', 'PRODUTOS', '', altPreco.buscas, False) then
    Memo2.Lines.Add('PRO194 - Alteração de percentual de ajuste de 90 dias');

}
end;

procedure TfrmAlteracaoDePreco.gridProdutosPrecosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Agrid: TDBGrid;
begin
  inherited;

  if not Assigned(Sender) then
    Exit;

  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.IsEmpty then
    Exit;

  if Agrid.DataSource.DataSet.FieldByName('problema').AsString <> '' then
    if (gdFocused in State) then
    begin
      Agrid.Canvas.Brush.Color := clWindow;
      Agrid.Canvas.Font.Color  := clWindowText;
    end
    else
    begin
      Agrid.Canvas.Brush.Color := $00CECEFF;
      Agrid.Canvas.Font.Color  := clWindowText;
    end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmAlteracaoDePreco.gridProdutosPrecosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DELETE) and (not precos.IsEmpty) then
    if ShowConfirmacao('Deseja mesmo remover o item da alteração de preços?') = ID_YES then
      precos.Delete;
end;

procedure TfrmAlteracaoDePreco.GroupBox1Exit(Sender: TObject);
begin
  inherited;
  if GroupBox1.Caption = 'Pesquisa de Produto' then
  begin
    Panel6.Caption := altPreco.existeProduto(Edit1.Text, Edit2.Text);
    if Trim(Panel6.Caption) = '' then
      Panel6.Caption := 'Produto não encontrado';
  end
  else
  begin
    try
      StrToInt(Trim(Edit1.Text));
    except
      Panel6.Caption := Label1.Caption + 'inválido';
      Panel6.Caption := StringReplace(Panel6.Caption, ':', ' ', [rfReplaceAll, rfIgnoreCase]);
      exit;
    end;

    try
      StrToInt(Trim(Edit2.Text));
    except
      Panel6.Caption := Label2.Caption + 'inválido';
      Panel6.Caption := StringReplace(Panel6.Caption, ':', ' ', [rfReplaceAll, rfIgnoreCase]);
      exit;
    end;

    Panel6.Caption := '';

  end;
end;

procedure TfrmAlteracaoDePreco.handleRadiosFaixa;
var
  bTabela, bFaixas: Boolean;
begin
  bFaixas := (radioGrupo.Checked) or (radioSubGrupo.Checked) or (radioMarcas.Checked) or (selecao.IsEmpty) or (not selecao.dataSet.Active);
  bTabela := (not bFaixas) or (selecao.IsEmpty) or (not selecao.dataSet.Active);

  radioGrupo.Enabled := bFaixas;
  radioSubGrupo.Enabled := bFaixas;
  radioMarcas.Enabled := bFaixas;
  radioCidades.Enabled := bTabela;
  radioLocalidades.Enabled := bTabela;
  radioSetores.Enabled := bTabela;
  radioTabelasEPromos.Enabled := bTabela;
end;

procedure TfrmAlteracaoDePreco.LogCalculo(msg: string; percent: Integer);
begin
  if (msg <> '') and (percent = 0) then
  begin
    lbCalculo.Caption := msg;
    pnLogCalculo.Visible := True;
    progressCalculo.min := 0;
    progressCalculo.Max := 100;
    progressCalculo.Position := 0;
    Application.ProcessMessages;
  end
  else if percent >= 100 then
  begin
    pnLogCalculo.Visible := False;
    Exit;
  end
  else
  begin
    if msg <> '' then    
      if lbCalculo.Caption <> msg then
        lbCalculo.Caption := msg;

    if progressCalculo.Position <> percent then
    begin
      progressCalculo.Position := percent;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmAlteracaoDePreco.LogUpdate(msg: string; percent: Integer);
begin
  if (msg <> '') and (percent = 0) then
  begin
    lbLogUpdate.Caption := msg;
    pnLogUpdate.Visible := True;
    progressUpdate.min := 0;
    progressUpdate.Max := 100;
    progressUpdate.Position := 0;
    Application.ProcessMessages;
  end
  else if percent >= 100 then
  begin
    pnLogUpdate.Visible := False;
    Exit;
  end
  else
  begin
    if msg <> '' then
      if lbLogUpdate.Caption <> msg then
        lbLogUpdate.Caption := msg;

    if progressUpdate.Position <> percent then
    begin
      progressUpdate.Position := percent;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmAlteracaoDePreco.Memo1Click(Sender: TObject);
begin
  inherited;
  Memo1.Clear;
  if rbProdutoConsulta.Checked then
  begin
    Memo1.Lines.Add('Esta opção altera o preço do produtos que foram consultados atravéz da tela de cadastro de produtos');
    Memo1.Lines.Add('Caso a tela de cadastro de produtos não esteja aberta esta opção fica desabilitada');
    Memo1.Lines.Add('Caso a consulta feita na tela de cadastro de produtos não tenha registros esta opção fica desabilitada');
  end
  else if rbProdutoSelecionado.Checked then
  begin
    Memo1.Lines.Add('Esta opção altera o preço do produtos que foram consultados atravéz da tela de cadastro de produtos e foram selecionados ( "Ctrl + Clique do Mouse" ou "Pressione Shift e setas para cima e para baixo" )');
    Memo1.Lines.Add('Caso a tela de cadastro de produtos não esteja aberta esta opção fica desabilitada');
    Memo1.Lines.Add('Caso a consulta feita na tela de cadastro de produtos não tenha registros esta opção fica desabilitada');
  end
  else if rbAlteracao.Checked then
  begin
    Memo1.Lines.Add('Esta opção habilita campos de pesquisa para fazer a alteração de preço');
    Memo1.Lines.Add('Esta tela possui alteração de preço por Item ( em valor e percentual ), Grupo, SubGrupo, Localidade, Setor, Cidade, Promoção ou Todos os produtos, por percentual');
  end
  else if rbAjustePreco.Checked then
  begin
    Memo1.Lines.Add('Esta opção habilita campos de pesquisa para fazer a alteração de de percentuais de ajuste de preço');
    Memo1.Lines.Add('Esta tela possui alteração de ajustes por Grupo, SubGrupo ou Marca, por percentual');
    Memo1.Lines.Add('As alterações definem o percentual que será gravado no cadastro do produto. Este percentual é utilizado na entrada de produtos (NF Entrada)');
    Memo1.Lines.Add('O percentual que for definido no campo, será usado para alterar o preço respectivo com base no preço de tabela. Exemplo:');
    Memo1.Lines.Add('Preco de Tabela: 100; Perc de 30 dias: 20%; Perc de 60 dias: 30%; e Perc de 90 Dias: 0%');
    Memo1.Lines.Add('Para os valores maiores que "0" o sistema vai ajustar os preçoes de 30, 60 e 90 dias no momento que a nota fiscal de entrada for confirmada');
    Memo1.Lines.Add('Ficando então: A vista: 100 ; 30 Dias: 120; 60 Dias: 130');
  end;

end;

procedure TfrmAlteracaoDePreco.memoProcessosClick(Sender: TObject);
begin
  inherited;
  memoProcessos.Clear;
  if radioConsulta.Checked then
  begin
    memoProcessos.Lines.Add('Esta opção altera o preço do produtos que foram consultados atravéz da tela de cadastro de produtos');
    memoProcessos.Lines.Add('Caso a tela de cadastro de produtos não esteja aberta esta opção fica desabilitada');
  end
  else if radioSelecao.Checked then
  begin
    memoProcessos.Lines.Add('Esta opção altera o preço do produtos que foram consultados atravéz da tela de cadastro de produtos e foram selecionados ( "Ctrl + Clique do Mouse" ou "Pressione Shift e setas para cima e para baixo" )');
    memoProcessos.Lines.Add('Caso a tela de cadastro de produtos não esteja aberta esta opção fica desabilitada');
  end
  else if radioFaixa.Checked then
  begin
    memoProcessos.Lines.Add('Esta opção permite selecionar produtos por faixa de Grupo, Subgrupo e Marca para alteração de preços, e também');
    memoProcessos.Lines.Add('permite alteração de preços das tabelas Diferenciadas, Cidade, Localidade, Setor, Avulsa e Promocional');
  end;
end;

procedure TfrmAlteracaoDePreco.Panel2Exit(Sender: TObject);
begin
  inherited;

  if not ckbDiferenciado.Checked then
      edDiferenciado.AsValue := 0.0000;
  if not ckbPromocao.Checked then
      edPromocao.AsValue := 0.0000;

  if ((ckbDiferenciado.Checked) or (ckbPromocao.Checked)) then
  begin
    edAvista.Enabled := false;
    ed30Dias.Enabled := false;
    ed60Dias.Enabled := false;
    ed90Dias.Enabled := false;
    edAtacado.Enabled := false;
    edAvista.AsValue := 0.0000;
    ed30Dias.AsValue := 0.0000;
    ed60Dias.AsValue := 0.0000;
    ed90Dias.AsValue := 0.0000;
    edAtacado.AsValue := 0.0000;

    if ckbDiferenciado.Checked then
      edDiferenciado.Enabled := true
    else
      edDiferenciado.Enabled := false;

    if ckbPromocao.Checked then
      edPromocao.Enabled := true
    else
      edPromocao.Enabled := false;

    exit;
  end;

  if rbAjustePreco.Checked then
  begin
    edAvista.Enabled := False;
    edAtacado.Enabled := False;
  end
  else
  begin
    edAvista.Enabled := ckbAvista.Checked;
    edAtacado.Enabled := ckbAtacado.Checked;
  end;

  ed30Dias.Enabled := ckb30Dias.Checked;
  ed60Dias.Enabled := ckb60Dias.Checked;
  ed90Dias.Enabled := ckb90Dias.Checked;
  edDiferenciado.Enabled := ckbDiferenciado.Checked;
  edPromocao.Enabled := ckbPromocao.Checked;

  edAvista.AsValue := edAvista.AsValue;
  ed30Dias.AsValue := ed30Dias.AsValue;
  ed60Dias.AsValue := ed60Dias.AsValue;
  ed90Dias.AsValue := ed90Dias.AsValue;
  edAtacado.AsValue := edAtacado.AsValue;
  edDiferenciado.AsValue := edDiferenciado.AsValue;
  edPromocao.AsValue := edPromocao.AsValue;
end;

procedure TfrmAlteracaoDePreco.pesquisaDiferenciadoAvulso(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PROMOCAO', ' and ((data_ini is null) or (data_fim is null)) and cod_promocao > 0 ', 'Tabela de Preço');
  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
    if TSpeedButton(Sender).Name = 'SpeedButton1' then
      Edit1.Text := vDadosIni.vPesquisa
    else if TSpeedButton(Sender).Name = 'SpeedButton2' then
      Edit2.Text := vDadosIni.vPesquisa;
end;

procedure TfrmAlteracaoDePreco.pesquisaDiferenciadoCidade(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
    if TSpeedButton(Sender).Name = 'SpeedButton1' then
      Edit1.Text := vDadosIni.vPesquisa
    else if TSpeedButton(Sender).Name = 'SpeedButton2' then
      Edit2.Text := vDadosIni.vPesquisa;
end;

procedure TfrmAlteracaoDePreco.pesquisaDiferenciadoLocalidade(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('LOCALIDADE2');

  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
    if TSpeedButton(Sender).Name = 'SpeedButton1' then
      Edit1.Text := vDadosIni.vPesquisa
    else if TSpeedButton(Sender).Name = 'SpeedButton2' then
      Edit2.Text := vDadosIni.vPesquisa;
end;

procedure TfrmAlteracaoDePreco.pesquisaDiferenciadoSetor(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SETOR');

  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
    if TSpeedButton(Sender).Name = 'SpeedButton1' then
      Edit1.Text := vDadosIni.vPesquisa
    else if TSpeedButton(Sender).Name = 'SpeedButton2' then
      Edit2.Text := vDadosIni.vPesquisa;
end;

procedure TfrmAlteracaoDePreco.pesquisaGrupo(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRUPOS');
  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
    if TSpeedButton(Sender).Name = 'SpeedButton1' then
      Edit1.Text := vDadosIni.vPesquisa
    else if TSpeedButton(Sender).Name = 'SpeedButton2' then
      Edit2.Text := vDadosIni.vPesquisa;
end;

procedure TfrmAlteracaoDePreco.pesquisaMarca(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
    if TSpeedButton(Sender).Name = 'SpeedButton1' then
      Edit1.Text := vDadosIni.vPesquisa
    else if TSpeedButton(Sender).Name = 'SpeedButton2' then
      Edit2.Text := vDadosIni.vPesquisa;
end;

procedure TfrmAlteracaoDePreco.pesquisaProduto(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
  begin
    Edit1.Text := vDadosIni.vPesquisaGrupo_prod;
    Edit2.Text := vDadosIni.vPesquisaCod_prod;
  end;
end;

procedure TfrmAlteracaoDePreco.pesquisaPromocao(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PROMOCAO', ' and not ((data_ini is null) or (data_fim is null)) ', 'Promoções');
  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
    if TSpeedButton(Sender).Name = 'SpeedButton1' then
      Edit1.Text := vDadosIni.vPesquisa
    else if TSpeedButton(Sender).Name = 'SpeedButton2' then
      Edit2.Text := vDadosIni.vPesquisa;
end;

procedure TfrmAlteracaoDePreco.pesquisaSubGrupo(Sender: TObject);
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SUB_GRUPO');
  if ((vDadosIni.vPesquisa) <> '') and ((vDadosIni.vPesquisa) <> '0') then
    if TSpeedButton(Sender).Name = 'SpeedButton1' then
      Edit1.Text := vDadosIni.vPesquisa
    else if TSpeedButton(Sender).Name = 'SpeedButton2' then
      Edit2.Text := vDadosIni.vPesquisa;
end;

procedure TfrmAlteracaoDePreco.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := altPreco.dataSet.FieldByName('COD_PROMOCAO').AsInteger <> -1;
end;

procedure TfrmAlteracaoDePreco.QRExpr13Print(sender: TObject;
  var Value: string);
begin
  inherited;
  if ((not altPreco.dataSet.FieldByName('COD_PROMOCAO').IsNull) and (altPreco.dataSet.FieldByName('COD_PROMOCAO').AsInteger = 0)) then
    Value := formatfloat('#0.00', altPreco.dataSet.FieldByName('MAX_DESC').AsFloat);
end;

procedure TfrmAlteracaoDePreco.QRExpr27Print(sender: TObject;
  var Value: string);
begin
  inherited;
  if not altPreco.dataSet.FieldByName('COD_PROMOCAO').IsNull then
  begin
    if altPreco.dataSet.FieldByName('TIPO').AsString = 'P' then
      Value := 'PROMOCAO'
    else 
      Value := altPreco.dataSet.FieldByName('DESCR_TIPO').AsString;
  end;
end;

procedure TfrmAlteracaoDePreco.QRExpr28Print(sender: TObject;
  var Value: string);
begin
  inherited;
  if not altPreco.dataSet.FieldByName('COD_PROMOCAO').IsNull then
    Value := 'R$ ' + formatfloat('#0.00', altPreco.dataSet.FieldByName('VALOR_PROMOCAO').AsFloat);
end;

procedure TfrmAlteracaoDePreco.QRExpr32Print(sender: TObject;
  var Value: string);
begin
  inherited;
  if ((not altPreco.dataSet.FieldByName('COD_PROMOCAO').IsNull) and (altPreco.dataSet.FieldByName('COD_PROMOCAO').AsInteger > 0)) then
    Value := formatfloat('#0.00', altPreco.dataSet.FieldByName('PORCENTAGEM').AsFloat);
end;

procedure TfrmAlteracaoDePreco.QRExpr33Print(sender: TObject;
  var Value: string);
begin
  inherited;
  if not altPreco.dataSet.FieldByName('COD_PROMOCAO').IsNull then
  begin
    if altPreco.dataSet.FieldByName('COD_PROMOCAO').AsInteger > 0 then
      Value := altPreco.dataSet.FieldByName('DESCR_PROMOCAO').AsString
    else if altPreco.dataSet.FieldByName('COD_LOCALIDADE').AsInteger > 0 then
      Value := altPreco.dataSet.FieldByName('LOCALIDADE').AsString
    else if altPreco.dataSet.FieldByName('COD_SETOR').AsInteger > 0 then
      Value := altPreco.dataSet.FieldByName('SETOR').AsString
    else if altPreco.dataSet.FieldByName('COD_CIDADE').AsInteger > 0 then
      Value := altPreco.dataSet.FieldByName('NOME_CIDADE').AsString
  end;
end;

procedure TfrmAlteracaoDePreco.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if not altPreco.dataSet.FieldByName('COD_PROMOCAO').IsNull then
    QRBand2.Height := 18
  else
    QRBand2.Height := 2;
end;

procedure TfrmAlteracaoDePreco.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório Produtos/Preços/Ajustes');
end;

procedure TfrmAlteracaoDePreco.QuickRep2Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, QuickRep2.ReportTitle);
end;

procedure TfrmAlteracaoDePreco.radioFatorClick(Sender: TObject);
var
  fator: FatorAlteracao;
  iPad: Integer;
begin
  inherited;

  if not radioFator.Enabled then
    Exit;

  if radioFator.ItemIndex < 0 then
  begin
    radioForma.Enabled := False;
    Exit;
  end;

  precos.fator := FatorAlteracao(radioFator.ItemIndex);

  if (precos.tabPreco = paPromo) and (precos.fator <> faPreco) then
  begin
    precos.forma := fmSubstituicao;
    radioForma.Enabled := False;
    radioForma.ItemIndex := Ord(precos.forma);
  end
  else
    radioForma.Enabled := True;

  lbCasasDecimais.Visible := precos.fator <> faPreco;
  edCasasDecimais.Visible := precos.fator <> faPreco;

//  iPad := IfThen(precos.fator = faPreco, vDadosIni.vEmp.vCasasDecimais, vDadosIni.vProduto.Precos.DigMrkMrg);
//  edParametro2.FormatSize := '0.' + PadL(0, ipad);
//  edParametro2.FormatSize := '0.4';
  lbParametro2.Caption := radioFator.Items[radioFator.ItemIndex];
  grupoMultiPreco.Caption := lbParametro2.Caption;
end;

procedure TfrmAlteracaoDePreco.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  edDiferenciado.Enabled := false;
  edPromocao.Enabled := false;
  edAvista.Enabled := false;
  ed30Dias.Enabled := false;
  ed60Dias.Enabled := false;
  ed90Dias.Enabled := false;
  edAtacado.Enabled := false;
  edDiferenciado.Text := '               0,00';
  edPromocao.Text := '               0,00';
  edAvista.Text := '               0,00';
  ed30Dias.Text := '               0,00';
  ed60Dias.Text := '               0,00';
  ed90Dias.Text := '               0,00';
  edAtacado.Text := '               0,00';
  Edit1.Text := '';
  Edit2.Text := '';
  ckbDiferenciado.Enabled := true;
  ckbPromocao.Enabled := true;
  ckbAvista.Enabled := true;
  ckb30Dias.Enabled := true;
  ckb60Dias.Enabled := true;
  ckb90Dias.Enabled := true;
  ckbAtacado.Enabled := true;
  ckbDiferenciado.Checked := false;
  ckbPromocao.Checked := false;
  ckbAvista.Checked := false;
  ckb30Dias.Checked := false;
  ckb60Dias.Checked := false;
  ckb90Dias.Checked := false;
  ckbAtacado.Checked := false;
  ckbDiferenciadoProporcional.Enabled := true;
  ckbDiferenciadoProporcional.Checked := false;

  if Pos('ITEM', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0 then
  begin
    GroupBox1.Visible := True;
    GroupBox1.Caption := 'Pesquisa de Produto';
    Label1.Caption := 'Grupo do Produto:';
    Label2.Caption := 'Código do Produto:';
    SpeedButton1.OnClick := pesquisaProduto;
    SpeedButton2.OnClick := pesquisaProduto;
    Label10.Visible := false;
    DBLookupComboBox10.Visible := false;
    Label4.Enabled := false;
    Label9.Enabled := false;
    edDiferenciado.Enabled := false;
    edPromocao.Enabled := false;
    ckbDiferenciado.Enabled := false;
    ckbPromocao.Enabled := false;
  end
  else if Pos('SUBGRUPO', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0 then
  begin
    GroupBox1.Visible := True;
    GroupBox1.Caption := 'Pesquisa por SubGrupo';
    Label1.Caption := 'SubGrupo Inicial:';
    Label2.Caption := 'SubGrupo Final:';
    SpeedButton1.OnClick := pesquisaSubGrupo;
    SpeedButton2.OnClick := pesquisaSubGrupo;
    Label10.Visible := false;
    DBLookupComboBox10.Visible := false;
    Label4.Enabled := true;
    Label9.Enabled := true;
  end
  else if Pos('GRUPO', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0 then
  begin
    GroupBox1.Visible := True;
    GroupBox1.Caption := 'Pesquisa por Grupo';
    Label1.Caption := 'Grupo Inicial:';
    Label2.Caption := 'Grupo Final:';
    SpeedButton1.OnClick := pesquisaGrupo;
    SpeedButton2.OnClick := pesquisaGrupo;
    Label10.Visible := false;
    DBLookupComboBox10.Visible := false;
    Label4.Enabled := true;
    Label9.Enabled := true;
  end
  else if Pos('MARCA', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0 then
  begin
    GroupBox1.Visible := True;
    GroupBox1.Caption := 'Pesquisa por Marca';
    Label1.Caption := 'Marca Inicial:';
    Label2.Caption := 'Marca Final:';
    SpeedButton1.OnClick := pesquisaMarca;
    SpeedButton2.OnClick := pesquisaMarca;
    Label10.Visible := false;
    DBLookupComboBox10.Visible := false;
    Label4.Enabled := true;
    Label9.Enabled := true;
  end
  else if (Pos('DIFERENCIADA', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0)
  	or (Pos('DIFERENCIADO', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0)
  	or (Pos('Diferenciada', RadioGroup1.Items[RadioGroup1.ItemIndex]) > 0)
    or (Pos('Diferenciado', RadioGroup1.Items[RadioGroup1.ItemIndex]) > 0) then
  begin
    GroupBox1.Visible := True;
    GroupBox1.Caption := 'Pesquisa por Tipo';
    Label1.Caption := 'Tipo Inicial:';
    Label2.Caption := 'Tipo Final:';
    if DBLookupComboBox10.Text = 'LOCALIDADE' then
    begin
      Label1.Caption := 'Localidade Inicial:';
      Label2.Caption := 'Localidade Final:';
      SpeedButton1.OnClick := pesquisaDiferenciadoLocalidade;
      SpeedButton2.OnClick := pesquisaDiferenciadoLocalidade;
    end
    else if DBLookupComboBox10.Text = 'SETOR' then
    begin
      Label1.Caption := 'Setor Inicial:';
      Label2.Caption := 'Setor Final:';
      SpeedButton1.OnClick := pesquisaDiferenciadoSetor;
      SpeedButton2.OnClick := pesquisaDiferenciadoSetor;
    end
    else if DBLookupComboBox10.Text = 'CIDADE' then
    begin
      Label1.Caption := 'Cidade Inicial:';
      Label2.Caption := 'Cidade Final:';
      SpeedButton1.OnClick := pesquisaDiferenciadoCidade;
      SpeedButton2.OnClick := pesquisaDiferenciadoCidade;
    end
    else if DBLookupComboBox10.Text = 'AVULSO' then
    begin
      Label1.Caption := 'Avulso Inicial:';
      Label2.Caption := 'Avulso Final:';
      SpeedButton1.OnClick := pesquisaDiferenciadoAvulso;
      SpeedButton2.OnClick := pesquisaDiferenciadoAvulso;
    end;
    Label10.Visible := true;
    DBLookupComboBox10.Visible := true;
    Label4.Enabled := true;
    Label9.Enabled := true;
    ckbAvista.Enabled := false;
    ckb30Dias.Enabled := false;
    ckb60Dias.Enabled := false;
    ckb90Dias.Enabled := false;
    ckbAtacado.Enabled := false;
    ckbDiferenciadoProporcional.Enabled := False;
  end
  else if (Pos('PROMOÇÃO', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0)
  	or (Pos('Promoção', RadioGroup1.Items[RadioGroup1.ItemIndex]) > 0) then
  begin
    GroupBox1.Visible := True;
    GroupBox1.Caption := 'Pesquisa por Promocao';
    Label1.Caption := 'Promocao Inicial:';
    Label2.Caption := 'Promocao Final:';
    SpeedButton1.OnClick := pesquisaPromocao;
    SpeedButton2.OnClick := pesquisaPromocao;
    Label10.Visible := false;
    DBLookupComboBox10.Visible := false;
    Label4.Enabled := true;
    Label9.Enabled := true;
    ckbAvista.Enabled := false;
    ckb30Dias.Enabled := false;
    ckb60Dias.Enabled := false;
    ckb90Dias.Enabled := false;
    ckbAtacado.Enabled := false;
    ckbDiferenciadoProporcional.Enabled := False;
  end
  else if Pos('TODOS', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0 then
  begin
    GroupBox1.Visible := False;
    Label10.Visible := false;
    DBLookupComboBox10.Visible := false;
    Label4.Enabled := true;
    Label9.Enabled := true;
    ckbDiferenciado.Enabled := true;
    ckbPromocao.Enabled := true
  end;

  if Pos('PERCENTUAL', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0 then
  begin
    GroupBox3.Caption := 'Percentual';
    edAvista.FormatSize := '0.4';
    ed30Dias.FormatSize := '0.4';
    ed60Dias.FormatSize := '0.4';
    ed90Dias.FormatSize := '0.4';
    edAtacado.FormatSize := '0.4';
    edDiferenciado.FormatSize := '0.4';
    edPromocao.FormatSize := '0.4';
    Label4.Enabled := true;
    Label9.Enabled := true;
    ckbDiferenciado.Enabled := true;
    ckbPromocao.Enabled := true;

    if Pos('DIFERENCIADO', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0 then
      ckbPromocao.Enabled := false;

    if Pos('PROMOCAO', UpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex])) > 0 then
      ckbDiferenciado.Enabled := false;

  end
  else
  begin
    GroupBox3.Caption := 'Valor';
    edAvista.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    ed30Dias.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    ed60Dias.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    ed90Dias.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    edAtacado.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    edDiferenciado.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    edPromocao.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  end;

end;

procedure TfrmAlteracaoDePreco.radioGrupoClick(Sender: TObject);
var
  str: string;
begin
  inherited;
  if Sender is TRadioButton then
    if (Sender as TRadioButton).Checked then
    begin
      str := UpperCase((Sender as TRadioButton).Caption);
      if str = 'SETORES' then
        str := TB_SETOR
      else if ContainsText(str, 'TABELA') then
        str := TB_TABELA
      else
        str := Copy(str, 1, Length(str) - 1);

      Screen.Cursor := crHourGlass;
      try
        faixas.tipo := str;
      finally
        Screen.Cursor := crDefault;
      end;
      edFiltro.Clear;
      //faixas.filterClear;
      gridFiltro.DataSource := faixas._dataSourceOOP;

      if selecao.tipo = '' then
      begin
        selecao.tipo := 'SELECAO';
        gridSelecao.DataSource := selecao._dataSourceOOP;
      end;

      handleRadiosFaixa;
    end;

end;

procedure TfrmAlteracaoDePreco.radioTabelaPrecoClick(Sender: TObject);
begin
  inherited;

//  if not radioTabelaPreco.Enabled then
//    Exit;

  if radioTabelaPreco.ItemIndex < 0 then
  begin
    radioFator.Enabled := False;
    radioForma.Enabled := False;
    radioFator.ItemIndex := -1;
    radioForma.ItemIndex := -1;
    Exit;
  end;

  precos.tabPreco := TabelaPrecoAlt(radioTabelaPreco.ItemIndex);

  if (precos.tabPreco in [pa30dias, pa60dias, pa90dias, paTabPromo]) and(radioFator.Items.Count = 3) then
    radioFator.Items.Add('% Adicional')
  else if (not (precos.tabPreco in [pa30dias, pa60dias, pa90dias, paTabPromo])) and (radioFator.Items.Count = 4) then
    radioFator.Items.Delete(3);

  if radioFator.Items.Count = 4 then
    radioFator.Items[3] := IfThen(precos.tabPreco = paTabPromo, 'Percentual', '% Adicional');  

  radioFator.Enabled := True;
  radioForma.Enabled := radioFator.ItemIndex >= 0;

  if radioFator.ItemIndex >= 0 then
  begin
    precos.fator := FatorAlteracao(radioFator.ItemIndex);
    lbParametro2.Caption := radioFator.Items[radioFator.ItemIndex];
  end;

  lbCasasDecimais.Visible := precos.fator <> faPreco;
  edCasasDecimais.Visible := precos.fator <> faPreco;

  if (precos.tabPreco = paPromo) and (precos.fator <> faPreco) then
  begin
    precos.forma := fmSubstituicao;
    radioForma.Enabled := False;
    radioForma.ItemIndex := Ord(precos.forma);
  end
  else
    radioForma.Enabled := True;
end;

procedure TfrmAlteracaoDePreco.rbAumentoClick(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to RadioGroup1.Items.Count - 1 do
  	if (I > 0) or (rbProdutoConsulta.Checked) or (rbProdutoSelecionado.Checked) then
    	if (Pos('Preço', RadioGroup1.Items[I]) > 0) then
    		RadioGroup1.Items[I] := StringReplace(RadioGroup1.Items[I], 'Preço', 'Percentual', [rfReplaceAll]);
end;

procedure TfrmAlteracaoDePreco.rbReducaoClick(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to RadioGroup1.Items.Count - 1 do
  	if (I > 0) or (rbProdutoConsulta.Checked) or (rbProdutoSelecionado.Checked) then
    	if (Pos('Preço', RadioGroup1.Items[I]) > 0) then
    		RadioGroup1.Items[I] := StringReplace(RadioGroup1.Items[I], 'Preço', 'Percentual', [rfReplaceAll]);
end;

procedure TfrmAlteracaoDePreco.rbValorFixoClick(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to RadioGroup1.Items.Count - 1 do
  	if (I > 0) or (rbProdutoConsulta.Checked) or (rbProdutoSelecionado.Checked) then
    	if (Pos('Percentual', RadioGroup1.Items[I]) > 0) then
    		RadioGroup1.Items[I] := StringReplace(RadioGroup1.Items[I], 'Percentual', 'Preço', [rfReplaceAll]);
end;

procedure TfrmAlteracaoDePreco.Removeritenscomavisos1Click(Sender: TObject);
begin
  inherited;
  if ShowConfirmacao('Essa opção irá remover apenas os itens com avisos.' + sLineBreak + sLineBreak +
                     'Para remover apenas 1 item basta pressionar a tecla delete sobre o item' + sLineBreak + sLineBreak +
                     'Deseja remover mesmo os itens com avisos dessa lista?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> ID_YES then
    Exit;

  precos.prepare_loop('problema <> ''''');;
  try
    while not precos.IsEmpty do
      precos.Delete;

  finally
    precos.prepare_loop_done;
  end;
end;

procedure TfrmAlteracaoDePreco.Removertodos1Click(Sender: TObject);
begin
  inherited;
  if ShowConfirmacao('Essa opção irá remover todos os itens da lista.' + sLineBreak + sLineBreak +
                     'Para remover apenas 1 item basta pressionar a tecla delete sobre o item' + sLineBreak + sLineBreak +
                     'Deseja remover mesmo todos os itens dessa lista?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> ID_YES then
    Exit;

  precos.dataSet.EmptyDataSet;
//  while not precos.IsEmpty do
//    precos.Delete;

end;

procedure TfrmAlteracaoDePreco.SpeedButton3Click(Sender: TObject);
var
  listVig, listHifen, listIds: TStrings;
  I, iStarts, iEnds: Integer;
begin
  inherited;

  if not faixas.dataSet.Active then
    Exit;

  listVig := NewStringList(edFaixa.Text, ',');
  listHifen := NewStringList(True, '', '-');
  listIds := NewStringList('', ',');

  for I := 0 to listVig.Count - 1 do
  begin
    listHifen.Text := listVig[I];

    //for J := 0 to listHifen.Count - 1 do
    if listHifen.Count = 1 then
      listIds.Add(OnlyNumber(listHifen[0]))
    else
    if listHifen.Count > 1 then
    begin
      iStarts := StrToInt(OnlyNumber(listHifen[0]));
      iEnds := StrToInt(OnlyNumber(listHifen[listHifen.Count - 1]));
      while iStarts <= iEnds do
      begin
        listIds.Add(IntToStr(iStarts));
        iStarts := iStarts + 1;
      end;
    end;
  end;

  selecao.prepare_loop();
  faixas.prepare_loop('tipo = ' + QuotedStr(faixas.tipo), [ol_storeRecno, ol_storeFilter, ol_disableControls, ol_go_first]);
  try

    for I := 0 to listIds.Count - 1 do
      if not faixas.filterStr('tipo = ''%s'' and id = %s', [faixas.tipo, listIds[I]]).IsEmpty then
        selecao.Add(StrToInt(listIds[I]), faixas.fstr('tipo'), faixas.fstr('name'));

  finally
    selecao.prepare_loop_done;
    faixas.prepare_loop_done;

    handleRadiosFaixa;

//    faixas.tipo := faixas.tipo;
  end;
end;

procedure TfrmAlteracaoDePreco.SpeedButton4Click(Sender: TObject);
var
  id: Integer;
  name, tipo: string;
begin
  inherited;
  if not faixas.dataSet.Active then
    Exit;

  id := faixas.fint('id');
  name := faixas.fstr('name');
  tipo := faixas.fstr('tipo');

//  faixas.storeRecNo;
  selecao.prepare_loop();
  faixas.prepare_loop('tipo = ' + QuotedStr(faixas.tipo) + ' and sel = ''S''', [ol_storeRecno, ol_storeFilter, ol_disableControls, ol_go_first]);
  try

    if faixas.IsEmpty then
    begin
      selecao.Add(id, tipo, name);
      Exit;
    end;

    while not faixas.Eof do
    begin
      selecao.Add(faixas.fint('id'), faixas.fstr('tipo'), faixas.fstr('name'));
      faixas.Next;
    end;

  finally
    faixas.prepare_loop_done;
    selecao.prepare_loop_done();

    handleRadiosFaixa;

//    faixas.tipo := faixas.tipo;
//    faixas.restoreRecNo;
  end;
end;

procedure TfrmAlteracaoDePreco.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    selecao.CheckUnCheckAllRows(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAlteracaoDePreco.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    selecao.CheckUnCheckAllRows(True);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAlteracaoDePreco.SpeedButton7Click(Sender: TObject);
var
  id: Integer;
  name, tipo: string;
begin
  inherited;

  if (not selecao.dataSet.Active) or selecao.IsEmpty then
    Exit;

  id := selecao.fint('id');
  name := selecao.fstr('name');
  tipo := selecao.fstr('tipo');

  selecao.prepare_loop('sel = ''S''');
  try

    if selecao.IsEmpty then
      selecao.filterStr('id = %d and name = ''%s'' and tipo = ''%s''', [id, name, tipo]);

    while not selecao.IsEmpty do
      selecao.Delete;

  finally
    selecao.prepare_loop_done;

    handleRadiosFaixa;
  end;
end;

procedure TfrmAlteracaoDePreco.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  popDelete.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmAlteracaoDePreco.switchPrecoBtnClick(Sender: TObject);
begin
  inherited;
  grupoMultiPreco.Left := radioTabelaPreco.Left;
  grupoMultiPreco.Top := radioTabelaPreco.Top;
  grupoMultiPreco.TabOrder := 0;

  radioTabelaPreco.ItemIndex := IfThen(radioTabelaPreco.ItemIndex >= 0, radioTabelaPreco.ItemIndex);
  radioTabelaPreco.Visible := not radioTabelaPreco.Visible;//(Sender = switchPrecoBtn);
  grupoMultiPreco.Visible := not radioTabelaPreco.Visible;
  grupoMultiPreco.Caption := 'Campo preço';
  edParametro2.Enabled := not grupoMultiPreco.Visible;

  radioFator.ItemIndex := IfThen(grupoMultiPreco.Visible, Ord(faPreco) ,radioFator.ItemIndex);
  radioFator.Enabled := not grupoMultiPreco.Visible;

  if (radioForma.Items.Count = 3) and grupoMultiPreco.Visible then
  begin
    radioForma.Items[1] := 'Aumento em R$';
    radioForma.Items[2] := 'Redução em R$';
    radioForma.Items.Add('Aumento em %');
    radioForma.Items.Add('Redução em %');
  end
  else
  if (radioForma.Items.Count = 5) and (not grupoMultiPreco.Visible) then
  begin
    radioForma.Items[1] := 'Aumento';
    radioForma.Items[2] := 'Redução';
    radioForma.Items.Delete(4);
    radioForma.Items.Delete(3);
  end;

  ckMultPromocaoClick(nil);
  ckMult90diasClick(nil);
  ckMult60diasClick(nil);
  ckMult30diasClick(nil);
  ckMultAtacadoClick(nil);
  ckMultVarejoClick(nil);
end;

{ TFaixasOOP }

procedure TFaixasOOP.Add(id: Integer; atipo, name: string);
begin

  Self.filterStr('tipo = ' + QuotedStr(atipo) + ' and id = ' + IntToStr(id));
  if not Self.IsEmpty then
    Exit;           

  Self.Insert;
  Self.dataSet.FieldByName('id').AsInteger := id;
  Self.dataSet.FieldByName('tipo').AsString := atipo;
  Self.dataSet.FieldByName('name').AsString := name;
  Self.Post;
end;

constructor TFaixasOOP.Create();
begin
  inherited Create(dtmAtivo.bancoHw);
  Ftipo := '';
end;

function TFaixasOOP.GetFaixas(aTipo: string): TFaixasClass;
var
  item: TFaixaClass;
begin
  SetLength(Result, 0);

  prepare_loop('tipo = ' + QuotedStr(aTipo));
  try
    while not dataSet.Eof do
    begin
      item := TFaixaClass.Create;
      item.id := fint('id');
      item.name := fstr('name');
      item.tipo := aTipo;

      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := item;

      dataSet.Next;
    end;

  finally
    prepare_loop_done;
  end;
end;

procedure TFaixasOOP.SetTipo(const Value: string);
begin

  if Value = 'SELECAO' then // apenas para retornar um dataset vazio
    ClientOpen('select ''N'' sel, cast('''' as varchar(128)) name, cast('''' as varchar(16 )) tipo, 0 id' +
               ' from rdb$database db where 1 = 0')

  else if Ftipo = '' then
    ClientOpen('select distinct '' '' sel, c.* from (' +
               ' select g.descricao name, g.codigo_grup id, ' + QuotedStr(TB_GRUPO) + ' tipo from grupos g' +
               ' where g.ativo = 1 and g.codigo_grup > 0' +
               ' union all' +
               ' select s.descricao name, s.codigo_subgr id, ' + QuotedStr(TB_SUBGRUPO) + ' tipo from sub_grupo s' +
               ' where s.ativo = 1 and s.codigo_subgr > 0' +
               ' union all' +
               ' select m.descricao_marca name, m.cod_marca id, ' + QuotedStr(TB_MARCA) + ' tipo from marca_prod m' +
               ' where m.ativo = 1 and m.cod_marca > 0 and coalesce(m.tipo_marca, '''') <> ''V''' +
               ' union all' +
               ' select c.nome_cidade name, c.cod_cidade id, ' + QuotedStr(TB_CIDADE) + ' tipo from cidades c' +
               ' where c.ativo = 1 and c.cod_cidade > 0' +
               ' union all' +
               ' select l.localidade name, l.cod_localidade id, ' + QuotedStr(TB_LOCALIDADE) + ' tipo from localidade l' +
               ' where l.ativo = 1 and l.cod_localidade > 0' +
               ' union all' +
               ' select st.setor name, st.cod_setor id, ' + QuotedStr(TB_SETOR) + ' tipo from setor st' +
               ' where st.ativo = 1 and st.cod_setor > 0' +
               ' union all' +
               ' select t.descr_promocao || iif(t.cod_tppreco = 1, '' [PROMO]'', '' [AVULSA]'') name, t.cod_promocao id, ' + QuotedStr(TB_TABELA) + ' tipo ' +
               ' from promocao t' +
               ' where t.cod_empresa = ' + vDadosIni.codEmpresa +  ' and t.ativo = 1 and t.cod_promocao > 0) as c ' +
               'order by c.tipo, c.name');

  Ftipo := Value;

  if tipo <> 'SELECAO' then
//    filterStr('tipo = ' + QuotedStr(Ftipo))
//  else
    filterStr('tipo = ' + QuotedStr(Ftipo));

  IndexFieldNames := 'TIPO;NAME';
end;

{ TPrecosOOP }

function TPrecosOOP.ApplicarPrecos: Boolean;
var
  eFator: FatorAlteracao;
  eTabela: TabelaPrecoAlt;
  eForma: FormaAlteracao;
  dMarkup, dValue: Double;
  sFieldsUpdate, sMarkup, sPrice, sFieldPrice, sFieldMarkup, sItem, sField, sValue: string;
  hasPercent: Boolean;
begin
  stop := False;
  Self.prepare_loop('problema = ''''');
  if Assigned(FOnApply) then
    FOnApply('Aplicando preços', 0);
  try
    try

      while not dataSet.Eof do
      begin
        if stop then
          Exit;

  //  FatorAlteracao = (faPreco, faMarkup, faMargem, faPercAdicionalOuPromo);
  //  FormaAlteracao = (fmSubstituicao, fmAumento, fmReducao);
  //  TabelaPrecoAlt = (paVarejo, paAtacado, pa30dias, pa60dias, pa90dias, paPromo, paTabPromo, paCidade, paLocalidade, paSetor, paAvulsa);

        sItem        := Format('[%s] [%s-%s] - [%s] ', [fstr('tabname'), fstr('grupo_prod'), fstr('cod_prod'), fstr('descr_prod')]);
        eFator       := FatorAlteracao(fint('fator'));
        eForma       := FormaAlteracao(fint('forma'));
        eTabela      := TabelaPrecoAlt(fint('tabPreco'));
        sMarkup      := '';
        sPrice       := ffloat_fb('preco');
        sFieldPrice  := GetFieldFator(faPreco, eTabela);
        sFieldMarkup := GetFieldFator(faMarkup, eTabela);

        case etabela of
          paVarejo, paAtacado,
          pa30dias, pa60dias, pa90dias,
          paPromo:
            begin

              // teste para deixar zerar o percentual adicional
              if (eFator = faPercAdicionalOuPromo) and
                 (eTabela in [pa30dias, pa60dias, pa90dias]) and
                 (ffloat('percent') = 0) then
                sPrice := sFieldPrice;

              if vDadosIni.vProduto.Precos.ManterPrecoMarkupProporcional and
                 (not (eFator in [faMarkup, faMargem])) and
                 (sFieldMarkup <> '') and
                 (ffloat('custo') > 0) and
                 (ffloat('preco', -2) > 0) and
                 (sPrice <> sFieldPrice) then
              begin
                sMarkup := Format(', %s = ((%s / prec_cusm_prod - 1) * 100)', [sFieldMarkup, ffloat_fb('preco')]);

              end;

              SqlExec('update produtos set rep_int_active = 1, %s = %s' +
                      IfThen( (eFator <> faPreco) and (GetFieldFator(eFator, eTabela) <> ''),
                              Format(', %s = %s', [GetFieldFator(eFator, eTabela), ffloat_fb('percent')]) )+
                              sMarkup +
                      ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d',
                      [sFieldPrice, sPrice, fint('grupo_prod'), fstrq('cod_prod'), vDadosIni.cod_empresa]);
            end;

          paCidade, paLocalidade, paSetor, paAvulsa:
            begin
              if fint('tabid') = 0 then
                raise Exception.Create('TabPreco sem tabid');

              if fequals('tipoTabela', 'PROMOCAO') then
              begin
                if SqlScalar('select prec_tab_prod from produtos' +
                             ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d',
                             [fint('grupo_prod'), fstrq('cod_prod'), vDadosIni.cod_empresa]).AsFloat <
                             ffloat('preco') then
                  raiseExceptionCreate(sItem + 'Preço promocional com valor maior que o preço Varejo');
              end;

              // teste para deixar zerar o markup
              if (eFator in [faMarkup, faMargem]) and
                 (ffloat('percent') = 0) then
                sPrice := sFieldPrice;

              dMarkup := 0;
              if (not (eFator in [faMarkup, faMargem])) and
                 (sFieldMarkup <> '') and
                 (ffloat('preco', -2) > 0) then
              begin
                dValue := SqlScalar('select prec_cusm_prod from produtos' +
                                    ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d',
                                    [fint('grupo_prod'), fstrq('cod_prod'), vDadosIni.cod_empresa]).AsFloat;

                if dValue > 0 then
                begin
                  dValue := CalcUtils.Markup(ffloat('preco'), dValue, DIGROUNDMAX);
                  dMarkup := dValue;

                  sMarkup := Format(', %s = iif(coalesce(%s, 0) > 0, %s, 0)', [sFieldMarkup, sFieldMarkup, ffloat_fb(dValue)]);
                end;

              end;

              if (fequals('tipoTabela', 'PROMOCAO') and (eForma = fmSubstituicao) and (eFator = faPercAdicionalOuPromo))
                or (fequals('tipoTabela', 'PROMOCAO') and (eForma <> fmSubstituicao) and (ffloat('tab_percent') > 0))then
              begin
                sFieldsUpdate := Format('valor_promocao = 0, markup = 0, porcentagem = %s', [ffloat_fb('percent')]);
              end
              else //if (fequals('tipoTabela', 'PROMOCAO') and (eForma = fmSubstituicao) and (eFator <> faPercAdicionalOuPromo))
                //or (fequals('tipoTabela', 'PROMOCAO') and (eForma <> fmSubstituicao) and (ffloat('tab_percent') = 0))then
              begin

                if (eFator in [faMarkup, faMargem]) and (ffloat('percent') = 0) then
                begin
                  sPrice := 'valor_promocao';
                  sMarkup := '0';
                end
                else
                begin
                  sPrice := ffloat_fb('preco');
                  if (eForma = fmSubstituicao) and (eFator in [faMarkup, faMargem]) then
                    sMarkup := ffloat_fb('percent')
                  else if (eFator in [faMarkup, faMargem]) then
                    sMarkup := Format('iif(coalesce(markup, 0) > 0, %s, 0)', [ffloat_fb('percent')])
                  else
                    sMarkup := Format('iif(coalesce(markup, 0) > 0, %s, 0)', [ffloat_fb(dMarkup)]);
                end;

                sFieldsUpdate := Format('valor_promocao = %s, markup = %s, porcentagem = 0', [sPrice, sMarkup]);
              end;

              SqlExec('update promocao_produto set ' +   sFieldsUpdate +
                      ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d' +
                      IfThen(etabela = paLocalidade, ' and cod_promocao = 0 and cod_localidade = %d') +
                      IfThen(etabela = paSetor     , ' and cod_promocao = 0 and cod_setor = %d') +
                      IfThen(etabela = paCidade    , ' and cod_promocao = 0 and cod_cidade = %d')+
                      IfThen(etabela = paAvulsa    , ' and cod_promocao = %d and cod_localidade = 0 and cod_setor = 0 and cod_cidade = 0'),
                      [fint('grupo_prod'), fstrq('cod_prod'), vDadosIni.cod_empresa,
                       fint('tabid')]);
            end;

          else
            raise Exception.Create('TabPreco incompativel');
        end;

        dataSet.Next;

        if Assigned(FOnApply) then
          FOnApply('', Trunc(dataSet.RecNo / dataSet.RecordCount * 100));

      end;

      transacao.Commit;

      Result := True;

      dataSet.EmptyDataSet;

      vDadosIni.GravaAuditoria(Self.processo, 'CONFIRMACAO', 'SUCESSO', 'PRODUTOS', '', Self.buscas);

    except on E: Exception do
      begin
        Result := False;
        if transacao.InTransaction then
          transacao.Rollback;
        registraErro('TPrecosOOP.ApplicarPrecos ' + e.Message);
        ShowErro('Preços não foram alterados' + sLineBreak + sLineBreak +
                 'Erro:' + sLineBreak + e.Message);
      end;
    end;

  finally
    if transacao.InTransaction then
      transacao.Rollback;

    stop := False;
    Self.prepare_loop_done;
    if Assigned(FOnApply) then
      FOnApply('', 100);
  end;
end;

procedure TPrecosOOP.CalculaPrecos(payload: TProdPrecoList);
  function EnumPrecoAlteracaoToStr(enumValue: TabelaPrecoAlt): string;
  begin
    case enumValue of
      paVarejo    : Result := 'VAREJO';
      paAtacado   : Result := 'ATACADO';
      pa30dias    : Result := '30 DIAS';
      pa60dias    : Result := '60 DIAS';
      pa90dias    : Result := '90 DIAS';
      paPromo     : Result := 'PROMOCAO';
      else
        Result := payload.tipo;
    end;
  end;

  function EnumPrecoAlteracaoFinal(enumValue: TabelaPrecoAlt) : TabelaPrecoAlt;
  begin
    case enumValue of
      paTabPromo:
        begin
          if payload.tipo = TB_CIDADE then
            Result := paCidade
          else if payload.tipo = TB_LOCALIDADE then
            Result := paLocalidade
          else if payload.tipo = TB_SETOR then
            Result := paSetor
          else if payload.tipo = TB_TABELA then
            Result := paAvulsa
          else
            raise Exception.Create('Enum TabelaPrecoAlt inválido');
        end;
      else
        Result := enumValue;
    end;
  end;
  
var
  I: Integer;
  item: TProdPreco;
  dValue, dPreco, dPercent: Double;
  sProblema, sFator, tabelaPreco, msg: string;
begin

  if not Self.dataSet.Active then
  begin
    ClientOpen('select p.grupo_prod, p.cod_prod, p.descr_prod, p.prec_tab_prod preco, p.num_fab_prod tipo,' +
               ' p.grupo_prod tabPreco, 0 fator, 0 forma, p.grupo_prod tabid, p.descr_prod msg, p.md5 tabName,' +
               ' p.prec_cusm_prod custo, p.prec_tab_prod percent, p.md5 tipoTabela, p.descr_prod problema,' +
               ' p.prec_tab_prod tab_valor, p.prec_tab_prod tab_percent' +
               ' from rdb$database r' +
               ' inner join produtos p on p.grupo_prod = 0 and p.cod_prod = ''0'' and p.cod_empresa = 0 and 1 = 0' +
               ' where 1 = 0');
    Self.ffDisplayFormat('preco'  , DisplayNumber(vDadosIni.vEmp.vCasasDecimais));
//    Self.ffDisplayFormat('percent', DisplayNumber(vDadosIni.vProduto.Precos.DigMrkMrg));
    IndexFieldNames := 'DESCR_PROD;TIPO';
  end;

  stop := False;
  Self.prepare_loop([ol_storeRecno, ol_storeFilter, ol_disableControls, ol_go_first]);
  if Assigned(FOnCalculo) then
    FOnCalculo('Calculando preços', 0);
  try
    for I := 0 to payload.Count - 1 do
    begin
      if stop then
        Exit;

      item := payload.Items[I];
      msg := '';
      dValue := 0;
      sFator := IfThen(fator = faPreco        , 'Preço') +
                IfThen(fator = faMarkup       , 'Markup') +
                IfThen(fator = faMargem       , 'Margem') +
                IfThen((fator = faPercAdicionalOuPromo) and (tabPreco =  paTabPromo), 'Percentual') +
                IfThen((fator = faPercAdicionalOuPromo) and (tabPreco <> paTabPromo), 'Perc.Adicional');

      //  FatorAlteracao = (faPreco, faMarkup, faMargem, faPercAdicionalOuPromo);
      //  FormaAlteracao = (fmSubstituicao, fmAumento, fmReducao);
      //  PrecoAlteracao = (paVarejo, paAtacado, pa30dias, pa60dias, pa90dias, paPromo, paCidade, paLocalidade, paSetor, paTabPromo);

      case forma of
        fmSubstituicao:
          begin
            dValue := payload.parametro;
            msg := StrNumber(item.fatorValue, 3) + ' > ' + StrNumber(dValue, 3) + ' | Substituição';
          end;

        fmAumento:
          begin
            dValue := item.fatorValue + payload.parametro;
            //item.parametro := item.parametro + payload.parametro;
            msg := StrNumber(item.fatorValue, 3) + ' > ' + StrNumber(dValue, 3) + ' | Aumento';
          end;

        fmReducao:
          begin
            dValue := item.fatorValue - payload.parametro;
            //item.parametro := item.parametro - payload.parametro;
            msg := StrNumber(item.fatorValue, 3) + ' > ' + StrNumber(dValue, 3) + ' | Redução';
          end;

        fmAumentoPerc:
          begin
            dValue := item.fatorValue * (1 + (payload.parametro / 100));
            msg := StrNumber(item.fatorValue, 3) + ' > ' + StrNumber(dValue, 3) + ' | Aumento';
          end;

        fmReducaoPerc:
          begin
            dValue := item.fatorValue * (1 - (payload.parametro / 100));
            msg := StrNumber(item.fatorValue, 3) + ' > ' + StrNumber(dValue, 3) + ' | Redução';
          end;

      end;

      case fator of
        faPreco:
          begin
            dPreco   := dValue;
            dPercent := 0;
          end;

        faMarkup:
          begin
            dPreco := CalcUtils.Preco(item.custo, dValue, DIGROUNDMAX);
            dPercent := dValue;
          end;

        faMargem:
          begin
            dPercent := CalcUtils.Markup(dValue, DIGROUNDMAX);
            dPreco := CalcUtils.Preco(item.custo, dPercent, DIGROUNDMAX);
            if dValue < 0 then
              dPercent := dValue; // Apenas para apresentar o problema logo abaixo 
          end;

        faPercAdicionalOuPromo:
          begin
            // talvez procurar o preço de tabela ao objeto Self
            if item.tipoTabela = 'PROMOCAO' then
            begin
              dPreco := item.precovarejo * ( 1 - (dValue / 100));
              dPercent := dValue;
            end
            else
            begin
              dPreco := item.precovarejo * ( 1 + (dValue / 100));
              dPercent := dValue;
            end;
          end;

      end;

      msg := msg + ' | ' + sFator;

      tabelaPreco := EnumPrecoAlteracaoToStr(tabPreco);

      filterStr('tipo = ''%s'' and grupo_prod = %d and cod_prod = ''%s'' and tabid = %d',
                [tabelaPreco, item.grupo, item.codigo, item.tabId]);

      if not dataSet.IsEmpty then
        dataSet.Edit
      else
      begin
        dataSet.Insert;
        dataSet.FieldByName('grupo_prod').AsInteger := item.grupo;
        dataSet.FieldByName('cod_prod').AsString := item.codigo;
        dataSet.FieldByName('tipo').AsString := tabelaPreco;
        dataSet.FieldByName('tabid').AsInteger := item.tabId;
      end;

      if item.tabName <> '' then
        tabelaPreco := item.tabName;//Format('%s - [%s]', [item.tabName, item.tipoTabela]);

//      tabelaPreco := IfThen(item.tipoTabela <> '', item.tipoTabela, tabelaPreco);

      dataSet.FieldByName('tabName').AsString := tabelaPreco;
      dataSet.FieldByName('descr_prod').AsString := item.descricao;
      dataSet.FieldByName('custo').AsFloat := item.custo;
      dataSet.FieldByName('preco').AsFloat := RoundTo(dPreco, 0 - Fdecimais);
      dataSet.FieldByName('percent').AsFloat := dPercent;
      dataSet.FieldByName('msg').AsString := msg;
      dataSet.FieldByName('fator').AsInteger := Ord(Self.fator);
      dataSet.FieldByName('forma').AsInteger := Ord(Self.forma);
      dataSet.FieldByName('tabPreco').AsInteger := Ord(EnumPrecoAlteracaoFinal(Self.tabPreco));
      dataSet.FieldByName('tipotabela').AsString := item.tipoTabela;
      dataSet.FieldByName('tab_valor').AsFloat := item.tabDifValor;
      dataSet.FieldByName('tab_percent').AsFloat := item.tabDifPerc;

      sProblema := '';
      if item.tipoTabela = 'PROMOCAO' then
        if ffloat('preco') > item.precovarejo then
          sProblema := Format('Preço maior que o preço Varejo %n', [item.precovarejo]);

      if (fator in [faMarkup, faMargem]) and (item.custo <= 0) then
        sProblema := 'Custo zero não é possível usar ' + sFator     

      else if (fator = faPercAdicionalOuPromo ) and
              (item.tabDifMkt > 0)  then
        sProblema := 'Markup/Margem preenchido na tabela de preço, manutenção em percentual não pode ser realizada'

      else if (forma in [fmAumento, fmReducao, fmAumentoPerc, fmReducaoPerc]) and (item.fatorValue <= 0)
        and (fator in [faMarkup, faMargem])
        and (MatchText(item.tipoTabela, ['LOCALIDADE', 'SETOR', 'CIDADE', 'AVULSA'])) then
        sProblema := sFator + ' inicial igual a 0,000. Aumento/Redução não pode ser aplicado'

      else if (forma in [fmAumento, fmReducao, fmAumentoPerc, fmReducaoPerc]) and (item.fatorValue <= 0)
        and (not MatchText(item.tipoTabela, ['LOCALIDADE', 'SETOR', 'CIDADE', 'AVULSA'])) then
        sProblema := sFator + ' inicial igual a 0,000. Aumento/Redução não pode ser aplicado'

      else if //(fator in [faMarkup, faMargem, faPercAdicionalOuPromo]) and
              (StrNumber(item.fatorValue, 3) = StrNumber(dValue, 3)) then
        sProblema := sFator + ' igual ao informado. A alteração não surtirá efeito'

      else if (fator in [faMarkup, faMargem]) and
              (dPercent < 0)  then
        sProblema := sFator + ' não pode ficar com valor negativo'

      else if (fator = faPercAdicionalOuPromo) and
              (tabPreco in [pa30dias, pa60dias, pa90dias]) and
              (dPercent = 0) then
        dataSet.FieldByName('preco').Value := Null

      else if (not vDadosIni.vProduto.Precos.ManterPrecoMarkupProporcional) and // permite zerar o markup caso nao seja configurado para permanecer proporcional
              (fator in [faMarkup, faMargem]) and
              (tabPreco in [paVarejo, paAtacado, pa30dias, pa60dias, pa90dias]) and
              (dPercent = 0) then
        dataSet.FieldByName('preco').Value := Null

      else if (fator in [faMarkup, faMargem]) and // quando for promocao produto pode zerar sem olhar a configuração
              (tabPreco in [paCidade, paLocalidade, paSetor, paTabPromo]) and
              (dPercent = 0) then
        dataSet.FieldByName('preco').Value := Null

      else if (ffloat('preco') <= 0) and
              (tabPreco in [paVarejo, paCidade, paLocalidade, paSetor, paTabPromo])then
        sProblema := 'Essa tabela de Preço não pode ficar com valor menor ou igual a zero';

      //  FatorAlteracao = (faPreco, faMarkup, faMargem, faPercAdicionalOuPromo);
      //  FormaAlteracao = (fmSubstituicao, fmAumento, fmReducao);
      //  PrecoAlteracao = (paVarejo, paAtacado, pa30dias, pa60dias, pa90dias, paPromo, paCidade, paLocalidade, paSetor, paTabPromo);
                                                    
      dataSet.FieldByName('problema').AsString := sProblema;
      dataSet.Post;

      if Assigned(FOnCalculo) then
        FOnCalculo('', Trunc((I + 1) / payload.Count * 100));
    end;
  finally
    stop := False;
    Self.prepare_loop_done;
    if Assigned(FOnCalculo) then
      FOnCalculo('', 100);
  end;
end;

constructor TPrecosOOP.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
end;

function TPrecosOOP.GetFieldFator(
  fatorParam: FatorAlteracao;
  tabPrecoParam: TabelaPrecoAlt): string;
begin
  Result := '';
  case fatorParam of
    faPreco:
      begin
        case tabPrecoParam of
          paVarejo:   Result := 'prec_tab_prod';
          paAtacado:  Result := 'prec_publico';
          pa30dias:   Result := 'prec_30_prod';
          pa60dias:   Result := 'prec_60_prod';
          pa90dias:   Result := 'prec_90_prod';
          paPromo:    Result := 'preco_promocao';
          paTabPromo, paLocalidade, paSetor, paCidade, paAvulsa:
            Result := 'valor_promocao';
        end;
      end;

    faMarkup, faMargem:
      begin
        case tabPrecoParam of
          paVarejo:   Result := 'perc_tb_prod';
          paAtacado:  Result := 'perc_tb_proda';
          pa30dias:   Result := 'perc_tb_prod3';
          pa60dias:   Result := 'perc_tb_prod6';
          pa90dias:   Result := 'perc_tb_prod9';
          paPromo:    Result := '';
          paTabPromo, paLocalidade, paSetor, paCidade, paAvulsa:
            Result := 'markup';
        end;
      end;

    faPercAdicionalOuPromo:
      begin
        case tabPrecoParam of
          paVarejo:   Result := '';
          paAtacado:  Result := '';
          pa30dias:   Result := 'perc_ad_30';
          pa60dias:   Result := 'perc_ad_60';
          pa90dias:   Result := 'perc_ad_90';
          paPromo:    Result := '';
          paTabPromo: Result := 'porcentagem';
          paLocalidade, paSetor, paCidade, paAvulsa:
            Result := '';
        end;
      end;
  end;
end;

function TPrecosOOP.GetProdutosFaixa(tipo: string;
  payload: TFaixasClass): TProdPrecoList;
var
  sql, str, table, sqlFator, fieldFator, fieldId: string;
  itStarts, itEnds, itRange: Integer;
  itId, positionIt, positionPayload, I: Integer;
  prodPreco: TProdPreco;
begin
  Result := TProdPrecoList.Create;
  Result.tipo := tipo;

  itStarts := 0;
//  itEnds := 999;
  itRange := 1000;

  positionIt := 0;
  str := '';
  sql := '';

  //TabelaPrecoAlt = (paVarejo, paAtacado, pa30dias, pa60dias, pa90dias, paPromo, paTabPromo);
  fieldFator := GetFieldFator(fator, tabPreco);

  sqlFator := IfThen(fieldFator <> '', ', ' + IfThen(tabPreco = paTabPromo, 'p') + 'p.' + fieldFator);
  fieldId := IfThen(tipo = TB_LOCALIDADE, 'pp.cod_localidade') +
             IfThen(tipo = TB_SETOR     , 'pp.cod_setor') +
             IfThen(tipo = TB_CIDADE    , 'pp.cod_cidade')+
             IfThen(tipo = TB_TABELA    , 'pp.cod_promocao');

  for I := 0 to Length(payload) - 1 do
  begin
    str := str + IfThen(str <> '', ',') + IntToStr(payload[I].id);
    positionIt := positionIt + 1;

    if (positionIt >= 1000) or (I = (Length(payload) - 1)) then
    begin
      if MatchText(tipo, [TB_GRUPO, TB_SUBGRUPO, TB_MARCA])
      then
        sql := sql + IfThen(sql <> '', ' union distinct ') +
               'select distinct p.grupo_prod, p.cod_prod, p.prec_cusm_prod ' + sqlFator + ', 0 id, p.prec_tab_prod, p.descr_prod, '''' TIPO, 0.0 valor_promocao, 0.0 porcentagem, 0.0 markup ' +
               ' from produtos p' +
               ' where p.cod_empresa = ' + vDadosIni.codEmpresa + ' and p.ativo = 1' +
               IfThen(tipo = 'GRUPO'   , ' and p.grupo_prod in (%s)') +
               IfThen(tipo = 'SUBGRUPO', ' and p.sub_g_prod in (%s)') +
               IfThen(tipo = 'MARCA', ' and p.cod_marca in (%s)')
      else
        sql := sql + IfThen(sql <> '', ' union distinct ') +
               'select distinct p.grupo_prod, p.cod_prod, p.prec_cusm_prod ' + sqlFator + ',' + fieldId + ' id, p.prec_tab_prod, p.descr_prod, pp.tipo,' +
               ' pp.valor_promocao, pp.porcentagem, pp.markup' +
               ' from vw_tabela_precos pp' +
               ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa and p.ativo = 1' +
               ' where pp.cod_empresa = ' + vDadosIni.codEmpresa +
               IfThen(tipo = TB_LOCALIDADE, ' and pp.cod_localidade in (%s)') +
               IfThen(tipo = TB_SETOR     , ' and pp.cod_setor in (%s)') +
               IfThen(tipo = TB_CIDADE    , ' and pp.cod_cidade in (%s)')+
               IfThen(tipo = TB_TABELA    , ' and pp.cod_promocao in (%s)');
//        sql := sql + IfThen(sql <> '', ' union distinct ') +
//               'select distinct p.grupo_prod, p.cod_prod, p.prec_cusm_prod ' + sqlFator + ',' + fieldId + ' id, p.prec_tab_prod, p.descr_prod' +
//               ' from promocao pm' +
//               ' inner join promocao_produto pp on pp.cod_promocao = pm.cod_promocao and pp.cod_empresa = pm.cod_empresa' +
//               ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa and p.ativo = 1' +
//               ' where pm.ativo = 1 and pm.cod_empresa = ' + vDadosIni.codEmpresa +
//               IfThen(tipo = TB_LOCALIDADE, ' and pp.cod_localidade in (%s)') +
//               IfThen(tipo = TB_SETOR     , ' and pp.cod_setor in (%s)') +
//               IfThen(tipo = TB_CIDADE    , ' and pp.cod_cidade in (%s)')+
//               IfThen(tipo = TB_TABELA    , ' and pp.cod_promocao in (%s)');


      {$REGION 'Executando query e populando o objeto'}
      SqlOpen(sql, [str]);
      while not buscas.Eof do
      begin
        prodPreco := Result.New;

        prodPreco.tabId := buscas.FieldByName('id').AsInteger;
        prodPreco.grupo := buscas.FieldByName('grupo_prod').AsInteger;
        prodPreco.codigo := Trim(buscas.FieldByName('cod_prod').AsString);
        prodPreco.descricao := Trim(buscas.FieldByName('descr_prod').AsString);
        prodPreco.custo := buscas.FieldByName('prec_cusm_prod').AsFloat;
        prodPreco.precovarejo := buscas.FieldByName('prec_tab_prod').AsFloat;
        prodPreco.tipoTabela := Trim(buscas.FieldByName('tipo').AsString);
        if fieldFator <> '' then
        begin
          prodPreco.fatorValue := buscas.FieldByName(fieldFator).AsFloat;
          if fator = faMargem then
            prodPreco.fatorValue := CalcUtils.MargemLucro(prodPreco.fatorValue, DIGROUNDMAX);
        end;
        if prodPreco.tipoTabela <> '' then
        begin
          prodPreco.tabDifValor := buscas.FieldByName('valor_promocao').AsFloat;
          prodPreco.tabDifMkt   := buscas.FieldByName('markup').AsFloat;
          if prodPreco.tipoTabela = 'PROMOCAO' then
            prodPreco.tabDifPerc := buscas.FieldByName('porcentagem').AsFloat
          else
          begin
            prodPreco.tabDifPerc := ((prodPreco.tabDifValor / prodPreco.precovarejo) - 1) * 100;
            if fator = faPercAdicionalOuPromo then // Tabela de preço normal nao grava o percentual, então aqui a gente calcula esse percentual para permitir a alteração
              prodPreco.fatorValue := prodPreco.tabDifPerc;
          end;
        end;

        for positionPayload := Low(payload) to High(payload) do
          if payload[positionPayload].id = prodPreco.tabId then
          begin
            prodPreco.tabName := payload[positionPayload].name;
            Break;
          end;

        buscas.Next;
      end;
      {$ENDREGION}

      str := '';
      positionIt := 0;
    end;

  end;

  buscas.Close;
end;

function TPrecosOOP.GetProdutosFaixa(payload: TProdPrecoList): TProdPrecoList;
var
  I: Integer;
  fieldFator, sqlFator: string;
  prodPreco: TProdPreco;
begin

  fieldFator := GetFieldFator(fator, tabPreco);
  sqlFator := IfThen(fieldFator <> '', ', p.' + fieldFator);

  for I := 0 to payload.Count - 1 do
  begin
   prodPreco := payload.Items[I];
   SqlOpen('select distinct p.grupo_prod, p.cod_prod, p.prec_cusm_prod ' + sqlFator + ', 0 id, p.prec_tab_prod, p.descr_prod' +
               ' from produtos p' +
               ' where p.grupo_prod = %d and p.cod_prod = ''%s'' and p.cod_empresa = %d',
               [prodPreco.grupo, prodPreco.codigo, vDadosIni.cod_empresa]);

    while not buscas.Eof do
    begin
      prodPreco.tabId := buscas.FieldByName('id').AsInteger;
      prodPreco.grupo := buscas.FieldByName('grupo_prod').AsInteger;
      prodPreco.codigo := Trim(buscas.FieldByName('cod_prod').AsString);
      prodPreco.descricao := Trim(buscas.FieldByName('descr_prod').AsString);
      prodPreco.custo := buscas.FieldByName('prec_cusm_prod').AsFloat;
      prodPreco.precovarejo := buscas.FieldByName('prec_tab_prod').AsFloat;
      if fieldFator <> '' then
      begin
        prodPreco.fatorValue := buscas.FieldByName(fieldFator).AsFloat;
        if fator = faMargem then
          prodPreco.fatorValue := CalcUtils.MargemLucro(prodPreco.fatorValue, DIGROUNDMAX);
      end;

      buscas.Next;
    end;
  end;

  Result := payload;
end;

function TPrecosOOP.GetRelatorio(dataIni, dataFim: TDateTime): Boolean;
begin
  dataFim := DateOf(dataFim) +  EncodeTime(HourOf(dataFim), MinuteOf(dataFim), 59, 999);

  SqlOpen('select pr.grupo_prod || ''-'' || pr.cod_prod codigo, pr.descr_prod,' +
          ' case when l.cod_localidade is not null then l.localidade || '' - '' || ''LOCALIDADE''' +
          '      when s.cod_setor is not null then s.setor || '' - '' || ''SETOR''' +
          '      when c.cod_cidade is not null then c.nome_cidade || '' - '' || ''CIDADE''' +
          '      else' +
          '        iif(pe.tabela_id in (''VAREJO'', ''ATACADO'', ''30_DIAS'', ''60_DIAS'', ''90_DIAS'', ''PROMOCAO''), pe.tabela_id,' +
          '        iif(not pq.cod_prod is null, ''QUANTIDADE'', coalesce(pm.descr_promocao, ''**NAO LOCALIZADA**'') || '' - '' || iif(PP.COD_TPPRECO = 1, ''PROMO'', ''AVULSA'') ))' +
          ' end tabela,' +
          ' pe.quantidade, pe.data,' +
          ' pe.preco, pe.markup, pe.margem, pe.usuario, pe.custo' +
          ' from produtos_historico_preco pe' +
          ' inner join produtos pr on pr.grupo_prod = pe.grupo_prod and pr.cod_prod = pe.cod_prod and pr.cod_empresa = pe.cod_empresa' +
          ' left join promocao_produto pp on pp.guidt = pe.tabela_id' +
          ' left join promocao pm on pm.cod_promocao = pp.cod_promocao and pm.cod_empresa = pp.cod_empresa and pm.cod_tppreco = pp.cod_tppreco' +
          ' left join preco_produtos_qtde pq on pq.guidt = pe.tabela_id' +
          ' left join localidade l on l.cod_localidade = pp.cod_localidade and l.cod_empresa = pp.cod_empresa' +
          ' left join setor s on s.cod_setor = pp.cod_setor and s.cod_empresa = pp.cod_empresa' +
          ' left join cidades c on c.cod_cidade = pp.cod_cidade and c.cod_cidade > 0' +
          ' where pe.cod_empresa = %d' +
          ' and pe.data >= %s and pe.data <= %s' +
          ' order by pr.descr_prod, tabela, pe.data desc',
          [vDadosIni.cod_empresa, datet_fb(dataIni), datet_fb(dataFim)])
end;

function TPrecosOOP.GetProdutosFaixa(tipo: string;
  ids: array of Integer): TProdPrecoList;
var
  sql, str, table, sqlFator, fieldFator, fieldId: string;
  itStarts, itEnds, itRange: Integer;
  itCount, I: Integer;
  prodPreco: TProdPreco;
begin
  Result := TProdPrecoList.Create;
  Result.tipo := tipo;

  itStarts := 0;
//  itEnds := 999;
  itRange := 1000;

  itCount := 0;
  str := '';
  sql := '';

  //TabelaPrecoAlt = (paVarejo, paAtacado, pa30dias, pa60dias, pa90dias, paPromo, paTabPromo);
  fieldFator := GetFieldFator(fator, tabPreco);

  sqlFator := IfThen(fieldFator <> '', ', ' + IfThen(tabPreco = paTabPromo, 'p') + 'p.' + fieldFator);
  fieldId := IfThen(tipo = TB_LOCALIDADE, 'pp.cod_localidade') +
             IfThen(tipo = TB_SETOR     , 'pp.cod_setor') +
             IfThen(tipo = TB_CIDADE    , 'pp.cod_cidade')+
             IfThen(tipo = TB_TABELA    , 'pp.cod_promocao');

  for I := 0 to Length(ids) - 1 do
  begin
    str := str + IfThen(str <> '', ',') + IntToStr(ids[I]);
    itCount := itCount + 1;

    if (itCount >= 1000) or (I = (Length(ids) - 1)) then
    begin
      if MatchText(tipo, [TB_GRUPO, TB_SUBGRUPO, TB_MARCA])
      then
        sql := sql + IfThen(sql <> '', ' union distinct ') +
               'select distinct p.grupo_prod, p.cod_prod, p.prec_cusm_prod ' + sqlFator + ', 0 id, p.prec_tab_prod, p.descr_prod, '''' TIPO, 0.0 valor_promocao, 0.0 porcentagem, 0.0 markup' +
               ' from produtos p' +
               ' where p.cod_empresa = ' + vDadosIni.codEmpresa + ' and p.ativo = 1' +
               IfThen(tipo = 'GRUPO'   , ' and p.grupo_prod in (%s)') +
               IfThen(tipo = 'SUBGRUPO', ' and p.sub_g_prod in (%s)') +
               IfThen(tipo = 'MARCA', ' and p.cod_marca in (%s)')
      else
        sql := sql + IfThen(sql <> '', ' union distinct ') +
               'select distinct p.grupo_prod, p.cod_prod, p.prec_cusm_prod ' + sqlFator + ',' + fieldId + ' id, p.prec_tab_prod, p.descr_prod, pp.tipo,' +
               ' pp.valor_promocao, pp.porcentagem, pp.markup' +
               ' from promocao pm' +
               ' inner join promocao_produto pp on pp.cod_promocao = pm.cod_promocao and pp.cod_empresa = pm.cod_empresa' +
               ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa and p.ativo = 1' +
               ' where pm.ativo = 1 and pm.cod_empresa = ' + vDadosIni.codEmpresa +
               IfThen(tipo = TB_LOCALIDADE, ' and pm.cod_localidade in (%s)') +
               IfThen(tipo = TB_SETOR     , ' and pm.cod_setor in (%s)') +
               IfThen(tipo = TB_CIDADE    , ' and pm.cod_cidade in (%s)')+
               IfThen(tipo = TB_TABELA    , ' and pm.cod_promocao in (%s)');


      {$REGION 'Executando query e populando o objeto'}
      SqlOpen(sql, [str]);
      while not buscas.Eof do
      begin
        prodPreco := Result.New;

        prodPreco.tabId := buscas.FieldByName('id').AsInteger;
        prodPreco.grupo := buscas.FieldByName('grupo_prod').AsInteger;
        prodPreco.codigo := Trim(buscas.FieldByName('cod_prod').AsString);
        prodPreco.descricao := Trim(buscas.FieldByName('descr_prod').AsString);
        prodPreco.custo := buscas.FieldByName('prec_cusm_prod').AsFloat;
        prodPreco.precovarejo := buscas.FieldByName('prec_tab_prod').AsFloat;  
        prodPreco.tipoTabela := Trim(buscas.FieldByName('tipo').AsString);
        if fieldFator <> '' then
        begin
          prodPreco.fatorValue := buscas.FieldByName(fieldFator).AsFloat;
          if fator = faMargem then
            prodPreco.fatorValue := CalcUtils.MargemLucro(prodPreco.fatorValue, DIGROUNDMAX);
        end;   
        if prodPreco.tipoTabela <> '' then
        begin
          prodPreco.tabDifValor := buscas.FieldByName('valor_promocao').AsFloat;
          prodPreco.tabDifMkt   := buscas.FieldByName('markup').AsFloat;
          if prodPreco.tipoTabela = 'PROMOCAO' then
            prodPreco.tabDifPerc := buscas.FieldByName('porcentagem').AsFloat
          else
          begin
            prodPreco.tabDifPerc := ((prodPreco.tabDifValor / prodPreco.precovarejo) - 1) * 100;
            if fator = faPercAdicionalOuPromo then // Tabela de preço normal nao grava o percentual, então aqui a gente calcula esse percentual para permitir a alteração
              prodPreco.fatorValue := prodPreco.tabDifPerc;
          end;
        end;

        buscas.Next;
      end;
      {$ENDREGION}

      str := '';
      itCount := 0;
    end;

  end;

  buscas.Close;
end;

{ TProdPrecoList }

function TProdPrecoList.GetItem(Index: Integer): TProdPreco;
begin
  Result := TProdPreco(inherited Items[Index]);
end;

function TProdPrecoList.New: TProdPreco;
begin
  Result := TProdPreco.Create;
  Add(Result);
end;

procedure TProdPrecoList.SetItem(Index: Integer;
  const Value: TProdPreco);
begin
  Put(Index, Value);
end;

end.


proAlteracaoNormal
proAlteracaoPorFaixa
proAlteracaoPercentualAd
proAumento
proReducao
proSubstituicao
proVarejo
proAtacado
pro30dias
pro60dias
pro90dias
