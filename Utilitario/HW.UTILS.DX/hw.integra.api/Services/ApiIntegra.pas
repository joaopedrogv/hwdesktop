unit ApiIntegra;

interface

uses
  ApiIntegraBase,
  Hw.Api.Rest,
  Hw.Integra.Api,
  UsuarioClienteEtd,
  EstatisticaEtd;

type
  TApiIntegra = class(TApiIntegraBase)
  strict private
  public
    function GetConfsUsuariosCliente(): TConfsUsusarioCliente;
    function PostUsuariosCliente(payload: TArray<TUsuarioCliente>): Boolean;
    function PostUsuariosClienteLogin(payload: TArray<TUsuarioClienteBase>): Boolean;
    function GetConfsEstatisticas(): TConfsEstatistica;
    function PostEstatistica(payload: TEstatistica): TResponseBase;
    function PostEstatisticas(payload: TArray<TEstatistica>): TResponseBase;
    function GetEstatisticasCustom(lastUpdateSeq: Integer): TArray<TEstatisticaCustom>;
//    function AmbitosChanges(sincid, offset, limit: Integer; var totalCount: Integer): TArray<TAmbito>;
//    function ItemsChanges(sincid, offset, limit: Integer; var totalCount: Integer): TArray<TItem>;
//    function VariantesChanges(sincid, offset, limit: Integer; var totalCount: Integer): TArray<TVariante>;
//    function CestsChanges(sincid, offset, limit: Integer; var totalCount: Integer): TArray<TCest>;
  end;

implementation

uses
  Hw.Json,
  System.SysUtils;

{ TApiIntegra }

function TApiIntegra.GetConfsEstatisticas: TConfsEstatistica;
begin
  Result := nil;
  with Call(TReq.New('estatistica/confs'), rmGET) do
    if isSuccess then
      Result := TJsonHw.ToObject< TConfsEstatistica >(data)
    else
      RaiseError('Erro na consulta de configurações');
end;

function TApiIntegra.GetConfsUsuariosCliente: TConfsUsusarioCliente;
begin
  Result := nil;
  with Call(TReq.New('usuariocliente/confs'), rmGET) do
    if isSuccess then
      Result := TJsonHw.ToObject< TConfsUsusarioCliente >(data)
    else
      RaiseError('Erro na consulta de configurações');
end;

function TApiIntegra.GetEstatisticasCustom(
  lastUpdateSeq: Integer): TArray<TEstatisticaCustom>;
begin
  Result := [];
  with Call(TReq.New('estatistica/custom/%d', [lastUpdateSeq]), rmGET) do
    if isSuccess then
      Result := TJsonHw.ToArrayObject< TEstatisticaCustom >(data)
    else
      RaiseError('Erro na consulta de configurações');
end;

function TApiIntegra.PostEstatistica(payload: TEstatistica): TResponseBase;
begin
  Result :=  Call(TReq.New('estatistica', '', TJsonHw.ToJsonString(payload)), rmPOST, True);
end;

function TApiIntegra.PostEstatisticas(
  payload: TArray<TEstatistica>): TResponseBase;
begin
//  Result := False;
  Result :=  Call(TReq.New('estatistica/range', '', TJsonHw.ToArrayJson<TEstatistica>(payload)), rmPOST, True);
end;

function TApiIntegra.PostUsuariosCliente(
  payload: TArray<TUsuarioCliente>): Boolean;
begin
//  Result := False;
  var json := TJsonHw.ToArrayJson<TUsuarioCliente>(payload);
  Result :=  Call(TReq.New('usuariocliente', '', json), rmPUT).isSuccess;
  //Result :=  Call(TReq.New('usuariocliente', '', TJsonHw.ToArrayJson<TUsuarioCliente>(payload)), rmPUT).isSuccess;
end;

function TApiIntegra.PostUsuariosClienteLogin(
  payload: TArray<TUsuarioClienteBase>): Boolean;
begin
//  Result := False;
  Result :=  Call(TReq.New('usuariocliente/login', '', TJsonHw.ToArrayJson<TUsuarioClienteBase>(payload)), rmPUT).isSuccess;
end;

end.
