// Delphi 2006
unit HwNextViewApi;

interface

uses Windows;

const
  HW_NEXT_VIEW_API_VERSION = 1;
  HW_NEXT_ERROR_CAPACITY  = 1024; // buffer do chamador, incluindo o #0

type
  THwNextApiVersion = function: Integer; stdcall;
  THwNextCreateView = function(AParent, ACloseTarget, AApplication: HWND;
    AInstanceNumber: Integer): HWND; stdcall;
  THwNextResizeView = function(AView: HWND; AWidth, AHeight: Integer): LongBool; stdcall;
  THwNextFocusView = function(AView: HWND): LongBool; stdcall;
  THwNextDestroyView = function(AView: HWND): LongBool; stdcall;
  THwNextProcessKey = function(AView, ATarget: HWND; AMessage: Cardinal;
    AWParam: WPARAM; ALParam: LPARAM): LongBool; stdcall;
  THwNextViewCount = function: Integer; stdcall;
  THwNextShutdown = function: LongBool; stdcall;
  THwNextLastError = function(ABuffer: PWideChar; ACapacity: Integer): Integer; stdcall;

implementation

end.
