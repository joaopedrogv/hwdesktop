unit UseCaseBuscarConfig;

interface

uses
   BaseUseCaseHwCloud, System.Classes, System.Generics.Collections;

type

  TUseCaseBuscarConfig = class(TUseCaseBaseHwCloud)
  public
    function Run: Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.NetEncoding,
  System.Net.Mime,
  HwCloudRepo,
  ApiHwCloud,
  HwCloudModels,
  hw_utils,
  hw_win_utils,
  config_sistema_class;

{ TUseCaseBuscarConfig }

function TUseCaseBuscarConfig.Run: Boolean;
var
  buscarConfig: TBuscarConfig;
begin
  Result := False;
  try
    InitUseCase;

    repo := THwCloudRepoSingleton.GetInstance();
    api := TApiHwCloudSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      if not silent then
        raise Exception.Create('Configuração para hwcloud não encontrada no Cadastro de API');

    try
      buscarConfig := TBuscarConfig.Create;
      buscarConfig.cnpj := conf.cnpj;

      var useCase := api.BuscarConfig(buscarConfig);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Buscar config sem resposta da API');

      if (useCase.status.Trim() <> '') and (useCase.status.Trim() <> 'OK') then
        if not silent then
          raise Exception.Create('Falha ao buscar configurações');

      Result := repo.BuscarConfig(useCase);
    finally
      if Assigned(buscarConfig) then
        FreeAndNil(buscarConfig);
    end;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao buscar configurações' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
