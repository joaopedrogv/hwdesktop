unit UvisualizadorOLAP_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, ExtCtrls, xhHierCube, TeeProcs, TeEngine, Chart,
  xhChart, xhGrid, StdCtrls, Buttons, Menus, ToolWin, ImgList, xhExport,
  ShellAPI, UdtmConsGeral, xhConsts, Contnrs, DB;

type
  TConsulta_Action = procedure(var AGrid: THierCubeGrid; var ACombo: TComboBox; var AConsultas: TObjectList) of object;
  TValidaAcesso = function(ALocal: string): Boolean of object;

  TFrmVisualizaOlap_2 = class(TfrmPadrao)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    HierCubeGrid1: THierCubeGrid;
    xChart: THierCubeChart;
    HCubeGERAL: THierCube;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Panel3: TPanel;
    ImageList1: TImageList;
    ChartToolBar: TToolBar;
    DimBtn: TToolButton;
    ToolButton2: TToolButton;
    ColorBtn: TToolButton;
    ToolButton1: TToolButton;
    SortBtn: TToolButton;
    ToolButton3: TToolButton;
    SeriesBtn: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    DimMenu: TPopupMenu;
    Userows1: TMenuItem;
    Usecolumns1: TMenuItem;
    ColorMenu: TPopupMenu;
    Highestvaluesishot1: TMenuItem;
    Lowestvaluesishot1: TMenuItem;
    SortMenu: TPopupMenu;
    Sortinglikeinthegrid1: TMenuItem;
    Sortingbynames1: TMenuItem;
    Sortingbyvalues1: TMenuItem;
    SeriesMenu: TPopupMenu;
    Bar1: TMenuItem;
    Line1: TMenuItem;
    Horizontalbar1: TMenuItem;
    Point1: TMenuItem;
    Pie1: TMenuItem;
    Area1: TMenuItem;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    ExportDialog: TSaveDialog;
    XLSExport: THierCubeGridExportToXLS;
    SpeedButton3: TSpeedButton;
    ExcelExport: THierCubeGridExportToExcel;
    SpeedButton4: TSpeedButton;
    HTMLExport_Advanced: THierCubeGridExportToHTML;
    SpeedButton5: TSpeedButton;
    PDFExport: THierCubeGridExportToPDF;
    ToolButton6: TToolButton;
    pnConsultasSalvas: TPanel;
    ComboBox1: TComboBox;
    btConsultaDelete: TSpeedButton;
    btConsultaSave: TSpeedButton;
    btConsultaGo: TSpeedButton;
    procedure HierCubeGrid1AfterPivot(Sender: TObject; Args: TPivotEventArgs);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btConsultaDeleteClick(Sender: TObject);
    procedure btConsultaSaveClick(Sender: TObject);
    procedure btConsultaGoClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Area1Click(Sender: TObject);
    procedure Pie1Click(Sender: TObject);
    procedure Point1Click(Sender: TObject);
    procedure Horizontalbar1Click(Sender: TObject);
    procedure Line1Click(Sender: TObject);
    procedure Bar1Click(Sender: TObject);
    procedure Sortingbyvalues1Click(Sender: TObject);
    procedure Sortingbynames1Click(Sender: TObject);
    procedure Sortinglikeinthegrid1Click(Sender: TObject);
    procedure Lowestvaluesishot1Click(Sender: TObject);
    procedure Highestvaluesishot1Click(Sender: TObject);
    procedure Usecolumns1Click(Sender: TObject);
    procedure Userows1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FDimChange       : Boolean;
    FNomeConsulta    : string;
    FConsultas       : TObjectList;
    FConsultaGo      : TConsulta_Action;
    FConsultaSave    : TConsulta_Action;
    FConsultaDelete  : TConsulta_Action;
    FValidaAcesso    : TValidaAcesso;
    FConsultaSaveLast: TConsulta_Action;
    { Private declarations }
  public
    { Public declarations }
    property NomeConsulta     : string           read FNomeConsulta     write FNomeConsulta;
    property Consultas        : TObjectList      read FConsultas        write FConsultas;
    property ConsultaGo       : TConsulta_Action read FConsultaGo       write FConsultaGo;
    property ConsultaSave     : TConsulta_Action read FConsultaSave     write FConsultaSave;
    property ConsultaSaveLast : TConsulta_Action read FConsultaSaveLast write FConsultaSaveLast;
    property ConsultaDelete   : TConsulta_Action read FConsultaDelete   write FConsultaDelete;
    property ValidaAcesso     : TValidaAcesso    read FValidaAcesso     write FValidaAcesso;
  end;

var
  FrmVisualizaOlap_2: TFrmVisualizaOlap_2;
  FExcel: OLEVariant;

implementation

uses
  ComObj, TeePrevi, uStatusProcessamento_2;

{$R *.dfm}

procedure TFrmVisualizaOlap_2.Area1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csArea;
  with SeriesBtn do
  begin
    ImageIndex := 12;
    Hint := 'Area series';
  end;
end;

procedure TFrmVisualizaOlap_2.Bar1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csBar;
  with SeriesBtn do
  begin
    ImageIndex := 8;
    Hint := 'Bar series';
  end;
end;

procedure TFrmVisualizaOlap_2.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmVisualizaOlap_2.btConsultaDeleteClick(Sender: TObject);
begin
  inherited;
  if Assigned(FConsultaDelete) then
    FConsultaDelete(HierCubeGrid1, ComboBox1, FConsultas);
end;

procedure TFrmVisualizaOlap_2.btConsultaGoClick(Sender: TObject);
var
  AActionRescue: TConsulta_Action;
begin
  inherited;
  if Assigned(FConsultaSaveLast) then
  begin
    AActionRescue := FConsultaSaveLast;
    FConsultaSaveLast := nil;
  end
  else
    AActionRescue := nil;

  try

    if Assigned(FConsultaGo) then
      FConsultaGo(HierCubeGrid1, ComboBox1, FConsultas);

  finally
    if Assigned(AActionRescue) then
      FConsultaSaveLast := AActionRescue;
  end;
end;

procedure TFrmVisualizaOlap_2.btConsultaSaveClick(Sender: TObject);
begin
  inherited;
  if Assigned(FConsultaSave) then
    FConsultaSave(HierCubeGrid1, ComboBox1, FConsultas);
end;

procedure TFrmVisualizaOlap_2.FormCreate(Sender: TObject);
begin
  inherited;
  FDimChange := False;
end;

procedure TFrmVisualizaOlap_2.FormDestroy(Sender: TObject);
begin
  if Assigned(FConsultas) then
    FreeAndNil(FConsultas);
  if Assigned(ConsultaGo) then
    ConsultaGo := nil;
  if Assigned(ConsultaSave) then
    ConsultaSave := nil;
  if Assigned(ConsultaSaveLast) then
    ConsultaSaveLast := nil;
  if Assigned(ConsultaDelete) then
    ConsultaDelete := nil;
  if Assigned(ValidaAcesso) then
    ValidaAcesso := nil;
  inherited;
end;

procedure TFrmVisualizaOlap_2.HierCubeGrid1AfterPivot(Sender: TObject;
  Args: TPivotEventArgs);
begin
  inherited;
  if Args.Operation in [opMoveDim] then
    if Assigned(FConsultaSaveLast) then
      FConsultaSaveLast(HierCubeGrid1, ComboBox1, FConsultas);
end;

procedure TFrmVisualizaOlap_2.Highestvaluesishot1Click(Sender: TObject);
begin
  inherited;
  xChart.ColorSchema := xhcHighestIsHot;
  with ColorBtn do
  begin
    ImageIndex := 3;
    Hint := 'Maior Valor é Quente';
  end;
end;

procedure TFrmVisualizaOlap_2.Horizontalbar1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csHorBar;
  with SeriesBtn do
  begin
    ImageIndex := 9;
    Hint := 'Horizontal bar series';
  end;
end;

procedure TFrmVisualizaOlap_2.Line1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csLine;
  with SeriesBtn do
  begin
    ImageIndex := 10;
    Hint := 'Line series';
  end;
end;

procedure TFrmVisualizaOlap_2.Lowestvaluesishot1Click(Sender: TObject);
begin
  inherited;
  xChart.ColorSchema := xhcHighestIsCold;
  with ColorBtn do
  begin
    ImageIndex := 2;
    Hint := 'Menor valor é frio';
  end;
end;

procedure TFrmVisualizaOlap_2.Pie1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csPie;
  with SeriesBtn do
  begin
    ImageIndex := 11;
    Hint := 'Pie series';
  end;
end;

procedure TFrmVisualizaOlap_2.Point1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csPoint;
  with SeriesBtn do
  begin
    ImageIndex := 7;
    Hint := 'Point series';
  end;
end;

procedure TFrmVisualizaOlap_2.Sortingbynames1Click(Sender: TObject);
begin
  inherited;
  xChart.SortType := xhcName;
  with SortBtn do
  begin
    ImageIndex := 5;
    Hint := 'Sorting by names';
  end;
end;

procedure TFrmVisualizaOlap_2.Sortingbyvalues1Click(Sender: TObject);
begin
  inherited;
  xChart.SortType := xhcValue;
  with SortBtn do
  begin
    ImageIndex := 4;
    Hint := 'Sorting by values';
  end;
end;

procedure TFrmVisualizaOlap_2.Sortinglikeinthegrid1Click(Sender: TObject);
begin
  inherited;
  xChart.SortType := xhcGrid;
  with SortBtn do
  begin
    ImageIndex := 6;
    Hint := 'Sorting like in the grid';
  end;
end;

procedure TFrmVisualizaOlap_2.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not HCubeGERAL.Active then
    EXIT;

  if Assigned(ValidaAcesso) then
    if not ValidaAcesso('EXPORTAR_XLS_FILE') then
      Exit;

  ExportDialog.DefaultExt := 'xls';
  ExportDialog.Filter := 'MS Excel files|*.XLS';
  if ExportDialog.Execute then
  begin
    XLSExport.ExportToFile(ExportDialog.FileName);
    ShowMessage('Export completed!');
  end;
end;

procedure TFrmVisualizaOlap_2.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not HCubeGERAL.Active then
    EXIT;

  if Assigned(ValidaAcesso) then
    if not ValidaAcesso('EXPORTAR_XLS_OLE') then
      Exit;

  VarClear(FExcel);
  FExcel := CreateOLEObject('Excel.Application');
  if VarType(FExcel) <> VarDispatch then
    raise Exception.Create('Cannot open Microsoft Excel.'#13#10 + 'Install Microsoft Office');
  ExcelExport.ExportTo(FExcel);
  FExcel.Visible := True;
end;

procedure TFrmVisualizaOlap_2.SpeedButton4Click(Sender: TObject);
var
  Stream: TMemoryStream;
  RS: TResourceStream;
  tPath: string;
begin
  inherited;
  if not HCubeGERAL.Active then
    EXIT;

  if Assigned(ValidaAcesso) then
    if not ValidaAcesso('EXPORTAR_HTML_FILE') then
      Exit;

  ExportDialog.DefaultExt := 'html';
  ExportDialog.Filter := 'HTML files|*.html*';
  if ExportDialog.Execute then
  begin
    tPath := ExtractFileDir(ExportDialog.FileName);
    if tPath[length(tPath)] <> '\' then
      tPath := tPath + '\';

//    try
//    RS := TResourceStream.Create(HInstance, 'LOGO', RT_RCDATA);
//    RS.SaveToFile(tpath + 'logo.gif');
//    RS.Free;
//    except;
//
//    end;

//    Stream := TMemoryStream.Create;
//    RS := TResourceStream.Create(HInstance, 'HTML', RT_RCDATA);
//    RS.SaveToStream(Stream);
//    RS.Free;
//    HTMLExport_Advanced.ExportToStream(Stream);
//    Stream.SaveToFile(ExportDialog.FileName);
//    Stream.Free;

    HTMLExport_Advanced.ExportToFile(ExportDialog.FileName);

    Screen.Cursor := crAppStart;
    try
      //ShellExecute(0, 'open', 'iexplore', PChar(ExportDialog.FileName), nil, SW_SHOWNORMAL);
      ShellExecute(Application.Handle, 'open',
        PAnsiChar(ExportDialog.FileName), nil, nil, SW_SHOWNORMAL);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmVisualizaOlap_2.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not HierCubeGrid1.Active then
    EXIT;

  if Assigned(ValidaAcesso) then
    if not ValidaAcesso('EXPORTAR_PDF_FILE') then
      Exit;

  ExportDialog.DefaultExt := 'pdf';
  ExportDialog.Filter := 'PDF files|*.pdf';
  if ExportDialog.Execute then
  begin
    PDFExport.ExportToFile(ExportDialog.FileName);
    ShowMessage('Export completed!');
  end;
end;

procedure TFrmVisualizaOlap_2.ToolButton6Click(Sender: TObject);
begin
  inherited;
  if not HierCubeGrid1.Active then
    EXIT;
  {$IFDEF VER210}
  teePrevi.TeePreview(nil, xChart);
  {$ELSE}
  {$IFDEF VER200}
  teePrevi.TeePreview(nil, xChart);
  {$ELSE}
  {$IFDEF VER185}
  teePrevi.TeePreview(nil, xChart);
  {$ELSE}
  {$IFDEF VER180}
  ChartPreview(nil, xChart);
  {$ELSE}
  {$IFDEF VER170}
  ChartPreview(nil, xChart);
  {$ELSE}
  ChartPreview(nil, xChart);
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
end;

procedure TFrmVisualizaOlap_2.Usecolumns1Click(Sender: TObject);
begin
  inherited;
  xChart.UseDimension := xhcColumns;
  with DimBtn do
  begin
    ImageIndex := 1;
    Hint := 'Uso Colunas';
  end;
end;

procedure TFrmVisualizaOlap_2.Userows1Click(Sender: TObject);
begin
  inherited;
  xChart.UseDimension := xhcRows;
  with DimBtn do
  begin
    ImageIndex := 0;
    Hint := 'Uso Linhas';
  end;
end;

end.

