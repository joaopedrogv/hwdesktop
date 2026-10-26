unit BaseUseCaseHwCloud;

interface

uses
  HwCloudRepo,
  ApiHwCloud;

type

  TUseCaseBaseHwCloud = class
  strict private
    // freeRepoOnDestroy vai destruir o repositorio instanciado pelo singleton, pois o finalization causa erro, entrou na dll, por padrao true
    // se durante o uso na dll precisar de outro usecase, coloque freeRepoOnDestroy=False; para não destruir o repositorio quando terminal,
    // apenas os usecases da unit HwCloud.export devem ser freeRepoOnDestroy=True
    freeRepoOnDestroy: Boolean;
    DevelopmentMode: Boolean;
  private
    FLastError: string;
    FparamsUC  : string;

    function GetParamsUC(const Name: string): string;

  protected
    silent   : Boolean;
    api      : TApiHwCloud;
    repo     : THwCloudRepo;

    procedure InitUseCase;
  public
    constructor Create(params: string; _freeRepoOnDestroy: Boolean); overload;
    constructor Create(params: string); overload;
    destructor Destroy; override;
    function GetStrParamsUC: string;

    property ParamsUC[const Name: string]: string read GetParamsUC;
    property LastError: string read FLastError write FLastError;
  end;

implementation

{ TUseCaseBaseHwCloud }

uses
  System.SysUtils,
  System.StrUtils,
  hw_utils;

constructor TUseCaseBaseHwCloud.Create(params: string);
begin
  var splitStr := Copy(params, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBaseHwCloud.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');
  FparamsUC := params;
  var list := NewStringList(params, splitStr);
  silent := StrToBoolDef(list.Values['silent'], False);//.ToLower.Equals('true');
  freeRepoOnDestroy := StrToBoolDef(list.Values['freeRepoOnDestroy'], True);

  repo     := THwCloudRepoSingleton.GetInstance();
  api      := TApiHwCloudSingleton.GetInstance();

  repo.CodEmpresa  := StrToInt(list.Values['empresaId']);
end;

constructor TUseCaseBaseHwCloud.Create(params: string;
  _freeRepoOnDestroy: Boolean);
begin
  Create(IfThen(not freeRepoOnDestroy, ';freeRepoOnDestroy=false;') + params);
end;

destructor TUseCaseBaseHwCloud.Destroy;
begin
  if freeRepoOnDestroy then
  begin
    if Assigned(repo.Banco) then
      repo.desconectar;
    THwCloudRepoSingleton.ReleaseInstance();
    TApiHwCloudSingleton.ReleaseInstance();
  end;
  inherited;
end;

function TUseCaseBaseHwCloud.GetParamsUC(const Name: string): string;
begin
  Result := NewStringList(FparamsUC, FparamsUC.Substring(0,1)).Values[Name];
end;

function TUseCaseBaseHwCloud.GetStrParamsUC: string;
begin
  Result := FparamsUC;
end;

procedure TUseCaseBaseHwCloud.InitUseCase;
begin

  var err := '';
  if not repo.ConfigureStr(FparamsUC).conectar(err) then
    raise Exception.Create(err);

  var conf := repo.GetConfigApi(CONF_API);

  repo.InitRepo;
  repo.UrlApi := conf.URL;
  repo.DevelopmentMode := not conf.producao;

  repo.UrlApi := HwCloud_URL_API_AUTH_PROD;

  conf.URL := repo.UrlApi;
  
  if conf.URL.IsEmpty or conf.authorization.IsEmpty then
    raise Exception.Create('Dados de acesso a API não configurados: URL, Authorization');
  
  api.InitApi(repo.UrlApi, conf.authorization);
end;

end.


