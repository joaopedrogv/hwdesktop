unit KentroRepo;

interface

uses
  Data.DB,
  uClasseConexao,
  HW.Servicos,
  BaseSingleton,
  ConfigApiModel,
  Classes,
  KentroModels;

const
  CONF_API = 'KENTRO';

type

  TKentroRepo = class;

  TKentroRepo = class(THwServicos)
  public
    function GetConfigApi(apiName: string): TConfigApiModel;
  end;

  TKentroRepoSingleton = TSingleton<TKentroRepo>;

  Conexao_OOP = TConexao_OOP;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  hw_utils,
  hw_win_utils,
  Query_OOP;

{ TKentroRepo }

function TKentroRepo.GetConfigApi(apiName: string): TConfigApiModel;
begin
  Result := TConfigApiModel.Create;
  var query := QueryHelper.CreateObj(QrAux)
    .Open(' select cod_empresa, api, url_api from config_api' +
          ' where cod_empresa = %d ' +
          ' and api = %s',
          [CodEmpresa,
           apiName.QuotedString()]);

  Result.URL := getCampoPipe(query.fstr('url_api'), 1);
  Result.chave := getCampoPipe(query.fstr('url_api'), 2);
  Result.queueId := StrToInt(getCampoPipe(query.fstr('url_api'), 3));
  Result.empresaId := query.fint('cod_empresa');
end;

end.
