unit BaseUseCaseSuzuki;

interface

uses
  SuzukiRepo,
  ApiSuzuki;

type

  TUseCaseBaseSuzuki = class
  strict private
    // freeRepoOnDestroy vai destruir o repositorio instanciado pelo singleton, pois o finalization causa erro, entrou na dll, por padrao true
    // se durante o uso na dll precisar de outro usecase, coloque freeRepoOnDestroy=False; para não destruir o repositorio quando terminal,
    // apenas os usecases da unit Suzuki.export devem ser freeRepoOnDestroy=True
    freeRepoOnDestroy: Boolean;
    DevelopmentMode: Boolean;
  private
    FLastError: string;
    FparamsUC  : string;

    function GetParamsUC(const Name: string): string;

  protected
    silent   : Boolean;
    api      : TApiSuzuki;
    repo     : TSuzukiRepo;

    procedure InitUseCase(pComChave: boolean = False);
  public
    constructor Create(params: string; _freeRepoOnDestroy: Boolean); overload;
    constructor Create(params: string); overload;
    destructor Destroy; override;
    function GetStrParamsUC: string;

    property ParamsUC[const Name: string]: string read GetParamsUC;
    property LastError: string read FLastError write FLastError;
  end;

implementation

{ TUseCaseBaseSuzuki }

uses
  System.SysUtils,
  System.StrUtils,
  hw_utils;

constructor TUseCaseBaseSuzuki.Create(params: string);
begin
  var splitStr := Copy(params, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBaseSuzuki.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');
  FparamsUC := params;
  var list := NewStringList(params, splitStr);
  silent := StrToBoolDef(list.Values['silent'], False);//.ToLower.Equals('true');
  freeRepoOnDestroy := StrToBoolDef(list.Values['freeRepoOnDestroy'], True);

  repo     := TSuzukiRepoSingleton.GetInstance();
  api      := TApiSuzukiSingleton.GetInstance();

  repo.CodEmpresa  := StrToInt(list.Values['empresaId']);
end;

constructor TUseCaseBaseSuzuki.Create(params: string;
  _freeRepoOnDestroy: Boolean);
begin
  Create(IfThen(not freeRepoOnDestroy, ';freeRepoOnDestroy=false;') + params);
end;

destructor TUseCaseBaseSuzuki.Destroy;
begin
  if freeRepoOnDestroy then
  begin
    if Assigned(repo.Banco) then
      repo.desconectar;
    TSuzukiRepoSingleton.ReleaseInstance();
    TApiSuzukiSingleton.ReleaseInstance();
  end;
  inherited;
end;

function TUseCaseBaseSuzuki.GetParamsUC(const Name: string): string;
begin
  Result := NewStringList(FparamsUC, FparamsUC.Substring(0,1)).Values[Name];
end;

function TUseCaseBaseSuzuki.GetStrParamsUC: string;
begin
  Result := FparamsUC;
end;

procedure TUseCaseBaseSuzuki.InitUseCase(pComChave: boolean = False);
begin

  var err := '';
  if not repo.ConfigureStr(FparamsUC).conectar(err) then
    raise Exception.Create(err);

  var conf := repo.GetConfigApi(CONF_API);

  repo.InitRepo;
  repo.UrlApi := conf.URL;
  repo.DevelopmentMode := not conf.producao;

  if repo.DevelopmentMode then
    repo.UrlApi := IfThen(not pComChave, SUZUKI_URL_API_AUTH_HOM, SUZUKI_URL_API_HOM)
  else if repo.UrlApi.Trim.IsEmpty then
    repo.UrlApi := IfThen(repo.DevelopmentMode,
      IfThen(not pComChave, SUZUKI_URL_API_AUTH_HOM, SUZUKI_URL_API_HOM),
      IfThen(not pComChave, SUZUKI_URL_API_AUTH_PROD, SUZUKI_URL_API_PROD));

  conf.URL := repo.UrlApi;
  conf.cliente := CLIENTE;
  
  if pComChave then
  begin
    if conf.acess_token.IsEmpty then
      raise Exception.Create('Acess Token da API não foi obtido');
  end
  else
  begin
    if conf.URL.IsEmpty or conf.usuario.IsEmpty or conf.senha.IsEmpty or conf.cliente.IsEmpty then
      raise Exception.Create('Dados de acesso a API não configurados: URL, Usuario, Senha e Cliente');
  end;

  Self.DevelopmentMode := repo.DevelopmentMode;

  if pComChave then
    api.InitApi(repo.UrlApi, conf.acess_token)
  else
    api.InitApi(repo.UrlApi, conf.usuario, conf.senha, conf.cliente);

end;

end.


