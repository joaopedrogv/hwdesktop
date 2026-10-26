unit Api.GS1Service;

interface

uses
  Hw.Servicos,
  Hw.Integra.Api,
  Hw.Json,
  GS1Prefix;

type
  TGS1ServiceApi = class(THwIntegraApi)
  public
    function DateUpdate: TGS1PrefixDateUpdate;
    function GS1Prefix: TArray<TGS1Prefix>;
  end;

implementation

uses
  Hw.Api.Rest,
  HW.Utils.Classes.Registros_DX,
  System.SysUtils,
  REST.Json;

{ TGS1ServiceApi }

function TGS1ServiceApi.DateUpdate: TGS1PrefixDateUpdate;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := nil;
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('gs1/prefix/dateupdate');
      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
        Result := TJsonHw.ToObject<TGS1PrefixDateUpdate>(Api.JSONReponse)
      else
        Api.RaiseApiError;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter data do GS1Prefix';
      FLastError.Local := 'TGS1Service.DateUpdate';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TGS1ServiceApi.GS1Prefix: TArray<TGS1Prefix>;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := nil;
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('gs1/prefix');
      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
        Result := TJsonHw.ToArrayObject<TGS1Prefix>(Api.JSONReponse)
      else
        Api.RaiseApiError;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter GS1Prefix';
      FLastError.Local := 'TGS1Service.GS1Prefix';
      FLastError.Exception := e.Message;
    end;
  end;
end;

end.
