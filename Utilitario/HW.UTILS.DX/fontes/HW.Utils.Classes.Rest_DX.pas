{******************************************************************************}
{ Projeto: REST HW                                                             }
{  Biblioteca para ser usada em maior parte para consumir a api da HW Sistemas }
{ outras apis também são podem ser consumidas utilizando esta biblioteca       }
{                                                                              }
{ Direitos Autorais Reservados (c) 2017   Hw Sistemas e Computadores           }
{                                                                              }
{ Autor: João Pedro Rodrigues Costa                                            }
{                                                                              }
{            HW Sistemas e Computadores Ltda - www.hwsistemas.com.br           }
{    Rua Mogno, 236, Santo Agostinho - Governador Valadares - MG - 35.065-019  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 23/02/2017: João Pedro
|*  - Criação e distribuição da Primeira Versao
*******************************************************************************}

unit HW.Utils.Classes.Rest_DX;

interface

uses
  REST.Client,
  REST.Types,
  REST.Json,
  REST.Json.Types,
  IPPeerClient,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  System.StrUtils,
  System.JSON,
  System.Generics.Collections,
  System.Classes;

const
  AUrlApiProducao     = 'https://www.hdeskpro.com.br/webapihdesk/api/'; //'http://hwsistemas.homelinux.com/webapihw/api/';
  AUrlApiHomologacao  = 'http://hwsistemas.homelinux.com/webapihwteste/api/';
  AUrlSiteProducao    = 'https://www.hdeskpro.com.br/';//'http://hwsistemas.homelinux.com/hws/';
  AUrlSiteHomologacao = 'http://hwsistemas.homelinux.com/hwteste/';

type
  THWRestParametro = (paramRestHwCodUsuario, paramRestHwCodEmpresa, paramRestHwAutorization);
  THWRestParametros = set of THWRestParametro;
  THWRestParametroKind = TRESTRequestParameterKind;
  THWRestParametroOptions = TRESTRequestParameterOptions;

  THWRest_RespErro400 = class
  private
    Ferror: String;
    Ferror_description: String;
  published
    property error: String read Ferror write Ferror;
    property error_description: String read Ferror_description write Ferror_description;
  end;

  THWRest_RespErro404 = class
  private
    FMessage: String;
  published
    property Messagee: String read FMessage write FMessage;
  end;

  THWRest_ResponseInformation = class
  private
    Ferrocomb: String;
    Fvalid: String;
  public
    class function FromJsonString(AJsonString: string): THWRest_ResponseInformation;
  published
    property valid: String read Fvalid write Fvalid;
    property errocomb: String read Ferrocomb write Ferrocomb ;
  end;

  THWRest_RequestResponseKeyValue = class
  private
    FKey: string;
    FValue: string;
  published
    property Key: string read FKey write FKey;
    property Value: string read FValue write FValue;
  end;

  THWRest_RequestResponseModal = class
  private
    FCorpo: TArray<THWRest_RequestResponseKeyValue>;
    FStatus: string;
  public
    destructor Destroy; override;
    constructor Create;
    class function FromJsonString(AJsonString: string): THWRest_RequestResponseModal;
    function Sucess(AStatus: string): Boolean;
    procedure AddCorpo(AKey, AValue: string);
  published
    property Status: string read FStatus write FStatus;
    property Corpo: TArray<THWRest_RequestResponseKeyValue> read FCorpo write FCorpo;
  end;

  THWRest_ResponseInformationC = class
  private
    [JSONNameAttribute('Objecto')]
    FObjecto: string;
    FHTML: String;
    FCampoExtra: Integer;
    FStatus: Integer;
    FErros: TArray<THWRest_RequestResponseKeyValue>;
    FDescricaoDoErro: String;
  public
    class function FromJsonString(AJsonString: string): THWRest_ResponseInformationC;
    procedure AddKeyValue(AKey, AValue: string);
    function Sucess(AStatus: Integer): Boolean;
  published
    property Status: Integer read FStatus write FStatus;
    property Erros: TArray<THWRest_RequestResponseKeyValue> read FErros write FErros;// class
    property DescricaoDoErro: String read FDescricaoDoErro write FDescricaoDoErro;
    property HTML: String read FHTML write FHTML;
    property CampoExtra: Integer read FCampoExtra write FCampoExtra;
    property Objecto: string read FObjecto write FObjecto;// class
    //property NotificacaoAPI: TNotificacaoAPI read FNotificacaoAPI write FNotificacaoAPI;// class
  end;

  ///  <summary>Classe que possui o token de acesso a api</summary>
  TResp_AcessTokent = class
  private
    Fdata_ult_login: string;
    Fcod_empresa: Integer;
    Fcod_ambiente: Integer;
    Femail: String;
    Ftipo_us: String;
    Fcod_usuario: Integer;
    Fnome_usuario: String;
    Ftag_menus_excecoes: String;
    Fcod_cl_parc: Integer;
    Fexpires_in: Integer;
    Fdata_cad: string;
    Fnivel: Integer;
    Ftag_perfil_menus: String;
    Fcod_cliente: Integer;
    Fusuario: string;
    Ftoken_type: String;
    Ftipo_cl: String;
    Faccess_token: String;
    Fcolaborador_hw: string;
    Fdata_servidor: string;
  public
    class function FromJsonString(AJsonString: string): TResp_AcessTokent;
    function ToJsonStringEncode: string;
  published
    property access_token: String read Faccess_token write Faccess_token;
    property token_type: String read Ftoken_type write Ftoken_type;
    property expires_in: Integer read Fexpires_in write Fexpires_in;
    property cod_usuario: Integer read Fcod_usuario write Fcod_usuario;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property usuario: string read Fusuario write Fusuario;// class
    property nome_usuario: String read Fnome_usuario write Fnome_usuario;
    property nivel: Integer read Fnivel write Fnivel;
    property email: String read Femail write Femail;
    property tipo_us: String read Ftipo_us write Ftipo_us;
    property data_cad: string read Fdata_cad write Fdata_cad;
    property data_ult_login: string read Fdata_ult_login write Fdata_ult_login;
    property tag_perfil_menus: String read Ftag_perfil_menus write Ftag_perfil_menus;
    property tag_menus_excecoes: String read Ftag_menus_excecoes write Ftag_menus_excecoes;
    property cod_ambiente: Integer read Fcod_ambiente write Fcod_ambiente;
    property cod_cl_parc: Integer read Fcod_cl_parc write Fcod_cl_parc;
    property tipo_cl: String read Ftipo_cl write Ftipo_cl;
    property colaborador_hw: string read Fcolaborador_hw write Fcolaborador_hw;
    property data_servidor: string read Fdata_servidor write Fdata_servidor;
  end;

  /// <summary> Classe com objetos e metodos para simplificar o acesso a api da HW </summary>
  /// <remarks> O objeto acessToken (TResp_AcessTokent) possui o token de conexao da HW </remarks>
  TRestHW = class
  private
    Fmetodo: string;
    FurlApi: string;
    FrestClient: TRESTClient;
    FrestRequest: TRESTRequest;
    FrestResponse: TRESTResponse;
    FuserNameApi: string;
    FpasswordApi: string;
    FacessToken: TResp_AcessTokent;
    FlastError: string;
    FParametrosURL: string;
    FDataHoraLoginAtual: TDateTime;
    FTokenJaEstavaAtivo: Boolean;
    FError400: THWRest_RespErro400;
    FError404: THWRest_RespErro404;
    procedure Setmetodo(const Value: string);
    procedure SeturlApi(const Value: string);
    procedure SetrestClient(const Value: TRESTClient);
    procedure SetrestRequest(const Value: TRESTRequest);
    procedure SetrestResponse(const Value: TRESTResponse);
    procedure SetpasswordApi(const Value: string);
    procedure SetuserNameApi(const Value: string);
    procedure SetacessToken(const Value: TResp_AcessTokent);

    function Sucess(AStatusCode: Integer): Boolean;
  public
    constructor Create(AurlApi: string; Ametodo: string);
    /// <summary> Adiciona parametros </summary> <param name="Aparamentros">Coleção de parametros para serem montados automaticamente (paramRestHwCodUsuario, paramRestHwCodEmpresa, paramRestHwAutorization)</param>
    /// <param name="ApostMethod">True Value indica que o metoddo POST será usado e os parametros devem ir na URL</param>
    procedure AddParametro(Aparamentros: THWRestParametros; APostMethod: Boolean = False); overload;
    procedure AddParametro(AKey: string; AValue: string; AKind: THWRestParametroKind; AOptions: THWRestParametroOptions; APostMethod: Boolean = False); overload;
    function LoginApiHw(AuserNameApi, ApasswordApi: string; AacessToken: TResp_AcessTokent = nil): Boolean; //overload;
//    function LoginApiHw(Atoken: string): Boolean; overload;
    function ExecutarPOST(): Boolean; overload;
    function ExecutarPOST(JSONString: string): Boolean; overload;
    function ExecutarPOST(AStream: TStream): Boolean; overload;
    function ExecutarGET(): Boolean; overload;
    function ExecutarGET(JSONString: string): Boolean; overload;
    function ExecutarGET(AStream: TStream): Boolean; overload;
    function Executar(): Boolean; overload;
    function Executar(JSONString: string): Boolean; overload;
    function Executar(AStream: TStream): Boolean; overload;
    function GetLastError: string;
    function GetLastStatusCode: Integer;
    function MelhorMensagemDeErro(AError: string): string;

  published
    property urlApi: string read FurlApi write SeturlApi;
    property metodo: string read Fmetodo write Setmetodo;
    property userNameApi: string read FuserNameApi write SetuserNameApi;
    property passwordApi: string read FpasswordApi write SetpasswordApi;
    property restClient: TRESTClient read FrestClient write SetrestClient;
    property restRequest: TRESTRequest read FrestRequest write SetrestRequest;
    property restResponse: TRESTResponse read FrestResponse write SetrestResponse;
    property acessToken: TResp_AcessTokent read FacessToken write SetacessToken;
    property DataHoraLoginAtual: TDateTime read FDataHoraLoginAtual write FDataHoraLoginAtual;
    property TokenJaEstavaAtivo: Boolean read FTokenJaEstavaAtivo write FTokenJaEstavaAtivo;

    property Error400: THWRest_RespErro400 read FError400 write FError400;
    property Error404: THWRest_RespErro404 read FError404 write FError404;
  end;

implementation

{ TRestHW }

uses
  System.SysUtils,
  HW.Utils.Classes.Funcoes_DX, REST.JsonReflect, HW.Utils.Classes.Registros_DX;

procedure TRestHW.AddParametro(Aparamentros: THWRestParametros; APostMethod: Boolean);
var
  P: THWRestParametro;
begin
  restRequest.Params.Clear;
  for P in Aparamentros do
    if P = paramRestHwAutorization then
    begin
       with restRequest.Params.AddItem do
      begin
        Options := [poDoNotEncode];
        Kind := pkHTTPHEADER;
        name := 'Authorization';
        Value := FacessToken.token_type + ' ' + FacessToken.access_token;
      end;
    end
    else if APostMethod then //no POST os parametros irão na URL
    begin
      FParametrosURL := FParametrosURL +
        IfThen(FParametrosURL = '', '?', '&' ) +
        IfThen(P = paramRestHwCodUsuario, 'cod_usuario=' + FacessToken.cod_usuario.ToString()) +
        IfThen(P = paramRestHwCodEmpresa, 'cod_empresa=' + FacessToken.cod_empresa.ToString());
    end
    else
    begin
       with restRequest.Params.AddItem do
      begin
        Kind := pkGETorPOST;
        name :=
          IfThen(P = paramRestHwCodUsuario, 'cod_usuario') +
          IfThen(P = paramRestHwCodEmpresa, 'cod_empresa');
        Value :=
          IfThen(P = paramRestHwCodUsuario, FacessToken.cod_usuario.ToString()) +
          IfThen(P = paramRestHwCodEmpresa, FacessToken.cod_empresa.ToString());
      end;
    end;
end;

procedure TRestHW.AddParametro(AKey, AValue: string;
  AKind: THWRestParametroKind; AOptions: THWRestParametroOptions;
  APostMethod: Boolean);
begin
  if APostMethod then //no POST os parametros irão na URL
    FParametrosURL := FParametrosURL +
      IfThen(FParametrosURL = '', '?', '&' ) + AKey + '=' + AValue
  else
  begin
     with restRequest.Params.AddItem do
    begin
      Options := TRESTRequestParameterOptions(AOptions);
      Kind    := TRESTRequestParameterKind(AKind);
      name    := AKey;
      Value   := AValue;
    end;
  end;
end;

constructor TRestHW.Create(AurlApi: string; Ametodo: string);
begin
  FlastError := '';
  FrestClient := TRESTClient.Create( '' );
  FrestRequest := TRESTRequest.Create(FrestClient);
  FrestResponse := TRESTResponse.Create(FrestClient);
  FrestRequest.Response := FrestResponse;
  FTokenJaEstavaAtivo := False;

  urlApi := AurlApi;
  metodo := Ametodo;
end;

function TRestHW.Executar: Boolean;
begin
  try
    if not Assigned(restClient) then
      raise Exception.Create('REST Client não definido');

    if not Assigned(restRequest) then
      raise Exception.Create('REST Request não definido');

    if not Assigned(restResponse) then
      raise Exception.Create('REST Response não definido');

    if not Assigned(restRequest.Response) then
      restRequest.Response := restResponse;

    if not Assigned(restRequest.Response) then
      raise Exception.Create('REST Response não definido');

    restClient.BaseURL := FurlApi + Fmetodo + FParametrosURL;
    FParametrosURL := '';

    restResponse.ResetToDefaults;

    restRequest.Execute;

    Sucess(200);

    Result := True;

  except on E: Exception do
    begin
      Result:= False;
      FlastError := MelhorMensagemDeErro(E.message);
    end;
  end;
end;

function TRestHW.Executar(JSONString: string): Boolean;
begin
  try
    if not Assigned(restClient) then
      raise Exception.Create('REST Client não definido');

    if not Assigned(restRequest) then
      raise Exception.Create('REST Request não definido');

    if not Assigned(restResponse) then
      raise Exception.Create('REST Response não definido');

    if not Assigned(restRequest.Response) then
      restRequest.Response := restResponse;

    if not Assigned(restRequest.Response) then
      raise Exception.Create('REST Response não definido');

    if not JSONString.Trim.IsEmpty  then
      restRequest.AddBody(JSONString, ctAPPLICATION_JSON);
//      restRequest.AddBody(nil, ctAPPLICATION_OCTET_STREAM);

    restClient.BaseURL := FurlApi + Fmetodo + FParametrosURL;
    FParametrosURL := '';

    restResponse.ResetToDefaults;

    restRequest.Execute;

    Sucess(200);

    Result := True;

  except on E: Exception do
    begin
      Result:= False;
      FlastError := 'Erro REST HW Executar with JSONString. Erro: ' + MelhorMensagemDeErro(E.message);
    end;
  end;
end;

function TRestHW.ExecutarGET(JSONString: string): Boolean;
begin
  restRequest.Method := rmGET;
  Result := Executar(JSONString);
end;

function TRestHW.ExecutarGET: Boolean;
begin
  restRequest.Method := rmGET;
  Result := Executar;
end;

function TRestHW.ExecutarPOST(JSONString: string): Boolean;
begin
  restRequest.Method := rmPOST;
  Result := Executar(JSONString);
end;

function TRestHW.ExecutarPOST: Boolean;
begin
  restRequest.Method := rmPOST;
  Result := Executar;
end;

function TRestHW.GetLastError: string;
begin
  Result := FlastError;
end;

function TRestHW.GetLastStatusCode: Integer;
begin
  if Assigned(FrestResponse) then
    Result := FrestResponse.StatusCode
  else
    Result := -1;
end;

function TRestHW.LoginApiHw(AuserNameApi,
  ApasswordApi: string; AacessToken: TResp_AcessTokent): Boolean;

  procedure setParametros;
  begin
    with FrestRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'grant_type';
      Value := 'password';
    end;
    with FrestRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'username';
      Value := FuserNameApi;
    end;
    with FrestRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkGETorPOST;
      name := 'password';
      Value := UTF8ToString(THwUtilsClass.EncodeURIParameter( FpasswordApi ));
    end;
  end;

  function TokenAtivo: Boolean;
  var
    AMetodo: string;
    ADataLimite: TDateTime;
    AHours, AMinutes, ASeconds: Word;
  begin
    if not AacessToken.colaborador_hw.Equals('*@EMPRESA@*') then
      if AuserNameApi.ToLower.Trim <> AacessToken.email.ToLower.Trim  then
        Exit(False);

    ADataLimite := FDataHoraLoginAtual;

    if (AacessToken.expires_in > 0) then
    begin                       //8h      30min     40s
      AacessToken.expires_in := 28800 + (30 * 60) + (40);

      AHours   := AacessToken.expires_in div 3600;
      AMinutes := AacessToken.expires_in mod 3600;
      AMinutes := AMinutes               div   60;
      ASeconds := AacessToken.expires_in mod   60;
//      ASeconds := ASeconds               mod   60;
      ADataLimite := ADataLimite + EncodeTime(AHours, AMinutes, ASeconds, 0);
    end;

    if ADataLimite > Now then
      Exit(True);

    AMetodo := metodo;
    try
      metodo := 'geral/VerificarSeTokenEstaAtivo';
      AddParametro('authorization',
                   AacessToken.token_type + ' ' + AacessToken.access_token,
                   pkHTTPHEADER,
                   [poDoNotEncode]);
      AddParametro('cod_usuario', AacessToken.cod_usuario.ToString(), pkGETorPOST, []);
      AddParametro('cod_empresa', AacessToken.cod_empresa.ToString(), pkGETorPOST, []);

      Result := ExecutarGET();
      if Result then
        Exit(FrestResponse.StatusCode <> 401);
    finally
      metodo := AMetodo;
    end;
  end;

begin
  FTokenJaEstavaAtivo := False;

  if Assigned(AacessToken) then
    if TokenAtivo then
    begin
      FTokenJaEstavaAtivo := True;
      if Assigned(FacessToken) then
        FreeAndNil(FacessToken);

      FacessToken := TResp_AcessTokent(AacessToken);
      Exit(FTokenJaEstavaAtivo);
    end;

  if (not AuserNameApi.Trim.IsEmpty) and (not AuserNameApi.Trim.IsEmpty) then
  begin
    FuserNameApi := AuserNameApi;
    FpasswordApi := ApasswordApi;
  end
  else if (AuserNameApi.Trim.IsEmpty or AuserNameApi.Trim.IsEmpty) and
    (FuserNameApi.Trim.IsEmpty or FuserNameApi.Trim.IsEmpty) then
    raise Exception.Create('Login e/ou senha não informados');
  try

    if (AuserNameApi.Trim.IsEmpty or AuserNameApi.Trim.IsEmpty) and
      (FuserNameApi.Trim.IsEmpty or FuserNameApi.Trim.IsEmpty) then
      raise Exception.Create('Login e/ou senha não informados');

    FrestClient.BaseURL := FurlApi + Fmetodo;
    FParametrosURL := '';

    FrestRequest.Method := rmPOST;
    FrestRequest.ClearBody;

    setParametros;

    restResponse.ResetToDefaults;

    FrestRequest.Execute;

    if Assigned(FacessToken) then
      FreeAndNil(FacessToken);

    Result := Sucess(200);

    if Result then
    begin
      FacessToken := TResp_AcessTokent.FromJsonString(restResponse.JSONValue.ToJSON);
      FDataHoraLoginAtual := Now;
    end
    else
    begin
      case FrestResponse.StatusCode  of
        400 :
          begin
            Error400 := TJson.JsonToObject<THWRest_RespErro400>(TJson.Format(restResponse.JSONValue));
            raise Exception.Create('400 '               + #13 +
                                   'Falha de login '    + #13 +
                                   Error400.error + ' ' + #13 +
                                   Error400.error_description);
          end;
        404 :
          begin
            Error404 := TJson.JsonToObject<THWRest_RespErro404>(TJson.Format(restResponse.JSONValue));
            raise Exception.Create('404 '                   +#13 +
                                   'Página não encontrada ' + #13 +
                                   Error404.Messagee);
          end;
        else
        begin
          if restResponse.JSONValue <> nil then
            raise Exception.Create('Erro não mapeado ' + #13 +
                                   TJson.Format(restResponse.JSONValue))
          else
            raise Exception.Create('Erro não mapeado');
        end;
      end;
    end;

    //FJSONResponseStr := TJson.Format(FrestResponse.JSONValue);
  except on E: Exception do
    begin
      Result:= False;
      FlastError := MelhorMensagemDeErro(E.message);
    end;
  end;
end;

function TRestHW.MelhorMensagemDeErro(AError: string): string;
begin
  if AError.ToLower.Contains('the server name or address could not be resolved') then
    Result := 'Problema de conexão' + #13 + AError
  else if AError.ToLower.Contains('a connection with the server could not be established') then
    Result := 'Problema de conexão, verifique sua rede local' + #13 + AError
  else if AError.ToLower.Contains('the operation timed out') then
    Result := 'Problema de conexão, Time out' + #13 + AError
  else if AError.ToLower.Contains('the connection with the server was terminated abnormally') then
    Result := 'A Conexão foi interrompida' + #13 + AError
  else
    Result := AError;
end;

procedure TRestHW.SetacessToken(const Value: TResp_AcessTokent);
begin
  FacessToken := Value;
end;

procedure TRestHW.Setmetodo(const Value: string);
begin
  Fmetodo := Value;
end;

procedure TRestHW.SetpasswordApi(const Value: string);
begin
  FpasswordApi := Value;
end;

procedure TRestHW.SetrestClient(const Value: TRESTClient);
begin
  FrestClient := Value;
end;

procedure TRestHW.SetrestRequest(const Value: TRESTRequest);
begin
  FrestRequest := Value;
end;

procedure TRestHW.SetrestResponse(const Value: TRESTResponse);
begin
  FrestResponse := Value;
end;

procedure TRestHW.SeturlApi(const Value: string);
begin
  FurlApi := Value;
end;

procedure TRestHW.SetuserNameApi(const Value: string);
begin
  FuserNameApi := Value;
end;

function TRestHW.Sucess(AStatusCode: Integer): Boolean;
begin
  if not Assigned(FrestResponse) then
    Exit(False);

  if Assigned(FError400) then FreeAndNil(FError400);
  if Assigned(FError404) then FreeAndNil(FError404);

  Result := FrestResponse.StatusCode = AStatusCode;

  try
    case FrestResponse.StatusCode  of
      400 : Error400 := TJson.JsonToObject<THWRest_RespErro400>(TJson.Format(restResponse.JSONValue));
      401 : FlastError := 'A Conexão foi interrompida. 401 Não Autorizado';
      404 : Error404 := TJson.JsonToObject<THWRest_RespErro404>(TJson.Format(restResponse.JSONValue));
    end;
  except
  end;
  if FrestResponse.StatusCode = 401 then
    raise Exception.Create('A Conexão foi interrompida. 401 Não Autorizado');
end;

function TRestHW.Executar(AStream: TStream): Boolean;
begin
  try
    if not Assigned(restClient) then
      raise Exception.Create('REST Client não definido');

    if not Assigned(restRequest) then
      raise Exception.Create('REST Request não definido');

    if not Assigned(restResponse) then
      raise Exception.Create('REST Response não definido');

    if not Assigned(restRequest.Response) then
      restRequest.Response := restResponse;

    if not Assigned(restRequest.Response) then
      raise Exception.Create('REST Response não definido');

    if AStream <> nil then
      restRequest.AddBody(AStream, ctAPPLICATION_OCTET_STREAM);

    restClient.BaseURL := FurlApi + Fmetodo + FParametrosURL;
    FParametrosURL := '';

    restResponse.ResetToDefaults;

    restRequest.Execute;

    Sucess(200);

    Result := True;

  except on E: Exception do
    begin
      Result:= False;
      FlastError := 'Erro REST HW Executar with AStream. Erro: ' + MelhorMensagemDeErro(E.message);
    end;
  end;
end;

function TRestHW.ExecutarGET(AStream: TStream): Boolean;
begin
  restRequest.Method := rmGET;
  Result := Executar(AStream);
end;

function TRestHW.ExecutarPOST(AStream: TStream): Boolean;
begin
  restRequest.Method := rmPOST;
  Result := Executar(AStream);
end;

{ THWRest_ResponseInformation }

class function THWRest_ResponseInformation.FromJsonString(
  AJsonString: string): THWRest_ResponseInformation;
begin
  if (AJsonString.Trim = '') or (AJsonString.Trim.ToLower = 'null') then
    Result := nil
  else
    Result := TJson.JsonToObject<THWRest_ResponseInformation>(AJsonString);
end;

{ THWRest_RequestResponseModal }

procedure THWRest_RequestResponseModal.AddCorpo(AKey, AValue: string);
var
  ACorpo: THWRest_RequestResponseKeyValue;
begin
  ACorpo := THWRest_RequestResponseKeyValue.Create;
  ACorpo.Key := AKey;
  ACorpo.Value := AValue;

  SetLength(FCorpo, Length(FCorpo) + 1);
  FCorpo[High(FCorpo)] := ACorpo;
end;

constructor THWRest_RequestResponseModal.Create;
begin
  SetLength(FCorpo, 0);
end;

destructor THWRest_RequestResponseModal.Destroy;
begin
  FreeAndNil(FCorpo);
  inherited;
end;

class function THWRest_RequestResponseModal.FromJsonString(AJsonString: string): THWRest_RequestResponseModal;
var
  AJsonRoot, AJsonCorpo: TJSONObject;
  AParRoot, AParCorpo: TJSONPair;
begin
  if (AJsonString.Trim = '') or (AJsonString.Trim.ToLower = 'null') then
    Exit(nil);

  Result := TJson.JsonToObject<THWRest_RequestResponseModal>(AJsonString);

  AJsonRoot := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJsonString),0) as TJSONObject;

  try
    if AJsonRoot.Count = 0 then
      Exit;

    for AParRoot in AJsonRoot do
      if AParRoot.JsonString.Value.ToLower.Trim = 'corpo' then
      begin
        AJsonCorpo := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AParRoot.JsonValue.ToString), 0) as TJSONObject;
        if Assigned(AJsonCorpo) then
          for AParCorpo in AJsonCorpo do
            Result.AddCorpo(AParCorpo.JsonString.Value, AParCorpo.JsonValue.Value);
      end;
    Exit(Result);
  finally
  end;
end;

function THWRest_RequestResponseModal.Sucess(AStatus: string): Boolean;
var
  ATexto: string;
  ACorpo: THWRest_RequestResponseKeyValue;
begin
  if Self.Status <> AStatus then
  begin
    Result := False;
    ATexto := 'Erro: ' + Status + #13;

    for ACorpo in FCorpo do
        ATexto := ACorpo.Key + ':' + ACorpo.Value;

    raise Exception.Create('Erro: ' + Status + #13 + ATexto);
  end
  else
    Result := True;
end;

{ TResp_AcessTokent }

class function TResp_AcessTokent.FromJsonString(AJsonString: string): TResp_AcessTokent;
begin
  if (AJsonString.Trim = '') or (AJsonString.Trim.ToLower = 'null') then
    Result := nil
  else
    Result := TJson.JsonToObject<TResp_AcessTokent>(AJsonString);
end;

function TResp_AcessTokent.ToJsonStringEncode: string;
begin
  Result := TJson.ObjectToJsonString( Self, [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings, joIgnoreEmptyArrays] );
end;

{ THWRest_ResponseInformationC }

procedure THWRest_ResponseInformationC.AddKeyValue(AKey, AValue: string);
var
  ACorpo: THWRest_RequestResponseKeyValue;
begin
  ACorpo := THWRest_RequestResponseKeyValue.Create;
  ACorpo.Key := AKey;
  ACorpo.Value := AValue;

  SetLength(FErros, Length(FErros) + 1);
  FErros[High(FErros)] := ACorpo;
end;

class function THWRest_ResponseInformationC.FromJsonString(AJsonString: string): THWRest_ResponseInformationC;
var
  AJsonRoot, AJsonCorpo: TJSONObject;
  AParRoot, AParCorpo: TJSONPair;
begin
  if (AJsonString.Trim = '') or (AJsonString.Trim.ToLower = 'null') then
    Exit(nil);

  AJsonString := AJsonString.Replace('"Object":', '"Objecto":', [rfIgnoreCase]);
  Result := TJson.JsonToObject<THWRest_ResponseInformationC>(AJsonString);

  AJsonRoot := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJsonString),0) as TJSONObject;

  try
    if AJsonRoot.Count = 0 then
      Exit;

    for AParRoot in AJsonRoot do
      if AParRoot.JsonString.Value.ToLower.Trim = 'corpo' then
      begin
        AJsonCorpo := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AParRoot.JsonValue.ToString), 0) as TJSONObject;
        for AParCorpo in AJsonCorpo do
          Result.AddKeyValue(AParCorpo.JsonString.Value, AParCorpo.JsonValue.Value);
      end;
    Exit(Result);
  finally
  end;
end;

function THWRest_ResponseInformationC.Sucess(AStatus: Integer): Boolean;
var
  ATexto: string;
  AErro: THWRest_RequestResponseKeyValue;
begin
  if Self.Status = AStatus then //  1 OK
    Result := True
  else
  begin
    Result := False;
    if not FDescricaoDoErro.Trim.IsEmpty then
      ATexto := 'Erro: ' + FDescricaoDoErro + #13
    else
      ATexto := 'Erro' + #13;

    for AErro in FErros do
      ATexto := AErro.Key + ' : ' + AErro.Value;

    raise Exception.Create(ATexto);
  end;
end;

end.
