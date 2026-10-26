unit uCadMobile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DB, DBCtrls, QRCtrls, QuickRpt;

type
  TfrmCadMobile = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    DataSource1: TDataSource;
    TabSheet4: TTabSheet;
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
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    qrpMobile: TQuickRep;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBComboBox1: TDBComboBox;
    pnMobileBloqueado: TPanel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrpMobilePreview(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMobile: TfrmCadMobile;

implementation

uses
  UClassesMobile, UDtmMobile, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadMobile.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('MOB002', 'CONSULTA', '', 'MOBILE', '',
    CadMobile.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not CadMobile.ConsultaCampos('MOBILE', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not CadMobile.ConsultaCampos('MOBILE', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadMobile.BitBtn3Click(Sender: TObject);
begin
  try
    if not CadMobile.Insert then
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
      CadMobile.Cancel;
      CadMobile.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMobile.BitBtn4Click(Sender: TObject);
begin
  if not CadMobile.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadMobile.vNomeCampoErro, CadMobile.vMensagemErro);
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
      if CadMobile.Insert then
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

procedure TfrmCadMobile.BitBtn5Click(Sender: TObject);
begin
  inherited;
  CadMobile.Cancel;
  CadMobile.RollBackTransacao;

end;

procedure TfrmCadMobile.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (CadMobile.dataSet.FieldByName('STATUS_MOB').AsString = 'BLOQUEADO') then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnMobileBloqueado.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

end;

procedure TfrmCadMobile.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadMobile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if (CadMobile <> nil) then
    CadMobile.Cancel;

  CadMobile.free;
  CadMobile := nil;

  Action := caFree;
  if (frmCadMobile <> nil) then
    frmCadMobile := nil;
end;

procedure TfrmCadMobile.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadMobile := TMobile.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadMobile.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmMobile.dsMobile;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [MOB005]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadMobile._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadMobile.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadMobile.qrpMobilePreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cadastro de Mobile');
end;

procedure TfrmCadMobile.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadMobile.dataSet.IsEmpty then
      Exit;
    if not CadMobile.Edit then
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
      CadMobile.Cancel;
      CadMobile.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMobile.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('MOB009', 'ABRIR A LIXEIRA', '', 'MOBILE',
    '', CadMobile.buscas, true) then
    Exit;

  inherited;

  if not CadMobile._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira - [MOB005]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente - [MOB006]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadMobile.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    CadMobile.Delete;
    lixeiraVazia(not CadMobile._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadMobile.Cancel;
      CadMobile.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMobile.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('MOB010', 'IMPRIMIR', '', 'MOBILE',
    CadMobile.dataSet.FieldByName('IDMOBILE').AsString, CadMobile.buscas, true) then
    exit;

  qrpMobile.Preview;
end;

procedure TfrmCadMobile.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('MOB007', 'RESTAURAR', '', 'MOBILE', '', CadMobile.buscas, false) then
    if CadMobile._restauraLixeira then
      lixeiraVazia(not CadMobile._lixeiraCheia);
end;

end.

