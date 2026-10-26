unit Hw.Integra.Servicos;

interface

uses
  Hw.Integra.Api.Rest,
  HW.Servicos;

const
  HW_URL_API_PROD         = 'hwsistemas.homelinux.com/integra/api';
  //HW_URL_API_HOM          = 'localhost/IntegraApiHw/api';
  HW_URL_API_HOM          = 'localhost:63475/api';
  HW_SERV_TOKEN_API       = 'integra_api_access_token';
  HW_STS_CONSULTANDO      = 'Consultando';
  HW_STS_CONCLUIDA        = 'Concluida';
  HW_STS_SEM_CONSULTA     = 'Sem Consulta';
  HW_STS_ERROR            = 'Erro';
  HW_STS_ERROR_API        = 'ErroApi';

type

  THwIntegraServicos = class(THwServicos)
  protected
    FToken: TIntegraTokenApi;
    ServiceID: string;
    DataSearch: THwServicosJSON;
    procedure HandleUpdateToken(atoken: TIntegraTokenApi);
    procedure GetUrlApi; override;
    function GetDadosApi: Boolean; override;
    function GetDataSearch(servico: string): THwServicosJSON;
    procedure Consultar(dadosConsulta: THwServicosJSON); virtual; abstract; //aqui usa a api
    constructor Create(silentMode: Boolean; service: string); overload; virtual;
  public
    destructor Destroy; override;

    procedure ConsultaDiaria(); virtual;
    procedure ConsultarAgora(); virtual;
  end;

implementation

uses
  HW.Utils.Classes.Registros_DX,
  config_sistema_class,
  hw_utils,
  System.StrUtils,
  System.SysUtils,
  REST.Json;

{ THwIntegraServicos }

procedure THwIntegraServicos.ConsultaDiaria;
var
  momentoDeConsulta: Boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try
    if (not GetDadosApi) then// obtem hora do servidor no metodo GetCNPJ
      Exit;

    DataSearch := GetDataSearch(ServiceID);

    try
      momentoDeConsulta := ((DataHoraAtual - DataSearch.DataConsulta) >= 1) or // maior que 1 dia consultar
                           (((DataHoraAtual - DataSearch.DataConsulta) > EncodeTime(0,30,0,0)) and (DataSearch.Status.Equals(HW_STS_CONSULTANDO))); // no intervalo de 30 minutos 1 maquina consultou e nao concluiu a consulta

      if not momentoDeConsulta then
        Exit;

      Consultar(DataSearch);

    finally
      if Assigned(DataSearch) then
        FreeAndNil(DataSearch);
    end;

  finally
    desconectar;
  end;
end;

procedure THwIntegraServicos.ConsultarAgora;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try
    if (not GetDadosApi) then
      Exit;

    DataSearch := GetDataSearch(ServiceID);

    try

      Consultar(DataSearch);

    finally
      if Assigned(DataSearch) then
        FreeAndNil(DataSearch);
    end;

  finally
    desconectar;
  end;
end;

constructor THwIntegraServicos.Create(silentMode: Boolean;
  service: string);
begin
  inherited Create(silentMode);
  ServiceID := service;
end;

destructor THwIntegraServicos.Destroy;
begin
  if Assigned(DataSearch) then
    FreeAndNil(DataSearch);
  inherited;
end;

procedure THwIntegraServicos.GetUrlApi;
var
  Conf: TConfig_sistema_class;
begin

  Conf := TConfig_sistema_class.getConf('hw_integra_api', QrAux, CodEmpresa);
  try
    UrlApi := Conf.value1_vc;
    if UrlApi.Trim.IsEmpty then
      UrlApi := IfThen(DevelopmentMode, HW_URL_API_HOM, HW_URL_API_PROD);

  finally
    Conf.Free;
  end;

  var resp := not UrlApi.Trim.IsEmpty;
  if resp then
    FToken := THwClassRegistros.FromJsonString<TIntegraTokenApi>(GetJson(HW_SERV_TOKEN_API))
  else if not resp then
    raise Exception.Create(Format('Url não encontrada no banco empresa %d "hw_integra_api"', [CodEmpresa]));

end;

function THwIntegraServicos.GetDadosApi: Boolean;
var
  Conf: TConfig_sistema_class;
begin
  Result := False;

  try
    Conf := TConfig_sistema_class.getConf('hw_integra_api', QrAux, CodEmpresa);
    try
      UrlApi := Conf.value1_vc;
      if UrlApi.Trim.IsEmpty then
        UrlApi := IfThen(DevelopmentMode, HW_URL_API_HOM, HW_URL_API_PROD);

    finally
      Conf.Free;
    end;

    Result := not UrlApi.Trim.IsEmpty;
    if Result then
      FToken := THwClassRegistros.FromJsonString<TIntegraTokenApi>(GetJson(HW_SERV_TOKEN_API))
    else if not Result then
      if not SilentMod then
        ShowErro('Não foi possivel obter a Url da API no banco de dados')
      else
        LogError('Url não encontrada no banco empresa %d "hw_integra_api"', [CodEmpresa]);

  except on E: Exception do
    begin
      LogError('THwIntegraServicos.GetUrl ', [e.Message]);
    end;
  end;
end;

function THwIntegraServicos.GetDataSearch(
  servico: string): THwServicosJSON;
begin
  Result := THwClassRegistros.FromJsonString<THwServicosJSON>(GetJson(servico));
  if Result = nil then
  begin
    Result := THwServicosJSON.Create;
    Result.Status := HW_STS_CONSULTANDO;
    Result.Servico := servico;
    Result.DataConsulta := DataHoraAtual;

    SaveJSON(Result.Servico, TJson.ObjectToJsonString(Result));

    Result.DataConsulta := DataHoraAtual - 2;
  end;
  Result.Servico := servico;
end;

procedure THwIntegraServicos.HandleUpdateToken(atoken: TIntegraTokenApi);
var
  updatetoken: Boolean;
begin
  if atoken <> nil then
  begin
    if not Assigned(FToken) then
      updatetoken := True
    else if FToken.accessToken <> atoken.accessToken then
      updatetoken := True
    else
      updatetoken := False;

    if updatetoken then
    begin
      FToken := atoken;
      SaveJSON(HW_SERV_TOKEN_API, TJson.ObjectToJsonString(FToken, [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings, joIgnoreEmptyArrays]));
    end;
  end;
end;

end.
