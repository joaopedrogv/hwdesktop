unit hw_pdf_utils;

interface

uses
{$IFNDEF VER180}
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.AppEvnts, System.ImageList, Vcl.ImgList, System.Contnrs, Vcl.Samples.Spin, Vcl.Buttons,
  ImgList, Controls, OleCtrls, Forms, ComCtrls, StdCtrls, ToolWin, Classes,
  ExtCtrls, System.SysUtils;
{$ELSE}
  Windows, ImgList, Controls, StdCtrls, Buttons, OleCtrls, SHDocVw, Forms,
  ComCtrls, ToolWin, Classes, ExtCtrls, Contnrs, AppEvnts, Messages, IBQuery, SysUtils;
{$ENDIF}

const
  hwgsdll32 = 'hw.gsdll32.dll';
  gsdll32   = 'gsdll32.dll';

type

  PdfHelper = class
  private
    class procedure CheckFiles;
  public
  	class function Merge(files: array of WideString; output: WideString): Boolean; overload;
    class function Print(pdfFileName, printerName: WideString; deleteFileAfter: Boolean = False): WideString;
  end;

implementation

uses
  hw_win_utils;

{ PdfHelper }

class procedure PdfHelper.CheckFiles;
begin
  if (not FileExists(ExtractFilePath(ParamStr(0)) + hwgsdll32)) or
     (not FileExists(ExtractFilePath(ParamStr(0)) + gsdll32)) then
    raise Exception.Create(Format('Falta(m) arquivo(s) na instalação. Por favor contacte o suporte técnico' + sLineBreak + sLineBreak +
                                  'Arquivos: "%s" e/ou "%s"', [hwgsdll32, gsdll32]));
end;

class function PdfHelper.Merge(files: array of WideString; output: WideString): Boolean;
type
	Tgspdf_pdfmerge = function (files: array of WideString; outputFile: WideString): Boolean; stdcall;
  Tgspdf_lasterror = function(): string; stdcall;
  Tgspdf_guid = function(): WideString; stdcall;
var
	handleDLLGSD: THandle;
  gspdf_pdfmerge: Tgspdf_pdfmerge;
  gspdf_lasterror: Tgspdf_lasterror;
  gspdf_guid: Tgspdf_guid;
  outputGS: WideString;
  I: Integer;
begin

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

    outputGS := output;
// 		outputGS := GetPathTemp('') + string(gspdf_guid) + '.pdf';

    if not gspdf_pdfmerge(files, outputGS) then
      raise Exception.Create(string(gspdf_lasterror));

//    if FileExists(output) then
//    begin
//      DeleteFile(output)
//    end;

//    {$IFNDEF VER180}
//    CopyFile(PWideChar(outputGS), PWideChar(output), False);
//    {$ELSE}
//    CopyFile(PAnsiChar(outputGS), PAnsiChar(output), False);
//    {$ENDIF}

    Result := FileExists(output);
  finally
    FreeLibrary(handleDLLGSD);
  end;
end;


class function PdfHelper.Print(pdfFileName, printerName: WideString; deleteFileAfter: Boolean): WideString;
type
  Tgspdf_pdfprint = function (pdfFile, printerName: WideString): Boolean; stdcall;
  Tgspdf_lasterror = function(): string; stdcall;
var
  handleDLLGSD: THandle;
  gspdf_pdfprint: Tgspdf_pdfprint;
  gspdf_lasterror: Tgspdf_lasterror;
begin

  PdfHelper.CheckFiles;

  try

      handleDLLGSD := LoadLibrary(hwgsdll32);
      try
        if handleDLLGSD = 0  then
          raise Exception.Create(Format('DLL "%s" não pode ser carregada. Por favor contacte o suporte técnico', [hwgsdll32]));

        @gspdf_pdfprint := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_pdfprint'));
        @gspdf_lasterror := GetProcAddress(handleDLLGSD, PAnsiChar('gspdf_lasterror'));

        if not gspdf_pdfprint(WideString(pdfFileName), WideString(printerName)) then
          Result := (string(gspdf_lasterror));

      finally
        FreeLibrary(handleDLLGSD);
      end;

    finally
      if deleteFileAfter and FileExists(pdfFileName) then
        DeleteFile(pdfFileName);
    end;

end;

end.
