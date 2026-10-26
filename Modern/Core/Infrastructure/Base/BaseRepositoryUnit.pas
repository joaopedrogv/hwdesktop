unit BaseRepositoryUnit;

interface

uses
  BaseClassUnit,
  IDataBaseConnectionUnit, ISessionContextUnit;

type
  {$IFDEF INTF_ON}
  BaseRepository = class(TInterfacedObject)
  {$ELSE}
  BaseRepository = class(BaseClass)
  {$ENDIF}
  private
    FSessionInternal: ISessionContext;
    function GetSession: ISessionContext;
  protected
    FConnection: IDatabaseConnection;
    function GenerateNewUUID(): string;

    property FSession: ISessionContext read GetSession;
  public
    constructor Create(Connection: IDatabaseConnection); overload; virtual;
    constructor Create(Connection: IDatabaseConnection; Session: ISessionContext); overload; virtual;
  end;

implementation

uses
  SysUtils;

{ BaseRepository }

constructor BaseRepository.Create(Connection: IDatabaseConnection);
begin
  inherited Create;
  FConnection := Connection;
  FSessionInternal := nil;
end;

constructor BaseRepository.Create(Connection: IDatabaseConnection; Session: ISessionContext);
begin
  Create(Connection);
  FSessionInternal := Session;
end;

function BaseRepository.GenerateNewUUID: string;
var
  guid: TGUID;
begin
  if CreateGUID(guid) <> S_OK then
    RaiseLastOSError;

  Result := Copy(GUIDToString(guid), 2, 36);
end;

function BaseRepository.GetSession: ISessionContext;
begin
  // Para apresentar o erro legivel e logo resolver
  if FSessionInternal = nil then
    raise Exception.Create('GetSession FSession = null');

  Result := FSessionInternal;
end;

end.
