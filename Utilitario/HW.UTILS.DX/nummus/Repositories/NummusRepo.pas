unit NummusRepo;

interface

uses
  Data.DB,
  uClasseConexao,
  HW.Servicos,
  BaseSingleton,
  ConfigApiModel,
  Classes;

const
  CONF_API = 'NUMMUSCASHBACK';

type

  TNummusRepo = class;

  TNummusRepo = class(THwServicos)
  public
    function GetConfigApi(apiName: string): TConfigApiModel;
  end;

  TNummusRepoSingleton = TSingleton<TNummusRepo>;

  Conexao_OOP = TConexao_OOP;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  hw_utils,
  Query_OOP;

{ TNummusRepo }

function TNummusRepo.GetConfigApi(apiName: string): TConfigApiModel;
begin
  Result := TConfigApiModel.Create;
  var query := QueryHelper.CreateObj(QrAux)
    .Open(' select cod_empresa, api, url_api from config_api' +
          ' where cod_empresa = %d ' +
          ' and api = %s',
          [CodEmpresa,
           apiName.QuotedString()]);

  Result.URL := getCampoPipe(query.fstr('url_api'), 1);
  Result.api := getCampoPipe(query.fstr('url_api'), 2);
  Result.clienteId := getCampoPipe(query.fstr('url_api'), 3);
  Result.contentType := 'application/json';
  Result.accept := 'application/json';
  Result.empresaId := query.fint('cod_empresa');
end;

initialization

finalization
  TNummusRepoSingleton.ReleaseInstance;

end.
