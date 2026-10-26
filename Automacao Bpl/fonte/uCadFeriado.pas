unit uCadFeriado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, QRCtrls, QuickRpt, DBCtrls, DB;

type
  TfrmCadFeriado = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    qrpPAgenda: TQuickRep;
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
    tsCadastro: TTabSheet;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DataSource1: TDataSource;
    DBComboBox1: TDBComboBox;
    Label6: TLabel;
    Label7: TLabel;
    DBComboBox2: TDBComboBox;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrpPAgendaPreview(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFeriado: TfrmCadFeriado;

implementation

uses
  uDtmAtivo, UClassesCadastrosBasicos, uCadBox, UDtmCadastrosBasicos,
  uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadFeriado.BitBtn1Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('BAS223', 'PESQUISAR', '',
  'FERIADO', '', CadFeriado.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not CadFeriado.ConsultaCampos('FERIADO', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if CadFeriado.ConsultaCampos('FERIADO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
      
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadFeriado.BitBtn3Click(Sender: TObject);
var
  I: Integer;
begin
  try
    if not CadFeriado.Insert then
      exit;

    inherited;

    Label7.Visible := False;//vDadosIni.vHwCloudIA.vUsarServMensageria <> 'S';
    DBComboBox2.Visible := False;//vDadosIni.vHwCloudIA.vUsarServMensageria <> 'S';

    for I := 0 to DBComboBox1.Items.Count - 1 do
      if trim(DBComboBox1.Items[I]) = trim(CadFeriado.dataSet.FieldByName('TIPO_FERIADO').AsString) then
      begin
        DBComboBox1.ItemIndex := I;
        Break;
      end;

    for I := 0 to DBComboBox2.Items.Count - 1 do
      if Copy(trim(DBComboBox2.Items[I]), 1, 1) = Copy(trim(CadFeriado.dataSet.FieldByName('TURNO').AsString), 1, 1) then
      begin
        DBComboBox2.ItemIndex := I;
        Break;
      end;

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
      CadFeriado.Cancel;
      CadFeriado.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadFeriado.BitBtn4Click(Sender: TObject);
begin
   if not CadFeriado.post then
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
      if CadFeriado.Insert then
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

procedure TfrmCadFeriado.BitBtn5Click(Sender: TObject);
begin
  inherited;
 CadFeriado.Cancel;
  CadFeriado.RollBackTransacao;
end;

procedure TfrmCadFeriado.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadFeriado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
if (CadBox <> nil) then
    CadFeriado.Cancel;

  CadFeriado.free;
  CadFeriado := nil;

  Action := caFree;
  if (frmCadBox <> nil) then
    frmCadBox := nil;
end;

procedure TfrmCadFeriado.FormCreate(Sender: TObject);
begin
inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadFeriado := TFERIADO.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFeriado.FormShow(Sender: TObject);
begin
if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsFeriado;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS236]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadFeriado._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadFeriado.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadFeriado.qrpPAgendaPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cadastro de Feriados');
end;

procedure TfrmCadFeriado.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  try
    if CadFeriado.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('BAS225', 'ALTERAR', '', 'FERIADO',
      CadFeriado.dataSet.FieldByName('DATA_FERIADO').AsString, CadFeriado.buscas, true) then
      exit;

    if not CadFeriado.Edit then
      Exit;
      
    inherited;

    Label7.Visible := False;//vDadosIni.vHwCloudIA.vUsarServMensageria <> 'S';
    DBComboBox2.Visible := False;//vDadosIni.vHwCloudIA.vUsarServMensageria <> 'S';

    for I := 0 to DBComboBox1.Items.Count - 1 do
      if trim(DBComboBox1.Items[I]) = trim(CadFeriado.dataSet.FieldByName('TIPO_FERIADO').AsString) then
      begin
        DBComboBox1.ItemIndex := I;
        Break;
      end;

    for I := 0 to DBComboBox2.Items.Count - 1 do
      if Copy(trim(DBComboBox2.Items[I]), 1, 1) = Copy(trim(CadFeriado.dataSet.FieldByName('TURNO').AsString), 1, 1) then
      begin
        DBComboBox2.ItemIndex := I;
        Break;
      end;

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
      CadFeriado.Cancel;
      CadFeriado.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadFeriado.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS230', 'ABRIR A LIXEIRA', '', 'FERIADO',
    '', CadFeriado.buscas, true) then
    Exit;

  inherited;

  if not CadFeriado._abrelixeira then
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

procedure TfrmCadFeriado.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('BAS226', 'EXCLUIR', '', 'FERIADO',
      CadFeriado.dataSet.FieldByName('DATA_FERIADO').AsString, CadFeriado.buscas, false) then
      Exit;

    CadFeriado.Delete;
    lixeiraVazia(not CadFeriado._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadFeriado.Cancel;
      CadFeriado.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadFeriado.SpeedButton3Click(Sender: TObject);
begin
  inherited;
 if not vDadosIni.PesqPros('BAS231', 'IMPRIMIR', '', 'FERIADO',
    CadFeriado.dataSet.FieldByName('DATA_FERIADO').AsString, CadFeriado.buscas, true) then
    exit;

  qrpPAgenda.Preview;
end;

procedure TfrmCadFeriado.SpeedButton5Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('BAS238', '', '', 'FERIADO', '', CadFeriado.buscas, false) then
    if CadFeriado._restauraLixeira then
      lixeiraVazia(not CadFeriado._lixeiraCheia);
end;

end.
