unit uCadRegrasProgramasFidelidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesConfig, DBClient, IBDatabase, uEditHw,
  DBCtrls, dateutils;

type
  TfrmCadRegrasProgramaFidelidade = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    BitBtn109: TBitBtn;
    GroupBox4: TGroupBox;
    ScrollBox4: TScrollBox;
    DBGrid2: TDBGrid;
    PopupMenu3: TPopupMenu;
    Configurarcolunas2: TMenuItem;
    ResetarConfiguraesdecolunas2: TMenuItem;
    SalvardadosnoExcel2: TMenuItem;
    ReajustarLarguradascolunas2: TMenuItem;
    Copiarparareadetransferncia2: TMenuItem;
    Somarvaloresdacoluna2: TMenuItem;
    GroupBoxConfig: TGroupBox;
    PanelOutros: TPanel;
    PanelOutros2: TPanel;
    ComboBoxOutros2: TComboBox;
    Label17: TLabel;
    EditHwDiasPercOutros2: TEditHw;
    Label16: TLabel;
    EditHwPontosOutros2: TEditHw;
    PanelFaixaCompra: TPanel;
    PanelProduto: TPanel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    EditNumFabProduto: TEdit;
    EditGrupoProduto: TEdit;
    EditCodProduto: TEdit;
    EditHwPontosProduto: TEditHw;
    LabelOutros2: TLabel;
    GroupBox18: TGroupBox;
    BitBtnExcluirConf: TBitBtn;
    BitBtnNovoConf: TBitBtn;
    BitBtnSalvarConf: TBitBtn;
    BitBtnCancelarConf: TBitBtn;
    BitBtnVoltarConf: TBitBtn;
    Panel4: TPanel;
    LabelOutros: TLabel;
    ComboBoxOutros: TComboBox;
    Label14: TLabel;
    EditHwPontosOutros: TEditHw;
    PanelFC: TPanel;
    Label6: TLabel;
    EditHwPontosFC: TEditHw;
    PanelFV: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    EditHwRealFV: TEditHw;
    PanelFCFV: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ComboBoxCondInicialFaixaCompra: TComboBox;
    EditHwValorIniFaixaCompra: TEditHw;
    ComboBoxCondFinalFaixaCompra: TComboBox;
    EditHwValorFimFaixaCompra: TEditHw;
    EditHwPontosFV: TEditHw;
    Label18: TLabel;
    EditDescricaoProduto: TEdit;
    PanelKit: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    EditHwPontosKit: TEditHw;
    EditHwKit: TEditHw;
    EditKit: TEdit;
    tsSimulacao: TTabSheet;
    ScrollBox5: TScrollBox;
    GroupBox5: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    MaskEditIniSim: TMaskEdit;
    MaskEditFimSim: TMaskEdit;
    BitBtnVoltarSim: TBitBtn;
    BitBtnSimularSim: TBitBtn;
    tsAtuar: TTabSheet;
    pnAtuar: TPanel;
    GroupBox6: TGroupBox;
    Label133: TLabel;
    ComboBoxAtuar: TComboBox;
    Panel34: TPanel;
    BitBtn35: TBitBtn;
    BitBtn19: TBitBtn;
    DBText3: TDBText;
    GroupBox7: TGroupBox;
    Label25: TLabel;
    LabelFatVndP: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    LabelQtdVndP: TLabel;
    Label29: TLabel;
    LabelDataDefClasse: TLabel;
    PageControl2: TPageControl;
    tsResumo: TTabSheet;
    tsFaixaPontosValor: TTabSheet;
    tsAsseduidade: TTabSheet;
    tsFaixaCompra: TTabSheet;
    tsFaixaProduto: TTabSheet;
    tsFaixaGrupoProd: TTabSheet;
    tsFaixaSubGrupoProd: TTabSheet;
    tsFaixaMarcaProd: TTabSheet;
    GroupBoxFaixaPontosPorValor: TGroupBox;
    Panel5: TPanel;
    DBGrid3: TDBGrid;
    Panel50: TPanel;
    DBGridFaixaPontosPorValor: TDBGrid;
    GroupBoxAssiduidade: TGroupBox;
    Panel6: TPanel;
    DBGridAssiduidade: TDBGrid;
    GroupBoxFaixaCompra: TGroupBox;
    Panel7: TPanel;
    DBGridFaixaCompra: TDBGrid;
    GroupBoxFaixaProduto: TGroupBox;
    Panel8: TPanel;
    DBGridFaixaProduto: TDBGrid;
    Label30: TLabel;
    LabelPercTotFaixaPontosValor: TLabel;
    Label31: TLabel;
    LabelValorTotalFaixaPontosValor: TLabel;
    Label33: TLabel;
    LabelPontosTotalFaixaPontosValor: TLabel;
    Label32: TLabel;
    LabelPercTotAsseduidade: TLabel;
    Label35: TLabel;
    LabelQtdeTotAsseduidade: TLabel;
    Label37: TLabel;
    LabelPontosTotalAsseduidade: TLabel;
    Label34: TLabel;
    LabelPercTotFaixaCompra: TLabel;
    Label38: TLabel;
    LabelValorTotalFaixaCompra: TLabel;
    Label40: TLabel;
    LabelPontosTotalFaixaCompra: TLabel;
    Label36: TLabel;
    LabelPercTotFaixaProduto: TLabel;
    Label41: TLabel;
    LabelValorTotFaixaProduto: TLabel;
    Label43: TLabel;
    LabelPontosTotalFaixaProduto: TLabel;
    GroupBoxFaixaGrupoProd: TGroupBox;
    Panel9: TPanel;
    Label39: TLabel;
    LabelPercTotFaixaGrupo: TLabel;
    Label44: TLabel;
    LabelValorTotFaixaGrupo: TLabel;
    Label46: TLabel;
    LabelPontosTotFaixaGrupo: TLabel;
    DBGridFaixaGrupoProd: TDBGrid;
    GroupBoxFaixaSubGrupoProd: TGroupBox;
    Panel10: TPanel;
    Label42: TLabel;
    LabelPercTotFaixaSubGrupo: TLabel;
    Label47: TLabel;
    LabelValorTotFaixaSubGrupo: TLabel;
    Label49: TLabel;
    LabelPontosTotalFaixaSubGrupo: TLabel;
    DBGridFaixaSubGrupoProd: TDBGrid;
    GroupBoxFaixaMarca: TGroupBox;
    Panel11: TPanel;
    Label45: TLabel;
    LabelPercTotFaixaMarca: TLabel;
    Label50: TLabel;
    LabelValorTotFaixaMarca: TLabel;
    Label52: TLabel;
    LabelPontosTotalFaixaMarca: TLabel;
    DBGridFaixaMarca: TDBGrid;
    tsFaixaKitProd: TTabSheet;
    GroupBoxFaixaKitProd: TGroupBox;
    Panel12: TPanel;
    Label48: TLabel;
    LabelPercTotFaixaKitProd: TLabel;
    Label53: TLabel;
    LabelValorTotFaixaKitProd: TLabel;
    Label55: TLabel;
    LabelPontosTotalFaixaKitProd: TLabel;
    DBGridFaixaKitProd: TDBGrid;
    tsRecPrest: TTabSheet;
    GroupBoxRecPrest: TGroupBox;
    Panel13: TPanel;
    Label51: TLabel;
    LabelPercTotRecPrest: TLabel;
    Label56: TLabel;
    LabelQtdeTotalRecPrest: TLabel;
    Label58: TLabel;
    LabelPontosTotalRecPrest: TLabel;
    DBGridRecPrest: TDBGrid;
    tsFaixaAsseduidade: TTabSheet;
    GroupBoxFaixaAssiduidade: TGroupBox;
    Panel14: TPanel;
    Label54: TLabel;
    LabelPercTotFaixaAsseduidade: TLabel;
    Label59: TLabel;
    LabelValorTotFaixaAssiduidade: TLabel;
    Label61: TLabel;
    LabelPontosTotalFaixaAsseduidade: TLabel;
    DBGridFaixaAssiduidade: TDBGrid;
    tsFormasPag: TTabSheet;
    GroupBoxFormasPag: TGroupBox;
    Panel15: TPanel;
    Label57: TLabel;
    LabelPercTotFormasPag: TLabel;
    Label62: TLabel;
    LabelQtdeTotFormasPag: TLabel;
    Label64: TLabel;
    LabelPontosTotalFormasPag: TLabel;
    DBGridFormasPag: TDBGrid;
    SpeedButton55: TSpeedButton;
    Label60: TLabel;
    LabelTotPontosG: TLabel;
    GroupBoxResumo: TGroupBox;
    Panel16: TPanel;
    Label63: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    DBGrid4: TDBGrid;
    Panel17: TPanel;
    StringGridResumo: TStringGrid;
    Label70: TLabel;
    EditHwValorDesp: TEditHw;
    Label71: TLabel;
    LabelPerDesp: TLabel;
    Label72: TLabel;
    EditHwTaxConv: TEditHw;
    btConfigFaixaPontos: TSpeedButton;
    btAtivarFaixaPontos: TSpeedButton;
    btDesativarFaixaPontos: TSpeedButton;
    btConfigAsseduidade: TSpeedButton;
    btAtivarAsseduidade: TSpeedButton;
    btDesativarAsseduidade: TSpeedButton;
    btConfigFaixaAsseduidade: TSpeedButton;
    btAtivarFaixaAsseduidade: TSpeedButton;
    btDesativarFaixaAsseduidade: TSpeedButton;
    btConfigFormasPag: TSpeedButton;
    btAtivarFormasPag: TSpeedButton;
    BtDesativarFormasPag: TSpeedButton;
    btConfigFaixaCompra: TSpeedButton;
    tbAtivarFaixaCompra: TSpeedButton;
    btDesativarFaixaCompra: TSpeedButton;
    btConfigurarRecPrest: TSpeedButton;
    btAtivarRecPrest: TSpeedButton;
    btDesativarRecPrest: TSpeedButton;
    btConfigFaixaProduto: TSpeedButton;
    btAtivarConfigFaixaProduto: TSpeedButton;
    btDesativarConfigFaixaProduto: TSpeedButton;
    btConfigFaixaGrupoProd: TSpeedButton;
    btAdicionarFaixaGrupoProd: TSpeedButton;
    btDesativarFaixaGrupoProd: TSpeedButton;
    btConfigFaixaSubGrupo: TSpeedButton;
    btAtivarFaixaSubGrupo: TSpeedButton;
    btDesativarFaixaSubGrupo: TSpeedButton;
    btConfigFaixaMarcaProd: TSpeedButton;
    btAtivarFaixaMarcaProd: TSpeedButton;
    btDesativarFaixaMarcaProd: TSpeedButton;
    btConfigFaixaKitProd: TSpeedButton;
    btAtivarFaixaKitProd: TSpeedButton;
    btDesativarFaixaKitProd: TSpeedButton;
    btConfirmarSimulacao: TSpeedButton;
    Label73: TLabel;
    ckDet: TCheckBox;
    Label74: TLabel;
    LabelQtdDevP: TLabel;
    Label75: TLabel;
    LabelFatDevP: TLabel;
    LabelFatP: TLabel;
    Label77: TLabel;
    BitBtnLancRetroativo: TBitBtn;
    Label76: TLabel;
    LabelFatDevAvulsasP: TLabel;
    Label78: TLabel;
    LabelQtdDevAvulsasP: TLabel;
    PanelProg: TPanel;
    ProgressBar1: TProgressBar;
    Label79: TLabel;
    Label80: TLabel;
    LabelFatVales: TLabel;
    Label81: TLabel;
    LabelQtdVales: TLabel;
    EditHwPeriodoVenc: TEditHw;
    procedure BitBtnLancRetroativoClick(Sender: TObject);
    procedure btConfirmarSimulacaoClick(Sender: TObject);
    procedure btDesativarFaixaKitProdClick(Sender: TObject);
    procedure btAtivarFaixaKitProdClick(Sender: TObject);
    procedure btConfigFaixaKitProdClick(Sender: TObject);
    procedure btDesativarFaixaMarcaProdClick(Sender: TObject);
    procedure btAtivarFaixaMarcaProdClick(Sender: TObject);
    procedure btConfigFaixaMarcaProdClick(Sender: TObject);
    procedure btDesativarFaixaSubGrupoClick(Sender: TObject);
    procedure btAtivarFaixaSubGrupoClick(Sender: TObject);
    procedure btConfigFaixaSubGrupoClick(Sender: TObject);
    procedure btDesativarFaixaGrupoProdClick(Sender: TObject);
    procedure btAdicionarFaixaGrupoProdClick(Sender: TObject);
    procedure btConfigFaixaGrupoProdClick(Sender: TObject);
    procedure btDesativarConfigFaixaProdutoClick(Sender: TObject);
    procedure btAtivarConfigFaixaProdutoClick(Sender: TObject);
    procedure btConfigFaixaProdutoClick(Sender: TObject);
    procedure btDesativarRecPrestClick(Sender: TObject);
    procedure btAtivarRecPrestClick(Sender: TObject);
    procedure btConfigurarRecPrestClick(Sender: TObject);
    procedure btDesativarFaixaCompraClick(Sender: TObject);
    procedure tbAtivarFaixaCompraClick(Sender: TObject);
    procedure btConfigFaixaCompraClick(Sender: TObject);
    procedure BtDesativarFormasPagClick(Sender: TObject);
    procedure btAtivarFormasPagClick(Sender: TObject);
    procedure btConfigFormasPagClick(Sender: TObject);
    procedure btDesativarFaixaAsseduidadeClick(Sender: TObject);
    procedure btAtivarFaixaAsseduidadeClick(Sender: TObject);
    procedure btConfigFaixaAsseduidadeClick(Sender: TObject);
    procedure btDesativarAsseduidadeClick(Sender: TObject);
    procedure btAtivarAsseduidadeClick(Sender: TObject);
    procedure btConfigAsseduidadeClick(Sender: TObject);
    procedure BitBtn109Click(Sender: TObject);
    procedure btDesativarFaixaPontosClick(Sender: TObject);
    procedure btAtivarFaixaPontosClick(Sender: TObject);
    procedure btConfigFaixaPontosClick(Sender: TObject);
    procedure StringGridResumoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure EditHwTaxConvExit(Sender: TObject);
    procedure EditHwValorDespExit(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtnSimularSimClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure EditHwKitExit(Sender: TObject);
    procedure EditHwKitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNumFabProdutoExit(Sender: TObject);
    procedure EditNumFabProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxOutros2Exit(Sender: TObject);
    procedure BitBtnVoltarConfClick(Sender: TObject);
    procedure BitBtnCancelarConfClick(Sender: TObject);
    procedure BitBtnSalvarConfClick(Sender: TObject);
    procedure Somarvaloresdacoluna2Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel2Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas2Click(Sender: TObject);
    procedure Configurarcolunas2Click(Sender: TObject);
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure BitBtnExcluirConfClick(Sender: TObject);
    procedure BitBtnNovoConfClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ScrollBox4Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CamposModoInsercao;
    procedure CamposModoConsulta;
    procedure configClasse(pTipo: string);
    procedure ativarClasse(ptipo: string);
    procedure desativarClasse(pTipo: string);
    function iniciarSimulacao(pExibirMens: boolean = true): boolean;
    procedure habilitarCampos(pHab: boolean = true);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegrasProgramaFidelidade: TfrmCadRegrasProgramaFidelidade;
  RegrasProgramasFidelidades: TRegrasProgramasFidelidades;

  PrimeiraPesquisa2: Boolean;
  vConfigColuna2 : boolean;
  campoPesquisa2: string;
  cdsColunas2: TClientDataSet;

  cdsGrid2: TClientDataSet;
  GridCfg2: TDBGrid;
  ListGridsAndDataSets2: TStrings;
  ListPositions2: TStrings;

  trans2: TIBTransaction;
  vTabela2, vCampoPadrao2: string;
  fReset2, vCtrlClick, vShiftClick: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt2,vAlterarNomeDtSet2, usuario: string;
  vCamposPadraoRegistro2: Boolean;
  vTipoForm: Integer;
  vSql: string;


implementation

uses
  uDtmAtivo, UDtmConfig, uDataSet_OOP, uDadosIni, DB, Clipbrd;

{$R *.dfm}

procedure TfrmCadRegrasProgramaFidelidade.ativarClasse(ptipo: string);
begin
  if trim(ptipo) <> '' then
    RegrasProgramasFidelidades.abreRegrasProgramaFidelidades(ptipo);
  if RegrasProgramasFidelidades.dataSet.IsEmpty then
     Exit;

  if not RegrasProgramasFidelidades.ativarDesativarClasse then
    exit;
  if trim(ptipo) <> '' then
    if iniciarSimulacao(false) then
      habilitarCampos;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtn109Click(Sender: TObject);
begin
  inherited;
  vTipoForm := 0;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtn19Click(Sender: TObject);
begin
  if trim(ComboBoxAtuar.Text) = '' then
  begin
    Application.MessageBox(pchar('Campo não informado!'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (ComboBoxAtuar.CanFocus) then
      ComboBoxAtuar.SetFocus;
    exit;
  end;

  if not vDadosIni.PesqPros('FID010', 'EDITAR', '', 'REGRAS_PROG_FIDELIDADE',
    RegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsString, RegrasProgramasFidelidades.buscas, true) then
     exit;
  
  TForm(pnAtuar.Parent).ModalResult := IDOK;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('FID002', 'CONSULTAR', '', 'REGRAS_PROG_FIDELIDADE', '', RegrasProgramasFidelidades.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not RegrasProgramasFidelidades.ConsultaCampos('REGRAS_PROG_FIDELIDADE', ComboBox1.Text,
        'COD_TP_REGRA', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
	        combobox1.setfocus;
    end
    else if not RegrasProgramasFidelidades.ConsultaCampos('REGRAS_PROG_FIDELIDADE', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'COD_TP_REGRA', true, vDadosIni.codEmpresa) then
      if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
	      ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtn35Click(Sender: TObject);
begin
  TForm(pnAtuar.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtnCancelarConfClick(
  Sender: TObject);
begin
  vTipoForm := 0;
  if (Self.Enabled) and (Self.Visible) and (BitBtnCancelarConf.CanFocus) then
    BitBtnCancelarConf.SetFocus;
  RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.Cancel;
  RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.RollBackTransacao;
  CamposModoConsulta;
  Label17.Visible := false;
  EditHwDiasPercOutros2.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (BitBtnNovoConf.CanFocus) then
    BitBtnNovoConf.SetFocus;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtnExcluirConfClick(
  Sender: TObject);
begin
  inherited;
  vTipoForm := 0;
  if (Self.Enabled) and (Self.Visible) and (BitBtnExcluirConf.CanFocus) then
    BitBtnExcluirConf.SetFocus;
  if not RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.delete(RegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsInteger) then
    exit;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtnLancRetroativoClick(
  Sender: TObject);
begin
  try
    BitBtnSimularSim.Enabled := false;
    BitBtnLancRetroativo.Enabled := false;
    BitBtnVoltarSim.Enabled := false;
    btConfirmarSimulacao.Enabled := false;
    EditHwValorDesp.Enabled := false;
    EditHwTaxConv.Enabled := false;
    EditHwPeriodoVenc.Enabled := false;
    PageControl2.Enabled := false;
    MaskEditIniSim.Enabled := false;
    MaskEditFimSim.Enabled := false;
    ckDet.Enabled := false;

    if not vDadosIni.PesqPros('FID025', 'LANCAMENTO RETROATIVO', '', 'CONTA_CORRENTE_PROG_FIDELIDADE',
      '', RegrasProgramasFidelidades.buscas, true) then
     exit;

    if not RegrasProgramasFidelidades.lancamentoRetroativo(MaskEditIniSim.Text, MaskEditFimSim.Text) then
      exit;
  finally
    BitBtnSimularSim.Enabled := true;
    BitBtnLancRetroativo.Enabled := true;
    BitBtnVoltarSim.Enabled := true;
    btConfirmarSimulacao.Enabled := true;
    EditHwValorDesp.Enabled := true;
    EditHwTaxConv.Enabled := true;
    EditHwPeriodoVenc.Enabled := true;
    PageControl2.Enabled := true;
    MaskEditIniSim.Enabled := true;
    MaskEditFimSim.Enabled := true;
    ckDet.Enabled := true;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtnNovoConfClick(
  Sender: TObject);
begin
  vTipoForm := 0;
  if (Self.Enabled) and (Self.Visible) and (BitBtnNovoConf.CanFocus) then
    BitBtnNovoConf.SetFocus;
  if not RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.Insert(RegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsInteger) then
    exit;
  CamposModoInsercao;
  if (Self.Enabled) and (Self.Visible) and (ComboBoxOutros.CanFocus) then
    ComboBoxOutros.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ComboBoxOutros2.CanFocus) then
    ComboBoxOutros2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ComboBoxCondInicialFaixaCompra.CanFocus) then
    ComboBoxCondInicialFaixaCompra.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditNumFabProduto.CanFocus) then
    EditNumFabProduto.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwKit.CanFocus) then
    EditHwKit.SetFocus;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtnSalvarConfClick(
  Sender: TObject);
begin
  vTipoForm := 0;
  if (Self.Enabled) and (Self.Visible) and (BitBtnSalvarConf.CanFocus) then
    BitBtnSalvarConf.SetFocus;
  RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsInteger :=
    RegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsInteger;

  if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR')
  	or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA VALOR DE COMPRA') then
  begin
    if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR') then
    begin
      RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').AsFloat := EditHwPontosFV.AsValue;
      RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').AsFloat := 1;
    end
    else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA VALOR DE COMPRA') then
      RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').AsFloat := EditHwPontosFC.AsValue;

    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('CONDICAO_INI').AsString := UpperCase(ComboBoxCondInicialFaixaCompra.Text);
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('CONDICAO_FIM').AsString := UpperCase(ComboBoxCondFinalFaixaCompra.Text);
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_F_INI').AsFloat := EditHwValorIniFaixaCompra.AsValue;
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_F_FIM').AsFloat := EditHwValorFimFaixaCompra.AsValue;

    if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR') then
      RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString :=
        'COMPRAS ENTRE' +
        ' R$ ' + FormatFloat('#,##0.00', EditHwValorIniFaixaCompra.AsValue) +
        ' E R$ ' + FormatFloat('#,##0.00', EditHwValorFimFaixaCompra.AsValue) +
        ' (R$ ' + FormatFloat('#,##0.00', 1) +
        ' EQUIVALENTE ' + FormatFloat('#,##0.00', EditHwPontosFV.AsValue) + ' PONTOS)'
    else
      RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString :=
        'COMPRAS ENTRE' +
        ' R$ ' + FormatFloat('#,##0.00', EditHwValorIniFaixaCompra.AsValue) +
        ' E R$ ' + FormatFloat('#,##0.00', EditHwValorFimFaixaCompra.AsValue) +
        ' (' + FormatFloat('#,##0.00', EditHwPontosFC.AsValue) + ' PONTOS)';
  end
  else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR PRODUTO') then
  begin
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').AsFloat := 1;
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_VC').AsString := IntToStr(StrToIntDef(EditGrupoProduto.Text, 0)) + trim(EditCodProduto.Text);
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('GRUPO_PROD').AsInteger := StrToIntDef(EditGrupoProduto.Text, 0);
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('COD_PROD').AsString := trim(EditCodProduto.Text);

    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString :=
      Copy(IntToStr(StrToIntDef(EditGrupoProduto.Text, 0)) + trim(EditCodProduto.Text) + ' - ' + trim(EditDescricaoProduto.Text), 1, 65) +
      ' (R$ ' + FormatFloat('#,##0.00', 1) + ' EQUIVALENTE ' + FormatFloat('#,##0.00', EditHwPontosProduto.AsValue) + ' PONTOS)';

    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').AsFloat := EditHwPontosProduto.AsValue;
  end
  else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO')
   or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO')
   or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO')
   or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO') then
  begin
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').AsFloat := 1;
    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_F_INI').AsFloat := EditHwKit.AsValue;

    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString :=
      IntToStr(Trunc(EditHwKit.AsValue)) + ' - ' + trim(EditKit.Text) +
      ' (R$ ' + FormatFloat('#,##0.00', 1) + ' EQUIVALENTE ' + FormatFloat('#,##0.00', EditHwPontosKit.AsValue) + ' PONTOS)';

    RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').AsFloat := EditHwPontosKit.AsValue;
  end
  else
  begin
     if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FORMAS DE PAGAMENTO')
      or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'RECEBIMENTO DE PRESTACAO') then
     begin
       RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_VC').AsString := Copy(ComboBoxOutros2.Text, 1, Pos(' - ', ComboBoxOutros2.Text));
       if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FORMAS DE PAGAMENTO')
         and (RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_VC').AsString = 'CRX') then
       begin
         if EditHwDiasPercOutros2.AsValue > 0 then
           RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString :=
             Copy(ComboBoxOutros2.Text, 1, Pos('X%', ComboBoxOutros2.Text) - 2) + ' ' + FloatToStr(EditHwDiasPercOutros2.AsValue) + '% ENTRADA' +
             ' (' + FormatFloat('#,##0.00', EditHwPontosOutros2.AsValue) + ' PONTOS)'
         else
           RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString := ComboBoxOutros2.Text +
           ' (' + FormatFloat('#,##0.00', EditHwPontosOutros2.AsValue) + ' PONTOS)';
       end
       else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'RECEBIMENTO DE PRESTACAO')
         and ((RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_VC').AsString = 'PAX')
           or (RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_VC').AsString = 'PTX')) then
       begin
         if Trunc(EditHwDiasPercOutros2.AsValue) > 0 then
           RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString :=
             Copy(ComboBoxOutros2.Text, 1, Pos(' X DIAS', ComboBoxOutros2.Text) - 1) + ' ' + IntToStr(Trunc(EditHwDiasPercOutros2.AsValue)) + ' DIAS' +
             ' (' + FormatFloat('#,##0.00', EditHwPontosOutros2.AsValue) + ' PONTOS)'
         else
           RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString := ComboBoxOutros2.Text +
             ' (' + FormatFloat('#,##0.00', EditHwPontosOutros2.AsValue) + ' PONTOS)';
       end
       else
         RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString := ComboBoxOutros2.Text +
            ' (' + FormatFloat('#,##0.00', EditHwPontosOutros2.AsValue) + ' PONTOS)';
       RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').AsFloat := EditHwPontosOutros2.AsValue;
       RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').AsFloat := EditHwDiasPercOutros2.AsValue;
     end
     else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'ASSIDUIDADE')
       or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR ASSIDUIDADE') then
     begin
       if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR ASSIDUIDADE') then
         RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').AsFloat := 1;
       RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_VC').AsString := Copy(ComboBoxOutros.Text, 1, Pos(' - ', ComboBoxOutros.Text));
       RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').AsFloat := EditHwPontosOutros.AsValue;

       if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'ASSIDUIDADE') then
         RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString := ComboBoxOutros.Text +
          ' (' + FormatFloat('#,##0.00', EditHwPontosOutros.AsValue) + ' PONTOS)'
       else
         RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString := ComboBoxOutros.Text +
           ' (R$ ' + FormatFloat('#,##0.00', 1) + ' EQUIVALENTE ' + FormatFloat('#,##0.00', EditHwPontosOutros.AsValue) + ' PONTOS)';
     end
     else
     begin
       RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('VALOR_F_INI').AsString := Copy(ComboBoxOutros.Text, 1, Pos(' - ', ComboBoxOutros.Text));
       RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_CONFIG').AsString := ComboBoxOutros.Text +
         ' (' + FormatFloat('#,##0.00', EditHwPontosOutros.AsValue) + ' PONTOS)';
       RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').AsFloat := EditHwPontosOutros.AsValue;
     end;
  end;

  if not RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.Post(RegrasProgramasFidelidades, RegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsInteger) then
  begin
    setFocusCampoErro(RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.vNomeCampoErro, RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.vMensagemErro);
    exit;
  end;
  Label17.Visible := false;
  EditHwDiasPercOutros2.Visible := false;
  CamposModoConsulta;
  if (Self.Enabled) and (Self.Visible) and (BitBtnNovoConf.CanFocus) then
    BitBtnNovoConf.SetFocus;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtnSimularSimClick(
  Sender: TObject);
begin
	try
  	BitBtnSimularSim.Enabled := false;
    BitBtnLancRetroativo.Enabled := false;
    BitBtnVoltarSim.Enabled := false;
    habilitarCampos(false);
    inherited;
    if not vDadosIni.PesqPros('FID012', 'INICIAR SIMULACAO', '', 'REGRAS_PROG_FIDELIDADE',
      '', RegrasProgramasFidelidades.buscas, true) then
     exit;

    if iniciarSimulacao then
      habilitarCampos;
  finally
    BitBtnSimularSim.Enabled := true;
    BitBtnLancRetroativo.Enabled := true;
    BitBtnVoltarSim.Enabled := true;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.BitBtnVoltarConfClick(
  Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtnVoltarConf.CanFocus) then
    BitBtnVoltarConf.SetFocus;
  if vTipoForm = 5 then
  begin
    vTipoForm := 0;
    PageControl1.ActivePage := tsSimulacao;
    tsSimulacao.Show;
    if iniciarSimulacao(false) then
      habilitarCampos;
  end
  else
  begin
    RegrasProgramasFidelidades.retornadados(vSql);
    PageControl1.ActivePage := TabSheet2;
    PageControl3.ActivePage := tsCadastro;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.CamposModoConsulta;
var
 I: Integer;
begin
  RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').DisplayLabel := 'Real';
  
  for I := 0 to DBGrid2.Columns.Count - 1 do
    if trim(DBGrid2.Columns[I].FieldName) = 'PERC_DIA_REAL' then
    begin
       DBGrid2.Columns[I].Visible := vDadosIni.IfThen(
         RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR', true, false);
       Break;
    end;

  for I := 0 to DBGrid2.Columns.Count - 1 do
    if trim(DBGrid2.Columns[I].FieldName) = 'PONTOS' then
    begin
       DBGrid2.Columns[I].Visible := false;
       DBGrid2.Columns[I].Visible := true;
       Break;
    end;

  GroupBoxConfig.Visible := false;
  PanelFaixaCompra.Visible := false;
  PanelProduto.Visible := false;
  PanelOutros.Visible := false;
  PanelOutros2.Visible := false;

  BitBtnNovoConf.Enabled := true;
  BitBtnExcluirConf.Enabled := true;
  BitBtnSalvarConf.Enabled := false;
  BitBtnCancelarConf.Enabled := false;
  BitBtnVoltarConf.Enabled := true;
  DBGrid2.Enabled := true;

  Label17.Visible := false;
  EditHwDiasPercOutros2.Visible := false;
end;

procedure TfrmCadRegrasProgramaFidelidade.CamposModoInsercao;
begin
  GroupBoxConfig.Visible := true;
  
  PanelFaixaCompra.Visible := (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA VALOR DE COMPRA')
     or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR');
     
  PanelProduto.Visible :=
    (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR PRODUTO');

  PanelKit.Visible := (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO')
    or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO')
    or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO')
    or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO');

  if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO') then
    Label21.Caption := 'Kit:'
  else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO') then
    Label21.Caption := 'Grupo:'
  else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO') then
    Label21.Caption := 'Sub Grupo:'
  else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO') then
    Label21.Caption := 'Marca:';

  PanelOutros2.Visible := (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'RECEBIMENTO DE PRESTACAO')
    or (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FORMAS DE PAGAMENTO');

  PanelOutros.Visible := (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'FAIXA VALOR DE COMPRA')
    and (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'FAIXA DE PONTOS POR VALOR')
    and (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'FAIXA DE PONTOS POR PRODUTO')
    and (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'FAIXA DE PONTOS POR GRUPO DE PRODUTO')
    and (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO')
    and (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'FAIXA DE PONTOS POR MARCA DE PRODUTO')
    and (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'FAIXA DE PONTOS POR KIT DE PRODUTO')
    and (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'RECEBIMENTO DE PRESTACAO')
    and (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString <> 'FORMAS DE PAGAMENTO');

  PanelFC.Visible := (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA VALOR DE COMPRA');
  PanelFV.Visible := (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR');

  PanelFaixaCompra.Height := vDadosIni.IfThen(PanelFCFV.Visible, PanelFCFV.Height, 0) +
    vDadosIni.IfThen(PanelFC.Visible, PanelFC.Height + 10, 0) +
    vDadosIni.IfThen(PanelFV.Visible, PanelFV.Height + 10, 0);

  GroupBoxConfig.Height := vDadosIni.IfThen(PanelFaixaCompra.Visible, PanelFaixaCompra.Height + 20, 0) +
    vDadosIni.IfThen(PanelProduto.Visible, PanelProduto.Height + 10, 0) +
    vDadosIni.IfThen(PanelKit.Visible, PanelKit.Height + 10, 0) +
    vDadosIni.IfThen(PanelOutros2.Visible, PanelOutros2.Height + 10, 0) +
    vDadosIni.IfThen(PanelOutros.Visible, PanelOutros.Height + 10, 0);

  BitBtnNovoConf.Enabled := false;
  BitBtnExcluirConf.Enabled := false;
  BitBtnSalvarConf.Enabled := true;
  BitBtnCancelarConf.Enabled := true;
  BitBtnVoltarConf.Enabled := false;
  DBGrid2.Enabled := false;

//  ComboBoxOutros.Text := '';
//  EditHwPontosOutros.AsValue := 0;
//  ComboBoxCondInicialFaixaCompra.ItemIndex := 0;
//  ComboBoxCondFinalFaixaCompra.ItemIndex := 0;
//  EditHwValorIniFaixaCompra.AsValue := 0;
//  EditHwValorFimFaixaCompra.AsValue := 0;
//  EditHwPontosOutros.AsValue := 0;
//  EditHwPontosOutros2.AsValue := 0;
//  EditHwPontosProduto.AsValue := 0;
   ComboBoxOutros.ItemIndex := -1;
   EditHwPontosOutros.AsValue := 0;

   ComboBoxOutros2.ItemIndex := -1;
   EditHwDiasPercOutros2.AsValue := 0;
   EditHwPontosOutros2.AsValue := 0;

   ComboBoxCondInicialFaixaCompra.ItemIndex := 0;
   ComboBoxCondFinalFaixaCompra.ItemIndex := 0;
   EditHwValorIniFaixaCompra.AsValue := 0;
   EditHwValorFimFaixaCompra.AsValue := 0;
   EditHwPontosFC.AsValue := 0;
   EditHwRealFV.AsValue := 1;
   EditHwPontosFV.AsValue := 0;
   
   EditHwKit.AsValue := 0;
   EditKit.Text := '';
   EditHwPontosKit.AsValue := 0;
   
   EditNumFabProduto.Text := '';
   EditGrupoProduto.Text := '';
   EditCodProduto.Text := '';
   EditHwPontosProduto.AsValue := 0;
end;

procedure TfrmCadRegrasProgramaFidelidade.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadRegrasProgramaFidelidade.DBGrid2ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
    cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmCadRegrasProgramaFidelidade.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
    cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmCadRegrasProgramaFidelidade.DBGrid2TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid2,Column);
end;

procedure TfrmCadRegrasProgramaFidelidade.desativarClasse(pTipo: string);
begin
  if trim(pTipo) <> '' then
    RegrasProgramasFidelidades.abreRegrasProgramaFidelidades(pTipo);
  if RegrasProgramasFidelidades.dataSet.IsEmpty then
     Exit;

  if not RegrasProgramasFidelidades.ativarDesativarClasse(false) then
    exit;
  if trim(ptipo) <> '' then
    if iniciarSimulacao(false) then
    	habilitarCampos;
end;

procedure TfrmCadRegrasProgramaFidelidade.EditHwKitExit(Sender: TObject);
var
 vkit: string;
begin
   if (activecontrol = BitBtnCancelarConf)  then
    Exit;

  if EditHwKit.AsValue < 0 then
  begin
   EditKit.Text := '';
   exit;
  end;

  if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO') then
  begin
    if not RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.buscakit(Trunc(EditHwKit.AsValue), vkit) then
    begin
      EditKit.Text := '';
      if (Self.Enabled) and (Self.Visible) and (EditKit.CanFocus) then
        EditKit.SetFocus;
       exit;
    end
    else
    begin
       EditKit.Text := vkit;
    end;
  end
  else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO') then
  begin
    if not RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.buscaGrupo(Trunc(EditHwKit.AsValue), vkit) then
    begin
      EditKit.Text := '';
      if (Self.Enabled) and (Self.Visible) and (EditKit.CanFocus) then
        EditKit.SetFocus;
       exit;
    end
    else
    begin
       EditKit.Text := vkit;
    end;
  end
  else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO') then
  begin
    if not RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.buscaSubGrupo(Trunc(EditHwKit.AsValue), vkit) then
    begin
      EditKit.Text := '';
      if (Self.Enabled) and (Self.Visible) and (EditKit.CanFocus) then
        EditKit.SetFocus;
       exit;
    end
    else
    begin
       EditKit.Text := vkit;
    end;
  end
  else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO') then
  begin
    if not RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.buscaMarca(Trunc(EditHwKit.AsValue), vkit) then
    begin
      EditKit.Text := '';
      if (Self.Enabled) and (Self.Visible) and (EditKit.CanFocus) then
        EditKit.SetFocus;
       exit;
    end
    else
    begin
       EditKit.Text := vkit;
    end;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.EditHwKitKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO') then
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('KITS_PROD')
      else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO') then
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRUPOS')
      else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO') then
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SUB_GRUPO')
      else if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO') then
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
      if (Trim(vDadosIni.vPesquisa) = '') or (Trim(vDadosIni.vPesquisa) = '0') then
        exit;
      EditHwKit.AsValue :=  StrToIntDef(vDadosIni.vPesquisa, 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.EditHwTaxConvExit(Sender: TObject);
var
 vTemp, vTemp2: string;
begin
  vTemp := StringReplace(LabelTotPontosG.Caption, '.', '', [rfReplaceAll]);
  vTemp2 := StringReplace(LabelFatP.Caption, '.', '', [rfReplaceAll]);
  if StrToFloat(vTemp) > 0 then
  begin
    EditHwValorDesp.AsValue := EditHwTaxConv.AsValue * StrToFloat(vTemp);
    LabelPerDesp.Caption := FormatFloat('#0.00', ((EditHwValorDesp.AsValue / StrToFloat(vTemp2)) * 100));
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.EditHwValorDespExit(Sender: TObject);
var
  vTemp, vTemp2: string;
begin
  vTemp := StringReplace(LabelTotPontosG.Caption, '.', '', [rfReplaceAll]);
  vTemp2 := StringReplace(LabelFatP.Caption, '.', '', [rfReplaceAll]);
  if StrToFloat(vTemp) > 0 then
  begin
    EditHwTaxConv.AsValue := EditHwValorDesp.AsValue / StrToFloat(vTemp);
    LabelPerDesp.Caption := FormatFloat('#0.00', ((EditHwValorDesp.AsValue / StrToFloat(vTemp2)) * 100));
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.EditNumFabProdutoExit(
  Sender: TObject);
var
  vgrupoprod, vcodprod, vdescricaoprod: string;
begin
  if (activecontrol = BitBtnCancelarConf)  then
    Exit;

  if trim(EditNumFabProduto.Text) = '' then
  begin
    EditGrupoProduto.Text := '';
    EditCodProduto.Text := '';
    EditDescricaoProduto.Text := '';
    exit;
  end;
   

  if not RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.buscaProduto( 
    EditNumFabProduto.Text, vgrupoprod, vcodprod, vdescricaoprod) then
  begin
    EditGrupoProduto.Text := '';
    EditCodProduto.Text := '';
    EditDescricaoProduto.Text := '';
    if (Self.Enabled) and (Self.Visible) and (EditNumFabProduto.CanFocus) then
     	EditNumFabProduto.SetFocus;
     exit;
  end
  else
  begin
     EditGrupoProduto.Text := vgrupoprod;
     EditCodProduto.Text := vcodprod;
     EditDescricaoProduto.Text := vdescricaoprod
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.EditNumFabProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;
      EditNumFabProduto.Text := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if not Assigned(DBGrid2.DataSource) then
    Exit;
  if not Assigned(DBGrid2.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa2 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
    cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid2, GridCfg2, true, ListPositions2, cdsGrid2);

  if (RegrasProgramasFidelidades <> nil) then
    RegrasProgramasFidelidades.Cancel;
  RegrasProgramasFidelidades.free;

  Action := caFree;
  if (frmCadRegrasProgramaFidelidade <> nil) then
    frmCadRegrasProgramaFidelidade := nil;
end;

procedure TfrmCadRegrasProgramaFidelidade.FormCreate(Sender: TObject);
begin
  inherited;
  vTipoForm := 0; 
  tsCadastro.TabVisible := False;
  tsSimulacao.TabVisible := False;
  tsAtuar.TabVisible := False;
  RegrasProgramasFidelidades := TRegrasProgramasFidelidades.create;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadRegrasProgramaFidelidade.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsRegrasProgramasFid;
    DBGrid2.DataSource := dtmConfig.dsConfigRegrasFid;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet2, GridCfg2, DBGrid2, cdsGrid2, cdsColunas2, trans2, ListGridsAndDataSets2,
      ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario);
  end;
  RegrasProgramasFidelidades.abreRegrasProgramaFidelidades;

  if PrimeiraPesquisa2 then
  begin
    PrimeiraPesquisa2 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid2, GridCfg2, cdsGrid2, cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
  end;

  MaskEditIniSim.Text := DateToStr(date);
  MaskEditFimSim.Text := DateToStr(date);

  PageControl2.ActivePage := tsResumo;

  ckDet.Checked := _LerConfiguracoesRegistroBoolean('ckDet');
//  EditHwValorDesp.AsValue := _LerConfiguracoesRegistroDouble('EditHwValorDesp');
  habilitarCampos(false);

  ComboBoxCondInicialFaixaCompra.Items.Clear;
  ComboBoxCondInicialFaixaCompra.Items.Add('Maior igual');
//  ComboBoxCondInicialFaixaCompra.Items.Add('Maior');

  ComboBoxCondFinalFaixaCompra.Items.Clear;
  ComboBoxCondFinalFaixaCompra.Items.Add('Menor igual');
//  ComboBoxCondFinalFaixaCompra.Items.Add('Menor');

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "FID014" PERMITIR CONFIRMAR SIMULACAO COM DATA DE CADASTRO JA EXISTENTE' + #13 +
    'Processo "FID015" PERMITIR CONFIRMAR SIMULACAO COM DATA DE VENCIMENTO JA EXISTENTE';
    
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadRegrasProgramaFidelidade.habilitarCampos(pHab: boolean);
begin
  Label70.Visible := pHab;
  LabelPerDesp.Visible := pHab;
  Label71.Visible := pHab;
  EditHwValorDesp.Visible := pHab;
  Label72.Visible := pHab;
  EditHwTaxConv.Visible := pHab;
  Label73.Visible := pHab;
  EditHwPeriodoVenc.Visible := pHab;
  btConfirmarSimulacao.Visible := pHab;
  BitBtnLancRetroativo.Visible := pHab;
  PanelProg.Visible := false;

  if not pHab then
  begin
    tsResumo.TabVisible := pHab;
    tsFaixaPontosValor.TabVisible := pHab;
    tsAsseduidade.TabVisible := pHab;
    tsFaixaCompra.TabVisible := pHab;
    tsFaixaProduto.TabVisible := pHab;
    tsFaixaGrupoProd.TabVisible := pHab;
    tsFaixaSubGrupoProd.TabVisible := pHab;
    tsFaixaMarcaProd.TabVisible := pHab;
    tsFaixaKitProd.TabVisible := pHab;
    tsRecPrest.TabVisible := pHab;
    tsFaixaAsseduidade.TabVisible := pHab;
    tsFormasPag.TabVisible := pHab;

    LabelFatP.Caption := '0';
    LabelQtdVndP.Caption := '0';
    LabelQtdDevP.Caption := '0';
    LabelFatDevP.Caption := '0';
    LabelQtdDevAvulsasP.Caption := '0';
    LabelFatDevAvulsasP.Caption := '0';
    LabelTotPontosG.Caption := '0';
    ProgressBar1.Position := 1;
    ProgressBar1.Position := 0;
    ProgressBar1.Max := 0;
    RegrasProgramasFidelidades.atualizarDataUltimaDefClasse(LabelDataDefClasse);
  end;                 
  LabelPerDesp.Caption := '0';
  EditHwValorDesp.AsValue := 0;
  EditHwTaxConv.AsValue := 0;
  EditHwPeriodoVenc.AsValue := 365;
end;

function TfrmCadRegrasProgramaFidelidade.iniciarSimulacao(pExibirMens: boolean = true): boolean;
begin
  try
    Result := false;
    Screen.Cursor := crHourGlass;
    if not RegrasProgramasFidelidades.simularProgramaFidelidade(MaskEditIniSim.Text, MaskEditFimSim.Text,
     StringGridResumo, ckDet.Checked, pExibirMens) then
      exit;
    tsResumo.Show;
    Result := True;
  finally
    Screen.Cursor := crDefault;
    _GravaConfiguracoesBoolean('ckDet', ckDet.Checked);
//    _GravaConfiguracoesDouble('EditHwValorDesp', EditHwValorDesp.AsValue);
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.ComboBoxOutros2Exit(Sender: TObject);
begin
  if (RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'RECEBIMENTO DE PRESTACAO') then
  begin
    EditHwDiasPercOutros2.Visible := false;

    Label17.Visible := (Pos('PAX -', TComboBox(Sender).Text) > 0) or (Pos('PTX -', TComboBox(Sender).Text) > 0);
    EditHwDiasPercOutros2.Visible := (Pos('PAX -', TComboBox(Sender).Text) > 0) or (Pos('PTX -', TComboBox(Sender).Text) > 0);
    if EditHwDiasPercOutros2.Visible then
    begin
      EditHwDiasPercOutros2.TabOrder := 1;
      EditHwPontosOutros2.TabOrder := 2;
      if (Self.Enabled) and (Self.Visible) and (EditHwDiasPercOutros2.CanFocus) then
        EditHwDiasPercOutros2.SetFocus;
    end;
  end
  else if RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FORMAS DE PAGAMENTO' then
  begin
    EditHwDiasPercOutros2.Visible := false;

    Label17.Visible := (Pos('CRX -', TComboBox(Sender).Text) > 0);
    EditHwDiasPercOutros2.Visible := (Pos('CRX -', TComboBox(Sender).Text) > 0);
    if EditHwDiasPercOutros2.Visible then
    begin
      EditHwDiasPercOutros2.TabOrder := 1;
      EditHwPontosOutros2.TabOrder := 2;
      if (Self.Enabled) and (Self.Visible) and (EditHwDiasPercOutros2.CanFocus) then
        EditHwDiasPercOutros2.SetFocus;
    end;
  end
  else
  begin
//    Label17.Visible := false;
//    EditHw7.Visible := false;
//    EditHw5.Visible := false;
//
//    ComboBoxOutros2.Visible := true;
//    EditHw5.Visible := true;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.configClasse(pTipo: string);
begin
  try
   if trim(pTipo) <> '' then
   begin
     vTipoForm := 5;
     RegrasProgramasFidelidades.abreRegrasProgramaFidelidades(pTipo);
   end;
   if RegrasProgramasFidelidades.dataSet.IsEmpty then
     Exit;

   if not vDadosIni.PesqPros('FID003', 'CONFIGURAR', '', 'REGRAS_PROG_FIDELIDADE',
     RegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsString, RegrasProgramasFidelidades.buscas, true) then
    exit;

   CamposModoConsulta;
   RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.abreConfigRegrasProgramaFidelidades(RegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsInteger);
   RegrasProgramasFidelidades.atualizarCombobox(ComboBoxOutros, ComboBoxOutros2, Label17);


   if RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR' then
   begin
     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').Visible := false;
     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').Visible := false;

     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').Tag := 2;
     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').Tag := 2;

     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').Visible := true;
     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').Visible := true;
   end
   else
   begin
     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').Visible := false;
     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').Visible := false;

     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').Tag := 1;
     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').Tag := 2;

     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PERC_DIA_REAL').Visible := false;
     RegrasProgramasFidelidades.vConfigRegrasProgramasFidelidades.dataSet.FieldByName('PONTOS').Visible := true;
   end;


   Panel4.Caption := IntToStr(RegrasProgramasFidelidades.dataSet.FieldByName('COD_TP_REGRA').AsInteger) +
     ' - ' + trim(RegrasProgramasFidelidades.dataSet.FieldByName('DESCRICAO_REGRA').AsString);
   PageControl1.ActivePage := TabSheet1;
   PageControl3.ActivePage := tsCadastro;

   if (Self.Enabled) and (Self.Visible) and (BitBtnNovoConf.CanFocus) then
     BitBtnNovoConf.SetFocus;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
    end;
  end;
end;

procedure TfrmCadRegrasProgramaFidelidade.Configurarcolunas2Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGrid2, GridCfg2, cdsGrid2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmCadRegrasProgramaFidelidade.Copiarparareadetransferncia1Click(
  Sender: TObject);
begin
  Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TfrmCadRegrasProgramaFidelidade.ReajustarLarguradascolunas1Click(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid2);
end;

procedure TfrmCadRegrasProgramaFidelidade.ResetarConfiguraesdecolunas2Click(
  Sender: TObject);
begin
   vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid2, GridCfg2, cdsColunas2, cdsGrid2, usuario,
     vDadosIni.transacaoCol, fReset2, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TfrmCadRegrasProgramaFidelidade.SalvardadosnoExcel2Click(
  Sender: TObject);
begin
   vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid2, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.ScrollBox4Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmCadRegrasProgramaFidelidade.Somarvaloresdacoluna2Click(
  Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid2, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarFaixaPontosClick(Sender: TObject);
begin
  ativarClasse(GroupBoxFaixaPontosPorValor.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarFaixaSubGrupoClick(
  Sender: TObject);
begin
  ativarClasse(GroupBoxFaixaSubGrupoProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.SpeedButton11Click(Sender: TObject);
begin
  if vDadosIni.vEmp.vConfFormPagamento <> 'PED' then
  begin
    Application.MessageBox('Sistema deve estar configurado para usar forma de pagamento do pedido (REQ, OS, MOT)!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  if not vDadosIni.vProgFid.vHabilitarProgFid then
  begin
    Application.MessageBox('Programa de fidelidade desabilitado!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  if not vDadosIni.testarControleProgFid(RegrasProgramasFidelidades.buscas) then
    exit;
  
  if RegrasProgramasFidelidades.dataSet.IsEmpty then
     Exit;

  if not vDadosIni.PesqPros('FID011', 'SIMULAR', '', 'REGRAS_PROG_FIDELIDADE',
    '', RegrasProgramasFidelidades.buscas, true) then
   exit;

  vSql := RegrasProgramasFidelidades.dataSet.CommandText;  
  PageControl1.ActivePage := tsSimulacao;
  tsSimulacao.Show;
  if (Self.Enabled) and (Self.Visible) and (MaskEditIniSim.CanFocus) then
    MaskEditIniSim.SetFocus;
end;

procedure TfrmCadRegrasProgramaFidelidade.SpeedButton12Click(Sender: TObject);
begin
  if vDadosIni.vEmp.vConfFormPagamento <> 'PED' then
  begin
    Application.MessageBox('Sistema deve estar configurado para usar forma de pagamento do pedido (REQ, OS, MOT)!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;
  
  if not vDadosIni.vProgFid.vHabilitarProgFid then
  begin
    Application.MessageBox('Programa de fidelidade desabilitado!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;
      
  if not vDadosIni.testarControleProgFid(RegrasProgramasFidelidades.buscas) then
    exit;
  
  ativarClasse('');
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarFaixaPontosClick(Sender: TObject);
begin
  desativarClasse(GroupBoxFaixaPontosPorValor.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarFaixaSubGrupoClick(
  Sender: TObject);
begin
  desativarClasse(GroupBoxFaixaSubGrupoProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigAsseduidadeClick(Sender: TObject);
begin
  configClasse(GroupBoxAssiduidade.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAdicionarFaixaGrupoProdClick(
  Sender: TObject);
begin
  ativarClasse(GroupBoxFaixaGrupoProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarAsseduidadeClick(Sender: TObject);
begin
  ativarClasse(GroupBoxAssiduidade.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarConfigFaixaProdutoClick(
  Sender: TObject);
begin
  ativarClasse(GroupBoxFaixaProduto.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarAsseduidadeClick(Sender: TObject);
begin
  desativarClasse(GroupBoxAssiduidade.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarConfigFaixaProdutoClick(
  Sender: TObject);
begin
  desativarClasse(GroupBoxFaixaProduto.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFaixaAsseduidadeClick(Sender: TObject);
begin
  inherited;
  configClasse(GroupBoxFaixaAssiduidade.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarFaixaAsseduidadeClick(Sender: TObject);
begin
  ativarClasse(GroupBoxFaixaAssiduidade.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarFaixaKitProdClick(
  Sender: TObject);
begin
  ativarClasse(GroupBoxFaixaKitProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarFaixaMarcaProdClick(
  Sender: TObject);
begin
  ativarClasse(GroupBoxFaixaMarca.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarFaixaAsseduidadeClick(Sender: TObject);
begin
  desativarClasse(GroupBoxFaixaAssiduidade.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.SpeedButton1Click(Sender: TObject);
begin
  if vDadosIni.vEmp.vConfFormPagamento <> 'PED' then
  begin
    Application.MessageBox('Sistema deve estar configurado para usar forma de pagamento do pedido (REQ, OS, MOT)!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;
  
  if not vDadosIni.vProgFid.vHabilitarProgFid then
  begin
    Application.MessageBox('Programa de fidelidade desabilitado!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;
      
  if not vDadosIni.testarControleProgFid(RegrasProgramasFidelidades.buscas) then
    exit;

  vSql := RegrasProgramasFidelidades.dataSet.CommandText;
  configClasse('');
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFormasPagClick(Sender: TObject);
begin
  configClasse(GroupBoxFormasPag.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarFormasPagClick(Sender: TObject);
begin
  ativarClasse(GroupBoxFormasPag.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.BtDesativarFormasPagClick(Sender: TObject);
begin
  desativarClasse(GroupBoxFormasPag.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.SpeedButton23Click(Sender: TObject);
begin
  if vDadosIni.vEmp.vConfFormPagamento <> 'PED' then
  begin
    Application.MessageBox('Sistema deve estar configurado para usar forma de pagamento do pedido (REQ, OS, MOT)!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;
  
  if not vDadosIni.vProgFid.vHabilitarProgFid then
  begin
    Application.MessageBox('Programa de fidelidade desabilitado!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  if not vDadosIni.testarControleProgFid(RegrasProgramasFidelidades.buscas) then
    exit;

  desativarClasse('');
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFaixaCompraClick(Sender: TObject);
begin
  configClasse(GroupBoxFaixaCompra.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFaixaGrupoProdClick(
  Sender: TObject);
begin
  configClasse(GroupBoxFaixaGrupoProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFaixaMarcaProdClick(
  Sender: TObject);
begin
  configClasse(GroupBoxFaixaMarca.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.tbAtivarFaixaCompraClick(Sender: TObject);
begin
  ativarClasse(GroupBoxFaixaCompra.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarFaixaCompraClick(Sender: TObject);
begin
  desativarClasse(GroupBoxFaixaCompra.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarFaixaGrupoProdClick(
  Sender: TObject);
begin
  desativarClasse(GroupBoxFaixaGrupoProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarFaixaKitProdClick(
  Sender: TObject);
begin
  desativarClasse(GroupBoxFaixaKitProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarFaixaMarcaProdClick(
  Sender: TObject);
begin
  desativarClasse(GroupBoxFaixaMarca.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigurarRecPrestClick(Sender: TObject);
begin
  configClasse(GroupBoxRecPrest.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btAtivarRecPrestClick(Sender: TObject);
begin
  ativarClasse(GroupBoxRecPrest.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btDesativarRecPrestClick(Sender: TObject);
begin
  desativarClasse(GroupBoxRecPrest.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('prog_fid_%', RegrasProgramasFidelidades.buscas);
end;

procedure TfrmCadRegrasProgramaFidelidade.SpeedButton6Click(Sender: TObject);
begin
  if not RegrasProgramasFidelidades.abreFormAtuacao then
    exit;
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfirmarSimulacaoClick(Sender: TObject);
begin
  if not RegrasProgramasFidelidades.confirmarSimulacao(EditHwValorDesp.AsValue, EditHwTaxConv.AsValue, Trunc(EditHwPeriodoVenc.AsValue),
  	 StrToFloat(StringReplace(LabelFatP.Caption, '.', '', [rfReplaceAll])),
    StrToFloat(StringReplace(LabelTotPontosG.Caption, '.', '', [rfReplaceAll])),
    StrToInt(StringReplace(LabelQtdVndP.Caption, '.', '', [rfReplaceAll])),
    StrToInt(StringReplace(LabelQtdDevP.Caption, '.', '', [rfReplaceAll])),
    StrToFloat(StringReplace(LabelFatVndP.Caption, '.', '', [rfReplaceAll])),
    StrToFloat(StringReplace(LabelFatDevP.Caption, '.', '', [rfReplaceAll])),
    StrToInt(StringReplace(LabelQtdDevAvulsasP.Caption, '.', '', [rfReplaceAll])),
    StrToFloat(StringReplace(LabelFatDevAvulsasP.Caption, '.', '', [rfReplaceAll])),
    StrToInt(StringReplace(LabelQtdVales.Caption, '.', '', [rfReplaceAll])),
    StrToFloat(StringReplace(LabelFatVales.Caption, '.', '', [rfReplaceAll])),
    RegrasProgramasFidelidades.vDataIniSim, RegrasProgramasFidelidades.vDataFimSim) then
  begin
    setFocusCampoErro(RegrasProgramasFidelidades.vNomeCampoErro, RegrasProgramasFidelidades.vMensagemErro);
    exit;
  end;
  habilitarCampos(false);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFaixaKitProdClick(Sender: TObject);
begin
  configClasse(GroupBoxFaixaKitProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFaixaPontosClick(Sender: TObject);
begin
  inherited;
  configClasse(GroupBoxFaixaPontosPorValor.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFaixaProdutoClick(
  Sender: TObject);
begin
  configClasse(GroupBoxFaixaProduto.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.btConfigFaixaSubGrupoClick(
  Sender: TObject);
begin
  configClasse(GroupBoxFaixaSubGrupoProd.Caption);
end;

procedure TfrmCadRegrasProgramaFidelidade.StringGridResumoDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (Pos('TOTAL CLASSE', StringGridResumo.Cells[0, ARow]) > 0)
    or (Pos('TOTAL GERAL', StringGridResumo.Cells[0, ARow]) > 0) then
  begin
     StringGridResumo.Canvas.Brush.Color := TColor($00E2E3D5); // Cor
     StringGridResumo.Canvas.Font.Style := [fsBold, fsUnderline];
  end;

//  if (gdFixed in State) then
//     StringGridResumo.Canvas.Brush.Color := clBtnFace;
   StringGridResumo.Canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 2, StringGridResumo.Cells[Acol,Arow]);
end;

end.
