unit uGeradorOSFormasBoletas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uEditHw, DBCtrls, UClassesClientes;

type
  TfrmGeradorOSFormasBoletas = class(TfrmCadPadraoM)
    tsGeradorOS: TTabSheet;
    TabSheet6: TTabSheet;
    pnContratoHistorico: TPanel;
    GroupBox42: TGroupBox;
    DBGrid10: TDBGrid;
    Panel13: TPanel;
    BitBtn25: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn11: TBitBtn;
    SpeedButton55: TSpeedButton;
    TabSheet7: TTabSheet;
    pnProdutoQtdeReqMaiorEstoque: TPanel;
    GroupBox5: TGroupBox;
    DBGrid3: TDBGrid;
    Panel9: TPanel;
    btnProdutoQtdeReqMaiorEstoqueSim: TBitBtn;
    btnProdutoQtdeReqMaiorEstoqueNao: TBitBtn;
    btnProdutoQtdeReqMaiorEstoqueVoltar: TBitBtn;
    pnGeradorOS: TPanel;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    ProgressBar1: TProgressBar;
    Panel4: TPanel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Label211: TLabel;
    Label212: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel11: TPanel;
    RadioGroup1: TRadioGroup;
    GroupBoxFiltrar: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    EdNomeFantasiaGer: TEdit;
    EdRazaoSocialGer: TEdit;
    EdCodClienteGer: TEditHw;
    EdCpfCnpjGer: TEdit;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    ProgressBar2: TProgressBar;
    Panel7: TPanel;
    SpeedButton9: TSpeedButton;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    DBGrid2: TDBGrid;
    Panel8: TPanel;
    Label7: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    TabSheet8: TTabSheet;
    Memo1: TMemo;
    TabSheet9: TTabSheet;
    Memo2: TMemo;
    pnVindi: TPanel;
    Panel88: TPanel;
    pnPendente: TPanel;
    ckERP: TCheckBox;
    ckVindi: TCheckBox;
    PopupMenu3: TPopupMenu;
    SalvardadosnoExcel3: TMenuItem;
    Copiarparareadetransferncia3: TMenuItem;
    Somarvaloresdacoluna3: TMenuItem;
    Panel10: TPanel;
    pnDataBase: TPanel;
    LabelDataBase: TLabel;
    MaskEditDataBase: TMaskEdit;
    cbUtilizaCXL: TCheckBox;
    pnColaborador: TPanel;
    LabelColaborador: TLabel;
    EditHwColaborador: TEditHw;
    DBLookupComboBoxColaborador: TDBLookupComboBox;
    pnOperadorCXL: TPanel;
    LabelOperadorCXL: TLabel;
    EditHwOperadorCXL: TEditHw;
    DBLookupComboBoxOperadorCXL: TDBLookupComboBox;
    pnSubGrupoOS: TPanel;
    LabelSubGrupoOS: TLabel;
    DBLookupComboBoxSubGrupoOS: TDBLookupComboBox;
    EditHwSubGrupoOS: TEditHw;
    Panel17: TPanel;
    LabelStatusTMO: TLabel;
    DBLookupComboBoxStatusTMO: TDBLookupComboBox;
    Panel18: TPanel;
    LabelMesVencimento: TLabel;
    EditHwMesVencimento: TEditHw;
    cbGerarBoleto: TCheckBox;
    cbGerarBoletoProdServ: TCheckBox;
    Panel19: TPanel;
    LabelAnoVencimento: TLabel;
    EditHwAnoVencimento: TEditHw;
    cbAgruparContratos: TCheckBox;
    cbDesconsiderarRegraCtr: TCheckBox;
    Panel12: TPanel;
    LabelDiaFaturamento: TLabel;
    EditHwDiaFaturamentoIni: TEditHw;
    EditHwDiaFaturamentoFim: TEditHw;
    LabelDiaFaturamentoAte: TLabel;
    LabelDiaFaturamentoInf: TLabel;
    procedure EditHwSubGrupoOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwColaboradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwOperadorCXLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBoxOperadorCXLExit(Sender: TObject);
    procedure EditHwOperadorCXLExit(Sender: TObject);
    procedure Somarvaloresdacoluna3Click(Sender: TObject);
    procedure Copiarparareadetransferncia3Click(Sender: TObject);
    procedure SalvardadosnoExcel3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnProdutoQtdeReqMaiorEstoqueVoltarClick(Sender: TObject);
    procedure pnProdutoQtdeReqMaiorEstoqueEnter(Sender: TObject);
    procedure btnProdutoQtdeReqMaiorEstoqueNaoClick(Sender: TObject);
    procedure btnProdutoQtdeReqMaiorEstoqueSimClick(Sender: TObject);
    procedure EdCpfCnpjGerChange(Sender: TObject);
    procedure pnGeradorOSEnter(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure EdRazaoSocialGerChange(Sender: TObject);
    procedure EdNomeFantasiaGerChange(Sender: TObject);
    procedure EdCodClienteGerChange(Sender: TObject);
    procedure cbGerarBoletoClick(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid10TitleClick(Column: TColumn);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbAgruparContratosClick(Sender: TObject);
    procedure DBLookupComboBoxSubGrupoOSExit(Sender: TObject);
    procedure EditHwSubGrupoOSExit(Sender: TObject);
    procedure DBLookupComboBoxColaboradorExit(Sender: TObject);
    procedure EditHwColaboradorExit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEditDataBaseExit(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GerarOSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  	procedure habilitarDesabilitarCampos(pHabilitar: Boolean);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    { Private declarations }
  public
    { Public declarations }
    vDataBanco: TDateTime;
    vFechar: boolean;
  end;

var
  frmGeradorOSFormasBoletas: TfrmGeradorOSFormasBoletas;
  GeradorOS: TGeradorOS;

implementation

uses UDtmClientes, uDtmAtivo, uDataSet_OOP, uDadosIni, DB, StrUtils, Clipbrd;

{$R *.dfm}

procedure TfrmGeradorOSFormasBoletas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  gravaConfiguracoesFormRegistro;
  GeradorOS.fTempContratos.EmptyDataSet;
  if GeradorOS <> nil then
  begin
	  GeradorOS.Cancel;
  	  GeradorOS.RollBackTransacao;
  end;

  GeradorOS.Free;
  GeradorOS := nil;

  Action := caFree;
  if (frmGeradorOSFormasBoletas <> nil) then
    frmGeradorOSFormasBoletas := nil;
end;

procedure TfrmGeradorOSFormasBoletas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	inherited;
  
	if vFechar then
   exit;

  Canclose := Application.MessageBox('Deseja mesmo sair desta tela. Os dados serão perdidos.',
   'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES;
end;

procedure TfrmGeradorOSFormasBoletas.FormCreate(Sender: TObject);
begin
	vDataBanco := 0;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'GERADOROS' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    frmGeradorOSFormasBoletas := TfrmGeradorOSFormasBoletas(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  GeradorOS := TGeradorOS.create;
  tsGeradorOS.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := false;

  cbAgruparContratos.Hint := 'Agrupar Contrato em uma OS se as informações dos contratos de um mesmo cliente forem iguais:' +
  	' (DIA VENCIMENTO, DIAS APOS VENCIMENTO, VENDEDOR, CONTROLE, TIPO_OS, GERAR CONTRATO A CADA X MESES, GERAR NFS, GERAR NF, GERAR RECIBO LOCAÇÃO, GERAR BOLETO).';

  vDataBanco := vDadosIni.getDataBanco(GeradorOS.buscas);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmGeradorOSFormasBoletas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_F2) then
  	ckERP.Checked := not ckERP.Checked
  else if (Key = VK_F3) then
    ckVindi.Checked := not ckVindi.Checked;
end;

procedure TfrmGeradorOSFormasBoletas.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmClientes.dsGeradorOS;
    DBGrid2.DataSource := GeradorOS.fTempContratosDtSource;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  leConfiguracoesFormRegistro;

  GeradorOS.abreGeradorOS(-1);

//  PageControl2.Visible := false;
	PageControl2.Visible := true;
	pnGeradorOS.Width := 804;
  pnGeradorOS.Height := 598;

  btSelectAll.Enabled := false;
  btUnSelectAll.Enabled := false;

  SpeedButton9.Enabled := False;
  BitBtn9.Enabled := False;
  BitBtn10.Enabled := False;

  vFechar := true;

  if (vDadosIni.vTipoForm = 6) then
    SpeedButton6Click(SpeedButton6);

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "CLI214" PERMITIR GERAR CONTRATOS MAIS DE UMA VEZ POR MES' + #13 +
    'Processo "CLI272" LIBERAR FATURAMENTO CONTRATO PARA CLIENTE LIMITE ESTOURADO' + #13 +
    'Processo "CLI273" LIBERAR FATURAMENTO CONTRATO PARA CLIENTE FATURAMENTO BARRADO' + #13 +
    'Processo "CLI274" LIBERAR FATURAMENTO CONTRATO PARA CLIENTE COM DEBITO';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmGeradorOSFormasBoletas.GerarOSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    GeradorOS._marcaLinha(GeradorOS.fTempContratos)
  else if Key = VK_F3 then
    GeradorOS._desmarcaLinha(GeradorOS.fTempContratos);

  Label21.Caption := 'Contratos Selecionados: ' +
  	vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
    vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));
end;

procedure TfrmGeradorOSFormasBoletas.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(ckERP.Name, ckERP.Checked);
    _GravaConfiguracoesBoolean(ckVindi.Name, ckVindi.Checked);
  end;
end;

procedure TfrmGeradorOSFormasBoletas.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  if vDadosIni.vEmp.vModoFaturamento = 'S' then
  begin
    cbUtilizaCXL.Checked  := true;
    cbUtilizaCXL.Enabled  := false;
    pnOperadorCXL.Visible := true;
  end
  else
  begin
    cbUtilizaCXL.Enabled  := false;
    cbUtilizaCXL.Checked  := false;
    pnOperadorCXL.Visible := false;
  end;  
end;

procedure TfrmGeradorOSFormasBoletas.habilitarDesabilitarCampos(
  pHabilitar: Boolean);
begin
	GroupBoxFiltrar.Visible := False;

//	cbGerarBoleto.Enabled := pHabilitar;
//  cbGerarBoletoProdServ.Enabled := pHabilitar;
//  cbAgruparContratos.Enabled := pHabilitar;
//  cbDesconsiderarRegraCtr.Enabled := pHabilitar;
//  RadioGroup1.Enabled := pHabilitar;

  LabelDataBase.Enabled := pHabilitar;
  MaskEditDataBase.Enabled := pHabilitar;

//  LabelOperadorCXL.Enabled := pHabilitar;
//  EditHwOperadorCXL.Enabled := pHabilitar;
//  DBLookupComboBoxOperadorCXL.Enabled := pHabilitar;

//  LabelColaborador.Enabled := pHabilitar;
//  EditHwColaborador.Enabled := pHabilitar;
//  DBLookupComboBoxColaborador.Enabled := pHabilitar;

//  LabelSubGrupoOS.Enabled := pHabilitar;
//  EditHwSubGrupoOS.Enabled := pHabilitar;
//  DBLookupComboBoxSubGrupoOS.Enabled := pHabilitar;

//  LabelStatusTMO.Enabled := pHabilitar;
//  DBLookupComboBoxStatusTMO.Enabled := pHabilitar;

  LabelMesVencimento.Enabled := pHabilitar;
  EditHwMesVencimento.Enabled := pHabilitar;

  LabelAnoVencimento.Enabled := pHabilitar;
  EditHwAnoVencimento.Enabled := pHabilitar;

  LabelDiaFaturamento.Enabled := pHabilitar;
  EditHwDiaFaturamentoIni.Enabled := pHabilitar;
  LabelDiaFaturamentoAte.Enabled := pHabilitar;
  EditHwDiaFaturamentoFim.Enabled := pHabilitar;
  LabelDiaFaturamentoInf.Enabled := pHabilitar;
end;

procedure TfrmGeradorOSFormasBoletas.leConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    ckERP.Checked   := _LerConfiguracoesRegistroBoolean(ckERP.Name);
    ckVindi.Checked := _LerConfiguracoesRegistroBoolean(ckVindi.Name);
  end;
end;

procedure TfrmGeradorOSFormasBoletas.MaskEditDataBaseExit(Sender: TObject);
begin
	if (activecontrol = BitBtn8) then
  	exit;

  if vDadosIni.apenasNumeros(MaskEditDataBase.Text) <> '' then
  begin
    try
       StrToDate(MaskEditDataBase.Text);
     except
       on EConvertError do
       begin
         Application.MessageBox('Data base documento de venda inválida!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (MaskEditDataBase.CanFocus) then
           MaskEditDataBase.SetFocus;
         exit;
       end;
     end;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.SalvardadosnoExcel3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.montarExcel(DBGrid2, Self.Caption);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.Copiarparareadetransferncia3Click(Sender: TObject);
begin
  inherited;
	Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TfrmGeradorOSFormasBoletas.Somarvaloresdacoluna3Click(Sender: TObject);
begin
  inherited;
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid2, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TfrmGeradorOSFormasBoletas.pnGeradorOSEnter(Sender: TObject);
begin
  inherited;
	TForm(pnGeradorOS.Parent).OnKeyDown := GerarOSKeyDown;

  if (Self.Enabled) and (Self.Visible) and (MaskEditDataBase.CanFocus) then
    MaskEditDataBase.SetFocus;
end;

procedure TfrmGeradorOSFormasBoletas.pnProdutoQtdeReqMaiorEstoqueEnter(
  Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (btnProdutoQtdeReqMaiorEstoqueNao.CanFocus) then
  	btnProdutoQtdeReqMaiorEstoqueNao.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (btnProdutoQtdeReqMaiorEstoqueVoltar.CanFocus) then
  	btnProdutoQtdeReqMaiorEstoqueVoltar.SetFocus;
end;

procedure TfrmGeradorOSFormasBoletas.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI177', 'RELATORIO', '', 'CLIENTES_COM_CONTRATO ',
    '', GeradorOS.buscas, true) then
    Exit;

  GeradorOS._abreFormContratosRelatorio;
end;

procedure TfrmGeradorOSFormasBoletas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not GeradorOS.deleteContratos then
  	 exit;  
end;

procedure TfrmGeradorOSFormasBoletas.SpeedButton55Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('gerador_os_clientes%', GeradorOS.buscas);
end;

procedure TfrmGeradorOSFormasBoletas.SpeedButton6Click(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('CLI204', 'ABRIR', '', 'CLIENTES_COM_CONTRATO ', '', GeradorOS.buscas, true) then
    Exit;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;

  GeradorOS.abreFormGeradorOS;
end;

procedure TfrmGeradorOSFormasBoletas.SpeedButton7Click(Sender: TObject);
begin
  if GeradorOS.dataSet.IsEmpty then
    exit;

  GeradorOS._abreFormEnviarContratosClientes(0, GeradorOS.dataSet.FieldByName('COD_GERADOR').AsInteger);
end;

procedure TfrmGeradorOSFormasBoletas.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI178', 'VISUALIZAR', '', 'CLIENTES_COM_CONTRATO ',
    GeradorOS.dataSet.FieldByName('COD_GERADOR').AsString, GeradorOS.buscas, true) then
    Exit;
  GeradorOS._getDetalhesVendas(GeradorOS.dataSet.FieldByName('COD_GERADOR').AsInteger);
  GeradorOS._abreFormContratosHistorico;
end;

procedure TfrmGeradorOSFormasBoletas.SpeedButton9Click(Sender: TObject);
begin
	if GroupBoxFiltrar.Visible then
  	GroupBoxFiltrar.Visible := False
	else
  begin
  	GroupBoxFiltrar.Visible := True;

    if (Self.Enabled) and (Self.Visible) and (EdCodClienteGer.CanFocus) then
      EdCodClienteGer.SetFocus;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.BitBtn10Click(Sender: TObject);
begin
 try
   if not GeradorOS.fTempContratos.IsEmpty then
   begin
     if Application.MessageBox('Tem certeza que deseja cancelar Contratos gerados?',
       'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
         exit;
   end;

   habilitarDesabilitarCampos(True);

   btSelectAll.Enabled := False;
   btUnSelectAll.Enabled := False;

   SpeedButton9.Enabled := False;
   BitBtn9.Enabled := False;
   BitBtn10.Enabled := False;

   GeradorOS.fTempContratos.Filtered := False;
   GeradorOS.fTempContratos.EmptyDataSet;
   vFechar := true;
   ProgressBar1.Position := 0;
   ProgressBar2.Position := 0;

   Label17.Caption := '  0 / 0';
   Label6.Caption  := '  0 / 0';

   Label13.Caption := 'Valor dos contratos: 0,00 / 0,00';
 	 Label15.Caption := 'Valor das boletas: 0,00 / 0,00';
   Label21.Caption := 'Contratos Selecionados: ' +
   	 vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
     vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));

   Label2.Caption := '';
   Label3.Caption := '';

   GeradorOS.fTempContratos.EmptyDataSet;
   GeradorOS.Cancel;
   GeradorOS.RollBackTransacao;

   Label21.Caption := 'Contratos Selecionados: ' +
  	vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
    vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));
 finally
//   TForm(pnGeradorOS.Parent).Top := (Screen.DesktopHeight - TForm(pnGeradorOS.Parent).Height) DIV 2;
// 	 TForm(pnGeradorOS.Parent).Left := (Screen.DesktopWidth - TForm(pnGeradorOS.Parent).Width) DIV 2;
 end;
end;

procedure TfrmGeradorOSFormasBoletas.BitBtn11Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel(DBGrid10, 'Histórico de Contratos do Gerador');
end;

procedure TfrmGeradorOSFormasBoletas.btnProdutoQtdeReqMaiorEstoqueSimClick(Sender: TObject);
begin
	if vDadosIni.vEstoqueNegativo <> 'S' then
  begin
    if Application.MessageBox(PChar('Produtos com quantidade requisitada maior que o estoque, alguns faturamentos dos contratos não serão gerados.' + #13 + #13 +
      'Deseja continuar assim mesmo?'),
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
        exit;
  end;

  TForm(pnProdutoQtdeReqMaiorEstoque.Parent).ModalResult := IDOK;
end;

procedure TfrmGeradorOSFormasBoletas.btnProdutoQtdeReqMaiorEstoqueNaoClick(Sender: TObject);
begin
  TForm(pnProdutoQtdeReqMaiorEstoque.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmGeradorOSFormasBoletas.btnProdutoQtdeReqMaiorEstoqueVoltarClick(Sender: TObject);
begin
	if vDadosIni.vEstoqueNegativo <> 'S' then
  begin
    if Application.MessageBox(PChar('Produtos com quantidade requisitada maior que o estoque, alguns faturamentos dos contratos não serão gerados.' + #13 + #13 +
      'Deseja continuar assim mesmo?'),
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
        exit;
  end;
  
  TForm(pnProdutoQtdeReqMaiorEstoque.Parent).ModalResult := IDOK;
end;

procedure TfrmGeradorOSFormasBoletas.BitBtn1Click(Sender: TObject);
var
	vSQL: string;
begin
  try
    if not vDadosIni.PesqPros('CLI212', 'PESQUISAR', '', 'GERADOR_OSBOL', '', GeradorOS.buscas, true) then
    	exit;

    inherited;
    SpeedButton1.Visible := false;

    vSQL := '';

    if (ckERP.Checked <> ckVindi.Checked) then
    begin
    	if ckERP.Checked then
      	vSQL := ' COALESCE(GERADOR_OSBOL.VINDI, ''N'') = ''N'' '
      else if ckVindi.Checked then
      	vSQL := ' COALESCE(GERADOR_OSBOL.VINDI, ''N'') = ''S'' ';
    end;

    if MaskEdit2.Visible then
    begin
      if not GeradorOS.ConsultaCampos('GERADOR_OSBOL', ComboBox1.Text,
        'GERADOR_OSBOL.COD_GERADOR', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        ' GERADOR_OSBOL.*, ' +
        ' IIF(GERADOR_OSBOL.COD_OP_CXL <= 0, ''SEM OPERADOR CXL'', OPERADOR.NOME_VENDEDOR) NOME_OPERADOR, ' +
        ' COLABORADOR.NOME_VENDEDOR, SUB_GRUPO.DESCRICAO ',
        ' LEFT JOIN COLABORADOR OPERADOR ON OPERADOR.COD_VENDEDOR = GERADOR_OSBOL.COD_OP_CXL AND OPERADOR.COD_EMPRESA = GERADOR_OSBOL.COD_EMPRESA ' +
        ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = GERADOR_OSBOL.COD_VENDEDOR AND COLABORADOR.COD_EMPRESA = GERADOR_OSBOL.COD_EMPRESA ' +
        ' LEFT JOIN SUB_GRUPO ON SUB_GRUPO.CODIGO_SUBGR = GERADOR_OSBOL.COD_SUB_GRUPO', vSQL) THEN
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not GeradorOS.ConsultaCampos('GERADOR_OSBOL', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'GERADOR_OSBOL.COD_GERADOR', true, vDadosIni.codEmpresa,
      ' GERADOR_OSBOL.*, ' +
      ' IIF(GERADOR_OSBOL.COD_OP_CXL <= 0, ''SEM OPERADOR CXL'', OPERADOR.NOME_VENDEDOR) NOME_OPERADOR, ' +
      ' COLABORADOR.NOME_VENDEDOR, SUB_GRUPO.DESCRICAO',
      ' LEFT JOIN COLABORADOR OPERADOR ON OPERADOR.COD_VENDEDOR = GERADOR_OSBOL.COD_OP_CXL AND OPERADOR.COD_EMPRESA = GERADOR_OSBOL.COD_EMPRESA ' +
      ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = GERADOR_OSBOL.COD_VENDEDOR AND COLABORADOR.COD_EMPRESA = GERADOR_OSBOL.COD_EMPRESA ' +
      ' LEFT JOIN SUB_GRUPO ON SUB_GRUPO.CODIGO_SUBGR = GERADOR_OSBOL.COD_SUB_GRUPO', vSQL) THEN
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
          
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
  	gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.BitBtn24Click(Sender: TObject);
begin
  TForm(pnContratoHistorico.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmGeradorOSFormasBoletas.BitBtn25Click(Sender: TObject);
begin
  GeradorOS._detalhesFormaDePagamento;
end;

procedure TfrmGeradorOSFormasBoletas.BitBtn4Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    pnGeradorOS.Enabled := false;

    SpeedButton9.Enabled := false;
    BitBtn9.Enabled := false;
    BitBtn10.Enabled := false;

    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    btSelectAll.Enabled := false;
    btUnSelectAll.Enabled := false;

    if not GeradorOS.gravarContratos then
    begin
//    	habilitarDesabilitarCampos(True);
      setFocusCampoErro(GeradorOS.vNomeCampoErro, GeradorOS.vMensagemErro);
    end
    else
    begin
      habilitarDesabilitarCampos(True);

      btSelectAll.Enabled := False;
      btUnSelectAll.Enabled := False;

      SpeedButton9.Enabled := False;
      BitBtn9.Enabled := False;
      BitBtn10.Enabled := False;

      GeradorOS.fTempContratos.Filtered := False;
      GeradorOS.fTempContratos.EmptyDataSet;
      vFechar := true;
      ProgressBar1.Position := 0;
      ProgressBar2.Position := 0;
      Label7.Caption := '';
      Label11.Caption := '';

      Label17.Caption := '  0 / 0';
      Label6.Caption  := '  0 / 0';

      Label13.Caption := 'Valor dos contratos: 0,00 / 0,00';
      Label15.Caption := 'Valor das boletas: 0,00 / 0,00';
      Label21.Caption := 'Contratos Selecionados: ' +
  	 	 vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
	     vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));


      GeradorOS.fTempContratos.EmptyDataSet;
      GeradorOS.Cancel;
   		GeradorOS.RollBackTransacao;
    end;

    Label21.Caption := 'Contratos Selecionados: ' +
	  	vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
  	  vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));
  finally
//     TForm(pnGeradorOS.Parent).Top := (Screen.DesktopHeight - TForm(pnGeradorOS.Parent).Height) DIV 2;
// 	   TForm(pnGeradorOS.Parent).Left := (Screen.DesktopWidth - TForm(pnGeradorOS.Parent).Width) DIV 2;
     vDadosIni.fechaStatusProcessamento;
     Screen.Cursor := crDefault;
     pnGeradorOS.Enabled := true;

     SpeedButton9.Enabled := not GeradorOS.fTempContratos.IsEmpty;
     BitBtn9.Enabled := not GeradorOS.fTempContratos.IsEmpty;
     BitBtn10.Enabled := not GeradorOS.fTempContratos.IsEmpty;

     BitBtn7.Enabled := true;
     BitBtn8.Enabled := true;
     btSelectAll.Enabled := not GeradorOS.fTempContratos.IsEmpty;
     btUnSelectAll.Enabled := not GeradorOS.fTempContratos.IsEmpty;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.BitBtn7Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    GeradorOS.vDATA_BASE_VENDA := StrToDate(MaskEditDataBase.Text);
    GeradorOS.vCOD_OP_CXL := EditHwOperadorCXL.AsInteger;
    GeradorOS.vCOD_COLABORADOR := EditHwColaborador.AsInteger;
    GeradorOS.vSUB_GRUPO := vDadosIni.IfThen(EditHwSubGrupoOS.AsInteger >= 0, EditHwSubGrupoOS.AsInteger, -1);
    GeradorOS.vSTATUS_TMO := DBLookupComboBoxStatusTMO.Text;
    GeradorOS.vMES_VENCIMENTO := EditHwMesVencimento.AsInteger;
    GeradorOS.vANO_VENCIMENTO := EditHwAnoVencimento.AsInteger;
    GeradorOS.vUTILIZA_CXL := cbUtilizaCXL.Checked;
    GeradorOS.vGERAR_BOLETO := cbGerarBoleto.Checked;
    GeradorOS.vGERAR_BOLETO_PROD_SERV := cbGerarBoletoProdServ.Checked;
    GeradorOS.vAGRUPAR_CONTRATOS := cbAgruparContratos.Checked;
    GeradorOS.vDESCONSIDERAR_REGRA_CTRL := cbDesconsiderarRegraCtr.Checked;
    GeradorOS.vDIAS_FAT_INI := EditHwDiaFaturamentoIni.AsInteger;
    GeradorOS.vDIAS_FAT_FIM := EditHwDiaFaturamentoFim.AsInteger;
    if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
	   BitBtn1.SetFocus;
    pnGeradorOS.Enabled := false;
    BitBtn7.Enabled := False;
    BitBtn8.Enabled := False;
    btSelectAll.Enabled := False;
    btUnSelectAll.Enabled := False;

    SpeedButton9.Enabled := False;
    BitBtn9.Enabled := False;
    BitBtn10.Enabled := False;

    habilitarDesabilitarCampos(False);

    if not GeradorOS.gerarContratos(RadioGroup1.ItemIndex) then
    begin
    	habilitarDesabilitarCampos(True);

      SpeedButton9.Enabled := False;
      BitBtn9.Enabled := False;
      BitBtn10.Enabled := False;

      setFocusCampoErro(GeradorOS.vNomeCampoErro, GeradorOS.vMensagemErro);
    end
    else
    begin
    	SpeedButton9.Enabled := True;
    	BitBtn9.Enabled := True;
      BitBtn10.Enabled := True;
      
      vFechar := false;
    end;

    Label21.Caption := 'Contratos Selecionados: ' +
	  	vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
  	  vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));
  finally
//    TForm(pnGeradorOS.Parent).Top := (Screen.DesktopHeight - TForm(pnGeradorOS.Parent).Height) DIV 2;
//	  TForm(pnGeradorOS.Parent).Left := (Screen.DesktopWidth - TForm(pnGeradorOS.Parent).Width) DIV 2;
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
    pnGeradorOS.Enabled := true;
    BitBtn7.Enabled := true;
    BitBtn8.Enabled := true;
    btSelectAll.Enabled := true;
    btUnSelectAll.Enabled := true;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.BitBtn8Click(Sender: TObject);
begin
	habilitarDesabilitarCampos(True);

  GeradorOS.fTempContratos.Filtered := False;
  GeradorOS.fTempContratos.EmptyDataSet;
  vFechar := true;
  ProgressBar1.Position := 0;
  ProgressBar2.Position := 0;

  Label17.Caption := '  0 / 0';
  Label6.Caption  := '  0 / 0';

  Label13.Caption := 'Valor dos contratos: 0,00 / 0,00';
  Label15.Caption := 'Valor das boletas: 0,00 / 0,00';
  Label21.Caption := 'Contratos Selecionados: ' +
  	vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
    vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));

  Label2.Caption := '';
  Label3.Caption := '';

  GeradorOS.fTempContratos.EmptyDataSet;
  GeradorOS.Cancel;
  GeradorOS.RollBackTransacao;

  Label21.Caption := 'Contratos Selecionados: ' +
  	vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
    vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));

  GeradorOS.Refresh;

  TForm(pnGeradorOS.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmGeradorOSFormasBoletas.btSelectAllClick(Sender: TObject);
var
  vRecNo: Integer;
begin
  try
    Screen.Cursor := crHourGlass;

    SpeedButton9.Enabled := false;
    BitBtn9.Enabled := false;
    BitBtn10.Enabled := false;

    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    btSelectAll.Enabled := false;
    btUnSelectAll.Enabled := false;

    if not GeradorOS.fTempContratos.IsEmpty then
    	vRecNo := GeradorOS.fTempContratos.RecNo;

    GeradorOS._marcarTodos(GeradorOS.fTempContratos);

    Label21.Caption := 'Contratos Selecionados: ' +
	  	vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
  	  vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));

  finally
  	SpeedButton9.Enabled := not GeradorOS.fTempContratos.IsEmpty;
    BitBtn9.Enabled := not GeradorOS.fTempContratos.IsEmpty;
    BitBtn10.Enabled := not GeradorOS.fTempContratos.IsEmpty;

    BitBtn7.Enabled := true;
    BitBtn8.Enabled := true;
    btSelectAll.Enabled := true;
    btUnSelectAll.Enabled := true;

    if not GeradorOS.fTempContratos.IsEmpty then
    	GeradorOS.fTempContratos.RecNo := vRecNo;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.btUnSelectAllClick(Sender: TObject);
var
  vRecNo: Integer;
begin
  try
    Screen.Cursor := crHourGlass;

    SpeedButton9.Enabled := false;
    BitBtn9.Enabled := false;
    BitBtn10.Enabled := false;

    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    btSelectAll.Enabled := false;
    btUnSelectAll.Enabled := false;

    if not GeradorOS.fTempContratos.IsEmpty then
    	vRecNo := GeradorOS.fTempContratos.RecNo;
    
    GeradorOS._desmarcarTodos(GeradorOS.fTempContratos);

  	Label21.Caption := 'Contratos Selecionados: ' +
  	  vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
      vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));

  finally
  	SpeedButton9.Enabled := not GeradorOS.fTempContratos.IsEmpty;
    BitBtn9.Enabled := not GeradorOS.fTempContratos.IsEmpty;
    BitBtn10.Enabled := not GeradorOS.fTempContratos.IsEmpty;

    BitBtn7.Enabled := true;
    BitBtn8.Enabled := true;
    btSelectAll.Enabled := true;
    btUnSelectAll.Enabled := true;

    if not GeradorOS.fTempContratos.IsEmpty then
    	GeradorOS.fTempContratos.RecNo := vRecNo;
      
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.cbAgruparContratosClick(Sender: TObject);
begin
	if not cbAgruparContratos.Enabled then
    Exit;

  GeradorOS.fTempContratos.FieldByName('COD_CONTRATO').Visible := not cbAgruparContratos.Checked;
  GeradorOS.fTempContratos.FieldByName('DESCR_CONTRATO').Visible := not cbAgruparContratos.Checked;
end;

procedure TfrmGeradorOSFormasBoletas.cbGerarBoletoClick(Sender: TObject);
begin
  inherited;
  if cbGerarBoleto.Checked then
  	cbGerarBoletoProdServ.Enabled := True
  else
  begin
  	cbGerarBoletoProdServ.Checked := False;
    cbGerarBoletoProdServ.Enabled := False;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.DBGrid10TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid10, Column);
end;

procedure TfrmGeradorOSFormasBoletas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (Column.Field.Dataset.FieldbyName('STATUS_GERADOR').AsString <> 'CONCLUIDO')
    and (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnPendente.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;

  if (TDBGrid(sender).DataSource.DataSet.FieldByName('VINDI').AsString = 'S')
  	and (Column.FieldName = 'COD_GERADOR') then
  begin
  	TDBGrid(sender).canvas.brush.color := pnVindi.Color;
    TDBGrid(sender).canvas.Font.color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmGeradorOSFormasBoletas.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  begin
  	GeradorOS._marcaDesmarcaLinha(GeradorOS.fTempContratos);

    Label21.Caption := 'Contratos Selecionados: ' +
  		vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
	    vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));
  end;
end;

procedure TfrmGeradorOSFormasBoletas.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if TDBGrid(sender).DataSource.dataSet.FieldByName('Sel').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;

  if (GeradorOS.fTempContratos.FieldByName('CONTRATOS_CADA_MES').AsInteger > 0)
  	and (GeradorOS.fTempContratos.FieldByName('CONTRATOS_CADA_MES').AsInteger > GeradorOS.fTempContratos.FieldByName('QTDE_MES_ULT_GER').AsInteger) then
   if (gdFocused in State) then
   begin
     TDBGrid(sender).canvas.brush.color := clWindow;
     TDBGrid(sender).canvas.Font.color := clWindowText;
   end
   else
   begin
     TDBGrid(sender).canvas.brush.color := TColor($00C4C4FF);
     TDBGrid(sender).canvas.Font.color := clWindowText;
   end;

  if ((Column.FieldName = 'COD_CLIENTE') or (Column.FieldName = 'NOME_CLIENTE') or (Column.FieldName = 'RAZAO'))
  	and (trim(GeradorOS.fTempContratos.FieldByName('STATUS_F').AsString) = 'BARRADO') then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (Column.FieldName = 'DATA_VENC')
  	and (vDataBanco > 0)
    and (TDBGrid(sender).DataSource.DataSet.FieldByName('DATA_VENC').AsDateTime > 0)
  	and (vDataBanco > TDBGrid(sender).DataSource.DataSet.FieldByName('DATA_VENC').AsDateTime) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    DBGrid2.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid2.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmGeradorOSFormasBoletas.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((Shift = [ssCtrl]) and (key = VK_DELETE)) then
  	 Key := 0
  else if Key = VK_SPACE then
    GeradorOS._marcaDesmarcaLinha(GeradorOS.fTempContratos)
  else if Key = VK_F2 then
    GeradorOS._marcaLinha(GeradorOS.fTempContratos)
  else if Key = VK_F3 then
    GeradorOS._desmarcaLinha(GeradorOS.fTempContratos);

  Label21.Caption := 'Contratos Selecionados: ' +
  	vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.vContrSel)) + ' / ' +
    vDadosIni.IfThen(GeradorOS.fTempContratos.IsEmpty, '0', IntToStr(GeradorOS.fTempContratos.RecordCount));
end;

procedure TfrmGeradorOSFormasBoletas.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmGeradorOSFormasBoletas.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if ((Column.FieldName = 'ESTOQUE') or (Column.FieldName = 'QTDE'))
  	and ((TDBGrid(sender).DataSource.DataSet.FieldByName('GRUPO_PROD').AsInteger > 0)
      	or (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('COD_PROD').AsString) <> ''))
  	and (TDBGrid(sender).DataSource.DataSet.FieldByName('ESTOQUE').AsFloat <
    				TDBGrid(sender).DataSource.DataSet.FieldByName('QTDE').AsFloat) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmGeradorOSFormasBoletas.DBLookupComboBoxColaboradorExit(Sender: TObject);
begin
  EditHwColaborador.AsValue := DBLookupComboBoxColaborador.KeyValue;
end;

procedure TfrmGeradorOSFormasBoletas.DBLookupComboBoxOperadorCXLExit(
  Sender: TObject);
begin
  EditHwOperadorCXL.AsValue := DBLookupComboBoxOperadorCXL.KeyValue;
end;

procedure TfrmGeradorOSFormasBoletas.DBLookupComboBoxSubGrupoOSExit(Sender: TObject);
begin
  EditHwSubGrupoOS.AsValue := DBLookupComboBoxSubGrupoOS.KeyValue;
end;

procedure TfrmGeradorOSFormasBoletas.EdCodClienteGerChange(Sender: TObject);
begin
  if (not GeradorOS.fTempContratos.IsEmpty) and (EdCodClienteGer.AsInteger > 0) then
  begin
    GeradorOS.fTempContratos.IndexFieldNames := 'COD_CLIENTE';
    GeradorOS.fTempContratos.FindNearest([IntToStr(EdCodClienteGer.AsInteger)]);
  end
  else if (not GeradorOS.fTempContratos.IsEmpty) then
  begin
    if RadioGroup1.ItemIndex = 0 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'NOME_CLIENTE';
    	GeradorOS.fTempContratos.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'RAZAO';
    	GeradorOS.fTempContratos.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'COD_CLIENTE';
    	GeradorOS.fTempContratos.FindNearest([1])
    end;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.EdCpfCnpjGerChange(Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not GeradorOS.fTempContratos.IsEmpty) and (trim(EdCpfCnpjGer.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := GeradorOS.fTempContratos.RecNo;

      GeradorOS.fTempContratos.DisableControls;
    	GeradorOS.fTempContratos.First;
      while not GeradorOS.fTempContratos.Eof do
      begin
      	if ContainsText(
        	GeradorOS.fTempContratos.FieldByName('CPFCGC').AsString,
          trim(EdCpfCnpjGer.Text)) then
        begin
        	vRecNo  := GeradorOS.fTempContratos.RecNo;
          vEncReg := True;
          Break;
        end;

        GeradorOS.fTempContratos.Next;
      end;
    finally
      if not vEncReg then
        if not GeradorOS.fTempContratos.IsEmpty then
          GeradorOS.fTempContratos.RecNo := vRecNo;
      GeradorOS.fTempContratos.EnableControls;
    end;
  end
  else if (not GeradorOS.fTempContratos.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'NOME_CLIENTE';
    	GeradorOS.fTempContratos.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'RAZAO';
    	GeradorOS.fTempContratos.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'COD_CLIENTE';
    	GeradorOS.fTempContratos.FindNearest([1])
    end;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.EditHwColaboradorExit(Sender: TObject);
begin
  if ActiveControl = BitBtn2 then
    Exit;

  DBLookupComboBoxColaborador.KeyValue := EditHwColaborador.AsInteger;
end;

procedure TfrmGeradorOSFormasBoletas.EditHwColaboradorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vtemp: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vtemp := vDadosIni.pesquisaRapida('COLABORADOR');
      if trim(vtemp) <> '' then
      	EditHwColaborador.AsValue := StrToFloat(vtemp);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmGeradorOSFormasBoletas.EditHwOperadorCXLExit(Sender: TObject);
begin
  if ActiveControl = BitBtn2 then
    Exit;

  DBLookupComboBoxOperadorCXL.KeyValue := EditHwOperadorCXL.AsInteger;
end;

procedure TfrmGeradorOSFormasBoletas.EditHwOperadorCXLKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vtemp: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vtemp := vDadosIni.pesquisaRapida('COLABORADOR');
      if trim(vtemp) <> '' then
      	EditHwOperadorCXL.AsValue := StrToFloat(vtemp);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmGeradorOSFormasBoletas.EditHwSubGrupoOSExit(Sender: TObject);
begin
  if ActiveControl = BitBtn2 then
    Exit;

  DBLookupComboBoxSubGrupoOS.KeyValue := EditHwSubGrupoOS.AsInteger;
end;

procedure TfrmGeradorOSFormasBoletas.EditHwSubGrupoOSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	vtemp: string;
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vtemp := vDadosIni.pesquisaRapida('TIPO_VENDAS', ' and TIPO_VENDAS.TIPO = ''TMO'' ', 'Consulta de SubGrupo OS');
      if trim(vtemp) <> '' then
      	EditHwSubGrupoOS.AsValue := StrToFloat(vtemp);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmGeradorOSFormasBoletas.EdNomeFantasiaGerChange(Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not GeradorOS.fTempContratos.IsEmpty) and (trim(EdNomeFantasiaGer.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := GeradorOS.fTempContratos.RecNo;

      GeradorOS.fTempContratos.DisableControls;
    	GeradorOS.fTempContratos.First;
      while not GeradorOS.fTempContratos.Eof do
      begin
      	if ContainsText(
        	GeradorOS.fTempContratos.FieldByName('NOME_CLIENTE').AsString,
          trim(EdNomeFantasiaGer.Text)) then
        begin
        	vRecNo  := GeradorOS.fTempContratos.RecNo;
          vEncReg := True;
          Break;
        end;

        GeradorOS.fTempContratos.Next;
      end;
    finally
      if not vEncReg then
        if not GeradorOS.fTempContratos.IsEmpty then
          GeradorOS.fTempContratos.RecNo := vRecNo;
      GeradorOS.fTempContratos.EnableControls;
    end;
  end
  else if (not GeradorOS.fTempContratos.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'NOME_CLIENTE';
    	GeradorOS.fTempContratos.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'RAZAO';
    	GeradorOS.fTempContratos.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'COD_CLIENTE';
    	GeradorOS.fTempContratos.FindNearest([1])
    end;
  end;
end;

procedure TfrmGeradorOSFormasBoletas.EdRazaoSocialGerChange(Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not GeradorOS.fTempContratos.IsEmpty) and (trim(EdRazaoSocialGer.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := GeradorOS.fTempContratos.RecNo;

      GeradorOS.fTempContratos.DisableControls;
    	GeradorOS.fTempContratos.First;
      while not GeradorOS.fTempContratos.Eof do
      begin
      	if ContainsText(
        	GeradorOS.fTempContratos.FieldByName('RAZAO').AsString,
          trim(EdRazaoSocialGer.Text)) then
        begin
        	vRecNo  := GeradorOS.fTempContratos.RecNo;
          vEncReg := True;
          Break;
        end;

        GeradorOS.fTempContratos.Next;
      end;
    finally
      if not vEncReg then
        if not GeradorOS.fTempContratos.IsEmpty then
          GeradorOS.fTempContratos.RecNo := vRecNo;
      GeradorOS.fTempContratos.EnableControls;
    end;
  end
  else if (not GeradorOS.fTempContratos.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'NOME_CLIENTE';
    	GeradorOS.fTempContratos.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'RAZAO';
    	GeradorOS.fTempContratos.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      GeradorOS.fTempContratos.IndexFieldNames := 'COD_CLIENTE';
    	GeradorOS.fTempContratos.FindNearest([1])
    end;
  end;
end;

end.
