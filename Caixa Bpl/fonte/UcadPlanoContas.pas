unit UcadPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, UClassesCadastrosBasicosCx, DBCtrls, QuickRpt,
  QRCtrls;

type
  TfrmCadPlanoContas = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBComboBox3: TDBComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    PageControl4: TPageControl;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox7: TGroupBox;
    Label19: TLabel;
    DBEdit5: TDBEdit;
    Label20: TLabel;
    DBEdit6: TDBEdit;
    Label21: TLabel;
    DBEdit7: TDBEdit;
    PageControl5: TPageControl;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    GroupBox8: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    GroupBox9: TGroupBox;
    DBGrid4: TDBGrid;
    Label28: TLabel;
    Label29: TLabel;
    TabSheet13: TTabSheet;
    PageControl6: TPageControl;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    GroupBox10: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    GroupBox11: TGroupBox;
    DBGrid5: TDBGrid;
    Tabsheet16: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel17: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRShape6: TQRShape;
    TabSheet17: TTabSheet;
    TabSheet18: TTabSheet;
    PageControl7: TPageControl;
    TabSheet19: TTabSheet;
    GroupBox12: TGroupBox;
    DBGrid6: TDBGrid;
    TabSheet20: TTabSheet;
    GroupBox13: TGroupBox;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    Label37: TLabel;
    Label38: TLabel;
    PageControl8: TPageControl;
    TabSheet21: TTabSheet;
    TabSheet22: TTabSheet;
    GroupBox14: TGroupBox;
    DBGrid7: TDBGrid;
    GroupBox15: TGroupBox;
    Label39: TLabel;
    DBEdit17: TDBEdit;
    Label40: TLabel;
    DBEdit18: TDBEdit;
    TabSheet23: TTabSheet;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    DBGrid8: TDBGrid;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBComboBox4: TDBComboBox;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    Label49: TLabel;
    CheckBox2: TCheckBox;
    Label51: TLabel;
    DBEdit19: TDBEdit;
    Label52: TLabel;
    DBEdit20: TDBEdit;
    SpeedButton9: TSpeedButton;
    GroupBox19: TGroupBox;
    Label50: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    GroupBox20: TGroupBox;
    Label56: TLabel;
    Label57: TLabel;
    DBEdit23: TDBEdit;
    Label58: TLabel;
    Label59: TLabel;
    DBEdit24: TDBEdit;
    Label60: TLabel;
    DBComboBox5: TDBComboBox;
    imgInormationGrupo: TImage;
    Label61: TLabel;
    DBComboBox6: TDBComboBox;
    Label62: TLabel;
    Label63: TLabel;
    DBComboBox7: TDBComboBox;
    Panel4: TPanel;
    Label41: TLabel;
    Label64: TLabel;
    Panel5: TPanel;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn47: TBitBtn;
    Panel6: TPanel;
    GroupBox18: TGroupBox;
    DBGrid9: TDBGrid;
    BitBtn45: TBitBtn;
    Panel7: TPanel;
    Label45: TLabel;
    Label44: TLabel;
    Panel8: TPanel;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    Panel9: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    Panel10: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    Panel11: TPanel;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    Panel12: TPanel;
    Label42: TLabel;
    Panel13: TPanel;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    Panel14: TPanel;
    Label43: TLabel;
    Panel15: TPanel;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    Panel16: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel17: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    Panel18: TPanel;
    BitBtn12: TBitBtn;
    BitBtn27: TBitBtn;
    Panel19: TPanel;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    Panel20: TPanel;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    Panel21: TPanel;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    lbEstornarVale: TLabel;
    DBComboBoxEstornarVale: TDBComboBox;
    BitBtn46: TBitBtn;
    Label65: TLabel;
    DBComboBoxRateioEmpresas: TDBComboBox;
    DBEdit26: TDBEdit;
    GroupBox21: TGroupBox;
    PageControl9: TPageControl;
    TabSheet24: TTabSheet;
    TabSheet25: TTabSheet;
    Panel22: TPanel;
    DBGrid10: TDBGrid;
    Panel23: TPanel;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    pnCadPcontasClientes: TPanel;
    Panel24: TPanel;
    Label66: TLabel;
    DBEdit25: TDBEdit;
    DBLookupComboBox8: TDBLookupComboBox;
    Panel25: TPanel;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure BitBtn50Click(Sender: TObject);
    procedure pnCadPcontasClientesEnter(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure DBEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBComboBoxEstornarValeExit(Sender: TObject);
    procedure DBComboBox7Exit(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BitBtn45Click(Sender: TObject);
    procedure DBComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure checarTipoContas(pAtualizar: boolean = false);
    procedure setarTipoContas;
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  frmCadPlanoContas: TfrmCadPlanoContas;
  ObPConta : TPlanoContas;
  NPConta : string;

implementation

uses
  uDtmAtivo, UDtmCadastrosBasicosCx, uDataSet_OOP, uDadosIni, DB;


{$R *.dfm}

procedure TfrmCadPlanoContas.BitBtn10Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG028', 'EDITAR GRUPOS DE PLANO DE CONTAS ','','GRUPOS_CT',
  ObPConta.vGrupoPC.dataSet.FieldByName('GRUP_CT').AsString+' '+ObPConta.vGrupoPC.dataSet.FieldByName('DESC_GR').AsString,ObPConta.vGrupoPC.buscas , true) then
     exit;

  if ObPConta.vGrupoPC.IsEmpty then
  begin
     Application.MessageBox('Grupo não selecionado.','Atenção',MB_ICONINFORMATION + MB_OK );
     exit;
  end;

  if not ObPConta.vGrupoPC.Edit then
    exit;

  TabSheet7.TabVisible := True;
  PageControl2.ActivePage := TabSheet7;
  TabSheet6.TabVisible := False;
  DBEdit2.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn11Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG029', 'EXCLUIR GRUPOS DE PLANO DE CONTAS ','','GRUPOS_CT',
  ObPConta.vGrupoPC.dataSet.FieldByName('GRUP_CT').AsString+' '+ObPConta.vGrupoPC.dataSet.FieldByName('DESC_GR').AsString,ObPConta.vGrupoPC.buscas , true) then
     exit;

  ObPConta.vGrupoPC.Delete;
end;

procedure TfrmCadPlanoContas.BitBtn12Click(Sender: TObject);
begin
  inherited;

  ObPConta.vRateioDpto.Post( ObPConta.vDptoGrupoPC.dataSet.FieldByName('Cod_Dep').AsString);

  TabSheet15.TabVisible := False;
  PageControl6.ActivePage := TabSheet14;
  TabSheet14.TabVisible := True;
  if (Self.Enabled) and (Self.Visible) and (BitBtn31.CanFocus) then
  	BitBtn31.SetFocus;
  DBLookupComboBox5.Enabled := True;
end;

procedure TfrmCadPlanoContas.BitBtn13Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG030', 'SAIR DO GRUPOS DE PLANO DE CONTAS ','','GRUPOS_CT','' ,ObPConta.vGrupoPC.buscas , true) then
   exit;

  TabSheet4.TabVisible := False;
//  TabSheet1.TabVisible := False;
//  TabSheet2.TabVisible := True;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
  Panel3.Visible := True;


end;

procedure TfrmCadPlanoContas.BitBtn14Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG033', 'INCLUIR SUB GRUPOS DE PLANO DE CONTAS ','','SUB_GRUP_CT','' ,ObPConta.vSubGrupoPC.buscas , true) then
     exit;

  if not ObPConta.vSubGrupoPC.Insert then
    exit;

  TabSheet10.TabVisible := True;
  PageControl2.ActivePage := TabSheet10;
  TabSheet9.TabVisible := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
  	DBEdit5.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn15Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG034', 'EDITAR SUB GRUPOS DE PLANO DE CONTAS ','','SUB_GRUP_CT',
  ObPConta.vSubGrupoPC.dataSet.FieldByName('COD_SUB_CT').AsString+' '+ObPConta.vSubGrupoPC.dataSet.FieldByName('DESC_SUB_CT').AsString,ObPConta.vSubGrupoPC.buscas , true) then
     exit;

  if ObPConta.vSubGrupoPC.IsEmpty then
  begin
     Application.MessageBox('Sub Grupo não selecionado.','Atenção',MB_ICONINFORMATION + MB_OK );
     exit;
  end;

  if not ObPConta.vSubGrupoPC.Edit then
    exit;

  TabSheet10.TabVisible := True;
  PageControl2.ActivePage := TabSheet10;
  TabSheet9.TabVisible := False;
  DBEdit5.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
  	DBEdit6.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn16Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG035', 'EXCLUIR SUB GRUPOS DE PLANO DE CONTAS ','','SUB_GRUP_CT',
  ObPConta.vSubGrupoPC.dataSet.FieldByName('COD_SUB_CT').AsString+' '+ObPConta.vSubGrupoPC.dataSet.FieldByName('DESC_SUB_CT').AsString,ObPConta.vSubGrupoPC.buscas , true) then
     exit;

  ObPConta.vSubGrupoPC.Delete;

end;

procedure TfrmCadPlanoContas.BitBtn17Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG036', 'SAIR DO SUB GRUPOS DE PLANO DE CONTAS ','','SUB_GRUP_CT','' ,ObPConta.vSubGrupoPC.buscas , true) then
     exit;

  TabSheet5.TabVisible := False;
//  TabSheet1.TabVisible := False;
//  TabSheet2.TabVisible := True;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
  Panel3.Visible := True;

end;

procedure TfrmCadPlanoContas.BitBtn18Click(Sender: TObject);
begin
  inherited;

  ObPConta.vSubGrupoPC.Post;

  TabSheet9.TabVisible := True;
  PageControl4.ActivePage := TabSheet9;
  TabSheet10.TabVisible := False;
  if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
  	DBGrid3.SetFocus;
  DBEdit5.Enabled := True;
end;

procedure TfrmCadPlanoContas.BitBtn19Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG038', 'CANCELAR SUB GRUPOS DE PLANO DE CONTAS ','','SUB_GRUP_CT','' ,ObPConta.vSubGrupoPC.buscas , true) then
     exit;

  ObPConta.vSubGrupoPC.Cancel;

  TabSheet9.TabVisible := True;
  PageControl4.ActivePage := TabSheet9;
  TabSheet10.TabVisible := False;
  if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
  	DBGrid3.SetFocus;
  DBEdit5.Enabled := True;
end;

procedure TfrmCadPlanoContas.BitBtn1Click(Sender: TObject);
var
 vSqlAdicional: string;
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [CXG017]';

  vDadosIni.abreStatusProcessamento('', 'Abrindo Consulta...');
  if not vDadosIni.PesqPros('CXG014', 'PESQUISAR PLANO DE CONTAS','','P_CONTAS','' ,ObPConta.buscas , true) then
     exit;

  if MaskEdit2.Visible then
  begin
    if not ObPConta.ConsultaCampos('P_CONTAS', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
  begin
    if CheckBox2.Checked then
      vSqlAdicional := ' AND (SELECT COUNT(*) FROM P_CONTAS_BALANCO PBAL ' +
      ' WHERE PBAL.N_CONTA_PLC = P_CONTAS.N_CONTA_PLC AND PBAL.COD_EMPRESA = ' + vDadosIni.codEmpresa + ') = 0'
    else
      vSqlAdicional := '';
    if not ObPConta.ConsultaCampos('P_CONTAS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, vSqlAdicional, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
  end;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadPlanoContas.BitBtn20Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG039', 'INCLUIR DEPARTAMENTOS DE PLANO DE CONTAS ','','DEPART_CT','' ,ObPConta.vDptoGrupoPC.buscas , true) then
     exit;

  if not ObPConta.vDptoGrupoPC.Insert then
     Exit;

  TabSheet12.TabVisible := True;
  PageControl5.ActivePage := TabSheet12;
  TabSheet11.TabVisible := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
  	DBEdit9.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn21Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG040', 'EDITAR DEPARTAMENTOS DE PLANO DE CONTAS ','','DEPART_CT',
  ObPConta.vDptoGrupoPC.dataSet.FieldByName('COD_DEP').AsString+' '+ObPConta.vDptoGrupoPC.dataSet.FieldByName('DESC_DEP').AsString,ObPConta.vDptoGrupoPC.buscas , true) then
     exit;

  if ObPConta.vDptoGrupoPC.IsEmpty then
  begin
     Application.MessageBox('Departamento não selecionado.','Atenção',MB_ICONINFORMATION + MB_OK );
     exit;
  end;

  if not ObPConta.vDptoGrupoPC.Edit then
     exit;

  TabSheet12.TabVisible := True;
  PageControl5.ActivePage := TabSheet12;
  TabSheet11.TabVisible := False;
  DBEdit9.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
  	DBEdit10.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn22Click(Sender: TObject);
begin
  inherited;

  ObPConta.vDptoGrupoPC.Post;

  TabSheet11.TabVisible := True;
  PageControl5.ActivePage := TabSheet11;
  TabSheet12.TabVisible := False;
  if (Self.Enabled) and (Self.Visible) and (BitBtn26.CanFocus) then
  	BitBtn26.SetFocus;
  DBEdit9.Enabled := True;
end;

procedure TfrmCadPlanoContas.BitBtn23Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG045', 'CANCELAR DEPARTAMENTOS DE PLANO DE CONTAS ','','DEPART_CT','' ,ObPConta.vDptoGrupoPC.buscas , true) then
     exit;

  ObPConta.vDptoGrupoPC.Cancel;

  TabSheet11.TabVisible := True;
  PageControl5.ActivePage := TabSheet11;
  TabSheet12.TabVisible := False;
  if (Self.Enabled) and (Self.Visible) and (BitBtn26.CanFocus) then
  	BitBtn26.SetFocus;
  DBEdit9.Enabled := True;
end;

procedure TfrmCadPlanoContas.BitBtn24Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG041', 'EXCLUIR DEPARTAMENTOS DE PLANO DE CONTAS ','','DEPART_CT',
  ObPConta.vDptoGrupoPC.dataSet.FieldByName('COD_DEP').AsString+' '+ObPConta.vDptoGrupoPC.dataSet.FieldByName('DESC_DEP').AsString ,ObPConta.vDptoGrupoPC.buscas , true) then
     exit;

  ObPConta.vDptoGrupoPC.Delete;

end;

procedure TfrmCadPlanoContas.BitBtn25Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG042', 'ACESSO AS REGRAS DE RATEIO DO DEPARTAMENTOS DE PLANO DE CONTAS ','','REL_DPTO',
  	ObPConta.vDptoGrupoPC.dataSet.FieldByName('COD_DEP').AsString+' '+ObPConta.vDptoGrupoPC.dataSet.FieldByName('DESC_DEP').AsString ,ObPConta.vRateioDpto.buscas , true) then
      exit;

  if ObPConta.vDptoGrupoPC.dataSet.IsEmpty then
  begin
    Application.MessageBox('Departamento não selecionado, verifique!','Atenção',MB_ICONWARNING + MB_OK);
    exit;
  end;

  if ObPConta.vDptoGrupoPC.dataSet.FieldByName('Tp_Dep').AsString <> 'I' then
    Application.MessageBox('Departamento com configuração incompatível para ser origem de rateio.','Atenção',MB_ICONINFORMATION + MB_OK)
  else
  begin
    TabSheet13.TabVisible := True;
    PageControl5.ActivePage := TabSheet13;
    TabSheet11.TabVisible := False;

    if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
      DBGrid5.SetFocus;
      
    ObPConta.vRateioDpto.abreRateioDpto( ObPConta.vDptoGrupoPC.dataSet.FieldByName('Cod_dep').AsString );

    Label30.Caption := ObPConta.vDptoGrupoPC.dataSet.FieldByName('cod_dep').AsString + ' - '+
                       ObPConta.vDptoGrupoPC.dataSet.FieldByName('desc_dep').AsString;

    Label44.Caption := ObPConta.vDptoGrupoPC.dataSet.FieldByName('cod_dep').AsString + ' - '+
                       ObPConta.vDptoGrupoPC.dataSet.FieldByName('desc_dep').AsString;
  end;

end;

procedure TfrmCadPlanoContas.BitBtn26Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG043', 'SAIR DO DEPARTAMENTOS DE PLANO DE CONTAS ','','DEPART_CT','' ,ObPConta.vDptoGrupoPC.buscas , true) then
     exit;

  TabSheet8.TabVisible := False;
//  TabSheet1.TabVisible := False;
//  TabSheet2.TabVisible := True;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
  Panel3.Visible := True;
end;

procedure TfrmCadPlanoContas.BitBtn27Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG051', 'CANCELAR RATEIO DO DEPARTAMENTOS DE PLANO DE CONTAS ','','REL_DPTO','' ,ObPConta.vRateioDpto.buscas , true) then
     exit;

  ObPConta.vRateioDpto.Cancel;

  TabSheet15.TabVisible := False;
  PageControl6.ActivePage := TabSheet14;
  TabSheet14.TabVisible := True;
  if (Self.Enabled) and (Self.Visible) and (BitBtn31.CanFocus) then
  	BitBtn31.SetFocus;
  DBLookupComboBox5.Enabled := True;
end;

procedure TfrmCadPlanoContas.BitBtn28Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG046', 'INSERIR RATEIO DO DEPARTAMENTOS DE PLANO DE CONTAS ','','REL_DPTO','' ,ObPConta.vRateioDpto.buscas , true) then
     exit;

  if not ObPConta.vRateioDpto.Insert then
     exit;

  TabSheet15.TabVisible := True;
  PageControl6.ActivePage := TabSheet15;
  TabSheet14.TabVisible := False;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox5.CanFocus) then
  	DBLookupComboBox5.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn29Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG047', 'EDITAR RATEIO DO DEPARTAMENTOS DE PLANO DE CONTAS ','','REL_DPTO',
  ObPConta.vRateioDpto.dataset.fieldbyname('COD_DEP').asstring+' '+ObPConta.vRateioDpto.dataset.fieldbyname('COD_DEPRAT').asstring,
  ObPConta.vRateioDpto.buscas , true) then
     exit;


  if ObPConta.vRateioDpto.IsEmpty then
  begin
     Application.MessageBox('Rateio não selecionado.','Atenção',MB_ICONINFORMATION + MB_OK );
     exit;
  end;

  if not ObPConta.vRateioDpto.Edit then
     exit;

  TabSheet15.TabVisible := True;
  PageControl6.ActivePage := TabSheet15;
  TabSheet14.TabVisible := False;
  DBLookupComboBox5.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
  	DBEdit12.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn2Click(Sender: TObject);
begin
  inherited;
//  if not vDadosIni.PesqPros('CXG026', 'SAIR PLANO DE CONTAS','','P_CONTAS','' ,ObPConta.buscas , true) then
//     exit;

end;

procedure TfrmCadPlanoContas.BitBtn30Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG048', 'EXCLUIR RATEIO DO DEPARTAMENTOS DE PLANO DE CONTAS ','','REL_DPTO',
  ObPConta.vRateioDpto.dataset.fieldbyname('COD_DEP').asstring+' '+ObPConta.vRateioDpto.dataset.fieldbyname('COD_DEPRAT').asstring,ObPConta.vRateioDpto.buscas , true) then
     exit;

  ObPConta.vRateioDpto.Delete;
end;

procedure TfrmCadPlanoContas.BitBtn31Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG049', 'SAIR DO RATEIO DO DEPARTAMENTOS DE PLANO DE CONTAS ','','REL_DPTO','' ,ObPConta.vRateioDpto.buscas , true) then
     exit;

  TabSheet11.TabVisible := True;
  TabSheet13.TabVisible := False;
  PageControl5.ActivePage := TabSheet11;
  if (Self.Enabled) and (Self.Visible) and (BitBtn26.CanFocus) then
  	BitBtn26.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn32Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG055', 'INCLUIR VINCULO DE PLANO DE CONTAS ','','CONTAS_REL_ORIGEM','' ,ObPConta.vRateioContas.buscas , true) then
     exit;

  if not ObPConta.vRateioContas.Insert then
    exit;

  TabSheet20.TabVisible := True;
  PageControl7.ActivePage := TabSheet20;
  TabSheet19.TabVisible := False;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
  	DBLookupComboBox6.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn33Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG056', 'EXCLUIR VINCULO DE PLANO DE CONTAS ','','CONTAS_REL_ORIGEM',
  ObPConta.vRateioContas.dataSet.FieldByName('N_CONTA_PLC_OR').AsString+' '+
  ObPConta.vRateioContas.dataSet.FieldByName('N_CONTA_PLC_VAL').AsString+' '+
  ObPConta.vRateioContas.dataSet.FieldByName('N_CONTA_DEST').AsString,ObPConta.vRateioContas.buscas , true) then
   exit;

  ObPConta.vRateioContas.Delete;

end;

procedure TfrmCadPlanoContas.BitBtn34Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG057', 'SAIR DO CADASTRO DE VINCULO DE PLANO DE CONTAS ','','CONTAS_REL_ORIGEM','' ,ObPConta.vRateioContas.buscas , true) then
     exit;

  TabSheet17.TabVisible := False ;
//  TabSheet1.TabVisible := False ;
//  TabSheet2.TabVisible := True;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
  Panel3.Visible := True;

end;

procedure TfrmCadPlanoContas.BitBtn35Click(Sender: TObject);
begin
  inherited;
  ObPConta.vRateioContas.Post;

  TabSheet19.TabVisible := True;
  PageControl7.ActivePage := TabSheet19;
  TabSheet20.TabVisible := False;

  if (Self.Enabled) and (Self.Visible) and (BitBtn34.CanFocus) then
  	BitBtn34.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn36Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG059', 'CANCELAR VINCULO DE PLANO DE CONTAS ','','CONTAS_REL_ORIGEM','' ,ObPConta.vRateioContas.buscas , true) then
     exit;

  ObPConta.vRateioContas.Cancel;

  TabSheet19.TabVisible := True;
  PageControl7.ActivePage := TabSheet19;
  TabSheet20.TabVisible := False;

  if (Self.Enabled) and (Self.Visible) and (BitBtn34.CanFocus) then
  	BitBtn34.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn37Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG061', 'INCLUIR HISTORICO DE PLANO DE CONTAS ','','HISTORICO_P_CONTAS','' ,ObPConta.vHistPContas.buscas , true) then
     exit;

  if not ObPConta.vHistPContas.Insert then
    exit;

  TabSheet22.TabVisible := True;
  PageControl8.ActivePage := TabSheet22;
  TabSheet21.TabVisible := False;

  ObPConta.vHistPContas.dataSet.FieldByName('NUMERO_CONTA').AsString := ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString; 

  if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
  	DBEdit18.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn38Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG062', 'EDITAR HISTORICO DE PLANO DE CONTAS ','','HISTORICO_P_CONTAS',
  ObPConta.vHistPContas.dataset.fieldbyname('HISTORICO').asstring,ObPConta.vHistPContas.buscas , true) then
     exit;

  if ObPConta.vHistPContas.IsEmpty then
  begin
     Application.MessageBox('Histórico não selecionado.','Atenção',MB_ICONINFORMATION + MB_OK );
     exit;
  end;


  if not ObPConta.vHistPContas.Edit then
    exit;

  TabSheet22.TabVisible := True;
  PageControl8.ActivePage := TabSheet22;
  TabSheet21.TabVisible := False;

  if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
  	DBEdit18.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn39Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG063', 'EXCLUIR HISTORICO DE PLANO DE CONTAS ','','HISTORICO_P_CONTAS',
  ObPConta.vHistPContas.dataset.fieldbyname('HISTORICO').asstring,ObPConta.vHistPContas.buscas , true) then
     exit;

  ObPConta.vHistPContas.Delete;
end;

procedure TfrmCadPlanoContas.BitBtn3Click(Sender: TObject);
begin

  if not vDadosIni.PesqPros('CXG052', 'INCLUIR PLANO CONTAS','','P_CONTAS','' ,ObPConta.buscas , true) then
     exit;

  ActiveControl := BitBtn3;

  if not ObPConta.Insert then
    exit;

  inherited;

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  PageControl9.ActivePage := TabSheet24;

  setarTipoContas;

  GroupBox21.Visible := false;
  Label66.Enabled := false;
  DBEdit25.Enabled := false;
  DBLookupComboBox8.Enabled := false;
  DBEdit1.Enabled := true;

  TabSheet3.TabVisible := true;
  if (vDadosIni.vRegistro.vSisGestor) then
	TabSheet23.TabVisible := true;
  Panel6.Visible := false;
  Label64.Visible := ObPConta.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
  Label41.Caption := '';
  Label65.Visible := (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  DBComboBoxRateioEmpresas.Visible := (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));

	if ObPConta.dataSet.FieldByName('CONTA_REFERENCIA').AsString = 'S' then
  	DBComboBox6.ItemIndex := 0
  else
  	DBComboBox6.ItemIndex := 1;

  if ObPConta.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
  	DBComboBox7.ItemIndex := 0
  else
  	DBComboBox7.ItemIndex := 1;
    
  if ObPConta.dataSet.FieldByName('ESTORNAR_VALE').AsString = 'S' then
	  DBComboBoxEstornarVale.ItemIndex := 0
  else
  	DBComboBoxEstornarVale.ItemIndex := 1;

  if ObPConta.dataSet.FieldByName('RATEIO_EMPRESA').AsString = 'S' then
	  DBComboBoxRateioEmpresas.ItemIndex := 0
  else
  	DBComboBoxRateioEmpresas.ItemIndex := 1;
    
//  DBComboBox7.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then  
    DBEdit1.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn40Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG064', 'SAIR DO CADASTRO DE HISTORICO DE PLANO DE CONTAS ','','HISTORICO_P_CONTAS','' ,ObPConta.vHistPContas.buscas , true) then
     exit;

  TabSheet18.TabVisible := False;
//  TabSheet1.TabVisible := False;
//  TabSheet2.TabVisible := True;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
  Panel3.Visible := True;

end;

procedure TfrmCadPlanoContas.BitBtn41Click(Sender: TObject);
begin
  inherited;
  ObPConta.vHistPContas.Post;

  TabSheet21.TabVisible := True;
  PageControl8.ActivePage := TabSheet21;
  TabSheet22.TabVisible := False;

  if (Self.Enabled) and (Self.Visible) and (BitBtn40.CanFocus) then
  	BitBtn40.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn42Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG066', 'CANCELAR HISTORICO DE PLANO DE CONTAS ','','HISTORICO_P_CONTAS','' ,ObPConta.vHistPContas.buscas , true) then
     exit;

  ObPConta.vHistPContas.Cancel;

  TabSheet21.TabVisible := True;
  PageControl8.ActivePage := TabSheet21;
  TabSheet22.TabVisible := False;

  if (Self.Enabled) and (Self.Visible) and (BitBtn40.CanFocus) then
  	BitBtn40.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn43Click(Sender: TObject);
begin
  inherited;

  if ObPConta.vBalanco.dataSet.IsEmpty then
  begin
     Application.MessageBox('Balanço não selecionado, verifique!','Atenção',MB_ICONWARNING + MB_OK );
     Exit;
  end;

  if not vDadosIni.PesqPros('CXG068', 'INSERIR VINCULOS DE PLANO DE CONTAS COM BALANCO',
     'NUM.CONTA: '+ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString +
     'COD.BALANCO: '+ ObPConta.vBalanco.dataSet.FieldByName('codseq_balanco').AsString,
    'P_CONTAS_BALANCO','' ,ObPConta.vPContaBalanco.buscas , true) then
   exit;

  if ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsFloat <= 0 then
  begin
     Application.MessageBox('Número da conta não informado.','Atenção',MB_ICONINFORMATION + MB_OK );
     PageControl3.ActivePage := TabSheet3;
     if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
       DBEdit1.SetFocus;
     exit;
  end;

  if ObPConta.vPContaBalanco.dataSet.Locate('N_CONTA_PLC; CODSEQ_BALANCO; COD_EMPRESA',
  		VarArrayOf([ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsFloat,
      ObPConta.vBalanco.dataSet.FieldByName('CODSEQ_BALANCO').AsInteger,
      vDadosIni.codEmpresa]), []) then
  begin
    Application.MessageBox('Sequência de Balanço já existe para esta Conta','Atenção', MB_ICONINFORMATION + MB_OK );
    Exit;
  end;

  if not ObPConta.vPContaBalanco.Insert then
     Exit;

  ObPConta.vPContaBalanco.post(ObPConta.vBalanco.dataSet.FieldByName('Codseq_balanco').AsString);
  if (Self.Enabled) and (Self.Visible) and (DBGrid8.CanFocus) then
  	DBGrid8.SetFocus;
end;

procedure TfrmCadPlanoContas.BitBtn44Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG069', 'EXCLUIR VINCULOS DE PLANO DE CONTAS COM BALANCO',
    'NUM.CONTA: '+ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString +
    'COD.BALANCO: '+ ObPConta.vPContaBalanco.dataSet.FieldByName('CODSEQ_BALANCO').AsString,
   'P_CONTAS_BALANCO','' ,ObPConta.vPContaBalanco.buscas , true) then
     exit;

  ObPConta.vPContaBalanco.Delete;
end;

procedure TfrmCadPlanoContas.BitBtn45Click(Sender: TObject);
begin
  inherited;
  TabSheet23.TabVisible := False;
//  TabSheet1.TabVisible := False;
//  TabSheet2.TabVisible := True;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;

  Panel3.Visible := True;
end;

procedure TfrmCadPlanoContas.BitBtn46Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG117', 'DESATIVAR VINCULO COM O BALANCO',
  	 'NUM.CONTA: '+ ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString,
    'P_CONTAS', '',ObPConta.buscas , true) then
     exit;

  ObPConta.removerAtivarVinculoBalanco;
  Label64.Visible := ObPConta.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S'; 
end;

procedure TfrmCadPlanoContas.BitBtn47Click(Sender: TObject);
begin
  inherited;
   if not vDadosIni.PesqPros('CXG119', 'ATIVAR VINCULO COM O BALANCO',
  	 'NUM.CONTA: '+ ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString,
    'P_CONTAS', '',ObPConta.buscas , true) then
     exit;

  ObPConta.removerAtivarVinculoBalanco(true);
  Label64.Visible := ObPConta.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
end;

procedure TfrmCadPlanoContas.BitBtn48Click(Sender: TObject);
begin
  if not ObPConta.vPlanoContasClientes.Insert(ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsFloat) then
  	exit;

  if not vDadosIni.abreForm('Clientes / Fornecedores - Plano de Contas', pnCadPcontasClientes, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
  	exit;
end;

procedure TfrmCadPlanoContas.BitBtn49Click(Sender: TObject);
begin
  if not ObPConta.vPlanoContasClientes.Delete then
  	exit;
end;

procedure TfrmCadPlanoContas.BitBtn4Click(Sender: TObject);
begin
  if not ObPConta.Post then
    setFocusCampoErro(ObPConta.vNomeCampoErro, ObPConta.vMensagemErro)	
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if ObPConta.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      MudaCor;
    end
    else
    begin
      inherited;
      TabSheet3.TabVisible := false;
      TabSheet23.TabVisible := false;
    end;
  end;

end;

procedure TfrmCadPlanoContas.BitBtn50Click(Sender: TObject);
begin
  if not ObPConta.vPlanoContasClientes.Post then
  begin
  	setFocusCampoErro(ObPConta.vPlanoContasClientes.vNomeCampoErro, ObPConta.vPlanoContasClientes.vMensagemErro);
  	exit;
  end;

  TForm(pnCadPcontasClientes.Parent).ModalResult := IDOK;
end;

procedure TfrmCadPlanoContas.BitBtn51Click(Sender: TObject);
begin
  ObPConta.vPlanoContasClientes.Cancel;

  TForm(pnCadPcontasClientes.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPlanoContas.BitBtn5Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG025', 'CANCELAR PLANO CONTAS','','P_CONTAS','' ,ObPConta.buscas , true) then
     exit;

  ObPConta.Cancel;
  TabSheet3.TabVisible := false;
  TabSheet23.TabVisible := false;
end;

procedure TfrmCadPlanoContas.BitBtn7Click(Sender: TObject);
begin
  inherited;

  if not ObPConta.VerificaDpto(ObPConta.vGrupoPC.dataSet.FieldByName('Cod_Dep').AsString ) then
  begin
    Application.MessageBox('Departamento não encontrado.','Atenção',MB_ICONINFORMATION + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
    	DBLookupComboBox3.SetFocus;
    Exit;
  end;

  ObPConta.vGrupoPC.Post;

  TabSheet7.TabVisible := False;
  PageControl2.ActivePage := TabSheet6;
  TabSheet6.TabVisible := True;
  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
  	DBGrid2.SetFocus;
  DBEdit2.Enabled := True;
end;

procedure TfrmCadPlanoContas.BitBtn8Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG032', 'CANCELAR GRUPOS DE PLANO DE CONTAS ','','GRUPOS_CT','' ,ObPConta.vGrupoPC.buscas , true) then
   exit;

  ObPConta.vGrupoPC.Cancel;

  TabSheet7.TabVisible := False;
  PageControl2.ActivePage := TabSheet6;
  TabSheet6.TabVisible := True;
  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
  	DBGrid2.SetFocus;
  DBEdit2.Enabled := True;
end;

procedure TfrmCadPlanoContas.BitBtn9Click(Sender: TObject);
begin
  inherited;
  
  if not vDadosIni.PesqPros('CXG027', 'INCLUIR GRUPOS DE PLANO DE CONTAS ','','GRUPOS_CT','' ,ObPConta.vGrupoPC.buscas , true) then
     exit;

  if not ObPConta.vGrupoPC.Insert then
    exit;

  TabSheet7.TabVisible := True;
  PageControl2.ActivePage := TabSheet7;
  TabSheet6.TabVisible := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;


procedure TfrmCadPlanoContas.checarTipoContas(pAtualizar: boolean);
begin
  if pAtualizar then
  begin
    if ObPConta.dataSet.FieldByName('TIPO_PLC').AsString = 'E' then
       Label12.Caption := 'Tipo de Entrada:'
    else
       Label12.Caption := 'Tipo da Conta a Pagar :';
    setarTipoContas;
  end
  else
  begin
    if DBComboBox1.ItemIndex = 0 then
    begin
      if (Label12.Caption <> 'Tipo de Entrada:') then
         setarTipoContas;
    end
    else
    begin
      if (Label12.Caption <> 'Tipo da Conta a Pagar :') then
       setarTipoContas;
    end;
  end;
end;

procedure TfrmCadPlanoContas.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if not (ObPConta.dataSet.state in [dsedit,dsinsert]) then
  	exit;
    
  if (ObPConta.dataSet.FieldByName('TIPO_PLC').AsString <> 'S') then
  begin
    if (ObPConta.dataSet.state in [dsedit,dsinsert]) then
    begin
      ObPConta.dataSet.FieldByName('ESTORNAR_VALE').AsString  := 'N';
      ObPConta.dataSet.FieldByName('CPFCGC_FORNECEDOR').Value := Null;
      ObPConta.vFornecedorConta.AbreFornecedor(0);
    end;
    DBComboBoxEstornarVale.Enabled := false;

    Label66.Enabled                := false;
  	DBEdit25.Enabled               := false;
	  DBLookupComboBox8.Enabled      := false;

    if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
    	DBEdit26.SetFocus;
  end
  else
  begin
    DBComboBoxEstornarVale.Enabled := true;

    Label66.Enabled                := true;
  	DBEdit25.Enabled               := true;
	  DBLookupComboBox8.Enabled      := true;

    if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
    	DBEdit25.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
    	DBLookupComboBox8.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
    	DBEdit26.SetFocus;
  end;
  checarTipoContas;
end;

procedure TfrmCadPlanoContas.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadPlanoContas.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (ObPConta.vGrupoPC.dataSet.FieldByName('TIPO_GR').AsString = 'S')
  	or (ObPConta.dataSet.FieldByName('TIPO_CTP').AsString = 'F') then
  begin
    if (ObPConta.dataSet.state in [dsedit,dsinsert]) then
	   ObPConta.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString := 'N';
    DBComboBox7.Enabled := false;
  end
  else
    DBComboBox7.Enabled := true;

  if (ObPConta.vGrupoPC.dataSet.FieldByName('TIPO_GR').AsString = 'S')
  	or (ObPConta.dataSet.FieldByName('TIPO_CTP').AsString = 'F') then
  begin
    if (ObPConta.dataSet.state in [dsedit,dsinsert]) then
	   ObPConta.dataSet.FieldByName('ESTORNAR_VALE').AsString := 'N';
    DBComboBox7.Enabled := false;
  end
  else
    DBComboBox7.Enabled := true;
end;

procedure TfrmCadPlanoContas.DBComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadPlanoContas.DBComboBox3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadPlanoContas.DBComboBox4KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadPlanoContas.DBComboBox7Exit(Sender: TObject);
begin
  inherited;
  if ObPConta.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
    if (ObPConta.dataSet.state in [dsedit,dsinsert]) then
      ObPConta.dataSet.FieldByName('ESTORNAR_VALE').AsString := 'N'; 
end;

procedure TfrmCadPlanoContas.DBComboBoxEstornarValeExit(Sender: TObject);
begin
  inherited;
  if ObPConta.dataSet.FieldByName('ESTORNAR_VALE').AsString = 'S' then
    if (ObPConta.dataSet.state in [dsedit,dsinsert]) then
      ObPConta.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString := 'N';
end;

procedure TfrmCadPlanoContas.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString <> '' then
    begin
      if ObPConta.dataSet.State = dsInsert then
      begin
        if ObPConta.VerificaPlanoContas then
        begin
          Application.MessageBox('Conta já cadastrada.','Atenção', MB_ICONINFORMATION + MB_OK);
          if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
            DBEdit1.SetFocus;
        end;
      end
      else if ObPConta.dataSet.State = dsEdit then
      begin
        if Trim (NPConta) <> Trim (ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString) then
        begin
        	if ObPConta.VerificaPlanoContas then
          begin
            Application.MessageBox('Conta já cadastrada.','Atenção', MB_ICONINFORMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
            	DBEdit1.SetFocus;
          end;
        end;
      end;
    end
    else
    begin
      Application.MessageBox('Campo vazio.','Atenção', MB_ICONINFORMATION + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      	DBEdit1.SetFocus;
    end;
  end;
end;

procedure TfrmCadPlanoContas.DBEdit25Exit(Sender: TObject);
begin
  inherited;
  if not (ObPConta.vPlanoContasClientes.dataSet.state in [dsedit,dsinsert]) then
  	exit;

	if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
  	if trim(ObPConta.vPlanoContasClientes.dataSet.FieldByName('CPFCGC').AsString) = '' then
    begin
    	ObPConta.vFornecedorConta.AbreFornecedor(0);
    	exit;
    end;

    if not ObPConta.vFornecedorConta.AbreFornecedor(
    	trim(ObPConta.vPlanoContasClientes.dataSet.FieldByName('CPFCGC').AsString)) then
    begin
    	Application.MessageBox('Cliente / Fornecedor não encontrado.','Atenção',MB_ICONINFORMATION + MB_OK );
      if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
      	DBEdit25.SetFocus;
	    exit;
    end;
  end;
end;

procedure TfrmCadPlanoContas.DBEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	vCodCliente: string;
begin
	if not (ObPConta.dataSet.state in [dsedit,dsinsert]) then
  	exit;
    
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vCodCliente := trim(vDadosIni.pesquisaRapida('CLIENTES', ' and (CLIENTES.TIPO=''F'' or CLIENTES.TIPO=''A'') ', 'Consulta de Fornecedores'));
      if trim(vCodCliente) <> '' then
      begin
      	ObPConta.vFornecedorConta.AbreFornecedor(StrToInt(vCodCliente));

        if ObPConta.vFornecedorConta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
		      ObPConta.vPlanoContasClientes.dataSet.FieldByName('CPFCGC').AsString := trim(ObPConta.vFornecedorConta.dataSet.FieldByName('CPFCGC').AsString);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadPlanoContas.DBEdit2Exit(Sender: TObject);
begin
  inherited;

  if DBEdit2.Enabled <> False then
  begin
    if (ActiveControl <> BitBtn8) then
    begin
      if ObPConta.vGrupoPC.dataSet.FieldByName('Grup_ct').AsString <> '' then
      begin
        if ObPConta.VerificaGrupoPC( Trim (ObPConta.vGrupoPC.dataSet.FieldByName('Grup_ct').AsString) )  then
        begin
          Application.MessageBox('Grupo já cadastrado.','Atenção',MB_ICONINFORMATION + MB_OK);
          if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
        end;
      end
      else
      begin
        Application.MessageBox('Campo vazio.','Atenção',MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadPlanoContas.DBEdit3Exit(Sender: TObject);
begin
  inherited;

  if ObPConta.dataSet.State <> dsedit then
  begin
   if pos(' ', ObPConta.dataSet.FieldByName('DESC_PLC').AsString) > 0 then
     ObPConta.dataSet.FieldByName('DESC_PADR').AsString := copy( ObPConta.dataSet.FieldByName('DESC_PLC').AsString, 1, pos(' ', ObPConta.dataSet.FieldByName('DESC_PLC').AsString ))
   else
     ObPConta.dataSet.FieldByName('DESC_PADR').AsString := ObPConta.dataSet.FieldByName('DESC_PLC').AsString;
  end;

end;

procedure TfrmCadPlanoContas.DBEdit5Exit(Sender: TObject);
begin
  inherited;

  if DBEdit5.Enabled <> False then
  begin
    if (ActiveControl <> BitBtn19) then
    begin
      if ObPConta.vSubGrupoPC.dataSet.FieldByName('cod_sub_ct').AsString <> '' then
      begin
        if ObPConta.VerificaSubGrupoPC( Trim(ObPConta.vSubGrupoPC.dataSet.FieldByName('cod_sub_ct').AsString) ) then
        begin
          Application.MessageBox('Sub Grupo já cadastrado.','Atenção', MB_ICONINFORMATION + MB_OK);
          if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
          	DBEdit5.SetFocus;
        end;
      end
      else
      begin
        Application.MessageBox('Campo vazio.','Atenção', MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
        	DBEdit5.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadPlanoContas.DBEdit9Exit(Sender: TObject);
begin
  inherited;

  if DBEdit9.Enabled <> False then
  begin
    if (ActiveControl <> BitBtn23) then
    begin
      if ObPConta.vDptoGrupoPC.dataSet.FieldByName('Cod_Dep').AsString <> '' then
      begin
        if ObPConta.VerificaDpto( Trim(ObPConta.vDptoGrupoPC.dataSet.FieldByName('Cod_Dep').AsString) ) then
        begin
          Application.MessageBox('Departamento já cadastrado.','Atenção', MB_ICONINFORMATION + MB_OK);
          if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
          	DBEdit9.SetFocus;
        end;
      end
      else
      begin
        Application.MessageBox('Campo vazio.','Atenção', MB_ICONINFORMATION + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
        	DBEdit9.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadPlanoContas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton1Click(Sender)
  else if (key = VK_DELETE) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) and (PageControl1.ActivePage = TabSheet2) then
  	BitBtn3Click(Sender);
end;

procedure TfrmCadPlanoContas.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     BitBtn10Click(Sender);

end;

procedure TfrmCadPlanoContas.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     BitBtn15Click(Sender);

end;

procedure TfrmCadPlanoContas.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     BitBtn21Click(Sender);

end;

procedure TfrmCadPlanoContas.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     BitBtn29Click(Sender);

end;

procedure TfrmCadPlanoContas.DBGrid7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     BitBtn38Click(Sender);

end;

procedure TfrmCadPlanoContas.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  DBComboBox2Exit(Sender);
//  if (ObPConta.vGrupoPC.dataSet.FieldByName('TIPO_GR').AsString = 'S')
//  	or (ObPConta.dataSet.FieldByName('TIPO_CTP').AsString = 'F') then
//  begin
//    if (ObPConta.dataSet.state in [dsedit,dsinsert]) then
//	   ObPConta.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString := 'N';
//    DBComboBox7.Enabled := false;
//  end
//  else
//    DBComboBox7.Enabled := true;
end;

procedure TfrmCadPlanoContas.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

  if ObPConta.dataSet.FieldByName('Grup_ct').AsString <> '' then
  begin
     if ObPConta.vGrupoPC.abreGrupoPCRelatorio( ObPConta.dataSet.FieldByName('Grup_ct').AsString ) then
        ObPConta.vDptoGrupoPC.abreDptoRelatorio( ObPConta.vGrupoPC.dataSet.FieldByName('cod_dep').AsString );
  end;

end;

procedure TfrmCadPlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  ObPConta.Cancel;
  ObPConta.RollBackTransacao;
  ObPConta.free;
  Action := caFree;
  frmCadPlanoContas := nil;

end;

procedure TfrmCadPlanoContas.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  ObPConta := TPlanoContas.create;
  DBGrid1.DataSource := DtmCadBasicosCx.dsPlanoContas;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadPlanoContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (key = VK_INSERT) and (PageControl1.ActivePage = TabSheet2) then
      BitBtn3Click(Sender)
  else
  if (key = VK_ESCAPE) and (PageControl3.ActivePage = TabSheet3) then
      BitBtn5Click(Sender);
end;

procedure TfrmCadPlanoContas.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  ObPConta.abrePlanoContas;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicosCx.dsPlanoContas;
    inherited;
    if vCriou = 0 then
    	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CXG017]';
  end;

  if not vDadosIni.validarAcessoEmpresasUnificadas(ObPConta.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    frmCadPlanoContas.fechar := True;
    PostMessage(frmCadPlanoContas.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
  TabSheet8.TabVisible := False;

  TabSheet7.TabVisible := False;
  TabSheet10.TabVisible := False;
  TabSheet12.TabVisible := False;
  TabSheet13.TabVisible := False;
  TabSheet15.TabVisible := False;
  TabSheet16.TabVisible := False;
  TabSheet17.TabVisible := False;
  TabSheet20.TabVisible := False;

  TabSheet18.TabVisible := False;
  TabSheet22.TabVisible := False;
  TabSheet23.TabVisible := False;

  TabSheet24.TabVisible := False;
  TabSheet25.TabVisible := False;

  vdadosini.fechaStatusProcessamento;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "CXG115" SALVAR PLANO DE CONTAS SEM VINCULAR AO BALANCO' + #13 +
    'Processo "CXG137" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (ENTRADA) - EMPRESTIMO' + #13 +
    'Processo "CXG138" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (ENTRADA) - TRANSFERENCIA' + #13 +
    'Processo "CXG139" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (ENTRADA) - OUTRAS RECEITAS' + #13 +
    'Processo "CXG140" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (ENTRADA) - CORRECAO DE SALDO' + #13 +
    'Processo "CXG141" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (SAIDA) - DESPESA' + #13 +
    'Processo "CXG142" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (SAIDA) - FORNECEDOR' + #13 +
    'Processo "CXG143" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (SAIDA) - IMPOSTOS' + #13 +
    'Processo "CXG144" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (SAIDA) - FOLHA DE PAGAMENTO' + #13 +
    'Processo "CXG145" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (SAIDA) - OUTRAS SAIDAS' + #13 +
    'Processo "CXG146" HABILITAR CONSULTA DO FINANCEIRO PLANO DE CONTA (SAIDA) - CORRECAO DE SALDO';

  imgInormationGrupo.Hint := 'O campo "Tipo de Grupo 2" é utlizado no DRE Comparativo. Registro do tipo E ou S ou com descrição contendo a palavra "INVESTIMENTO" serão selecionados no DRE.';

	if vCriou = 0 then
    vCriou := 1;
end;

procedure TfrmCadPlanoContas.pnCadPcontasClientesEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
    DBEdit25.SetFocus;
end;

procedure TfrmCadPlanoContas.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Plano de Contas');
end;

procedure TfrmCadPlanoContas.setarTipoContas;
begin
  if ObPConta.dataSet.FieldByName('TIPO_PLC').AsString = 'E' then
  begin
    Label12.Caption := 'Tipo de Entrada:';
    if not vDadosIni.strIn(Copy(ObPConta.dataSet.FieldByName('TIPO_CTP').AsString, 1, 1), ['E', 'T', 'O', 'Z']) then
      DBComboBox2.Field.AsString := '';
    DBComboBox2.Items.Clear;
    DBComboBox2.Items.Add('E - EMPRESTIMO');
    DBComboBox2.Items.Add('T - TRANSFERENCIA ENTRE EMPRESAS');
    DBComboBox2.Items.Add('O - OUTRAS RECEITAS FINANCEIRAS');
    DBComboBox2.Items.Add('Z - CORRECAO DE SALDO');
  end
  else
  begin
    Label12.Caption := 'Tipo da Conta a Pagar :';
    if not vDadosIni.strIn(Copy(ObPConta.dataSet.FieldByName('TIPO_CTP').AsString, 1, 1), ['D', 'F', 'I', 'P', 'O', 'Z']) then
      DBComboBox2.Field.AsString := '';
    DBComboBox2.Items.Clear;
    DBComboBox2.Items.Add('D - DESPESA');
    DBComboBox2.Items.Add('F - FORNECEDOR');
    DBComboBox2.Items.Add('I - IMPOSTOS');
    DBComboBox2.Items.Add('P - FOLHA DE PAGAMENTO');
    DBComboBox2.Items.Add('O - OUTRAS SAIDAS');
    DBComboBox2.Items.Add('Z - CORRECAO DE SALDO');
  end;
end;

procedure TfrmCadPlanoContas.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  vDadosIni.abreStatusProcessamento('', 'Abrindo Vinculação de Contas com outras contas para rateio...');
  if ObPConta.dataSet.IsEmpty then
  begin
     Application.MessageBox('Plano de Contas não selecionado, verifique!','Atenção',MB_ICONWARNING + MB_OK);
     exit;
  end;

  if not vDadosIni.PesqPros('CXG054', 'ACESSO AO CADASTRO DE VINCULOS DE PLANO DE CONTAS ','','CONTAS_REL_ORIGEM',
  ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString+' '+ObPConta.dataSet.FieldByName('DESC_PLC').AsString,ObPConta.vRateioContas.buscas , true) then
     exit;

//  TabSheet2.TabVisible := False;
//  TabSheet1.TabVisible := True;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;

  TabSheet17.TabVisible := True;
  PageControl3.ActivePage := TabSheet17;
  if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
  	DBGrid6.SetFocus;

  Panel3.Visible := False;

  Label42.Caption := 'Plano de Conta : ' +ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString + ' - ' +
                                          ObPConta.dataSet.FieldByName('Desc_Plc').AsString;
  Label48.Caption := Label42.Caption;

                                          
  ObPConta.vRateioContas.abreRateioContas;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadPlanoContas.SpeedButton12Click(Sender: TObject);
begin
  inherited;

  if ObPConta.dataSet.IsEmpty then
  begin
     Application.MessageBox('Plano de Contas não selecionado, verifique!','Atenção',MB_ICONWARNING + MB_OK);
     exit;
  end;

  if not vDadosIni.PesqPros('CXG060', 'ACESSO AO CADASTRO DE HISTORICO DE PLANO DE CONTAS ','','HISTORICO_P_CONTAS',
  ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString+' '+ObPConta.dataSet.FieldByName('DESC_PLC').AsString ,ObPConta.vHistPContas.buscas , true) then
     exit;

//  TabSheet2.TabVisible := False;
//  TabSheet1.TabVisible := True;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;

  TabSheet18.TabVisible := True;
  PageControl3.ActivePage := TabSheet18;
  if (Self.Enabled) and (Self.Visible) and (DBGrid7.CanFocus) then
  	DBGrid7.SetFocus;

  Panel3.Visible := False;

  Label43.Caption := 'Plano de Conta : ' +ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString + ' - ' +
                                          ObPConta.dataSet.FieldByName('Desc_Plc').AsString;

  Label49.Caption := 'Plano de Conta : ' +ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString + ' - ' +
                                          ObPConta.dataSet.FieldByName('Desc_Plc').AsString;
  ObPConta.vHistPContas.abreHistPContas;

end;

procedure TfrmCadPlanoContas.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  NPConta := '';
  if not ObPConta.dataSet.IsEmpty then
     NPConta := ObPConta.dataSet.FieldByName('N_Conta_plc').AsString
  else
     Exit;

  if not vDadosIni.PesqPros('CXG016', 'EDITAR PLANO CONTAS','','P_CONTAS',ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString+' '+ObPConta.dataSet.FieldByName('DESC_PLC').AsString,ObPConta.buscas , true) then
     exit;

  if ObPConta.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;

  if not ObPConta.Edit then
    Exit;

  inherited;

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  PageControl9.ActivePage := TabSheet24;

	checarTipoContas(true);

  GroupBox21.Visible        := true;
  Label66.Enabled           := ObPConta.dataSet.FieldByName('TIPO_PLC').AsString = 'S';
  DBEdit25.Enabled          := ObPConta.dataSet.FieldByName('TIPO_PLC').AsString = 'S';
  DBLookupComboBox8.Enabled := ObPConta.dataSet.FieldByName('TIPO_PLC').AsString = 'S';
  DBEdit1.Enabled := false;
  TabSheet3.TabVisible := true;
  if vDadosIni.vRegistro.vSisGestor then
  	 TabSheet23.TabVisible := true;
  Panel6.Visible := false;
  Label64.Visible := ObPConta.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
  Label41.Caption := 'Plano de Conta : ' +ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString + ' - ' +
     ObPConta.dataSet.FieldByName('Desc_Plc').AsString;
  Label65.Visible := (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  DBComboBoxRateioEmpresas.Visible := (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
//  DBComboBox7.Enabled :=  not ((ObPConta.vGrupoPC.dataSet.FieldByName('TIPO_GR').AsString = 'S')
//  	or (ObPConta.dataSet.FieldByName('TIPO_CTP').AsString = 'F'));
  for I := 0 to DBComboBox2.Items.Count - 1 do
   if Copy(DBComboBox2.Items[I], 1, 1) = Copy(ObPConta.dataSet.FieldByName('TIPO_CTP').AsString, 1, 1) then
   begin
     DBComboBox2.ItemIndex := I;
     Break;
   end;

  if ObPConta.dataSet.FieldByName('CONTA_REFERENCIA').AsString = 'S' then
  	DBComboBox6.ItemIndex := 0
  else
  	DBComboBox6.ItemIndex := 1;

  if ObPConta.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
  	DBComboBox7.ItemIndex := 0
  else
  	DBComboBox7.ItemIndex := 1;
    
  if ObPConta.dataSet.FieldByName('ESTORNAR_VALE').AsString = 'S' then
	  DBComboBoxEstornarVale.ItemIndex := 0
  else
  	DBComboBoxEstornarVale.ItemIndex := 1;

  if ObPConta.dataSet.FieldByName('RATEIO_EMPRESA').AsString = 'S' then
	  DBComboBoxRateioEmpresas.ItemIndex := 0
  else
  	DBComboBoxRateioEmpresas.ItemIndex := 1;

  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    DBEdit3.SetFocus;     
end;

procedure TfrmCadPlanoContas.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de vínculo de contas com balanço...');
  if ObPConta.dataSet.IsEmpty then
  begin
     Application.MessageBox('Plano de Contas não selecionado, verifique!','Atenção',MB_ICONWARNING + MB_OK);
     exit;
  end;

  if not vDadosIni.PesqPros('CXG067', 'ACESSO AO CADASTRO DE VINCULOS DE PLANO DE CONTAS COM BALANCO','','P_CONTAS_BALANCO',
  ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString+' '+ObPConta.dataSet.FieldByName('DESC_PLC').AsString,ObPConta.vPContaBalanco.buscas , true) then
     exit;

//  TabSheet2.TabVisible := False;
//  TabSheet1.TabVisible := True;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;

  TabSheet23.TabVisible := True;
  PageControl3.ActivePage := TabSheet23;
  if (Self.Enabled) and (Self.Visible) and (DBGrid8.CanFocus) then
  	DBGrid8.SetFocus;

  Panel3.Visible := False;

  Label41.Caption := 'Plano de Conta : ' +ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString + ' - ' +
                                          ObPConta.dataSet.FieldByName('Desc_Plc').AsString; 
  Panel6.Visible := true;
  ObPConta.vPContaBalanco.abrePContasBalanco;
  Label64.Visible := ObPConta.dataSet.FieldByName('DESAT_VINC_BALANCO').AsString = 'S';
  ObPConta.vPContaBalanco.vComitar := true;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadPlanoContas.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if not ObPConta._replicarPContas then
    exit;

  SpeedButton1Click(Sender);
end;

procedure TfrmCadPlanoContas.SpeedButton25Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG019', 'ABRIR LIXEIRA PLANO CONTAS','','P_CONTAS','' ,ObPConta.buscas , true) then
     exit;

  if not ObPConta.abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CXG017]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [CXG017]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;

end;

procedure TfrmCadPlanoContas.SpeedButton2Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG017', 'EXCLUIR PLANO CONTAS','','P_CONTAS',
  ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString+' '+ObPConta.dataSet.FieldByName('DESC_PLC').AsString,ObPConta.buscas , true) then
     exit;

  if ObPConta.Delete then
  begin
    if ObPConta.StatusLixeira then
    begin
      lixeiraVazia(false);
    end
    else
    begin
      lixeiraVazia(true);
    end;
  end;

end;

procedure TfrmCadPlanoContas.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  if ObPConta.dataSet.IsEmpty then
  begin
     Application.MessageBox('Não existem Contas para Impressão.','Atenção',MB_ICONWARNING + MB_OK);
     exit;
  end;

  if not vDadosIni.PesqPros('CXG018', 'IMPRIMIR PLANO CONTAS','','P_CONTAS','' ,ObPConta.buscas , true) then
     exit;
     
  QuickRep1.Preview;
end;

procedure TfrmCadPlanoContas.SpeedButton5Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG020', 'RECUPERAR REGISTRO DA LIXEIRA DO PLANO CONTAS','','P_CONTAS',ObPConta.dataSet.FieldByName('N_CONTA_PLC').AsString+' '+ObPConta.dataSet.FieldByName('DESC_PLC').AsString ,ObPConta.buscas , true) then
     exit;

  if ObPConta.restauraLixeira then
  begin
    if ObPConta.StatusLixeira then
      lixeiraVazia(false)
    else
    begin
      lixeiraVazia(true);
    end;
  end;

end;

procedure TfrmCadPlanoContas.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG021', 'ACESSO O CADASTRO DE GRUPOS DE PLANO DE CONTAS ','','GRUPOS_CT','' ,ObPConta.vGrupoPC.buscas , true) then
     exit;


//  TabSheet2.TabVisible := False;
//  TabSheet1.TabVisible := True;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;

  TabSheet4.TabVisible := True;
  PageControl3.ActivePage := TabSheet4;
  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
  	DBGrid2.SetFocus;

  Panel3.Visible := False;
  ObPConta.vGrupoPC.abreGrupoPC;

end;

procedure TfrmCadPlanoContas.SpeedButton7Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CXG023', 'ACESSO AO CADASTRO DE DEPARTAMENTOS DE PLANO DE CONTAS ','','DEPART_CT','' ,ObPConta.vDptoGrupoPC.buscas , true) then
     exit;

//  TabSheet2.TabVisible := False;
//  TabSheet1.TabVisible := True;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;

  TabSheet8.TabVisible := True;
  PageControl3.ActivePage := TabSheet8;
  if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
  	DBGrid4.SetFocus;

  Panel3.Visible := False;
  ObPConta.vDptoGrupoPC.abreDptoGrupoPC;
  
end;

procedure TfrmCadPlanoContas.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CXG022', 'ACESSO AO CADASTRO DE SUB GRUPOS DE PLANO DE CONTAS ','','SUB_GRUP_CT','' ,ObPConta.vSubGrupoPC.buscas , true) then
   exit;

//  TabSheet2.TabVisible := False;
//  TabSheet1.TabVisible := True;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;

  TabSheet5.TabVisible := True;
  PageControl3.ActivePage := TabSheet5;
  if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
  	DBGrid3.SetFocus;

  Panel3.Visible := False;
  ObPConta.vSubGrupoPC.abreSubGrupoPC;                            
end;

procedure TfrmCadPlanoContas.SpeedButton9Click(Sender: TObject);
var
  vCodEmpresaMatriz: String;
begin
  inherited;
  if not(ObPConta.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  ObPConta.buscas.Close;
  ObPConta.buscas.SQL.Text := 'select first 1 cod_empresa from empresa where sped_matriz_filial = ''M''';
  ObPConta.buscas.Open;
  vCodEmpresaMatriz:= vDadosIni.retornoPorCondicao(ObPConta.buscas.FieldByName('cod_empresa').AsInteger > 0,
    ObPConta.buscas.FieldByName('cod_empresa').AsString, vDadosIni.codEmpresa);
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL',
    ' and cod_empresa = ' + vCodEmpresaMatriz + ' and IND_CTA = ''A''',
    'Consulta de Plano de Contas Contábil na Matriz: ' + vDadosIni.StrZero(vCodEmpresaMatriz, 3));
  if Trim(vDadosIni.vPesquisa) <> '' then
    ObPConta.dataSet.FieldByName('COD_CTA_CONTABIL').AsString := Trim(vDadosIni.vPesquisa);
end;

end.
