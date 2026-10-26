unit UTerminalF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, Menus, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  ComCtrls,UClassesFinalizadores, DBCtrls, xhGrid, xhHierCube, AppEvnts;

type
  TFrmTerminalF = class(TfrmCadPadraoM)
    TbSResumoD: TTabSheet;
    ScrollBox7: TScrollBox;
    GroupBox7: TGroupBox;
    TbSFiscVersoes: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    TbSDocNFiscal: TTabSheet;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Panel5: TPanel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    BitBtn12: TBitBtn;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    DBGrid3: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    Label28: TLabel;
    DBEdit22: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit24: TDBEdit;
    Label31: TLabel;
    DBEdit25: TDBEdit;
    Label32: TLabel;
    DBEdit26: TDBEdit;
    Label33: TLabel;
    DBEdit27: TDBEdit;
    Label34: TLabel;
    DBEdit28: TDBEdit;
    Label36: TLabel;
    DBEdit30: TDBEdit;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    DBGrid4: TDBGrid;
    Panel8: TPanel;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    Panel9: TPanel;
    C: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label35: TLabel;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    DBComboBox1: TDBComboBox;
    BitBtn21: TBitBtn;
    tbImprUtilizadas: TTabSheet;
    GroupBox6: TGroupBox;
    DBGrid5: TDBGrid;
    Panel10: TPanel;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    Panel11: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit40: TDBEdit;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    DBComboBox3: TDBComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBComboBox2: TDBComboBox;
    SpeedButton9: TSpeedButton;
    Label49: TLabel;
    DBEdit23: TDBEdit;
    Label50: TLabel;
    DBEdit39: TDBEdit;
    Label51: TLabel;
    DBEdit41: TDBEdit;
    Label52: TLabel;
    BitBtn35: TBitBtn;
    tsVendasPDV: TTabSheet;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    DBGrid6: TDBGrid;
    GroupBox10: TGroupBox;
    DBGrid7: TDBGrid;
    Label53: TLabel;
    Label54: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    tsRel: TTabSheet;
    GroupBox11: TGroupBox;
    DBGrid8: TDBGrid;
    GroupBox12: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    BitBtn39: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn41: TBitBtn;
    Panel12: TPanel;
    BitBtn40: TBitBtn;
    Label57: TLabel;
    DBEdit42: TDBEdit;
    Image1: TImage;
    ReestruturarBanco1: TMenuItem;
    SpeedButton59: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBEdit23Exit(Sender: TObject);
    procedure ReestruturarBanco1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure DBEdit35Exit(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure DBEdit31Exit(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTerminalF: TFrmTerminalF;
  HdConfigImp: THandle;
//  cadTerminais: TTerminaisF;


implementation

uses DBClient, funcoes,uConfiguracoes,UdtmAtivo,UdtmTerminalF, DB,
  UdetalhesResD, USincTerminais, UArqFiscal, uDataSet_OOP, uDadosIni,
  uGTNSerieECF, UArqFrente, uAssistenteDeConfiguracaoFiscal, UvisualizadorOLAP;


{$R *.dfm}

procedure TFrmTerminalF.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM003', 'CONFIRMAR', '','TERMINALF','',cadTerminais.buscas, true) then
    exit;
  if not cadTerminais.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.setfocus;
  end
  else
  begin
    TabSheet3.Visible:=false;
    BitBtn5Click(sender);
  end;
end;

procedure TFrmTerminalF.BitBtn11Click(Sender: TObject);
begin
  inherited;
  cadTerminais.Cancel;
  TabSheet3.Visible:=false;
  BitBtn5Click(sender);
end;

procedure TFrmTerminalF.BitBtn12Click(Sender: TObject);
begin
  inherited;
  BitBtn5Click(sender);
end;

procedure TFrmTerminalF.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM020', 'VISUALIZAR', '','RESUMOD',
  cadTerminais.CadResumoD.dataSet.FieldByName('NSERIEECF').AsString+
  cadTerminais.CadResumoD.dataSet.FieldByName('DATA_MOV').AsString,cadTerminais.CadResumoD.buscas, true) then
   exit;
  cadTerminais.DadosECFAtual;
  cadTerminais.CadResumoD.vnserieecf:=cadTerminais.num_serie;
  if not cadTerminais.CadResumoD.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (dbedit4.CanFocus) then
    	dbedit4.setfocus;
  end
  else
  begin
    Panel5.Enabled:=false;
    Panel4.Enabled:=true;
  end;
end;

procedure TFrmTerminalF.BitBtn14Click(Sender: TObject);
begin
  inherited;
  cadTerminais.CadResumoD.Cancel;
  Panel5.Enabled:=false;
  Panel4.Enabled:=true;
end;

procedure TFrmTerminalF.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM021', 'INCLUIR', '','FISCAL_VERSOES','',
  cadTerminais.SoftFiscal.buscas, true) then
   exit;
  Panel6.Enabled:=false;
  Panel7.Enabled:=true;
  cadTerminais.SoftFiscal.Insert;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
  	DBLookupComboBox2.SetFocus;
end;

procedure TFrmTerminalF.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM022', 'ALTERAR', '','FISCAL_VERSOES',
  cadTerminais.SoftFiscal.dataSet.FieldByName('COD_FISCAL').AsString+
  cadTerminais.SoftFiscal.dataSet.FieldByName('NOME_PAF').AsString+
  cadTerminais.SoftFiscal.dataSet.FieldByName('VERSAO_PAF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;

  Panel6.Enabled:=false;
  Panel7.Enabled:=true;
  cadTerminais.SoftFiscal.Edit;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
  	DBLookupComboBox2.setfocus;
end;

procedure TFrmTerminalF.BitBtn18Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM023', 'EXCLUIR', '','FISCAL_VERSOES',
  cadTerminais.SoftFiscal.dataSet.FieldByName('COD_FISCAL').AsString+
  cadTerminais.SoftFiscal.dataSet.FieldByName('NOME_PAF').AsString+
  cadTerminais.SoftFiscal.dataSet.FieldByName('VERSAO_PAF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;

  cadTerminais.SoftFiscal.Delete;
end;

procedure TFrmTerminalF.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM022', 'CONFIRMAR', '','FISCAL_VERSOES',
  cadTerminais.SoftFiscal.dataSet.FieldByName('COD_FISCAL').AsString+
  cadTerminais.SoftFiscal.dataSet.FieldByName('NOME_PAF').AsString+
  cadTerminais.SoftFiscal.dataSet.FieldByName('VERSAO_PAF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;

  if not cadTerminais.SoftFiscal.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
    	DBLookupComboBox2.setfocus;
  end
  else
  begin
    Panel7.Enabled:=false;
    Panel6.Enabled:=true;
  end;
end;

procedure TFrmTerminalF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM001', 'PESQUISAR', '','TERMINALF','',cadTerminais.buscas, true) then
    exit;
  if MaskEdit2.Visible then
  begin
    if not cadTerminais.ConsultaCampos('TERMINALF',ComboBox1.Text,
    	ComboBox2.text,maskedit1.text,maskedit2.text,vDadosIni.codEmpresa) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      	combobox1.setfocus;
    end;
  end
  else
   if cadTerminais.ConsultaCampos('TERMINALF',MaskEdit3.text,ComboBox1.Text,
    combobox3.Text,ComboBox2.text,true,vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      	ComboBox1.SetFocus;
end;

procedure TFrmTerminalF.BitBtn20Click(Sender: TObject);
begin
  inherited;
 cadTerminais.SoftFiscal.Cancel;
 Panel7.Enabled:=false;
 Panel6.Enabled:=true;
end;

procedure TFrmTerminalF.BitBtn21Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM019', 'VISUALIZAR', '','RESUMOD',
  cadTerminais.CadResumoD.dataSet.FieldByName('NSERIEECF').AsString+
  cadTerminais.CadResumoD.dataSet.FieldByName('DATA_MOV').AsString,cadTerminais.CadResumoD.buscas, true) then
   exit;
 cadTerminais.CadResumoD.cadMapaResumoDetal.vcodterminal:=cadTerminais.dataSet.fieldbyname('COD_TERMINAL').AsInteger;
 cadterminais.CadResumoD.cadMapaResumoDetal.coored:=
 cadTerminais.CadResumoD.dataSet.fieldbyname('COORED').AsInteger; 
 cadTerminais.CadResumoD.cadMapaResumoDetal.abreDetalhes;
 Application.CreateForm(TFrmDetalhesResD,FrmDetalhesResD);
 FrmDetalhesResD.ShowModal;
end;

procedure TFrmTerminalF.BitBtn22Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM026', 'INCLUIR', '','DOC_NAOFISCAL_TERMINAL','',
  cadTerminais.SoftFiscal.buscas, true) then
   exit;

  Panel9.Enabled:=true;
  Panel8.Enabled:=false;
  cadTerminais.CadDocNaofiscal.Insert;
  if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
  	DBEdit29.setfocus;
end;

procedure TFrmTerminalF.BitBtn23Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM027', 'ALTERAR', '','DOC_NAOFISCAL_TERMINAL',
  cadTerminais.CadDocNaofiscal.dataSet.FieldByName('COD_TERMINAL').AsString+
  cadTerminais.CadDocNaofiscal.dataSet.FieldByName('NSERIEECF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;

  Panel9.Enabled:=true;
  Panel8.Enabled:=false;
  cadTerminais.CadDocNaofiscal.Edit;
  DBEdit31.Enabled:=true;
  DBEdit32.Enabled:=true;
  DBEdit35.Enabled:=true;
  if (DBEdit31.Text <> '') and (DBEdit31.Text <> '0') then
  begin
    DBEdit32.Enabled:=false;
    DBEdit35.Enabled:=false;
  end;
  if (dbedit32.Enabled) and
  (DBEdit32.Text <> '') and (DBEdit32.Text <> '0') then
  begin
    DBEdit31.Enabled:=false;
    DBEdit35.Enabled:=false;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end;
  if (DBEdit35.Enabled) and
  (DBEdit35.Text <> '') and (DBEdit35.Text <> '0') then
  begin
    DBEdit31.Enabled:=false;
    DBEdit32.Enabled:=false;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
  	DBEdit29.setfocus;
end;

procedure TFrmTerminalF.BitBtn25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM028', 'EXCLUIR', '','DOC_NAOFISCAL_TERMINAL',
  cadTerminais.CadDocNaofiscal.dataSet.FieldByName('COD_TERMINAL').AsString+
  cadTerminais.CadDocNaofiscal.dataSet.FieldByName('NSERIEECF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;
  cadTerminais.CadDocNaofiscal.Delete;
end;

procedure TFrmTerminalF.BitBtn26Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM029', 'CONFIRMAR', '','DOC_NAOFISCAL_TERMINAL',
  cadTerminais.CadDocNaofiscal.dataSet.FieldByName('COD_TERMINAL').AsString+
  cadTerminais.CadDocNaofiscal.dataSet.FieldByName('NSERIEECF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;
  if not cadTerminais.CadDocNaofiscal.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
    	DBEdit29.setfocus;
  end
  else
  begin
    Panel9.Enabled:=false;
    Panel8.Enabled:=true;
  end;
end;

procedure TFrmTerminalF.BitBtn27Click(Sender: TObject);
begin
  inherited;
 cadTerminais.CadDocNaofiscal.Cancel;
 Panel9.Enabled:=false;
 Panel8.Enabled:=true;
end;

procedure TFrmTerminalF.BitBtn28Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM030', 'INCLUIR', '','TERMINAL_IMPRESSORAS',
  '',cadTerminais.SoftFiscal.buscas, true) then
   exit;

  Panel11.Enabled:=true;
  Panel10.Enabled:=false;
  cadTerminais.CadImpressoraTerm.Insert;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
  	DBLookupComboBox3.setfocus;
end;

procedure TFrmTerminalF.BitBtn29Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM031', 'ALTERAR', '','TERMINAL_IMPRESSORAS',
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('COD_TERMINAL').AsString+
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('IDENT_CNIEE').AsString+
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('NUM_SERIE_ECF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;
  Panel11.Enabled:=true;
  Panel10.Enabled:=false;
  cadTerminais.CadImpressoraTerm.Edit;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
  	DBLookupComboBox3.setfocus;
end;

procedure TFrmTerminalF.BitBtn31Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM032', 'EXCLUIR', '','TERMINAL_IMPRESSORAS',
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('COD_TERMINAL').AsString+
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('IDENT_CNIEE').AsString+
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('NUM_SERIE_ECF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;

  cadTerminais.CadImpressoraTerm.Delete;
end;

procedure TFrmTerminalF.BitBtn32Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM034', 'CONFIRMAR', '','TERMINAL_IMPRESSORAS',
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('COD_TERMINAL').AsString+
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('IDENT_CNIEE').AsString+
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('NUM_SERIE_ECF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;
  if not cadTerminais.CadImpressoraTerm.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
    	DBLookupComboBox3.SetFocus;
  end
  else
  begin
    Panel11.Enabled:=false;
    Panel10.Enabled:=true;
  end;
end;

procedure TFrmTerminalF.BitBtn33Click(Sender: TObject);
begin
  inherited;
 cadTerminais.CadImpressoraTerm.Cancel;
 Panel11.Enabled:=false;
 Panel10.Enabled:=true;
end;

procedure TFrmTerminalF.BitBtn34Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM033', 'CONFIGURAR', '','TERMINAL_IMPRESSORAS',
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('COD_TERMINAL').AsString+
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('IDENT_CNIEE').AsString+
  cadTerminais.CadImpressoraTerm.dataSet.FieldByName('NUM_SERIE_ECF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;
  if application.messagebox('Tem certeza que deseja Colocar esta impressora para ser a atual deste terminal?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
  begin
    cadTerminais.CadImpressoraTerm.definiratual;
  end;
end;

procedure TFrmTerminalF.BitBtn35Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM024', 'VISUALIZAR', '','FISCAL_VERSOES',
  cadTerminais.SoftFiscal.dataSet.FieldByName('COD_FISCAL').AsString+
  cadTerminais.SoftFiscal.dataSet.FieldByName('NOME_PAF').AsString+
  cadTerminais.SoftFiscal.dataSet.FieldByName('VERSAO_PAF').AsString,
  cadTerminais.SoftFiscal.buscas, true) then
   exit;
 Application.CreateForm(TFrmArqUsados,FrmArqUsados);
 cadTerminais.SoftFiscal.cadArquivosFiscal.vcodfiscal:=
 cadTerminais.dataSet.fieldbyname('COD_FISCAL').AsInteger;
 cadTerminais.SoftFiscal.cadArquivosFiscal.AbreArqFiscal;
 FrmArqUsados.ShowModal;
 FrmArqUsados.Free;
 cadTerminais.SoftFiscal.cadArquivosFiscal.Close;
end;

procedure TFrmTerminalF.BitBtn36Click(Sender: TObject);
begin
  inherited;
  GroupBox10.Visible := False;
  BitBtn37.Enabled := False;
  if cadTerminais.vendasPorPeriodo(DBGrid1,MaskEdit4.Text,MaskEdit5.Text) then
  begin
    BitBtn37.Enabled:=true;
    if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
    	DBGrid6.SetFocus;
  end;
end;

procedure TFrmTerminalF.BitBtn37Click(Sender: TObject);
begin
  inherited;
  if cadTerminais.detalhesFormaPagamentoVendas(
  DBGrid6.DataSource.DataSet.FieldByName('cod_terminal').AsInteger,
  DBGrid6.DataSource.DataSet.FieldByName('datamovimento').AsString,
  DBGrid6.DataSource.DataSet.FieldByName('datamovimento').AsString,
  pos('OFF-LINE',UpperCase(
  DBGrid6.DataSource.DataSet.FieldByName('terminal').AsString )) > 0) then
    GroupBox10.Visible:=true
  else
    GroupBox10.Visible := False;
end;

procedure TFrmTerminalF.BitBtn39Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if cadTerminais.verificarTerm(dbgrid8) then
    begin
     application.messagebox(Pchar('Media de Minutos por Cupom para o período informado: '+#13+
     format('%n',[cadTerminais.performance(MaskEdit6.Text,MaskEdit7.Text)])), 'Informação', MB_ICONINFORMATION + MB_OK);
     Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
     cadTerminais.gerarProdutividadeVendasOperadorOLAP(MaskEdit6.Text, MaskEdit7.Text,FrmVisualizaOlap.HCubeGERAL);
 //    myFirstOLAP.Active := true;
 //  HierCubeGrid1.SummarySettings.BeginUpdate;
 //  HierCubeGrid1.SummarySettings.AddSummary('MARKUP','("BRUTO"."Sum"-"DESCONTO"."Sum")/"CUSTO"."Sum"');
 //  HierCubeGrid1.SummarySettings.Items[3].FunctionSum.SubFunctions[0].FormatString:='##0.0000';
 //  HierCubeGrid1.SummarySettings.EndUpdate;
     FrmVisualizaOlap.Label1.Caption:='Detalhes de Vendas PDV';
     FrmVisualizaOlap.ShowModal;
    end
    else
      application.messagebox(Pchar('Favor Selecionar os terminais'), 'Informação', MB_ICONINFORMATION + MB_OK);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTerminalF.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM002', 'INCLUIR', '','TERMINALF','',cadTerminais.buscas, true) then
    exit;

  TabSheet3.visible:=true;
  if cadTerminais.dataSet.State = dsinactive then
    cadTerminais.abreTerminais;
  cadTerminais.Insert;
  if (Self.Enabled) and (Self.Visible) and (dbedit2.CanFocus) then
  	dbedit2.SetFocus;
end;

procedure TFrmTerminalF.BitBtn40Click(Sender: TObject);
begin
  inherited;
    try
    BitBtn39.Enabled := false;
    BitBtn41.Enabled := false;
    ProgressBar1.Visible := true;
    cadTerminais.relatorioDeVendasPorSecao(MaskEdit6.Text, MaskEdit7.Text, ProgressBar1,DBGrid8);
  finally
    BitBtn39.Enabled := True;
    BitBtn41.Enabled := True;
    ProgressBar1.Visible := False;
  end;
  
end;

procedure TFrmTerminalF.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM016', 'INCLUIR', '','RESUMOD','',cadTerminais.CadResumoD.buscas, true) then
   exit;

  vDadosIni.vCodTerminal:=cadTerminais.dataSet.FieldByName('COD_TERMINAL').AsString;
  Panel4.Enabled:=false;
  Panel5.Enabled:=true;
  cadTerminais.CadResumoD.Insert;
  if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TFrmTerminalF.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM017', 'ALTERAR', '','RESUMOD',
  cadTerminais.CadResumoD.dataSet.FieldByName('NSERIEECF').AsString+
  cadTerminais.CadResumoD.dataSet.FieldByName('DATA_MOV').AsString,cadTerminais.CadResumoD.buscas, true) then
   exit;

  Panel4.Enabled:=false;
  Panel5.Enabled:=true;
  cadTerminais.CadResumoD.Edit;
  if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TFrmTerminalF.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM018', 'EXCLUIR', '','RESUMOD',
  cadTerminais.CadResumoD.dataSet.FieldByName('NSERIEECF').AsString+
  cadTerminais.CadResumoD.dataSet.FieldByName('DATA_MOV').AsString,cadTerminais.CadResumoD.buscas, true) then
   exit;
  cadTerminais.CadResumoD.Delete;
end;

procedure TFrmTerminalF.DBEdit23Exit(Sender: TObject);
begin
  inherited;
  if cadTerminais.dataSet.State in [dsInsert, dsEdit] then
    if FileExists(Trim(cadTerminais.dataSet.FieldByName('ENDREDEHWF_FDB').AsString)) then
      cadTerminais.dataSet.FieldByName('ENDREDEHWF_FDB').AsString := ExtractFileDir(Trim(cadTerminais.dataSet.FieldByName('ENDREDEHWF_FDB').AsString));
end;

procedure TFrmTerminalF.DBEdit31Exit(Sender: TObject);
begin
  inherited;
  if (DBEdit31.Text <> '') and (DBEdit31.Text <> '0') then
  begin
    DBEdit32.Enabled:=false;
    DBEdit35.Enabled:=false;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end
  else
  begin
   DBEdit32.Enabled:=True;
   DBEdit35.Enabled:=true;
  end;
end;

procedure TFrmTerminalF.DBEdit32Exit(Sender: TObject);
begin
  inherited;
  if (DBEdit32.Text <> '') and (DBEdit32.Text <> '0') then
  begin
    DBEdit31.Enabled:=false;
    DBEdit35.Enabled:=false;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end
  else
  begin
   DBEdit31.Enabled:=True;
   DBEdit35.Enabled:=true;
  end;
end;

procedure TFrmTerminalF.DBEdit35Exit(Sender: TObject);
begin
  inherited;
  if (DBEdit35.Text <> '') and (DBEdit35.Text <> '0') then
  begin
    DBEdit31.Enabled:=false;
    DBEdit32.Enabled:=false;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end
  else
  begin
    DBEdit31.Enabled:=True;
    DBEdit32.Enabled:=true;
  end;
end;

procedure TFrmTerminalF.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TFrmTerminalF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if (cadTerminais <> nil) then
    cadTerminais.Cancel;

  cadTerminais.Free;
  cadTerminais := nil;

  Action := caFree;

  if (FrmTerminalF <> nil) then
  	FrmTerminalF:= nil;
end;

procedure TFrmTerminalF.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  cadTerminais:=TTerminaisF.create;
	TbSResumoD.TabVisible := false;
  TbSFiscVersoes.TabVisible := false;
  TbSDocNFiscal.TabVisible := false;
  tbImprUtilizadas.TabVisible := false;
  tsVendasPDV.TabVisible := false;
  tsRel.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmTerminalF.FormShow(Sender: TObject);
var
i: integer;
begin
	if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmTerminaisF.DtTerminalF;
    inherited;
    setTClientDataSet(vdadosini.dataSetCol,vDadosIni.vNomeUsuario,vdadosini.transacaoCol);
  end;
//  CarregaPacote('pkConfigF', HdConfigImp);
  try
    Image1.Picture.LoadFromFile('Logo.jpg');
  except
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmTerminalF.ReestruturarBanco1Click(Sender: TObject);
var
  vBancoTemp2: string;
begin
  inherited;
  if Trim(cadTerminais.dataSet.FieldByName('end_terminal').AsString) <> '' then
    if Application.MessageBox('Deseja reestruturar o Fiscal.fdb','Confirmação',MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      vBancoTemp2 := vDadosIni.vBancoFiscal;
      vDadosIni.vBancoFiscal := Trim(cadTerminais.dataSet.FieldByName('end_terminal').AsString);
      vDadosIni.reestruturarBancoDeDados('fiscal', true);
      vDadosIni.vBancoFiscal := vBancoTemp2;
    end;
end;

procedure TFrmTerminalF.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM014', 'VISUALIZAR', '','TERMINALF',cadTerminais.
  dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
   exit;
  PageControl1.ActivePage := tsVendasPDV;
end;

procedure TFrmTerminalF.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM004', 'ALTERAR', '','TERMINALF',cadTerminais.
  	dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  	dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
  		exit;
      
  if cadTerminais.Edit then
  begin
    PageControl1.ActivePage := TabSheet1;
    TabSheet3.visible:=true;
    TabSheet3.Show;
    if (Self.Enabled) and (Self.Visible) and (dbedit2.CanFocus) then
      dbedit2.SetFocus;
  end;
end;

procedure TFrmTerminalF.SpeedButton23Click(Sender: TObject);
var
  tempNSerieEcf: string;
  tempvCodTerminal: string;
begin
  inherited;
  if not vDadosIni.PesqPros('TERM013', 'VISUALIZAR', '','TERMINALF',cadTerminais.
  dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
   exit;

  tempNSerieEcf:=vDadosIni.vNumSerieEcf;
  tempvCodTerminal:=vDadosIni.vCodTerminal;
  if cadTerminais.getDadosImpressora then
  begin
    try
    Application.CreateForm(TFrmArqFrente,FrmArqFrente);
    FrmArqFrente.showModal;
    finally
      vDadosIni.vNumSerieEcf := tempNSerieEcf;
      vDadosIni.vCodTerminal := tempvCodTerminal;
    end;
  end;
end;

procedure TFrmTerminalF.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM015', 'VISUALIZAR', '','TERMINALF',cadTerminais.
  dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
   exit;

  PageControl1.ActivePage := tsRel;
  DBGrid8.DataSource:=DBGrid1.DataSource;
//  DBGrid8 := TDBGrid(DBGrid1);
end;

procedure TFrmTerminalF.SpeedButton26Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(tfrmGtNSerieECF,frmGtNSerieECF);
    frmGtNSerieECF.ShowModal;
    frmGtNSerieECF.free;
    frmGtNSerieECF :=nil;
end;

procedure TFrmTerminalF.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    if not vDadosIni.PesqPros('TERM005', 'EXCLUIR', '','TERMINALF',cadTerminais.
    dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
    dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
    exit;
 cadTerminais.Delete;

end;

procedure TFrmTerminalF.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM006', 'ASSISTENTE', '','TERMINALF',cadTerminais.
  dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
    exit;

  Application.CreateForm(TfrmAssistemConfigFiscal,frmAssistemConfigFiscal);
  vAssistente.vCodigoTerminal := cadTerminais.dataSet.FieldByName('cod_terminal').AsInteger;
  vAssistente.vEnderecoTerminal := Trim(cadTerminais.dataSet.FieldByName('END_TERMINAL').AsString);
  frmAssistemConfigFiscal.ShowModal;
end;

procedure TFrmTerminalF.SpeedButton4Click(Sender: TObject);
begin
  cadTerminais.abreConfigF;
end;

procedure TFrmTerminalF.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('paf_%', cadTerminais.buscas);
end;

procedure TFrmTerminalF.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM008', 'VISUALIZAR', '','TERMINALF',cadTerminais.
  dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
   exit;

  vDadosIni.vCodTerminal:=cadTerminais.dataSet.FieldByName('COD_TERMINAL').AsString;
  cadTerminais.CadResumoD.abreResumoD;
  PageControl1.ActivePage:=TbSResumoD;
end;

procedure TFrmTerminalF.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM009', 'VISUALIZAR', '','TERMINALF',cadTerminais.
  dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
   exit;

  vDadosIni.vCodTerminal:=cadTerminais.dataSet.FieldByName('COD_TERMINAL').AsString;
  cadTerminais.SoftFiscal.abreSofFiscal;
  PageControl1.ActivePage:=TbSFiscVersoes;
end;

procedure TFrmTerminalF.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM011', 'VISUALIZAR', '','TERMINALF',cadTerminais.
  dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
   exit;

  vDadosIni.vCodTerminal:=cadTerminais.dataSet.FieldByName('COD_TERMINAL').AsString;
  cadTerminais.CadDocNaofiscal.abreDocNaoFiscal;
  PageControl1.ActivePage:=TbSDocNFiscal;
  DBComboBox1.Hint:='CM - Conferência de Mesa'+#13+'RV - Registro de Venda'+#13+
  'CC - Comprovante de Crédito ou Débito'+#13+'CN - Comprovante Não Fiscal'+#13+
  'NC - Comprovante Não Fiscal Cancelamento'+#13+'RG - Relatório Gerencial';
end;

procedure TFrmTerminalF.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('TERM010', 'VISUALIZAR', '','TERMINALF',cadTerminais.
  dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
  dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
   exit;

  vDadosIni.vCodTerminal:=cadTerminais.dataSet.FieldByName('COD_TERMINAL').AsString;
  cadTerminais.CadImpressoraTerm.abreImpressorasTerm;
  PageControl1.ActivePage:=tbImprUtilizadas;
end;

procedure TFrmTerminalF.SpeedButton9Click(Sender: TObject);
//var
//  progr: TProgressBar;
//  vlabel:  tlabel;
begin
  inherited;
 if not vDadosIni.PesqPros('TERM012', 'VISUALIZAR', '','TERMINALF',cadTerminais.
 dataSet.FieldByName('COD_TERMINAL').AsString+'-'+cadTerminais.
 dataSet.FieldByName('NOME_TERMINAL').AsString,cadTerminais.buscas, true) then
  exit;

 if vDadosIni.vEmp.vResponsavelCopiaHwF = 'R' then
   if DBGrid1.SelectedRows.Count <= 0 then
   begin
     application.messagebox('Favor selecionar Terminais para esta ação. CTRL+Click Mouse ou Shift+Seta para Baixo/Cima', 'Informação', MB_ICONINFORMATION + MB_OK);
     exit;
   end;
 Application.CreateForm(TFrmSincTerminais,FrmSincTerminais);
// FrmSincTerminais.vterminais:=TTerminaisF(cadTerminais);
 FrmSincTerminais.vgrid:=TDBGrid(DBGrid1);
 FrmSincTerminais.ShowModal;
 FrmSincTerminais.Free;
// progr:=TProgressBar.Create(self);
// vlabel:=TLabel.create(self);
end;

initialization
  RegisterClass(TFrmTerminalF);
finalization
  UnRegisterClass(TFrmTerminalF);

end.
