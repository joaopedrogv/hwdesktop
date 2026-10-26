unit BaseUseCaseKentro;

interface

uses
  KentroRepo,
  ApiKentro;

type

  TUseCaseBaseKentro = class
  strict private
    // freeRepoOnDestroy vai destruir o repositorio instanciado pelo singleton, pois o finalization causa erro, entrou na dll, por padrao true
    // se durante o uso na dll precisar de outro usecase, coloque freeRepoOnDestroy=False; para não destruir o repositorio quando terminal,
    // apenas os usecases da unit ketro.export devem ser freeRepoOnDestroy=True
    freeRepoOnDestroy: Boolean;
    DevelopmentMode: Boolean;
  private
    FLastError: string;
    FparamsUC  : string;

    function GetParamsUC(const Name: string): string;

  protected
    silent   : Boolean;
    api      : TApiKentro;
    repo     : TKentroRepo;

    procedure InitUseCase;
  public
    constructor Create(params: string); overload;
    destructor Destroy; override;
    function GetStrParamsUC: string;

    property ParamsUC[const Name: string]: string read GetParamsUC;
    property LastError: string read FLastError write FLastError;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  hw_utils;

{ TUseCaseBaseKentro }

constructor TUseCaseBaseKentro.Create(params: string);
begin
  var splitStr := Copy(params, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBaseKentro.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');
  FparamsUC := params;
  var list := NewStringList(params, splitStr);
  silent := StrToBoolDef(list.Values['silent'], False);//.ToLower.Equals('true');
  freeRepoOnDestroy := StrToBoolDef(list.Values['freeRepoOnDestroy'], True);

  repo     := TKentroRepoSingleton.GetInstance();
  api      := TApiKentroSingleton.GetInstance();

  repo.CodEmpresa  := StrToInt(list.Values['empresaId']);
end;

destructor TUseCaseBaseKentro.Destroy;
begin
  if freeRepoOnDestroy then
  begin
    if Assigned(repo.Banco) then
      repo.desconectar;
    TKentroRepoSingleton.ReleaseInstance();
    TApiKentroSingleton.ReleaseInstance();
  end;
  inherited;
end;

function TUseCaseBaseKentro.GetParamsUC(const Name: string): string;
begin
  Result := NewStringList(FparamsUC, FparamsUC.Substring(0,1)).Values[Name];
end;

function TUseCaseBaseKentro.GetStrParamsUC: string;
begin
  Result := FparamsUC;
end;

procedure TUseCaseBaseKentro.InitUseCase;
begin

  var err := '';
  if not repo.ConfigureStr(FparamsUC).conectar(err) then
    raise Exception.Create(err);

  var conf := repo.GetConfigApi(CONF_API);

  repo.InitRepo;
  repo.UrlApi := conf.URL;
  repo.DevelopmentMode := not conf.producao;

  conf.URL := repo.UrlApi;

  if conf.URL.IsEmpty then
    raise Exception.Create('Dados de acesso a API não configurados: URL, Chave, QueueId');

  Self.DevelopmentMode := repo.DevelopmentMode;

  api.InitApi(repo.UrlApi);
end;

end.
