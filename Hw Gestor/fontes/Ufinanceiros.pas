unit Ufinanceiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons,uclassesGestor,
  TeEngine, Series, TeeProcs, Chart, DBGrids, Grids, Mask, DB, IBCustomDataSet,
  IBTable, Menus, xhChart, xhGrid, xhHierCube, uEditMoeda,ComObj;

type
  TFrmFinanceiros = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cklbEmpresas: TCheckListBox;
    ckMarcar: TCheckBox;
    PgFinanceiros: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    SpeedButton11: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    TabSheet9: TTabSheet;
    PopupMenu1: TPopupMenu;
    DetalhesBI1: TMenuItem;
    PopupMenu2: TPopupMenu;
    DetalhesOLAP1: TMenuItem;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    PageControl4: TPageControl;
    TabSheet14: TTabSheet;
    Panel16: TPanel;
    ScrollBox1: TScrollBox;
    Panel19: TPanel;
    Panel17: TPanel;
    Label25: TLabel;
    StAtCirculante: TStringGrid;
    Panel18: TPanel;
    Label26: TLabel;
    StAtRealizavelLp: TStringGrid;
    Panel24: TPanel;
    Label27: TLabel;
    StAPermanente: TStringGrid;
    Panel27: TPanel;
    Panel28: TPanel;
    Label28: TLabel;
    StPsCirculante: TStringGrid;
    Panel31: TPanel;
    Label29: TLabel;
    StPasExigivelLp: TStringGrid;
    Panel34: TPanel;
    Label30: TLabel;
    GroupBox8: TGroupBox;
    EdtPatLiquido: TEditMoeda;
    BitBtn10: TBitBtn;
    TabSheet17: TTabSheet;
    Label33: TLabel;
    EdtDifMesant: TEditMoeda;
    Label34: TLabel;
    EdtDifAnoAnterior: TEditMoeda;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Label55: TLabel;
    LbApuracao: TLabel;
    LbEstoque: TLabel;
    Label56: TLabel;
    BitBtn19: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn20: TBitBtn;
    ScrollBox2: TScrollBox;
    Panel37: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    CheckBox1: TCheckBox;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    PageControl3: TPageControl;
    TabSheet10: TTabSheet;
    Panel6: TPanel;
    StringGrid2: TStringGrid;
    TabSheet11: TTabSheet;
    Panel7: TPanel;
    ChBoxMarks: TCheckBox;
    StringGrid3: TStringGrid;
    ComboBox2: TComboBox;
    BitBtn8: TBitBtn;
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Panel42: TPanel;
    Label57: TLabel;
    Label58: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label59: TLabel;
    Label60: TLabel;
    chkdesconsidPME: TCheckBox;
    chkdesconsidPMPF: TCheckBox;
    GroupBox9: TGroupBox;
    Label12: TLabel;
    Label11: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox10: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    PopupMenu3: TPopupMenu;
    ExportalparaExcel1: TMenuItem;
    BitBtn22: TBitBtn;
    BtOk: TBitBtn;
    pnButtonFluxo: TPanel;
    BitBtn21: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn18: TBitBtn;
    ScrollBox3: TScrollBox;
    Label17: TLabel;
    Panel14: TPanel;
    StringGrid4: TStringGrid;
    DBGrid3: TDBGrid;
    Panel15: TPanel;
    DBGrid4: TDBGrid;
    ScrollBox4: TScrollBox;
    DBGrid2: TDBGrid;
    Panel13: TPanel;
    StringGrid6: TStringGrid;
    StringGrid5: TStringGrid;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel43: TPanel;
    EdtAtCirculante: TEditMoeda;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel44: TPanel;
    EdtPCirculante: TEditMoeda;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel45: TPanel;
    EdtAtPermanente: TEditMoeda;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel46: TPanel;
    EdtAtRLP: TEditMoeda;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel47: TPanel;
    EdtEXLP: TEditMoeda;
    Panel48: TPanel;
    EdtSomaAtivo: TEditMoeda;
    Panel49: TPanel;
    EdtSomaPassivo: TEditMoeda;
    BitBtn4: TBitBtn;
    ScrollBox5: TScrollBox;
    BitBtn13: TBitBtn;
    StringGrid7: TStringGrid;
    StringGrid8: TStringGrid;
    DBGrid5: TDBGrid;
    Label31: TLabel;
    ScrollBox6: TScrollBox;
    Panel35: TPanel;
    Label32: TLabel;
    ComboBox3: TComboBox;
    ChTendBalAnoAtual: TChart;
    Panel36: TPanel;
    ChBalAnoAnterior: TChart;
    ScrollBox7: TScrollBox;
    Panel4: TPanel;
    Label20: TLabel;
    btSelectAll: TSpeedButton;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label69: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn12: TBitBtn;
    BitBtn17: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ckUsarValoresContabeis: TCheckBox;
    Panel3: TPanel;
    StringGrid1: TStringGrid;
    ProgressBar1: TProgressBar;
    ScrollBox8: TScrollBox;
    Panel11: TPanel;
    Label23: TLabel;
    ComboBox1: TComboBox;
    Chart2: TChart;
    Panel12: TPanel;
    Chart3: TChart;
    ScrollBox9: TScrollBox;
    Panel8: TPanel;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    Label35: TLabel;
    LValorParcelas: TLabel;
    Label36: TLabel;
    LJuros: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    LValorAtual: TLabel;
    Label39: TLabel;
    LValorAtualParc: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    MkeValorInicial: TMaskEdit;
    MkeTotalDebito: TMaskEdit;
    MkeQtdeParcelas: TMaskEdit;
    BtnCalculo: TBitBtn;
    MkeRst: TMaskEdit;
    BitBtn9: TBitBtn;
    Panel9: TPanel;
    GroupBox5: TGroupBox;
    Panel10: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Panel50: TPanel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label54: TLabel;
    MaskEdit5: TMaskEdit;
    BitBtn11: TBitBtn;
    MaskEdit9: TMaskEdit;
    EditMoeda1: TEditMoeda;
    EditMoeda2: TEditMoeda;
    EditMoeda3: TEditMoeda;
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure PgFinanceirosChange(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure ExportalparaExcel1Click(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure StPasExigivelLpSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn13Click(Sender: TObject);
    procedure StAPermanenteSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StPsCirculanteSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StAtCirculanteSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StAtRealizavelLpSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnCalculoClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DetalhesOLAP1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ChBoxMarksClick(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure DetalhesBI1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton11Click(Sender: TObject);
    function GeraTabelaHTML(GradeP: TStringGrid; Borda: string): string;
    function LinhaDest(GradeP: TStringGrid; inicial: integer): integer;
    function atualizaGrafico(vstGrade: Tstringgrid;vchart: Tchart): boolean;
    procedure somavaloresGrid(vstatcir,vstatreallp,vstatperm,vstpcirc,vstexlp: Tstringgrid;
	    vedtatcir,vedtareallp,vedtaperm,vedtpascirc,vedtexlp,vedtpatliq: TEditMoeda);
    function AtribuirBoras(pOpenOffice, Cor, EspLinInter, EspLinExter, DistLinha: Variant): Variant;
  private
    { Private declarations }
  public
    { Public declarations }
    var
      vstriggrid,vrowDRE,vcolDRE: integer; // Quando vstriggrid = 1 = StringDRE
  end;

var
  FrmFinanceiros: TFrmFinanceiros;
  cadempresasfin: TEmpresas;
  CadDREHW: TDREHw;
  cadFluxo: TFluxoCaixa;
  CadBalancoHw: TBalancoHw;

implementation

uses UdtmGestorHw,uDtmAtivo,  xhConsts,UVisualizadorOLAP, Math,
  URelatorio, UVisualizavinculosDpto, uDadosIni, DateUtils, uRelDREComparativo;



{$R *.dfm}

function TFrmFinanceiros.atualizaGrafico(vstGrade: Tstringgrid;vchart: Tchart): boolean;
var
 i,j: integer;
 SeriesClass: TChartSeriesClass;
 NewSeries: TChartSeries;

begin
   for i:=vchart.SeriesList.Count-1 downto 0 do
    vchart.Series[I].Free;

//   for i:=Chart3.SeriesList.Count downto 0 do
//    Chart3.Series[I].Free;
  for I := 1 to vstGrade.RowCount-1 do
  begin
      case ComboBox1.ItemIndex of
      0: SeriesClass := TLineSeries;
      1: SeriesClass := TBarSeries;
      2: SeriesClass := TAreaSeries;
    else // 3: and default
      SeriesClass := TPointSeries;
    end;
    NewSeries := SeriesClass.Create(application);
    NewSeries.ParentChart := vchart;
    NewSeries.Title :=vstgrade.cells[0,i];
  end;
  for I := 1 to vstGrade.RowCount-1 do
  begin
    vchart.Series [I-1].Clear;
    for J := 1 to vstGrade.ColCount-1 do
      vchart.Series [I-1].Add (
        StrTocurr (vDadosIni.tirapontos(VstGrade.Cells [J, I],2)),
        VstGrade.cells[J,0],vchart.Series [I-1].SeriesColor);
  end;
end;

procedure TFrmFinanceiros.BitBtn10Click(Sender: TObject);
var
 vqtdep: integer;
begin
  inherited;
  if not vDadosIni.PesqPros('GES017','GRAVAR','MES/ANO: '+edit1.text+'/'+edit2.text,'','',CadBalancoHw.buscas,True) then
   Exit;
  vqtdep:=CadDREHW.QtdeDeptoSel(DBGrid1);
  if ((vqtdep > 1) and (vqtdep < CadDREHW.CadDepto.dataSet.RecordCount)) or (vqtdep <= 0) then           // Neste caso se a qtde de depto selecionados
  begin                                                                                                  // for igual a qtde de depto mostrados o sistema
    Application.MessageBox('Apenas um Dpto deve estar selecionado e processado!', 'Confirmação', MB_OK); // Gravará na tabela de resultado o dpto 99
    exit;
  end;
  if StringGrid1.Cells[1,1] = '' then
  begin
    Application.MessageBox('Nenhum Resultado foi Apurado!', 'Confirmação', MB_OK);
    exit;
  end;
  if length(cadempresasfin.vCodEmpresas) > 1 then
  begin
   Application.MessageBox('Resultado só pode ser gravado por empresa, selecione uma empresa específica!', 'Confirmação', MB_OK);
   exit;
  end;
  CadDREHW.gravacustosporDpto(CadDREHW.CadDepto.dataSet.RecordCount,vqtdep,DbGrid1,strtoint(cadempresasfin.vCodEmpresas[0]),StringGrid1);
  Application.MessageBox('Informação gravada com sucesso!', 'Confirmação', MB_OK); // Gravará na tabela de resultado o dpto 99
end;

procedure TFrmFinanceiros.BitBtn11Click(Sender: TObject);
var
 dias_j: real;
 vl_j: real;
 vjuros: real;
begin
 inherited;
 dias_j:=strtodate(Maskedit9.text)-strtodate(Maskedit5.text);
 vjuros:=((EditMoeda1.Valor*EditMoeda2.Valor)/100);
 vl_j:=((((editmoeda3.Valor/30)*dias_j)*EditMoeda1.Valor)/100);
 label52.caption:=format('%n',[dias_j]);
 label53.Caption:=format('%m', [vl_j]);
 label51.caption:=format('%m', [EditMoeda1.Valor+vjuros+vl_j]);
 label51.visible:=true;
 label52.visible:=true;
 label53.visible:=true;
end;

procedure TFrmFinanceiros.BitBtn12Click(Sender: TObject);
var
 i,x: integer;
begin
  inherited;
dbgrid1.enabled:=true;
for I :=1 to StringGrid1.ColCount do
  for x := 1 to StringGrid1.RowCount do
    StringGrid1.Cells[i,x]:='';
RadioButton1.Enabled:=true;
RadioButton2.Enabled:=true;
ckUsarValoresContabeis.Enabled:=true;
end;

procedure TFrmFinanceiros.BitBtn13Click(Sender: TObject);
begin
  inherited;
  CadBalancoHw.vgerarGrafico(DBGrid5,ChTendBalAnoAtual,ChBalAnoAnterior,StringGrid7,1);
  atualizaGrafico(stringgrid7,ChTendBalAnoAtual);
  CadBalancoHw.vgerarGrafico(DBGrid5,ChTendBalAnoAtual,ChBalAnoAnterior,StringGrid8,2);
  atualizaGrafico(stringgrid8,ChBalAnoAnterior);
  panel11.Caption:='Tendências Ano Informado: '+inttostr(CadDREHW.vanoinf);
  panel12.Caption:='Tendências Ano: '+inttostr(CadDREHW.vanoinf-1);
end;

procedure TFrmFinanceiros.BitBtn14Click(Sender: TObject);
var
 OpenDesktop, Documento, Sheets, Sheet, Celula, Planilha: Variant;
 Connect, OpenOffice, Faixa: Variant;
 vlinhapass,vultimalinha,i,j,p: integer;
 objExcel,Chart,s : Variant;
 vteste: currency;
 cTitulo : string;
 vSize: Integer;
 vlinha: Integer;
 vlinhaTmp: Integer;
 vlinhaTmp2: Integer;
begin
  inherited;
  //
  if not vDadosIni.PesqPros('GES014','EXPORTAR EXCEL','MES/ANO: '+maskedit1.text+'/'+MaskEdit2.text,'','',CadBalancoHw.buscas,True) then
    Exit;
  cTitulo := 'Planilha de DRE';
  if (vDadosIni.vOpenOfficeExportRel = 'S') then
  begin
  	//Cria o link OLE com o OpenOffice
    try
      if VarIsEmpty(OpenOffice) then
        OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
    except
    	Application.MessageBox ('Versão do OpenOffice Calc Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
    	exit;
    end;
    Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

    //Inicia o Calc
    OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
    Documento   := OpenDesktop.LoadComponentFromURL('private:factory/scalc',
                     '_blank', 0, VarArrayCreate([0, -1], varVariant));
    Planilha    := Documento.getSheets.getByName('Planilha1');
    Sheets      := Documento.Sheets;
    Sheet       := Sheets.getByIndex(0);

    i := 0;
    j := 0;
    vlinha := 0;

    //Criar linha inicial
    Celula := Planilha.getCellByPosition(i, 0);
    Celula.CharWeight := 200;
    Sheet.getCellByPosition(i, vlinha).setString('BALANÇO GERENCIAL MÊS/ANO '+vDadosIni.StrZero(StrToInt(maskedit1.text),2)+'/'+
    	maskEdit2.Text+' EMPRESA(S): '+cadempresasfin.vnomeemps);

    //Definir largura colunas
    for I := 0 to StAtCirculante.ColCount -1 do
    begin
      vSize := Length(Trim(StAtCirculante.Cells[0, j]));
      Planilha.getColumns.getByIndex(i).width := vSize * 600;
    end;
    for I := 0 to StPsCirculante.ColCount -1 do
    begin
      vSize := Length(Trim(StPsCirculante.Cells[0, j]));
      Planilha.getColumns.getByIndex(i + 3).width := vSize * 600;
    end;

    //Preencher colunas planilha
    vlinha := vlinha + 1;

    Faixa  := Planilha.getCellRangeByPosition(0, vlinha, 1, vlinha);
    Faixa.merge(true);
    Sheet.getCellByPosition(0, vlinha).setString('ATIVO');
    Celula := Planilha.getCellByPosition(0, vlinha);
    Celula.HoriJustify   := 2;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Faixa  := Planilha.getCellRangeByPosition(3, vlinha, 4, vlinha);
    Faixa.merge(true);
    Sheet.getCellByPosition(3, vlinha).setString('PASSIVO');
    Celula := Planilha.getCellByPosition(3, vlinha);
    Celula.HoriJustify   := 2;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinha := vlinha + 1;

    Faixa  := Planilha.getCellRangeByPosition(0, vlinha, 1, vlinha);
    Faixa.merge(true);
    Sheet.getCellByPosition(0, vlinha).setString('CIRCULANTE');
    Celula := Planilha.getCellByPosition(0, vlinha);
    Celula.HoriJustify   := 2;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Faixa  := Planilha.getCellRangeByPosition(3, vlinha, 4, vlinha);
    Faixa.merge(true);
    Sheet.getCellByPosition(3, vlinha).setString('CIRCULANTE');
    Celula := Planilha.getCellByPosition(3, vlinha);
    Celula.HoriJustify   := 2;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinha := vlinha + 1;

    vlinhaTmp := vlinha;
    vlinhaTmp2 := vlinha;

    // ATIVO
    for j := 0 to StAtCirculante.RowCount - 1 do
    begin
      for I := 0 to StAtCirculante.ColCount - 1 do
      begin
      	if (J > 0) and (I > 0) and (trim(StAtCirculante.Cells[i,j]) <> '') then
        	Sheet.getCellByPosition(i, vlinhaTmp).setValue(StrToFloat(Trim(StringReplace(StAtCirculante.Cells[i,j], '.', '', [rfReplaceAll, rfIgnoreCase]))))
        else
        	Sheet.getCellByPosition(i, vlinhaTmp).setString(Trim(StAtCirculante.Cells[i,j]));

        Celula := Planilha.getCellByPosition(i, vlinhaTmp);
        if (i = 0) then
        begin
          Celula.CharWeight := 200;
          Celula.CellBackColor := '13893372';
        end
        else
        begin
          Celula.HoriJustify   := 3;
          Celula.NumberFormat := 4;
        end;
        Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

      end;
      vlinhaTmp := vlinhaTmp + 1;
    end;

//    vlinhaTmp := vlinhaTmp + 1;

    Sheet.getCellByPosition(0, vlinhaTmp).setString('TOTAL ATIVO CIRCULANTE');
    Celula := Planilha.getCellByPosition(0, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(1, vlinhaTmp).setValue(StrToFloat(trim(StringReplace(EdtAtCirculante.Text, '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(1, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp := vlinhaTmp + 2;

    // PASSIVO
    for j := 0 to StPsCirculante.RowCount - 1 do
    begin
      for I := 0 to StPsCirculante.ColCount - 1 do
      begin
      	if (J > 0) and (I > 0) and (trim(StPsCirculante.Cells[i,j]) <> '') then
          Sheet.getCellByPosition(i + 3, vlinhaTmp2).setValue(StrToFloat(Trim(StringReplace(StPsCirculante.Cells[i,j], '.', '', [rfReplaceAll, rfIgnoreCase]))))
        else
        	Sheet.getCellByPosition(i + 3, vlinhaTmp2).setString(Trim(StPsCirculante.Cells[i,j]));

        Celula := Planilha.getCellByPosition(i + 3, vlinhaTmp2);
        if (i = 0) then
        begin
          Celula.CharWeight := 200;
          Celula.CellBackColor := '13893372';
        end
        else
        begin
          Celula.HoriJustify   := 3;
          Celula.NumberFormat := 4;
        end;
        Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
      end;
      vlinhaTmp2 := vlinhaTmp2 + 1;
    end;

//    vlinhaTmp2 := vlinhaTmp2 + 1;

    Sheet.getCellByPosition(3, vlinhaTmp2).setString('TOTAL PASSIVO CIRCULANTE');
    Celula := Planilha.getCellByPosition(3, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(4, vlinhaTmp2).setValue(StrToFloat(trim(StringReplace(EdtPCirculante.Text, '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(4, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp2 := vlinhaTmp2 + 2;

    Faixa  := Planilha.getCellRangeByPosition(0, vlinhaTmp, 1, vlinhaTmp);
    Faixa.merge(true);
    Sheet.getCellByPosition(0, vlinhaTmp).setString('REALIZÁVEL LONGO PRAZO');
    Celula := Planilha.getCellByPosition(0, vlinhaTmp);
    Celula.HoriJustify   := 2;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp := vlinhaTmp + 1;

    // REALIZAVEL A LONGO PRAZO
    for j := 0 to StAtRealizavelLp.RowCount - 1 do
    begin
      for I := 0 to StAtRealizavelLp.ColCount - 1 do
      begin
      	if (J > 0) and (I > 0) and (trim(StAtRealizavelLp.Cells[i,j]) <> '') then
	        Sheet.getCellByPosition(i, vlinhaTmp).setValue(StrToFloat(Trim(StringReplace(StAtRealizavelLp.Cells[i,j], '.', '', [rfReplaceAll, rfIgnoreCase]))))
        else
        	Sheet.getCellByPosition(i, vlinhaTmp).setString(Trim(StAtRealizavelLp.Cells[i,j]));

        Celula := Planilha.getCellByPosition(i, vlinhaTmp);
        if (i = 0) then
        begin
          Celula.CharWeight := 200;
          Celula.CellBackColor := '13893372';
        end
        else
        begin
          Celula.HoriJustify   := 3;
          Celula.NumberFormat := 4;
        end;
        Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
      end;
      vlinhaTmp := vlinhaTmp + 1;
    end;

//    vlinhaTmp := vlinhaTmp + 1;

    Sheet.getCellByPosition(0, vlinhaTmp).setString('TOT. REALIZÁVEL LONGO PRAZO');
    Celula := Planilha.getCellByPosition(0, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp2 := vlinhaTmp2 + 2;

    Sheet.getCellByPosition(1, vlinhaTmp).setValue(StrToFloat(trim(StringReplace(EdtAtRLP.Text, '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(1, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp := vlinhaTmp + 2;

    Faixa  := Planilha.getCellRangeByPosition(3, vlinhaTmp2, 4, vlinhaTmp2);
    Faixa.merge(true);
    Sheet.getCellByPosition(3, vlinhaTmp2).setString('EXIGÍVEL A LONGO PRAZO');
    Celula := Planilha.getCellByPosition(3, vlinhaTmp2);
    Celula.HoriJustify   := 2;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp2 := vlinhaTmp2 + 1;

    // EXIGIVEL A LONGO PRAZO
    for j := 0 to StPasExigivelLp.RowCount - 1 do
    begin
      for I := 0 to StPasExigivelLp.ColCount - 1 do
      begin
      	if (J > 0) and (I > 0) and (trim(StPasExigivelLp.Cells[i,j]) <> '') then
        	Sheet.getCellByPosition(i + 3, vlinhaTmp2).setValue(StrToFloat(Trim(StringReplace(StPasExigivelLp.Cells[i,j], '.', '', [rfReplaceAll, rfIgnoreCase]))))
        else
        	Sheet.getCellByPosition(i + 3, vlinhaTmp2).setString(Trim(StPasExigivelLp.Cells[i,j]));

        Celula := Planilha.getCellByPosition(i + 3, vlinhaTmp2);
        if (i = 0) then
        begin
          Celula.CharWeight := 200;
          Celula.CellBackColor := '13893372';
        end
        else
        begin
          Celula.HoriJustify   := 3;
          Celula.NumberFormat := 4;
        end;
        Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
      end;
      vlinhaTmp2 := vlinhaTmp2 + 1;
    end;

//    vlinhaTmp2 := vlinhaTmp2 + 1;

    Sheet.getCellByPosition(3, vlinhaTmp2).setString('TOTAL PASSIVO CIRCULANTE');
    Celula := Planilha.getCellByPosition(3, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(4, vlinhaTmp2).setString(Trim(EdtEXLP.Text));
    Celula := Planilha.getCellByPosition(4, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    
    vlinhaTmp2 := vlinhaTmp2 + 2;

    Faixa  := Planilha.getCellRangeByPosition(0, vlinhaTmp, 1, vlinhaTmp);
    Faixa.merge(true);
    Sheet.getCellByPosition(0, vlinhaTmp).setString('PERMANENTE');
    Celula := Planilha.getCellByPosition(0, vlinhaTmp);
    Celula.HoriJustify   := 2;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp := vlinhaTmp + 1;

    // PERMANENTE
    for j := 0 to StAPermanente.RowCount - 1 do
    begin
      for I := 0 to StAPermanente.ColCount - 1 do
      begin
      	if (J > 0) and (I > 0) and (trim(StAPermanente.Cells[i,j]) <> '') then
	        Sheet.getCellByPosition(i, vlinhaTmp).setValue(StrToFloat(Trim(StringReplace(StAPermanente.Cells[i,j], '.', '', [rfReplaceAll, rfIgnoreCase]))))
        else
        	Sheet.getCellByPosition(i, vlinhaTmp).setString(Trim(StAPermanente.Cells[i,j]));

        Celula := Planilha.getCellByPosition(i, vlinhaTmp);
        if (i = 0) then
        begin
          Celula.CharWeight := 200;
          Celula.CellBackColor := '13893372';
        end
        else
        begin
          Celula.HoriJustify   := 3;
          Celula.NumberFormat := 4;
        end;
        Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
      end;
      vlinhaTmp := vlinhaTmp + 1;
    end;

//    vlinhaTmp := vlinhaTmp + 1;

    Sheet.getCellByPosition(0, vlinhaTmp).setString('TOTAL ATIVO PERMANENTE');
    Celula := Planilha.getCellByPosition(0, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(1, vlinhaTmp).setValue(StrToFloat(Trim(StringReplace(EdtAtPermanente.Text, '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(1, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp := vlinhaTmp + 2;

    // PATRIMONIO LIQUIDO
    Sheet.getCellByPosition(3, vlinhaTmp2).setString('PATRIMÔNIO LÍQUIDO');
    Celula := Planilha.getCellByPosition(3, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(4, vlinhaTmp2).setValue(StrToFloat(trim(StringReplace(EdtPatLiquido.Text, '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(4, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    if (vlinhaTmp > vlinha) then
    	vlinha := vlinhaTmp;

    if (vlinhaTmp2 > vlinha) then
    	vlinha := vlinhaTmp2;

    vlinha := vlinha + 1;

    vlinhaTmp := vlinha;
    vlinhaTmp2 := vlinha;

    // TOTAL DO ATIVO
    Sheet.getCellByPosition(0, vlinhaTmp).setString('TOTAL DO ATIVO');
    Celula := Planilha.getCellByPosition(0, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(1, vlinhaTmp).setValue(StrToFloat(trim(StringReplace(EdtSomaAtivo.Text, '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(1, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp := vlinhaTmp + 2;

    // TOTAL DO PASSIVO
    Sheet.getCellByPosition(3, vlinhaTmp2).setString('TOTAL DO PASSIVO');
    Celula := Planilha.getCellByPosition(3, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(4, vlinhaTmp2).setValue(StrToFloat(trim(StringReplace(EdtSomaPassivo.Text, '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(4, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp2 := vlinhaTmp2 + 2;

    Sheet.getCellByPosition(3, vlinhaTmp2).setString('DIF. MÊS ANTERIOR');
    Celula := Planilha.getCellByPosition(3, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(4, vlinhaTmp2).setValue(StrToFloat(trim(StringReplace(FloatToStr(EdtDifMesant.Valor), '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(4, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    
    vlinhaTmp2 := vlinhaTmp2 + 1;

    Sheet.getCellByPosition(3, vlinhaTmp2).setString('DIF. ANO ANTERIOR');
    Celula := Planilha.getCellByPosition(3, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    
    Sheet.getCellByPosition(4, vlinhaTmp2).setValue(StrToFloat(trim(StringReplace(FloatToStr(EdtDifAnoAnterior.Valor), '.', '', [rfReplaceAll, rfIgnoreCase]))));
    Celula := Planilha.getCellByPosition(4, vlinhaTmp2);
    Celula.CharWeight := 200;
    Celula.CellBackColor := '13893372';
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    
    vlinhaTmp2 := vlinhaTmp2 + 2;

    Sheet.getCellByPosition(0, vlinhaTmp).setString('INDICADORES MÊS: ' + trim(MaskEdit1.Text) + '/' + trim(MaskEdit2.Text));
    Celula := Planilha.getCellByPosition(0, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    Sheet.getCellByPosition(1, vlinhaTmp).setString('VALOR');
    Celula := Planilha.getCellByPosition(1, vlinhaTmp);
    Celula.CharWeight := 200;
    Celula.HoriJustify   := 3;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

    vlinhaTmp := vlinhaTmp + 1;

    CadBalancoHw.vIndicesBal.first;
    while Not CadBalancoHw.vIndicesBal.eof do
    begin
      if (CadBalancoHw.vIndicesBal.FieldByName('MES').AsInteger = StrToInt(MaskEdit1.text))
        and (CadBalancoHw.vIndicesBal.FieldByName('ANO').AsInteger = StrToInt(MaskEdit2.text)) then
      begin
        Sheet.getCellByPosition(0, vlinhaTmp).setString(trim(CadBalancoHw.vIndicesBal.FieldByName('NOME_INDICE').AsString));
        Celula := Planilha.getCellByPosition(0, vlinhaTmp);
        Celula.CharWeight := 200;
    		Celula.CellBackColor := '13893372';
        Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

        Sheet.getCellByPosition(1, vlinhaTmp).setValue(StrToFloat(trim(StringReplace(FloatToStr(CadBalancoHw.vIndicesBal.FieldByName('VALOR').AsCurrency), '.', '', [rfReplaceAll, rfIgnoreCase]))));
        Celula := Planilha.getCellByPosition(1, vlinhaTmp);
		    Celula.HoriJustify   := 3;
        Celula.NumberFormat := 4;
        Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);

        vlinhaTmp := vlinhaTmp+1;
      end;
      CadBalancoHw.vIndicesBal.next;
    end;
    CadBalancoHw.vIndicesBal.First;
  end
  else
  begin
  	try
	    objExcel := CreateOleObject('Excel.Application');
    except
    	Application.MessageBox ('Versão do Microsoft Office Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
    	exit;
    end;
    objExcel.Visible := True;
    objExcel.Caption := cTitulo;
    objExcel.Workbooks.add;
    // objExcel.Workbooks[1].sheets.add;
    Sheet:=objExcel.Workbooks[1].sheets[1];
    Sheet.cells[1,1]:='BALANÇO GERENCIAL MÊS/ANO '+vDadosIni.StrZero(StrToInt(maskedit1.text),2)+'/'+
    	maskEdit2.Text+' EMPRESA(S): '+cadempresasfin.vnomeemps;
    Sheet.cells[1,1].HorizontalAlignment := 3;
    Sheet.cells[1,1].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[1,1].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[1,1].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[1,1].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[1,1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[1,1].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[1,1].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[1,1].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[1,2].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[1,2].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[1,2].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[1,2].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[1,2].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[1,2].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[1,2].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[1,2].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[1,3].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[1,3].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[1,3].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[1,3].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[1,3].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[1,3].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[1,3].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[1,3].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[1,4].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[1,4].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[1,4].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[1,4].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[1,4].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[1,4].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[1,4].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[1,4].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[1,5].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[1,5].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[1,5].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[1,5].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[1,5].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[1,5].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[1,5].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[1,5].Borders.Item[$00000008].Color := clblack;
    // Sheet.cells[1,1].Interior.Color := ColorToRGB(clRed);
    // Sheet.cells[1,2].Interior.Color := ColorToRGB(clRed);
    // Sheet.cells[1,3].Interior.Color := ColorToRGB(clRed);
    // Sheet.cells[1,4].Interior.Color := ColorToRGB(clRed);
    // Sheet.cells[1,5].Interior.Color := ColorToRGB(clRed);
    Sheet.cells[1,1].font.Color := clblue;
    Sheet.range['A1:E1'].merge;
    p:=5;
    vultimalinha:=0;
    vlinhapass:=0;
    Sheet.cells[3,1]:='ATIVO';
    Sheet.cells[3,1].HorizontalAlignment := 3;
    Sheet.cells[3,1].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[3,1].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[3,1].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[3,1].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[3,1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[3,1].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[3,1].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[3,1].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[3,2].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[3,2].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[3,2].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[3,2].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[3,2].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[3,2].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[3,2].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[3,2].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[3,1].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[3,2].Interior.Color := ColorToRGB(clYellow);
    Sheet.range['A3:B3'].merge;

    //
    Sheet.cells[4,1]:='CIRCULANTE';
    Sheet.cells[4,1].HorizontalAlignment := 3;
    Sheet.cells[4,1].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[4,1].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[4,1].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[4,1].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[4,1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[4,1].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[4,1].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[4,1].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[4,2].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[4,2].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[4,2].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[4,2].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[4,2].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[4,2].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[4,2].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[4,2].Borders.Item[$00000008].Color := clblack;
    Sheet.range['A4:B4'].merge;

    for I := 0 to StAtCirculante.RowCount do
    begin
      for j := 0 to 1 do
      begin
        Sheet.cells[i+p,j+1]:=StAtCirculante.Cells[j,i];
        if ((j+1) = 1) or (i = (StAtCirculante.RowCount)) then
        begin
          Sheet.cells[i+p,j+1].Font.size := 10;
          Sheet.cells[i+p,j+1].ColumnWidth := 20;
          Sheet.cells[i+p,j+1].Borders.Item[$00000009].Weight := $FFFFEFD6;
          Sheet.cells[i+p,j+1].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$00000007].Weight := $FFFFEFD6;
          Sheet.cells[i+p,j+1].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
          Sheet.cells[i+p,j+1].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$00000008].Weight := $FFFFEFD6;
          Sheet.cells[i+p,j+1].Borders.Item[$00000008].Color := clblack;
  //        Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
          Sheet.cells[i+p,j+1].Interior.Color := $00ffcf9c; // Cor da Célula
          Sheet.cells[i+p,j+1].font.bold := true; // Negrito
          if (i = (StAtCirculante.RowCount)) then
          begin
           Sheet.cells[i+p,1]:='TOTAL ATIVO CIRCULANTE:';
           Sheet.cells[i+p,2].HorizontalAlignment := 4;
           vteste:=edtAtCirculante.Valor;
           Sheet.cells[i+p,2]:=format('%n',[vteste]);
          end;
        end
        else
        begin
          Sheet.cells[i+p,j+1].HorizontalAlignment := 4;
          Sheet.cells[i+p,j+1].Borders.Item[$00000009].Weight := $00000002;
          Sheet.cells[i+p,j+1].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$00000007].Weight := $00000002;
          Sheet.cells[i+p,j+1].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$0000000A].Weight := $00000002;
          Sheet.cells[i+p,j+1].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$00000008].Weight := $00000002;
          Sheet.cells[i+p,j+1].Borders.Item[$00000008].Color := clblack;
        end;
      end;
    end;
    vultimalinha:=i+p;
    vultimalinha:=vultimalinha+2;
    Sheet.cells[vultimalinha,1]:='REALIZÁVEL A LONGO PRAZO';
    Sheet.cells[vultimalinha,1].HorizontalAlignment := 3;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Color := clblack;
    Sheet.range['A'+IntToStr(vultimalinha)+':B'+IntToStr(vultimalinha)].merge;
    vultimalinha:=vultimalinha+1;

    for I := 0 to StAtRealizavelLp.RowCount do
    begin
      for j := 0 to 1 do
      begin
        Sheet.cells[vultimalinha,j+1]:=StAtRealizavelLp.Cells[j,i];
        if ((j+1) = 1) or (i = (StAtRealizavelLp.RowCount)) then
        begin
          Sheet.cells[vultimalinha,j+1].Font.size := 10;
          Sheet.cells[vultimalinha,j+1].ColumnWidth := 20;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000009].Weight := $FFFFEFD6;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000007].Weight := $FFFFEFD6;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000008].Weight := $FFFFEFD6;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000008].Color := clblack;
  //        Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
          Sheet.cells[vultimalinha,j+1].Interior.Color := $00ffcf9c; // Cor da Célula
          Sheet.cells[vultimalinha,j+1].font.bold := true; // Negrito
          if (i = (StAtRealizavelLp.RowCount)) then
          begin
            Sheet.cells[vultimalinha,1]:='TOT.REALIZÁVEL LONGO PRAZO:';
            Sheet.cells[vultimalinha,2].HorizontalAlignment := 4;
            vteste:=EdtAtRLP.Valor;
            Sheet.cells[vultimalinha,2]:=format('%n',[vteste]);
          end;
       end
       else
       begin
         Sheet.cells[vultimalinha,j+1].HorizontalAlignment := 4;
         Sheet.cells[vultimalinha,j+1].Borders.Item[$00000009].Weight := $00000002;
         Sheet.cells[vultimalinha,j+1].Borders.Item[$00000009].Color := clblack;
         Sheet.cells[vultimalinha,j+1].Borders.Item[$00000007].Weight := $00000002;
         Sheet.cells[vultimalinha,j+1].Borders.Item[$00000007].Color := clblack;
         Sheet.cells[vultimalinha,j+1].Borders.Item[$0000000A].Weight := $00000002;
         Sheet.cells[vultimalinha,j+1].Borders.Item[$0000000A].Color := clblack;
         Sheet.cells[vultimalinha,j+1].Borders.Item[$00000008].Weight := $00000002;
         Sheet.cells[vultimalinha,j+1].Borders.Item[$00000008].Color := clblack;
       end;
     end;
     vultimalinha:=vultimalinha+1;
    end;
    vultimalinha:=vultimalinha+2;
    Sheet.cells[vultimalinha,1]:='PERMANENTE';
    Sheet.cells[vultimalinha,1].HorizontalAlignment := 3;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Color := clblack;
    Sheet.range['A'+IntToStr(vultimalinha)+':B'+IntToStr(vultimalinha)].merge;
    vultimalinha:=vultimalinha+1;

    for I := 0 to StAPermanente.RowCount do
    begin
      for j := 0 to 1 do
      begin
        Sheet.cells[vultimalinha,j+1]:=StAPermanente.Cells[j,i];
        if ((j+1) = 1) or (i = (StAPermanente.RowCount)) then
        begin
          Sheet.cells[vultimalinha,j+1].Font.size := 10;
          Sheet.cells[vultimalinha,j+1].ColumnWidth := 20;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000009].Weight := $FFFFEFD6;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000007].Weight := $FFFFEFD6;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000008].Weight := $FFFFEFD6;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000008].Color := clblack;
  //        Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
          Sheet.cells[vultimalinha,j+1].Interior.Color := $00ffcf9c; // Cor da Célula
          Sheet.cells[vultimalinha,j+1].font.bold := true; // Negrito
          if (i = (StAPermanente.RowCount)) then
          begin
            Sheet.cells[vultimalinha,1]:='TOTAL ATIVO PERMANENTE:';
            Sheet.cells[vultimalinha,2].HorizontalAlignment := 4;
            vteste:=EdtAtPermanente.Valor;
            Sheet.cells[vultimalinha,2]:=format('%n',[vteste]);
          end;
        end
        else
        begin
          Sheet.cells[vultimalinha,j+1].HorizontalAlignment := 4;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000009].Weight := $00000002;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000007].Weight := $00000002;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$0000000A].Weight := $00000002;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000008].Weight := $00000002;
          Sheet.cells[vultimalinha,j+1].Borders.Item[$00000008].Color := clblack;
        end;
      end;
      vultimalinha:=vultimalinha+1;
    end;
    vultimalinha:=vultimalinha+2;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Weight := $00000004;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Weight := $00000004;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Weight := $00000004;
    Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Weight := $00000004;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Weight := $00000004;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Weight := $00000004;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Weight := $00000004;
    Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Weight := $00000004;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Color := clblack;
   //
    vteste:=EdtSomaAtivo.Valor;
    Sheet.cells[vultimalinha,1].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[vultimalinha,1].font.bold := true; // Negrito
    Sheet.cells[vultimalinha,2].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[vultimalinha,2].font.bold := true; // Negrito
    Sheet.cells[vultimalinha,1]:='TOTAL DO ATIVO:';
    Sheet.cells[vultimalinha,2].HorizontalAlignment := 4;
    Sheet.cells[vultimalinha,2]:=format('%n',[vteste]);
    // Passivo
    Sheet.cells[3,4]:='PASSIVO';
    Sheet.cells[3,4].HorizontalAlignment := 3;
    Sheet.cells[3,4].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[3,4].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[3,4].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[3,4].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[3,4].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[3,4].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[3,4].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[3,4].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[3,5].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[3,5].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[3,5].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[3,5].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[3,5].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[3,5].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[3,5].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[3,5].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[3,4].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[3,5].Interior.Color := ColorToRGB(clYellow);
    Sheet.range['D3:E3'].merge;

    //
    Sheet.cells[4,4]:='CIRCULANTE';
    Sheet.cells[4,4].HorizontalAlignment := 3;
    Sheet.cells[4,4].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[4,4].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[4,4].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[4,4].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[4,4].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[4,4].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[4,4].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[4,4].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[4,5].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[4,5].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[4,5].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[4,5].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[4,5].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[4,5].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[4,5].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[4,5].Borders.Item[$00000008].Color := clblack;
    Sheet.range['D4:E4'].merge;
    for I := 0 to StPsCirculante.RowCount do
    begin
      for j := 0 to 1 do
      begin
        Sheet.cells[i+p,j+4]:=StPsCirculante.Cells[j,i];
        if ((j+4) = 4) or (i = (StPsCirculante.RowCount)) then
        begin
          Sheet.cells[i+p,J+4].Font.size := 10;
          Sheet.cells[i+p,J+4].ColumnWidth := 20;
          Sheet.cells[i+p,J+4].Borders.Item[$00000009].Weight := $FFFFEFD6;
          Sheet.cells[i+p,J+4].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[i+p,J+4].Borders.Item[$00000007].Weight := $FFFFEFD6;
          Sheet.cells[i+p,J+4].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[i+p,J+4].Borders.Item[$0000000A].Weight := $FFFFEFD6;
          Sheet.cells[i+p,J+4].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[i+p,J+4].Borders.Item[$00000008].Weight := $FFFFEFD6;
          Sheet.cells[i+p,J+4].Borders.Item[$00000008].Color := clblack;
    //      Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
          Sheet.cells[i+p,J+4].Interior.Color := $00ffcf9c; // Cor da Célula
          Sheet.cells[i+p,J+4].font.bold := true; // Negrito
          if (i = (StPsCirculante.RowCount)) then
          begin
           Sheet.cells[i+p,4]:='TOTAL PASSIVO CIRCULANTE:';
           Sheet.cells[i+p,5].HorizontalAlignment := 4;
           vteste:=EdtPCirculante.Valor;
           Sheet.cells[i+p,5]:=format('%n',[vteste]);
          end;
        end
        else
        begin
         Sheet.cells[i+p,J+4].HorizontalAlignment := 4;
         Sheet.cells[i+p,J+4].Borders.Item[$00000009].Weight := $00000002;
         Sheet.cells[i+p,J+4].Borders.Item[$00000009].Color := clblack;
         Sheet.cells[i+p,J+4].Borders.Item[$00000007].Weight := $00000002;
         Sheet.cells[i+p,J+4].Borders.Item[$00000007].Color := clblack;
         Sheet.cells[i+p,J+4].Borders.Item[$0000000A].Weight := $00000002;
         Sheet.cells[i+p,J+4].Borders.Item[$0000000A].Color := clblack;
         Sheet.cells[i+p,J+4].Borders.Item[$00000008].Weight := $00000002;
         Sheet.cells[i+p,J+4].Borders.Item[$00000008].Color := clblack;
        end;
      end;
    end;
    vlinhapass:=i+p;
    vlinhapass:=vlinhapass+2;
    Sheet.cells[vlinhapass,4]:='EXIGÍVEL A LONGO PRAZO';
    Sheet.cells[vlinhapass,4].HorizontalAlignment := 3;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vlinhapass,4].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[vlinhapass,4].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vlinhapass,5].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[vlinhapass,5].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000008].Color := clblack;
    Sheet.range['D'+IntToStr(vlinhapass)+':E'+IntToStr(vlinhapass)].merge;
    vlinhapass:=vlinhapass+1;

    for I := 0 to StPasExigivelLp.RowCount do
    begin
      for j := 0 to 1 do
      begin
        Sheet.cells[vlinhapass,J+4]:=StPasExigivelLp.Cells[j,i];
        if ((J+4) = 4) or (i = (StPasExigivelLp.RowCount)) then
        begin
          Sheet.cells[vlinhapass,J+4].Font.size := 10;
          Sheet.cells[vlinhapass,J+4].ColumnWidth := 20;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000009].Weight := $FFFFEFD6;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000007].Weight := $FFFFEFD6;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$0000000A].Weight := $FFFFEFD6;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000008].Weight := $FFFFEFD6;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000008].Color := clblack;
  //        Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
          Sheet.cells[vlinhapass,J+4].Interior.Color := $00ffcf9c; // Cor da Célula
          Sheet.cells[vlinhapass,J+4].font.bold := true; // Negrito
          if (i = (StPasExigivelLp.RowCount)) then
          begin
           Sheet.cells[vlinhapass,4]:='TOT.EXIG.LONGO PRAZO:';
           Sheet.cells[vlinhapass,5].HorizontalAlignment := 4;
           vteste:=EdtEXLP.Valor;
           Sheet.cells[vlinhapass,5]:=format('%n',[vteste]);
          end;
        end
        else
        begin
          Sheet.cells[vlinhapass,J+4].HorizontalAlignment := 4;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000009].Weight := $00000002;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000007].Weight := $00000002;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$0000000A].Weight := $00000002;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000008].Weight := $00000002;
          Sheet.cells[vlinhapass,J+4].Borders.Item[$00000008].Color := clblack;
        end;
      end;
      vlinhapass:=vlinhapass+1;
    end;
    vlinhapass:=vlinhapass+6;

    Sheet.cells[vlinhapass,4].Borders.Item[$00000009].Weight := $00000002;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000007].Weight := $00000002;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vlinhapass,4].Borders.Item[$0000000A].Weight := $00000002;
    Sheet.cells[vlinhapass,4].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000008].Weight := $00000002;
    Sheet.cells[vlinhapass,4].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000009].Weight := $00000002;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000007].Weight := $00000002;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vlinhapass,5].Borders.Item[$0000000A].Weight := $00000002;
    Sheet.cells[vlinhapass,5].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000008].Weight := $00000002;
    Sheet.cells[vlinhapass,5].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[vlinhapass,4].Interior.Color := $00ffcf9c; // Cor da Célula
    Sheet.cells[vlinhapass,4].font.bold := true; // Negrito
    Sheet.cells[vlinhapass,5].Interior.Color := $00ffcf9c; // Cor da Célula
    Sheet.cells[vlinhapass,5].font.bold := true; // Negrito
    Sheet.cells[vlinhapass,4].Font.size := 14;
    Sheet.cells[vlinhapass,4]:='PATRIMÔNIO LÍQUIDO:';
    Sheet.cells[vlinhapass,5].Font.size := 14;
    Sheet.cells[vlinhapass,5].HorizontalAlignment := 4;
    vteste:=EdtPatLiquido.Valor;
    if vteste > 0 then
      Sheet.cells[vlinhapass,5].font.color := clblue
    else
      Sheet.cells[vlinhapass,5].font.Color :=clRed;
    Sheet.cells[vlinhapass,5]:=format('%n',[vteste]);
    // Total do Passivo
    Sheet.cells[vultimalinha,4].Borders.Item[$00000009].Weight := $00000004;
    Sheet.cells[vultimalinha,4].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,4].Borders.Item[$00000007].Weight := $00000004;
    Sheet.cells[vultimalinha,4].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,4].Borders.Item[$0000000A].Weight := $00000004;
    Sheet.cells[vultimalinha,4].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,4].Borders.Item[$00000008].Weight := $00000004;
    Sheet.cells[vultimalinha,4].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[vultimalinha,5].Borders.Item[$00000009].Weight := $00000004;
    Sheet.cells[vultimalinha,5].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,5].Borders.Item[$00000007].Weight := $00000004;
    Sheet.cells[vultimalinha,5].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,5].Borders.Item[$0000000A].Weight := $00000004;
    Sheet.cells[vultimalinha,5].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,5].Borders.Item[$00000008].Weight := $00000004;
    Sheet.cells[vultimalinha,5].Borders.Item[$00000008].Color := clblack;

    vteste:=EdtSomaPassivo.Valor;
    Sheet.cells[vultimalinha,4].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[vultimalinha,4].font.bold := true; // Negrito
    Sheet.cells[vultimalinha,5].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[vultimalinha,5].font.bold := true; // Negrito
    Sheet.cells[vultimalinha,4]:='TOTAL DO PASSIVO:';
    Sheet.cells[vultimalinha,5].HorizontalAlignment := 4;
    Sheet.cells[vultimalinha,5]:=format('%n',[vteste]);
    //Exportando dados de índices...
    vultimalinha:=vultimalinha+2;
    Sheet.cells[vultimalinha,4].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[vultimalinha,4].font.bold := true; // Negrito
    Sheet.cells[vultimalinha,5].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[vultimalinha,5].font.bold := true; // Negrito
    Sheet.cells[vultimalinha,4]:='DIF. MÊS ANTERIOR:';
    Sheet.cells[vultimalinha,5].HorizontalAlignment := 4;
    vteste:=EdtDifMesant.Valor;
    if vteste > 0 then
      Sheet.cells[vultimalinha,5].font.color := clblue
    else
      Sheet.cells[vultimalinha,5].font.Color :=clRed;
    Sheet.cells[vultimalinha,5]:=format('%n',[vteste]);

    Sheet.cells[vultimalinha+1,4].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[vultimalinha+1,4].font.bold := true; // Negrito
    Sheet.cells[vultimalinha+1,5].Interior.Color := ColorToRGB(clYellow);
    Sheet.cells[vultimalinha+1,5].font.bold := true; // Negrito
    Sheet.cells[vultimalinha+1,4]:='DIF. ANO ANTERIOR:';
    Sheet.cells[vultimalinha+1,5].HorizontalAlignment := 4;
    vteste:=EdtDifAnoAnterior.Valor;
    if vteste > 0 then
      Sheet.cells[vultimalinha+1,5].font.color := clblue
    else
      Sheet.cells[vultimalinha+1,5].font.Color :=clRed;
    Sheet.cells[vultimalinha+1,5]:=format('%n',[vteste]);
    //
    Sheet.cells[vultimalinha,1]:='Indicadores Mês: '+vDadosIni.StrZero(StrToInt(maskedit1.text),2)+'/'+
    maskEdit2.Text;
    Sheet.cells[vultimalinha,2]:='Valor';
    Sheet.cells[vultimalinha,1].HorizontalAlignment := 3;
    Sheet.cells[vultimalinha,2].HorizontalAlignment := 4;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Color := clblack;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Weight := $FFFFEFD6;
    Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Color := clblack;
    (* Sheet.cells[vultimalinha,3].Borders.Item[$00000009].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,3].Borders.Item[$00000009].Color := clblack;
     Sheet.cells[vultimalinha,3].Borders.Item[$00000007].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,3].Borders.Item[$00000007].Color := clblack;
     Sheet.cells[vultimalinha,3].Borders.Item[$0000000A].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,3].Borders.Item[$0000000A].Color := clblack;
     Sheet.cells[vultimalinha,3].Borders.Item[$00000008].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,3].Borders.Item[$00000008].Color := clblack;
     Sheet.cells[vultimalinha,4].Borders.Item[$00000009].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,4].Borders.Item[$00000009].Color := clblack;
     Sheet.cells[vultimalinha,4].Borders.Item[$00000007].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,4].Borders.Item[$00000007].Color := clblack;
     Sheet.cells[vultimalinha,4].Borders.Item[$0000000A].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,4].Borders.Item[$0000000A].Color := clblack;
     Sheet.cells[vultimalinha,4].Borders.Item[$00000008].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,4].Borders.Item[$00000008].Color := clblack;
     Sheet.cells[vultimalinha,5].Borders.Item[$00000009].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,5].Borders.Item[$00000009].Color := clblack;
     Sheet.cells[vultimalinha,5].Borders.Item[$00000007].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,5].Borders.Item[$00000007].Color := clblack;
     Sheet.cells[vultimalinha,5].Borders.Item[$0000000A].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,5].Borders.Item[$0000000A].Color := clblack;
     Sheet.cells[vultimalinha,5].Borders.Item[$00000008].Weight := $FFFFEFD6;
     Sheet.cells[vultimalinha,5].Borders.Item[$00000008].Color := clblack;*)
    // Sheet.cells[1,1].Interior.Color := ColorToRGB(clRed);
    // Sheet.cells[1,2].Interior.Color := ColorToRGB(clRed);
    // Sheet.cells[1,3].Interior.Color := ColorToRGB(clRed);
    // Sheet.cells[vultimalinha,4].Interior.Color := ColorToRGB(clRed);
    // Sheet.cells[vultimalinha,5].Interior.Color := ColorToRGB(clRed);
    Sheet.cells[vultimalinha,1].font.Color := clblue;
    Sheet.cells[vultimalinha,2].font.Color := clblue;
    // Sheet.range['A'+inttostr(vultimalinha)+':E'+inttostr(vultimalinha)].merge;
    vultimalinha:=vultimalinha+1;
    CadBalancoHw.vIndicesBal.first;
    while Not CadBalancoHw.vIndicesBal.eof do
    begin
      if (CadBalancoHw.vIndicesBal.FieldByName('MES').AsInteger = StrToInt(MaskEdit1.text))
        and (CadBalancoHw.vIndicesBal.FieldByName('ANO').AsInteger = StrToInt(MaskEdit2.text)) then
      begin
        Sheet.cells[vultimalinha,1]:=CadBalancoHw.vIndicesBal.FieldByName('NOME_INDICE').AsString;
        Sheet.cells[vultimalinha,2]:=format('%n',[CadBalancoHw.vIndicesBal.FieldByName('VALOR').AsCurrency]);

        Sheet.cells[vultimalinha,1].Font.size := 10;
        Sheet.cells[vultimalinha,1].ColumnWidth := 20;
        Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Weight := $FFFFEFD6;
        Sheet.cells[vultimalinha,1].Borders.Item[$00000009].Color := clblack;
        Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Weight := $FFFFEFD6;
        Sheet.cells[vultimalinha,1].Borders.Item[$00000007].Color := clblack;
        Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
        Sheet.cells[vultimalinha,1].Borders.Item[$0000000A].Color := clblack;
        Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Weight := $FFFFEFD6;
        Sheet.cells[vultimalinha,1].Borders.Item[$00000008].Color := clblack;
    //      Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
        Sheet.cells[vultimalinha,1].Interior.Color := $00ffcf9c; // Cor da Célula
        Sheet.cells[vultimalinha,1].font.bold := true; // Negrito

        Sheet.cells[vultimalinha,2].HorizontalAlignment := 4;
        Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Weight := $00000002;
        Sheet.cells[vultimalinha,2].Borders.Item[$00000009].Color := clblack;
        Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Weight := $00000002;
        Sheet.cells[vultimalinha,2].Borders.Item[$00000007].Color := clblack;
        Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Weight := $00000002;
        Sheet.cells[vultimalinha,2].Borders.Item[$0000000A].Color := clblack;
        Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Weight := $00000002;
        Sheet.cells[vultimalinha,2].Borders.Item[$00000008].Color := clblack;
        vultimalinha:=vultimalinha+1;
      end;
      CadBalancoHw.vIndicesBal.next;
    end;
    CadBalancoHw.vIndicesBal.First;

    Sheet.SaveAs(ExtractFilePath(Application.ExeName)+'BALANCO GERENCIAL.xls');
  //  objExcel.Workbooks[1].close(ExtractFilePath(Application.ExeName)+'fluxo.xls');
  //  objExcel.Quit;
  end;
  Application.MessageBox('Arquivo Gerado com Sucesso!', 'Confirmação', MB_OK); // Gravará na tabela de resultado o dpto 99
end;

procedure TFrmFinanceiros.BitBtn15Click(Sender: TObject);
//var
//  gestor: TGestorFormularios;
begin
  inherited;
//  gestor := TGestorFormularios.Create;
  if not vDadosIni.PesqPros('GES012','GRAVAR RESULTADO','MES/ANO: '+maskedit1.text+'/'+MaskEdit2.text,'','',CadBalancoHw.buscas,True) then
   Exit;
 if LbApuracao.Caption = 'APURADO' then
 begin
  if Application.MessageBox('Balanço já apurado, Tem certeza que deseja substituir esta apuração?',
   'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON1)  = mrYES then
   if CadBalancoHw.GravaBalanco(StAtCirculante,StAtRealizavelLp,StAPermanente,
   StPsCirculante,StPasExigivelLp,cadempresasfin,EdtPatLiquido.Valor) then
   begin
     LbApuracao.Font.Color:=clNavy;
     LbApuracao.Caption:='APURADO';
   end;
 end
 else
 begin
  if Application.MessageBox('Tem certeza que deseja gravar esta apuração?',
   'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON1)  = mrYES then
   if CadBalancoHw.GravaBalanco(StAtCirculante,StAtRealizavelLp,StAPermanente,
   StPsCirculante,StPasExigivelLp,cadempresasfin,EdtPatLiquido.Valor) then
   begin
     LbApuracao.Font.Color:=clNavy;
     LbApuracao.Caption:='APURADO';
   end;
 end;

end;

procedure TFrmFinanceiros.BitBtn16Click(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('GES022','REFAZER SOMA','BALANCO GERENCIAL PATRIMONIAL','','',CadBalancoHw.buscas,True) then
 Exit;
CadBalancoHw.somaGrids(StAtCirculante,StAtRealizavelLp,StAPermanente,
StPsCirculante,StPasExigivelLp,cadempresasfin);
EdtAtCirculante.Valor:=CadBalancoHw.Vvatcirc;
EdtAtRLP.Valor:=CadBalancoHw.vvastrealp;
EdtAtPermanente.Valor:=CadBalancoHw.vvstperm;
EdtSomaAtivo.Valor:=EdtAtCirculante.Valor+EdtAtRLP.Valor+EdtAtPermanente.Valor;
EdtPCirculante.Valor:=CadBalancoHw.vvstpascirc;
EdtEXLP.Valor:=CadBalancoHw.vvstpasexlp;
EdtPatLiquido.Valor:=CadBalancoHw.vpatLiq;
EdtDifMesant.Valor:=CadBalancoHw.vdifPatlIqM;
EdtDifAnoAnterior.valor:=CadBalancoHw.vdifPatliqA;
EdtSomaPassivo.valor:=(EdtPCirculante.valor+EdtEXLP.Valor+EdtPatLiquido.valor);
CadBalancoHw.apagaindemapuracao;
CadBalancoHw.VerIndices(DBGrid1,cadempresasfin.vCodEmpresas);
end;

procedure TFrmFinanceiros.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if not cadempresasfin.VerificaEmpresas(cklbEmpresas) then
    exit;
  CadDREHW.vCodEmpresasDRE:=cadempresasfin.vempresas;
  if CadDREHW.verificavinculacaodpto(2) then
  begin
   Application.CreateForm(TFrmVisualDpto,FrmVisualDpto);
   FrmVisualDpto.ShowModal;
   FrmVisualDpto.Free;
   CadDREHW.buscas.Close;
  end;
end;

procedure TFrmFinanceiros.BitBtn18Click(Sender: TObject);
var
  OpenDesktop, Documento, Sheets, Sheet, Celula, Planilha: Variant;
  Connect, OpenOffice: Variant;
  i, j: integer;
  objExcel, Chart, s : Variant;
  cTitulo : string;
  vSize: Integer;
begin
  inherited;
  //
  if not vDadosIni.PesqPros('GES024','EXPORTAR EXCEL','DE '+maskedit3.text+' A '+maskedit4.text,'','',CadBalancoHw.buscas,True) then
    Exit;
  cTitulo := 'Planilha de DRE';
 if (vDadosIni.vOpenOfficeExportRel = 'S') then
 begin
 	 //Cria o link OLE com o OpenOffice
   try
     if VarIsEmpty(OpenOffice) then
       OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
   except
     Application.MessageBox ('Versão do OpenOffice Calc Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
     exit;
   end;
   Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

   //Inicia o Calc
   OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
   Documento   := OpenDesktop.LoadComponentFromURL('private:factory/scalc',
                    '_blank', 0, VarArrayCreate([0, -1], varVariant));
   Planilha    := Documento.getSheets.getByName('Planilha1');
   Sheets      := Documento.Sheets;
   Sheet       := Sheets.getByIndex(0);

   i := 0;
   j := 0;

   //Criar linha inicial
   Celula := Planilha.getCellByPosition(i, 0);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(i, 0).setString('FLUXO DE CAIXA '+
   	 MaskEdit3.Text + ' a ' + MaskEdit4.Text+' EMPRESAS: '+cadempresasfin.vnomeemps);

   //Definir largura colunas
   for I := 0 to StringGrid2.ColCount - 1 do
   begin
     vSize := Length(Trim(StringGrid2.Cells[0, j]));
     Planilha.getColumns.getByIndex(i).width := vSize * 300;
   end;

   //Preencher colunas planilha
   for I := 0 to StringGrid2.ColCount - 1 do
   begin
     for j := 0 to StringGrid2.RowCount - 1 do
     begin
      	 if (J > 0) and (I > 0) and (Trim(StringGrid2.Cells[i,j]) <> '') and (I <> StringGrid2.ColCount - 1) then
         	 Sheet.getCellByPosition(i, j + 1).setValue(StrToFloat(Trim(StringReplace(StringGrid2.Cells[i,j], '.', '', [rfReplaceAll, rfIgnoreCase]))))
         else
	         Sheet.getCellByPosition(i, j + 1).setString(Trim(StringGrid2.Cells[i,j]));

         Celula := Planilha.getCellByPosition(i, j + 1);
         if (i = 0) or (j = 0) or (j = StringGrid2.RowCount - 1) then
         begin
           Celula.CharWeight := 200;
           Celula.CellBackColor := '13893372';
         end;

         if (i <> 0) then
         begin
         	 Celula.HoriJustify   := 3;
           Celula.NumberFormat := 4;
         end;

         Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
         Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
         Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
         Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
     end;
   end;
 end
 else
 begin
 	 try
   	 try
	     objExcel := CreateOleObject('Excel.Application');
     except
    	 Application.MessageBox ('Versão do Microsoft Office Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
    	 exit;
     end;
     objExcel.Visible := False;
     objExcel.Caption := cTitulo;
     objExcel.Workbooks.add;
    // objExcel.Workbooks[1].sheets.add;
     Sheet:=objExcel.Workbooks[1].sheets[1];
     Sheet.cells[1,1]:='FLUXO DE CAIXA '+
   	 	 MaskEdit3.Text + ' a ' + MaskEdit4.Text+' EMPRESAS: '+cadempresasfin.vnomeemps;
     for I := 0 to StringGrid2.RowCount-1 do
     begin
      for j := 0 to 14 do
      begin
        Sheet.cells[i+1,j+1]:=StringGrid2.Cells[j,i];
        if ((i+1) = 1) or ((j+1) = 1) or ((i+1) = (StringGrid2.RowCount)) then
        begin
          Sheet.cells[i+1,j+1].Font.size := 10;
          Sheet.cells[i+1,j+1].ColumnWidth := 20;
          Sheet.cells[i+1,j+1].Borders.Item[$00000009].Weight := $FFFFEFD6;
          Sheet.cells[i+1,j+1].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[i+1,j+1].Borders.Item[$00000007].Weight := $FFFFEFD6;
          Sheet.cells[i+1,j+1].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[i+1,j+1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
          Sheet.cells[i+1,j+1].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[i+1,j+1].Borders.Item[$00000008].Weight := $FFFFEFD6;
          Sheet.cells[i+1,j+1].Borders.Item[$00000008].Color := clblack;
    //      Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
          Sheet.cells[i+1,j+1].Interior.Color := $00ffcf9c; // Cor da Célula
          Sheet.cells[i+1,j+1].font.bold := true; // Negrito
          if ((i+1) = (StringGrid2.RowCount)) then
            Sheet.cells[i+1,j+1].HorizontalAlignment := 4;
        end
        else
        begin
         Sheet.cells[i+1,j+1].HorizontalAlignment := 4;
         Sheet.cells[i+1,j+1].Borders.Item[$00000009].Weight := $00000002;
         Sheet.cells[i+1,j+1].Borders.Item[$00000009].Color := clblack;
         Sheet.cells[i+1,j+1].Borders.Item[$00000007].Weight := $00000002;
         Sheet.cells[i+1,j+1].Borders.Item[$00000007].Color := clblack;
         Sheet.cells[i+1,j+1].Borders.Item[$0000000A].Weight := $00000002;
         Sheet.cells[i+1,j+1].Borders.Item[$0000000A].Color := clblack;
         Sheet.cells[i+1,j+1].Borders.Item[$00000008].Weight := $00000002;
         Sheet.cells[i+1,j+1].Borders.Item[$00000008].Color := clblack;
        end;
      end;
     end;
     Sheet.SaveAs(ExtractFilePath(Application.ExeName)+'fluxo.xls');
     // objExcel.Workbooks[1].close(ExtractFilePath(Application.ExeName)+'fluxo.xls');
     // objExcel.Quit;
   finally
   	 objExcel.Visible := True;
   end;
 end;
 Application.MessageBox('Arquivo Gerado com Sucesso!', 'Confirmação', MB_OK); // Gravará na tabela de resultado o dpto 99
end;

procedure TFrmFinanceiros.BitBtn19Click(Sender: TObject);
var
  OpenDesktop, Documento, Sheets, Sheet, Celula, Planilha: Variant;
  Connect, OpenOffice: Variant;
  i, j, p: integer;
  objExcel, Chart,s : Variant;
  cTitulo : string;
  vSize: Integer;
begin
  inherited;
  //
  if not vDadosIni.PesqPros('GES018','EXPORTAR EXCEL','MES/ANO: '+edit1.text+'/'+edit2.text,'','',CadBalancoHw.buscas,True) then
    Exit;
  cTitulo := 'Planilha de DRE';
  if (vDadosIni.vOpenOfficeExportRel = 'S') then
  begin
    //Cria o link OLE com o OpenOffice
    try
      if VarIsEmpty(OpenOffice) then
        OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
    except
    	Application.MessageBox ('Versão do OpenOffice Calc Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
    	exit;
    end;
    Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

    //Inicia o Calc
    OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
    Documento   := OpenDesktop.LoadComponentFromURL('private:factory/scalc',
                     '_blank', 0, VarArrayCreate([0, -1], varVariant));
    Planilha    := Documento.getSheets.getByName('Planilha1');
    Sheets      := Documento.Sheets;
    Sheet       := Sheets.getByIndex(0);

    i := 0;
    j := 0;

    //Criar linha inicial
    Celula := Planilha.getCellByPosition(i, 0);
    Celula.CharWeight := 200;
    Sheet.getCellByPosition(i, 0).setString('DEMONSTRAÇÃO DE RESULTADOS MÊS '+
    	vDadosIni.StrZero(StrToInt(edit1.text),2) + '/' + Edit2.Text+' EMPRESAS: '+cadempresasfin.vnomeemps);

    //Definir largura colunas
    for I := 0 to StringGrid1.ColCount -1 do
    begin
      vSize := Length(Trim(StringGrid1.Cells[0, j]));
      Planilha.getColumns.getByIndex(i).width := vSize * 500;
    end;

    //Preencher colunas planilha
    for I := 0 to StringGrid1.ColCount - 1 do
    begin
      for j := 0 to StringGrid1.RowCount - 1 do
      begin
        if (J > 0) and (I > 0) and (Trim(StringGrid1.Cells[i, j]) <> '') then
          Sheet.getCellByPosition(i, j + 1).setValue(StrToFloat(Trim(StringReplace(StringGrid1.Cells[i,j], '.', '', [rfReplaceAll, rfIgnoreCase]))))
        else
	        Sheet.getCellByPosition(i, j + 1).setString(Trim(StringGrid1.Cells[i, j]));

        Celula := Planilha.getCellByPosition(i, j + 1);
        if (j = 0) then// (i = 0) or (j = 0) then
        begin
        	Celula.CharWeight := 200;
          Celula.CellBackColor := '39423';
        end
        else if ((j mod 2) = 1) then
        begin
        	if (i <> 0) then
          begin
        		Celula.HoriJustify  := 3;
            Celula.NumberFormat := 4;
          end;
          Celula.CellBackColor := 8303567;
        end
        else
        begin
        	if (i <> 0) then
          begin
	        	Celula.HoriJustify   := 3;
            Celula.NumberFormat := 4;
          end;
          Celula.CellBackColor := 13893372;
        end;
        Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
        Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
      end;
    end;

    J := StringGrid1.RowCount + 2;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(GroupBox9.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Sheet.getCellByPosition(1, J).setString('');

    J := J + 1;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(Label11.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.CharWeight := 200;
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Sheet.getCellByPosition(1, J).setValue(StrToFloat(Trim(StringReplace(Label12.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]))));

    J := J + 1;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(Label22.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.CharWeight := 200;
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Sheet.getCellByPosition(1, J).setValue(StrToFloat(Trim(StringReplace(Label24.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]))));

    J := J + 1;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(Label6.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.CharWeight := 200;
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Sheet.getCellByPosition(1, J).setValue(StrToFloat(Trim(StringReplace(Label8.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]))));

    J := J + 1;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(Label13.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.CharWeight := 200;
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Sheet.getCellByPosition(1, J).setValue(StrToFloat(Trim(StringReplace(Label14.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]))));

    J := J + 1;
    J := J + 2;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.LeftBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(GroupBox10.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Sheet.getCellByPosition(1, J).setString('');

    J := J + 1;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.LeftBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(Label62.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.CharWeight := 200;
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Sheet.getCellByPosition(1, J).setValue(StrToFloat(Trim(StringReplace(Label61.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]))));

    J := J + 1;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.LeftBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(Label63.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.CharWeight := 200;
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Sheet.getCellByPosition(1, J).setValue(StrToFloat(Trim(StringReplace(Label64.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]))));

    J := J + 1;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.LeftBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(Label65.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.CharWeight := 200;
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Sheet.getCellByPosition(1, J).setValue(StrToFloat(Trim(StringReplace(Label66.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]))));

    J := J + 1;
    Celula := Planilha.getCellByPosition(0, J);
    Celula.CharWeight := 200;
    Celula.LeftBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Sheet.getCellByPosition(0, J).setString(Trim(Label67.Caption));

    Celula := Planilha.getCellByPosition(1, J);
    Celula.CharWeight := 200;
    Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
    Celula.HoriJustify   := 3;
    Celula.NumberFormat := 4;
    Sheet.getCellByPosition(1, J).setValue(StrToFloat(Trim(StringReplace(Label68.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]))));

    J := J + 1;
  end
  else
  begin
  	try
    	try
      	objExcel := CreateOleObject('Excel.Application');
      except
        Application.MessageBox ('Versão do Microsoft Office Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
        exit;
      end;
      objExcel.Visible := False;
      objExcel.Caption := cTitulo;
      objExcel.Workbooks.add;
      // objExcel.Workbooks[1].sheets.add;
      Sheet:=objExcel.Workbooks[1].sheets[1];
      Sheet.cells[1,1]:='DEMONSTRAÇÃO DE RESULTADOS MÊS '+vDadosIni.StrZero(StrToInt(edit1.text),2)+'/'+
      Edit2.Text+' EMPRESAS: '+cadempresasfin.vnomeemps;
      try
      objExcel.range['A1:J1'].merge;
      except

      end;
      p:=3;
      for I := 0 to StringGrid1.RowCount-1 do
      begin
       for j := 0 to 10 do
       begin
         Sheet.cells[i+p,j+1]:=StringGrid1.Cells[j,i];
         if ((i+1) = 1) or ((j+1) = 1) or ((i+1) = (StringGrid1.RowCount)) then
         begin
           Sheet.cells[i+p,j+1].Font.size := 10;
           Sheet.cells[i+p,j+1].ColumnWidth := 20;
           Sheet.cells[i+p,j+1].Borders.Item[$00000009].Weight := $FFFFEFD6;
           Sheet.cells[i+p,j+1].Borders.Item[$00000009].Color := clblack;
           Sheet.cells[i+p,j+1].Borders.Item[$00000007].Weight := $FFFFEFD6;
           Sheet.cells[i+p,j+1].Borders.Item[$00000007].Color := clblack;
           Sheet.cells[i+p,j+1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
           Sheet.cells[i+p,j+1].Borders.Item[$0000000A].Color := clblack;
           Sheet.cells[i+p,j+1].Borders.Item[$00000008].Weight := $FFFFEFD6;
           Sheet.cells[i+p,j+1].Borders.Item[$00000008].Color := clblack;
     //      Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
           Sheet.cells[i+p,j+1].Interior.Color := $00ffcf9c; // Cor da Célula
           Sheet.cells[i+p,j+1].font.bold := true; // Negrito
           if ((i+1) = (StringGrid1.RowCount)) then
            Sheet.cells[i+p,j+1].HorizontalAlignment := 4;
         end
         else
         begin
          Sheet.cells[i+p,j+1].HorizontalAlignment := 4;
          Sheet.cells[i+p,j+1].Borders.Item[$00000009].Weight := $00000002;
          Sheet.cells[i+p,j+1].Borders.Item[$00000009].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$00000007].Weight := $00000002;
          Sheet.cells[i+p,j+1].Borders.Item[$00000007].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$0000000A].Weight := $00000002;
          Sheet.cells[i+p,j+1].Borders.Item[$0000000A].Color := clblack;
          Sheet.cells[i+p,j+1].Borders.Item[$00000008].Weight := $00000002;
          Sheet.cells[i+p,j+1].Borders.Item[$00000008].Color := clblack;
         end;
       end;
      end;

      I := StringGrid1.RowCount + 4;
      Sheet.cells[i, 1] := GroupBox9.Caption;
      I := I + 1;
      Sheet.cells[i, 1] := Label11.Caption;
      Sheet.cells[i, 2] := Label12.Caption;
      I := I + 1;
      Sheet.cells[i, 1] := Label22.Caption;
      Sheet.cells[i, 2] := Label24.Caption;
      I := I + 1;
      Sheet.cells[i, 1] := Label6.Caption;
      Sheet.cells[i, 2] := Label8.Caption;
      I := I + 1;
      Sheet.cells[i, 1] := Label13.Caption;
      Sheet.cells[i, 2] := Label14.Caption;
      I := I + 1;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000009].Weight := $FFFFEFD6;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000009].Color := clblack;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000007].Weight := $FFFFEFD6;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000007].Color := clblack;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$0000000A].Weight := $FFFFEFD6;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$0000000A].Color := clblack;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000008].Weight := $FFFFEFD6;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000008].Color := clblack;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Font.Bold := True;
      // objExcel.Range['A' + IntToStr(I - 5) +':A' + IntToStr(i - 1 )].Interior.Color := $00ffcf9c; // Cor da Célula


      I := I + 2;
      Sheet.cells[i, 1] := GroupBox10.Caption;
      I := I + 1;
      Sheet.cells[i, 1] := Label62.Caption;
      Sheet.cells[i, 2] := Label61.Caption;
      I := I + 1;
      Sheet.cells[i, 1] := Label63.Caption;
      Sheet.cells[i, 2] := Label64.Caption;
      I := I + 1;
      Sheet.cells[i, 1] := Label65.Caption;
      Sheet.cells[i, 2] := Label66.Caption;
      I := I + 1;
      Sheet.cells[i, 1] := Label67.Caption;
      Sheet.cells[i, 2] := Label68.Caption;
      I := I + 1;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000009].Weight := $FFFFEFD6;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000009].Color := clblack;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000007].Weight := $FFFFEFD6;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000007].Color := clblack;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$0000000A].Weight := $FFFFEFD6;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$0000000A].Color := clblack;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000008].Weight := $FFFFEFD6;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Borders.Item[$00000008].Color := clblack;
      objExcel.Range['A' + IntToStr(I - 5) +':B' + IntToStr(i - 1 )].Font.Bold := True;
      // objExcel.Range['A' + IntToStr(I - 5) +':A' + IntToStr(i - 1 )].Interior.Color := $00ffcf9c; // Cor da Célula

      Sheet.SaveAs(ExtractFilePath(Application.ExeName)+'DRE.xls');
      // objExcel.Workbooks[1].close(ExtractFilePath(Application.ExeName)+'fluxo.xls');
      // objExcel.Quit;
    finally
    	objExcel.Visible := True;
    end;
  end;
  Application.MessageBox('Arquivo Gerado com Sucesso!', 'Confirmação', MB_OK); // Gravará na tabela de resultado o dpto 99
end;

procedure TFrmFinanceiros.BitBtn1Click(Sender: TObject);
var
 	vtemp: string;
   vcodigo: Double;
   I: Integer;
 //  gestor: TGestorFormularios;
begin
   inherited;
   try
     Screen.Cursor := crHourGlass;
     //gestor := TGestorFormularios.Create;
     if not vDadosIni.PesqPros('GES011','GERAR','MES/ANO: '+maskedit1.text+'/'+MaskEdit2.text,'','',CadBalancoHw.buscas,True) then
      EXIT;

     cadempresasfin.buscas.Close;
     cadempresasfin.buscas.SQL.Text := ' SELECT FIRST 20 ' + vDadosIni.codEmpresa + ' CODIGO_EMP, ' +
       ' P_CONTAS.N_CONTA_PLC, P_CONTAS.DESC_PLC FROM P_CONTAS ' +
       ' WHERE P_CONTAS.ATIVO = 1 AND COALESCE(P_CONTAS.DESAT_VINC_BALANCO, ''N'') = ''N'' ' +
       ' AND (SELECT COUNT(*) FROM P_CONTAS_BALANCO PBAL ' +
       ' WHERE PBAL.N_CONTA_PLC = P_CONTAS.N_CONTA_PLC AND PBAL.COD_EMPRESA = ' + vDadosIni.codEmpresa + ') = 0 ' +
       ' ORDER BY 3, 1 ';
     cadempresasfin.buscas.Open;
     cadempresasfin.buscas.FetchAll;

     vtemp := '';
     vcodigo := 0;
     I := 0;
     if not cadempresasfin.buscas.IsEmpty then
     begin
       cadempresasfin.buscas.First;
       while not cadempresasfin.buscas.Eof do
       begin
          if (vcodigo <> cadempresasfin.buscas.FieldByName('N_CONTA_PLC').AsFloat) then
          begin
             Inc(I);
            vtemp := vtemp + vDadosIni.IfThen(trim(vtemp) = '', '', #13) +
             trim(cadempresasfin.buscas.FieldByName('DESC_PLC').AsString) +
              ' - Empresa(s): ' + IntToStr(cadempresasfin.buscas.FieldByName('CODIGO_EMP').AsInteger);
          end
          else
             vtemp := vtemp + ',' + IntToStr(cadempresasfin.buscas.FieldByName('CODIGO_EMP').AsInteger);
          vcodigo := cadempresasfin.buscas.FieldByName('N_CONTA_PLC').AsFloat;

          cadempresasfin.buscas.Next;
       end;
       if I >= 20 then
         vtemp := vtemp + #13 + '...';
       vtemp := vtemp + #13 + #13 + 'Favor verificar!';
      Application.MessageBox(PChar(vtemp), 'Plano de contas sem vínculo com o balanço', MB_OK);
     end;

     vtemp := '';
     vcodigo := 0;
     I := 0;
     cadempresasfin.buscas.Close;
     cadempresasfin.buscas.SQL.Text := ' SELECT FIRST 20 CONTROLES.CODIGO_EMP, ' +
       ' CONTROLES.CODIGO_CTRL, CONTROLES.NOME_CTRL FROM CONTROLES ' +
       ' WHERE CONTROLES.ATIVO = 1 AND COALESCE(CONTROLES.DESAT_VINC_BALANCO, ''N'') = ''N'' ' +
       ' AND (SELECT COUNT(*) FROM CONTROLES_BALANCO CBAL ' +
       ' WHERE CBAL.CODIGO_CTRL = CONTROLES.CODIGO_CTRL AND CBAL.COD_EMPRESA = CONTROLES.CODIGO_EMP ) = 0 ' +
       ' ORDER BY 3, 1 ';
     cadempresasfin.buscas.Open;
     cadempresasfin.buscas.FetchAll;

     if not cadempresasfin.buscas.IsEmpty then
     begin
       cadempresasfin.buscas.First;
       while not cadempresasfin.buscas.Eof do
       begin
          if (vcodigo <> cadempresasfin.buscas.FieldByName('CODIGO_CTRL').AsInteger) then
          begin
            Inc(I);
            vtemp := vtemp + vDadosIni.IfThen(trim(vtemp) = '', '', #13) +
               trim(cadempresasfin.buscas.FieldByName('NOME_CTRL').AsString) +
               ' - Empresa(s): ' + IntToStr(cadempresasfin.buscas.FieldByName('CODIGO_EMP').AsInteger);
          end
          else
            vtemp := vtemp + ',' + IntToStr(cadempresasfin.buscas.FieldByName('CODIGO_EMP').AsInteger);

          vcodigo := cadempresasfin.buscas.FieldByName('CODIGO_CTRL').AsInteger;
          cadempresasfin.buscas.Next;
       end;
       if I >= 20 then
         vtemp := vtemp + #13 + '...';
       vtemp := vtemp + #13 + #13 + 'Favor verificar!';
       Application.MessageBox(PChar(vtemp), 'Controles sem vínculo com o balanço', MB_OK);
     end;

     if not cadempresasfin.VerificaEmpresas(cklbEmpresas) then
       exit;
     CadBalancoHw.vCodEmpresasDRE:=cadempresasfin.vempresas;
     //CadBalancoHw.vversao:='4.0';
     try
       CadBalancoHw.vmesinf:=strtoint(MaskEdit1.text);
       CadBalancoHw.vano:=StrToInt(maskedit2.text);
       CadBalancoHw.vanoinf:=StrToInt(maskedit2.text);
     except
       Application.MessageBox('Mês e Ano não informado(s) ou informado(s) incorretamente!', 'Confirmação', MB_OK);
       exit;
     end;
     if length(cadempresasfin.vCodEmpresas) > 1 then
     begin
       Application.MessageBox('Balanço só pode ser apurado por empresa, selecione uma empresa específica!', 'Confirmação', MB_OK);
       exit;
     end;
     CadBalancoHw.ultapura;
     label58.Caption:=CadBalancoHw.vultApura;
     if Application.MessageBox('Confirma a Geração do Balanço para este mês/Ano informado?',
       'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON1)  = mrNO then
        exit;
     LbApuracao.Font.Color:=clRed;
     LbApuracao.Caption:='EM APURAÇÃO';
     CadBalancoHw.vlblestoque:=TLabel(LbEstoque);
     if chkdesconsidPME.Checked then
       CadBalancoHw.vdesconsideraPME:=true
     else
       CadBalancoHw.vdesconsideraPME:=false;
     if chkdesconsidPMPF.Checked then
       CadBalancoHw.vdesconsideraPMPF:=true
     else
       CadBalancoHw.vdesconsideraPMPF:=false;
     if not CadBalancoHw.montarBalanco(StAtCirculante,StAtRealizavelLp,StAPermanente,StPsCirculante,StPasExigivelLp,cadempresasfin.vCodEmpresas) then
     begin
       if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
         MaskEdit1.setfocus;
     end
     else
     begin
       BitBtn16Click(Sender);
       if CadBalancoHw.vstatusbal = 'S' then
       begin
         LbApuracao.Font.Color:=clNavy;
         LbApuracao.Caption:='APURADO';
         BitBtn20.Enabled:=true;
       end
       else
       begin
         LbApuracao.Font.Color:=clRed;
         LbApuracao.Caption:='EM APURAÇÃO';
         BitBtn20.Enabled:=false;
       end;
       if RadioButton1.Checked then
         CadBalancoHw.vregime:='COMP'
       else
         CadBalancoHw.vregime:='CAIXA';
       CadBalancoHw.VerIndices(DBGrid1,cadempresasfin.vCodEmpresas);
     end;
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmFinanceiros.BitBtn20Click(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('GES013','EXCLUIR RESULTADO','MES/ANO: '+maskedit1.text+'/'+MaskEdit2.text,'','',CadBalancoHw.buscas,True) then
 Exit;
CadBalancoHw.apagarbalapur;
end;

procedure TFrmFinanceiros.BitBtn21Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('GES020','VISUALIZAR ATRASADOS','DE '+maskedit3.text+' A '+maskedit4.text,'','',CadBalancoHw.buscas,True) then
   Exit;
   Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
   cadFluxo.caddesp.vdat1:=StrToDate('01/01/1990');
   cadFluxo.caddesp.vdat2:=StrToDate(MaskEdit3.text)-1;
   cadFluxo.caddesp.ApagarBI(cadFluxo.vCodEmpresasDRE,FrmVisualizaOlap.HCubeGERAL, 'F');
   FrmVisualizaOlap.Label1.Caption:='Detalhes de Contas a Pagar';
   FrmVisualizaOlap.ShowModal;
end;

procedure TFrmFinanceiros.BitBtn22Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('GES078', 'ABRIR','', '', '', CadBalancoHw.buscas,True) then
    Exit;
  Application.CreateForm(TfrmRelDREComparativo, frmRelDREComparativo);
  frmRelDREComparativo.ShowModal;
end;

procedure TFrmFinanceiros.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('GES020','VISUALIZAR ATRASADOS','DE '+maskedit3.text+' A '+maskedit4.text,'','',CadBalancoHw.buscas,True) then
   Exit;
  Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
  cadFluxo.cadctrlCredCheq.BIAtrasados(cadempresasfin.vempresas,FrmVisualizaOlap.HCubeGERAL,StrToDate(MaskEdit3.text));
  FrmVisualizaOlap.Label1.Caption:='Detalhes de Créditos atrasados';
  FrmVisualizaOlap.ShowModal;
end;

procedure TFrmFinanceiros.BitBtn3Click(Sender: TObject);
var
	vDBGrid1: boolean;
  vRadioButton1: boolean;
  vRadioButton2: boolean;
  vCkUsarValoresContabeis: boolean;
begin
  inherited;
  try
  	vDBGrid1 := DBGrid1.Enabled;
    vRadioButton1 := RadioButton1.Enabled;
    vRadioButton2 := RadioButton2.Enabled;
    vCkUsarValoresContabeis := CkUsarValoresContabeis.Enabled;

    DBGrid1.Enabled:=false;
    RadioButton1.Enabled:=false;
    RadioButton2.Enabled:=false;
    ckUsarValoresContabeis.Enabled:=false;
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('GES015','OBTER RESULTADOS','MES/ANO: '+edit1.text+'/'+edit2.text,'','',CadDREHW.buscas,True) then
     Exit;
    if not cadempresasfin.VerificaEmpresas(cklbEmpresas) then
      exit;
    CadDREHW.vCodEmpresasDRE:=cadempresasfin.vempresas;
    CadDREHW.vversao:='4.0';
    CadDREHW.vmesinf:=strtoint(Edit1.text);
    CadDREHW.vano:=StrToInt(edit2.text);
    CadDREHW.vContabil := ckUsarValoresContabeis.Checked;
    CadDREHW.vMesesMedia := StrToIntDef(Trim(Edit3.Text), 0);
    CadDREHW.defineregime(RadioButton1,RadioButton2);
    if not CadDREHW.MontaDRE(DBGrid1,StringGrid1,StringGrid4,'D') then
    begin
    	if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
	      Edit1.setfocus;
    end
    else
    begin
     Label12.Caption:=Format('%n',[CadDREHW.vpequilibrio]);
     Label14.Caption:=Format('%n',[CadDREHW.vlucratividade]);
     Label24.Caption:=format('%8.4f', [CadDREHW.vmargem]);
     Label8.Caption:=format('%8.4f', [CadDREHW.vmarkupmin]);

     Label61.Caption:=Format('%n',[CadDREHW.vpequilibrioMed]);
     Label68.Caption:=Format('%n',[CadDREHW.vlucratividadeMed]);
     Label64.Caption:=format('%8.4f', [CadDREHW.vmargemMed]);
     Label66.Caption:=format('%8.4f', [CadDREHW.vmarkupminMed]);
     GroupBox10.Caption := 'Médias últimos ' + IntToStr(CadDREHW.vMesesMedia) + ' meses';
    end;
  //vteste:=cadempresasfin.vempresas;
	finally
  	if vDBGrid1 then
	  	DBGrid1.Enabled:=true;
    if vRadioButton1 then
	    RadioButton1.Enabled:=true;
    if vRadioButton2 then
	    RadioButton2.Enabled:=true;
    if vCkUsarValoresContabeis then
	    ckUsarValoresContabeis.Enabled:=true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmFinanceiros.BitBtn4Click(Sender: TObject);
begin
  inherited;
  CadDREHW.vgerarGrafico(DBGrid2,Chart2,Chart3,StringGrid5,1);
  atualizaGrafico(stringgrid5,chart2);
  CadDREHW.vgerarGrafico(DBGrid2,Chart2,Chart3,StringGrid6,2);
  atualizaGrafico(stringgrid6,chart3);
  panel11.Caption:='Tendências Ano Informado: '+inttostr(CadDREHW.vanoinf);
  panel12.Caption:='Tendências Ano: '+inttostr(CadDREHW.vanoinf-1);
end;

function TFrmFinanceiros.LinhaDest(GradeP: TStringGrid; inicial: integer): integer;
var
  j: integer;
begin
  LinhaDest := inicial;
  for j := inicial to GradeP.RowCount - 1 do
  begin
    if pos('.', GradeP.Cells[0, j]) > 0 then
    begin
      LinhaDest := j;
      break;
    end;
  end;
end;


procedure TFrmFinanceiros.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmFinanceiros.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmFinanceiros.PgFinanceirosChange(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
  	exit;

  cklbEmpresas.Enabled := (PgFinanceiros.ActivePage = TabSheet1) or (PgFinanceiros.ActivePage = TabSheet3);

  if (PgFinanceiros.ActivePage = TabSheet1) or (PgFinanceiros.ActivePage = TabSheet3) then
  begin
    cadempresasfin.abreEmpresas(vDadosIni.IfThen(
    	(vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vEmp.vCodigoUnificadora > 0),
      vDadosIni.vEmp.vCodigoUnificadora, 1));
	  cadempresasfin.preenchChecklist(cklbEmpresas);
  end
  else if (PgFinanceiros.ActivePage = TabSheet2) or (PgFinanceiros.ActivePage = TabSheet4) then
  begin
    cadempresasfin.abreEmpresas;
	  cadempresasfin.preenchChecklist(cklbEmpresas);
  end;
end;

function TFrmFinanceiros.AtribuirBoras(pOpenOffice, Cor, EspLinInter, EspLinExter, DistLinha: Variant): Variant;
var
	otherRef: Variant;
begin
	otherRef := pOpenOffice.createInstance('com.sun.star.reflection.CoreReflection');
  otherRef.forName('com.sun.star.table.BorderLine').createObject(result);
  result.Color := Cor;
  result.InnerLineWidth := EspLinInter;
  result.OuterLineWidth := EspLinExter;
  result.LineDistance   := DistLinha;
end;

procedure TFrmFinanceiros.somavaloresGrid(vstatcir, vstatreallp, vstatperm,
  vstpcirc, vstexlp: Tstringgrid; vedtatcir, vedtareallp, vedtaperm,
  vedtpascirc, vedtexlp, vedtpatliq: TEditMoeda);
var
 itl: integer;
begin
//
   for itl:=1 to (vstatcir.RowCount-1) do
   begin
      vedtatcir.Valor:=vedtatcir.Valor+StrToCurr(vDadosIni.tirapontos(vstatcir.Cells[1,itl],2));
   end;
end;

function TFrmFinanceiros.GeraTabelaHTML(GradeP: TStringGrid; Borda: string): string;
var
  Tabela: string;
  itt, i, j: Integer;
  vini, vlinha, flg: integer;
  vl, vl1, vl2: integer;
begin
  try
    // gera a tabela
    Tabela := Tabela + '<Table Width="100%" Border=' + Borda + ' cellspacing="0" cellpadding="0"><TR>';
    for i := 0 to GradeP.ColCount - 1 do
      Tabela := Tabela + '<TD bgcolor="blue" height="35"><font size="1"><b>' + GradeP.Cells[i, 0] + '</b></font></TD>';
    vini := 1;
    vlinha:=0;
    while vlinha <= GradeP.RowCount - 1 do
    begin
      Tabela := Tabela + '</TR><TR>';
      vlinha := LinhaDest(GradeP, vini);
      for i := 0 to GradeP.colCount - 1 do
      begin
        vl := 0;
        vl1 := 0;
        vl2 := 0;
        flg := 0;
        {for itt:= 0 to 200 do
        begin
         if ( i = vtcolor[itt]) then
         begin
          flg:=1;
          break;
         end
         else
          if ( i = vtcolor1[itt])  then
          begin
           flg:=2;
           break;
          end
          else
           flg:=3;
        end;
        if flg = 1 then
         tabela:=tabela+'<TD background="verde.png" height="25">'
        else
         if flg = 2 then
           Tabela := Tabela + '<TD background="azul.png" height="30">'
         else}
        if vini = vlinha then
        else
        begin
          Tabela := Tabela + '<TD>';
          for j := vini to vlinha - 1 do
          begin
            if GradeP.Cells[i, j] = '' then
            begin
              //            bgcolor="green" height="25">';
              Tabela := Tabela + '<div align="right"><font size="2">' + '&nbsp;' + '</font></div>';
            end
            else
            begin
              Tabela := Tabela + '<div align="right"><font size="2">' + trim(GradeP.Cells[i, j]) + '</font></div>';
            end;
          end;
          Tabela := Tabela + '</TD>';
        end;
      end;
      if vini = vlinha then
      else
        Tabela := Tabela + '<TR>';
      for j := 0 to GradeP.ColCount - 1 do
      begin
        if GradeP.Cells[j, vlinha] = '' then
          Tabela := Tabela + '<TD><div align="right">' + '&nbsp;' + '</div></TD>'
        else
          Tabela := Tabela + '<TD background="verde.png"><div align="right">' + trim(GradeP.Cells[j, vlinha]) + '</div></TD>';
      end;
      vini := vlinha + 1;
    end;
    Tabela := Tabela + '</TR></TABLE>';
  finally
    Result := Tabela;
  end;
end;

procedure TFrmFinanceiros.BitBtn5Click(Sender: TObject);
var
  vtext: AnsiString;
  Arq: TextFile;
  ie: variant;
  // eu: PWideChar;
begin
  inherited;
  if not vDadosIni.PesqPros('GES016','RELATORIO HTML','MES/ANO: '+edit1.text+'/'+edit2.text,'','',CadBalancoHw.buscas,True) then
   Exit;
  AssignFile(Arq, ExtractFilePath(Application.ExeName) + 'teste.html');
  Rewrite(arq);
  Vtext := Vtext + '<h6><div align="left"> Empresas: ' + cadempresasfin.vnomeemps+ '</div></h6><h6><div align="left"> ';
  Vtext := Vtext +
    'DEMONSTRACAO DO RESULTADO DO EXERCICIO - DEPTO: ' +
    CadDREHW.vdepDemo + ' - MES: ' + edit1.text + ' Ano ' + edit2.text +
    '</div></h6>'+ GeraTabelaHTML(Stringgrid1, '1');;
//    <h6><div align="left"> PATRIMONIO LIQUIDO(CAPITAL PRÓPRIO):' + format('%n', [strtocurr(edit5.text)]) +
//  '</div></h6>'
//Mes Informado
  Vtext := Vtext +
    '<br>' +
    '<span><font size="1" color="blue"><b>Mês informado</b></font></span>' +
    '<br><Table Width="100%" Border=1 cellspacing="0" cellpadding="0"><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label11.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    vdadosini.alndir(label12.caption, 12) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label22.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    vDadosIni.AlnDir(label24.caption, 12) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label13.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    vDadosIni.alndir(label14.caption, 12) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label6.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    vDadosIni.alndir(label8.caption, 12) + '</b></font></TD>';
  Vtext := Vtext + '</TR></TABLE>';
//Média ultimos meses
  Vtext := Vtext +
    '<br>' +
    '<span><font size="1" color="blue"><b>Média ultimos ' + IntToStr(CadDREHW.vMesesMedia) + ' meses</b></font></span>' +
    '<br><Table Width="100%" Border=1 cellspacing="0" cellpadding="0"><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label62.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    vdadosini.alndir(label61.caption, 12) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label63.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    vDadosIni.AlnDir(label64.caption, 12) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label67.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    vDadosIni.alndir(label68.caption, 12) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label65.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    vDadosIni.alndir(label66.caption, 12) + '</b></font></TD>';
  //
//  Vtext := Vtext + '</TR><TR>';
//  Vtext := Vtext +
//    '<TD><font size="1"><b>' +
//    label15.caption + '</b></font></TD>';
//  Vtext := Vtext +
//    '<TD align="right"><font size="1"><b>' +
//    vDadosIni.alndir(label16.caption, 12) + '</b></font></TD>';

//  Vtext := Vtext + '</TR><TR>';
//  Vtext := Vtext +
//    '<TD><font size="1"><b>' +
//    label22.caption + '</b></font></TD>';
//  Vtext := Vtext +
//    '<TD align="right"><font size="1"><b>' +
//    vDadosIni.alndir(label24.caption, 12) + '</b></font></TD>';

//  Vtext := Vtext + '</TR><TR>';
//  Vtext := Vtext +
//    '<TD><font size="1"><b>' +
//    label23.caption + '</b></font></TD>';
//  Vtext := Vtext +
//    '<TD align="right"><font size="1"><b>' +
//    vDadosIni.alndir(label25.caption, 12) + '</b></font></TD>';

  Vtext := Vtext + '</TR></TABLE>';
{  Vtext := Vtext + '<br><br><Table Width="100%" Border=0 cellspacing="0" cellpadding="0"><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label26.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD><font size="1"><b> &nbsp;' +
    '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label18.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    alndir(format('%n', [realedit1.value]), 12) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label19.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    alndir(format('%n', [realedit2.value]), 12) + '</b></font></TD>';
  Vtext := Vtext + '</TR></TABLE>';
  //
  Vtext := Vtext + '<br><br><Table Width="100%" Border=0 cellspacing="0" cellpadding="0"><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label28.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD><font size="1"><b> &nbsp;' +
    '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label29.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    alndir(maskedit6.text, 12) + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    alndir(label32.caption, 6) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label30.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    alndir(maskedit7.text, 12) + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    alndir(label33.caption, 6) + '</b></font></TD>';
  //
  Vtext := Vtext + '</TR><TR>';
  Vtext := Vtext +
    '<TD><font size="1"><b>' +
    label31.caption + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    alndir(maskedit8.text, 12) + '</b></font></TD>';
  Vtext := Vtext +
    '<TD align="right"><font size="1"><b>' +
    alndir(label34.caption, 6) + '</b></font></TD>';
  Vtext := Vtext + '</TR></TABLE>';
  //}
  WriteLn(arq, Vtext);
  CloseFile(arq);
  ie := createoleObject('InternetExplorer.Application');
  ie.visible := true;
  ie.navigate(ExtractFilePath(Application.ExeName) + 'teste.html');
//  dtm02.QRYempresa.close;
end;

procedure TFrmFinanceiros.BitBtn6Click(Sender: TObject);
 var
  vtext: AnsiString;
 Arq:TextFile;
 ie: variant;
begin
 inherited;
 if not vDadosIni.PesqPros('GES023','IMPRIMIR','DE '+maskedit3.text+' A '+maskedit4.text,'','',CadBalancoHw.buscas,True) then
   Exit;
 AssignFile(Arq,ExtractFilePath(Application.ExeName)+'teste.html');
 Rewrite(arq);
 Vtext:='<h4><div align="center"> Empresas: ' + cadempresasfin.vnomeemps+'</div></h4> '
 {<h1><div align="center"> '+
 PageControl1.ActivePage.Caption+' DE '+maskedit1.text+' A '+maskedit2.text+
 '</div></h1>'}+GeraTabelaHTML( Stringgrid2,'1');
 WriteLn(arq,Vtext);
 CloseFile(arq);
 ie:=createoleObject('InternetExplorer.Application');
 ie.visible:=true;
 ie.navigate(ExtractFilePath(Application.ExeName)+'teste.html');
// eu:='';
// eu:=StringToWideChar(ExtractFilePath(Application.ExeName)+'teste.html', eu,Length(ExtractFilePath(Application.ExeName)+'teste.html'));
// HlinkNavigateString(nil,eu);

//   FRM_Fluxo.QuickRep1.Preview;
end;

procedure TFrmFinanceiros.BitBtn7Click(Sender: TObject);
var
vtip: string;
begin
  inherited;
if not vDadosIni.PesqPros('GES021','REFAZER SOMA','DE '+maskedit3.text+' A '+maskedit4.text,'','',CadBalancoHw.buscas,True) then
 Exit;
if RadioButton3.Checked then
 vtip:='D'
else
 vtip:='M';
cadFluxo.somargrids(StringGrid2,StringGrid3,vtip);
end;

procedure TFrmFinanceiros.BitBtn9Click(Sender: TObject);
begin
  inherited;
   if FrmRelatorio = nil then
    Application.CreateForm(TFrmRelatorio,FrmRelatorio);
   FrmRelatorio.QRLValorInicial.Caption := MkeValorInicial.Text;
   FrmRelatorio.QRLTotalDebito.Caption := MkeTotalDebito.Text;
   FrmRelatorio.QRLQtdeParc.Caption := MkeQtdeParcelas.Text;
   FrmRelatorio.QRLParcRestantes.Caption := MkeRst.Text;
   FrmRelatorio.QRLValordasParcelas.Caption := LValorParcelas.caption;
   FrmRelatorio.QRLValorAdasParcelas.Caption := LValorAtualParc.caption;
   FrmRelatorio.QRLJuros.Caption := LJuros.caption;
   FrmRelatorio.QRLValorAtual.Caption := LValorAtual.caption;
   FrmRelatorio.QuickRep1.Preview;
end;

procedure TFrmFinanceiros.BtnCalculoClick(Sender: TObject);
var
 Divisao : real;
 Parcelas : real;
 Cima : real;
 Baixo : real;
begin
   inherited;
   Divisao := 0;
   Parcelas := 0;
   Cima := 0;
   Baixo := 0;
   Parcelas := strtofloat(MkeTotalDebito.Text) / strtofloat(MkeQtdeParcelas.Text);
   LValorParcelas.caption := format('%10.2f',[Parcelas]);
   Divisao := strtofloat(MkeTotalDebito.Text)/strtofloat(mkeValorInicial.Text);
   LJuros.Caption := format('%10.2f',[((power(Divisao,(1 / strtofloat(MkeQtdeParcelas.Text))))-1)*100]);
   Cima := strtofloat(MkeRst.text) * strtofloat(LValorParcelas.caption);
   Baixo := power((1 + (strtofloat(LJuros.caption))/100),strtofloat(MkeRst.text));
   LValorAtual.caption := format('%10.2f',[Cima/Baixo]);
   LValorAtualParc.caption := format('%10.2f',[strtofloat(LValorAtual.caption)/strtofloat(MkeRst.text)]);
end;

procedure TFrmFinanceiros.BtOkClick(Sender: TObject);
var
 vtip,vtpac: string;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('GES019','OBTER','DE '+maskedit3.text+' A '+maskedit4.text,'','',CadBalancoHw.buscas,True) then
     Exit;
    if not cadempresasfin.VerificaEmpresas(cklbEmpresas) then
     exit;
    if length(cadempresasfin.vCodEmpresas) > 1 then
    begin
     Application.MessageBox('Fluxo de Caixa só pode ser emitido por empresa, selecione uma empresa específica!', 'Confirmação', MB_OK);
     exit;
    end;
    if cadFluxo = nil then
     cadFluxo:=TFluxoCaixa.create;
    cadFluxo.vCodEmpresasDRE:=cadempresasfin.vempresas;
    if not cadFluxo.verificadiainicial(MaskEdit3.text,cadempresasfin.vempresas) then
    begin
     Application.MessageBox('Data inicial Diferente de data aberta no caixa! Será colocada na data inicial a data do caixa', 'Confirmação', MB_OK);
     MaskEdit3.Text:=DateToStr(cadFluxo.vdtinicial);
     if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
     	 maskedit3.setfocus;
     exit;
    end;
    if (DayOfWeek(strtodate(maskedit3.text)) = 2) then
     MaskEdit3.text := datetostr(strtodate(maskedit3.text)-3);
    if (DayOfWeek(strtodate(maskedit3.text)) = 1) then
     MaskEdit3.text := datetostr(strtodate(maskedit3.text)-2);
    if (DayOfWeek(strtodate(maskedit3.text)) = 7) then
     MaskEdit3.text := datetostr(strtodate(maskedit3.text)-1);

    cadFluxo.vversao:='4.0';
    cadFluxo.vInicial:=StrToDate(MaskEdit3.text);
    cadFluxo.vFinal:=StrToDate(MaskEdit4.text);
    cadFluxo.voriginal:=StrToDate(MaskEdit3.text);
    if not cadFluxo.verificardiasemana then
    begin
    	if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
      	MaskEdit4.SetFocus;
      exit;
    end;
    if RadioButton3.Checked then
     vtip:='D'
    else
     vtip:='M';
    if CheckBox1.Checked then
      vtpac:='S'
    else
      vtpac:='N';
    if CheckBox2.Checked then
     cadFluxo.vusvlLiq:='S'
    else
     cadFluxo.vusvlLiq:='N';
    if CheckBox3.Checked then
     cadFluxo.vsemPrevVenda:='S'
    else
     cadFluxo.vsemPrevVenda:='N';
    cadFluxo.MontaFluxo(StringGrid2,StringGrid3,vtip,vtpac);
    Label5.Caption := Format('%n',[cadFluxo.vlinicial]);
    Label19.Caption:= Format('%n',[cadFluxo.cadctrlCredCheq.vatrasados]);
    Label60.Caption:= Format('%n',[cadFluxo.cadctrlCredCheq.vatrapagar]);
    if cadFluxo.cadctrlCredCheq.vatrapagar > 0 then
    begin
      if Application.MessageBox('Há contas a pagar pendentes. Deseja abater do saldo inicial?',
       'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON1) = mrYES then
       begin
         StringGrid2.Cells[1,1]:=Format('%n',[cadFluxo.vlinicial-cadFluxo.cadctrlCredCheq.vatrapagar]);
         BitBtn7Click(sender);
       end;
    end;
    StringGrid2.FixedRows := vDadosIni.IfThen(StringGrid2.RowCount > 1, 1, 0);
    ComboBox2.ItemIndex:=0;
    ComboBox2Change(Sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmFinanceiros.btSelectAllClick(Sender: TObject);
var
  vRecNo: Integer;
begin
  inherited;
  vRecNo := DBGrid1.DataSource.DataSet.RecNo;
  DBGrid1.DataSource.DataSet.First;
  while not DBGrid1.DataSource.DataSet.Eof do
  begin
    DBGrid1.SelectedRows.CurrentRowSelected := True;
    DBGrid1.DataSource.DataSet.Next;
  end;
  if vRecNo > 0 then
    DBGrid1.DataSource.DataSet.RecNo := vRecNo;
end;

procedure TFrmFinanceiros.ChBoxMarksClick(Sender: TObject);
var
 i: integer;
begin
  inherited;
  for I := 1 to 2 do
    Chart1.Series [I-1].Marks.Visible :=
      ChBoxMarks.Checked;
end;

procedure TFrmFinanceiros.ComboBox1Change(Sender: TObject);
begin
  inherited;
  atualizaGrafico(Stringgrid5,chart2);
  atualizaGrafico(Stringgrid6,chart3);
end;

procedure TFrmFinanceiros.ComboBox2Change(Sender: TObject);
var
  I,J: Integer;
  SeriesClass: TChartSeriesClass;
  NewSeries: TChartSeries;
begin
  inherited;
  // destroy the existing series (in reverse order)
   for I := 1 downto 0 do
    Chart1.Series[I].Free;
  // create the new series
  for I := 0 to 1 do
  begin
    case ComboBox2.ItemIndex of
      0: SeriesClass := TLineSeries;
      1: SeriesClass := TBarSeries;
      2: SeriesClass := TAreaSeries;
    else // 3: and default
      SeriesClass := TPointSeries;
    end;
    NewSeries := SeriesClass.Create (self);
    NewSeries.ParentChart := Chart1;
    NewSeries.Title :=stringgrid3.cells[0,i+1];
//      Format ('Series %d', [I + 1]);
  end;
  // update the marks and update the data
  ChBoxMarksClick (self);
//  UpdateButtonClick (self);
  for I := 1 to 2 do
  begin
    Chart1.Series [I-1].Clear;
    for J := 1 to StringGrid3.ColCount-2 do
      Chart1.Series [I-1].Add (
        StrTocurr (vDadosIni.tirapontos(StringGrid3.Cells [J, I],2)),
        stringgrid3.cells[J,0], Chart1.Series [I-1].SeriesColor);
  end;
end;

procedure TFrmFinanceiros.DetalhesBI1Click(Sender: TObject);
//var
// vsumario: TSummaryInfo;
// vtit: string;
begin
  inherited;
  vDadosIni.abreStatusProcessamento('', 'Verificando Detalhes');
  if vstriggrid = 1 then
  begin
    if (vrowDRE = 1) and ((vcolDRE >= 0) and (vcolDRE < 2)) then
    begin
      Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
      CadDREHW.montadatasBI;
      if CadDREHW.vContabil  then
        CadDREHW.CadVendas.vendasBICNT(CadDREHW.vCodEmpresasDRE,FrmVisualizaOlap.HCubeGERAL,'D')
      else
      CadDREHW.CadVendas.vendasBI(CadDREHW.vCodEmpresasDRE,FrmVisualizaOlap.HCubeGERAL,'D');
      FrmVisualizaOlap.Label1.Caption:='Detalhes de Vendas por Mês';
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.BeginUpdate;
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.AddSummary('MARKUP','("BRUTO"."Sum"-"DESCONTO"."Sum")/"CUSTO"."Sum"');
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.Items[0].FunctionSum.SubFunctions[0].FormatString:='##0.0000';
//      vsumario.SummarySettings.Items[0].FunctionSum.
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.EndUpdate;
      FrmVisualizaOlap.ShowModal;
    end;
    if (vrowDRE = 3) and ((vcolDRE >= 0) and (vcolDRE < 2)) then
    begin
      Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
      CadDREHW.montadatasBI;
      CadDREHW.CadVendas.DevolucoesBI(CadDREHW.vCodEmpresasDRE,FrmVisualizaOlap.HCubeGERAL,'D');
      FrmVisualizaOlap.Label1.Caption:='Detalhes de Devoluções por Mês';
      FrmVisualizaOlap.ShowModal;
    end;
    if (vrowDRE in [2,9,10,11,12,15,14,17,18,19,21]) and ((vcolDRE >= 0) and (vcolDRE < 2)) then
    begin
      Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
      CadDREHW.montadatasBI;
      CadDREHW.caddesp.despBI(CadDREHW.vCodEmpresasDRE,FrmVisualizaOlap.HCubeGERAL, 'D');
      FrmVisualizaOlap.Label1.Caption:='Detalhes dos Custos e Inventimentos por Mês';
      FrmVisualizaOlap.ShowModal;
    end;
  end;
  if vstriggrid = 2 then
  begin
    if (StAtCirculante.Cells[2,vrowDRE] = '2') or (StAtCirculante.Cells[2,vrowDRE] = '3') then
    begin
      CadBalancoHw.verificarsaldobanco(StAtCirculante.Cells[2,vrowDRE]);
      Application.CreateForm(TFrmVisualDpto,FrmVisualDpto);
//      vtit:=FrmVisualDpto.Caption;
      FrmVisualDpto.Caption:='Saldo Bancário';
      FrmVisualDpto.ShowModal;
      FrmVisualDpto.Free;
      CadDREHW.buscas.Close;
    end
    else
    begin
      Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
      if CadBalancoHw.detalhesBalBI(FrmVisualizaOlap.HCubeGERAL,StAtCirculante.Cells[2,vrowDRE]) then
      begin
       FrmVisualizaOlap.Label1.Caption:='Detalhes de '+trim(StAtCirculante.Cells[0,vrowDRE]);
       FrmVisualizaOlap.ShowModal;
      end;
    end;
  end;
  if vstriggrid = 3 then
  begin
    Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
    if CadBalancoHw.detalhesBalBI(FrmVisualizaOlap.HCubeGERAL,StAtRealizavelLp.Cells[2,vrowDRE]) then
    begin
     FrmVisualizaOlap.Label1.Caption:='Detalhes de '+trim(StAtRealizavelLp.Cells[0,vrowDRE]);
     FrmVisualizaOlap.ShowModal;
    end;
  end;
  if vstriggrid = 4 then
  begin
    Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
    if CadBalancoHw.detalhesBalBI(FrmVisualizaOlap.HCubeGERAL,StAPermanente.Cells[2,vrowDRE]) then
    begin
     FrmVisualizaOlap.Label1.Caption:='Detalhes de '+trim(StAPermanente.Cells[0,vrowDRE]);
     try
      if (StrToInt(StAPermanente.Cells[2,vrowDRE]) >= 11) and  (StrToInt(StAPermanente.Cells[2,vrowDRE]) <= 16) then
       FrmVisualizaOlap.HierCubeGrid1.SummarySettings.AddSummary('VALORLIQUIDO','("soma"."Sum"-"depacumulada"."Sum")');
     except

     end;
     FrmVisualizaOlap.ShowModal;
    end;
  end;

  if vstriggrid = 5 then
  begin
    Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
    if CadBalancoHw.detalhesBalBI(FrmVisualizaOlap.HCubeGERAL,StPsCirculante.Cells[2,vrowDRE]) then
    begin
     FrmVisualizaOlap.Label1.Caption:='Detalhes de '+trim(StPsCirculante.Cells[0,vrowDRE]);
     FrmVisualizaOlap.ShowModal;
    end;
  end;
  if vstriggrid = 6 then
  begin
    Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
    if CadBalancoHw.detalhesBalBI(FrmVisualizaOlap.HCubeGERAL,StPasExigivelLp.Cells[2,vrowDRE]) then
    begin
     FrmVisualizaOlap.Label1.Caption:='Detalhes de '+trim(StPasExigivelLp.Cells[0,vrowDRE]);
     FrmVisualizaOlap.ShowModal;
    end;
  end;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmFinanceiros.DetalhesOLAP1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.abreStatusProcessamento('', 'Verificando Detalhes');
  if vstriggrid = 1 then
  begin
    if (vcolDRE = 4) then
    begin
      Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
      cadFluxo.cadctrlCredCheq.vdat1:=StrToDate(MaskEdit3.text);
      cadFluxo.cadctrlCredCheq.vdat2:=StrToDate(MaskEdit4.text);
      cadFluxo.cadctrlCredCheq.CredChequesBI(cadFluxo.vCodEmpresasDRE,FrmVisualizaOlap.HCubeGERAL,StrToDate(MaskEdit3.text));
      FrmVisualizaOlap.Label1.Caption:='Detalhes de Contas a Receber';
      FrmVisualizaOlap.ShowModal;
    end;
    if (vcolDRE >= 7) and (vcolDRE <= 10) then
    begin
      Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
      cadFluxo.caddesp.vdat1:=StrToDate(MaskEdit3.text);
      cadFluxo.caddesp.vdat2:=StrToDate(MaskEdit4.text);
      cadFluxo.caddesp.ApagarBI(cadFluxo.vCodEmpresasDRE,FrmVisualizaOlap.HCubeGERAL, 'F');
      FrmVisualizaOlap.Label1.Caption:='Detalhes de Contas a Pagar';
      FrmVisualizaOlap.ShowModal;
    end;
  end;
 vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmFinanceiros.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmFinanceiros.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmFinanceiros.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then 
    key:=#0;
end;

procedure TFrmFinanceiros.ExportalparaExcel1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.montarExcel(DBGrid4, Panel15.Caption);
end;

procedure TFrmFinanceiros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
	Action:=cafree;
	FrmFinanceiros:=nil;
	cadempresasfin.Free;
	CadDREHW.Free;
	CadBalancoHw.Free;
	//if cadFluxo <> nil then
	// cadFluxo.Free;
end;

procedure TFrmFinanceiros.FormShow(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
	if not Self.Enabled then
    Exit;

  inherited;
  gestor := TGestorFormularios.Create;
  if not vDadosIni.PesqPros('GES008','ABRIR','BALANCO GERENCIAL PATRIMONIAL','','',gestor.cQuery,True, False, True) then
  begin
   TabSheet1.TabVisible:=false
  end
  else
   TabSheet1.TabVisible:=True;
  if not vDadosIni.PesqPros('GES009','ABRIR','DRE','','',gestor.cQuery,True, False, True) then
  begin
   TabSheet2.TabVisible:=false
  end
  else
   TabSheet2.TabVisible:=True;
  if not vDadosIni.PesqPros('GES010','ABRIR','FLUXO DE CAIXA','','',gestor.cQuery,True, False, True) then
  begin
   TabSheet3.TabVisible:=false
  end
  else
   TabSheet3.TabVisible:=True;
  cadempresasfin:=TEmpresas.create;

  PgFinanceiros.ActivePage := TabSheet1;
  PageControl1.ActivePage := TabSheet5;
  PageControl2.ActivePage := TabSheet8;
  PageControl3.ActivePage := TabSheet10;
  if not vDadosIni.validarAcessoEmpresasUnificadas(cadempresasfin.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    FrmFinanceiros.fechar := True;
    PostMessage(FrmFinanceiros.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  if vDadosIni.vEmp.vFinanceiroUnificado then
    PgFinanceirosChange(Sender)
  else
  begin
    cadempresasfin.abreEmpresas;
    cadempresasfin.preenchChecklist(cklbEmpresas);
  end;
  if not cadempresasfin.VerificaEmpresas(cklbEmpresas) then
    exit;
  CadDREHW:=TDREHw.create;
  CadBalancoHw:=TBalancoHw.create;
  CadDREHW.vCodEmpresasDRE:=cadempresasfin.vempresas;
  if (Tag = 1) or (vDadosIni.vatvfluxo = 1) then
  begin
    TabSheet1.TabVisible := False;
    TabSheet2.TabVisible := False;
    TabSheet4.TabVisible := False;
    PgFinanceiros.ActivePage  := TabSheet3;
    vDadosIni.hw_registra_estatistica(Self.Name + 'FluxoDeCaixa');
  end
  else if vDadosIni.vatvfluxo <> 2 then
    vDadosIni.hw_registra_estatistica(Self.Name);
       
  if (vDadosIni.vatvfluxo = 2) then
  begin
    TabSheet1.TabVisible := False;
    TabSheet2.TabVisible := False;
    TabSheet3.TabVisible := False;
    TabSheet4.TabVisible := true;
    PgFinanceiros.ActivePage  := TabSheet4;
    if (Self.Enabled) and (Self.Visible) and (MaskEdit5.CanFocus) then
    	MaskEdit5.setfocus;
    vDadosIni.hw_registra_estatistica(Self.Name + 'SimuladorJuros');
  end;
  Edit1.Text := vDadosIni.StrZero(MonthOf(IncMonth(date, -1)), 2);
  Edit2.Text := vDadosIni.StrZero(YearOf(IncMonth(date, -1)), 4);
  if ((MaskEdit3.Text = '__/__/____') or (MaskEdit3.Text = '  /  /    ')) then
    MaskEdit3.Text := DateToStr(cadempresasfin.obterdataCaixa(CadDREHW.vCodEmpresasDRE));

  vDadosIni.verificarCTP_Pendentes_Unificacao(CadDREHW.buscas);
end;

procedure TFrmFinanceiros.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmFinanceiros.StAPermanenteSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
vcolDRE := Acol;
vrowDRE := Arow;
vstriggrid:=4;
end;

procedure TFrmFinanceiros.StAtCirculanteSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
vcolDRE := Acol;
vrowDRE := Arow;
vstriggrid:=2;
end;

procedure TFrmFinanceiros.StAtRealizavelLpSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
vcolDRE := Acol;
vrowDRE := Arow;
vstriggrid:=3;
end;

procedure TFrmFinanceiros.StPasExigivelLpSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
vcolDRE := Acol;
vrowDRE := Arow;
vstriggrid:=6;
end;

procedure TFrmFinanceiros.StPsCirculanteSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
vcolDRE := Acol;
vrowDRE := Arow;
vstriggrid:=5;
end;

procedure TFrmFinanceiros.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
vcolDRE := Acol;
vrowDRE := Arow;
vstriggrid:=1;
end;

procedure TFrmFinanceiros.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
vcolDRE := Acol;
vrowDRE := Arow;
vstriggrid:=1;
end;

initialization
  RegisterClass(TFrmFinanceiros);
finalization
  UnRegisterClass(TFrmFinanceiros);

end.
