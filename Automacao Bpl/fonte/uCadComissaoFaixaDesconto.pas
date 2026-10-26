unit uCadComissaoFaixaDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, QRCtrls, QuickRpt;

type
  TfrmCadComissaoFaixaDesconto = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    TabSheet4: TTabSheet;
    qrpComissao: TQuickRep;
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
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    GroupBox5: TGroupBox;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    Panel5: TPanel;
    BitBtn_Salvar_Vigencia: TBitBtn;
    BitBtn_Cancelar_Vigencia: TBitBtn;
    Panel6: TPanel;
    BitBtn_Novo_Vigencia: TBitBtn;
    BitBtn_Alterar_Vigencia: TBitBtn;
    DBGrid2: TDBGrid;
    BitBtn_Excluir_Vigencia: TBitBtn;
    GroupBox6: TGroupBox;
    PageControl4: TPageControl;
    TabSheet7: TTabSheet;
    Panel8: TPanel;
    BitBtn_Novo_Desconto: TBitBtn;
    BitBtn_Alterar_Desconto: TBitBtn;
    BitBtn_Excluir_Desconto: TBitBtn;
    DBGrid3: TDBGrid;
    TabSheet8: TTabSheet;
    Panel7: TPanel;
    BitBtn_Salvar_Desconto: TBitBtn;
    BitBtn_Cancelar_Desconto: TBitBtn;
    GroupBox7: TGroupBox;
    Label12: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Panel9: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn_Cancelar_DescontoClick(Sender: TObject);
    procedure BitBtn_Salvar_DescontoClick(Sender: TObject);
    procedure BitBtn_Excluir_DescontoClick(Sender: TObject);
    procedure BitBtn_Alterar_DescontoClick(Sender: TObject);
    procedure BitBtn_Novo_DescontoClick(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn_Excluir_VigenciaClick(Sender: TObject);
    procedure BitBtn_Cancelar_VigenciaClick(Sender: TObject);
    procedure BitBtn_Salvar_VigenciaClick(Sender: TObject);
    procedure BitBtn_Cancelar_DespesaClick(Sender: TObject);
    procedure BitBtn_Alterar_VigenciaClick(Sender: TObject);
    procedure BitBtn_Novo_VigenciaClick(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadComissaoFaixaDesconto: TfrmCadComissaoFaixaDesconto;

implementation

uses UDtmCadastrosBasicos, uDtmAtivo, UClassesCadastrosBasicos, DB;

{$R *.dfm}

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Cancelar_DescontoClick(Sender: TObject);
begin
  CadComissaoFaixaDesc.vComissaoFaixaDescVig.vComissaoFaixaDescPerc.Cancel;
  CadComissaoFaixaDesc.vComissaoFaixaDescVig.vComissaoFaixaDescPerc.RollBackTransacao;

  DBGrid2.Enabled := true;
  BitBtn4.Enabled := true;
  BitBtn_Novo_Vigencia.Enabled := true;
  BitBtn_Alterar_Vigencia.Enabled := true;
  BitBtn_Excluir_Vigencia.Enabled := true;

  PageControl4.ActivePage := TabSheet7;
  TabSheet7.Show;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Novo_DescontoClick(Sender: TObject);
begin
  if not CadComissaoFaixaDesc.vComissaoFaixaDescVig.vComissaoFaixaDescPerc.Insert(
  	CadComissaoFaixaDesc.vComissaoFaixaDescVig.dataset) then
    exit;

  DBEdit6.Enabled := true;
  DBEdit7.Enabled := true;
	DBEdit8.Enabled := true;

  DBGrid2.Enabled := false;
  BitBtn4.Enabled := false;
  BitBtn_Novo_Vigencia.Enabled := false;
  BitBtn_Alterar_Vigencia.Enabled := false;
  BitBtn_Excluir_Vigencia.Enabled := false;

  PageControl4.ActivePage := TabSheet8;
  TabSheet8.Show;

  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
  	DBEdit6.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
  	DBEdit7.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
  	DBEdit8.SetFocus;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Alterar_DescontoClick(Sender: TObject);
begin
  if not CadComissaoFaixaDesc.vComissaoFaixaDescVig.vComissaoFaixaDescPerc.Edit then
    exit;

  DBEdit6.Enabled := true;
  DBEdit7.Enabled := true;
  DBEdit8.Enabled := true;

  DBGrid2.Enabled := false;
  BitBtn4.Enabled := false;
  BitBtn_Novo_Vigencia.Enabled := false;
  BitBtn_Alterar_Vigencia.Enabled := false;
  BitBtn_Excluir_Vigencia.Enabled := false;

  PageControl4.ActivePage := TabSheet8;
  TabSheet8.Show;

  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
  	DBEdit6.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
  	DBEdit7.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
  	DBEdit8.SetFocus;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Excluir_DescontoClick(Sender: TObject);
begin
  if not CadComissaoFaixaDesc.vComissaoFaixaDescVig.vComissaoFaixaDescPerc.Delete then
    exit;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS459', 'CONSULTA', '', 'COMISSAO_FAIXA_DESCONTO', '',
    CadComissaoFaixaDesc.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not CadComissaoFaixaDesc.ConsultaCampos('COMISSAO_FAIXA_DESCONTO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not CadComissaoFaixaDesc.ConsultaCampos('COMISSAO_FAIXA_DESCONTO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  try
    if not CadComissaoFaixaDesc.Insert then
      exit;

    inherited;

    BitBtn4.Enabled := true;
    BitBtn_Novo_Vigencia.Enabled := true;
    BitBtn_Alterar_Vigencia.Enabled := true;
    BitBtn_Excluir_Vigencia.Enabled := true;
    BitBtn_Novo_Desconto.Enabled := true;
    BitBtn_Alterar_Desconto.Enabled := true;
    BitBtn_Excluir_Desconto.Enabled := true;
    GroupBox5.Visible := false;
    GroupBox6.Visible := false;
    DBComboBox1.Enabled := true;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    PageControl2.ActivePage := TabSheet5;
    PageControl4.ActivePage := TabSheet7;

    for I := 0 to DBComboBox1.Items.Count - 1 do
    	if (trim(DBComboBox1.Items[I]) = trim(CadComissaoFaixaDesc.dataSet.FieldByName('TIPO').AsString)) then
		    DBComboBox1.ItemIndex := i;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadComissaoFaixaDesc.Cancel;
      CadComissaoFaixaDesc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn4Click(Sender: TObject);
begin
	if not CadComissaoFaixaDesc.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadComissaoFaixaDesc.vNomeCampoErro, CadComissaoFaixaDesc.vMensagemErro);
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
      if CadComissaoFaixaDesc.Insert then
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

procedure TfrmCadComissaoFaixaDesconto.BitBtn5Click(Sender: TObject);
begin
  inherited;
	CadComissaoFaixaDesc.Cancel;
  CadComissaoFaixaDesc.RollBackTransacao;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Salvar_DescontoClick(Sender: TObject);
begin
  if not CadComissaoFaixaDesc.vComissaoFaixaDescVig.vComissaoFaixaDescPerc.Post(
  	CadComissaoFaixaDesc.vComissaoFaixaDescVig.dataSet) then
  begin
  	setFocusCampoErro(
    	CadComissaoFaixaDesc.vComissaoFaixaDescVig.vComissaoFaixaDescPerc.vNomeCampoErro,
    	CadComissaoFaixaDesc.vComissaoFaixaDescVig.vComissaoFaixaDescPerc.vMensagemErro);
    exit;
  end;

  DBGrid2.Enabled := true;
  BitBtn4.Enabled := true;
  BitBtn_Novo_Vigencia.Enabled := true;
  BitBtn_Alterar_Vigencia.Enabled := true;
  BitBtn_Excluir_Vigencia.Enabled := true;

  PageControl4.ActivePage := TabSheet7;
  TabSheet7.Show;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Salvar_VigenciaClick(Sender: TObject);
begin
	if not CadComissaoFaixaDesc.vComissaoFaixaDescVig.Post(
  	CadComissaoFaixaDesc.dataSet) then
  begin
  	setFocusCampoErro(CadComissaoFaixaDesc.vComissaoFaixaDescVig.vNomeCampoErro, CadComissaoFaixaDesc.vComissaoFaixaDescVig.vMensagemErro);
    exit;
  end;

  BitBtn4.Enabled := true;
  BitBtn_Novo_Desconto.Enabled := true;
  BitBtn_Alterar_Desconto.Enabled := true;
  BitBtn_Excluir_Desconto.Enabled := true;

  PageControl2.ActivePage := TabSheet5;
  TabSheet5.Show;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Cancelar_VigenciaClick(Sender: TObject);
begin
  CadComissaoFaixaDesc.vComissaoFaixaDescVig.Cancel;
  CadComissaoFaixaDesc.vComissaoFaixaDescVig.RollBackTransacao;

  BitBtn4.Enabled := true;
  BitBtn_Novo_Desconto.Enabled := true;
  BitBtn_Alterar_Desconto.Enabled := true;
  BitBtn_Excluir_Desconto.Enabled := true;

  PageControl2.ActivePage := TabSheet5;
  TabSheet5.Show;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Alterar_VigenciaClick(
  Sender: TObject);
begin
	if not CadComissaoFaixaDesc.vComissaoFaixaDescVig.Edit then
    exit;

  DBEdit3.Enabled := true;
  DBEdit4.Enabled := true;

  BitBtn4.Enabled := false;
  BitBtn_Novo_Desconto.Enabled := false;
  BitBtn_Alterar_Desconto.Enabled := false;
  BitBtn_Excluir_Desconto.Enabled := false;

  PageControl2.ActivePage := TabSheet6;
  TabSheet6.Show;

  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
  	DBEdit3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Cancelar_DespesaClick(
  Sender: TObject);
begin
  inherited;
	CadComissaoFaixaDesc.vComissaoFaixaDescVig.Cancel;
  CadComissaoFaixaDesc.vComissaoFaixaDescVig.RollBackTransacao;

  PageControl2.ActivePage := TabSheet5;
  TabSheet5.Show;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Excluir_VigenciaClick(
  Sender: TObject);
begin
  if not CadComissaoFaixaDesc.vComissaoFaixaDescVig.Delete then
    exit;
end;

procedure TfrmCadComissaoFaixaDesconto.BitBtn_Novo_VigenciaClick(
  Sender: TObject);
begin
	if not CadComissaoFaixaDesc.vComissaoFaixaDescVig.Insert(CadComissaoFaixaDesc.dataset) then
    exit;

  DBEdit3.Enabled := true;
  DBEdit4.Enabled := true;

  BitBtn4.Enabled := false;
  BitBtn_Novo_Desconto.Enabled := false;
  BitBtn_Alterar_Desconto.Enabled := false;
  BitBtn_Excluir_Desconto.Enabled := false;

  PageControl2.ActivePage := TabSheet6;
  TabSheet6.Show;

  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
  	DBEdit3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TfrmCadComissaoFaixaDesconto.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if CadComissaoFaixaDesc.dataSet.State <> dsInsert then
	  GroupBox6.Visible := DBComboBox1.ItemIndex = 0;

  if CadComissaoFaixaDesc.dataSet.State <> dsInsert then
    if (DBComboBox1.ItemIndex = 0) then
    begin
      if not (CadComissaoFaixaDesc.dataSet.State in [dsInsert, dsEdit]) then
        CadComissaoFaixaDesc.dataSet.Edit;
      CadComissaoFaixaDesc.dataSet.FieldByName('PERC_DESC_INI').AsFloat := 0;
      CadComissaoFaixaDesc.dataSet.FieldByName('PERC_DESC_FIM').AsFloat := 0;
    end;
end;

procedure TfrmCadComissaoFaixaDesconto.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadComissaoFaixaDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

	 if (CadComissaoFaixaDesc <> nil) then
    CadComissaoFaixaDesc.Cancel;

  CadComissaoFaixaDesc.free;
  CadComissaoFaixaDesc := nil;

  Action := caFree;
  if (frmCadComissaoFaixaDesconto <> nil) then
    frmCadComissaoFaixaDesconto := nil;
end;

procedure TfrmCadComissaoFaixaDesconto.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadComissaoFaixaDesc := TComissaoFaixaDesc.create;
  tsCadastro.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
  TabSheet6.TabVisible := False;
  TabSheet7.TabVisible := False;
  TabSheet8.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadComissaoFaixaDesconto.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsComissaoFaixaDesc;
    DBGrid2.DataSource := DtmCadBasicos.dsComissaoFaixaDescVig;
    DBGrid3.DataSource := DtmCadBasicos.dsComissaoFaixaDescPerc;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira - [BAS462]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadComissaoFaixaDesc._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadComissaoFaixaDesconto.lbEmpresaPrint(sender: TObject;
  var Value: string);
begin
  inherited;
	Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadComissaoFaixaDesconto.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  try
    if not CadComissaoFaixaDesc.Edit then
      Exit;
    inherited;

    BitBtn4.Enabled := true;
    BitBtn_Novo_Vigencia.Enabled := true;
    BitBtn_Alterar_Vigencia.Enabled := true;
    BitBtn_Excluir_Vigencia.Enabled := true;
    BitBtn_Novo_Desconto.Enabled := true;
    BitBtn_Alterar_Desconto.Enabled := true;
    BitBtn_Excluir_Desconto.Enabled := true;
    Panel4.Align := alTop;
    GroupBox5.Align := alNone;
    GroupBox6.Align := alNone;
    GroupBox5.Visible := true;
    GroupBox5.Align := alTop;
    GroupBox6.Visible := true;
    GroupBox6.Align := alBottom;
    GroupBox6.Align := alTop;
    DBComboBox1.Enabled := false;
    DBEdit6.Enabled := false;
    DBEdit7.Enabled := false;
    DBEdit8.Enabled := false;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    PageControl2.ActivePage := TabSheet5;
    PageControl4.ActivePage := TabSheet7;

  	for I := 0 to DBComboBox1.Items.Count - 1 do
    	if (trim(DBComboBox1.Items[I]) = trim(CadComissaoFaixaDesc.dataSet.FieldByName('TIPO').AsString)) then
		    DBComboBox1.ItemIndex := i;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadComissaoFaixaDesc.Cancel;
      CadComissaoFaixaDesc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadComissaoFaixaDesconto.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS466', 'ABRIR A LIXEIRA', '', 'COMISSAO_FAIXA_DESCONTO',
    '', CadComissaoFaixaDesc.buscas, true) then
    Exit;

  inherited;

  if not CadComissaoFaixaDesc._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira - [BAS462]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS463]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadComissaoFaixaDesconto.SpeedButton2Click(Sender: TObject);
begin
  try
    if not CadComissaoFaixaDesc.Delete then
    	exit;
      
    lixeiraVazia(not CadComissaoFaixaDesc._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadComissaoFaixaDesc.Cancel;
      CadComissaoFaixaDesc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadComissaoFaixaDesconto.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('BAS467', 'IMPRIMIR', '', 'COMISSAO_FAIXA_DESCONTO',
    CadComissaoFaixaDesc.dataSet.FieldByName('CODIGO').AsString, CadComissaoFaixaDesc.buscas, true) then
    exit;

  qrpComissao.Preview;
end;

procedure TfrmCadComissaoFaixaDesconto.SpeedButton5Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS464', '', '', 'COMISSAO_FAIXA_DESCONTO', '', CadComissaoFaixaDesc.buscas, false) then
  	exit;

  if not CadComissaoFaixaDesc._restauraLixeira then
  	exit;

  lixeiraVazia(not CadComissaoFaixaDesc._lixeiraCheia);
end;

end.
