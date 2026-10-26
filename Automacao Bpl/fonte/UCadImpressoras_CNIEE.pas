unit UCadImpressoras_CNIEE;

interface

uses
  Windows, UclassesCadastrosBasicos, uCadPadraoModal, QRCtrls, grimgctrl, QuickRpt,
  DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids, Controls,
  StdCtrls, Mask, Forms, Classes, AppEvnts, Graphics;

type
  TfrmCadImpressoras = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRDBText1: TQRDBText;
    s: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadImpressoras: TfrmCadImpressoras;
  ObImpressoras: TImpressoras_CNIEE;

implementation

{$R *.dfm}

uses UDtmCadastrosBasicos, uDadosIni, uDtmAtivo;

procedure TfrmCadImpressoras.BitBtn1Click(Sender: TObject);
begin
  inherited;
 if vDadosIni.PesqPros('BAS296', 'PESQUISAR', '',
    'Impressoras_CNIEE', '', ObImpressoras.buscas, true) then
  begin
   inherited;
  end;
  if MaskEdit2.Visible then
  begin
    if not ObImpressoras.ConsultaCampos('Impressoras_CNIEE', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if not ObImpressoras.ConsultaCampos('Impressoras_CNIEE', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
       if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS300]';
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadImpressoras.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ObImpressoras.cancel;
  ObImpressoras.abreImpressoras;

end;

procedure TfrmCadImpressoras.BitBtn3Click(Sender: TObject);
begin
  if not ObImpressoras.Insert then
    exit;

  ActiveControl := BitBtn3;
  inherited;

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus;
end;

procedure TfrmCadImpressoras.BitBtn4Click(Sender: TObject);
begin
  if not ObImpressoras.Post then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	  DBEdit1.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if ObImpressoras.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      MudaCor;
    end
    else begin
      inherited;
      ObImpressoras.abreImpressoras;
    end;
  end;

end;

procedure TfrmCadImpressoras.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ObImpressoras.cancel;
  ObImpressoras.abreImpressoras;
end;

procedure TfrmCadImpressoras.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TfrmCadImpressoras.DBComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadImpressoras.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadImpressoras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadImpressoras := nil;
end;

procedure TfrmCadImpressoras.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ObImpressoras := TImpressoras_CNIEE.create;
end;

procedure TfrmCadImpressoras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if key = VK_ESCAPE then
    BitBtn5Click(Sender);

end;

procedure TfrmCadImpressoras.FormShow(Sender: TObject);
var
  I: Integer;
begin
  TabSheet4.TabVisible := False;
  TabSheet3.TabVisible := False;
  DBGrid1.DataSource := DtmCadBasicos.dsImpressoras;
  inherited;

  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
      TDBEdit(Components[I]).CharCase := ecUpperCase;
    if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;

  if ObImpressoras.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
  //   ObImpressoras.abreImpressoras;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadImpressoras.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Impressoras CNIEE');
end;

procedure TfrmCadImpressoras.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  if ObImpressoras.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;

  inherited;

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;

  if ObImpressoras.Edit then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
end;

procedure TfrmCadImpressoras.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not ObImpressoras.abreLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS300]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS301]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadImpressoras.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if ObImpressoras.Delete then
  begin
    if ObImpressoras.statusLixeira then
      lixeiraVazia(false)
    else
    begin
      lixeiraVazia(True);
      ObImpressoras.abreImpressoras;
    end;
  end;

end;

procedure TfrmCadImpressoras.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS305', 'IMPRIMIR', '',
    'Impressoras_CNIEE', '', ObImpressoras.buscas, true) then
    exit;

  QuickRep1.Preview;
end;

procedure TfrmCadImpressoras.SpeedButton5Click(Sender: TObject);
begin
  inherited;

  if ObImpressoras.restauraLixeira then
  begin
    if ObImpressoras.StatusLixeira then
      lixeiraVazia(false)
    else
    begin
      lixeiraVazia(true);
      ObImpressoras.abreImpressoras;
    end;
  end;

end;

end.

