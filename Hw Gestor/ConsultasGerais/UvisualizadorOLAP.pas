unit UvisualizadorOLAP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, ExtCtrls, xhHierCube, TeeProcs, TeEngine, Chart,
  xhChart, xhGrid, StdCtrls, Buttons, Menus, ToolWin, ImgList, xhExport,
  ShellAPI, UdtmConsGeral, xhConsts, Contnrs;

type
  TConsulta_Action = procedure(var AGrid: THierCubeGrid; var ACombo: TComboBox; var AConsultas: TObjectList) of object;

  TFrmVisualizaOlap = class(TfrmPadrao)
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
    procedure FormDestroy(Sender: TObject);
    procedure btConsultaDeleteClick(Sender: TObject);
    procedure btConsultaSaveClick(Sender: TObject);
    procedure btConsultaGoClick(Sender: TObject);
    procedure HierCubeGrid1AfterMoveDim(Sender: TObject; DimID: Integer; DimGroup: TDimGroup; Index: Integer);
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    FNomeConsulta  : string;
    FConsultas     : TObjectList;
    FConsultaGo    : TConsulta_Action;
    FConsultaSave  : TConsulta_Action;
    FConsultaDelete: TConsulta_Action;
    { Private declarations }
  public
    { Public declarations }
    property NomeConsulta  : string           read FNomeConsulta   write FNomeConsulta;
    property Consultas     : TObjectList      read FConsultas      write FConsultas;
    property ConsultaGo    : TConsulta_Action read FConsultaGo     write FConsultaGo;
    property ConsultaSave  : TConsulta_Action read FConsultaSave   write FConsultaSave;
    property ConsultaDelete: TConsulta_Action read FConsultaDelete write FConsultaDelete;
  end;

var
  FrmVisualizaOlap: TFrmVisualizaOlap;
  FExcel: OLEVariant;

implementation

uses
  ComObj, TeePrevi, uStatusProcessamento;

{$R *.dfm}
{$R HTML.RES}

procedure TFrmVisualizaOlap.Area1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csArea;
  with SeriesBtn do
  begin
    ImageIndex := 12;
    Hint := 'Area series';
  end;
end;

procedure TFrmVisualizaOlap.Bar1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csBar;
  with SeriesBtn do
  begin
    ImageIndex := 8;
    Hint := 'Bar series';
  end;
end;

procedure TFrmVisualizaOlap.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmVisualizaOlap.btConsultaDeleteClick(Sender: TObject);
begin
  inherited;
  if Assigned(FConsultaDelete) then
    FConsultaDelete(HierCubeGrid1, ComboBox1, FConsultas);
end;

procedure TFrmVisualizaOlap.btConsultaGoClick(Sender: TObject);
begin
  inherited;
  if Assigned(FConsultaGo) then
    FConsultaGo(HierCubeGrid1, ComboBox1, FConsultas);
end;

procedure TFrmVisualizaOlap.btConsultaSaveClick(Sender: TObject);
begin
  inherited;
  if Assigned(FConsultaSave) then
    FConsultaSave(HierCubeGrid1, ComboBox1, FConsultas);
end;

procedure TFrmVisualizaOlap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  action:=cafree;
end;

procedure TFrmVisualizaOlap.FormDestroy(Sender: TObject);
begin
  if Assigned(FConsultas) then
    FreeAndNil(FConsultas);
  inherited;
end;

procedure TFrmVisualizaOlap.HierCubeGrid1AfterMoveDim(Sender: TObject; DimID: Integer; DimGroup: TDimGroup; Index: Integer);
begin
  inherited;
  HCubeGERAL.DimensionMap.Items[DimID].DimGroup := DimGroup;
end;

procedure TFrmVisualizaOlap.Highestvaluesishot1Click(Sender: TObject);
begin
  inherited;
  xChart.ColorSchema := xhcHighestIsHot;
  with ColorBtn do
  begin
    ImageIndex := 3;
    Hint := 'Maior Valor é Quente';
  end;
end;

procedure TFrmVisualizaOlap.Horizontalbar1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csHorBar;
  with SeriesBtn do
  begin
    ImageIndex := 9;
    Hint := 'Horizontal bar series';
  end;
end;

procedure TFrmVisualizaOlap.Line1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csLine;
  with SeriesBtn do
  begin
    ImageIndex := 10;
    Hint := 'Line series';
  end;
end;

procedure TFrmVisualizaOlap.Lowestvaluesishot1Click(Sender: TObject);
begin
  inherited;
  xChart.ColorSchema := xhcHighestIsCold;
  with ColorBtn do
  begin
    ImageIndex := 2;
    Hint := 'Menor valor é Quente';
  end;
end;

procedure TFrmVisualizaOlap.Pie1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csPie;
  with SeriesBtn do
  begin
    ImageIndex := 11;
    Hint := 'Pie series';
  end;
end;

procedure TFrmVisualizaOlap.Point1Click(Sender: TObject);
begin
  inherited;
  xChart.DefaultSeries := csPoint;
  with SeriesBtn do
  begin
    ImageIndex := 7;
    Hint := 'Point series';
  end;
end;

procedure TFrmVisualizaOlap.Sortingbynames1Click(Sender: TObject);
begin
  inherited;
  xChart.SortType := xhcName;
  with SortBtn do
  begin
    ImageIndex := 5;
    Hint := 'Sorting by names';
  end;
end;

procedure TFrmVisualizaOlap.Sortingbyvalues1Click(Sender: TObject);
begin
  inherited;
  xChart.SortType := xhcValue;
  with SortBtn do
  begin
    ImageIndex := 4;
    Hint := 'Sorting by values';
  end;
end;

procedure TFrmVisualizaOlap.Sortinglikeinthegrid1Click(Sender: TObject);
begin
  inherited;
  xChart.SortType := xhcGrid;
  with SortBtn do
  begin
    ImageIndex := 6;
    Hint := 'Sorting like in the grid';
  end;
end;

procedure TFrmVisualizaOlap.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not HCubeGERAL.Active then
    EXIT;
  ExportDialog.DefaultExt := 'xls';
  ExportDialog.Filter := 'MS Excel files|*.XLS';
  if ExportDialog.Execute then
  begin
    XLSExport.ExportToFile(ExportDialog.FileName);
    ShowMessage('Export completed!');
  end;
end;

procedure TFrmVisualizaOlap.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not HCubeGERAL.Active then
    EXIT;
  VarClear(FExcel);
  FExcel := CreateOLEObject('Excel.Application');
  if VarType(FExcel) <> VarDispatch then
    raise Exception.Create('Cannot open Microsoft Excel.'#13#10 + 'Install Microsoft Office');
  ExcelExport.ExportTo(FExcel);
  FExcel.Visible := True;
end;

procedure TFrmVisualizaOlap.SpeedButton4Click(Sender: TObject);
var
  Stream: TMemoryStream;
  RS: TResourceStream;
  tPath: string;
begin
  inherited;
  if not HCubeGERAL.Active then
    EXIT;
  ExportDialog.DefaultExt := 'htm';
  ExportDialog.Filter := 'HTML files|*.htm*';
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

    Stream := TMemoryStream.Create;
    RS := TResourceStream.Create(HInstance, 'HTML', RT_RCDATA);
    RS.SaveToStream(Stream);
    RS.Free;
    HTMLExport_Advanced.ExportToStream(Stream);
    Stream.SaveToFile(ExportDialog.FileName);
    Stream.Free;

    Screen.Cursor := crAppStart;
    try
      ShellExecute(0, 'open', 'iexplore', PChar(ExportDialog.FileName), nil, SW_SHOWNORMAL);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmVisualizaOlap.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not HierCubeGrid1.Active then
    EXIT;
  ExportDialog.DefaultExt := 'pdf';
  ExportDialog.Filter := 'PDF files|*.pdf';
  if ExportDialog.Execute then
  begin
    PDFExport.ExportToFile(ExportDialog.FileName);
    ShowMessage('Export completed!');
  end;
end;

procedure TFrmVisualizaOlap.ToolButton6Click(Sender: TObject);
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

procedure TFrmVisualizaOlap.Usecolumns1Click(Sender: TObject);
begin
  inherited;
  xChart.UseDimension := xhcColumns;
  with DimBtn do
  begin
    ImageIndex := 1;
    Hint := 'Uso Colunas';
  end;
end;

procedure TFrmVisualizaOlap.Userows1Click(Sender: TObject);
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

