unit hw_boleto_utils;
//teste

interface

uses
{$IFNDEF VER180}
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Forms, SHDocVw, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.AppEvnts, System.ImageList, System.Contnrs,
  Vcl.Samples.Spin, Vcl.Buttons, Vcl.ImgList, Vcl.Controls,
  Vcl.OleCtrls;
{$ELSE}
  Windows, Messages, Variants, Classes,
  Graphics, Forms, SHDocVw, ExtCtrls,
  ComCtrls, ToolWin, StdCtrls,
  AppEvnts, Contnrs,
  Buttons, ImgList, Controls,
  OleCtrls;
{$ENDIF}

const
  hwgsdll32 = 'hw.gsdll32.dll';
  gsdll32   = 'gsdll32.dll';

type
  PDFPreview = class
  public
    class procedure Preview(const FileName: string; const Caption: string); overload;
    class procedure Preview(const FileNames: array of string; const Caption: string); overload;
  end;

  FormatoArquivo = (faIndefinido, faHTML, faJPEG, faPDF);

  TItemBoleto = class
  strict private
    ListToDelete: TStrings;
    function PDF2JPEG(): string;
    function PDF2PNG(): string;
  private
    Ftipo: FormatoArquivo;
    Fhtml: TStrings;
    FfileName: string;
    function GetHtml: TStrings;
    procedure SetHtml(const Value: TStrings);
    procedure SetFileName(const Value: string);
  public
    destructor Destroy; override;

    property tipo: FormatoArquivo read Ftipo;
    property html: TStrings read GetHtml write SetHtml;
    property fileName: string read FfileName write SetFileName;
  end;

  TBoletoPreview = class(TObjectList)
  strict private
    FListToDelete: TStrings;
    function PrintPDFs: Boolean;
    function JoinAllPDFs(output: string): Boolean;
  private
//    Query: TIBQuery;
    Web: TWebBrowser;
    FLastError: string;
    function GetItem(Index: Integer): TItemBoleto;
    procedure SetItem(Index: Integer; const Value: TItemBoleto);
    procedure PrintBoleto(Index: Integer);
    function GetListToDelete(): TStrings;

    property ListToDelete: TStrings read GetListToDelete;
  public
    destructor Destroy; override;

    function New: TItemBoleto; overload;
    function NewFromFile(FileName: string): TItemBoleto; overload;
    function NewFromText(Text: string): TItemBoleto; overload;
    function PrintPages(Index: Integer): Integer;

    procedure Preview(const Caption: string = '');
    procedure ToPdfFile(FileName: string; Silent: Boolean = True);

    property Items[Index: Integer]: TItemBoleto read GetItem write SetItem;
    property LastError: string read FLastError write FLastError;
  end;

  TformPreviewBoleto = class(TForm)
    pn_todo: TPanel;
    pb_tools: TPanel;
    pn_preview: TPanel;
    ToolBar1: TToolBar;
    bt_print: TToolButton;
    StatusBar1: TStatusBar;
    bt_save: TToolButton;
    bt_close: TToolButton;
    ToolButton4: TToolButton;
    bt_first: TToolButton;
    bt_prior: TToolButton;
    Label1: TLabel;
    ed_pag: TEdit;
    Label2: TLabel;
    ed_pag_tot: TEdit;
    bt_next: TToolButton;
    bt_last: TToolButton;
    bt_ZoonIn: TToolButton;
    bt_ZoonOut: TToolButton;
    ScrollBox1: TScrollBox;
    lb_zoom: TLabel;
    pn_padding: TPanel;
    ImageList1: TImageList;
    bt_goto: TToolButton;
    pnWeb: TPanel;
    WebBrowser1: TWebBrowser;
    btEspacador: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure bt_printClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_ZoonInClick(Sender: TObject);
    procedure bt_ZoonOutClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bt_priorClick(Sender: TObject);
    procedure bt_firstClick(Sender: TObject);
    procedure bt_nextClick(Sender: TObject);
    procedure bt_lastClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure bt_saveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_pagKeyPress(Sender: TObject; var Key: Char);
    procedure bt_gotoClick(Sender: TObject);
  private
    { Private declarations }
    //FHtml: string;
    ZoomControl: Double;
    Log: TStrings;
    EventRemove_WM_MOUSEWHEEL: TApplicationEvents;
    FBoletos: TBoletoPreview;
    FIndexPreview: Integer;

    procedure Zoom(Up: Boolean);
    procedure previewResolve;
    procedure appEventRemove_WM_MOUSEWHEELMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure LoadBoleto(Index: Integer);
  public
    { Public declarations }
    property Boletos: TBoletoPreview read FBoletos write FBoletos;
    //property Html: string read FHtml write FHtml;
    property IndexPreview: Integer read FIndexPreview write FIndexPreview;
  end;

var
  formPreviewBoleto: TformPreviewBoleto;

implementation

{$R *.dfm}

uses
  Math, SysUtils, StrUtils, ActiveX, Printers, Dialogs,
  hw_utils, hw_win_utils, ShellApi;

procedure TformPreviewBoleto.appEventRemove_WM_MOUSEWHEELMessage(var Msg: tagMSG; var Handled: Boolean);
var
  State: SmallInt;
begin
  State := GetKeyState(VK_CONTROL);
  if (State = -128) or (State = -127) then
    if Msg.message = WM_MOUSEWHEEL then
    begin
      Msg.message := WM_NULL;
      Msg.lParam := 0;
      Handled := False;
    end;
end;

procedure TformPreviewBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  formPreviewBoleto := nil;
end;

procedure TformPreviewBoleto.FormCreate(Sender: TObject);
begin
  ZoomControl := 1;
  EventRemove_WM_MOUSEWHEEL := TApplicationEvents.Create(Self);
  EventRemove_WM_MOUSEWHEEL.OnMessage := appEventRemove_WM_MOUSEWHEELMessage;
end;

procedure TformPreviewBoleto.FormDestroy(Sender: TObject);
begin
  EventRemove_WM_MOUSEWHEEL.OnMessage := nil;
  EventRemove_WM_MOUSEWHEEL.Free;
end;

procedure TformPreviewBoleto.FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  if (ScrollBox1.VertScrollBar.Position <= (ScrollBox1.VertScrollBar.Range - ScrollBox1.VertScrollBar.Increment)) then
    ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + ScrollBox1.VertScrollBar.Increment
  else
    ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Range - ScrollBox1.VertScrollBar.Increment;
end;

procedure TformPreviewBoleto.FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  if (ScrollBox1.VertScrollBar.Position >= ScrollBox1.VertScrollBar.Increment) then
    ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - ScrollBox1.VertScrollBar.Increment
  else
    ScrollBox1.VertScrollBar.Position := 0;
end;

procedure TformPreviewBoleto.FormResize(Sender: TObject);
begin
  previewResolve;
end;

procedure TformPreviewBoleto.FormShow(Sender: TObject);
begin
  Self.Icon.Handle := ExtractIcon(Handle,PChar(Application.ExeName),0);
  WebBrowser1.Silent := True;

  if not Assigned(Boletos) then
  begin
    ed_pag.Text := '0 ';
    ed_pag_tot.Text := '0 ';
    ToolBar1.Enabled := False;
    raise Exception.Create('Preview de Boletos usado incorretamente. Use o "BoletoPreview.Preview"');
  end;

  ed_pag_tot.Text := IntToStr(Boletos.Count) + ' ';

  if not Assigned(WebBrowser1.Document) then
    WebBrowser1.Navigate('about:blank');

  IndexPreview := 0;
  LoadBoleto(IndexPreview);
end;

procedure TformPreviewBoleto.LoadBoleto(Index: Integer);
var
  ADoccument: Variant;
begin
  if not ((Index >= 0) and (Index <= (Boletos.Count - 1))) then
    Exit;

  ADoccument := WebBrowser1.Document;
  ADoccument.Clear;
  ADoccument.Write(Boletos.Items[Index].html.Text);
  ADoccument.Close;

  WebBrowser1.OleObject.Document.Body.Style.OverflowX := 'hidden';
  WebBrowser1.OleObject.Document.Body.Style.OverflowY := 'hidden';

  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
    Application.HandleMessage;

  ZoomControl := 0.5;
  Zoom(True);

  bt_first.Enabled := Index > 0;
  bt_prior.Enabled := Index > 0;
  bt_next.Enabled  := Index < (Boletos.Count - 1);
  bt_last.Enabled  := Index < (Boletos.Count - 1);
  ed_pag.Text := IntToStr(Index + 1) + ' ';
end;

procedure TformPreviewBoleto.previewResolve;
var
  Altura, Largura, Fact: Integer;
begin
  case Trunc(ZoomControl * 100) of
    050 : Fact := 1;
    100 : Fact := 2;
    150 : Fact := 3;
    200 : Fact := 4;
  end;
  Altura  := Fact * 535;
  Largura := Fact * 330;

  Fact := Trunc((ScrollBox1.ClientWidth - Largura) / 2);

  pn_padding.Padding.Left  := IfThen(Fact > 0, Fact) ;
  pn_padding.Padding.Right := IfThen(Fact > 0, Fact) ;
  pn_padding.Height        := Altura;

  if pn_padding.Padding.Left = 0 then
  begin
    pn_padding.Top   := 0;
    pn_padding.Left  := 0;
    pn_padding.Align := alNone;
    pn_padding.Width := Largura;
  end
  else
    pn_padding.Align := alTop;
end;

procedure TformPreviewBoleto.bt_ZoonOutClick(Sender: TObject);
begin
  Zoom(True);
end;

procedure TformPreviewBoleto.bt_printClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if Boletos.PrintPages(IndexPreview) > 0 then
      Close;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TformPreviewBoleto.bt_saveClick(Sender: TObject);
var
  FileSave: TSaveDialog;
begin
  FileSave := TSaveDialog.Create(Self);
  try
    FileSave.DefaultExt := '.pdf';
    FileSave.Title      := 'Salvar arquivo como';
    FileSave.Filter     := 'Arquivo PDF (*.pdf)|*.pdf';

    if FileSave.Execute  then
    begin
    	try
      	Screen.Cursor := crHourGlass;
	      Boletos.ToPdfFile(FileSave.FileName, False);
      finally
        Screen.Cursor := crDefault;
      end;
    end;

  finally
    FileSave.Free;
  end;

end;

procedure TformPreviewBoleto.bt_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TformPreviewBoleto.bt_firstClick(Sender: TObject);
begin
  IndexPreview := 0;
  LoadBoleto(IndexPreview);
end;

procedure TformPreviewBoleto.bt_gotoClick(Sender: TObject);
var
  Pag: Integer;
  StrPage: string;
begin
  if not InputQuery('Ir para página', 'Informe o número da página', StrPage) then
    Exit;

  if TryStrToInt(Trim(StrPage), Pag) then
    if (Pag > 0) and (Pag <= Boletos.Count) then
    begin
      IndexPreview := Pag - 1;
      LoadBoleto(IndexPreview);
    end;
end;

procedure TformPreviewBoleto.bt_priorClick(Sender: TObject);
begin
  if (IndexPreview > 0) and (Boletos.Count > 0) then
  begin
    IndexPreview := IndexPreview - 1;
    LoadBoleto(IndexPreview);
  end;
end;

procedure TformPreviewBoleto.ed_pagKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['1'..'9']) then
    Key := #0
  else if StrToInt(Key) > Boletos.Count then
    Key := #0;
end;

procedure TformPreviewBoleto.bt_nextClick(Sender: TObject);
begin
  if (Boletos.Count > 0) and ((IndexPreview + 1) <= (Boletos.Count - 1)) then
  begin
    IndexPreview := IndexPreview + 1;
    LoadBoleto(IndexPreview);
  end;
end;

procedure TformPreviewBoleto.bt_lastClick(Sender: TObject);
begin
  if (Boletos.Count > 0) and ((IndexPreview + 1) <> (Boletos.Count - 1)) then
  begin
    IndexPreview := Boletos.Count - 1;
    LoadBoleto(IndexPreview);
  end;
end;

procedure TformPreviewBoleto.bt_ZoonInClick(Sender: TObject);
begin
  Zoom(False);
end;

procedure TformPreviewBoleto.Zoom(Up: Boolean);
begin
  if Up then
  begin
    if ZoomControl < 2 then
      ZoomControl := ZoomControl + 0.5
    else
      Exit;
  end
  else
  begin
    if ZoomControl > 0.5 then
      ZoomControl := ZoomControl - 0.5
    else
      Exit;
  end;

  WebBrowser1.OleObject.Document.Body.Style.Zoom := ZoomControl;

  lb_zoom.Caption := '    ' + FloatToStr(ZoomControl * 100) + '%  ';

  previewResolve;
end;

{ TBoletoPreview }

destructor TBoletoPreview.Destroy;
var
  fileD: string;
begin

  if Assigned(FListToDelete) then
  begin

    for fileD in FListToDelete do
      if FileExists(fileD) then
        DeleteFile(fileD);

    FListToDelete.Free;
  end;

  inherited;
end;

function TBoletoPreview.GetItem(Index: Integer): TItemBoleto;
begin
  Result := TItemBoleto(inherited Items[Index]);
end;

function TBoletoPreview.GetListToDelete(): TStrings;
begin
  if not Assigned(FListToDelete) then
    FListToDelete := TStringList.Create;

  Result := FListToDelete;
end;

function TBoletoPreview.New: TItemBoleto;
begin
  Result := TItemBoleto.Create;
  Add(Result);
end;

function TBoletoPreview.JoinAllPDFs(output: string): Boolean;
type
  Tgspdf_pdfmerge = function (files: array of WideString; outputFile: WideString): Boolean; stdcall;
  Tgspdf_lasterror = function(): string; stdcall;
  Tgspdf_guid = function(): WideString; stdcall;

var
  handleDLLGSD: THandle;
  gspdf_pdfmerge: Tgspdf_pdfmerge;
  gspdf_lasterror: Tgspdf_lasterror;
  gspdf_guid: Tgspdf_guid;
  files: array of WideString;
  outputGS: WideString;
  I: Integer;
begin
  if (Self.Count = 1) and (Self.Items[0].tipo = faPDF) then
  begin
    {$IFNDEF VER180}
    CopyFile(PWideChar(Self.Items[0].fileName), PWideChar(output), False);
    {$ELSE}
    CopyFile(PAnsiChar(Self.Items[0].fileName), PAnsiChar(output), False);
    {$ENDIF}
    Result := FileExists(output);
  end;

  if (not FileExists(ExtractFilePath(Application.ExeName) + hwgsdll32)) or
     (not FileExists(ExtractFilePath(Application.ExeName) + gsdll32)) then
    raise Exception.Create(Format('Falta(m) arquivo(s) na instalação. Por favor contacte o suporte técnico' + sLineBreak + sLineBreak +
                                  'Arquivos: "%s" e/ou "%s"', [hwgsdll32, gsdll32]));

  handleDLLGSD := LoadLibrary(hwgsdll32);

  if handleDLLGSD = 0  then
    raise Exception.Create(Format('DLL "%s" não pode ser carregada. Por favor contacte o suporte técnico', [hwgsdll32]));

  try

    @gspdf_pdfmerge := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_pdfmerge'));
    @gspdf_lasterror := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_lasterror'));
    @gspdf_guid := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_guid'));

    outputGS := GetPathTemp('') + string(gspdf_guid) + '.pdf';

    SetLength(files, Self.Count);

    for I := 0 to Self.Count - 1 do
      files[I] := Self.Items[I].fileName;

    if not gspdf_pdfmerge(files, outputGS) then
      raise Exception.Create(string(gspdf_lasterror));

    ListToDelete.Add(outputGS);

//    if FileExists(output) then
//    begin
//      DeleteFile(output)
//    end;
    {$IFNDEF VER180}
    CopyFile(PWideChar(outputGS), PWideChar(output), False);
    {$ELSE}
    CopyFile(PAnsiChar(outputGS), PAnsiChar(output), False);
    {$ENDIF}

    Result := FileExists(output);

  finally
    FreeLibrary(handleDLLGSD);
  end;
end;

function TBoletoPreview.NewFromFile(FileName: string): TItemBoleto;
var
  Lista: TStrings;
  extFile: string;
  image: TImage;
begin
  if not FileExists(FileName) then
    raise Exception.Create(Format('Arquivo "%s" não existe', [FileName]));

  extFile := ExtractFileExt(FileName);
  if MatchText(extFile, ['.pdf', '.jpg', '.jpeg', '.jfif']) then
  begin
    Result := TItemBoleto.Create;
    Result.fileName := FileName;

    Add(Result);
  end
  else if MatchText(extFile, ['htm', 'html']) then
  begin
    Result := TItemBoleto.Create;
    Result.html.LoadFromFile(FileName);
    Add(Result);
  end
  else
    raise Exception.Create('Formato de arquivo não suportado');
end;

function TBoletoPreview.NewFromText(Text: string): TItemBoleto;
var
  Lista: TStrings;
  extFile: string;
  image: TImage;
  sFileName, sBase64: string;
  I: Integer;
begin
  if trim(Text) = '' then
    Exit;

  I := Pos('|', Text);

  if I = 0 then
    Exit;

  sFileName := GetPathTemp('') + NewGuid + '.pdf';
  sBase64   := Copy(Text, I + 1, Length(Text) - I);

  sFileName := Base64Helper.DecodeFile(sBase64, sFileName);

  if FileExists(sFileName) then
  begin
    Result := TItemBoleto.Create;
    Result.fileName := sFileName;

    ListToDelete.Add(sFileName);

    Add(Result);
  end
  else
    raise Exception.Create('Formato de arquivo não suportado');
end;

procedure TBoletoPreview.Preview(const Caption: string);
begin
  Application.CreateForm(TformPreviewBoleto, formPreviewBoleto);
  formPreviewBoleto.Boletos := Self;
  if Caption <> '' then
    formPreviewBoleto.Caption := Caption;
  formPreviewBoleto.ShowModal;
end;

procedure TBoletoPreview.PrintBoleto(Index: Integer);
var
  R: TRect;
  Sh, Ph: HDC;
  ADoccument: Variant;
begin


  {$REGION 'carregando o conteudo do html'}
  ADoccument := Web.Document;
  ADoccument.Clear;
  ADoccument.Write(ReplaceText(Self.Items[Index].html.Text, '<body>', '<body style="padding:65px">'));
  ADoccument.Close;

  Web.OleObject.Document.Body.Style.OverflowX := 'hidden';
  Web.OleObject.Document.Body.Style.OverflowY := 'hidden';
  Web.OleObject.Document.Body.Style.Zoom      := 1;

  while Web.ReadyState <> READYSTATE_COMPLETE do
    Application.HandleMessage;
  {$ENDREGION}

  {$REGION 'Print Canvas'}
  Printer.Canvas.Lock;
  try
    Sh := GetDC(0);
    Ph := Printer.Canvas.Handle;

    //TODO: make rect a bit smaller for a page margin
    //TODO: get page size from printer settings, assume A4 here (210x297mm)
    R.Left         := 0;
    R.Top          := 0;
    R.Right        := 2100 * GetDeviceCaps(Sh,LOGPIXELSX) div 254;
    R.Bottom       := 2970 * GetDeviceCaps(Sh,LOGPIXELSY) div 254;
    Web.BoundsRect := R;

    SetMapMode(Ph, MM_ISOTROPIC);
    SetWindowExtEx(Ph, R.Right, R.Bottom, nil);
    SetViewportExtEx(Ph, R.Right, R.Bottom, nil);
    R.Right:=GetDeviceCaps(Ph, HORZRES) - 1;
    R.Bottom:=GetDeviceCaps(Ph, VERTRES) - 1;

    (Web.ControlInterface as IViewObject).Draw(DVASPECT_CONTENT, 1, nil, nil, 0, Ph, @R, nil, nil, 0);

  finally
    Printer.Canvas.Unlock;
  end;
  {$ENDREGION}

end;

function TBoletoPreview.PrintPages(Index: Integer): Integer;
var
  I, Copias, Start, Stop: Integer;
  PrintDialog1: TPrintDialog;
  printerName: WideString;
begin
  Result := 0;
  if Self.Count = 0 then
    Exit;

  if Self.Items[0].tipo = faPDF then
  begin
    PrintPDFs;
    Exit;
  end;

  {$REGION 'Setup'}
  PrintDialog1 := TPrintDialog.Create(nil);
  try
    PrintDialog1.MinPage := 1;
    PrintDialog1.MaxPage := Self.Count;
    PrintDialog1.Options := [poPageNums, poSelection];
    if not PrintDialog1.Execute(Application.Handle) then
      Exit;

    Copias := PrintDialog1.Copies;
    if Copias <= 0 then
    begin
      ShowErro('Número de cópias deve ser maior que zero');
      Exit;
    end;

    if PrintDialog1.PrintRange = prAllPages then
    begin
      Start := PrintDialog1.MinPage - 1;
      Stop  := PrintDialog1.MaxPage - 1;
    end
    else if PrintDialog1.PrintRange = prSelection then
    begin
      Start := Index;
      Stop := Start;
    end
    else if PrintDialog1.PrintRange = prPageNums then
    begin
      Start := PrintDialog1.FromPage - 1;
      Stop := PrintDialog1.ToPage - 1;
    end;

  finally
    PrintDialog1.Free;
  end;
  {$ENDREGION}

  OleInitialize(nil);

  Web := TWebBrowser.Create(nil);
  try
    Web.Height := 1070;
    Web.Width  := 750;
    Web.Silent := True;
    if not Assigned(Web.Document) then Web.Navigate('about:blank');

    Printer.BeginDoc;
    try

      for I := Start to Stop do
      begin
        if Result > 0 then
          Printer.NewPage;

        PrintBoleto(I);
        Result := Result + 1;
      end;

      Printer.EndDoc;
    except
      Printer.Abort;
      raise;
    end;

  finally
    web.Free;
  end;

end;

function TBoletoPreview.PrintPDFs: Boolean;
type
  Tgspdf_pdfprint = function (pdfFile, printerName: WideString): Boolean; stdcall;
  Tgspdf_lasterror = function(): string; stdcall;
var
  handleDLLGSD: THandle;
  gspdf_pdfprint: Tgspdf_pdfprint;
  gspdf_lasterror: Tgspdf_lasterror;

  pdfFile: WideString;
  printerName: WideString;
  fileName: string;
begin
  Result := False;

  fileName := GetFileNameRandom('', 'pdf');
  try

    if not JoinAllPDFs(fileName) then
      Exit;

    pdfFile := fileName;
    printerName := ''; //Printer.Printers[Printer.PrinterIndex];

    handleDLLGSD := LoadLibrary(hwgsdll32);
    try
      if handleDLLGSD = 0  then
        raise Exception.Create(Format('DLL "%s" não pode ser carregada. Por favor contacte o suporte técnico', [hwgsdll32]));

      @gspdf_pdfprint := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_pdfprint'));
      @gspdf_lasterror := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_lasterror'));

      if not gspdf_pdfprint(pdfFile, WideString(printerName)) then
        raise Exception.Create(string(gspdf_lasterror));

      Result := True;

    finally
      FreeLibrary(handleDLLGSD);
    end;

  finally
    if FileExists(fileName) then
      DeleteFile(fileName);
  end;

end;

procedure TBoletoPreview.SetItem(Index: Integer; const Value: TItemBoleto);
begin
  Put(Index, Value);
end;

procedure TBoletoPreview.ToPdfFile(FileName: string; Silent: Boolean);
var
  I, BodyIniPos, BodyFimPos: Integer;
  HtmlAll, HtmlUn, HtmlFileName: string;
  HtmlFile: TextFile;
  IniFile: TStrings;
  allPDFs: Boolean;
begin
  FLastError := '';
  if not Silent then
    if FileExists(FileName) then
      if ShowConfirmacao('Arquivo já existe. Deseja substituir') <> IDYES then
        Exit;


  allPDFs := True;
  for I := 0 to Self.Count - 1 do
    if not allPDFs then
      Break
    else
      allPDFs := Self.Items[I].tipo = {$IFNDEF VER180}FormatoArquivo.{$ENDIF}faPDF;

  if allPDFs then
    if JoinAllPDFs(FileName) then
      Exit;

  if not FileExists(ExtractFilePath(Application.ExeName) + 'htm2pdf.exe') then
  begin
    if not Silent then
      ShowErro('Engine de conversão pdf não econtrada: htm2pdf');
    Exit;
  end;

  {$REGION 'unificando boletos em 1 html apenas'}
  for I := 0 to Self.Count - 1 do
  begin
  	application.ProcessMessages;
    HtmlUn     := ReplaceText(Self.Items[I].html.Text, 'table.qp { page-break-after: always }', '');
    BodyIniPos := Pos('<body>' , LowerCase(HtmlUn));
    BodyFimPos := Pos('</body>', LowerCase(HtmlUn));

    if I = 0 then
      HtmlAll := Copy(HtmlUn, 1, BodyFimPos - 1)
    else
    begin
      HtmlUn     := Copy(HtmlUn, BodyIniPos + 6, (BodyFimPos - 1) - (BodyIniPos + 6));
      HtmlAll := HtmlAll + '<div style="page-break-before: always"> ' + HtmlUn + '</div>';
    end;
  end;
  HtmlAll := HtmlAll + '</BODY></HTML>';
  {$ENDREGION}

  //Nome do arquivo temporario do html
  HtmlFileName := IncludeTrailingPathDelimiter(GetPathTemp('PDFTemp')) + 'Boletos.html';

  try
    {$REGION 'Criando arquivo Html para conversao'}
    AssignFile(HtmlFile, HtmlFileName);
    try
      Rewrite(HtmlFile);

      Write(HtmlFile, HtmlAll);

    finally
      CloseFile(HtmlFile);
    end;
    {$ENDREGION}

    {$REGION 'Criando arquivo Ini do htm2pdf'}
    IniFile := TStringList.Create;
    IniFile.Add('[Settings]');
    IniFile.Add('HTML=' + HtmlFileName);
    IniFile.Add('PDF=' + FileName);
    IniFile.Add('OpenAfterSave=0');
    IniFile.SaveToFile(ExtractFilePath(Application.Exename) + 'htm2pdf.ini');
    {$ENDREGION}

    try

      CreateProcessSimple(ExtractFilePath(Application.Exename) + 'htm2pdf.exe /silent', True);

    finally
      if FileExists(HtmlFileName) then
        DeleteFile(HtmlFileName);
    end;

  except on E: Exception do
    begin
      FLastError := Format('Erro ao criar arquivo. Sem permissões %s %s', [sLineBreak, e.Message]);
      if not Silent then ShowErro(FLastError);
      Exit;
    end;
  end;
end;

{ TItemBoleto }

destructor TItemBoleto.Destroy;
var
  fileD: string;
begin
  if Assigned(Fhtml) then
    Fhtml.Free;

  if Assigned(ListToDelete) then
  begin

    for fileD in ListToDelete do
      if FileExists(fileD) then
        DeleteFile(fileD);

    ListToDelete.Free;
  end;

  inherited;
end;

function TItemBoleto.GetHtml: TStrings;
begin
  if Ftipo = {$IFNDEF VER180}FormatoArquivo.{$ENDIF}faIndefinido then
    if Assigned(Fhtml) then
      raise Exception.Create('Tipo de arquivo ainda não inicializado');

  if not Assigned(Fhtml) then
    html := TStringList.Create;

  Result := Fhtml;
end;

function TItemBoleto.PDF2JPEG: string;
type
  Tgspdf_pdf2jpeg_dpis = function (pdfFile, jpegFile, dpis: WideString): Boolean; stdcall;
  Tgspdf_lasterror = function(): string; stdcall;
  Tgspdf_guid = function(): WideString; stdcall;

var
  handleDLLGSD: THandle;
  gspdf_pdf2jpeg_dpis: Tgspdf_pdf2jpeg_dpis;
  gspdf_lasterror: Tgspdf_lasterror;
  gspdf_guid: Tgspdf_guid;
begin

  if (not FileExists(ExtractFilePath(Application.ExeName) + hwgsdll32)) or
     (not FileExists(ExtractFilePath(Application.ExeName) + gsdll32)) then
    raise Exception.Create(Format('Falta(m) arquivo(s) na instalação. Por favor contacte o suporte técnico' + sLineBreak + sLineBreak +
                                  'Arquivos: "%s" e/ou "%s"', [hwgsdll32, gsdll32]));

  handleDLLGSD := LoadLibrary(hwgsdll32);

  if handleDLLGSD = 0  then
    raise Exception.Create(Format('DLL "%s" não pode ser carregada. Por favor contacte o suporte técnico', [hwgsdll32]));

  try

    @gspdf_pdf2jpeg_dpis := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_pdf2jpeg_dpis'));
    @gspdf_lasterror := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_lasterror'));
    @gspdf_guid := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_guid'));

    Result := GetPathTemp('') + string(gspdf_guid) + '.jpeg';

    if not gspdf_pdf2jpeg_dpis(FfileName, Result, '200') then             
      raise Exception.Create(string(gspdf_lasterror));

    if not Assigned(ListToDelete) then
      ListToDelete := TStringList.Create;

    ListToDelete.Add(Result);

  finally
    FreeLibrary(handleDLLGSD);
  end;
end;

function TItemBoleto.PDF2PNG: string;
type
  Tgspdf_pdf2png = function (pdfFile, pngFile: WideString): Boolean; stdcall;
  Tgspdf_lasterror = function(): string; stdcall;
  Tgspdf_guid = function(): WideString; stdcall;

var
  handleDLLGSD: THandle;
  gspdf_pdf2png: Tgspdf_pdf2png;
  gspdf_lasterror: Tgspdf_lasterror;
  gspdf_guid: Tgspdf_guid;
begin

  if (not FileExists(ExtractFilePath(Application.ExeName) + hwgsdll32)) or
     (not FileExists(ExtractFilePath(Application.ExeName) + gsdll32)) then
    raise Exception.Create(Format('Falta(m) arquivo(s) na instalação. Por favor contacte o suporte técnico' + sLineBreak + sLineBreak +
                                  'Arquivos: "%s" e/ou "%s"', [hwgsdll32, gsdll32]));

  handleDLLGSD := LoadLibrary(hwgsdll32);

  if handleDLLGSD = 0  then
    raise Exception.Create(Format('DLL "%s" não pode ser carregada. Por favor contacte o suporte técnico', [hwgsdll32]));

  try

    @gspdf_pdf2png := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_pdf2png'));
    @gspdf_lasterror := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_lasterror'));
    @gspdf_guid := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_guid'));

    Result := GetPathTemp('') + string(gspdf_guid) + '.png';

    if not gspdf_pdf2png(FfileName, Result) then
      raise Exception.Create(string(gspdf_lasterror));

    if not Assigned(ListToDelete) then
      ListToDelete := TStringList.Create;

    ListToDelete.Add(Result);

  finally
    FreeLibrary(handleDLLGSD);
  end;
end;

procedure TItemBoleto.SetFileName(const Value: string);
var
  extFile: string;
  imageFile: string;
  originalType: FormatoArquivo;
begin
  if Ftipo <> {$IFNDEF VER180}FormatoArquivo.{$ENDIF}faIndefinido then
    raise Exception.Create('Tipo de arquivo já inicializado. Não é possível mais criar item como Image');

  if not FileExists(Value) then
    raise Exception.Create(Format('Arquivo "%s" não existe', [Value]));

  extFile := ExtractFileExt(Value);
  if MatchText(extFile, ['.pdf']) then
    originalType := {$IFNDEF VER180}FormatoArquivo.{$ENDIF}faPDF
  else if MatchText(extFile, ['.jpg', '.jpeg', '.jfif']) then
    originalType := {$IFNDEF VER180}FormatoArquivo.{$ENDIF}faJPEG
  else
    raise Exception.Create('Formato de arquivo não suportado');

  FfileName := Value;

  {$REGION 'Convert PDF2Image'}

  if originalType = {$IFNDEF VER180}FormatoArquivo.{$ENDIF}faPDF then
    imageFile := PDF2PNG // Melhor qualidade de image
  else
    imageFile := FfileName;

  {$ENDREGION}

  Fhtml := TStringList.Create;
  Fhtml.Text := '<html></head><head/><body><img src="' + imageFile + '" width="100%" height="93%"></body></html>';

  Ftipo := originalType;
end;

procedure TItemBoleto.SetHtml(const Value: TStrings);
begin
  if Ftipo <> {$IFNDEF VER180}FormatoArquivo.{$ENDIF}faIndefinido then
    raise Exception.Create('Tipo de arquivo já inicializado. Não é possível mais criar item como HTML');

  Ftipo := {$IFNDEF VER180}FormatoArquivo.{$ENDIF}faHTML;
  Fhtml := Value;
end;

{ PDFPreview }

class procedure PDFPreview.Preview(const FileNames: array of string; const Caption: string);
var
	Prev: TBoletoPreview;
  I: Integer;
begin
  Prev := TBoletoPreview.Create;
  Screen.Cursor := crHourGlass;
  try
    for I := 0 to High(FileNames) do
      Prev.NewFromFile(FileNames[I]);

    if Prev.Count > 0 then
      Prev.Preview(Caption);
  finally
    Prev.Free;
    Screen.Cursor := crDefault;
  end;
end;          

class procedure PDFPreview.Preview(const FileName, Caption: string);
var
  FileNames: array of string;
begin
  SetLength(FileNames, 1);

  FileNames[0] := FileName;

  PDFPreview.Preview(FileNames, Caption);
end;

end.
