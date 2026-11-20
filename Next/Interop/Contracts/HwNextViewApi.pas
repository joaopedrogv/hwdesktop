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
  HW_NEXT_VIEW_API_VERSION     = 12;
  HW_NEXT_ERROR_CAPACITY       = 1024; // buffer do chamador, incluindo #0
  HW_NEXT_IDENTIFIER_MAX_CHARS = 63;

  // Qualquer outro valor e tratado pelo modulo como indisponivel.
  HW_NEXT_AUTH_UNAVAILABLE = 0;
  HW_NEXT_AUTH_DENIED      = 1;
  HW_NEXT_AUTH_ALLOWED     = 2;

  // Bits de opcao passados em AOptions. Zero e o padrao das consultas: MDI, instancia unica, ocultar no fechamento
  // individual.
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
  // Verdadeiro quando a view pode fechar agora; False tambem cobre falha da consulta ou view desconhecida.
  THwNextCanCloseView = function(AView: HWND): LongBool; stdcall;
  THwNextProcessKey = function(AView, ATarget: HWND; AMessage: Cardinal;
    AWParam: WPARAM; ALParam: LPARAM): LongBool; stdcall;
  THwNextViewCount = function: Integer; stdcall;
  THwNextShutdown = function: LongBool; stdcall;
  THwNextLastError = function(ABuffer: PWideChar; ACapacity: Integer): Integer; stdcall;
  // Publica apenas a identidade da sessao, sem abrir conexao, consultar o banco ou montar a infraestrutura do Next.
  // Os buffers de caracteres pertencem ao chamador e sao validos somente durante a chamada.
  THwNextSetSession = function(ACompanyCode: Integer; AUserLogin: PWideChar): LongBool; stdcall;
  // Inicializa a infraestrutura e prepara a empresa atual. Repetivel; os buffers pertencem ao chamador.
  THwNextInitialize = function(ADatabaseName, ADatabaseUserName, ADatabasePassword: PWideChar): LongBool; stdcall;
  // Verdadeiro somente quando a empresa atual esta preparada para uso.
  THwNextIsAvailable = function: LongBool; stdcall;
  // Callback sincrono de autorizacao: recebe o codigo do processo, a acao ja convertida em texto, a tabela da regra e a
  // chave de negocio do registro, todos definidos pelo modulo. Os buffers pertencem ao chamador e valem somente durante
  // a chamada; o host aplica a regra do processo e da acao.
  THwNextAuthorizationCallbackV2 = function(AProcessCode, AAction, ATable,
    ABusinessKey: PWideChar): Integer; stdcall;
  THwNextSetAuthorizationCallbackV2 = function(
    ACallback: THwNextAuthorizationCallbackV2): LongBool; stdcall;

implementation

end.
