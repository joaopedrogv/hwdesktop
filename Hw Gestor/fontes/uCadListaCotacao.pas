unit uCadListaCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DB, DBCtrls, QRCtrls, QuickRpt;

type
  TfrmCadListaCotacao = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    tsCadastroItens: TTabSheet;
    GroupBox5: TGroupBox;
    Panel5: TPanel;
    GroupBox8: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn19: TBitBtn;
    Panel4: TPanel;
    BitBtn8: TBitBtn;
    Panel6: TPanel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    SpeedButton13: TSpeedButton;
    Label18: TLabel;
    Label37: TLabel;
    DBEdit53: TDBEdit;
    Label25: TLabel;
    DBEdit17: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    SpeedButton9: TSpeedButton;
    tsSelecionaGradeProd: TTabSheet;
    ScrollBox4: TScrollBox;
    pnSelecionaGradeProd: TPanel;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn11: TBitBtn;
    dsSelecionaGradeProd: TDataSource;
    PopupMenu3: TPopupMenu;
    SalvardadosnoExcel2: TMenuItem;
    tsRelatorio: TTabSheet;
    qrpLista: TQuickRep;
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
    QRDBText1: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    GroupBox9: TGroupBox;
    Label10: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Edit2: TEdit;
    Panel7: TPanel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    Label14: TLabel;
    Panel8: TPanel;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    tsImprimirRel: TTabSheet;
    pnImpressao: TPanel;
    GroupBox14: TGroupBox;
    RadioButtonGrafico: TRadioButton;
    RadioButtonMatricial: TRadioButton;
    Panel67: TPanel;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn56Click(Sender: TObject);
    procedure BitBtn55Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure qrpListaPreview(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure QRLabel1Print(sender: TObject; var Value: string);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure BitBtn8Click(Sender: TObject);
    procedure SalvardadosnoExcel2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure HabilitarDesabilitarItensListaCotacao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadListaCotacao: TfrmCadListaCotacao;

implementation

uses
  UdtmGestorHw, UClassesGestor, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TfrmCadListaCotacao.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LISTA_COTACAO', 'E', ListaCotacao.buscas) then
    Exit;
  try
   if ListaCotacao.vListaCotacaoItens.dataSet.IsEmpty then
    exit;

    ListaCotacao.vListaCotacaoItens.Delete;

    HabilitarDesabilitarItensListaCotacao;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ListaCotacao.vListaCotacaoItens.Cancel;
      ListaCotacao.vListaCotacaoItens.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadListaCotacao.BitBtn11Click(Sender: TObject);
begin
  inherited;
 TForm(pnSelecionaGradeProd.Parent).ModalResult := IDOK;
end;

procedure TfrmCadListaCotacao.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if not ListaCotacao.vListaCotacaoItens.post then
  begin
    PageControl3.ActivePage := tsCadastroItens;
    setFocusCampoErro(ListaCotacao.vListaCotacaoItens.vNomeCampoErro, ListaCotacao.vListaCotacaoItens.vMensagemErro);
  end
  else
  begin
   HabilitarDesabilitarItensListaCotacao;
   if (Self.Enabled) and (Self.Visible) and (BitBtn7.CanFocus) then
     BitBtn7.SetFocus;
  end;
end;

procedure TfrmCadListaCotacao.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if not (ListaCotacao.vListaCotacaoItens.dataSet.State in [dsEdit, dsInsert]) then
    exit;

  ListaCotacao.vListaCotacaoItens.Cancel;

  HabilitarDesabilitarItensListaCotacao;

   if (Self.Enabled) and (Self.Visible) and (BitBtn7.CanFocus) then
     BitBtn7.SetFocus;
end;

procedure TfrmCadListaCotacao.BitBtn1Click(Sender: TObject);
var
  i: integer;
begin
  if not vDadosIni.PesqPros('GES052', 'CONSULTA', '', 'LISTA_COTACAO', '',
    ListaCotacao.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not ListaCotacao.ConsultaCampos('LISTA_COTACAO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not ListaCotacao.ConsultaCampos('LISTA_COTACAO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton2.Hint := 'Enviar para Lixeira -  [GES055]';
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;

  if ListaCotacao.dataSet.Active then
    for I := 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns[i].FieldName = 'OBS' then
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
end;

procedure TfrmCadListaCotacao.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('LISTA_COTACAO', 'I', ListaCotacao.buscas) then
    Exit;
  try
    if not ListaCotacao.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      ListaCotacao.Cancel;
      ListaCotacao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadListaCotacao.BitBtn4Click(Sender: TObject);
begin
 if not ListaCotacao.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(ListaCotacao.vNomeCampoErro, ListaCotacao.vMensagemErro);
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
      if ListaCotacao.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadListaCotacao.BitBtn55Click(Sender: TObject);
begin
  inherited;
  try
    if RadioButtonMatricial.Checked then
	  	Screen.Cursor := crHourGlass;
    ListaCotacao.vListaCotacaoItens.abreItListaCotacao(ListaCotacao.dataSet.FieldByName('COD_LISTA').asinteger);

    QRLabel9.Caption := vDadosIni.IfThen(vDadosIni.vSugCompra.vMultiempresa, 'Emp', '');

    QRDBText6.DataField := vDadosIni.IfThen(vDadosIni.vSugCompra.vMultiempresa, 'COD_EMP_MULT', '');

    if RadioButtonGrafico.Checked then
      qrpLista.Preview
    else
      ListaCotacao.imprimirLista
  finally
  	if RadioButtonGrafico.Checked then
	    _GravaConfiguracoesString('RadioButtonGraficoMatricialListaCotacao', 'G')
    else
    	_GravaConfiguracoesString('RadioButtonGraficoMatricialListaCotacao', 'M');
    TForm(pnImpressao.Parent).ModalResult := IDOK;
    if RadioButtonMatricial.Checked then
	    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadListaCotacao.BitBtn56Click(Sender: TObject);
begin
  inherited;
	TForm(pnImpressao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadListaCotacao.BitBtn5Click(Sender: TObject);
begin
 inherited;
 ListaCotacao.Cancel;
 ListaCotacao.RollBackTransacao;
end;

procedure TfrmCadListaCotacao.BitBtn7Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('LISTA_COTACAO', 'I', ListaCotacao.buscas) then
    Exit;
  if ListaCotacao.dataSet.IsEmpty then
    exit;

  if not ListaCotacao.vListaCotacaoItens.Insert then
    exit;
  HabilitarDesabilitarItensListaCotacao;

  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
  	DBEdit6.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    DBEdit3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TfrmCadListaCotacao.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if ListaCotacao.vListaCotacaoItens.dataSet.State in [dsEdit, dsInsert] then
    ListaCotacao.vListaCotacaoItens.Cancel;

  TabSheet2.Show;
  PageControl3.ActivePage := TabSheet2;
end;

procedure TfrmCadListaCotacao.BitBtn9Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('LISTA_COTACAO', 'A', ListaCotacao.buscas) then
    Exit;
 if ListaCotacao.vListaCotacaoItens.dataSet.IsEmpty then
    exit;

  if not ListaCotacao.vListaCotacaoItens.Edit then
    exit;

  HabilitarDesabilitarItensListaCotacao;
    
  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
  	DBEdit6.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    DBEdit3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TfrmCadListaCotacao.DBEdit3Exit(Sender: TObject);
begin
  if not (ListaCotacao.vListaCotacaoItens.dataSet.State in [dsInsert, dsEdit]) then
    exit;
  
  if trim(TDBEdit(Sender).Field.AsString) <> '' then
    ListaCotacao.vListaCotacaoItens.buscarProduto(TDBEdit(Sender).Field.AsString, 0, '', true);
end;

procedure TfrmCadListaCotacao.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if Key = VK_F3 then
   begin
     vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
     if trim(vDadosIni.vPesquisa) <> '' then
     begin
      ListaCotacao.vListaCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.vPesquisa;
      ListaCotacao.vListaCotacaoItens.dataSet.FieldByName('GRUPO_PROD').AsString := vDadosIni.vPesquisaGrupo_prod;
      ListaCotacao.vListaCotacaoItens.dataSet.FieldByName('COD_PROD').AsString := vDadosIni.vPesquisaCod_prod;
     end;
   end;
end;

procedure TfrmCadListaCotacao.DBEdit6Exit(Sender: TObject);
begin
	if not (ListaCotacao.vListaCotacaoItens.dataSet.State in [dsInsert, dsEdit]) then
    exit;

  if not ListaCotacao.vListaCotacaoItens.empresaExiste(ListaCotacao.vListaCotacaoItens.dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
  begin
    Application.MessageBox(pchar('Código da empresa não encontrada'), 'Erro', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
    	DBEdit6.SetFocus;
    exit;
  end;
end;

procedure TfrmCadListaCotacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
    BitBtn3Click(Sender);
end;

procedure TfrmCadListaCotacao.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
 BitBtn11Click(Sender) ;
end;

procedure TfrmCadListaCotacao.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = VK_RETURN then
    BitBtn11Click(Sender)
  else if key = VK_TAB then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn11.CanFocus) then
    	BitBtn11.SetFocus;
end;

procedure TfrmCadListaCotacao.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Edit1.Text <> '') or (Edit2.Text <> '') then
  begin
    if gdSelected in State then
    begin
       TDBGrid(sender).canvas.brush.color := clGradientActiveCaption;
       TDBGrid(sender).canvas.Font.color := clBlack;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TfrmCadListaCotacao.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
vDadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TfrmCadListaCotacao.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
  exit;
  vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
end;

procedure TfrmCadListaCotacao.Edit1Change(Sender: TObject);
begin
  inherited;
  if (ActiveControl = Edit1) then
    ListaCotacao.vListaCotacaoItens.dataSet.Locate('NUM_FAB_PROD', VarArrayOf([trim(Edit1.Text)]), [loPartialKey ,loCaseInsensitive])
  else if (ActiveControl = Edit2) then
    ListaCotacao.vListaCotacaoItens.dataSet.Locate('DESCR_PROD', VarArrayOf([(Edit2.Text)]), [loPartialKey, loCaseInsensitive]);       
end;

procedure TfrmCadListaCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
if (ListaCotacao <> nil) then
    ListaCotacao.Cancel;

  ListaCotacao.free;
  ListaCotacao := nil;

  Action := caFree;
  if (frmCadListaCotacao <> nil) then
    frmCadListaCotacao := nil;
end;

procedure TfrmCadListaCotacao.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ListaCotacao := TListaCotacao.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  tsCadastroItens.TabVisible := False;
  tsSelecionaGradeProd.TabVisible := False;
  tsRelatorio.TabVisible := False;
  tsImprimirRel.TabVisible := False;
  
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadListaCotacao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if Key = VK_CONTROL then
    vDadosIni.vCtrlClick := False;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TfrmCadListaCotacao.FormShow(Sender: TObject);
begin
if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmGestorHw.dsListaCotacao;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [GES055]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not ListaCotacao._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadListaCotacao.HabilitarDesabilitarItensListaCotacao;
begin
 	 DBEdit6.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State = dsInsert;
   DBEdit3.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State = dsInsert;
//   DBEdit53.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State = dsInsert;
   DBEdit4.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State in [dsInsert, dsedit];
//   DBEdit17.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State in [dsInsert, dsedit];
   SpeedButton13.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State in [dsInsert, dsedit];

   BitBtn7.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State = dsBrowse;
   BitBtn9.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State = dsBrowse;
   BitBtn17.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State in [dsInsert, dsedit];
   BitBtn19.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State in [dsInsert, dsedit];
   BitBtn10.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State = dsBrowse;
   Edit1.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State = dsBrowse;
   Edit2.Enabled := ListaCotacao.vListaCotacaoItens.dataSet.State = dsBrowse;
end;

procedure TfrmCadListaCotacao.lbEmpresaPrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadListaCotacao.QRLabel1Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := ListaCotacao.dataSet.FieldByName('DESCRICAO_LISTA').AsString;
end;

procedure TfrmCadListaCotacao.qrpListaPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cotação');
end;

procedure TfrmCadListaCotacao.SalvardadosnoExcel2Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel(DBGrid3, ListaCotacao.dataSet.FieldByName('DESCRICAO_LISTA').AsString);
end;

procedure TfrmCadListaCotacao.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
  if trim(vDadosIni.vPesquisa) <> '' then
  begin
   ListaCotacao.vListaCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.vPesquisa;
   ListaCotacao.vListaCotacaoItens.dataSet.FieldByName('GRUPO_PROD').AsString := vDadosIni.vPesquisaGrupo_prod;
   ListaCotacao.vListaCotacaoItens.dataSet.FieldByName('COD_PROD').AsString := vDadosIni.vPesquisaCod_prod;
  end;
end;

procedure TfrmCadListaCotacao.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('LISTA_COTACAO', 'A', ListaCotacao.buscas) then
    Exit;
	try
    if ListaCotacao.dataSet.IsEmpty then
      Exit;
    if not ListaCotacao.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      ListaCotacao.Cancel;
      ListaCotacao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadListaCotacao.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('GES059', 'ABRIR A LIXEIRA', '', 'LISTA_COTACAO',
    '', ListaCotacao.buscas, true) then
    Exit;

  inherited;

  if not ListaCotacao._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [GES055]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [GES056]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadListaCotacao.SpeedButton2Click(Sender: TObject);
begin
 inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LISTA_COTACAO', 'E', ListaCotacao.buscas) then
    Exit;
  try
    ListaCotacao.Delete;
    lixeiraVazia(not ListaCotacao._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ListaCotacao.Cancel;
      ListaCotacao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadListaCotacao.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  if ListaCotacao.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('GES060', 'IMPRIMIR', '', 'LISTA_COTACAO',
    ListaCotacao.dataSet.FieldByName('COD_LISTA').AsString, ListaCotacao.buscas, true) then
    exit;

  if trim(_LerConfiguracoesRegistroString('RadioButtonGraficoMatricialListaCotacao')) = 'M' THEN
  	RadioButtonMatricial.Checked    := True
  else
	  RadioButtonGrafico.Checked      := True;
  if not vDadosIni.abreForm('Impressão', pnImpressao, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
    exit;
end;

procedure TfrmCadListaCotacao.SpeedButton5Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('LISTA_COTACAO', 'A', ListaCotacao.buscas) then
    Exit;
   if vDadosIni.PesqPros('GES057', '', '', 'LISTA_COTACAO', '', ListaCotacao.buscas, true) then
    if ListaCotacao._restauraLixeira then
     lixeiraVazia(not ListaCotacao._lixeiraCheia);
end;

procedure TfrmCadListaCotacao.SpeedButton9Click(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if ListaCotacao.dataSet.FieldByName('COD_LISTA').IsNull then
  	exit;

  if not vDadosIni.PesqPros('GES061', 'ACESSAR', '','LISTA_COTACAO_ITENS',
   ListaCotacao.dataSet.FieldByName('COD_LISTA').AsString, ListaCotacao.buscas, true) then
    exit;

  ListaCotacao.vListaCotacaoItens._cadListaCotacao(0);

  Panel8.Visible := vDadosIni.IfThen(vDadosIni.vSugCompra.vMultiempresa, True, False);
	DBGrid3.Visible := vDadosIni.IfThen(vDadosIni.vSugCompra.vMultiempresa, True, False);
  DBGrid4.Visible := vDadosIni.IfThen(vDadosIni.vSugCompra.vMultiempresa, False, True);

  DBGrid3.Align := vDadosIni.IfThen(vDadosIni.vSugCompra.vMultiempresa, alClient, alNone);
  DBGrid4.Align := vDadosIni.IfThen(vDadosIni.vSugCompra.vMultiempresa, alNone, alClient);

  Label14.Caption := IntToStr(ListaCotacao.dataSet.FieldByName('COD_LISTA').AsInteger) +
  	' - ' + Trim(ListaCotacao.dataSet.FieldByName('DESCRICAO_LISTA').AsString);
  tsCadastroItens.Show;
  PageControl3.ActivePage := tsCadastroItens;
  HabilitarDesabilitarItensListaCotacao;
  if (Self.Enabled) and (Self.Visible) and (BitBtn7.CanFocus) then
    BitBtn7.SetFocus;
end;

end.
