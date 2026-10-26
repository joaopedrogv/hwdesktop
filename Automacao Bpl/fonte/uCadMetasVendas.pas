unit uCadMetasVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, QRCtrls, QuickRpt;

type
  TfrmCadMetasVendas = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBComboBox6: TDBComboBox;
    TabSheet4: TTabSheet;
    qrpMetasVendas: TQuickRep;
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
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrpMetasVendasPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMetasVendas: TfrmCadMetasVendas;

implementation

uses uDtmAtivo, UClassesCadastrosBasicos, UDtmCadastrosBasicos;

{$R *.dfm}

procedure TfrmCadMetasVendas.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS269]';
  if vDadosIni.PesqPros('BAS266', 'PESQUISAR', '',
    'METAS_VENDAS', '', CadMetasVendas.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not  CadMetasVendas.ConsultaCampos('METAS_VENDAS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if  CadMetasVendas.ConsultaCampos('METAS_VENDAS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadMetasVendas.BitBtn3Click(Sender: TObject);
begin
 try
    if not CadMetasVendas.Insert then
      exit;

    inherited;


    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      DBEdit5.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadMetasVendas.Cancel;
      CadMetasVendas.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadMetasVendas.BitBtn4Click(Sender: TObject);
begin
if not CadMetasVendas.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadMetasVendas.vNomeCampoErro, CadMetasVendas.vMensagemErro);
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
      if CadMetasVendas.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
        	DBEdit5.SetFocus;
      end;
    end
    else
      inherited;
	end;
end;

procedure TfrmCadMetasVendas.BitBtn5Click(Sender: TObject);
begin
  inherited;
  CadMetasVendas.Cancel;
  CadMetasVendas.RollBackTransacao;
end;

procedure TfrmCadMetasVendas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadMetasVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CadMetasVendas.Cancel;
  CadMetasVendas.RollBackTransacao;

  Action := caFree;
  frmCadMetasVendas := nil;
end;

procedure TfrmCadMetasVendas.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadMetasVendas.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsMetasVendas;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS269]';
  end;

  inherited;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadMetasVendas._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadMetasVendas.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadMetasVendas.qrpMetasVendasPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cadastro de Perfis de Metas');
end;

procedure TfrmCadMetasVendas.SpeedButton1Click(Sender: TObject);
begin
	try
    if CadMetasVendas.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('BAS268', 'ALTERAR', '', 'METAS_VENDAS',
      CadMetasVendas.dataSet.FieldByName('CODIGO_META').AsString, CadMetasVendas.buscas,
      true) then
      exit;

    if not CadMetasVendas.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      DBEdit5.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadMetasVendas.Cancel;
      CadMetasVendas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMetasVendas.SpeedButton25Click(Sender: TObject);
begin
 if not vDadosIni.PesqPros('BAS273', 'ABRIR A LIXEIRA', '', 'METAS_VENDAS',
    '', CadMetasVendas.buscas, true) then
    Exit;

  inherited;

  if not CadMetasVendas._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS269]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS270]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadMetasVendas.SpeedButton2Click(Sender: TObject);
begin
 inherited;
  try
    if not vDadosIni.PesqPros('BAS269', 'EXCLUIR', '', 'METAS_VENDAS',
      CadMetasVendas.dataSet.FieldByName('CODIGO_META').AsString, CadMetasVendas.buscas,
      false) then
      Exit;

    CadMetasVendas.Delete;
    lixeiraVazia(not CadMetasVendas._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadMetasVendas.Cancel;
      CadMetasVendas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMetasVendas.SpeedButton3Click(Sender: TObject);
begin
  inherited;
 if not vDadosIni.PesqPros('BAS274', 'IMPRIMIR', '', 'METAS_VENDAS',
    CadMetasVendas.dataSet.FieldByName('CODIGO_META').AsString, CadMetasVendas.buscas, true)
    then
    exit;

  qrpMetasVendas.Preview;
end;

procedure TfrmCadMetasVendas.SpeedButton5Click(Sender: TObject);
begin
  inherited;
   if vDadosIni.PesqPros('BAS273', '', '', 'METAS_VENDAS', '', CadMetasVendas.buscas, false) then
    if CadMetasVendas._restauraLixeira then
      lixeiraVazia(not CadMetasVendas._lixeiraCheia);
end;

end.
