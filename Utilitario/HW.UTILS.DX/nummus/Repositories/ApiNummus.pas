unit ApiNummus;

interface

uses
  BaseSingleton,
  NummusResponseModels,
  Winapi.Windows,
  Vcl.Forms;

type
  TApiNummus = class
  public
    function GetSaldoCliente(idcliente: string; documentocliente: string; fonecliente: string; emailcliente: string): TGetSaldoClienteResponse;
  end;

  TApiNummusSingleton = TSingleton<TApiNummus>;

implementation

uses
  hw_utils,
  HW.Json,
  System.SysUtils,
  System.StrUtils,
  REST.Types,
  System.Net.HttpClientComponent,
  hw_win_utils,
  SHFolder;

{ TApiNummus }

function TApiNummus.GetSaldoCliente(
  idcliente: string; documentocliente: string; fonecliente: string; emailcliente: string): TGetSaldoClienteResponse;
begin
  idcliente := '';
  if trim(idcliente) <> '' then
    idcliente := Base64Helper.EncodeFile(trim(idcliente));

  idcliente        := IfThen(not idcliente.IsEmpty, 'customer_id=' + trim(idcliente));
  documentocliente := IfThen(not documentocliente.IsEmpty, 'document_number=' + trim(documentocliente));
  fonecliente      := IfThen(not fonecliente.IsEmpty, 'phone=' + trim(fonecliente));
  emailcliente     := IfThen(not emailcliente.IsEmpty, 'email=' + trim(emailcliente));

  if (trim(idcliente) <> '') then
  begin
    with Get(TReq.New('cashback/amount', [], [idcliente])) do
      if isSuccess then
        Result := TJsonHw.ToObject< TGetSaldoClienteResponse >(data)
  end
  else
  begin
    with Get(TReq.New('cashback/amount', [], [documentocliente])) do
      if isSuccess then
        Result := TJsonHw.ToObject< TGetSaldoClienteResponse >(data)
  end;
//    else if code = 401 then
//    begin
//      var response401 := TJsonHw.ToObject< TResponse401 >(data);
//      if Assigned(response401) then
//        raise Exception.Create(response401.ErrosToString)
//      else
//        raise Exception.Create(ERRO_DEFAULT);
//    end;

//  Result := TGetSaldoClienteResponse.Create;
//  with Call(TReq.New('cashback/amount', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmGET) do
//  begin
//    Result := TGetSaldoClienteResponse.ToObject(data);
//
//    if (Result.status >= 200) and (Result.status <= 299) then
//    else
//      LogApp.Error('TApiNummus.GetSaldoCliente Code: %d Data: %s', [code, data]);
//  end;
end;

end.
