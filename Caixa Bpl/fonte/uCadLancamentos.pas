unit uCadLancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, uClassesLancamentos, QRCtrls, QuickRpt,
  uEditHw, uEditMoeda, DBClient, IBDatabase;

type
  TfrmLancamentos = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBComboBox2: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel4: TPanel;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    ckbNaoQuitado: TCheckBox;
    ckbQuitado: TCheckBox;
    GroupBox5: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    tsPrevisao: TTabSheet;
    QuickRep1: TQuickRep;
    QRBand4: TQRBand;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRBand5: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    qrlNome_Emp: TQRLabel;
    tsRel: TTabSheet;
    RelLanc: TQuickRep;
    QRBand2: TQRBand;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel39: TQRLabel;
    QRSysData8: TQRSysData;
    QRShape1: TQRShape;
    QRShape11: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRBand11: TQRBand;
    QRLabel49: TQRLabel;
    QRShape12: TQRShape;
    qrlNomeEmpresa: TQRLabel;
    tsTransf: TTabSheet;
    pnTransf: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    MainMenu1: TMainMenu;
    Edit1: TEdit;
    Label21: TLabel;
    Panel7: TPanel;
    Label22: TLabel;
    DBGrid3: TDBGrid;
    Edit2: TEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    EditHw1: TEditHw;
    Label23: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBLookupComboBox3: TDBLookupComboBox;
    Label24: TLabel;
    DBEdit14: TDBEdit;
    Label25: TLabel;
    Edit3: TEdit;
    tsEstonarValeCompra: TTabSheet;
    pnEstonarValeCompra: TPanel;
    pnOpEstornarVale: TPanel;
    BitBtnOKEstornaVale: TBitBtn;
    BitBtnCancelarEstornarVale: TBitBtn;
    pnInfReciboEstorna: TPanel;
    pnOPInfReciboEstorna: TPanel;
    BitBtnOKInfReciboEstorna: TBitBtn;
    lbCabInfReciboEstorna: TLabel;
    lbValorBaixaInfReciboEstorna: TLabel;
    edValorBaixaReciboEstorna: TEditMoeda;
    GroupBoxRecibosEstornarVale: TGroupBox;
    gridRecibosEstornarVale: TDBGrid;
    pnCorReciboEstorno: TPanel;
    lnTxtReciboEstorno: TLabel;
    BitBtnCancelarInfReciboEstorna: TBitBtn;
    BitBtnEstornarEstornaVale: TBitBtn;
    BitBtnFecharEstornarVale: TBitBtn;
    BitBtnImprimirEstornaVale: TBitBtn;
    edNumReciboEstornaVale: TEdit;
    lbNumReciboEstornaVale: TLabel;
    SpeedButton59: TSpeedButton;
    SpeedButton22: TSpeedButton;
    Splitter3: TSplitter;
    ckFormasPag: TCheckBox;
    PopupMenu4: TPopupMenu;
    Configurarcolunas4: TMenuItem;
    ResetarConfiguraesdecolunas4: TMenuItem;
    SalvardadosnoExcel4: TMenuItem;
    ReajustarLarguradascolunas4: TMenuItem;
    Copiarparareadetransferncia4: TMenuItem;
    Somarvaloresdacoluna4: TMenuItem;
    gpDetalhesLanc: TGroupBox;
    pnDetalhesLanc: TPanel;
    DBGrid4: TDBGrid;
    GroupBox6: TGroupBox;
    ScrollBox4: TScrollBox;
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid4ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure Somarvaloresdacoluna4Click(Sender: TObject);
    procedure Copiarparareadetransferncia4Click(Sender: TObject);
    procedure ReajustarLarguradascolunas4Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas4Click(Sender: TObject);
    procedure Configurarcolunas4Click(Sender: TObject);
    procedure SalvardadosnoExcel4Click(Sender: TObject);
    procedure Splitter3Moved(Sender: TObject);
    procedure ckFormasPagClick(Sender: TObject);
    procedure ComboBox12Enter(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure edNumReciboEstornaValeEnter(Sender: TObject);
    procedure edNumReciboEstornaValeExit(Sender: TObject);
    procedure BitBtnImprimirEstornaValeClick(Sender: TObject);
    procedure BitBtnFecharEstornarValeClick(Sender: TObject);
    procedure BitBtnEstornarEstornaValeClick(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure BitBtnCancelarInfReciboEstornaClick(Sender: TObject);
    procedure BitBtnCancelarEstornarValeClick(Sender: TObject);
    procedure BitBtnOKEstornaValeClick(Sender: TObject);
    procedure BitBtnOKInfReciboEstornaClick(Sender: TObject);
    procedure gridRecibosEstornarValeDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridRecibosEstornarValeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure RelLancPreview(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure habilitarRemoverColunaCel(pHabDes: Integer = 0);
    procedure edNumReciboEstornaValeChange(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    { Private declarations }
    vCriou: Smallint;
    vBoolTemp: Boolean;
    procedure FormKeyDownTransferencia(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    { Public declarations }
    procedure FormShowTransferencia(Sender: TObject);
  end;

var
  frmLancamentos: TfrmLancamentos;
  cadLanc : TLancamentos;
  vTipoE, vTipoS: string;

  PrimeiraPesquisa4: Boolean;
  TemColunasComPosicaoAlteradas4: Boolean;
  vConfigColuna4 : boolean;
  campoPesquisa4: string;
  cdsColunas4: TClientDataSet;

  cdsGrid4: TClientDataSet;
  GridCfg4: TDBGrid;
  ListGridsAndDataSets4: TStrings;
  ListPositions4: TStrings;

  fReset4, vCtrlClick, vShiftClick: Boolean;

  trans: TIBTransaction;
  vTabela4, vCampoPadrao4: string;
  nomeDTSEt4, vAlterarNomeDtSet4, usuario: string;
  vCamposPadraoRegistro4: Boolean;

implementation

uses
  uDtmLancamentos, uDtmAtivo, DB, uDadosIni, uDataSet_OOP, Clipbrd;

{$R *.dfm}

procedure TfrmLancamentos.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Pesquisando Lançamentos');
    inherited;
    if not vDadosIni.PesqPros('LANC002', 'CONSULTAR', '', 'LANCAMENTOS', '',
      cadLanc.buscas, False) then
      exit;
    cadLanc.vCons.campo := ComboBox1.Text;
    cadLanc.vCons.ordem := ComboBox2.Text;
    cadLanc.vCons.condicao := ComboBox3.Text;
    cadLanc.vCons.valor := MaskEdit3.Text;
    cadLanc.vCons.dataIni := MaskEdit1.Text;
    cadLanc.vCons.dataFim := MaskEdit2.Text;
    cadLanc.vCons.porData := MaskEdit1.Visible;

    cadLanc.vCons.campoAd := ComboBox11.Text;
    cadLanc.vCons.valorAd := MaskEdit7.Text;
    cadLanc.vCons.dataIniAd := MaskEdit9.Text;
    cadLanc.vCons.dataFimAd := MaskEdit8.Text;
    cadLanc.vCons.condicaoAd := ComboBox12.Text;
    cadLanc.vCons.porDataAd := MaskEdit9.Visible;

    cadLanc.vCons.naoQuitados := ckbNaoQuitado.Checked;
    cadLanc.vCons.quitados := ckbQuitado.Checked;
    cadLanc.vCons.adicional := CheckBox1.Checked;

    cadLanc.vCons.tipoE := vTipoE;
    cadLanc.vCons.tipoS := vTipoS;

    cadLanc.consulta;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

    if PrimeiraPesquisa4 then
    begin
      PrimeiraPesquisa4 := False;
      vDadosIni.configurarGridPeloConfigColunas(DBGrid4, GridCfg4, cdsGrid4, cdsColunas4, usuario, ListGridsAndDataSets4, vDadosIni.transacaoCol);
    end;

    if ckFormasPag.Checked then
      if cadLanc.dataSet.IsEmpty then
        cadLanc.vFpLanc.dataSet.EmptyDataSet;
  finally
  	gravaConfiguracoesFormRegistro;
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancamentos.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', cadLanc.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(cadLanc.buscas) then
      Exit;
    if not cadLanc.Insert then
      exit;
    if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
      BitBtn3.SetFocus;
    inherited;
    habilitarRemoverColunaCel(0);
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;
    Label24.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit14.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBLookupComboBox3.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

    DBEdit3.Enabled := False;
    DBEdit4.Enabled := False;
    DBEdit9.Enabled := True;
    DBLookupComboBox2.Enabled := True;
    DBEdit7.Enabled := True;
//    DBEdit8.Enabled := True;

    DBEdit14.Enabled := True;
    DBLookupComboBox3.Enabled := True;

    DBEdit7.Enabled := True;
    DBEdit9.Enabled := True;
    DBLookupComboBox2.Enabled := True;
    cadLanc.vNumConta := 0;
    cadLanc.vpermitir := false;

    if (Self.Enabled) and (Self.Visible) and (DBEdit14.CanFocus) then
      DBEdit14.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
      DBLookupComboBox3.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      DBLookupComboBox1.SetFocus
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancamentos.BitBtn4Click(Sender: TObject);
begin
  try
    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
	   BitBtn4.SetFocus;
    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(cadLanc.buscas) then
      Exit;
    if not cadLanc.vPCont.IsEmpty then
    begin
      BitBtn4.Visible := cadLanc.vPCont.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString <> 'S';
      BitBtn5.Visible := cadLanc.vPCont.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString <> 'S';
      BitBtn6.Visible := cadLanc.vPCont.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString <> 'S';
      DBGrid1.Visible := cadLanc.vPCont.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString <> 'S';
    end;

    if not cadLanc.post then
    begin
      PageControl3.ActivePage := TabSheet3;
      setFocusCampoErro(cadLanc.vNomeCampoErro, cadLanc.vMensagemErro);
    end
    else
    begin
      if CheckCadSeq.Checked then
      begin
        if cadLanc.Insert then
        begin
          PageControl3.ActivePage := TabSheet3;
          BitBtn4.Visible := true;
          BitBtn5.Visible := true;
          BitBtn6.Visible := true;
          DBGrid1.Visible := true;

          if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
            DBEdit1.SetFocus;
        end;
      end
      else
        inherited;
    end;
  finally
    BitBtn4.Visible := true;
    BitBtn5.Visible := true;
    BitBtn6.Visible := true;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmLancamentos.BitBtn5Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
  cadLanc.Cancel;
  inherited;
end;

procedure TfrmLancamentos.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if EditHw1.AsValue <= 0 then
  begin
    Application.MessageBox('Valor para transferência inválido', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
    	EditHw1.SetFocus;
    Exit;
  end;

  if Trim(Edit1.Text) = '' then
  begin
    Application.MessageBox('Histórico de Saída em branco. Favor preencher', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
    	Edit1.SetFocus;
    Exit;
  end;
  
  if Trim(Edit2.Text) = '' then
  begin
    Application.MessageBox('Histórico de Entrada em branco. Favor preencher', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
    	Edit2.SetFocus;
    Exit;
  end;

  cadLanc.vTransf.valorTransferencia := EditHw1.AsValue;
  cadLanc.vTransf.vControleOrigem := DBGrid2.DataSource.DataSet.FieldByName('codigo_ctrl').AsInteger;
  cadLanc.vTransf.vControleDestino := DBGrid3.DataSource.DataSet.FieldByName('codigo_ctrl').AsInteger;
  cadLanc.vTransf.historicoSaida := Trim(Edit1.Text);
  cadLanc.vTransf.historicoEntrada := Trim(Edit2.Text);

  // Financeiro sendo fechado
  if vDadosIni.financeiroFechando(cadLanc.buscas) then
     Exit;
  if cadLanc._salvaLancamentosTransferencia then
    TForm(pnTransf.Parent).ModalResult := IDOK;
end;

procedure TfrmLancamentos.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnTransf.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmLancamentos.BitBtnCancelarEstornarValeClick(Sender: TObject);
begin
  inherited;
  TForm(pnEstonarValeCompra.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmLancamentos.BitBtnCancelarInfReciboEstornaClick(Sender: TObject);
begin
  TForm(pnInfReciboEstorna.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmLancamentos.BitBtnEstornarEstornaValeClick(Sender: TObject);
begin
  if cadLanc.vEstornarRecibo.dataSet.IsEmpty then
  begin
    Application.MessageBox(PChar('Nenhum recibo/vale compra encontrado!'),
      'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if (cadLanc.dataSet.FieldByName('DATA').AsDateTime <> (vDadosIni.diaFFinanceiro + 1)) then
  begin
    Application.MessageBox(PChar('Data do lançamento não corresponde a data do Financeiro' + #13 +
      'Data do lançamento: ' + FormatDateTime('dd/mm/yyyy', cadLanc.dataSet.FieldByName('DATA').AsDateTime) + #13 +
      'Data do Financeiro: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro + 1)),
      'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  // Financeiro sendo fechado
  if vDadosIni.financeiroFechando(cadLanc.buscas) then
  begin
  	TForm(pnEstonarValeCompra.Parent).ModalResult := IDCANCEL;
    Exit;
  end;

  if not cadLanc.vEstornarRecibo.estornarValeCompra(cadLanc.dataSet.FieldByName('COD_LANC').AsInteger,
	 cadLanc.dataSet.FieldByName('CODIGO_EMP').AsInteger) then
    exit;
  TForm(pnEstonarValeCompra.Parent).ModalResult := IDOK;
end;

procedure TfrmLancamentos.BitBtnFecharEstornarValeClick(Sender: TObject);
begin
  TForm(pnEstonarValeCompra.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmLancamentos.BitBtnImprimirEstornaValeClick(Sender: TObject);
begin
  try
    vDadosIni.abreStatusProcessamento('Impressão de recibo', 'Processando informações...');
    if cadLanc.vEstornarRecibo.dataSet.FieldByName('NRECIBO').AsInteger > 0 then
    begin
      vDadosIni.vPesquisa := 'IMPRIMIRRECIBO|' +  IntToStr(cadLanc.vEstornarRecibo.dataSet.FieldByName('NRECIBO').AsInteger) + '|';
      if vDadosIni._mdiAberto('pkRecibo', 'TFrmCadRecibo') then
      	cadLanc.vEstornarRecibo.abreFormReciboValeCompra;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmLancamentos.BitBtnOKEstornaValeClick(Sender: TObject);
begin
	// Financeiro sendo fechado
  if vDadosIni.financeiroFechando(cadLanc.buscas) then
  begin
  	TForm(pnEstonarValeCompra.Parent).ModalResult := IDCANCEL;
    Exit;
  end;
  
  if (cadLanc.vEstornarRecibo.vReciboSelecionados <= 0) then
  begin
    Application.MessageBox(pchar('Nenhum recibo/vale compra selecionado!'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  TForm(pnEstonarValeCompra.Parent).ModalResult := IDOK;
end;

procedure TfrmLancamentos.BitBtnOKInfReciboEstornaClick(Sender: TObject);
begin
  if (edValorBaixaReciboEstorna.Valor <= 0) then
  begin
    Application.MessageBox(pchar('Valor da Baixa não foi informado!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  if (vdadosini.StrToFloatFormat(edValorBaixaReciboEstorna.Valor, 2) >
  	vdadosini.StrToFloatFormat(cadLanc.vEstornarRecibo.dataSet.FieldByName('VALOR').AsFloat, 2)) then
  begin
    Application.MessageBox(pchar('Valor da Baixa não pode ser maior que o valor do recibo/vale compra: ' + #13 +
    'Valor da Baixa: R$ ' + FormatFloat('0.00', edValorBaixaReciboEstorna.Valor) + #13 +
    'Valor dos recibos/vale compra: R$ ' + FormatFloat('0.00', cadLanc.vEstornarRecibo.dataSet.FieldByName('VALOR').AsFloat)),
    'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  TForm(pnInfReciboEstorna.Parent).ModalResult := IDOK;
end;

procedure TfrmLancamentos.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
  begin
    GroupBox5.visible := true;
    if ComboBox11.Items.Count = 0 then
    begin
      ComboBox11.Items := ComboBox1.Items;
      //      ComboBox11.ItemIndex := 0;
      ComboBox11.Text := trim(_LerConfiguracoesRegistroString(ComboBox11.Name));
      if (UpperCase(trim(ComboBox11.Text)) = 'COMBOBOX11') or (UpperCase(trim(ComboBox11.Text)) = 'TODOS') then
        ComboBox11.ItemIndex := 0
      else
        ComboBox11.ItemIndex := ComboBox11.Items.IndexOf(ComboBox11.Text);
    end;
    if ComboBox12.Items.Count = 0 then
    begin
      ComboBox12.Items := ComboBox3.Items;
      ComboBox12.Text := trim(_LerConfiguracoesRegistroString(ComboBox12.Name));
      if (UpperCase(trim(ComboBox12.Text)) = 'COMBOBOX12') then
        ComboBox12.ItemIndex := 0
      else
        ComboBox12.ItemIndex := ComboBox12.Items.IndexOf(ComboBox12.Text);
    end;

    if ComboBox12.Items.Count > 0 then
      if ComboBox12.ItemIndex = - 1 then
      	ComboBox12.ItemIndex := 0;

  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
  end;
end;

procedure TfrmLancamentos.ckFormasPagClick(Sender: TObject);
begin
  inherited;
	if ckFormasPag.Checked then
  begin
    cadLanc.dataSet.AfterScroll := cadLanc.datasetFormasPagAfterScroll;
    cadLanc.vFpLanc._abreLancamentosFP(
    	cadLanc.dataSet.FieldByName('COD_LANC').AsInteger,
      cadLanc.dataSet.FieldByName('DATA').AsDateTime,
      cadLanc.dataSet.FieldByName('LOTE').AsInteger,
      cadLanc.dataSet.FieldByName('LOTE_ENT').AsInteger,
      cadLanc.dataSet.FieldByName('LOTE_QUIT').AsInteger,
      cadLanc.dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger,
      cadLanc.dataSet.FieldByName('COD_CONTRAPARTIDA_CTP').AsInteger);
    Splitter3.Visible := True;
    gpDetalhesLanc.Visible := True;

    Splitter3.Top := DBGrid1.Top + DBGrid1.Height;
    gpDetalhesLanc.Top := Splitter3.Top + Splitter3.Height;

    if gpDetalhesLanc.Height < 100 then
      gpDetalhesLanc.Height := 100;
  end
  else
  begin
    cadLanc.dataSet.AfterScroll := nil;
    Splitter3.Visible := False;
    gpDetalhesLanc.Visible := False;
  end;
end;

procedure TfrmLancamentos.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if trim(ComboBox11.Text) = '' then
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
  
  if Trim(ComboBox11.Text) = 'Descricao Conta Contabil' then
  begin
    if MaskEdit7.CharCase <> ecNormal then
      MaskEdit7.CharCase := ecNormal;
  end
  else if MaskEdit7.CharCase <> ecUpperCase then
      MaskEdit7.CharCase := ecUpperCase;

end;

procedure TfrmLancamentos.ComboBox12Enter(Sender: TObject);
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

procedure TfrmLancamentos.ComboBox12Exit(Sender: TObject);
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

procedure TfrmLancamentos.Configurarcolunas4Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas4, DBGrid4, GridCfg4, cdsGrid4, usuario, ListGridsAndDataSets4, vDadosIni.transacaoCol);
end;

procedure TfrmLancamentos.Copiarparareadetransferncia4Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid4.DataSource.DataSet.FieldByName(DBGrid4.Columns[DBGrid4.SelectedIndex].FieldName).AsString;
end;

procedure TfrmLancamentos.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
//  if cadLanc.dataSet.State in [dsInsert, dsEdit] then
//    DBComboBox1.Text := DBComboBox1.Items[DBComboBox1.ItemIndex];
end;

procedure TfrmLancamentos.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if cadLanc.dataSet.State in [dsInsert, dsEdit] then
    DBComboBox2.Text := DBComboBox2.Items[DBComboBox2.ItemIndex];
end;

procedure TfrmLancamentos.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if cadLanc._chequeJaUtilizado(0, '') then
      Application.MessageBox('Nº de Cheque já utilizado para este controle','Atenção', 0 + 64);
end;

procedure TfrmLancamentos.DBEdit14Exit(Sender: TObject);
begin
  inherited;
	if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
  	if cadLanc.dataSet.State = dsInsert then
    	cadLanc.vCtrl._abreTodosControlesLanc(-1, cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger)
    else if cadLanc.dataSet.State = dsEdit then
    	cadLanc.vCtrl._abreTodosControlesLanc(cadLanc.dataSet.FieldByName('CODIGO_CTRL').AsInteger, cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger);

    if (cadLanc.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
    begin
    	if cadLanc.vCodEmpMult <> cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger then
      begin
        if Application.MessageBox(pchar('Empresa Unificada foi alterada,' +
          ' é necessário informar o controle novamente, Deseja continuar assim mesmo?'),
          'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        begin
        	cadLanc.vCodEmpMult := cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
          if cadLanc.dataSet.FieldByName('codigo_ctrl').AsInteger > 0 then
          	cadLanc.dataSet.FieldByName('codigo_ctrl').Value := null;
           exit;
        end
        else
        begin
          if (Sender is TDBEdit) then
          begin
           if (Self.Enabled) and (Self.Visible) and ((Sender as TDBEdit).CanFocus) then
             (Sender as TDBEdit).SetFocus;
          end
          else if (Sender is TDBLookupComboBox) then
          begin
            if (Self.Enabled) and (Self.Visible) and ((Sender as TDBLookupComboBox).CanFocus) then
              (Sender as TDBLookupComboBox).SetFocus;
        	end;
        end;
      end;
    end
    else
    	cadLanc.vCodEmpMult := cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
  end;
end;

procedure TfrmLancamentos.DBEdit1Exit(Sender: TObject);
var
	vMensagem: string;
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
  	exit;

  if cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
  begin
    if not cadLanc._dadosNContaPlcValidos(0, False) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        DBEdit1.SetFocus
    end
    else if (cadLanc.vPCont.dataSet.FieldByName('sthab').AsString) = 'N' then
      Application.MessageBox('Nº da Conta Desabilitada, tente outra', 'Atenção', 0 + 64 );
  end
  else
  begin
    cadLanc.rLanc.vDescTipoConta := '';
    cadLanc.rLanc.vTipoConta := '';
  end;
  Label25.Caption := cadLanc.rLanc.vDescTipoConta;
  Edit3.Text := cadLanc.rLanc.vTipoConta;

  if cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
  begin
    if not cadLanc.testarNumConta(vMensagem, cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
    begin
      if not cadLanc.vpermitir then
       Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
      if vDadosIni.PesqPros('LANC038', 'PERMITIR', 'LANC CONTA ' + cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsString,
        'LANCAMENTOS', cadLanc.dataSet.FieldByName('cod_lanc').AsString, cadLanc.buscas, True) then
         cadLanc.vpermitir := true
      else
      begin
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus;
        exit;
      end;
    end;
  end;

  if (ActiveControl <> DBLookupComboBox1) and (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
//  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
//    if not cadLanc._dadosNContaPlcValidos(0, False) then
//			if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
//      	DBEdit1.SetFocus;
end;

procedure TfrmLancamentos.DBEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS'));
    if vDadosIni.vPesquisa <> '' then
      if cadLanc.dataSet.State in [dsInsert, dsEdit] then
        cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsFloat := StrToFloatDef(
          vDadosIni.vPesquisa, cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsFloat);
  end
  else if Key = VK_F4 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
    if vDadosIni.vPesquisa <> '' then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
        ' and P_CONTAS.COD_CTA_CONTABIL = ' + QuotedStr(vDadosIni.vPesquisa),
        'Plano de contas Conta Contabil = ' + vDadosIni.vPesquisa));
      if cadLanc.dataSet.State in [dsInsert, dsEdit] then
        cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsFloat := StrToFloatDef(
          vDadosIni.vPesquisa, cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsFloat);
    end;
  end;
end;

procedure TfrmLancamentos.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if cadLanc._dataAindaNaoProgramada(0) then
      Application.MessageBox('Data ainda não programada','Atenção', 0 + 64);
end;

procedure TfrmLancamentos.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if cadLanc._dataAindaNaoProgramada(cadLanc.dataSet.FieldByName('DTREFERENCIA').AsDateTime) then
      Application.MessageBox('Data ainda não programada','Atenção', 0 + 64);

  DBEdit4.Enabled := False;
end;

procedure TfrmLancamentos.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  if cadLanc.dataSet.State in [dsInsert, dsEdit] then
    cadLanc.dataSet.FieldByName('VL_CONTABIL').AsFloat :=
      cadLanc.dataSet.FieldByName('VALOR_L').AsFloat;
end;

procedure TfrmLancamentos.DBEdit9Exit(Sender: TObject);
var
  vMensagem: string;	
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
  	exit;
     
  if cadLanc.dataSet.State in [dsInsert, dsEdit] then
    if cadLanc.vCtrl.dataSet.FieldByName('NAT_LANC').AsString = 'C' then
      cadLanc.dataSet.FieldByName('TIP_CNT').AsString := cadLanc.vCtrl.dataSet.FieldByName('NAT_LANC').AsString
    else
      cadLanc.dataSet.FieldByName('TIP_CNT').AsString := 'N';

  if not cadLanc.testarNumConta(vMensagem, cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
  begin
    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
	    DBEdit9.SetFocus;
 	  exit;
  end;

  Label16.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  Label17.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  Label18.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  DBEdit11.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  DBEdit12.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  DBEdit13.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  SpeedButton59.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
end;

procedure TfrmLancamentos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  SpeedButton1.Click;
end;

procedure TfrmLancamentos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmLancamentos.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if Key = VK_RETURN then
    if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
      Edit1.SetFocus;
end;

procedure TfrmLancamentos.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if Key = VK_RETURN then
    if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
      Edit2.SetFocus;
end;

procedure TfrmLancamentos.DBGrid4ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid4, GridCfg4, cdsGrid4,
    cdsColunas4, usuario, ListGridsAndDataSets4, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas4 := True;
end;

procedure TfrmLancamentos.DBGrid4TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;

procedure TfrmLancamentos.DBLookupComboBox1Exit(Sender: TObject);
var
	vMensagem: string;
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
  	exit;

  if not cadLanc._dadosNContaPlcValidos(0, True) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus
  end
  else if (cadLanc.vPCont.dataSet.FieldByName('sthab').AsString) = 'N' then
    Application.MessageBox('Nº da Conta Desabilitada, tente outra', 'Atenção', 0 + 64 );
  Label25.Caption := cadLanc.rLanc.vDescTipoConta;
  Edit3.Text := cadLanc.rLanc.vTipoConta;

  if not cadLanc.testarNumConta(vMensagem, cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
  begin
    if not cadLanc.vpermitir then    
	   Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
    if vDadosIni.PesqPros('LANC038', 'PERMITIR', 'LANC CONTA ' + cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsString,
      'LANCAMENTOS', cadLanc.dataSet.FieldByName('cod_lanc').AsString, cadLanc.buscas, True) then
       cadLanc.vpermitir := true
    else
    begin
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
        DBLookupComboBox1.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmLancamentos.DBLookupComboBox2Exit(Sender: TObject);
var
  vMensagem: string;	
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
  	exit;
     
  if cadLanc.dataSet.State in [dsInsert, dsEdit] then
    if cadLanc.vCtrl.dataSet.FieldByName('NAT_LANC').AsString = 'C' then
      cadLanc.dataSet.FieldByName('TIP_CNT').AsString := cadLanc.vCtrl.dataSet.FieldByName('NAT_LANC').AsString
    else
      cadLanc.dataSet.FieldByName('TIP_CNT').AsString := 'N';

  if not cadLanc.testarNumConta(vMensagem, cadLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
  begin
    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
	    DBLookupComboBox2.SetFocus;
 	  exit;
  end;

  Label16.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  Label17.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  Label18.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  DBEdit11.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  DBEdit12.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  DBEdit13.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
  SpeedButton59.Visible := Trim(cadLanc.vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S';
end;

procedure TfrmLancamentos.edNumReciboEstornaValeChange(Sender: TObject);
begin
  cadLanc.vEstornarRecibo.FindNearest([edNumReciboEstornaVale.Text]);
end;

procedure TfrmLancamentos.edNumReciboEstornaValeEnter(Sender: TObject);
begin
  edNumReciboEstornaVale.OnChange := edNumReciboEstornaValeChange;
  if not vDadosIni.vRecibo.HabRecPorDepart then
  	cadLanc.vEstornarRecibo.IndexFieldNames := 'NRECIBO'
  else
	  cadLanc.vEstornarRecibo.IndexFieldNames := 'NUM_REC_DEP';
end;

procedure TfrmLancamentos.edNumReciboEstornaValeExit(Sender: TObject);
begin
  edNumReciboEstornaVale.OnChange := nil;
end;

procedure TfrmLancamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if not Assigned(DBGrid4.DataSource) then
    Exit;
  if not Assigned(DBGrid4.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid4, GridCfg4, cdsGrid4,
      cdsColunas4, usuario, ListGridsAndDataSets4, vDadosIni.transacaoCol);

  if TemColunasComPosicaoAlteradas4 then
  	vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid4, GridCfg4, true, ListPositions4, cdsGrid4);

  gravaConfiguracoesFormRegistro;

  cadLanc.Free;
  cadLanc := nil;

  Action := caFree;
  frmLancamentos := nil;
end;

procedure TfrmLancamentos.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  cadLanc :=  TLancamentos.create;
  cadLanc.vEstornarRecibo._abreEstornarRecibo(-1);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmLancamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn3.Click;
  if key = VK_F6 then
    ckbnaoquitado.Checked := (not ckbnaoquitado.Checked);
  if Key = VK_F7 then
    ckbQuitado.Checked := (not ckbQuitado.Checked);
  if (Key = VK_F2) and (ckFormasPag.Visible) then
  	ckFormasPag.Checked :=(not ckFormasPag.Checked);
end;

procedure TfrmLancamentos.FormKeyDownTransferencia(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn8.Click;
end;

procedure TfrmLancamentos.FormShow(Sender: TObject);
var
	I: Integer;
begin
	if not Self.Enabled then
    Exit;
    
  try
  	cadLanc.dataSet.FieldByName('COD_EMP_MULT').Tag :=
    	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);
    cadLanc.dataSet.FieldByName('IDENTIFICACAO_EMP').Tag :=
    	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);

    TabSheet1.TabVisible := False;
    TabSheet2.TabVisible := False;
    TabSheet3.TabVisible := False;
    tsPrevisao.TabVisible := False;
    tsRel.TabVisible := False;
    tsTransf.TabVisible := False;
    tsEstonarValeCompra.TabVisible := False;

    if vShow <> 1 then
    begin
      DBGrid1.DataSource := dtmLancamentos.dsLancamentos;
      if vCriou = 0 then
      begin
        inherited;
        setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
      end;

      DBGrid4.DataSource := dtmLancamentos.dsLancFP;
      if vCriou = 0 then
      begin
        vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
          vAlterarNomeDtSet4, GridCfg4, DBGrid4, cdsGrid4, cdsColunas4, trans, ListGridsAndDataSets4,
          ListPositions4, nomeDTSEt4, PrimeiraPesquisa4, vCamposPadraoRegistro4, usuario);
      end;
    end;
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.Text := ComboBox1.Text;

    ComboBox12.Items := ComboBox3.Items;
    ComboBox12.Text := ComboBox3.Text;

    // Com os vampos de valor contabil este campo TIP_CNT se torna obsoleto
    Label15.Visible := False;
    DBComboBox2.Visible := False;
    DBEdit3.Enabled := False;
    DBEdit4.Enabled := False;
    DBLookupComboBox1.DropDownWidth := DBLookupComboBox1.Width + 150;

    leConfiguracoesFormRegistro;

    vDadosIni.fechaStatusProcessamento;

    if not vDadosIni.validarAcessoEmpresasUnificadas(cadLanc.buscas) then
    begin
      vDadosIni.fechaStatusProcessamento;
      frmLancamentos.fechar := True;
      PostMessage(frmLancamentos.Handle, WM_CLOSE, 0, 0);
      Exit;
    end;

    gpDetalhesLanc.Height := _LerConfiguracoesRegistroInteger(gpDetalhesLanc.Name, 50);

    vTipoE := '';
    vTipoS := '';

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG137', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
      vTipoE := vDadosIni.IfThen(trim(vTipoE) <> '', trim(vTipoE) + ',', '') + QuotedStr('E');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG138', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
      vTipoE := vDadosIni.IfThen(trim(vTipoE) <> '', trim(vTipoE) + ',', '') + QuotedStr('T');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG139', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
      vTipoE := vDadosIni.IfThen(trim(vTipoE) <> '', trim(vTipoE) + ',', '') + QuotedStr('O');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG140', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
      vTipoE := vDadosIni.IfThen(trim(vTipoE) <> '', trim(vTipoE) + ',', '') + QuotedStr('Z');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG141', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
      vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('D');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG142', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('F');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG143', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('I');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG144', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('P');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG145', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('O');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG146', 'HABILITAR', 'HAB LANCAMENTOS', 'P_CONTAS', '', cadLanc.buscas, true) then
      vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('Z');

    if vCriou = 0 then
      vCriou := 1;
  finally
     vDadosIni.fechaStatusProcessamento;
     imgInformation.Hint := imgInformation.Hint + #13 + #13 +
      'Processo "LANC038" PERMITIR REALIZAR LANCAMENTOS DE CONTAS NAO CONFIGURADAS' + #13 +
      'Processo "LANC039" HABILITAR CAMPO "VALOR" NOS LANCAMENTOS DE CONTRAPARTIDA' + #13 +
      'Processo "LANC040" PERMITIR EXCLUIR LANCAMENTOS DE CONTRAPARTIDA' + #13 +
      'Processo "LANC045" PERMITIR EXCLUIR LANCAMENTO REALIZADO PELO SISTEMA' + #13 +
      'Processo "LANC048" EDITAR LANCAMENTO REALIZADO PELO SISTEMA' + #13 +
      'Processo "LANC049" PERMITIR CADASTRAR/ALTERAR LANCAMENTO APOS DRE GERADO' + #13 +
      'Processo "CXG137" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (ENTRADA) - EMPRESTIMO' + #13 +
      'Processo "CXG138" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (ENTRADA) - TRANSFERENCIA	' + #13 +
      'Processo "CXG139" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (ENTRADA) - OUTRAS RECEITAS' + #13 +
      'Processo "CXG140" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (ENTRADA) - CORRECAO DE SALDO' + #13 +
      'Processo "CXG141" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - DESPESA' + #13 +
      'Processo "CXG142" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - FORNECEDOR' + #13 +
      'Processo "CXG143" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - IMPOSTOS' + #13 +
      'Processo "CXG144" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - FOLHA DE PAGAMENTO' + #13 +
      'Processo "CXG145" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - OUTRAS SAIDAS' + #13 +
      'Processo "CXG146" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - CORRECAO DE SALDO';
  end;
end;

procedure TfrmLancamentos.FormShowTransferencia(Sender: TObject);
begin
  EditHw1.AsValue := 0;
  Edit1.Text := cadLanc.vTransf.historicoSaida;
  Edit2.Text := cadLanc.vTransf.historicoEntrada;
  TForm(pnTransf).OnKeyDown := FormKeyDownTransferencia;
end;

procedure TfrmLancamentos.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(ckbNaoQuitado.Name, ckbNaoQuitado.Checked);
    _GravaConfiguracoesBoolean(ckbQuitado.Name   , ckbQuitado.Checked);
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

procedure TfrmLancamentos.gridRecibosEstornarValeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if not (cadLanc.vEstornarRecibo.dataSet.FieldByName('NRECIBO').IsNull) then
  begin
    if (cadLanc.vEstornarRecibo.dataSet.FieldByName('FORMAS').AsInteger > 0) then
     if (gdFocused in State) then
     begin
       TDBGrid(sender).canvas.brush.color := clWindow;
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end
     else
     begin
       TDBGrid(sender).canvas.brush.color := TColor(pnCorReciboEstorno.Color);
       TDBGrid(sender).canvas.Font.color := clBlack;
     end;

     if (Column.FieldName = 'NRECIBO') or (Column.FieldName = 'NUM_REC_DEP') then
       if Rect.Top = TStringGrid(TDBGrid(sender)).CellRect(0,TStringGrid(TDBGrid(sender)).Row).Top then
       begin
         TDBGrid(sender).Canvas.FillRect(Rect);
         TDBGrid(sender).Canvas.Brush.Color := TColor($F0CAA6);
         TDBGrid(sender).DefaultDrawDataCell(Rect,Column.Field,State)
       end;
      if gdSelected in State then //Cor da célula selecionada
       begin
         TDBGrid(sender).Canvas.Brush.Color := TColor($F0CAA6);
         TDBGrid(sender).Canvas.FillRect(Rect);
         TDBGrid(sender).DefaultDrawDataCell(Rect,Column.Field,State)
       end;

    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
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

procedure TfrmLancamentos.gridRecibosEstornarValeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    cadLanc.vEstornarRecibo._marcaDesmarcaLinha(cadLanc.vEstornarRecibo.dataSet);
end;

procedure TfrmLancamentos.MaskEdit3Change(Sender: TObject);
begin
  inherited;
  if Trim(ComboBox1.Text) = 'Descricao Conta Contabil' then
  begin
    if MaskEdit3.CharCase <> ecNormal then
      MaskEdit3.CharCase := ecNormal;
  end
  else if MaskEdit3.CharCase <> ecUpperCase then
      MaskEdit3.CharCase := ecUpperCase;
end;

procedure TfrmLancamentos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := (not vBoolTemp) or (DBGrid1.SelectedRows.CurrentRowSelected);  
end;

procedure TfrmLancamentos.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlNomeEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmLancamentos.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  cadLanc._iniciarPrevisao;
  qrlNome_Emp.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmLancamentos.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  cadLanc._calcularPrevisao;
  QRLabel31.Caption := cadLanc.vPrev.strValorAnterior;
  QRLabel22.Caption := cadLanc.vPrev.strValorEntradas;
  QRLabel23.Caption := cadLanc.vPrev.strValorSaidas;
  QRLabel24.Caption := cadLanc.vPrev.strValorPosterior;
  QRLabel26.Caption := cadLanc.vPrev.strValorDiferenca;
  QRLabel28.Caption := cadLanc.vPrev.strValorConferencia;
end;

procedure TfrmLancamentos.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Previsão de Saldo de Caixa');
  QRLabel11.Caption:='Previsão de Saldo de Caixa - '+Datetostr(vDadosIni.diaFFinanceiro + 1);
end;

procedure TfrmLancamentos.ReajustarLarguradascolunas4Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid4);
end;

procedure TfrmLancamentos.RelLancPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Lançamentos');
end;

procedure TfrmLancamentos.ResetarConfiguraesdecolunas4Click(Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid4, GridCfg4, cdsColunas4, cdsGrid4, usuario,
    vDadosIni.transacaoCol, fReset4, ListGridsAndDataSets4, false, ListPositions4);
end;

procedure TfrmLancamentos.habilitarRemoverColunaCel(pHabDes: Integer = 0);
var
  I: Integer;
begin
  for I := 0 to gridRecibosEstornarVale.FieldCount - 1 do
  begin
    if not vDadosIni.vRecibo.HabRecPorDepart then
    begin
      if (gridRecibosEstornarVale.Columns[I].FieldName = 'NUM_REC_DEP') then
      begin
        gridRecibosEstornarVale.Columns[I].Visible := false;
        cadLanc.vEstornarRecibo.dataSet.FieldByName('NUM_REC_DEP').Visible := false;
      end
      else if (gridRecibosEstornarVale.Columns[I].FieldName = 'SEL') then
        gridRecibosEstornarVale.Columns[I].Visible := pHabDes = 0;
    end
    else
    begin
      if (gridRecibosEstornarVale.Columns[I].FieldName = 'NRECIBO') then
      begin
        gridRecibosEstornarVale.Columns[I].Visible := false;
        cadLanc.vEstornarRecibo.dataSet.FieldByName('NRECIBO').Visible := false;
      end
      else if (gridRecibosEstornarVale.Columns[I].FieldName = 'SEL') then
        gridRecibosEstornarVale.Columns[I].Visible := pHabDes = 0;
    end;
  end;
end;

procedure TfrmLancamentos.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    ckbNaoQuitado.Checked := _LerConfiguracoesRegistroBoolean(ckbNaoQuitado.Name);
    ckbQuitado.Checked    := _LerConfiguracoesRegistroBoolean(ckbQuitado.Name);
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
    	ComboBox12.Text   := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text    := _LerConfiguracoesRegistroString(MaskEdit9.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text    := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text    := _LerConfiguracoesRegistroString(MaskEdit7.Name);
  end;
end;

procedure TfrmLancamentos.SalvardadosnoExcel4Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid4, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmLancamentos.Somarvaloresdacoluna4Click(Sender: TObject);
begin
  inherited;
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid4, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TfrmLancamentos.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'A', cadLanc.buscas) then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    cadLanc.vGrid := TDBGrid(DBGrid1);
    cadLanc._marcarDesmarcarLancamentosComoVenda;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmLancamentos.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', cadLanc.buscas) then
    Exit;

  if not vDadosIni.testarContasLigacao(cadLanc.buscas, 'LANC') then
  	Exit;

  try
    Screen.Cursor := crHourGlass;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(cadLanc.buscas) then
      Exit;

    cadLanc._abreFormTransferencia;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmLancamentos.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'A', cadLanc.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(cadLanc.buscas) then
      Exit;
    if not cadLanc.Edit then
      exit;
    inherited;
    habilitarRemoverColunaCel(0);
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;

    DBEdit3.Enabled := False;
    DBEdit4.Enabled := False;
    Label24.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit14.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBLookupComboBox3.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit14.Enabled := False;
    DBLookupComboBox3.Enabled := False;
    cadLanc.vNumConta := cadLanc.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
    cadLanc.vpermitir := false;

    if trim(cadLanc.dataSet.FieldByName('Status_l').AsString) = 'QUITADO' then
    begin
      DBEdit7.Enabled := False;
      DBEdit9.Enabled := False;
      DBLookupComboBox2.Enabled := False;
    end
    else
    begin
      if cadLanc.dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger > 0 then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        DBEdit7.Enabled := vDadosIni.PesqPros('LANC039', 'HABILITAR', '', 'LANCAMENTOS', '', cadLanc.buscas, False);
      end
      else
	     DBEdit7.Enabled := True;
      DBEdit9.Enabled := True;
      DBLookupComboBox2.Enabled := True;

      DBEdit9.Enabled := cadLanc.dataSet.FieldByName('LANC_AVULSO').AsString = 'S';
   	  DBLookupComboBox2.Enabled := cadLanc.dataSet.FieldByName('LANC_AVULSO').AsString = 'S';
    	DBEdit7.Enabled := cadLanc.dataSet.FieldByName('LANC_AVULSO').AsString = 'S';
//    	DBEdit8.Enabled := cadLanc.dataSet.FieldByName('LANC_AVULSO').AsString = 'S';
    end;

    if cadLanc._dadosNContaPlcValidos(0, False) then
    begin
      Label25.Caption := cadLanc.rLanc.vDescTipoConta;
      Edit3.Text := cadLanc.rLanc.vTipoConta;
    end;

    if (Self.Enabled) and (Self.Visible) and (DBEdit14.CanFocus) then
      DBEdit14.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;

end;


procedure TfrmLancamentos.SpeedButton22Click(Sender: TObject);
begin
  inherited;
	/// modifcar a data da venda mediante a processo.
  if vDadosIni.PesqPros('LANC050', 'HABILITAR',cadLanc.dataset.FieldByName('NDOC_L').AsString,
    'LANCAMENTOS', cadLanc.dataSet.FieldByName('COD_LANC').AsString+'/'+cadLanc.dataSet.FieldByName('NDOC_L').AsString, cadLanc.buscas, true) then
  begin
    DBEdit4.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    	DBEdit4.SetFocus;
  end;
end;

procedure TfrmLancamentos.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', cadLanc.buscas) then
    Exit;

  try
    Screen.Cursor := crHourGlass;

    if cadLanc.dataSet.IsEmpty then
    	exit;

    if not vDadosIni.PesqPros('LANC036', 'ABRIR', 'LANC CONTRAPARTIDA ' + cadLanc.dataSet.FieldByName('COD_CONTRAPARTIDA').AsString, 'LANCAMENTOS',
      cadLanc.dataSet.FieldByName('cod_lanc').AsString, cadLanc.buscas, true) then
      Exit;

    cadLanc._abreDetalhesRecebimentosModalidade;
    cadLanc.Refresh;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancamentos.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('LANC043', 'CONSULTAR', '', 'LANCAMENTOS',
  	cadLanc.dataSet.FieldByName('COD_LANC').AsString,
	  cadLanc.buscas, False) then
    exit;
    
  BitBtnEstornarEstornaVale.Visible := false;
  BitBtnOKEstornaVale.Visible := false;
  BitBtnCancelarEstornarVale.Visible := false;
  BitBtnImprimirEstornaVale.Visible := false;
  BitBtnFecharEstornarVale.Visible := false;
  edNumReciboEstornaVale.Visible := false;
  lbNumReciboEstornaVale.Visible := false;

  BitBtnEstornarEstornaVale.Visible := true;
  BitBtnFecharEstornarVale.Visible := true;

  cadLanc.vEstornarRecibo._abreEstornarReciboLanc(cadLanc.dataSet.FieldByName('cod_lanc').AsInteger, 1);
  habilitarRemoverColunaCel(1);
  if not vDadosIni.abreForm('Recibos/Vale Compra', pnEstonarValeCompra, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
    exit;
end;

procedure TfrmLancamentos.SpeedButton2Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'E', cadLanc.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(cadLanc.buscas) then
      Exit;
    cadLanc.Delete;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancamentos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('LANC006', 'RELATORIO', '', 'LANCAMENTOS', '',
      cadLanc.buscas, False) then
      exit;

    vBoolTemp := Application.MessageBox('Imprime somente selecionados?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
    RelLanc.Preview;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancamentos.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  cadLanc.dataSet.FieldByName('DATA_VENC_CHEQ_L').Value := Null;
end;

procedure TfrmLancamentos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('LANC007', 'RELATORIO', '', 'LANCAMENTOS', '',
      cadLanc.buscas, False) then
      exit;
    if not vDadosIni.VerificarinicioFechFinan(cadLanc.buscas) then
     exit;

    if not vDadosIni.definirDiaFinanceiroFechado(cadLanc.buscas) then
      Exit;

    cadLanc.vCtrl._abreTodosControlesLanc(-1);
    QuickRep1.Preview;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancamentos.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadLanc.vGrid := TDBGrid(DBGrid1);
    cadLanc._enviarModuloTranf;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancamentos.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    cadLanc.vGrid := TDBGrid(DBGrid1);
    cadLanc._somatorioLancamentos;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancamentos.Splitter3Moved(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesInteger(gpDetalhesLanc.Name, vDadosIni.IfThen(gpDetalhesLanc.Height < 50, 50, gpDetalhesLanc.Height));
end;

end.
