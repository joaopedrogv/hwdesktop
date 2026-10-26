unit BaseUseCaseNummus;

interface

uses
  NummusRepo,
  ApiNummus;

type

  TUseCaseBaseNummus = class
  strict private
    // freeRepoOnDestroy vai destruir o repositorio instanciado pelo singleton, pois o finalization causa erro, entrou na dll, por padrao true
    // se durante o uso na dll precisar de outro usecase, coloque freeRepoOnDestroy=False; para não destruir o repositorio quando terminal,
    // apenas os usecases da unit nummus.export devem ser freeRepoOnDestroy=True
    freeRepoOnDestroy: Boolean;
    DevelopmentMode: Boolean;
  private
    FLastError: string;
    FparamsUC  : string;

    function GetParamsUC(const Name: string): string;

  protected
    silent   : Boolean;
    api      : TApiNummus;
    repo     : TNummusRepo;

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

{ TUseCaseBaseNummus }

constructor TUseCaseBaseNummus.Create(params: string);
begin
  var splitStr := Copy(params, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBaseNummus.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');
  FparamsUC := params;
  var list := NewStringList(params, splitStr);
  silent := StrToBoolDef(list.Values['silent'], False);//.ToLower.Equals('true');
  freeRepoOnDestroy := StrToBoolDef(list.Values['freeRepoOnDestroy'], True);

  repo     := TNummusRepoSingleton.GetInstance();
  api      := TApiNummusSingleton.GetInstance();

  repo.CodEmpresa  := StrToInt(list.Values['empresaId']);
end;

destructor TUseCaseBaseNummus.Destroy;
begin
  if freeRepoOnDestroy then
  begin
    if Assigned(repo.Banco) then
      repo.desconectar;
    TNummusRepoSingleton.ReleaseInstance();
    TApiNummusSingleton.ReleaseInstance();
  end;
  inherited;
end;

function TUseCaseBaseNummus.GetParamsUC(const Name: string): string;
begin
  Result := NewStringList(FparamsUC, FparamsUC.Substring(0,1)).Values[Name];
end;

function TUseCaseBaseNummus.GetStrParamsUC: string;
begin
  Result := FparamsUC;
end;

procedure TUseCaseBaseNummus.InitUseCase;
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
    raise Exception.Create('Dados de acesso a API não configurados: URL, Chave, ClientId');

  Self.DevelopmentMode := repo.DevelopmentMode;

  api.InitApi(repo.UrlApi, conf.api, conf.clienteId, conf.contentType, conf.accept);
end;

end.
