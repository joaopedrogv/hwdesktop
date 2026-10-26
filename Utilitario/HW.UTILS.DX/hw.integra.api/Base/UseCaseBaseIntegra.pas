unit UseCaseBaseIntegra;

interface

uses
  System.SysUtils,
  System.Classes,
  RepoIntegraHW,
  ApiIntegra;

type

  TUseCaseBaseIntegra = class
  private
    FLastError: string;
  protected
    silent   : Boolean;
    api      : TApiIntegra;
    repo     : TRepoIntegra;
    paramsUC : TStrings;

    procedure InitUseCase();
    function IsPcHw: Boolean;
    function IsTimeToRun(): Boolean; virtual; abstract;
  public
    constructor Create(params: string);
    destructor Destroy; override;

    property LastError: string read FLastError write FLastError;
  end;

implementation

{ TUseCaseBaseIntegra }

uses
//  System.StrUtils,
  hw_utils;

constructor TUseCaseBaseIntegra.Create(params: string);
begin
  var splitStr := Copy(params, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBaseIntegra.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');

  paramsUC  := NewStringList(params, splitStr);
  silent    := StrToBoolDef(paramsUC.Values['silent'], False);//.ToLower.Equals('true');

  repo      := TRepoIntegra.Create(params, False);
  api       := TApiIntegra.Create(repo.UrlApi, repo.CnpjEmp);
end;

destructor TUseCaseBaseIntegra.Destroy;
begin
  api.Free;
  repo.Free;
  inherited;
end;

procedure TUseCaseBaseIntegra.InitUseCase;
begin
  repo.Inicializar;

  api.CNPJ := repo.CnpjEmp;
  api.InitApi(repo.UrlApi);
end;

function TUseCaseBaseIntegra.IsPcHw: Boolean;
begin
  Result := True;
  try
    var arqHosts := TStringList.Create;
    try
      if FileExists('C:\Windows\System32\drivers\etc\hosts') then
      begin
        try
          arqHosts.LoadFromFile('C:\Windows\System32\drivers\etc\hosts');
          if (Pos('hwsistemas.homelinux.com', LowerCase(arqHosts.Text)) > 0) or
            (Pos('www.hwsistemas.com.br', LowerCase(arqHosts.Text)) > 0) or
            (Pos('servidorhw.nao.enviar.colab', LowerCase(arqHosts.Text)) > 0) then
            Exit;
        except
        end;
      end;
    finally
      arqHosts.Free;
    end;
  except
  end;

  Result := False;
end;

end.
