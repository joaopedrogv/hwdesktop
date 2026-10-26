unit Hw.Comercio.Api.Rest;

interface

uses
  HW.Api.Rest,
  System.Classes,
  REST.Client,
  REST.Types;

type
  TComercioTokenApi = class
  private
    Faccess_token: String;
    Ftoken_type: string;
    Fexpires_in: Integer;
    FId: Integer;
    FNome: string;
    FDataLogin: TDateTime;
    FDataHoraAtual: TDateTime;
  public
    property access_token: String read Faccess_token write Faccess_token;
    property token_type: string read Ftoken_type write Ftoken_type;
    property expires_in: Integer read Fexpires_in write Fexpires_in;
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property DataLogin: TDateTime read FDataLogin write FDataLogin;
    property DataHoraAtual: TDateTime read FDataHoraAtual write FDataHoraAtual;
  end;

  TComercioApiError = class
  private
    FstatusCode: Integer;
    Ferror: string;
    Ferror_description: String;
//    FstatusDescription: String;
//    FstatusCode: Integer;
  public
    property statusCode: Integer read FstatusCode write FstatusCode;
    property error: string read Ferror write Ferror;
    property error_description: String read Ferror_description write Ferror_description;
  end;

  TComercioRespApi = class
  private
    FStatus: Integer;
    FMensage: Integer;
  public
    property Status: Integer read FStatus write FStatus;
    property Mensage: Integer read FMensage write FMensage;
  end;

  TComercionRetornoErros = class
  private
    FKey: string;
    FValue: string;
  published
    property Key: string read FKey write FKey;
    property Value: string read FValue write FValue;
  end;

  TComercioRetorno = class
  private
    [JSONNameAttribute('Objecto')]
    FObjecto: string;
    FHTML: String;
    FCampoExtra: Integer;
    FStatus: Integer;
    FErros: TArray<TComercionRetornoErros>;
    FDescricaoDoErro: String;
  public
    class function FromJsonString(AJson: string): TComercioRetorno;
    procedure AddKeyValue(AKey, AValue: string);
//    function Sucess(AStatus: Integer): Boolean;
  published
    property Status: Integer read FStatus write FStatus;
    property Erros: TArray<TComercionRetornoErros> read FErros write FErros;// class
    property DescricaoDoErro: String read FDescricaoDoErro write FDescricaoDoErro;
    property HTML: String read FHTML write FHTML;
    property CampoExtra: Integer read FCampoExtra write FCampoExtra;
    property Objecto: string read FObjecto write FObjecto;// class
    //property NotificacaoAPI: TNotificacaoAPI read FNotificacaoAPI write FNotificacaoAPI;// class
  end;

  TComercioConsulta = class
  private
    FtotalNotFiltered: Integer;
    Ftotal: Integer;
    Frows: string;
  published
    class function FromJson(AJson: string): TComercioConsulta;

    property total: Integer read Ftotal write Ftotal;
    property totalNotFiltered: Integer read FtotalNotFiltered write FtotalNotFiltered;
    property rows: string read Frows write Frows;// Collection
  end;

  TComercioRestApi = class(TRestApi)
  private
    FErroApi: TComercioApiError;
    FToken: TComercioTokenApi;
  protected
    procedure AfterContentResponse; override;
  public
    function Exec(Req: TRestApiReq): Integer; override;

    procedure RaiseApiError;
    procedure AssignTokenAuthorization(Token: TComercioTokenApi);
    procedure ClearTokenAuthorization;

    property ErroApi: TComercioApiError read FErroApi write FErroApi;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  REST.Json, System.JSON, HW.Json;

{ TComercioRestApi }


procedure TComercioRestApi.AfterContentResponse;
begin
  inherited;
  case restResponse.StatusCode of
    200 :
    begin
      if Assigned(FEventResponse) then
        FEventResponse(restResponse);
    end;

    400://401, 403, 404, 500 :
    begin
      if not JSONReponse.IsEmpty then
        FErroApi := TJson.JsonToObject<TComercioApiError>(JSONReponse)
      else
      begin
        ErroApi := TComercioApiError.Create;
        ErroApi.statusCode := restResponse.StatusCode;
        ErroApi.error_description := Format('%d %s', [restResponse.StatusCode, IfThen( restResponse.StatusCode = 401,  'Nao Autorizado') +
                                                                               IfThen( restResponse.StatusCode = 404,  'Sem Conteudo') +
                                                                               IfThen( restResponse.StatusCode = 500,  'Erro Interno do Servidor')]);
      end;

      if Assigned(FEventResponse) then
        FEventResponse( FErroApi );
    end;
  end;
end;

procedure TComercioRestApi.AssignTokenAuthorization(Token: TComercioTokenApi);
begin
  if Token = nil then
    Exit;

  FToken := Token;
  LogMessage('[AssignTokenAuthorization: %s]', [FToken.Nome]);

  restRequest.Params.Clear;
  with restRequest.Params.AddItem do
  begin
    name    := 'Authorization';
    Value   := 'Bearer ' + FToken.access_token;
    Kind    := pkHTTPHEADER;
    Options := [poDoNotEncode];
  end;
end;

procedure TComercioRestApi.ClearTokenAuthorization;
begin
  LogMessage('[ClearTokenAuthorization]');
  FToken := nil;
end;

function TComercioRestApi.Exec(Req: TRestApiReq): Integer;
begin
  result := inherited Exec(Req);
  restRequest.Params.Clear;
end;

procedure TComercioRestApi.RaiseApiError;
begin
  if Assigned(ErroApi) then
    raise Exception.Create(Format('%d %s', [ErroApi.statusCode, ErroApi.error_description]));
end;

{ TComercioRetorno }

procedure TComercioRetorno.AddKeyValue(AKey, AValue: string);
var
  corpo: TComercionRetornoErros;
begin
  corpo := TComercionRetornoErros.Create;
  corpo.Key := AKey;
  corpo.Value := AValue;

  SetLength(FErros, Length(FErros) + 1);
  FErros[High(FErros)] := corpo;
end;

class function TComercioRetorno.FromJsonString(AJson: string): TComercioRetorno;
var
  jsonRoot, jsonCorpo: TJSONObject;
  parRoot, parCorpo: TJSONPair;
  str: string;
begin
  if (AJson.Trim = '') or (AJson.Trim.ToLower = 'null') then
    Exit(nil);

  AJson := AJson.Replace('"Object":', '"Objecto":', [rfIgnoreCase]);
  Result := TJson.JsonToObject<TComercioRetorno>(AJson);

  jsonRoot := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJson),0) as TJSONObject;

  try
    if jsonRoot.Count = 0 then
      Exit;

    for parRoot in jsonRoot do
    begin
      str := parRoot.JsonString.ToString;
      if parRoot.JsonString.ToString.ToLower.Trim.Equals('"objecto"') then
        Result.Objecto := parRoot.JsonValue.ToString
      else if parRoot.JsonString.Value.ToLower.Trim.Equals('corpo') then
      begin
        jsonCorpo := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(parRoot.JsonValue.ToString), 0) as TJSONObject;
        for parCorpo in jsonCorpo do
          Result.AddKeyValue(parCorpo.JsonString.Value, parCorpo.JsonValue.Value);
      end;
    end;
    Exit(Result);
  finally
  end;
end;

{ TComercioConsulta }

class function TComercioConsulta.FromJson(AJson: string): TComercioConsulta;
var
  root: TJSONObject;
  pair: TJSONPair;
begin
  if (AJson.Trim = '') or (AJson.Trim.ToLower = 'null') then
    Exit(nil);

  Result := TJsonHw.ToObject<TComercioConsulta>(AJson);

  if Result = nil then
    Exit;

  root := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJson),0) as TJSONObject;

  if root.Count = 0 then
    Exit;

  for pair in root do
    if pair.JsonString.Value.ToLower.Trim.Equals('rows') then
    begin
      Result.rows := pair.JsonValue.ToJSON;
      Exit;
    end;
end;

end.
