unit uCadPedidoCompraClienteNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesClientes, DBCtrls, uEditHw, DB;

type
	Tcl_cadCliente = function(ATipoForm: Integer): Boolean;
  
  TfrmCadPedidoCompraClienteNfe = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    GroupBox6: TGroupBox;
    PageControl2: TPageControl;
    tsProdutosCtrCons: TTabSheet;
    DBGridProdCtr: TDBGrid;
    Panel11: TPanel;
    BitBtnProdIncluir: TBitBtn;
    BitBtnProdAlterar: TBitBtn;
    BitBtnProdExcluir: TBitBtn;
    tsProdutosCtrCad: TTabSheet;
    pnCadProdutosCtr: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    tsSelecionaGradeProd: TTabSheet;
    ScrollBox5: TScrollBox;
    pnSelecionaGradeProd: TPanel;
    GroupBox7: TGroupBox;
    Panel19: TPanel;
    Label201: TLabel;
    Label202: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel20: TPanel;
    DBGrid3: TDBGrid;
    BitBtn11: TBitBtn;
    dsSelecionaGradeProd: TDataSource;
    Panel4: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label10: TLabel;
    Panel18: TPanel;
    BitBtnProdOK: TBitBtn;
    BitBtnProdCancel: TBitBtn;
    lbxNotasPedido: TListBox;
    lbNotasPedido: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure pnCadProdutosCtrEnter(Sender: TObject);
    procedure DBEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnProdCancelClick(Sender: TObject);
    procedure BitBtnProdOKClick(Sender: TObject);
    procedure BitBtnProdExcluirClick(Sender: TObject);
    procedure BitBtnProdAlterarClick(Sender: TObject);
    procedure BitBtnProdIncluirClick(Sender: TObject);
    procedure DBGridProdCtrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDownItens(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    PedidoContrato: NovoPedidoDados;
  public
    function NovoPedido(APedido: NovoPedidoDados): Boolean;
    function AlterarPedido(APedido: PedidoCompraDoContrato): Boolean;
  end;

var
  frmCadPedidoCompraClienteNfe: TfrmCadPedidoCompraClienteNfe;
  CadPedidoCompraCl: TCadPedidoCompraCl;

implementation

uses
  uDtmAtivo, UDtmClientes, funcoes, uDadosIni;

{$R *.dfm}

function TfrmCadPedidoCompraClienteNfe.NovoPedido(APedido: NovoPedidoDados): Boolean;
begin
  PedidoContrato := APedido;
  try
    PedidoContrato.IsActive := True;

    TabSheet2.TabVisible := False;
    TabSheet1.TabVisible := False;
    StatusBar1.Visible := False;
    Panel3.Visible := False;
    DBEdit10.Enabled := False;

    PageControl3.ActivePage := tsCadastro;
    PageControl2.ActivePage := tsProdutosCtrCad;
    PageControl1.ActivePage := TabSheet1;

    if CadPedidoCompraCl.dataSet.State in [dsInsert, dsEdit] then
      CadPedidoCompraCl.Cancel;
    if CadPedidoCompraCl.vProdPed.dataSet.State in [dsInsert, dsEdit] then
      CadPedidoCompraCl.vProdPed.Cancel;

    CadPedidoCompraCl.RollBackTransacao;

    Result := CadPedidoCompraCl.Insert();

    if not Result then
      Exit;

    CadPedidoCompraCl.dataSet.FieldByName('cod_cliente').AsInteger := APedido.CodCliente;
    CadPedidoCompraCl.dataSet.FieldByName('data_pedido').AsDateTime := APedido.DataPedido;

    CadPedidoCompraCl.vProdPed.Insert(APedido);

    CadPedidoCompraCl.abreClientes(CadPedidoCompraCl.dataSet.FieldByName('COD_CLIENTE').AsInteger);

    PanelLeft.Align := alNone;
    PanelLeft.Width := 856;
    PanelLeft.Height := ScrollBox4.Height + 20 ;

    Result := vDadosIni.abreForm('Pedido Compra Cliente NFe', PanelLeft, opFormsDefCad);

  finally
    if CadPedidoCompraCl.dataSet.State in [dsInsert, dsEdit] then
      CadPedidoCompraCl.Cancel;
    if CadPedidoCompraCl.vProdPed.dataSet.State in [dsInsert, dsEdit] then
      CadPedidoCompraCl.vProdPed.Cancel;

    CadPedidoCompraCl.RollBackTransacao;

    DBEdit10.Enabled := True;
    StatusBar1.Visible := True;
    Panel3.Visible := True;
    PanelLeft.Align := alClient;
    PageControl1.ActivePage := TabSheet2;
  end;
end;


function TfrmCadPedidoCompraClienteNfe.AlterarPedido(APedido: PedidoCompraDoContrato): Boolean;
begin
  try
    PedidoContrato.IsActive := True;

    TabSheet2.TabVisible := False;
    TabSheet1.TabVisible := False;
    StatusBar1.Visible := False;
    Panel3.Visible := False;
    DBEdit10.Enabled := False;

    PageControl3.ActivePage := tsCadastro;
    PageControl2.ActivePage := tsProdutosCtrCad;
    PageControl1.ActivePage := TabSheet1;

    if CadPedidoCompraCl.dataSet.State in [dsInsert, dsEdit] then
      CadPedidoCompraCl.Cancel;
    if CadPedidoCompraCl.vProdPed.dataSet.State in [dsInsert, dsEdit] then
      CadPedidoCompraCl.vProdPed.Cancel;

    CadPedidoCompraCl.RollBackTransacao;

    Result := CadPedidoCompraCl.abrePedidoCompraCl(APedido.Codigo);

    if not Result then
      Exit;

    CadPedidoCompraCl.Edit();
    CadPedidoCompraCl.vProdPed.IndexFieldNames := 'NITEM';
    CadPedidoCompraCl.vProdPed.FindNearest([APedido.NItem]);
    CadPedidoCompraCl.vProdPed.Edit(CadPedidoCompraCl);

    PanelLeft.Align := alNone;
    PanelLeft.Width := 856;
    PanelLeft.Height := ScrollBox4.Height + 20 ;

    Result := vDadosIni.abreForm('Pedido Compra Cliente NFe', PanelLeft, opFormsDefCad);

  finally
    if CadPedidoCompraCl.dataSet.State in [dsInsert, dsEdit] then
      CadPedidoCompraCl.Cancel;
    if CadPedidoCompraCl.vProdPed.dataSet.State in [dsInsert, dsEdit] then
      CadPedidoCompraCl.vProdPed.Cancel;

    CadPedidoCompraCl.RollBackTransacao;

    DBEdit10.Enabled := True;
    StatusBar1.Visible := True;
    Panel3.Visible := True;
    PanelLeft.Align := alClient;
    PageControl1.ActivePage := TabSheet2;
  end;
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtn11Click(Sender: TObject);
begin
  inherited;
  TForm(pnSelecionaGradeProd.Parent).ModalResult := IDOK;	
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtn1Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('BAS542', 'CONSULTA', '', 'PEDIDOCOMPRACL', '',
    CadPedidoCompraCl.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not CadPedidoCompraCl.ConsultaCampos('PEDIDOCOMPRACL', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not CadPedidoCompraCl.ConsultaCampos('PEDIDOCOMPRACL', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtn3Click(Sender: TObject);
begin
  try
    if not CadPedidoCompraCl.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    PageControl2.ActivePage := tsProdutosCtrCons;

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
      CadPedidoCompraCl.Cancel;
      CadPedidoCompraCl.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not CadPedidoCompraCl.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadPedidoCompraCl.vNomeCampoErro, CadPedidoCompraCl.vMensagemErro);
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
      if CadPedidoCompraCl.Insert then
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

procedure TfrmCadPedidoCompraClienteNfe.BitBtn5Click(Sender: TObject);
begin
  inherited;
	CadPedidoCompraCl.Cancel;
  CadPedidoCompraCl.RollBackTransacao;
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtnProdAlterarClick(Sender: TObject);
var
  notas: NotasPedidoCompraCliente;
  I: Integer;
begin
  inherited;
  if CadPedidoCompraCl.vProdPed.IsEmpty then
    exit;

  DBEdit10.Enabled           := False;
  DBEdit10.Color             := cl3DLight;

  if not CadPedidoCompraCl.vProdPed.Edit(CadPedidoCompraCl) then
    exit;

  notas := CadPedidoCompraCl.vProdPed.GetNotas();

  lbNotasPedido.Visible := True;
  lbxNotasPedido.Visible := True;
  lbxNotasPedido.Clear();
  for I := Low(notas) to High(notas) do
  begin
    lbxNotasPedido.Items.Add(Format('Cod/N°: %d/%d - Qtde: %0.3f',
      [notas[i].CodNF, notas[i].NumNF, notas[i].QtdeNF]));
  end;

  if not CadPedidoCompraCl._abreFormProd then
    CadPedidoCompraCl.vProdPed.Cancel;
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtnProdCancelClick(Sender: TObject);
begin
  inherited;

  if PedidoContrato.IsActive then
  begin
    CadPedidoCompraCl.Cancel;
    CadPedidoCompraCl.RollBackTransacao;
    PedidoContrato.IsActive := False;
    TForm(PanelLeft.Parent).ModalResult := mrCancel;
    Exit;
  end;

	if (Self.Enabled) and (Self.Visible) and (BitBtnProdCancel.CanFocus) then
  	BitBtnProdCancel.SetFocus;

	CadPedidoCompraCl.vProdPed.Cancel;
  CadPedidoCompraCl.vProdPed.RollBackTransacao;
  
  TForm(pnCadProdutosCtr.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtnProdExcluirClick(Sender: TObject);
begin
  inherited;
	if CadPedidoCompraCl.vProdPed.IsEmpty then
    exit;

  if not CadPedidoCompraCl.vProdPed.Delete(CadPedidoCompraCl) then
    exit;
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtnProdIncluirClick(Sender: TObject);
begin
  inherited;
	DBEdit10.Enabled           := True;
  DBEdit10.Color             := clWindow;
  lbxNotasPedido.Visible := False;
  lbNotasPedido.Visible := False;

  if CadPedidoCompraCl.dataSet.FieldByName('CODIGO').AsInteger <= 0 then
  begin
  	if Application.MessageBox(PChar('Favor salvar o Pedido de Compra Cliente (NFe) antes de continuar, deseja salvar?'),
    	'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
        exit;

  	if not CadPedidoCompraCl.post then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(CadPedidoCompraCl.vNomeCampoErro, CadPedidoCompraCl.vMensagemErro);
      exit;
    end;

    CadPedidoCompraCl.abrePedidoCompraCl(CadPedidoCompraCl.vCodigo);
    CadPedidoCompraCl.abreClientes(CadPedidoCompraCl.dataSet.FieldByName('COD_CLIENTE').AsInteger);
    if not (CadPedidoCompraCl.dataSet.State in [dsInsert, dsEdit]) then
      CadPedidoCompraCl.dataSet.Edit;
  end;

  if not CadPedidoCompraCl.vProdPed.Insert(CadPedidoCompraCl) then
    exit;

  if not CadPedidoCompraCl._abreFormProd then
    CadPedidoCompraCl.vProdPed.Cancel;
end;

procedure TfrmCadPedidoCompraClienteNfe.BitBtnProdOKClick(Sender: TObject);
begin
  if PedidoContrato.IsActive then
  begin
    if not CadPedidoCompraCl.post(PedidoContrato) then
      setFocusCampoErro(CadPedidoCompraCl.vNomeCampoErro, CadPedidoCompraCl.vMensagemErro)
    else
      TForm(PanelLeft.Parent).ModalResult := mrOk;

    Exit;
  end;

	if not CadPedidoCompraCl.vProdPed.Post(CadPedidoCompraCl) then
  begin
  	setFocusCampoErro(CadPedidoCompraCl.vProdPed.vNomeCampoErro, CadPedidoCompraCl.vProdPed.vMensagemErro);
    exit;
  end;

  TForm(pnCadProdutosCtr.Parent).ModalResult := IDOK;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBEdit10Exit(Sender: TObject);
begin
  inherited;
	if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtnProdCancel)) then
    Exit;

  if trim(CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString) = '' then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if vDadosIni.vPesquisa <> '' then
    begin
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString := trim(vDadosIni.vPesquisa);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('GRUPO_PROD').AsInteger := StrToInt(vDadosIni.vPesquisaGrupo_prod);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_PROD').AsString := trim(vDadosIni.vPesquisaCod_prod);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_GRADE').AsInteger := 0;

      if not CadPedidoCompraCl.vProdPed.buscaProduto(
      	CadPedidoCompraCl,
        trim(CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString),
        CadPedidoCompraCl.vProdPed.dataSet.FieldByName('GRUPO_PROD').AsInteger,
        CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_PROD').AsString,
        CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_GRADE').AsInteger,
        true) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
        	DBEdit10.SetFocus;
      	exit;
      end;

      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString := trim(CadPedidoCompraCl.vProdPed.vNUM_FAB_PROD);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('GRUPO_PROD').AsInteger  := CadPedidoCompraCl.vProdPed.vGRUPO_PROD;
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_PROD').AsString     := trim(CadPedidoCompraCl.vProdPed.vCOD_PROD);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_GRADE').AsInteger   := CadPedidoCompraCl.vProdPed.vCOD_GRADE;
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('DESCR_PROD').AsString   := trim(CadPedidoCompraCl.vProdPed.vDESCR_PROD);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('QUANT').AsFloat         := CadPedidoCompraCl.vProdPed.vQTDE;
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR').AsFloat         := CadPedidoCompraCl.vProdPed.vVALOR_UN;
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR_TOT').AsFloat     := (CadPedidoCompraCl.vProdPed.dataSet.FieldByName('QUANT').AsFloat * CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR').AsFloat);
    end;
  end
  else
  begin
    if not CadPedidoCompraCl.vProdPed.buscaProduto(
      CadPedidoCompraCl,
      trim(CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString),
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_PROD').AsString,
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_GRADE').AsInteger,
      true) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
        DBEdit10.SetFocus;
      exit;
    end;

    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString := trim(CadPedidoCompraCl.vProdPed.vNUM_FAB_PROD);
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('GRUPO_PROD').AsInteger  := CadPedidoCompraCl.vProdPed.vGRUPO_PROD;
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_PROD').AsString     := trim(CadPedidoCompraCl.vProdPed.vCOD_PROD);
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_GRADE').AsInteger   := CadPedidoCompraCl.vProdPed.vCOD_GRADE;
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('DESCR_PROD').AsString   := trim(CadPedidoCompraCl.vProdPed.vDESCR_PROD);
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('QUANT').AsFloat         := CadPedidoCompraCl.vProdPed.vQTDE;
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR').AsFloat         := CadPedidoCompraCl.vProdPed.vVALOR_UN;
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR_TOT').AsFloat     := (CadPedidoCompraCl.vProdPed.dataSet.FieldByName('QUANT').AsFloat * CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR').AsFloat);
  end;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBEdit10KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if vDadosIni.vPesquisa <> '' then
    begin
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString := trim(vDadosIni.vPesquisa);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('GRUPO_PROD').AsInteger  :=  StrToInt(trim(vDadosIni.vPesquisaGrupo_prod));
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_PROD').AsString     := trim(vDadosIni.vPesquisaCod_prod);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_GRADE').AsInteger   := 0;

      if not CadPedidoCompraCl.vProdPed.buscaProduto(
      	CadPedidoCompraCl,
        trim(CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString),
        CadPedidoCompraCl.vProdPed.dataSet.FieldByName('GRUPO_PROD').AsInteger,
        CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_PROD').AsString,
        CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_GRADE').AsInteger,
        true) then
      begin
        if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
        	DBEdit10.SetFocus;
        exit;
      end;

      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('NUM_FAB_PROD').AsString := trim(CadPedidoCompraCl.vProdPed.vNUM_FAB_PROD);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('DESCR_PROD').AsString   := trim(CadPedidoCompraCl.vProdPed.vDESCR_PROD);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('GRUPO_PROD').AsInteger  := CadPedidoCompraCl.vProdPed.vGRUPO_PROD;
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_PROD').AsString     := trim(CadPedidoCompraCl.vProdPed.vCOD_PROD);
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('COD_GRADE').AsInteger   := CadPedidoCompraCl.vProdPed.vCOD_GRADE;
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('QUANT').AsFloat         := CadPedidoCompraCl.vProdPed.vQTDE;
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR').AsFloat         := CadPedidoCompraCl.vProdPed.vVALOR_UN;
      CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR_TOT').AsFloat     := (CadPedidoCompraCl.vProdPed.vQTDE * CadPedidoCompraCl.vProdPed.vVALOR_UN);
    end;
  end;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if CadPedidoCompraCl.dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0 then
    exit;

	if not CadPedidoCompraCl.abreClientes(CadPedidoCompraCl.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
  begin
    Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    	DBEdit4.SetFocus;
    exit;
  end;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBEdit4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
	AProcedure: Tcl_cadCliente;
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if trim(vDadosIni.vPesquisa) <> '' then
    	if (CadPedidoCompraCl.dataSet.State in [dsInsert, dsEdit]) then
      	CadPedidoCompraCl.dataSet.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end
  else if Key = VK_F4 then
  begin
  	try
    	if vDadosIni.vCliente.AHandle = 0 then
        CarregaPacote('pkClientes', vDadosIni.vCliente.AHandle);

      if vDadosIni.vCliente.AHandle = 0 then
      begin
        Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
        Exit;
      end;

      @AProcedure := GetProcAddress(vDadosIni.vCliente.AHandle, 'cl_cadCliente');

      if Assigned(AProcedure) then
        AProcedure(
          1);

      if vDadosIni.vPesquisa <> '' then
        if (CadPedidoCompraCl.dataSet.State in [dsInsert, dsEdit]) then
          CadPedidoCompraCl.dataSet.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.vPesquisa);
    finally
    end;

//  	try
//      vCliente := TCadClientes.create;
//      vCliente.CadCliente(1);
//      if vDadosIni.vPesquisa <> '' then
//        CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
//    finally
//      if Assigned(vCliente) then
//      	FreeAndNil(vCliente);
//    end;
  end;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBEdit8Exit(Sender: TObject);
begin
  inherited;
	CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR_TOT').AsFloat :=
  	CadPedidoCompraCl.vProdPed.dataSet.FieldByName('QUANT').AsFloat *
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR').AsFloat;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBEdit9Exit(Sender: TObject);
begin
  CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR_TOT').AsFloat :=
  	CadPedidoCompraCl.vProdPed.dataSet.FieldByName('QUANT').AsFloat *
    CadPedidoCompraCl.vProdPed.dataSet.FieldByName('VALOR').AsFloat;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if (key = VK_DELETE) then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadPedidoCompraClienteNfe.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
  BitBtn11Click(Sender) ;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn11Click(Sender)
  else if key = VK_TAB then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn11.CanFocus) then
    	BitBtn11.SetFocus;
end;

procedure TfrmCadPedidoCompraClienteNfe.DBGridProdCtrKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    BitBtnProdAlterarClick(Sender)
  else if key = VK_DELETE then
    BitBtnProdExcluirClick(Sender)
  else if (key = VK_INSERT) then
    BitBtnProdIncluirClick(Sender);
end;

procedure TfrmCadPedidoCompraClienteNfe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	if (CadPedidoCompraCl <> nil) then
    CadPedidoCompraCl.Cancel;

  CadPedidoCompraCl.free;
  CadPedidoCompraCl := nil;

  Action := caFree;
  if (frmCadPedidoCompraClienteNfe <> nil) then
    frmCadPedidoCompraClienteNfe := nil;
end;

procedure TfrmCadPedidoCompraClienteNfe.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadPedidoCompraCl := TCadPedidoCompraCl.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
	tsProdutosCtrCons.TabVisible := false;
  tsProdutosCtrCad.TabVisible := false;
  tsSelecionaGradeProd.TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

  PedidoContrato.IsActive := False;
end;

procedure TfrmCadPedidoCompraClienteNfe.FormKeyDownItens(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if (key = VK_ESCAPE) then
  	BitBtnProdCancelClick(Sender);
end;

procedure TfrmCadPedidoCompraClienteNfe.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmClientes.dsPedidoCompraCl;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
    
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadPedidoCompraClienteNfe.pnCadProdutosCtrEnter(Sender: TObject);
begin
  if PedidoContrato.IsActive then
    Exit;
  
	TForm(pnCadProdutosCtr.Parent).OnKeyDown := FormKeyDownItens;

  if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
  	DBEdit10.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
  	DBEdit8.SetFocus;
end;

procedure TfrmCadPedidoCompraClienteNfe.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadPedidoCompraCl.dataSet.IsEmpty then
      Exit;
    if not CadPedidoCompraCl.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    PageControl2.ActivePage := tsProdutosCtrCons;

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
      CadPedidoCompraCl.Cancel;
      CadPedidoCompraCl.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPedidoCompraClienteNfe.SpeedButton2Click(Sender: TObject);
begin
  inherited;
	try
    if not vDadosIni.PesqPros('MOB004', 'EXCLUIR', '', 'PEDIDOCOMPRACL',
      CadPedidoCompraCl.dataSet.FieldByName('CODIGO').AsString, CadPedidoCompraCl.buscas, false) then
      Exit;

    CadPedidoCompraCl.Delete;
    
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadPedidoCompraCl.Cancel;
      CadPedidoCompraCl.RollBackTransacao;
    end;
  end;
end;

end.
