unit hw_graphics_utils;

interface

uses
  Windows, Graphics, Classes;

type
  TStockIconSize = (sisLarge, sisSmall, sisShellSize);

  TStockIconHack = class(TPersistent);

  TStockIcon = class
    class function GetIcon(id: integer): HICON; overload;
    class function GetIcon(id: integer; size: TStockIconSize;
      overlay, selected: boolean): HICON; overload;
    class function GetBmp(id: integer): Graphics.TBitmap; overload; // conflicts with "Windows" unit
    class function GetBmp(id: integer; size: TStockIconSize;
      overlay, selected: boolean): Graphics.TBitmap; overload;
  end;

  TGraphicsUtils = class
    class function TextWidth(Text:string; Font: TFont): Integer;
  end;

implementation

uses
  SysUtils, MyShellApi;

{ TStockIcon }

class function TStockIcon.GetIcon(id: integer; size: TStockIconSize;
  overlay, selected: boolean): HICON;
type
  TSHGetStockIconInfo = function(siid: SHSTOCKICONID; uFlags: UINT; var psii: TSHStockIconInfo): HRESULT; stdcall;
const
  SHELL32 = 'shell32.dll';
var
  flags: cardinal;
  SSII: TSHStockIconInfo;
  ResCode: HResult;
  hShell32: THandle;
  ASHGetStockIconInfo: TSHGetStockIconInfo;
begin
  // you always want to get an icon so SHGSI_ICON is here in all choices
  case size of
    sisLarge: flags := SHGSI_ICON or SHGSI_LARGEICON;
    sisSmall: flags := SHGSI_ICON or SHGSI_SMALLICON;
    sisShellSize: flags := SHGSI_ICON or SHGSI_SHELLICONSIZE;
  end;

  if selected then
     flags := flags OR SHGSI_SELECTED;
  if overlay then
     flags := flags OR SHGSI_LINKOVERLAY;

  SSII.cbSize := SizeOf(SSII);

  {$IFDEF VER180}
  hShell32 := LoadLibrary(PAnsiChar(SHELL32));
  {$ELSE}
  hShell32 := LoadLibrary(PWideChar(SHELL32));
  {$ENDIF}
  try
    if hShell32 = 0 then
      Exit;

    @ASHGetStockIconInfo := GetProcAddress(hShell32, PAnsiChar('SHGetStockIconInfo'));

    if Assigned(ASHGetStockIconInfo) then
      ResCode := ASHGetStockIconInfo(id, flags, SSII)
    else
      ResCode := S_FALSE;
  //  ResCode := SHGetStockIconInfo(id, flags, SSII);

    if ResCode <> S_OK then
    begin
      if ResCode = E_INVALIDARG then
        raise Exception.Create(
          'The stock icon identifier [' + IntToStr(id) + '] is invalid')
      else
        Result := 0;
    end
    else
      Result := SSII.hIcon;
  finally
    FreeLibrary(hShell32)
  end;
end;

class function TStockIcon.GetIcon(id: integer): HICON;
begin
  Result := GetIcon(id, sisLarge, false, false);
end;

class function TStockIcon.GetBmp(id: integer): TBitmap;
begin
  Result := GetBmp(id, sisLarge, false, false);
end;

class function TStockIcon.GetBmp(id: integer; size: TStockIconSize; overlay,
  selected: boolean): TBitmap;
var aIcon: HICON; tempIcon: TIcon;
begin
  aIcon := GetIcon(id, size, overlay, selected);
  tempIcon := TIcon.Create;
  try
    tempIcon.Handle := aIcon;
    Result := Graphics.TBitmap.Create;
    TStockIconHack(tempIcon).AssignTo(Result);
  finally
    tempIcon.Free;
  end;
end;

{ TGraphicsUtils }

class function TGraphicsUtils.TextWidth(Text:string;
  Font: TFont): Integer;
var
  c: TBitmap;
begin
  c := TBitmap.Create;
  try
    c.Canvas.Font.Assign(Font);
    Result := c.Canvas.TextWidth(Text);
  finally
    c.Free;
  end;
end;

end.

