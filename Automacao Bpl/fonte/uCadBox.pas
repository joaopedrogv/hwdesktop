unit uCadBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, QRCtrls, QuickRpt, DB;

type
  TfrmCadBox = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    tsCadastro: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    qrpPBox: TQuickRep;
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
    DataSource1: TDataSource;
    TabSheet5: TTabSheet;
    GroupBox7: TGroupBox;
    GroupBox4: TGroupBox;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid2: TDBGrid;
    BitBtn12: TBitBtn;
    procedure qrpPBoxPreview(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBox: TfrmCadBox;

implementation

uses
  uDtmAtivo, UClassesCadastrosBasicos, UDtmCadastrosBasicos;

{$R *.dfm}

procedure TfrmCadBox.BitBtn12Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadBox.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS223', 'PESQUISAR', '',
    'BOX', '', CadBox.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not CadBox.ConsultaCampos('BOX', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if CadBox.ConsultaCampos('BOX', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadBox.BitBtn3Click(Sender: TObject);
begin
  try
    if not CadBox.Insert then
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
      CadBox.Cancel;
      CadBox.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadBox.BitBtn4Click(Sender: TObject);
begin
  if not cadbox.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(cadbox.vNomeCampoErro);
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
      if cadbox.Insert then
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

procedure TfrmCadBox.BitBtn5Click(Sender: TObject);
begin
  inherited;
  cadbox.Cancel;
  cadbox.RollBackTransacao;
end;

procedure TfrmCadBox.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
end;

procedure TfrmCadBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (CadBox <> nil) then
    CadBox.Cancel;

  CadBox.free;
  CadBox := nil;

  Action := caFree;
  if (frmCadBox <> nil) then
    frmCadBox := nil;
end;

procedure TfrmCadBox.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadBox := TBox.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadBox.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsBox;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS226]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadBox._lixeiraCheia);
  end;

  SpeedButton6.Visible := vDadosIni.vEmp.vAgendaOficina = 'S';
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadBox.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadBox.qrpPBoxPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cadastro de Box');
end;

procedure TfrmCadBox.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadBox.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('BAS225', 'ALTERAR', '', 'BOX',
      CadBox.dataSet.FieldByName('COD_BOX').AsString, CadBox.buscas, true) then
      exit;

    if not CadBox.Edit then
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
      CadBox.Cancel;
      CadBox.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadBox.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS230', 'ABRIR A LIXEIRA', '', 'BOX',
    '', CadBox.buscas, true) then
    Exit;

  inherited;

  if not CadBox._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS226]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS227]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadBox.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('BAS226', 'EXCLUIR', '', 'BOX',
      CadBox.dataSet.FieldByName('COD_BOX').AsString, CadBox.buscas, false) then
      Exit;

    CadBox.Delete;
    lixeiraVazia(not CadBox._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadBox.Cancel;
      CadBox.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadBox.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS231', 'IMPRIMIR', '', 'BOX',
    CadBox.dataSet.FieldByName('COD_BOX').AsString, CadBox.buscas, true) then
    exit;

  qrpPBox.Preview;
end;

procedure TfrmCadBox.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS230', '', '', 'BOX', '', CadBox.buscas, false) then
    if CadBox._restauraLixeira then
      lixeiraVazia(not CadBox._lixeiraCheia);
end;

procedure TfrmCadBox.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('AGO026', '', '', 'BOX', CadBox.dataSet.FieldByName('COD_BOX').AsString, CadBox.buscas,
    false) then
    exit;

  if vDadosIni.vEmp.vAgendaOficina <> 'S' then
  begin
    Application.MessageBox('Empresa não configurada para usar Agenda Oficina!',
      'Atenção', 0 + 64);
    exit;
  end;

  PageControl1.ActivePage := TabSheet5;
  CadBox.vBoxOsABerta.BuscarOsAberta(CadBox.dataSet.FieldByName('COD_BOX').AsInteger);


end;

end.

