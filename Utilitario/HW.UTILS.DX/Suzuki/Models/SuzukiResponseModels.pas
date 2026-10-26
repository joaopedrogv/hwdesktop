unit SuzukiResponseModels;

interface

uses
  System.Classes,
  System.Generics.Collections;

type
  TRetorno = class
  private
    FCodigoOcorrencia: string;
    FDescricaoOcorrecia: string;
    FDescricaoStatus: string;
    FIdProcesso: Integer;
    FIdProtocolo: Integer;
  published
    property CodigoOcorrencia: string read FCodigoOcorrencia write FCodigoOcorrencia;
    property DescricaoOcorrecia: string read FDescricaoOcorrecia write FDescricaoOcorrecia;
    property DescricaoStatus: string read FDescricaoStatus write FDescricaoStatus;
    property IdProcesso: Integer read FIdProcesso write FIdProcesso;
    property IdProtocolo: Integer read FIdProtocolo write FIdProtocolo;
  end;

  TErrors = class
  private
    FErrorCode: string;
    FErrorMessage: string;
    FPropertyName: string;
  published
    property ErrorCode: string read FErrorCode write FErrorCode;
    property ErrorMessage: string read FErrorMessage write FErrorMessage;
    property PropertyName: string read FPropertyName write FPropertyName;
  end;

  TPostAutenticacaoResponse = class(TPersistent)
  private
    Fauthenticated: Boolean;
    Fcreated: TDateTime;
    Fexpiration: TDateTime;
    FaccessToken: string;
    FrefreshToken: string;
    Fmessage: string;
    Furl: string;
    Fenable2FA: Boolean;
    FnumberDigits2FA: Integer;
    FexpirationMinutes2FA: Integer;
    FpossuiVariosMetodosEnvio: Boolean;
    FIsValId: Boolean;
    FErrors: TArray<TErrors>;
  published
    property authenticated: Boolean read Fauthenticated write Fauthenticated;
    property created: TDateTime read Fcreated write Fcreated;
    property expiration: TDateTime read Fexpiration write Fexpiration;
    property accessToken: string read FaccessToken write FaccessToken;
    property refreshToken: string read FrefreshToken write FrefreshToken;
    property message: string read Fmessage write Fmessage;
    property url: string read Furl write Furl;
    property enable2FA: Boolean read Fenable2FA write Fenable2FA;
    property numberDigits2FA: Integer read FnumberDigits2FA write FnumberDigits2FA;
    property expirationMinutes2FA: Integer read FexpirationMinutes2FA write FexpirationMinutes2FA;
    property possuiVariosMetodosEnvio: Boolean read FpossuiVariosMetodosEnvio write FpossuiVariosMetodosEnvio;
    property IsValId: Boolean read FIsValId write FIsValId;
    property Errors: TArray<TErrors> read FErrors write FErrors;

    class function ToObject(json: string): TPostAutenticacaoResponse;
  end;

  TPostNotaFiscalResponse = class(TPersistent)
  private
    FIsValId: Boolean;
    FRetorno: TRetorno;
    FErrors: TArray<TErrors>;
  published
    property IsValId: Boolean read FIsValId write FIsValId;
    property Retorno: TRetorno read FRetorno write FRetorno;
    property Errors: TArray<TErrors> read FErrors write FErrors;

    class function ToObject(json: string): TPostNotaFiscalResponse;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  HW.Json,
  System.JSON,
  REST.Json;

{ TPostAutenticacaoResponse }

class function TPostAutenticacaoResponse.ToObject(
  json: string): TPostAutenticacaoResponse;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostAutenticacaoResponse>(json);
  Result := TJsonHw.ToObject<TPostAutenticacaoResponse>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('errors')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('errors') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TPostNotaFiscalResponse }

class function TPostNotaFiscalResponse.ToObject(
  json: string): TPostNotaFiscalResponse;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostNotaFiscalResponse>(json);
  Result := TJsonHw.ToObject<TPostNotaFiscalResponse>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('errors')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('errors') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

end.
