unit UqrVisualizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRPrntr, ComCtrls, ImgList, ToolWin, Printers, QRExport, QRPDFFilt, QuickRpt,
  QRWebFilt, ExtCtrls, StdCtrls, Grids, QRPrev, UQrBuscaDlg, QRExtra, Clipbrd, ShellAPI,
  QRXMLSFilt, uDadosIni;

type
  TFrmQrVisualizar = class(TForm)
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    QRPreview1: TQRPreview;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ToolButton16: TToolButton;
    QRPDFFilter1: TQRPDFFilter;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar: TStatusBar;
    ThumbGrid: TDrawGrid;
    Tabs: TPageControl;
    TabThumbs: TTabSheet;
    TabSearchResult: TTabSheet;
    GroupBox1: TGroupBox;
    SearchTextLabel: TLabel;
    SearchResultBox: TListBox;
    QRXMLSFilter1: TQRXMLSFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRWMFFilter1: TQRWMFFilter;
    Label1: TLabel;
    ToolButton17: TToolButton;
    procedure ToolButton17Click(Sender: TObject);
    procedure QRPreview1ProgressUpdate(Sender: TObject; Progress: Integer);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton11Click(Sender: TObject);
    procedure SearchResultBoxClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ThumbGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      ARect: TRect; State: TGridDrawState);
    procedure ThumbGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure QRPreview1PageAvailable(Sender: TObject; PageNum: Integer);
    procedure FormShow(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure UpdateInfo;
    procedure SelectPage(aPageNumber: integer);
  private
    ShowThumbs, ShowSearch: boolean;
    FReportOrientation: TPrinterOrientation;
    ThumbUpdating, ThumbSelecting: boolean;
    ThumbFontHeight,
      ThumbDrawHeight,
      ThumbDrawWidth,
      ThumbTopMargin,
      ThumbLeftMargin: integer;
    { Private declarations }
  public
    procedure ResizeThumb(Sender: TObject);
    function GetTextSearch(var MatchCase: boolean; var AText: string): boolean;
    { Public declarations }
  end;

var
  FrmQrVisualizar: TFrmQrVisualizar;

implementation

uses ShlObj, uDtmAtivo;

var
  FParentReport: TCustomQuickrep;
  eventHandled: boolean;

{$R *.dfm}

procedure TFrmQrVisualizar.FormActivate(Sender: TObject);
begin
  FrmQrVisualizar.FormStyle:=fsStayOnTop;
  FrmQrVisualizar.FormStyle:=fsNormal;
end;

procedure TFrmQrVisualizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  vDadosIni.fechaStatusProcessamento;
  Action := caFree;
  FrmQrVisualizar := nil;
end;

procedure TFrmQrVisualizar.FormCreate(Sender: TObject);
begin
  HorzScrollbar.Tracking := true;
  VertScrollbar.Tracking := true;
  TResizeGrid(ThumbGrid).OnResize := ResizeThumb;
  Self.Icon.Handle := ExtractIcon(Handle, PChar(Application.ExeName), 0);
end;

procedure TFrmQrVisualizar.FormResize(Sender: TObject);
begin
  QRPreview1.UpdateZoom;
end;

procedure TFrmQrVisualizar.FormShow(Sender: TObject);
begin
  WindowState:=wsMaximized;
  UpdateInfo;
end;

function TFrmQrVisualizar.GetTextSearch(var MatchCase: boolean;
  var AText: string): boolean;
var
  SrchDlg: TFrmQrBuscaDlg;
begin
  AText := '';
  Result := false;
  SrchDlg := TFrmQrBuscaDlg.Create(self);
  srchDlg.ShowModal;
  if srchDlg.cancel then
  begin
    SrchDlg.Free;
    exit;
  end;
  Result := true;
  srchDlg.GetText(AText);
  MatchCase := srchDlg.GetCase;
  SrchDlg.Free;
end;

procedure TFrmQrVisualizar.QRPreview1PageAvailable(Sender: TObject;
  PageNum: Integer);
begin
//  UpdateInfo;
//  ThumbGrid.RowCount := QRPreview1.QRPrinter.PageCount;
//  ThumbGrid.Invalidate;
  if QRPreview1.qrprinter.status = mpFinished then
  begin

    UpdateInfo;
    ThumbGrid.RowCount := QRPreview1.QRPrinter.PageCount;
    ThumbGrid.Invalidate;
    Tabs.Visible := True;

//    ThumbGrid.RowCount := QRPreview1.QRPrinter.PageCount;
    label1.Visible:=false;
  end;
end;

procedure TFrmQrVisualizar.QRPreview1ProgressUpdate(Sender: TObject;
  Progress: Integer);
begin
  if QRPreview1.qrprinter.status = mpBusy then
  begin
    label1.Caption := '  Aguarde Processando...'+inttostr(progress);
    label1.Visible := true;
  end
  else
  if QRPreview1.qrprinter.status = mpFinished then
  begin
    label1.Visible := false;
  end;
end;

procedure TFrmQrVisualizar.ResizeThumb(Sender: TObject);
begin
  ThumbFontHeight := ThumbGrid.Canvas.TextHeight('P');
  ThumbGrid.DefaultColWidth := ThumbGrid.Width - 4;
  if FReportOrientation = poPortrait then
  begin
    ThumbDrawWidth := Round((ThumbGrid.DefaultColWidth - 20));
    ThumbDrawHeight := Round((ThumbDrawWidth / QRPreview1.QRPrinter.PaperWidth) * QRPreview1.QRPrinter.PaperLength - ThumbFontHeight);
  end
  else
  begin
    ThumbDrawWidth := Round((ThumbGrid.DefaultColWidth - 20));
    ThumbDrawHeight := Round((ThumbDrawWidth / QRPreview1.QRPrinter.PaperLength) * QRPreview1.QRPrinter.PaperWidth - ThumbFontHeight);
  end;

  ThumbGrid.DefaultRowHeight := ThumbDrawHeight;
  ThumbLeftMargin := Round((ThumbGrid.DefaultColWidth - ThumbDrawWidth) / 2);
  ThumbTopMargin := Round((ThumbGrid.DefaultRowHeight - ThumbDrawHeight) / 2);
end;

procedure TFrmQrVisualizar.SearchResultBoxClick(Sender: TObject);
var
  Page: Integer;
begin
  with SearchResultBox do
    if ItemIndex >= 0 then
      Page := Integer(Items.Objects[ItemIndex])
    else
      Page := 1;
  if (Page < 1) or (Page > QRPreview1.QRPrinter.PageCount) then
    Page := 1;
  SelectPage(Page);
end;

procedure TFrmQrVisualizar.SelectPage(aPageNumber: integer);
begin
  try
    QRPreview1.PageNumber := APageNumber;
    UpdateInfo;
    // set thumb row
    if ((aPagenumber > 0) and (aPagenumber <= QRPreview1.QRPrinter.PageCount) and (aPagenumber <= ThumbGrid.RowCount)) then
    begin
      ThumbUpdating := true;
      ThumbGrid.Row := APageNumber - 1;
      ThumbUpdating := false;
    end;
  except
  end;
end;

procedure TFrmQrVisualizar.ThumbGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; ARect: TRect; State: TGridDrawState);
var
  APage: TMetafile;
begin
  APage := QRPreview1.QRPrinter.GetPage(ARow + 1);
  if APage <> nil then
  begin
    PaintPageToCanvas(APage, ThumbGrid.Canvas, Rect(ARect.Left + ThumbLeftMargin, ARect.Top + 10, ARect.Right - 30, ARect.Bottom - 10), true);
  end;
  ThumbGrid.Canvas.Brush.Color := clBtnFace;
  ThumbGrid.Canvas.pen.Color := clblack;
  SetBkMode(ThumbGrid.Canvas.Handle, TRANSPARENT);
  ThumbGrid.Canvas.Textout(ARect.Left, ARect.Top, IntToStr(ARow + 1));
  SetBkMode(ThumbGrid.Canvas.Handle, OPAQUE);
  APage.Free;
end;

procedure TFrmQrVisualizar.ThumbGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ThumbUpdating or ThumbSelecting then
    exit;
  ThumbSelecting := true;
  if QRPreview1.PageNumber <> (ARow + 1) then
    QRPreview1.PageNumber := ARow + 1;
  UpdateInfo;
  Thumbselecting := false;
end;

procedure TFrmQrVisualizar.ToolButton10Click(Sender: TObject);
//begin
//  QRPreview1.QRPrinter.Print;
begin
  FParentReport := TCustomQuickRep(QRPreview1.QRPrinter.ParentReport);
  eventHandled := false;
  if assigned(FParentReport.OnStandPrevEvent) then
    FParentReport.OnStandPrevEvent(self, spPrint, 'Print', eventHandled);
  if eventHandled then
    exit;

  if PrintMetafileFromPreview or (not (qrprinter.ParentReport is TQuickRep)) then
    QRPrinter.Print
  else
    FParentReport.print;
end;

procedure TFrmQrVisualizar.ToolButton11Click(Sender: TObject);
var
  FindStr: string;
  MatchCase: boolean;
  I: integer;
  APage: TMetafile;
begin
  Tabs.ActivePage := TabSearchResult;
  if QRPreview1.QRPrinter.Status = mpBusy then
    exit;
  if GetTextSearch(MatchCase, FindStr) then
  begin
    SearchResultBox.Enabled := true;
    SearchTextLabel.Caption := FindStr;
    SearchResultBox.Items.Clear;
    for I := 1 to QRPreview1.QRPrinter.PageCount do
    begin
      APage := QRPreview1.QRPrinter.GetPage(I);
      try
        if StrInMetafile(FindStr, APage, MatchCase) then
          SearchResultBox.Items.AddObject('Página ' + IntToStr(I), TObject(i));
      finally
        APage.Free;
      end;
    end;
    if SearchResultBox.Items.Count = 0 then
    begin
      SearchResultBox.Items.Add('Texto não encontrado');
      SearchResultBox.Enabled := false;
    end;
  end;
end;

procedure TFrmQrVisualizar.ToolButton14Click(Sender: TObject);
begin
  QRPreview1.QRPrinter.ClosePreview(Self);
  close;
end;

procedure TFrmQrVisualizar.ToolButton16Click(Sender: TObject);
begin
  if QRPreview1.QRPrinter.Orientation = poPortrait then
    QRPreview1.QRPrinter.Orientation := poLandscape
  else
    QRPreview1.QRPrinter.Orientation := poPortrait;
  QRPreview1.Zoom := QRPreview1.Zoom - 1;
  QRPreview1.Zoom := QRPreview1.Zoom + 1;
end;

procedure TFrmQrVisualizar.ToolButton17Click(Sender: TObject);
var
  aExportFilter: TQRExportFilter;
  filtLibEntry: TQRExportFilterLibraryEntry;
  vtitulo: string;
begin                     
 try
    Screen.Cursor := crHourGlass;
    vtitulo := vDadosIni.apenasLetras(FrmQrVisualizar.Caption);
    vtitulo := StringReplace(vtitulo, 'Relatrio', 'Relatorio', [rfReplaceAll]);
    vtitulo := StringReplace(vtitulo, 'relatrio', 'relatorio', [rfReplaceAll]);
    vtitulo := StringReplace(vtitulo, 'Visualizar', '', [rfReplaceAll]);
    if trim(vtitulo) = '' then
    	vtitulo := 'Relatorio';
    
    if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
      CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

    if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
      exit;

    if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
      CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp');

    if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
      exit;

    QRPreview1.QRPrinter.Save(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + vtitulo + '.pdf');
    filtLibEntry := QRExportFilterLibrary.GetFilterByExtension('PDF');
    if filtLibEntry = nil then
      exit;
    try
      aExportFilter := filtLibEntry.ExportFilterClass.Create(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + vtitulo + '.pdf');
      QRPreview1.QRPrinter.ExportToFilter(aExportFilter);

      vDadosIni.EnvEmail(
      	vDadosIni.vEmp.vAssunto_dav,
        vDadosIni.vEmp.vMsg_dav,
        0,
        cEmail,
        '',
        '',
        cNenhum,
        vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + vtitulo + '.pdf');

	    DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + vtitulo + '.pdf'));
    finally
      aExportFilter.Free
    end
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmQrVisualizar.ToolButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    QRPreview1.QRPrinter.Load(OpenDialog1.FileName);
    QRPreview1.QRPrinter.Preview;
  end;
end;

procedure TFrmQrVisualizar.ToolButton2Click(Sender: TObject);
var
  aExportFilter: TQRExportFilter;
  filtLibEntry: TQRExportFilterLibraryEntry;
  sext, savefile: string;
  findx: integer;
begin
  if SaveDialog1.Execute then
  begin
    QRPreview1.QRPrinter.Save(SaveDialog1.FileName);
    sext := ExtractFileExt(SaveDialog1.FileName);
    savefile := SaveDialog1.FileName;
    sext := upperCase(sext);
    if sext[1] = '.' then
      sext := copy(sext, 2, 3);
    if sext = 'QRP' then
    begin
      QRPreview1.QRPrinter.Save(savefile);
      exit;
    end;
    filtLibEntry := QRExportFilterLibrary.GetFilterByExtension(sext);
    if filtLibEntry = nil then
      exit;
    try
      aExportFilter := filtLibEntry.ExportFilterClass.Create(savefile);
      QRPreview1.QRPrinter.ExportToFilter(aExportFilter);
    finally
      aExportFilter.Free
    end

  end;
end;

procedure TFrmQrVisualizar.ToolButton3Click(Sender: TObject);
begin
  SelectPage(1);
end;

procedure TFrmQrVisualizar.ToolButton4Click(Sender: TObject);
begin
  SelectPage(QRPreview1.PageNumber - 1);
end;

procedure TFrmQrVisualizar.ToolButton5Click(Sender: TObject);
begin
  SelectPage(QRPreview1.PageNumber + 1);
end;

procedure TFrmQrVisualizar.ToolButton6Click(Sender: TObject);
begin
  if (QRPreview1.QRPrinter.status = mpFinished) then
  begin
    SelectPage(QRPreview1.QRPrinter.PageCount);
  end
  else
  begin
    SelectPage(QRPreview1.QRPrinter.PageCount - 1);
  end
end;

procedure TFrmQrVisualizar.ToolButton7Click(Sender: TObject);
begin
  QRPreview1.Zoom := QRPreview1.Zoom + 10;
end;

procedure TFrmQrVisualizar.ToolButton8Click(Sender: TObject);
begin
  QRPreview1.Zoom := QRPreview1.Zoom - 10;
end;

procedure TFrmQrVisualizar.ToolButton9Click(Sender: TObject);
//begin
//  QRPreview1.QRPrinter.PrintSetup;
var
  prep: TCustomquickrep;
  tagval: integer;
begin
  tagval := 1; // default to cancel
  prep := nil;
  try
    printer.Refresh;
    if TCustomquickrep(qrprinter.ParentReport).ParentComposite <> nil then
    begin
      prep := TCustomquickrep(QRPreview1.QRPrinter.ParentReport);
      TCustomQuickrep(QRPreview1.QRPrinter.ParentReport).PrinterSetup;
      tagval := TCustomQuickrep(QRPreview1.QRPrinter.ParentReport).tag;
      if tagval <> 0 then
        exit;
      qrprinter.PrinterIndex := prep.PrinterSettings.printerindex;
      // 8/02/05
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.PrinterIndex := prep.UserPrinterSettings.PrinterIndex;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.FirstPage :=
        prep.UserPrinterSettings.FirstPage;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.LastPage :=
        prep.UserPrinterSettings.LastPage;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.OutputBin := TQRBin(prep.UserPrinterSettings.CustomBinCode);
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.Collate := prep.UserPrinterSettings.Collate;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.ColorOption := prep.UserPrinterSettings.ColorOption;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.PrintQuality := prep.UserPrinterSettings.PrintQuality;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.Copies := prep.UserPrinterSettings.Copies;
      TQRCompositeReport(prep.ParentComposite).printerSettings.Duplex := prep.UserPrinterSettings.ExtendedDuplex = 1;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.CustomBinCode := prep.UserPrinterSettings.CustomBinCode;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.UseCustomBinCode := prep.PrinterSettings.UseCustomBinCode;
      TQRCompositeReport(prep.ParentComposite).PrinterSettings.Duplex := prep.UserPrinterSettings.Duplex;
      QRPrinter.aPrinterSettings.OutputBin := TQRBin(prep.UserPrinterSettings.CustomBinCode);
      QRPrinter.aPrinterSettings.Collate := prep.UserPrinterSettings.Collate;
      QRPrinter.aPrinterSettings.ColorOption := prep.UserPrinterSettings.ColorOption;
      QRPrinter.aPrinterSettings.PrintQuality := prep.UserPrinterSettings.PrintQuality;
      QRPrinter.aPrinterSettings.Copies := prep.UserPrinterSettings.Copies;
      QRPrinter.aPrinterSettings.Duplex := prep.UserPrinterSettings.ExtendedDuplex = 1;
      QRPrinter.aPrinterSettings.CustomBinCode := prep.UserPrinterSettings.CustomBinCode;
      QRPrinter.aPrinterSettings.UseCustomBinCode := prep.PrinterSettings.UseCustomBinCode;
      QRPrinter.LastPage := prep.UserPrinterSettings.LastPage;
      QRPrinter.FirstPage := prep.UserPrinterSettings.FirstPage;
      QRPrinter.aPrinterSettings.Duplex := prep.UserPrinterSettings.Duplex;
      QRPrinter.aPrinterSettings.ExtendedDuplex := prep.UserPrinterSettings.ExtendedDuplex;
      QRPrinter.aPrinterSettings.UseExtendedDuplex := prep.UserPrinterSettings.UseExtendedDuplex;
      exit;
    end;
    if qrprinter.ParentReport is TCustomquickrep then
    begin
      FrmQrVisualizar.FormStyle:=fsNormal;
      TCustomQuickrep(QRPreview1.QRPrinter.ParentReport).PrinterSetup;
      tagval := TCustomQuickrep(QRPreview1.QRPrinter.ParentReport).tag;
      if tagval <> 0 then
        exit;
      prep := TCustomquickrep(QRPreview1.QRPrinter.ParentReport);
      qrprinter.PrinterIndex := prep.PrinterSettings.printerindex;
      if prep.UserPrinterSettings.CustomBinCode >= integer(Last) then
      begin
        QRPrinter.aPrinterSettings.UseCustomBinCode := true;
        QRPrinter.aPrinterSettings.CustomBinCode := prep.UserPrinterSettings.CustomBinCode;
      end
      else
      begin
        QRPrinter.aPrinterSettings.UseCustomBinCode := false;
        QRPrinter.aPrinterSettings.OutputBin := TQRBin(prep.UserPrinterSettings.CustomBinCode);
      end;
      QRPrinter.aPrinterSettings.Collate := prep.UserPrinterSettings.Collate;
      QRPrinter.aPrinterSettings.ColorOption := prep.UserPrinterSettings.ColorOption;
      QRPrinter.aPrinterSettings.PrintQuality := prep.UserPrinterSettings.PrintQuality;
      QRPrinter.aPrinterSettings.Copies := prep.UserPrinterSettings.Copies;
      QRPrinter.aPrinterSettings.Duplex := prep.UserPrinterSettings.ExtendedDuplex = 1;
      QRPrinter.LastPage := prep.UserPrinterSettings.LastPage;
      QRPrinter.FirstPage := prep.UserPrinterSettings.FirstPage;
      QRPrinter.aPrinterSettings.Duplex := prep.UserPrinterSettings.Duplex;
      QRPrinter.aPrinterSettings.ExtendedDuplex := prep.UserPrinterSettings.ExtendedDuplex;
      QRPrinter.aPrinterSettings.UseExtendedDuplex := prep.UserPrinterSettings.UseExtendedDuplex;
      if not PrintMetafileFromPreview then
      begin
        // set the quickrep settings
        if prep.UserPrinterSettings.CustomBinCode >= integer(Last) then
        begin
          prep.PrinterSettings.UseCustomBinCode := true;
          prep.PrinterSettings.CustomBinCode := prep.UserPrinterSettings.CustomBinCode;
        end
        else
        begin
          prep.PrinterSettings.UseCustomBinCode := false;
          prep.PrinterSettings.OutputBin := TQRBin(prep.UserPrinterSettings.CustomBinCode);
        end;
        prep.PrinterSettings.PrinterIndex := prep.UserPrinterSettings.PrinterIndex;
        prep.PrinterSettings.Copies := prep.UserPrinterSettings.Copies;
        prep.PrinterSettings.Duplex := prep.UserPrinterSettings.Duplex;
        prep.PrinterSettings.FirstPage := prep.UserPrinterSettings.FirstPage;
        prep.PrinterSettings.LastPage := prep.UserPrinterSettings.LastPage;
        prep.PrinterSettings.UseStandardprinter := prep.UserPrinterSettings.UseStandardprinter;
        prep.PrinterSettings.ExtendedDuplex := prep.UserPrinterSettings.ExtendedDuplex;
        prep.PrinterSettings.UseExtendedDuplex := prep.UserPrinterSettings.UseExtendedDuplex;
        prep.PrinterSettings.UseCustomPaperCode := prep.UserPrinterSettings.UseCustomPaperCode;
        prep.PrinterSettings.CustomPaperCode := prep.UserPrinterSettings.CustomPaperCode;
        prep.PrinterSettings.MemoryLimit := prep.UserPrinterSettings.MemoryLimit;
        prep.PrinterSettings.PrintQuality := prep.UserPrinterSettings.PrintQuality;
        prep.PrinterSettings.Collate := prep.UserPrinterSettings.Collate;
        prep.PrinterSettings.ColorOption := prep.UserPrinterSettings.ColorOption;
        prep.PrinterSettings.Orientation := prep.UserPrinterSettings.Orientation;
        prep.PrinterSettings.PaperSize := prep.UserPrinterSettings.PaperSize;
      end;
    end;
  finally
    if prep <> nil then
      if prep.PrintAfterSetup and (tagval = 0) then
        ToolButton10Click(self);
  end;

end;

procedure TFrmQrVisualizar.UpdateInfo;
begin
  StatusBar.Panels[1].Text := 'Página' + ' ' + IntToStr(QRPreview1.PageNumber) + ' ' +
    'de' + ' ' + IntToStr(QRPreview1.QRPrinter.PageCount);
  StatusBar.Panels[2].Text := QRPreview1.QRPrinter.Title;
end;

end.

