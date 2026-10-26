unit UCadMvaAjustada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, UClassesMvaAjusatada, QRCtrls, grimgctrl, QuickRpt,
  AppEvnts;

type
  TfrmCadMvaAjustada = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    tsRel: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Transportador: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMvaAjustada: TfrmCadMvaAjustada;
  obMvaAjustada: TMvaAjustada;
implementation

uses UDtmMvaAjustada, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadMvaAjustada.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS307', 'PESQUISAR', '',
    'MVA_AJUSTADA_NCM', '', obMvaAjustada.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not obMvaAjustada.ConsultaCampos('MVA_AJUSTADA_NCM', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if not obMvaAjustada.ConsultaCampos('MVA_AJUSTADA_NCM', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadMvaAjustada.BitBtn3Click(Sender: TObject);
begin

  if not obMvaAjustada.Insert then
    exit;

  ActiveControl := BitBtn3;
  inherited;
  obMvaAjustada.vUF.AbreUF;
  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := True;
  TabSheet3.Caption := 'Cadastro de MVA Ajustada.';
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus;
end;

procedure TfrmCadMvaAjustada.BitBtn4Click(Sender: TObject);
begin
  if not obMvaAjustada.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obMvaAjustada.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      MudaCor;
    end
    else begin
      inherited;
    end;
  end;

end;

procedure TfrmCadMvaAjustada.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obMvaAjustada.Cancel;
end;

procedure TfrmCadMvaAjustada.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if (DBEdit1.text = '') or (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    exit;

  if obMvaAjustada.existeNCM(DBEdit1.Text) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
    Application.MessageBox('Código NCM não cadastrado.', 'Atenção', mb_ok + 64);
  end;
end;

procedure TfrmCadMvaAjustada.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    obMvaAjustada.dataSet.FieldByName('COD_NCM').AsString := vDadosIni.pesquisaRapida('NBM');
end;

procedure TfrmCadMvaAjustada.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  obMvaAjustada.CalcualMvaAjustada;
end;

procedure TfrmCadMvaAjustada.DBEdit6Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadMvaAjustada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadMvaAjustada := nil;
end;

procedure TfrmCadMvaAjustada.FormCreate(Sender: TObject);
begin
  inherited;
  obMvaAjustada := TMvaAjustada.create;
end;

procedure TfrmCadMvaAjustada.FormShow(Sender: TObject);
var
  I: integer;
begin
  DBGrid1.DataSource := dtmMvaAjustada.dsMvaAjustada;
  obMvaAjustada.abreMvaAjustda;
  obMvaAjustada.vUF.AbreUF;
  tsRel.TabVisible := false;
  inherited;

  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
      TDBEdit(Components[I]).CharCase := ecUpperCase;
    if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;

end;

procedure TfrmCadMvaAjustada.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relação de MVA Ajustada');
end;

procedure TfrmCadMvaAjustada.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if not obMvaAjustada.Edit then
    exit;
  obMvaAjustada.vUF.AbreUF;
  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := True;
  TabSheet3.Caption := 'Alterando MVA Ajustada.';
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus;
end;

procedure TfrmCadMvaAjustada.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS310', 'EXCLUIR', '', 'MVA_AJUSTADA_NCM',
    obMvaAjustada.dataSet.FieldByName('COD_NCM').AsString, obMvaAjustada.buscas, false) then
    Exit;

  obMvaAjustada.Delete;
end;

procedure TfrmCadMvaAjustada.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS312', 'IMPRIMIR', '', 'MVA_AJUSTADA_NCM',
    obMvaAjustada.dataSet.FieldByName('COD_NCM').AsString, obMvaAjustada.buscas, true) then
    exit;

  obMvaAjustada.vUF.AbreUF;
  QuickRep1.Preview;
end;

end.

