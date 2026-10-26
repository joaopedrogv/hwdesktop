unit UcadControleFaturamento;

interface

uses
  Windows, uClassesCadastrosBasicos, uCadPadraoModal, grimgctrl, QRCtrls, QuickRpt,
  DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids, Controls,
  StdCtrls, Mask, Forms, Classes, AppEvnts, Graphics;

type
  TfrmControleFaturamento = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBComboBox1: TDBComboBox;
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleFaturamento: TfrmControleFaturamento;
  obFaturamento : TControleFaturamento;

implementation

uses
UDtmCadastrosBasicos, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmControleFaturamento.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if MaskEdit2.Visible then
  begin
    if not obFaturamento.ConsultaCampos('TIPO_FATURAMENTO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if obFaturamento.ConsultaCampos('TIPO_FATURAMENTO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmControleFaturamento.BitBtn2Click(Sender: TObject);
begin
  inherited;
  obFaturamento.cancel; 
end;

procedure TfrmControleFaturamento.BitBtn3Click(Sender: TObject);
begin
   if not obFaturamento.Insert then
      exit;

   ActiveControl := BitBtn3;
   inherited;

   PageControl1.ActivePage:=TabSheet1;
   TabSheet3.TabVisible:=True;
   TabSheet3.Caption:= 'Cadastro Condição de Pagamento';
   PageControl3.ActivePage:=TabSheet3;
   if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
   	 DBEdit2.SetFocus;
end;

procedure TfrmControleFaturamento.BitBtn4Click(Sender: TObject);
begin
  if not obFaturamento.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obFaturamento.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmControleFaturamento.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obFaturamento.cancel;
  obFaturamento.abreControleFaturamento;
end;

procedure TfrmControleFaturamento.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:=#0;
end;

procedure TfrmControleFaturamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmControleFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmControleFaturamento := nil;
end;

procedure TfrmControleFaturamento.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obFaturamento := TControleFaturamento.create;
  TabSheet4.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
end;

procedure TfrmControleFaturamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
     BitBtn5Click(Sender);

end;

procedure TfrmControleFaturamento.FormShow(Sender: TObject);
var
  i : Integer;
begin
  TabSheet4.TabVisible:=False;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsContFatura;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  obFaturamento.abreControleFaturamento;
  
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
       TDBEdit(Components[I]).CharCase := ecUpperCase;

    if Components[I] is TDBComboBox then
       TDBComboBox(Components[I]).CharCase := ecUpperCase;   
  end;

  if obFaturamento.StatusLixeira then
     lixeiraVazia(false)
  else
     lixeiraVazia(true);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmControleFaturamento.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório Cadastro de Faturamento');
end;

procedure TfrmControleFaturamento.SpeedButton1Click(Sender: TObject);
begin

  if obFaturamento.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
     exit;

  inherited;
  if not obFaturamento.Edit then
     exit;

  PageControl1.ActivePage:=TabSheet1;
  PageControl3.ActivePage:=Tabsheet3;
  TabSheet3.Caption:= 'Alterando Condição de Pagamento';
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmControleFaturamento.SpeedButton25Click(Sender: TObject);
begin
  inherited;
 if not obFaturamento.AbrirLixeira then
  begin
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;
end;

procedure TfrmControleFaturamento.SpeedButton2Click(Sender: TObject);
begin
  inherited;
if obFaturamento.Delete then
  begin
  if obFaturamento.StatusLixeira then
  begin
      lixeiraVazia(false);
  end else begin
      lixeiraVazia(true);
      obFaturamento.abreControleFaturamento;
  end;
  end;
end;

procedure TfrmControleFaturamento.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  //PageControl1.ActivePage:=TabSheet1;
  //TabSheet4.TabVisible:=True;
  //PageControl3.ActivePage:=TabSheet4;

  QuickRep1.Preview;

end;

procedure TfrmControleFaturamento.SpeedButton5Click(Sender: TObject);
begin
  inherited;
if obFaturamento.restauraLixeira then
begin
 if obFaturamento.StatusLixeira then
      lixeiraVazia(false)
   else begin
      lixeiraVazia(true);
      obFaturamento.abreControleFaturamento;;
   end;
end;
end;

end.
