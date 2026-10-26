unit Ucrm40;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls,
  QuickRpt,uClassesCRM, DBCtrls, QRCtrls, uEditHw;

type
  TfrmCrm40 = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    tsConsumo: TTabSheet;
    tsFinancas: TTabSheet;
    tsVendasPerdidas: TTabSheet;
    tsOrcamento: TTabSheet;
    tsEquipVeic: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    tsDevolucao: TTabSheet;
    DBLookupComboBox1: TDBLookupComboBox;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    GroupBox4: TGroupBox;
    GridDevolucao2: TDBGrid;
    Panel4: TPanel;
    BitBtn3: TBitBtn;
    GroupBox3: TGroupBox;
    GridDevolucao1: TDBGrid;
    Panel3: TPanel;
    BitBtn19: TBitBtn;
    TabSheet10: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    qrlCliente: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    lbQuantTotal: TQRLabel;
    lbValorTotal: TQRLabel;
    QRShape3: TQRShape;
    CheckBox1: TCheckBox;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlCliente2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape5: TQRShape;
    QRBand3: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand4: TQRBand;
    QRLabel27: TQRLabel;
    QRShape6: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText24: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel29: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    tsProdutosEmPromocao: TTabSheet;
    PageControl3: TPageControl;
    tsPromProdutos: TTabSheet;
    GroupBox5: TGroupBox;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid4: TDBGrid;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    EditHw1: TEditHw;
    Label6: TLabel;
    EditHw2: TEditHw;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn4: TBitBtn;
    Shape1: TShape;
    Label7: TLabel;
    Shape2: TShape;
    Label8: TLabel;
    Panel11: TPanel;
    DBText25: TDBText;
    PageFinancas: TPageControl;
    tsCreditos: TTabSheet;
    tsCheques: TTabSheet;
    GroupBox27: TGroupBox;
    DBGrid5: TDBGrid;
    tsRecibos: TTabSheet;
    tsFichaAcompanhamento: TTabSheet;
    Panel7: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    QRBand5: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRBand6: TQRBand;
    QRSysData4: TQRSysData;
    GroupBox7: TGroupBox;
    DBGrid6: TDBGrid;
    GroupBox8: TGroupBox;
    DBGrid7: TDBGrid;
    GroupBox9: TGroupBox;
    DBGrid8: TDBGrid;
    GroupBox10: TGroupBox;
    DBGrid9: TDBGrid;
    SpeedButton1: TSpeedButton;
    CheckBox2: TCheckBox;
    GroupBox11: TGroupBox;
    GridVendasPedidas: TDBGrid;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    PageConsumo: TPageControl;
    tsCurvaABCCliente: TTabSheet;
    GroupBox12: TGroupBox;
    GridRankingClientes: TDBGrid;
    Panel9: TPanel;
    SpeedButton5: TSpeedButton;
    Panel10: TPanel;
    GBOpcaoCliente: TGroupBox;
    LblQtdCompra: TLabel;
    LblSomaCompra: TLabel;
    LblCliAssiduos: TLabel;
    LblAtrasoCompra: TLabel;
    LblLucroCliente: TLabel;
    CBQtdCompra: TComboBox;
    CBSomaCompra: TComboBox;
    CBCliAssiduos: TComboBox;
    CBAtrasoCompra: TComboBox;
    CBLucroCliente: TComboBox;
    GBTipoCliente: TGroupBox;
    CKBPeca: TCheckBox;
    CKBVeiculo: TCheckBox;
    CKBServico: TCheckBox;
    RadioGroup1: TRadioGroup;
    Label9: TLabel;
    Edit1: TEdit;
    CheckPF: TCheckBox;
    CheckPJ: TCheckBox;
    GroupBox13: TGroupBox;
    DBGrid12: TDBGrid;
    GroupBox14: TGroupBox;
    DBGrid13: TDBGrid;
    Panel12: TPanel;
    SpeedButton7: TSpeedButton;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel13: TPanel;
    Panel16: TPanel;
    pgSugestaoServ: TPageControl;
    tsSugServClientes: TTabSheet;
    GroupBox15: TGroupBox;
    GridSugServCliente: TDBGrid;
    Panel17: TPanel;
    GroupBox16: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    cbCLQTDCOMPRA1: TComboBox;
    cbCLSOMACOMPRA1: TComboBox;
    cbCLULTIMACOMPRA1: TComboBox;
    cbCLATRASOCOMPRA1: TComboBox;
    cbCLLUCROCLIENTE1: TComboBox;
    Panel18: TPanel;
    SpeedButton6: TSpeedButton;
    CheckNecAcomp: TCheckBox;
    CheckBox9: TCheckBox;
    Label10: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label16: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    tsIndiceSatisfacaoCli: TTabSheet;
    Panel19: TPanel;
    SpeedButton12: TSpeedButton;
    SpeedButton16: TSpeedButton;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Panel20: TPanel;
    SpeedButton17: TSpeedButton;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label17: TLabel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    SpeedButton18: TSpeedButton;
    Panel24: TPanel;
    procedure GridDevolucao2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton18Click(Sender: TObject);
    procedure tsSugServClientesShow(Sender: TObject);
    procedure GridSugServClienteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckNecAcompClick(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure GridDevolucao2TitleClick(Column: TColumn);
    procedure GridDevolucao1TitleClick(Column: TColumn);
    procedure DBGrid13TitleClick(Column: TColumn);
    procedure GridVendasPedidasTitleClick(Column: TColumn);
    procedure GridRankingClientesTitleClick(Column: TColumn);
    procedure DBGrid7TitleClick(Column: TColumn);
    procedure DBGrid6TitleClick(Column: TColumn);
    procedure tsFinancasShow(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid8TitleClick(Column: TColumn);
    procedure CheckBox9Click(Sender: TObject);
    procedure cbCLQTDCOMPRA1Exit(Sender: TObject);
    procedure GridSugServClienteTitleClick(Column: TColumn);
    procedure SpeedButton6Click(Sender: TObject);
    procedure tsEquipVeicShow(Sender: TObject);
    procedure DBGrid13DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid12DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tsOrcamentoShow(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure GridRankingClientesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tsConsumoShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tsVendasPerdidasShow(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure QuickRep2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep2Preview(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tsDevolucaoExit(Sender: TObject);
    procedure tsDevolucaoShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    vGrupo: Integer;
    vCodProd: string;
    vExcel: Variant;
  public
    { Public declarations }
  end;

var
  frmCrm40: TfrmCrm40;

implementation

uses UDtmClientes,UDtmCRM,uDadosIni, uDtmAtivo, DB,uClassesFollowUpPosAtendimento;

{$R *.dfm}

procedure TfrmCrm40.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if (obCRM.obDev = nil) or (obCRM.obDev.IsEmpty) then
    exit;
  if vDadosIni.PesqPros('CRM022', 'BT IMPRIMIR DEVOLUCAO ITENS', '', 'DEVOLUCAO',
    'Cli:'+DBGrid1.DataSource.dataSet.FieldByName('cod_cliente').AsString, obCRM.obDev.buscas, true) then
  begin
    qrlCliente.Caption := DBGrid1.DataSource.dataSet.FieldByName('nome_cliente').AsString;
    QuickRep1.Preview;
  end;
end;

procedure TfrmCrm40.BitBtn1Click(Sender: TObject);
begin
  inherited;
  {
  if not obCRM._validarData(MaskEdit1.Text,MaskEdit2.Text) then
  begin
    setFocusCampoErro(obCRM.vNomeCampoErro);
    exit;
  end;


  if PageControl1.ActivePage=tsDevolucao then
  begin
    if DBGrid1.DataSource.DataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum cliente foi selecionado.','Informação', MB_OK+MB_ICONINFORMATION);
      exit;
    end;

    GroupBox3.Caption:= 'Devoluções do Cliente: '+trim(DBGrid1.DataSource.DataSet.FieldByName('NOME_CLIENTE').AsString)+' - '+DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsString;
    GroupBox4.Caption:= 'Devoluções em vendas realizadas de forma condicional para o cliente: '+trim(DBGrid1.DataSource.DataSet.FieldByName('NOME_CLIENTE').AsString)+' - '+DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsString;
    if obCRM.obDev = nil then
      obCRM.obDev:= TDev.create;
    obCRM.obDev.FiltrarData:=obCRM.FiltrarData;
    if not obCRM.obDev._abreDev(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').asinteger) then
      exit;
    if obCRM.obDevReq = nil then
      obCRM.obDevReq:= TDevReq.create;
    obCRM.obDevReq.FiltrarData:=obCRM.FiltrarData;
    obCRM.obDevReq._abreDevReq(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').asinteger);
  end;}
end;

procedure TfrmCrm40.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if ActiveControl<>DBGrid8 then
    Close;
end;

procedure TfrmCrm40.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if  (obCRM.obDevReq = nil) or (obCRM.obDevReq.IsEmpty) then
    exit;
  if vDadosIni.PesqPros('CRM023', 'BT IMPRIMIR DEVOLUCAO DE ITENS EM MODO CONDICIONAL', '', 'PEDVENDA_PROD',
    'Cli:'+DBGrid1.DataSource.DataSet.FieldByName('cod_cliente').AsString, obCRM.obDevReq.buscas, False) then
  begin
    qrlCliente2.Caption := DBGrid1.DataSource.DataSet.FieldByName('nome_cliente').AsString;
    QuickRep2.Preview;
  end;

end;

procedure TfrmCrm40.BitBtn4Click(Sender: TObject);
begin
  inherited;
  obCRM.obPromProd.DIAS_BASE_CONSULTA := EditHw1.AsInteger;
  obCRM.obPromProd.QTDE_MAX_REGISTROS := EditHw2.AsInteger;
  obCRM.obPromProd.ORDEM_QTDE := RadioButton1.Checked;
  obCRM.obPromProd.COD_CLIENTE := DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').asinteger;
  obCRM.obPromProd._abrePromocoesParaCliente;
end;

procedure TfrmCrm40.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if DBGrid8.DataSource.dataSet.IsEmpty then
    exit;
  if not obCRM.obFichaAcomp._existePesquisa(DBGrid8.DataSource.dataSet.FieldByName('NPED').AsInteger,
    trim(DBGrid8.DataSource.dataSet.FieldByName('TIPO').AsString)) then
    exit;
  if flwPesquisaE = nil then
    flwPesquisaE:= TFlw_Pesquisa.createPesquisa;
  flwPesquisaE._abrirPesquisa(DBGrid8.DataSource.dataSet.FieldByName('NPED').AsInteger,
    trim(DBGrid8.DataSource.dataSet.FieldByName('TIPO').AsString));
end;

procedure TfrmCrm40.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM078', 'VISUALIZAR', '', 'FLW_PESQUISA', '', obCRM.buscas, True) then
     exit;
  flwPesquisaE._cadPesquisa(1,DBGrid1.DataSource.dataSet.FieldByName('cod_cliente').AsInteger)
end;

procedure TfrmCrm40.BitBtn7Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('CRM079', 'EXPORTAR', '', 'FLW_PESQUISA', '', obCRM.buscas, True) then
      exit;
    if flwPesquisa = nil then
      flwPesquisa := TFlw_Pesquisa.create;
    flwPesquisa._pesquisa(DBGrid1.DataSource.dataSet.FieldByName('cod_cliente').AsInteger);
    if flwPesquisa.IsEmpty then
      exit;
    try
      Screen.Cursor := crHourGlass;
      flwPesquisa._exportarParaExcel;
    finally
      Screen.Cursor := crDefault;
    end;
  finally

  end;
end;

procedure TfrmCrm40.btnNextClick(Sender: TObject);
begin
  inherited;
  PageFinancas.SelectNextPage(true);
end;

procedure TfrmCrm40.btnPriorClick(Sender: TObject);
begin
  inherited;
  PageFinancas.SelectNextPage(false);
end;

procedure TfrmCrm40.CheckBox1Click(Sender: TObject);
begin
  inherited;
  obCRM.FiltrarData := TCheckBox(sender).Checked;
end;

procedure TfrmCrm40.CheckBox2Click(Sender: TObject);
begin
  inherited;
  obCRM.TodasEmpresas := TCheckBox(sender).Checked;
  if TCheckBox(Sender).Name = 'CheckBox2' then
    SpeedButton1Click(Sender)
  else if TCheckBox(Sender).Name = 'CheckBox4' then
    SpeedButton12Click(Sender);
end;

procedure TfrmCrm40.CheckBox3Click(Sender: TObject);
begin
  inherited;
//  CheckBox3.Checked:= not CheckBox3.Checked;
//  if CheckBox3.Checked then
//  begin
//    GridSugServCliente.DataSource:= obCRM.obSugeServ.dsSugeServVeic;
//    tsSugServClientes.Caption:='Sugestão de Serviços por Veículo';
//  end
//  else begin
//    GridSugServCliente.DataSource:= obCRM.obSugeServ.dsSugeServ;
//    tsSugServClientes.Caption:='Sugestão de Serviços por Cliente';
//  end;
  tsSugServClientes.Caption:='Sugestão de Serviços por Cliente';
  if GridSugServCliente.DataSource.DataSet.Active then
    GridSugServCliente.Refresh;
  GroupBox16.Visible:= not CheckBox3.Checked;
//  CheckNecAcomp.Checked:=not CheckBox3.Checked;
  CheckNecAcomp.Visible:=not CheckBox3.Checked;
end;

procedure TfrmCrm40.CheckBox9Click(Sender: TObject);
begin
  inherited;
  if not CheckBox9.Checked then
  begin
    MaskEdit3.Text:='';
    MaskEdit4.Text:='';
  end
  else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
  	MaskEdit3.SetFocus;
end;

procedure TfrmCrm40.CheckNecAcompClick(Sender: TObject);
begin
  inherited;
  cbCLQTDCOMPRA1Exit(sender);
end;

procedure TfrmCrm40.cbCLQTDCOMPRA1Exit(Sender: TObject);
begin
  inherited;
  obCRM.obSugeServ.CLQTDCOMPRA := trim(cbCLQTDCOMPRA1.Text);
  obCRM.obSugeServ.CLSOMACOMPRA := trim(cbCLSOMACOMPRA1.Text);
  obCRM.obSugeServ.CLULTIMACOMPRA := trim(cbCLULTIMACOMPRA1.Text);
  obCRM.obSugeServ.CLATRASOCOMPRA := trim(cbCLATRASOCOMPRA1.Text);
  obCRM.obSugeServ.CLLUCROCLIENTE :=trim(cbCLLUCROCLIENTE1.Text);
  obCRM.obSugeServ.Nec_acomp := CheckNecAcomp.Checked;
  obCRM.obSugeServ.excecaoData := CheckBox9.Checked;
  obCRM.obSugeServ.filtrarServicoSug(MaskEdit1.Text,MaskEdit2.Text);
end;

procedure TfrmCrm40.GridVendasPedidasTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(GridVendasPedidas, Column);
end;

procedure TfrmCrm40.GridRankingClientesDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  GridRankingClientes.Canvas.Brush.Color := clInfoBK;//TColor($006AD2FF);
  if (Column.Index mod 2 = 1) then
  begin
  // Troca a cor do texto de uma coluna
//    TDBGrid(sender).Canvas.Brush.Color := clInfoBK;
    GridRankingClientes.Canvas.Font.Color := clBlack;
//    DBGrid11.Canvas.Font.Style := DBGrid11.Canvas.Font.Style+[fsBold];
  end
  else //DBGrid11.Canvas.Font.Style := DBGrid11.Canvas.Font.Style - [fsBold];
    GridRankingClientes.Canvas.Font.Color := clBlue;
  GridRankingClientes.Canvas.FillRect(Rect);
  GridRankingClientes.Canvas.TextOut(Rect.Left+1,Rect.Top,Column.Field.AsString);
  TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmCrm40.GridRankingClientesTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(GridRankingClientes, Column);
end;

procedure TfrmCrm40.DBGrid12DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (obCRM.obOrcamentoCli.obItensOrcamentosCli.dataSet.FieldByName('STATUS_ITEM').AsString <> '') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end else if (obCRM.obOrcamentoCli.obItensOrcamentosCli.dataSet.FieldByName('TIPO').AsString = 'ORC') then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).Canvas.Brush.Color := clInfoBK;
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end else if (trim(obCRM.obOrcamentoCli.obItensOrcamentosCli.dataSet.FieldByName('TIPO').AsString) = 'OS') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := TColor($006AD2FF);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end else if (obCRM.obOrcamentoCli.obItensOrcamentosCli.dataSet.FieldByName('TIPO').AsString = 'REQ') then
  begin
     TDBGrid(sender).Canvas.Brush.Color := TColor($008AFF8A);
     TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCrm40.DBGrid13DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (obCRM.obOrcamentoCli.dataSet.FieldByName('STATUS_PED').AsString = 'CANCELADO') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCrm40.DBGrid13TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid13, Column);
end;

procedure TfrmCrm40.GridSugServClienteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if obCRM.obSugeServCli.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0 then   
    if (trim(obCRM.obSugeServCli.dataSet.FieldByName('STATUS').AsString) = 'CANCELADA') then
    begin
      TDBGrid(sender).Canvas.Brush.Color := clRed;
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else if (trim(obCRM.obSugeServCli.dataSet.FieldByName('STATUS').AsString) = 'FINALIZADA') then
    begin
      TDBGrid(sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else if (trim(obCRM.obSugeServCli.dataSet.FieldByName('STATUS').AsString) = '') then
    begin
      TDBGrid(sender).Canvas.Brush.Color := TColor($006AD2FF);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmCrm40.GridSugServClienteTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(GridSugServCliente, Column);// ,
end;

procedure TfrmCrm40.GridDevolucao1TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(GridDevolucao1, Column);
end;

procedure TfrmCrm40.GridDevolucao2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (trim(GridDevolucao2.DataSource.dataSet.FieldByName('STATUS').AsString) = 'CANCELADO') then
   begin
     if (gdFocused in State) then
     begin
       TDBGrid(sender).canvas.brush.color := clWindow;
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end
     else
     begin
       if (gdFocused in State) then
         TDBGrid(sender).canvas.brush.color := clGray
       else
         TDBGrid(sender).Canvas.Brush.Color := TColor($006AD2FF);
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end;
     TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
   end
   else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV')
    and  (Column.Field.Dataset.FieldbyName('QUANT_ITEM_DEV').AsInteger > 0) then
   begin
     TDBGrid(sender).canvas.brush.color := TColor($006AD2FF);
     TDBGrid(sender).Canvas.Font.Color := clWindowText;
     TDBGrid(sender).Canvas.FillRect(Rect);
     TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
   end;
end;

procedure TfrmCrm40.GridDevolucao2TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(GridDevolucao2, Column);
end;

procedure TfrmCrm40.DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  R: TRect;
begin
  inherited;

//  if (gdFocused in State) then
//    TDBGrid(sender).canvas.brush.color := clBlue
//  else if Column.Field.Dataset.FieldbyName('tipo').AsString = 'P' then
//    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA)
//  else
//    TDBGrid(sender).canvas.brush.color := TColor($00FFE09F);

//  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if (Column.FieldName = 'DESCRICAO') or (Column.FieldName = 'VALOR_PROMOCAO') or (Column.FieldName = 'DESCR_PROD') then
  begin
    if Column.Field.Dataset.FieldbyName('tipo').AsString = 'P' then
    begin
      TDBGrid(sender).Canvas.Brush.Color := TColor($006AD2FF);
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
      TDBGrid(sender).Canvas.Brush.Color := TColor($008AFF8A);
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;
end;

procedure TfrmCrm40.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;

procedure TfrmCrm40.DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((Column.FieldName = 'DATA_VENC_C') and
     (obCRM.obFinancaCred.dataSet.FieldByName('DATA_VENC_C').AsDateTime < obCRM.databanco) and
    obCRM.obFinancaCred.dataSet.FieldByName('datq_c').isnull) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
  end;
  TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmCrm40.DBGrid5TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid5, Column);
end;

procedure TfrmCrm40.DBGrid6TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid6, Column);
end;

procedure TfrmCrm40.DBGrid7TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid7, Column);
end;

procedure TfrmCrm40.DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (trim(Column.Field.Dataset.FieldbyName('STATUS').AsString)='CONCLUIDA') then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($00ACC891);// $0000A4EA);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCrm40.DBGrid8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  vDadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TfrmCrm40.DBGrid8TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid8, Column);
end;

procedure TfrmCrm40.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  obCRM.obDev.vValorTotal := obCRM.obDev.vValorTotal + (obCRM.obDev.dataset.FieldByName('quant').AsCurrency * obCRM.obDev.dataset.FieldByName('valor').AsCurrency);
  obCRM.obDev.vQuantTotal := obCRM.obDev.vQuantTotal + obCRM.obDev.dataset.FieldByName('quant').AsCurrency;
  lbValorTotal.Caption := 'R$ ' + FormatFloat('0.00', obCRM.obDev.vValorTotal);
  lbQuantTotal.Caption := FloatToStr(obCRM.obDev.vQuantTotal);
end;

procedure TfrmCrm40.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  vDadosIni._fecharExcel;
  if obCRM<>nil then
  begin
    obCRM.free;
    obCRM := nil;
  end;
  Action := caFree;
  FrmCrm40 := nil;
end;

procedure TfrmCrm40.FormCreate(Sender: TObject);
var
  i:integer;
begin
  inherited;
  vDadosIni.vShiftClick := False;
  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;
  for I := 0 to PageControl2.PageCount - 1 do
    PageControl2.Pages[i].TabVisible := false;
  tsDevolucao.TabVisible := True;
  tsProdutosEmPromocao.TabVisible := True;
  tsFinancas.TabVisible:=true;
  tsVendasPerdidas.TabVisible := true;
  tsConsumo.TabVisible := true;
  tsOrcamento.TabVisible := true;
  tsEquipVeic.TabVisible := true;
//  vDadosIni.vEmp.vVersaoVeiculos ='4'
//  if vDadosIni.vEmp.vUsarAparelho = 'S' then
//  begin
//    tsEquipVeic.Caption:= 'Equipamentos';
//    tsSugServVeiculos.TabVisible := false;
//  end
//  else begin
//    tsEquipVeic.Caption:= 'Veículos';
//    tsSugServVeiculos.TabVisible := true;
//  end;

  tsPromProdutos.TabVisible := False;
  PageControl3.ActivePage := tsPromProdutos;
  for I := 0 to PageControl1.PageCount - 1 do
    if PageControl1.Pages[i].TabVisible then
    begin
      PageControl1.ActivePage:=PageControl1.Pages[i];
      break;
    end;
//  PageControl1.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;
  if obCRM = nil then
    obCRM := TCRM.Create;
//  obCRM._validarData(datetostr(vDadosIni.getDataBanco(obCRM.buscas)),datetostr(vDadosIni.getDataBanco(obCRM.buscas)));
  MaskEdit1.Text := DateToStr(obCRM.datainicial);
  MaskEdit2.Text := DateToStr(obCRM.datafinal);
  CheckBox1.Checked := obCRM.FiltrarData;
  CheckBox2.Checked := obCRM.TodasEmpresas;
  EditHw1.AsValue := obCRM.obPromProd.DIAS_BASE_CONSULTA;
  EditHw2.AsValue := obCRM.obPromProd.QTDE_MAX_REGISTROS;
  RadioButton1.Checked := obCRM.obPromProd.ORDEM_QTDE;
  DBLookupComboBox1.KeyValue:=  DBGrid1.DataSource.DataSet.FieldByName('NOME_CLIENTE').AsString;
end;

procedure TfrmCrm40.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f2 then
    CheckBox1.Checked := not CheckBox1.Checked
  else if (Key = vk_f3) and (PageControl1.ActivePage = tsFinancas) then
    CheckBox2.Checked := not CheckBox2.Checked
  else if (Key = vk_f3) and (PageControl1.ActivePage = tsEquipVeic) then
    CheckBox3.Checked := not CheckBox3.Checked
  else if (Key = vk_f3) and (PageConsumo.ActivePage = tsFichaAcompanhamento)
  and (PageControl1.ActivePage = tsConsumo) then
    CheckBox4.Checked := not CheckBox4.Checked;
//    SpeedButton12Click(Sender);
//  end;
end;

procedure TfrmCrm40.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_CONTROL then
    vDadosIni.vCtrlClick := False;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TfrmCrm40.FormShow(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus;
  if (length(ShortDateFormat) <= 8) and (pos('yyyy', ShortDateFormat) = 0) then
  begin
    MaskEdit1.EditMask := '!99/99/00;1;_';
    MaskEdit2.EditMask := '!99/99/00;1;_';
    if MaskEdit1.Text = '  /  /  ' then
      MaskEdit1.Text := DateToStr(Date);
    if MaskEdit2.Text = '  /  /  ' then
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
  PageControl1.ActivePageIndex:=0;
  PageControl2.ActivePageIndex:=0;
  PageControl3.ActivePageIndex:=0;
  PageConsumo.ActivePageIndex:=0;
  PageFinancas.ActivePageIndex:=0;
end;

procedure TfrmCrm40.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  obCRM.obDevReq.vValorTotal := obCRM.obDevReq.vValorTotal + (obCRM.obDevReq.dataset.FieldByName('VLTOT_PED_ITEM').AsCurrency);// * obCRM.obDevReq.dataset.FieldByName('valor').AsCurrency);
//  obCRM.obDevReq.vQuantTotal := obCRM.obDevReq.vQuantTotal + obCRM.obDevReq.dataset.FieldByName('QUANT_PED_ITEM').AsFloat;
//  obCRM.obDevReq.vQuantTotalDev := obCRM.obDevReq.vQuantTotalDev + obCRM.obDevReq.dataset.FieldByName('QUANT_ITEM_DEV').AsFloat;
//  obCRM.obDevReq.vValorTotalDev := obCRM.obDevReq.vValorTotalDev + (obCRM.obDevReq.dataset.FieldByName('QUANT_ITEM_DEV').AsFloat*obCRM.obDevReq.dataset.FieldByName('VLUN_PED_ITEM').AsFloat);
//  lbValorTotal2.Caption := 'R$ ' + FormatFloat('0.00', obCRM.obDevReq.vValorTotal);
//  lbQuantTotal2.Caption := FloatToStr(obCRM.obDevReq.vQuantTotal);
//  lbQtdDevTotal.Caption := FloatToStr(obCRM.obDevReq.vQuantTotalDev);
//  lbValorDevTotal.Caption := 'R$ ' + FormatFloat('0.00', obCRM.obDevReq.vValorTotalDev);
end;

procedure TfrmCrm40.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  obCRM.obDev.vValorTotal := 0;
  obCRM.obDev.vQuantTotal := 0;
end;

procedure TfrmCrm40.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Devolução de Produtos');
end;

procedure TfrmCrm40.QuickRep2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
//  obCRM.obDevReq.vValorTotal := 0;
//  obCRM.obDevReq.vQuantTotal := 0;
//  obCRM.obDevReq.vValorTotalDev := 0;
end;

procedure TfrmCrm40.QuickRep2Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Devolução de Produtos na forma de venda condicional.');
end;

procedure TfrmCrm40.SpeedButton10Click(Sender: TObject);
begin
  inherited;
    vDadosIni.montarExcel2(vexcel,DBGrid5, 'Finanças - Créditos','A','Finanças',false);
    vDadosIni.montarExcel2(vexcel,DBGrid6, 'Finanças - Cheques','A','',true);
    vDadosIni.montarExcel2(vexcel,DBGrid7, 'Finanças - Recibos','F','',true);
end;

procedure TfrmCrm40.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel2(vexcel, GridVendasPedidas, 'Vendas perdidas para o cliente','','Vendas perdidas');
end;

procedure TfrmCrm40.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if obCRM.obFichaAcomp = nil then
    obCRM.obFichaAcomp:= TFichaAcompanhamento.create;
//  if obCRM.obFichaAcomp.Active then
//  begin
    obCRM.obFichaAcomp._abreFichaAcompanhamento(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString);
    PageFinancas.ActivePage := tsFichaAcompanhamento;
//  end;
end;

procedure TfrmCrm40.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel2(vexcel,GridDevolucao2, 'Devoluções em vendas realizadas de forma condicional','','Devoluções - Venda condicional');
end;

procedure TfrmCrm40.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel2(vexcel,GridDevolucao1, 'Devoluções do Cliente','','Devoluções do Cliente');
end;

procedure TfrmCrm40.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel2(vexcel,DBGrid4, 'Tabela Diferenciada de Preços e Promoções para o cliente','','Produtos sugeridos');
end;

procedure TfrmCrm40.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel2(vExcel, DBGrid8, 'Ficha de acompanhamento','','Ficha de acompanhamento',false,DBGrid9);
end;

procedure TfrmCrm40.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel2(vExcel, DBGrid13, 'Orçamentos do cliente','','Orçamentos do cliente',false,DBGrid12);
end;

procedure TfrmCrm40.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if obCRM.obSugeServCli.dataSet.IsEmpty then
    	exit;

		if (vDadosIni.vEmp.vUsarAparelho = 'S') then
      vDadosIni.vPesquisa := 'SUG_SERV_VISUALIZAR|' +
      	IntToStr(obCRM.obSugeServCli.DataSet.FieldByName('COD_CLIENTE').AsInteger) + '|' +
        FormatDateTime('dd/mm/yyyy', obCRM.obSugeServCli.DataSet.FieldByName('DATA').AsDateTime) + '|' +
        IntToStr(obCRM.obSugeServCli.DataSet.FieldByName('COD_EQUIP').AsInteger) + '|'
    else
    	vDadosIni.vPesquisa := 'SUG_SERV_VISUALIZAR|' +
      	IntToStr(obCRM.obSugeServCli.DataSet.FieldByName('COD_CLIENTE').AsInteger) + '|' +
        FormatDateTime('dd/mm/yyyy', obCRM.obSugeServCli.DataSet.FieldByName('DATA').AsDateTime) + '|' +
        IntToStr(obCRM.obSugeServCli.DataSet.FieldByName('COD_VEIC').AsInteger) + '|' +
        obCRM.obSugeServCli.DataSet.FieldByName('PLACA').AsString + '|' +
        obCRM.obSugeServCli.DataSet.FieldByName('CHASSI').AsString + '|';
    vDadosIni.vNomeForm := 'frmSugestaoServico';
    vDadosIni.abreFormCadastro('pkCadastrosBasicos', 'TfrmSugestaoServico', True, 'Formulário de Sugestão de Serviço já aberto. Feche que tente novamente');
  finally
    vDadosIni.vPesquisa := '';
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCrm40.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if obCRM._validarData(MaskEdit1.Text,MaskEdit2.Text) then
  begin
    obCRM.obFinancaCred._abreCreditos(DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString);
    obCRM.obFinancaCh._abreCH(DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString);
    obCRM.obFinancaRec._abreRecibos(DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString);
  end;
//    obCRM.obFichaAcomp._abreFichaAcompanhamento(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString);
end;

procedure TfrmCrm40.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obCRM.obVp = nil then
    obCRM.obVp:= TVendasPerdidas.create;
  obCRM.obVp._abrirVendasPerdidas(DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsInteger,MaskEdit1.Text,MaskEdit2.Text);
end;

procedure TfrmCrm40.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  try
    if DBGrid1.DataSource.DataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum cliente foi selecionado.','Informação', MB_OK+MB_ICONINFORMATION);
      exit;
    end;
    vDadosIni.abreStatusProcessamento('','Abrindo devoluções do cliente.');
    GroupBox3.Caption:= 'Devoluções do Cliente: '+trim(DBGrid1.DataSource.DataSet.FieldByName('NOME_CLIENTE').AsString)+' - '+DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsString;
    GroupBox4.Caption:= 'Devoluções em vendas realizadas de forma condicional para o cliente: '+trim(DBGrid1.DataSource.DataSet.FieldByName('NOME_CLIENTE').AsString)+' - '+DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsString;
    if obCRM.obDev = nil then
      obCRM.obDev:= TDev.create;
//    obCRM.obDev.FiltrarData:=obCRM.FiltrarData;
    if not obCRM.obDev._abreDev(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').asinteger) then
      exit;
    if obCRM.obDevReq = nil then
      obCRM.obDevReq:= TDevReq.create;
//    obCRM.obDevReq.FiltrarData:=obCRM.FiltrarData;
    obCRM.obDevReq._abreDevReq(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').asinteger);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCrm40.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  obCRM.obCliCurvaABC._montarRankingCliente(CBQtdCompra.Text,CBSomaCompra.Text,CBCliAssiduos.Text,
    CBAtrasoCompra.Text,CBLucroCliente.Text,Edit1.Text,
    CKBPeca.Checked,CKBVeiculo.Checked,CKBServico.Checked,RadioGroup1.ItemIndex=0,
    CheckPF.Checked,CheckPJ.Checked);
end;

procedure TfrmCrm40.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  try
    obCRM.datainicial := StrToDate(MaskEdit1.Text);
    obCRM.datafinal := StrToDate(MaskEdit2.Text);
  except
    Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
  
  if obCRM._validarData(MaskEdit1.Text,MaskEdit2.Text) then
    obCRM.obSugeServCli._abreSugestaoServicosCli(MaskEdit1.Text, MaskEdit2.Text, DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsInteger);

  exit;
  
  if CheckBox3.Checked then
    GridSugServCliente.DataSource:= obCRM.obSugeServ.dsSugeServVeic;
  try
    obCRM.datainicial := StrToDate(MaskEdit1.Text);
    obCRM.datafinal := StrToDate(MaskEdit2.Text);
  except
    Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
  obCRM.obSugeServ._sugerirServico(CBQtdCompra.Text,CBSomaCompra.Text,CBCliAssiduos.Text,
    CBAtrasoCompra.Text,CBLucroCliente.Text,Edit1.Text,
    CKBPeca.Checked,CKBVeiculo.Checked,CKBServico.Checked,RadioGroup1.ItemIndex=0,
    CheckPF.Checked,CheckPJ.Checked,CheckBox3.Checked,obCRM.obSugeServ.Nec_acomp);
  cbCLQTDCOMPRA1Exit(sender);
end;

procedure TfrmCrm40.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if obCRM._validarData(MaskEdit1.Text,MaskEdit2.Text) then
    obCRM.obOrcamentoCli._abreOrcamentosCli(DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsInteger);
end;

procedure TfrmCrm40.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if CheckBox3.Checked then
    vDadosIni.montarExcel2(vExcel, GridSugServCliente, 'Sugestão de serviços por Veículo','','Sugestão de serviços por Veículo')
  else
    vDadosIni.montarExcel2(vExcel, GridSugServCliente, 'Sugestão de serviços por clientes','','Sugestão de serviços por clientes');
end;

procedure TfrmCrm40.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel2(vExcel, GridRankingClientes, 'Ranking de Clientes','','Ranking de Clientes');
end;

procedure TfrmCrm40.tsOrcamentoShow(Sender: TObject);
begin
  inherited;
  if obCRM.obOrcamentoCli = nil then
    obCRM.obOrcamentoCli:= TOrcamentosCli.create;
  if not obCRM.obOrcamentoCli.Active then
    if obCRM._validarData(MaskEdit1.Text,MaskEdit2.Text) then
      obCRM.obOrcamentoCli._abreOrcamentosCli(DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsInteger);
end;

procedure TfrmCrm40.tsSugServClientesShow(Sender: TObject);
begin
  inherited;
  if obCRM.obSugeServCli = nil then
    obCRM.obSugeServCli := TSugestaoServicosCli.create;
  if not obCRM.obSugeServCli.Active then
    if obCRM._validarData(MaskEdit1.Text,MaskEdit2.Text) then
      obCRM.obSugeServCli._abreSugestaoServicosCli(MaskEdit1.Text,MaskEdit2.Text, DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsInteger);
end;

procedure TfrmCrm40.tsConsumoShow(Sender: TObject);
begin
  inherited;
  if obCRM.obCliCurvaABC = nil then
    obCRM.obCliCurvaABC:= TCurvaABCCliente.create;
  if not obCRM.obCliCurvaABC.Active then
  begin
    obCRM.obCliCurvaABC._abrirClientesCurvaABC(DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsInteger);
  end;
  if obCRM.obFichaAcomp = nil then
    obCRM.obFichaAcomp:= TFichaAcompanhamento.create;
  if not obCRM.obFichaAcomp.Active then
  begin
    obCRM.obFichaAcomp._abreFichaAcompanhamento(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString,true);
    PageFinancas.ActivePage := tsFichaAcompanhamento;
  end;
  CheckBox4.Checked:= obCRM.TodasEmpresas;
end;

procedure TfrmCrm40.tsDevolucaoExit(Sender: TObject);
begin
  inherited;
  obCRM.obDev.Free;
  obCRM.obDev :=nil;
  obCRM.obDevReq.Free;
  obCRM.obDevReq :=nil;
  GroupBox3.Caption:= 'Devoluções do Cliente: ';
  GroupBox4.Caption:= 'Devoluções em vendas realizadas de forma condicional para o cliente: ';
end;

procedure TfrmCrm40.tsDevolucaoShow(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('','Abrindo devoluções do cliente.');
    GroupBox3.Caption:= 'Devoluções do Cliente: '+trim(DBGrid1.DataSource.DataSet.FieldByName('NOME_CLIENTE').AsString)+' - '+DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsString;
    GroupBox4.Caption:= 'Devoluções em vendas realizadas de forma condicional para o cliente: '+trim(DBGrid1.DataSource.DataSet.FieldByName('NOME_CLIENTE').AsString)+' - '+DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsString;
    if obCRM.obDev = nil then
      obCRM.obDev:= TDev.create;
    if not obCRM.obDev._abreDev(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').asinteger) then
      exit;
    if obCRM.obDevReq = nil then
      obCRM.obDevReq:= TDevReq.create;
    obCRM.obDevReq._abreDevReq(MaskEdit1.Text,MaskEdit2.Text,DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').asinteger);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCrm40.tsEquipVeicShow(Sender: TObject);
begin
  inherited;
  if obCRM.obSugeServ = nil then
    obCRM.obSugeServ:= TSugestaoServicos.create;
//  if not obCRM.obSugeServ.Active then
//  begin
//    obCRM.obSugeServ._abrirSugestaoServ(true);
//  end;
//  if vDadosIni.vEmp.vUsarAparelho = 'S' then
//  begin
//    GridSugServCliente.DataSource:= obCRM.obSugeServ.dsSugeServ;
//    CheckBox3.Visible:=false;
////    tsEquipVeic.Caption:= 'Equipamentos';
////    tsSugServVeiculos.TabVisible := false;
//  end
//  else begin
//    GridSugServCliente.DataSource:= obCRM.obSugeServ.dsSugeServ;
//    CheckBox3.Visible:=true;
////    tsEquipVeic.Caption:= 'Veículos';
////    tsSugServVeiculos.TabVisible := true;
//  end;
end;

procedure TfrmCrm40.tsFinancasShow(Sender: TObject);
begin
  inherited;
  PageFinancas.ActivePageIndex:=0;
  if obCRM.obFinancaCred = nil then
    obCRM.obFinancaCred:= TFinancaCred.create;
  if obCRM.obFinancaCh = nil then
    obCRM.obFinancaCh:= TFinancaCh.create;
  if obCRM.obFinancaRec = nil then
    obCRM.obFinancaRec:= TFinancaRec.create;
  CheckBox2.Checked:= obCRM.TodasEmpresas;
  obCRM.obFinancaCred._abreCreditos(DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString);
  obCRM.obFinancaCh._abreCH(DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString);
  obCRM.obFinancaRec._abreRecibos(DBGrid1.DataSource.DataSet.FieldByName('CPFCGC').AsString);
end;

procedure TfrmCrm40.tsVendasPerdidasShow(Sender: TObject);
begin
  inherited;
  if obCRM.obVp = nil then
    obCRM.obVp:= TVendasPerdidas.create;
  obCRM.obVp._abrirVendasPerdidas(DBGrid1.DataSource.DataSet.FieldByName('COD_CLIENTE').AsInteger,MaskEdit1.Text,MaskEdit2.Text);
end;

end.
