unit BaseUseCasePlugBoleto;

interface

uses
  PlugBoletoRepo,
  ApiPlugBoleto;

type

  TUseCaseBasePlugBoleto = class
  strict private
    // freeRepoOnDestroy vai destruir o repositorio instanciado pelo singleton, pois o finalization causa erro, entrou na dll, por padrao true
    // se durante o uso na dll precisar de outro usecase, coloque freeRepoOnDestroy=False; para não destruir o repositorio quando terminal,
    // apenas os usecases da unit plugboleto.export devem ser freeRepoOnDestroy=True
    freeRepoOnDestroy: Boolean;
    DevelopmentMode: Boolean;
  private
    FLastError: string;
    FparamsUC  : string;

    function GetParamsUC(const Name: string): string;

  protected
    silent   : Boolean;
    api      : TApiPlugBoleto;
    repo     : TPlugBoletoRepo;

    procedure InitUseCase(pSemChave: boolean = False);
  public
    constructor Create(params: string; _freeRepoOnDestroy: Boolean); overload;
    constructor Create(params: string); overload;
    destructor Destroy; override;
    function GetStrParamsUC: string;

    property ParamsUC[const Name: string]: string read GetParamsUC;
    property LastError: string read FLastError write FLastError;
  end;

implementation

{ TUseCaseBasePlugBoleto }

uses
  System.SysUtils,
  System.StrUtils,
  hw_utils;

constructor TUseCaseBasePlugBoleto.Create(params: string);
begin
  var splitStr := Copy(params, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBasePlugBoleto.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');
  FparamsUC := params;
  var list := NewStringList(params, splitStr);
  silent := StrToBoolDef(list.Values['silent'], False);//.ToLower.Equals('true');
  freeRepoOnDestroy := StrToBoolDef(list.Values['freeRepoOnDestroy'], True);

  repo     := TPlugBoletoRepoSingleton.GetInstance();
  api      := TApiPlugBoletoSingleton.GetInstance();

  repo.CodEmpresa  := StrToInt(list.Values['empresaId']);
end;

constructor TUseCaseBasePlugBoleto.Create(params: string;
  _freeRepoOnDestroy: Boolean);
begin
  Create(IfThen(not freeRepoOnDestroy, ';freeRepoOnDestroy=false;') + params);
end;

destructor TUseCaseBasePlugBoleto.Destroy;
begin
  if freeRepoOnDestroy then
  begin
    if Assigned(repo.Banco) then
      repo.desconectar;
    TPlugBoletoRepoSingleton.ReleaseInstance();
    TApiPlugBoletoSingleton.ReleaseInstance();
  end;
  inherited;
end;

function TUseCaseBasePlugBoleto.GetParamsUC(const Name: string): string;
begin
  Result := NewStringList(FparamsUC, FparamsUC.Substring(0,1)).Values[Name];
end;

function TUseCaseBasePlugBoleto.GetStrParamsUC: string;
begin
  Result := FparamsUC;
end;

procedure TUseCaseBasePlugBoleto.InitUseCase(pSemChave: boolean = False);
begin

  var err := '';
  if not repo.ConfigureStr(FparamsUC).conectar(err) then
    raise Exception.Create(err);

  var conf := repo.GetConfigApi(CONF_API);

  repo.InitRepo;
  repo.UrlApi := conf.URL;
  repo.DevelopmentMode := not conf.producao;

  if repo.DevelopmentMode then
    repo.UrlApi := PLUGBOLETO_URL_API_HOM
  else if repo.UrlApi.Trim.IsEmpty then
    repo.UrlApi := IfThen(repo.DevelopmentMode, PLUGBOLETO_URL_API_HOM, PLUGBOLETO_URL_API_PROD);
  conf.URL := repo.UrlApi;

  if conf.URL.IsEmpty or conf.token.IsEmpty then
    raise Exception.Create('Dados de acesso a API não configurados: URL, Token e Chave(CNPJ do cedente)');

  Self.DevelopmentMode := repo.DevelopmentMode;

  if pSemChave then
    api.InitApi(repo.UrlApi, CNPJ_SH, conf.token, '')
  else
    api.InitApi(repo.UrlApi, CNPJ_SH, conf.token, conf.chave);

end;

end.


