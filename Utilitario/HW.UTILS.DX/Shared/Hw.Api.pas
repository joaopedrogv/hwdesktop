unit Hw.Api;

interface

uses
  Hw.Api.Rest, System.Classes, Hw.Types;

type
  THwApi = class
  private
    FCNPJ: string;
    FURLApi: string;
    FAfterLogin: TNotifyEvent;
  protected
    FLogEvent : TLogText;
    FLastError: TLastError;
  public
    constructor Create(URL, CNPJEmp: string);

    procedure InitApi(URL: string); virtual; abstract;
    function ConcederAcesso: Integer; virtual; abstract;

    property CNPJ     : string    read FCNPJ   write FCNPJ;
    property URLApi   : string    read FURLApi write FURLApi;
    property LastError: TLastError read FLastError write FLastError;
    property OnLog    : TLogText read FLogEvent write FLogEvent;
    property AfterLogin: TNotifyEvent read FAfterLogin write FAfterLogin;
  end;

implementation

uses
  System.SysUtils, HW.Utils.Classes.Funcoes_DX, REST.Json;

{ THwApi }

constructor THwApi.Create(URL, CNPJEmp: string);
begin
  FURLApi := URL;
  FCNPJ   := CNPJEmp;
end;

end.
