unit UCadPromocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, DB, QRCtrls, QuickRpt, uEditHw;

type
  TfrmCadPromocao = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    DataSource1: TDataSource;
    GroupBox4: TGroupBox;
    TabSheet4: TTabSheet;
    qrpPromocao: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    lbEmpresa: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    TabSheet6: TTabSheet;
    Label60: TLabel;
    TabSheet9: TTabSheet;
    qrpPromocaoProduto: TQuickRep;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel8: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRShape6: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    PopupMenu3: TPopupMenu;
    ApagarTodosProdutosdestapromoo1: TMenuItem;
    QRLabel16: TQRLabel;
    QRDBText8: TQRDBText;
    Panel9: TPanel;
    CheckBox2: TCheckBox;
    Label18: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    GroupBox68: TGroupBox;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    Label201: TLabel;
    Label202: TLabel;
    DBText30: TDBText;
    Label203: TLabel;
    Label216: TLabel;
    DBText32: TDBText;
    DBText33: TDBText;
    Label218: TLabel;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    GroupBox6: TGroupBox;
    Panel7: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    Label17: TLabel;
    SpeedButton18: TSpeedButton;
    Edit2: TEdit;
    ComboBox4: TComboBox;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    TabSheet8: TTabSheet;
    RadioGroup3: TRadioGroup;
    Panel10: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    GroupBoxVenc: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BitBtn9: TBitBtn;
    Label22: TLabel;
    SpeedButton59: TSpeedButton;
    GroupBox7: TGroupBox;
    Panel8: TPanel;
    Label199: TLabel;
    Label200: TLabel;
    Label214: TLabel;
    Label217: TLabel;
    Label204: TLabel;
    Label208: TLabel;
    Label207: TLabel;
    Label209: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label220: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EditHw2: TEditHw;
    EditHw3: TEditHw;
    DBEdit99: TDBEdit;
    DBEdit104: TDBEdit;
    CheckBox19: TCheckBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    EditHw1: TEditHw;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    pnCorPromocao: TPanel;
    pnCorPromocao2: TPanel;
    QRLabel17: TQRLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    lbMakupMargem: TLabel;
    edMarukpMargem: TDBEdit;
    Label23: TLabel;
    btHabPercent: TSpeedButton;
    btHabMarkup: TSpeedButton;
    Label15: TLabel;
    SpeedButton19: TSpeedButton;
    Label19: TLabel;
    DBComboBox1: TDBComboBox;
    Label24: TLabel;
    Label25: TLabel;
    tsCadastro2: TTabSheet;
    GroupBox8: TGroupBox;
    Label27: TLabel;
    DBEdit12: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label26: TLabel;
    DBEdit11: TDBEdit;
    Label28: TLabel;
    DBComboBox3: TDBComboBox;
    Label29: TLabel;
    Label30: TLabel;
    DBGrid4: TDBGrid;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodasPromocaoTabelaClick: TMenuItem;
    DesmarcarTodasPromocaoTabelaClick: TMenuItem;
    MarcarTodasPromocaoProdutoTabelaClick: TMenuItem;
    DesmarcarTodasPromocaoProdutoTabelaClick: TMenuItem;
    TabSheet10: TTabSheet;
    qrpTabela: TQuickRep;
    QRBand5: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel20: TQRLabel;
    QRSysData6: TQRSysData;
    lbEmpresa2: TQRLabel;
    QRBand6: TQRBand;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRBand7: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand8: TQRBand;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    Label31: TLabel;
    DBComboBox5: TDBComboBox;
    Label32: TLabel;
    DBComboBox4: TDBComboBox;
    Label33: TLabel;
    DBComboBox6: TDBComboBox;
    btHabDebCred: TSpeedButton;
    procedure btHabDebCredClick(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DesmarcarTodasPromocaoProdutoTabelaClickClick(Sender: TObject);
    procedure MarcarTodasPromocaoProdutoTabelaClickClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DesmarcarTodasPromocaoTabelaClickClick(Sender: TObject);
    procedure MarcarTodasPromocaoTabelaClickClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure edMarukpMargemExit(Sender: TObject);
    procedure btHabMarkupClick(Sender: TObject);
    procedure btHabPercentClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qrpPromocaoProdutoPreview(Sender: TObject);
    procedure qrpPromocaoPreview(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure QRLabel1Print(sender: TObject; var Value: string);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup3Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure ApagarTodosProdutosdestapromoo1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton18Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure EditHw3Exit(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChecarTipoPreco;
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
    vtpPreco: string;
  end;

var
  frmCadPromocao: TfrmCadPromocao;

implementation

uses
  UClassesProdutos, uDtmAtivo, UDtmProdutos, uDataSet_OOP, uDadosIni, DBClient,
  DateUtils, calc_utils, hw_utils, StrUtils;

{$R *.dfm}

procedure TfrmCadPromocao.ApagarTodosProdutosdestapromoo1Click(Sender: TObject);
begin
  inherited;
  if not (CadPromocao.vPromocaoProduto.DeleteProdutosPromocao) then
    exit;

  CadPromocao.vPromocaoProduto._abreProdutosPromocao(
  	CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString,
    CadPromocao.dataSet.FieldByName('COD_TPPRECO').AsString);
end;

procedure TfrmCadPromocao.BitBtn1Click(Sender: TObject);
var
  vSqlAdc: string;
  I: Integer;
begin
  if not vDadosIni.PesqPros('PRO223', 'CONSULTA', '', 'PROMOCAO', '',
    CadPromocao.buscas, true) then
    Exit;

	if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
  begin
  	DBGrid4.Visible := False;
  	DBGrid1.Visible := True;

    vtpPreco := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'T');

    if vtpPreco = 'P' then
      vSqlAdc := ' T.TIPO = ' + QuotedStr(vtpPreco)
    else
      vSqlAdc := ' T.TIPO = ' + QuotedStr(vtpPreco)+ ' AND T.COD_TPPRECO >= 5';

    inherited;
    if MaskEdit2.Visible then
    begin
      if not CadPromocao.ConsultaPromocao(maskedit1.text, maskedit2.text) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        	combobox1.setfocus
    end
    else
      if CadPromocao.ConsultaCampos('PROMOCAO', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa, 'PROMOCAO.*, T.TIPO, T.DESCR_TIPO',
        ' INNER JOIN TIPO_PRECO T ON T.COD_TPPRECO = PROMOCAO.COD_TPPRECO AND T.COD_EMPRESA = PROMOCAO.COD_EMPRESA',
        '' + vSqlAdc + '') then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    vDadosIni.vtpPreco := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'T');
    lixeiraVazia(not CadPromocao._lixeiraCheia);
  end
  else if (RadioGroup3.ItemIndex = 2) then
  begin
  	DBGrid1.Visible := False;
    DBGrid4.Visible := True;

    inherited;
    if not LocalidadeSetorCidade.ConsultaCampos('TIPO_PRECO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'COD_TPPRECO', true, vDadosIni.codEmpresa,
      'TIPO_PRECO.*', '', 'COD_TPPRECO IN (2, 3, 4)') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    lixeiraVazia(True);
  end
  else if (RadioGroup3.ItemIndex = 3) then
  begin
  	DBGrid1.Visible := False;
    DBGrid4.Visible := True;

    inherited;
    if not LocalidadeSetorCidade.ConsultaCampos('TIPO_PRECO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'COD_TPPRECO', true, vDadosIni.codEmpresa,
      'TIPO_PRECO.*', '', 'COD_TPPRECO = 6 ') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    lixeiraVazia(True);
  end;

  BitBtn3.Visible         := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);
  SpeedButton1.Visible    := True;
  SpeedButton5.Visible    := False;
  SpeedButton2.Visible    := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);
//  SpeedButton3.Visible    := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);

  SpeedButton4.Visible    := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);
  if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
  begin
  	SpeedButton25.Visible := CadPromocao._lixeiraCheia;
		SpeedButton5.Visible  := SpeedButton25.Visible;
  end
  else
  begin
  	SpeedButton25.Visible := False;
    SpeedButton5.Visible  := SpeedButton25.Visible;
  end;

  SpeedButton6.Visible    := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);
  SpeedButton8.Visible    := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);
  pnCorPromocao.Visible   := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);
  btSelectAll.Visible     := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);
  btUnSelectAll.Visible   := (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1);

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadPromocao.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PROMOCAO_TABELA', 'I', CadPromocao.buscas) then
    Exit;
  try
  	vDadosIni.vtpPreco := vtpPreco;
    if not CadPromocao.Insert then
      exit;

    ChecarTipoPreco;

    DBEdit3.Field.AsInteger :=
      CadPromocao.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
    DBLookupComboBox2.KeyValue :=
      CadPromocao.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;

    GroupBoxVenc.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    Label9.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    Label10.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    Label11.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    Label12.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    DBEdit4.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    DBEdit5.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    DBEdit6.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    DBEdit7.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
    Label22.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) and (RadioGroup3.ItemIndex = 1);
    SpeedButton59.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) and (RadioGroup3.ItemIndex = 1);

    Label19.Visible := (RadioGroup3.ItemIndex = 1);
    DBComboBox1.Visible := (RadioGroup3.ItemIndex = 1);
    Label25.Visible := (RadioGroup3.ItemIndex = 1);
    Label24.Visible := (RadioGroup3.ItemIndex = 1);

    DBComboBox5.ItemIndex := 1;
    DBComboBox1.ItemIndex := 0;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

    BitBtn9.Visible := false;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadPromocao.Cancel;
      CadPromocao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPromocao.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
		BitBtn4.SetFocus;
	vDadosIni.vtpPreco := vtpPreco;
  if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
  begin
    if not CadPromocao.post then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(CadPromocao.vNomeCampoErro);
    end
    else
    begin
      if TelaCadastro = 1 then
      begin
        BitBtn6.Click;
        Exit;
      end;
      if CheckCadSeq.Checked then
      begin
        if CadPromocao.Insert then
        begin
          PageControl3.ActivePage := tsCadastro;
          if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
          DBEdit4.Enabled := true;
          DBEdit5.Enabled := true;
          DBEdit6.Enabled := true;
          DBEdit7.Enabled := true;
        end;
      end
      else
        inherited;
    end;
    if (CheckCadSeq.Checked) then
    begin
      DBEdit3.Field.AsInteger :=
        CadPromocao.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
      DBLookupComboBox2.KeyValue :=
        CadPromocao.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
    end;
  end
  else
  begin
  	if not LocalidadeSetorCidade.post then
    begin
      PageControl3.ActivePage := tsCadastro2;
      setFocusCampoErro(LocalidadeSetorCidade.vNomeCampoErro);
    end
    else
    	inherited;
  end;
end;

procedure TfrmCadPromocao.BitBtn5Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;

  if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
  begin
    CadPromocao.Cancel;
    CadPromocao.RollBackTransacao;

    DBEdit4.Enabled := true;
    DBEdit5.Enabled := true;
    DBEdit6.Enabled := true;
    DBEdit7.Enabled := true;
  end
  else
  begin
    LocalidadeSetorCidade.Cancel;
    LocalidadeSetorCidade.RollBackTransacao;
  end;
end;

procedure TfrmCadPromocao.BitBtn7Click(Sender: TObject);
var
  cod_promocao, tipo, grupo_prod, cod_prod: string;
  dataini, datafim, horaini, horafim, sigla, debcred: string;
  valor, percentual, desc_max, markup: Double;
begin
  try
  	inherited;
    if (Self.Enabled) and (Self.Visible) and (BitBtn7.CanFocus) then
      BitBtn7.SetFocus;

    BitBtn7.Enabled := False;
    BitBtn8.Enabled := False;
    cod_promocao := DBText28.Field.AsString;
    tipo := CadPromocao.fstr('cod_tppreco');
    grupo_prod := DBEdit9.Field.AsString;//CadPromocao.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').AsString;
    cod_prod := DBEdit10.Field.AsString;//CadPromocao.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString;
    dataini := MaskEdit4.Text;
    datafim := MaskEdit6.Text;
    horaini := MaskEdit5.Text;
    horafim := MaskEdit7.Text;
    sigla := vDadosIni.IfThen(vDadosIni.vtpPreco = 'P', DBLookupComboBox1.KeyValue, '');
    valor := EditHw2.AsValue;
    percentual := EditHw3.AsValue;
    desc_max := EditHw1.AsValue;
    markup := CadPromocao.vPromocaoProduto.ffloat('markup');
    debcred := vDadosIni.IfThen(not DBComboBox6.Enabled, '', vDadosIni.IfThen(DBComboBox6.ItemIndex <= 0, 'Z', Copy(DBComboBox6.Text, 1, 1)));

    vDadosIni.vtpPreco := vtpPreco;
    if vDadosIni.vtpPreco = 'P' then
    begin
      if not CadPromocao.vPromocaoProduto.postPromocaoProdutoS(
        cod_promocao,
        tipo,
        grupo_prod,
        cod_prod,
        dataini,
        datafim,
        horaini,
        horafim,
        sigla,
        valor,
        percentual,
        1,
        desc_max,
        markup,
        debcred) then
      begin
        vDadosIni.fechaStatusProcessamento;
        setFocusCampoErro(CadPromocao.vPromocaoProduto.vNomeCampoErro);
        exit;
      end;
    end
    else
    begin
      if not CadPromocao.vPromocaoProduto.postPromocaoProdutoS(
        cod_promocao,
        tipo,
        grupo_prod,
        cod_prod,
        dataini,
        datafim,
        horaini,
        horafim,
        '',
        valor,
        percentual,
        5,
        desc_max,
        markup,
        debcred) then
      begin
        vDadosIni.fechaStatusProcessamento;
        setFocusCampoErro(CadPromocao.vPromocaoProduto.vNomeCampoErro);
        exit;
      end;
    end;

    if CheckBox2.Checked then
    begin
      CadPromocao.vPromocaoProduto._abreProdutosPromocao('-1', '-1');

      if not CadPromocao.vPromocaoProduto.Insert then
        exit;

      PageControl2.ActivePage := TabSheet8;
      Edit1.Text := '';
      EditHw2.AsValue := 0;
      EditHw3.AsValue := 0;
      EditHw1.AsValue := 0;
      CadPromocao.vPromocaoProduto.dataSet.Insert;
      DBEdit8.Field.AsString := '';
      DBEdit9.Field.AsString := '';
      DBEdit10.Field.AsString := '';
      DBEdit99.Field.AsString := '';
      DBEdit104.Field.AsString := '';

      if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
        Edit1.SetFocus;

      exit;
    end;

    CheckBox2.Visible := true;
    Label18.Visible := true;
    Panel9.Visible := false;

    Edit1.Enabled := true;
    DBLookupComboBox1.Enabled := true;

    CadPromocao.vPromocaoProduto._abreProdutosPromocao(
      CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString,
      CadPromocao.dataSet.FieldByName('COD_TPPRECO').AsString);

    CadPromocao.vPromocaoProduto.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
    CadPromocao.vPromocaoProduto.FindNearest([grupo_prod, cod_prod]);

    PageControl2.ActivePage := TabSheet7;
  finally
  	BitBtn7.Enabled := True;
    BitBtn8.Enabled := True;
  end;
end;

procedure TfrmCadPromocao.BitBtn8Click(Sender: TObject);
var
  grupo_prod, cod_prod: string;
begin
  inherited;
  grupo_prod := CadPromocao.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').AsString;
  cod_prod := CadPromocao.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString;

  Edit1.Enabled := true;
  CheckBox2.Visible := true;
  DBLookupComboBox1.Enabled := true;
  CheckBox1.Visible := true;
  Label18.Visible := true;
  Panel9.Visible := false;

  CadPromocao.vPromocaoProduto.Cancel;
  CadPromocao.vPromocaoProduto.RollBackTransacao;

  CadPromocao.vPromocaoProduto._abreProdutosPromocao(
  	CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString,
    CadPromocao.dataSet.FieldByName('COD_TPPRECO').AsString);

  CadPromocao.vPromocaoProduto.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
  CadPromocao.vPromocaoProduto.FindNearest([grupo_prod, cod_prod]);

  PageControl2.ActivePage := TabSheet7;
end;

procedure TfrmCadPromocao.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja atualizar as informações da promoção nos produtos ?',
    'Atualizar Informações', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
    exit;

  CadPromocao.dataSet.FieldByName('DATA_INI').AsDateTime := DateOf(CadPromocao.dataSet.FieldByName('DATA_INI').AsDateTime);
  CadPromocao.dataSet.FieldByName('DATA_FIM').AsDateTime := DateOf(CadPromocao.dataSet.FieldByName('DATA_FIM').AsDateTime);

  DBEdit4.Enabled := true;
  DBEdit5.Enabled := true;
  DBEdit6.Enabled := true;
  DBEdit7.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    DBEdit4.SetFocus;
end;

procedure TfrmCadPromocao.btHabDebCredClick(Sender: TObject);
begin
  inherited;
  btHabDebCred.Visible := False;
  DBComboBox6.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox6.CanFocus) then
    DBComboBox6.SetFocus;
end;

procedure TfrmCadPromocao.btHabMarkupClick(Sender: TObject);
begin
  inherited;
  btHabMarkup.Visible := False;
  btHabPercent.Visible := True;
  edMarukpMargem.Enabled := True;
  EditHw3.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (edMarukpMargem.CanFocus) then
    edMarukpMargem.SetFocus;
end;

procedure TfrmCadPromocao.btHabPercentClick(Sender: TObject);
begin
  inherited;
  btHabMarkup.Visible := True;
  btHabPercent.Visible := False;
  edMarukpMargem.Enabled := False;
  EditHw3.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (EditHw3.CanFocus) then
    EditHw3.SetFocus;
end;

procedure TfrmCadPromocao.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    CadPromocao._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadPromocao.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    CadPromocao._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadPromocao.ChecarTipoPreco;
begin
   if RadioGroup3.ItemIndex = 0 then
   begin
     frmCadPromocao.Caption := 'Promoção';
     vtpPreco := 'P';
     QRLabel1.Caption := 'Cadastro de Promoção';
     SpeedButton8.Hint := 'Visualizar Produtos (Promoção)';
     CadPromocao.dataSet.FieldByName('DESCR_PROMOCAO').DisplayLabel := 'Promocao';
   end
   else if RadioGroup3.ItemIndex = 1 then
   begin
     frmCadPromocao.Caption := 'Tabela de Preço (Avulsa)';
     vtpPreco := 'T';
     QRLabel1.Caption := 'Cadastro de Tabela de Preço (Avulsa)';
     SpeedButton8.Hint := 'Visualizar Produtos (Tabela de Preço)';
     CadPromocao.dataSet.FieldByName('DESCR_PROMOCAO').DisplayLabel := 'Tabela';
   end
   else if RadioGroup3.ItemIndex = 2 then
   begin
   	 frmCadPromocao.Caption := 'Tabela de Preço (Localidade/Setor/Cidade)';
     vtpPreco := 'T';
     QRLabel1.Caption := 'Cadastro de Tabela de Preço (Localidade/Setor/Cidade)';
     SpeedButton8.Hint := 'Visualizar Produtos (Tabela de Preço)';
   end
   else if RadioGroup3.ItemIndex = 3 then
   begin
   	 frmCadPromocao.Caption := 'Tabela por Quantidade';
     vtpPreco := 'Q';
     QRLabel1.Caption := 'Cadastro de Tabela por Quantidade';
     SpeedButton8.Hint := 'Visualizar Produtos (Tabela por Quantidade)';
   end;
   configuraShow;
end;

procedure TfrmCadPromocao.CheckBox19Click(Sender: TObject);
begin
  inherited;
    MaskEdit4.Enabled := CheckBox19.Checked;
    MaskEdit6.Enabled := CheckBox19.Checked;
    MaskEdit5.Enabled := CheckBox19.Checked;
    MaskEdit7.Enabled := CheckBox19.Checked;

    if not CheckBox19.Checked then
      CadPromocao._abreUnicaPromocao(CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger);

   if CheckBox19.Checked then
   begin
    if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
      MaskEdit4.SetFocus;
   end;
end;

procedure TfrmCadPromocao.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  try
    if (vtpPreco = 'T') then
      if DBEdit4.Text = '  /  /    ' then
        exit;

    if (ActiveControl = BitBtn5) then
      exit;

    StrToDate(DBEdit4.Text);

  except
    on EConvertError do
    begin
      ShowMessage('Data Inicial Inválida!');
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      	DBEdit4.SetFocus;
    end;
  end;
end;

procedure TfrmCadPromocao.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  try
    if (vtpPreco = 'T') then
      if DBEdit5.Text = '  /  /    ' then
        exit;

    if (ActiveControl = BitBtn5) then
      exit;

    StrToDate(DBEdit5.Text);

  except
    on EConvertError do
    begin
      ShowMessage('Data Final Inválida!');
      if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      	DBEdit5.SetFocus;
    end;
  end;
end;

procedure TfrmCadPromocao.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  try
    if (vtpPreco = 'T') then
      if DBEdit6.Text = '  :  ' then
        exit;

    if (ActiveControl = BitBtn5) then
      exit;

    StrToTime(DBEdit6.Text);

  except
    on EConvertError do
    begin
      ShowMessage('Hora Inicial Inválida!');
      if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      	DBEdit6.SetFocus;
    end;
  end;
end;

procedure TfrmCadPromocao.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  try
    if (vtpPreco = 'T') then
      if DBEdit6.Text = '  :  ' then
        exit;

    if (ActiveControl = BitBtn5) then
      exit;

    StrToTime(DBEdit7.Text);

  except
    on EConvertError do
    begin
      ShowMessage('Hora Final Inválida!');
      if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
      	DBEdit7.SetFocus;
    end;
  end;
end;

procedure TfrmCadPromocao.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    CadPromocao._marcaDesmarcaLinha;
end;

procedure TfrmCadPromocao.DBGrid1DrawColumnCell(Sender: TObject;
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
    
  if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
  begin
    if (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').IsNull)
      and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').IsNull)
      and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').AsDateTime >= Date)
      and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').AsDateTime <= Date) then
      // Não vencida
    else if (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').IsNull)
      and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').IsNull)
      and (Date >= TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').AsDateTime) then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnCorPromocao.Color;
        TDBGrid(sender).canvas.Font.color := clBlack;
      end;
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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadPromocao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if (Key = VK_ESCAPE) then
    BitBtn5Click(Sender)
  else if Key = VK_SPACE then
    if not CadPromocao.dataSet.IsEmpty then
      CadPromocao._marcaDesmarcaLinha;
end;

procedure TfrmCadPromocao.DBGrid3CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	CadPromocao.vPromocaoProduto._marcaDesmarcaLinha;
end;

procedure TfrmCadPromocao.DBGrid3DrawColumnCell(Sender: TObject;
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
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if (trim(Edit2.Text) = '') then
  begin
    if (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').IsNull)
  	  and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').IsNull)
  	  and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').AsDateTime >= Date)
  	  and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').AsDateTime <= Date) then
      // Não vencida
    else if (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').IsNull)
      and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').IsNull)
      and (Date >= TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').AsDateTime) then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnCorPromocao2.Color;
        TDBGrid(sender).canvas.Font.color := clBlack;
      end;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else
  begin
    if gdSelected in State then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWhite;
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

procedure TfrmCadPromocao.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  vDadosIni.vShiftClick := Key = VK_SHIFT;

  if Key = VK_RETURN then
  	SpeedButton15Click(Sender)
  else if Key = VK_INSERT then
    SpeedButton17Click(Sender)
  else if Key = VK_DELETE then
  	SpeedButton16Click(Sender)
  else if Key = VK_SPACE then
  	CadPromocao.vPromocaoProduto._marcaDesmarcaLinha;
end;

procedure TfrmCadPromocao.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
end;

procedure TfrmCadPromocao.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if (Key = VK_ESCAPE) then
    BitBtn5Click(Sender);
end;

procedure TfrmCadPromocao.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn8) then
    exit;

  if DBLookupComboBox1.Text = '' then
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
end;

procedure TfrmCadPromocao.DesmarcarTodasPromocaoProdutoTabelaClickClick(
  Sender: TObject);
begin
  inherited;
  if not DBGrid3.Enabled then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    DBGrid3.Visible := False;
    CadPromocao.vPromocaoProduto._desmarcarTodos;
  finally
  	DBGrid3.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPromocao.DesmarcarTodasPromocaoTabelaClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    CadPromocao._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadPromocao.Edit1Exit(Sender: TObject);
var
	vgrupoprod: Integer;
  vcodprod: string;
begin
  inherited;
  try
 	  vgrupoprod := CadPromocao.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger;
	  vcodprod := CadPromocao.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString;

    if (CadPromocao.vPromocaoProduto.dataSet.State = dsInsert) then
      if CadPromocao.vPromocaoProduto.vCodBarra <> trim(Edit1.Text) then
      begin
        vgrupoprod := 0;
        vcodprod := '';
      end;

    if (ActiveControl = BitBtn8) then
      exit;

    if Edit1.Text = '' then
    begin
      if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
        Edit1.SetFocus;
      exit;
    end
    else
    begin
      if (CadPromocao.vPromocaoProduto.dataSet.State = dsInsert) then
      begin
        if not CadPromocao.vPromocaoProduto._buscarProduto(Edit1.Text,
        	vgrupoprod,	vcodprod) then
        begin
        	Application.MessageBox(PChar('Produto não encontrado!'), 'Erro', MB_OK);
          if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
            Edit1.SetFocus;
          exit;
        end;

        if CadPromocao.vPromocaoProduto.vPequisaPorDescr then
          Edit1.Text := CadPromocao.vPromocaoProduto.dataSet.FieldByName('NUM_FAB_PROD').AsString;

        if (CadPromocao.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString = '') then
        begin
          Application.MessageBox(PChar('Produto não encontrado!'), 'Erro', MB_OK);
          if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
            Edit1.SetFocus
        end
        else
        begin
          if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
            DBLookupComboBox1.SetFocus
          else if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
            EditHw2.SetFocus;
          CadPromocao.vPromocaoProduto.vTipoVenda._abreTipoVenda(IntToStr(DBText28.Field.AsInteger),
            '1', DBEdit9.Field.AsString, DBEdit10.Field.AsString);
        end;
      end;
    end;
  finally
     CadPromocao.vPromocaoProduto.vCodBarra := trim(Edit1.Text);
  end;
end;

procedure TfrmCadPromocao.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vProduto: TProdutos;
  vgrupoprod: Integer;
  vcodprod: string;
begin
  inherited;

  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;
      if CadPromocao.vPromocaoProduto.dataSet.State in [dsInsert, dsEdit, dsBrowse] then
      begin
        Edit1.Text := vDadosIni.vPesquisa;
        vgrupoprod := 0;
        vcodprod := '';
        if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        	vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        	vcodprod := vDadosIni.vPesquisaCod_prod;  

        if (CadPromocao.vPromocaoProduto.dataSet.State = dsInsert) then
          CadPromocao.vPromocaoProduto._buscarProduto(vDadosIni.vPesquisa,
          	vgrupoprod, vcodprod);
        CadPromocao.vPromocaoProduto.vCodBarra := trim(Edit1.Text);
      end;

    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if key = VK_F4 then
  begin
    vProduto := TProdutos.create;
    vProduto.CadProdutos(1);
    if (vDadosIni.vPesquisa <> '') then
      CadPromocao.vPromocaoProduto.dataSet.FieldByName('cod_prod').AsString := vDadosIni.vPesquisa;
  end;
end;

procedure TfrmCadPromocao.Edit2Change(Sender: TObject);
var
  tipo: string;
begin
  inherited;
  if (ComboBox4.Text = 'Descrição Produto') then
    tipo := 'DESCR_PROD'
  else if (ComboBox4.Text = 'Num. Fabricante') then
    tipo := 'NUM_FAB_PROD';

  if (Edit2.Text <> '') then
  begin
    CadPromocao.vPromocaoProduto.IndexFieldNames := tipo;
    CadPromocao.vPromocaoProduto.FindNearest([Edit2.Text]);
  end;
end;

procedure TfrmCadPromocao.EditHw1Exit(Sender: TObject);
begin
  inherited;
 if vtpPreco = 'T' then
  if (Self.Enabled) and (Self.Visible) and (BitBtn7.CanFocus) then
    BitBtn7.SetFocus;
end;

procedure TfrmCadPromocao.EditHw2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn8) then
    exit;

  if (EditHw2.AsValue > 0) then
  begin
    EditHw3.AsValue := 0;

    if CadPromocao.vPromocaoProduto.ffloat('markup') > 0 then
    begin
      CadPromocao.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat :=
        CalcUtils.Markup(EditHw2.AsValue, CadPromocao.vPromocaoProduto.ffloat('prec_cusm_prod'), DIGROUNDMAX);

      CadPromocao.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat :=
        CalcUtils.MargemLucro(CadPromocao.vPromocaoProduto.ffloat('markup'), DIGROUNDMAX);
    end;
  end;
end;

procedure TfrmCadPromocao.EditHw3Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn8) then
    exit;

  if RadioGroup3.ItemIndex = 0 then
  begin
	  if (EditHw3.AsValue > 0) then
  	begin
    	EditHw2.AsValue := 0;

      CadPromocao.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
      CadPromocao.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;

  	end;
  end
  else
  begin
    if (EditHw3.AsValue <> 0) then
  	begin
    	EditHw2.AsValue := 0;

      CadPromocao.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
      CadPromocao.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;

  	end;
  end;

  if RadioGroup3.ItemIndex = 0 then
  begin
    if not CheckBox19.Checked then
    	if (Self.Enabled) and (Self.Visible) and (BitBtn7.CanFocus) then
      	BitBtn7.SetFocus
  end
  else if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
     EditHw1.SetFocus;
end;

procedure TfrmCadPromocao.edMarukpMargemExit(Sender: TObject);
begin
  inherited;

  if (CadPromocao.vPromocaoProduto.ffloat(edMarukpMargem.DataField) <= 0) then
  begin
    CadPromocao.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    CadPromocao.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
    Exit;
  end;

  if (CadPromocao.vPromocaoProduto.ffloat('prec_cusm_prod') <= 0) then
  begin
    ShowAtencao('Produto sem custo. Preço não pode ser calculado');
    CadPromocao.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    CadPromocao.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
    Exit;
  end;                 

  EditHw2.AsValue := 0;
  EditHw3.AsValue := 0;

  if edMarukpMargem.DataField = 'MARGEM' then
    CadPromocao.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat :=
      CalcUtils.Markup(CadPromocao.vPromocaoProduto.ffloat('margem'), DIGROUNDMAX)
  else
    CadPromocao.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat :=
      CalcUtils.MargemLucro(CadPromocao.vPromocaoProduto.ffloat('markup'), DIGROUNDMAX);

  EditHw2.AsValue := CalcUtils.Preco(CadPromocao.vPromocaoProduto.ffloat('prec_cusm_prod'),
                                     CadPromocao.vPromocaoProduto.ffloat('markup'), DIGROUNDMAX);

end;

procedure TfrmCadPromocao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if (CadPromocao <> nil) then
    CadPromocao.Cancel;

  if (LocalidadeSetorCidade <> nil) then
  	LocalidadeSetorCidade.Cancel;

  BitBtn4.Enabled := true;

  CadPromocao.Free;
  CadPromocao := nil;

  LocalidadeSetorCidade.Free;
  LocalidadeSetorCidade := nil;

  Action := caFree;
  frmCadPromocao := nil;
end;

procedure TfrmCadPromocao.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  vDadosIni.vShiftClick := False;
  CadPromocao := TPromocao.create;
  LocalidadeSetorCidade := TLocalidadeSetorCidade.create;
  tsCadastro.TabVisible := false;
  tsCadastro2.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := False;
  TabSheet8.TabVisible := False;
  TabSheet9.TabVisible := False;
  TabSheet10.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadPromocao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    if CheckBox2.Checked then
      CheckBox2.Checked := false
    else
      CheckBox2.Checked := true;
  end;

  if key = VK_INSERT then
  begin
  	if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
    begin
      if PageControl1.ActivePage = TabSheet2 then
        BitBtn3Click(Sender);
    end;
  end;

  if ((key = VK_ESCAPE) and (PageControl1.ActivePage <> TabSheet6)) then
  begin
  	if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
    begin
      if (CadPromocao.dataSet.State in [dsEdit, dsInsert]) then
      begin
        ActiveControl := BitBtn5;
        BitBtn5Click(Sender);
      end;
    end
    else
    begin
    	if (LocalidadeSetorCidade.dataSet.State in [dsEdit, dsInsert]) then
      begin
        ActiveControl := BitBtn5;
        BitBtn5Click(Sender);
      end;
    end;
  end;

  if (PageControl2.ActivePage = TabSheet7) then
  begin
    if (Key = VK_RETURN) then
      SpeedButton15.Click;
  end;

  if (PageControl2.ActivePage = TabSheet8) then
  begin
    if (Key = VK_ESCAPE) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
      	BitBtn8.SetFocus;
      BitBtn8.Click;
    end;
  end;

end;

procedure TfrmCadPromocao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_CONTROL then
    vDadosIni.vCtrlClick := False;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TfrmCadPromocao.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
  	DBGrid1.DataSource := dtmProdutos.dsPromocaoP;
    DBGrid4.DataSource := dtmProdutos.dsTipoPpro;
    inherited;
    if vCriou = 0 then
    	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO226]';
  end;

 ChecarTipoPreco;

 SpeedButton6.Enabled := vtpPreco = 'P';
 
 if TelaCadastro = 1 then
   BitBtn3Click(Sender)
 else
 begin
   lixeiraVazia(not CadPromocao._lixeiraCheia);
 end;

 if vCriou = 0 then
   vCriou := 1;
   
 vDadosIni.fechaStatusProcessamento;
 SpeedButton5.Visible := False;
end;

procedure TfrmCadPromocao.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadPromocao.MarcarTodasPromocaoProdutoTabelaClickClick(
  Sender: TObject);
begin
  inherited;
  if not DBGrid3.Enabled then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    DBGrid3.Visible := False;
    CadPromocao.vPromocaoProduto._marcarTodos;
  finally
    DBGrid3.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPromocao.MarcarTodasPromocaoTabelaClickClick(Sender: TObject);
begin
  inherited;
 	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    CadPromocao._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadPromocao.MaskEdit7Exit(Sender: TObject);
begin
  inherited;
  if CheckBox19.Checked then
  	if (Self.Enabled) and (Self.Visible) and (Bitbtn7.CanFocus) then
    	BitBtn7.SetFocus;
end;

procedure TfrmCadPromocao.QRLabel1Print(sender: TObject; var Value: string);
begin
  inherited;
  if vtpPreco = 'P' then
    Value := 'Cadastro de Promoção'
  else
    Value := 'Cadastro de Preço Tabela';
end;

procedure TfrmCadPromocao.qrpPromocaoPreview(Sender: TObject);
begin
  inherited;
  if vtpPreco = 'P' then
  	vDadosIni.VisualizaRelQrp(Sender, 'Promoções')
  else
	  vDadosIni.VisualizaRelQrp(Sender, 'Tabelas de Preço');
end;

procedure TfrmCadPromocao.qrpPromocaoProdutoPreview(Sender: TObject);
begin
  inherited;
  if vtpPreco = 'P' then
	  vDadosIni.VisualizaRelQrp(Sender, 'Promoções')
  else
	  vDadosIni.VisualizaRelQrp(Sender, 'Tabelas de Preço');
end;

procedure TfrmCadPromocao.RadioGroup3Click(Sender: TObject);
begin
  inherited;              
  ChecarTipoPreco;
  BitBtn1Click(Sender);
  SpeedButton6.Enabled := RadioGroup3.ItemIndex = 0;
end;

procedure TfrmCadPromocao.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  CadPromocao.OrdenarDownGrid;
end;

procedure TfrmCadPromocao.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
  vDadosIni.vtpPreco := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'T');
  CadPromocao._abrePromocao;
end;

procedure TfrmCadPromocao.SpeedButton15Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'A', CadPromocao.buscas) then
    Exit;
  try
    if CadPromocao.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').IsNull then
      exit;

    if not CadPromocao.vPromocaoProduto.Edit then
      exit;

    MaskEdit4.Enabled := false;
    MaskEdit6.Enabled := false;
    MaskEdit5.Enabled := false;
    MaskEdit7.Enabled := false;
    Edit1.Text := CadPromocao.vPromocaoProduto.dataSet.FieldByName('NUM_FAB_PROD').AsString;
    EditHw2.AsValue := CadPromocao.vPromocaoProduto.dataSet.FieldByName('VALOR_PROMOCAO').AsFloat;
    EditHw3.AsValue := CadPromocao.vPromocaoProduto.dataSet.FieldByName('PORCENTAGEM').AsFloat;
    EditHw1.AsValue := CadPromocao.vPromocaoProduto.dataSet.FieldByName('MAX_DESC').AsFloat;

    MaskEdit4.Text := FormatDateTime('dd/mm/yyyy', CadPromocao.vPromocaoProduto.dataSet.FieldByName('DATA_INI').AsDateTime);
    MaskEdit6.Text := FormatDateTime('dd/mm/yyyy', CadPromocao.vPromocaoProduto.dataSet.FieldByName('DATA_FIM').AsDateTime);

    if (Length(CadPromocao.dataSet.FieldByName('HORA_INI').AsString) > 4) and (Length(CadPromocao.dataSet.FieldByName('HORA_INI').AsString) < 8) then
      MaskEdit5.Text := CadPromocao.dataSet.FieldByName('HORA_INI').AsString + ':' + Copy(CadPromocao.dataSet.FieldByName('HORA_INI').AsString, 4, 2)
    else
	    MaskEdit5.Text := CadPromocao.vPromocaoProduto.dataSet.FieldByName('HORA_INI').AsString;

    if (Length(CadPromocao.dataSet.FieldByName('HORA_FIM').AsString) > 4) and (Length(CadPromocao.dataSet.FieldByName('HORA_FIM').AsString) < 8) then
      MaskEdit7.Text := CadPromocao.dataSet.FieldByName('HORA_FIM').AsString + ':' + Copy(CadPromocao.dataSet.FieldByName('HORA_FIM').AsString, 4, 2)
    else
    	MaskEdit7.Text := CadPromocao.vPromocaoProduto.dataSet.FieldByName('HORA_FIM').AsString;

    CadPromocao.vPromocaoProduto.vTipoVenda._abreTipoVenda('9999999', '1',
      CadPromocao.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').AsString,
      CadPromocao.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString);

    EditHw3.Enabled := (CadPromocao.vPromocaoProduto.ffloat('MARKUP') = 0);
    btHabMarkup.Visible := EditHw3.Enabled;
    edMarukpMargem.Enabled := not EditHw3.Enabled;
    btHabPercent.Visible := not EditHw3.Enabled;
    edMarukpMargem.DataField := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'MARGEM', 'MARKUP');
    lbMakupMargem.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem:', 'Markup:');

    btHabDebCred.Visible := True;
    DBComboBox6.Enabled := not btHabDebCred.Visible;

  	if trim(CadPromocao.vPromocaoProduto.dataSet.FieldByName('USAR_DEBCRED').AsString) <> '' then
    begin
      for I := 0 to DBComboBox6.Items.Count - 1 do
        if Copy(DBComboBox6.Items[I], 1, 1) = CadPromocao.vPromocaoProduto.dataSet.FieldByName('USAR_DEBCRED').AsString then
        begin
          DBComboBox6.ItemIndex := I;
          Break;
        end;
    end
    else
    	DBComboBox6.ItemIndex := -1;

    PageControl2.ActivePage := TabSheet8;

    Edit1.Enabled := false;
    DBLookupComboBox1.Enabled := false;
    CheckBox2.Visible := false;
    Label18.Visible := false;
    Panel9.Visible := true;

    if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
      EditHw2.SetFocus;

    if RadioGroup3.ItemIndex = 0 then
    	GroupBox7.Caption := 'Alterando Produtos (Promoção)'
  	else
    	GroupBox7.Caption := 'Alterando Produtos (Tabela Preço)';

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPromocao.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'E', CadPromocao.buscas) then
    Exit;
  try
    if not vDadosIni.PesqPros('PRO241', 'EXCLUIR', '', 'PROMOCAO',
      CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString, CadPromocao.buscas, false) then
      Exit;

    try
    	DBGrid3.Visible := False;
      if not (CadPromocao.vPromocaoProduto.DeletePromocaoProduto) then
      begin
        vDadosIni.fechaStatusProcessamento;
        exit;
      end;

      CadPromocao.vPromocaoProduto._abreProdutosPromocao(
        CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString,
        CadPromocao.dataSet.FieldByName('COD_TPPRECO').AsString);
    finally
      DBGrid3.Visible := True;
    end;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadPromocao.Cancel;
      CadPromocao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPromocao.SpeedButton17Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'I', CadPromocao.buscas) then
    Exit;
  try
    if not CadPromocao.vPromocaoProduto.Insert then
      exit;

    MaskEdit4.Enabled := false;
    MaskEdit6.Enabled := false;
    MaskEdit5.Enabled := false;
    MaskEdit7.Enabled := false;
    PageControl2.ActivePage := TabSheet8;
    Edit1.Text := '';
    EditHw2.AsValue := 0;
    EditHw3.AsValue := 0;
    EditHw1.AsValue := 0;
//    CadPromocao.vPromocaoProduto.dataSet.Insert;
    DBEdit8.Field.AsString := '';
    DBEdit9.Field.AsString := '';
    DBEdit10.Field.AsString := '';
    DBEdit99.Field.AsString := '';
    DBEdit104.Field.AsString := '';
    Panel9.Visible := true;

    MaskEdit4.Text := FormatDateTime('dd/mm/yyyy', CadPromocao.dataSet.FieldByName('DATA_INI').AsDateTime);
    MaskEdit6.Text := FormatDateTime('dd/mm/yyyy', CadPromocao.dataSet.FieldByName('DATA_FIM').AsDateTime);
    
    if (Length(CadPromocao.dataSet.FieldByName('HORA_INI').AsString) > 4) and (Length(CadPromocao.dataSet.FieldByName('HORA_INI').AsString) < 8) then
      MaskEdit5.Text := CadPromocao.dataSet.FieldByName('HORA_INI').AsString + ':' + Copy(CadPromocao.dataSet.FieldByName('HORA_INI').AsString, 4, 2)
    else
    	MaskEdit5.Text := CadPromocao.dataSet.FieldByName('HORA_INI').AsString;

    if (Length(CadPromocao.dataSet.FieldByName('HORA_FIM').AsString) > 4) and (Length(CadPromocao.dataSet.FieldByName('HORA_FIM').AsString) < 8) then
      MaskEdit7.Text := CadPromocao.dataSet.FieldByName('HORA_FIM').AsString + ':' + Copy(CadPromocao.dataSet.FieldByName('HORA_FIM').AsString, 4, 2)
    else
    	MaskEdit7.Text := CadPromocao.dataSet.FieldByName('HORA_FIM').AsString;

    if RadioGroup3.ItemIndex = 0 then
	    GroupBox7.Caption := 'Incluindo Produtos (Promoção)'
    else
    	GroupBox7.Caption := 'Incluindo Produtos (Tabela de Preço)';

    if RadioGroup3.ItemIndex = 0 then
    	Label200.Caption := 'Desconto (%):'
    else
    	Label200.Caption := 'Acresc / Desc  (%):';

    EditHw3.Enabled := (CadPromocao.vPromocaoProduto.ffloat('MARKUP') = 0);
    btHabMarkup.Visible := EditHw3.Enabled;
    edMarukpMargem.Enabled := not EditHw3.Enabled;
    btHabPercent.Visible := not EditHw3.Enabled;
    edMarukpMargem.DataField := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'MARGEM', 'MARKUP');
    lbMakupMargem.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem:', 'Markup:');

    btHabDebCred.Visible := True;
    DBComboBox6.Enabled := not btHabDebCred.Visible;
    DBComboBox6.ItemIndex := -1;

    if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
      Edit1.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPromocao.SpeedButton18Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO246', 'IMPRIMIR', '', 'PROMOCAO',
    CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString, CadPromocao.buscas, true) then
    exit;

  vtpPreco := CadPromocao.dataSet.FieldByName('TIPO').AsString;

  if vtpPreco = 'P' then
  begin
    QRLabel6.Caption := 'Promoção:';
    QRDBText7.Left := 111;
  end
  else
  begin
    QRLabel6.Caption := 'Tabela  de  Preço:';
    QRDBText7.Left := 135;
  end;

  qrpPromocaoProduto.Preview;
end;

procedure TfrmCadPromocao.SpeedButton19Click(Sender: TObject);
begin
  inherited;
	SpeedButton8Click(Sender);	
end;

procedure TfrmCadPromocao.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PROMOCAO_TABELA', 'A', CadPromocao.buscas) then
    Exit;

  try
  	if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
    begin
    	if CadPromocao.dataSet.IsEmpty then
      	Exit;

      if not vDadosIni.PesqPros('PRO225', 'ALTERAR', '', 'PROMOCAO',
        CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString, CadPromocao.buscas, true) then
        exit;

      vDadosIni.vtpPreco := vtpPreco;
      if not CadPromocao.Edit then
        Exit;

      inherited;

      GroupBoxVenc.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      Label9.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      Label10.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      Label11.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      Label12.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      DBEdit4.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      DBEdit5.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      DBEdit6.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      DBEdit7.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) or (RadioGroup3.ItemIndex = 0);
      Label22.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) and (RadioGroup3.ItemIndex = 1);
      SpeedButton59.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce) and (RadioGroup3.ItemIndex = 1);

      BitBtn9.Visible := (RadioGroup3.ItemIndex = 0);
      DBEdit4.Enabled := (RadioGroup3.ItemIndex = 1);
      DBEdit5.Enabled := (RadioGroup3.ItemIndex = 1);
      DBEdit6.Enabled := (RadioGroup3.ItemIndex = 1);
      DBEdit7.Enabled := (RadioGroup3.ItemIndex = 1);

      Label19.Visible := (RadioGroup3.ItemIndex = 1);
      DBComboBox1.Visible := (RadioGroup3.ItemIndex = 1);
      Label25.Visible := (RadioGroup3.ItemIndex = 1);
      Label24.Visible := (RadioGroup3.ItemIndex = 1);

      for I := 0 to DBComboBox5.Items.Count - 1 do
        if Copy(DBComboBox5.Items[I], 1, 1) =
          vDadosIni.IfThen(trim(CadPromocao.dataSet.FieldByName('USAR_DEBCRED').AsString) = '',
            'S',
            CadPromocao.dataSet.FieldByName('USAR_DEBCRED').AsString) then
        begin
          DBComboBox5.ItemIndex := I;
          Break;
        end;

      for I := 0 to DBComboBox1.Items.Count - 1 do
        if Copy(DBComboBox1.Items[I], 1, 1) =
          vDadosIni.IfThen(trim(CadPromocao.dataSet.FieldByName('RECALC_PRECO').AsString) = '',
            'N',
            CadPromocao.dataSet.FieldByName('RECALC_PRECO').AsString) then
        begin
          DBComboBox1.ItemIndex := I;
          Break;
        end;

      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsCadastro;

      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        DBEdit2.SetFocus;
    end
    else
    begin
    	if LocalidadeSetorCidade.dataSet.IsEmpty then
      	Exit;

      if not vDadosIni.PesqPros('PRO225', 'ALTERAR', '', 'TIPO_PRECO',
        LocalidadeSetorCidade.dataSet.FieldByName('COD_TPPRECO').AsString, LocalidadeSetorCidade.buscas, true) then
        exit;

      if not LocalidadeSetorCidade.Edit then
        Exit;

      inherited;

    	for I := 0 to DBComboBox2.Items.Count - 1 do
        if trim(DBComboBox2.Items[I]) = trim(LocalidadeSetorCidade.dataSet.FieldByName('DESCR_TIPO').AsString) then
        begin
          DBComboBox2.ItemIndex := I;
          Break;
        end;

      for I := 0 to DBComboBox4.Items.Count - 1 do
        if Copy(DBComboBox4.Items[I], 1, 1) =
          vDadosIni.IfThen(trim(LocalidadeSetorCidade.dataSet.FieldByName('USAR_DEBCRED').AsString) = '',
            'S',
            LocalidadeSetorCidade.dataSet.FieldByName('USAR_DEBCRED').AsString) then
        begin
          DBComboBox4.ItemIndex := I;
          Break;
        end;

      for I := 0 to DBComboBox3.Items.Count - 1 do
        if Copy(DBComboBox3.Items[I], 1, 1) =
          vDadosIni.IfThen(trim(LocalidadeSetorCidade.dataSet.FieldByName('RECALC_PRECO').AsString) = '',
            'N',
            LocalidadeSetorCidade.dataSet.FieldByName('RECALC_PRECO').AsString) then
        begin
          DBComboBox3.ItemIndex := I;
          Break;
        end;

    	PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsCadastro2;

      if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then
        DBComboBox4.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
        DBComboBox3.SetFocus;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
      begin
        CadPromocao.Cancel;
        CadPromocao.RollBackTransacao;
      end
      else
      begin
        LocalidadeSetorCidade.Cancel;
        LocalidadeSetorCidade.RollBackTransacao;
      end;
    end;
  end;
end;

procedure TfrmCadPromocao.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO230', 'ABRIR A LIXEIRA', '', 'PROMOCAO',
    '', CadPromocao.buscas, true) then
    Exit;

  inherited;

  vDadosIni.vtpPreco := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'T');
  if not CadPromocao._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO226]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := True;
    SpeedButton8.Visible := True;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [PRO227]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    SpeedButton6.Visible := False;
    SpeedButton8.Visible := False;
  end;

end;

procedure TfrmCadPromocao.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;

    if not vDadosIni.validarAcessoCadastrosEmpresas('PROMOCAO_TABELA', 'E', CadPromocao.buscas) then
  	  Exit;

    vDadosIni.vtpPreco := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'T');
    if not CadPromocao.Delete then
      Exit;

    vStatusLixeira := CadPromocao._lixeiraCheia;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadPromocao.Cancel;
      CadPromocao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPromocao.SpeedButton3Click(Sender: TObject);
begin
  if (RadioGroup3.ItemIndex = 0) or (RadioGroup3.ItemIndex = 1) then
  begin
    if not vDadosIni.PesqPros('PRO231', 'IMPRIMIR', '', 'PROMOCAO',
      CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString, CadPromocao.buscas, true) then
      exit;

    vtpPreco := CadPromocao.dataSet.FieldByName('TIPO').AsString;
    qrpPromocao.Preview;
  end
  else if (RadioGroup3.ItemIndex = 2) then
  begin
  	if not vDadosIni.PesqPros('PRO231', 'IMPRIMIR', '', 'TIPO_PRECO',
      LocalidadeSetorCidade.dataSet.FieldByName('COD_TPPRECO').AsString, LocalidadeSetorCidade.buscas, true) then
      exit;

    vtpPreco := 'T';
    qrpTabela.Preview;
  end
  else if (RadioGroup3.ItemIndex = 3) then
  begin
  	if not vDadosIni.PesqPros('PRO231', 'IMPRIMIR', '', 'TIPO_PRECO',
      LocalidadeSetorCidade.dataSet.FieldByName('COD_TPPRECO').AsString, LocalidadeSetorCidade.buscas, true) then
      exit;

    vtpPreco := 'Q';
    qrpTabela.Preview;
  end;
end;

procedure TfrmCadPromocao.SpeedButton59Click(Sender: TObject);
begin
 if not (CadPromocao.dataSet.State = dsEdit) then
   exit;

 CadPromocao.dataSet.FieldByName('DATA_INI').Value := Null;
 CadPromocao.dataSet.FieldByName('DATA_FIM').Value := Null;
 CadPromocao.dataSet.FieldByName('HORA_INI').Value := Null;
 CadPromocao.dataSet.FieldByName('HORA_FIM').Value := Null;
end;

procedure TfrmCadPromocao.SpeedButton5Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PROMOCAO_TABELA', 'A', CadPromocao.buscas) then
    Exit;

  vDadosIni.vtpPreco := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'T');
  if not CadPromocao._restauraLixeira then
  	Exit;

  if CadPromocao._lixeiraCheia then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCadPromocao.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PROMOCAO_TABELA', 'A', CadPromocao.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO245', 'ABRIR', '', 'PROMOCAO',
    CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString, CadPromocao.buscas, true) then
    exit;

  if not CadPromocao._abrePromocao then
    exit;

  PageControl1.ActivePage := TabSheet5;
end;

procedure TfrmCadPromocao.SpeedButton8Click(Sender: TObject);
begin
  inherited;
	try
  	 Screen.Cursor := crDefault;
     if CadPromocao.dataSet.IsEmpty then
       Exit;

     vtpPreco := CadPromocao.dataSet.FieldByName('TIPO').AsString;

     if vtpPreco = 'P' then
     begin
       frmCadPromocao.Caption := 'Promoção';
       SpeedButton8.Hint := 'Visualizar Produtos Promoção';
     end
     else
     begin
       frmCadPromocao.Caption := 'Preço Tabela';
       SpeedButton8.Hint := 'Visualizar Produtos Preço Tabela';
     end;

    if CadPromocao.dataSet.FieldByName('COD_PROMOCAO').IsNull then
      exit;

    CadPromocao.vPromocaoProduto := TPromocaoProduto.Create;
    CadPromocao.vPromocaoProduto._abreProdutosPromocao(
      CadPromocao.dataSet.FieldByName('COD_PROMOCAO').AsString,
      CadPromocao.dataSet.FieldByName('COD_TPPRECO').AsString);

    PageControl1.ActivePage := TabSheet6;
    PageControl2.ActivePage := TabSheet7;
    Panel9.Visible := false;
    DBText29.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    DBText30.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    DBText32.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    DBText33.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label202.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label203.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label216.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label218.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    MaskEdit4.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    MaskEdit6.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    MaskEdit5.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    MaskEdit7.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label204.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label207.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label208.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label209.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);


    EditHw1.Visible := (RadioGroup3.ItemIndex = 1);
    Label20.Visible := (RadioGroup3.ItemIndex = 1);

    Label220.Visible := (RadioGroup3.ItemIndex = 0);
    DBLookupComboBox1.Visible := (RadioGroup3.ItemIndex = 0);

    CheckBox19.Visible := (not CadPromocao.dataSet.FieldByName('DATA_INI').IsNull) or (RadioGroup3.ItemIndex = 0);
    Label21.Visible := (RadioGroup3.ItemIndex = 1);

    if RadioGroup3.ItemIndex = 0 then
    begin
      GroupBox68.Caption := 'Promoção';
      Label200.Caption := 'Desconto (%):';
    end
    else
    begin
      GroupBox68.Caption := 'Tabela  de  Preço';
      Label200.Caption := 'Acresc/Desc (%):';
    end;
    if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
      ComboBox4.SetFocus;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPromocao.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  CadPromocao.OrdenarUpGrid;
end;

end.


