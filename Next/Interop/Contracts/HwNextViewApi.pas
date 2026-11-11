// Delphi 2006
unit HwNextViewApi;

interface

uses
  {$IFDEF VER180}
  Windows
  {$ELSE}
  Winapi.Windows
  {$ENDIF};

const
  HW_NEXT_VIEW_API_VERSION     = 6;
  HW_NEXT_ERROR_CAPACITY       = 1024; // buffer do chamador, incluindo #0
  HW_NEXT_IDENTIFIER_MAX_CHARS = 63;

  // Bits de opcao passados em AOptions. Zero e o padrao das consultas:
  // MDI, instancia unica, ocultar no fechamento individual.
  HW_NEXT_OPT_MODAL    = $00000001;
  HW_NEXT_OPT_MULTIPLE = $00000002;
  HW_NEXT_OPT_DESTROY  = $00000004;
  HW_NEXT_OPT_KNOWN    = $00000007;

type
  THwNextApiVersion = function: Integer; stdcall;
  THwNextOpenView = function(AIdentifier: PWideChar; AParent, ACloseTarget,
    AApplication: HWND; AOptions: Cardinal; AInstanceNumber: Integer): HWND; stdcall;
  THwNextResizeView = function(AView: HWND; AWidth, AHeight: Integer): LongBool; stdcall;
  THwNextFocusView = function(AView: HWND): LongBool; stdcall;
  THwNextDestroyView = function(AView: HWND): LongBool; stdcall;
  // Returns True when the view can be closed now. The module/base asks the
  // user only when the view reports pending changes. False means "do not
  // close" (cancel, query failure, or unknown view).
  THwNextCanCloseView = function(AView: HWND): LongBool; stdcall;
  THwNextProcessKey = function(AView, ATarget: HWND; AMessage: Cardinal;
    AWParam: WPARAM; ALParam: LPARAM): LongBool; stdcall;
  THwNextViewCount = function: Integer; stdcall;
  THwNextShutdown = function: LongBool; stdcall;
  THwNextLastError = function(ABuffer: PWideChar; ACapacity: Integer): Integer; stdcall;
  // Contexto ERP de uso unico. Apenas valores: os buffers de caracteres
  // pertencem ao chamador e sao validos somente durante a chamada.
  THwNextSetContext = function(ACompanyCode: Integer;
    AUserLogin, ADatabaseName, ADatabaseUserName,
    ADatabasePassword: PWideChar): LongBool; stdcall;

implementation

end.
