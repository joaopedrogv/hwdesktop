unit BaseUseCaseAO;

interface

uses
  System.SysUtils,
  System.Classes,
  AssineonRepo,
  ApiAssineOn;

const
  ASSINEON_URL_API_PROD = 'assineon.com.br/api';
  ASSINEON_URL_API_HOM  = '192.168.254.50:5000/api';

type

  TUseCaseBaseAssineOn = class
  strict private
    // freeRepoOnDestroy vai destruir o repositorio instanciado pelo singleton, pois o finalization causa erro, entrou na dll, por padrao true
    // se durante o uso na dll precisar de outro usecase, coloque freeRepoOnDestroy=False; para não destruir o repositorio quando terminal,
    // apenas os usecases da unit assineon.export devem ser freeRepoOnDestroy=True
    freeRepoOnDestroy: Boolean;
  private
    FLastError: string;
    FparamsUC  : string;

    function GetParamsUC(const Name: string): string;

  protected
    silent   : Boolean;
    api      : TApiAssineOn;
    repo     : TAssineOnRepo;

    procedure InitUseCase();
    //function IsTimeToRun(): Boolean; virtual; abstract;
  public
    constructor Create(params: string);
    destructor Destroy; override;


    property ParamsUC[const Name: string]: string read GetParamsUC;
    property LastError: string read FLastError write FLastError;
  end;

implementation

{ TUseCaseBaseAssineOn }

uses
  System.StrUtils,
  hw_utils;

constructor TUseCaseBaseAssineOn.Create(params: string);
begin
  var splitStr := Copy(params, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBaseAssineOn.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');
  FparamsUC := params;
  var list := NewStringList(params, splitStr);
  silent := StrToBoolDef(list.Values['silent'], False);//.ToLower.Equals('true');
  freeRepoOnDestroy := StrToBoolDef(list.Values['freeRepoOnDestroy'], True);


  repo     := TAssineOnRepoSingleton.GetInstance();
  api      := TApiAssineOnSingleton.GetInstance();

  repo.CodEmpresa := StrToInt(list.Values['empresaId']);
end;

destructor TUseCaseBaseAssineOn.Destroy;
begin
  if freeRepoOnDestroy then
  begin
    if Assigned(repo.Banco) then
      repo.desconectar;
    TAssineOnRepoSingleton.ReleaseInstance();
    TApiAssineOnSingleton.ReleaseInstance();
  end;
  inherited;
end;

function TUseCaseBaseAssineOn.GetParamsUC(const Name: string): string;
begin
  Result := NewStringList(FparamsUC, FparamsUC.Substring(0,1)).Values[Name];
end;

procedure TUseCaseBaseAssineOn.InitUseCase;
begin

// Onde vai pegar a url da api? aqui ou no create
  var err := '';
  if not repo.ConfigureStr(FparamsUC).conectar(err) then
    raise Exception.Create(err);

  var conf := repo.GetConfig(HW_CONF_KEY, repo.CodEmpresa);

  repo.InitRepo;
  repo.UrlApi := conf.value1_vc;

  if repo.UrlApi.Trim.IsEmpty then
    repo.UrlApi := IfThen(repo.DevelopmentMode, ASSINEON_URL_API_HOM, ASSINEON_URL_API_PROD);


//  api.bearerToken

//  api.CNPJ := repo.CnpjEmp;
  api.InitApi(repo.UrlApi);
end;

end.
