unit UseCaseUpdateStatusMensageria;

interface

uses
   BaseUseCaseHwCloud, System.Classes, System.Generics.Collections;

type
  TUseCaseUpdateStatusMensageria = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pCodMens: Integer;
      pStatus: WideString;
      pUuid: WideString): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.NetEncoding,
  HwCloudRepo,
  ApiHwCloud,
  HwCloudModels,
  hw_utils,
  hw_win_utils,
  config_sistema_class, System.JSON;

{ TUseCaseUpdateStatusMensageria }

function TUseCaseUpdateStatusMensageria.Run(
  pCodMens: Integer;
  pStatus: WideString;
  pUuid: WideString): Boolean;
var
  updateStatusMensageria: TUpdateStatusMensageria;
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
      updateStatusMensageria := TUpdateStatusMensageria.Create;
      updateStatusMensageria.uuid := pUuid;
      updateStatusMensageria.origem := 'bot';
      updateStatusMensageria.obs_envio := 'Envio realizado com sucesso!';
      updateStatusMensageria.mensagem := '';
      updateStatusMensageria.status := pStatus;
      
      var useCase := api.UpdateStatusMensageria(updateStatusMensageria);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Ler mensageria sem resposta da API');

      if useCase.status != 'OK' then
        raise Exception.Create(useCase.resposta);

    finally
      if Assigned(updateStatusMensageria) then
        FreeAndNil(updateStatusMensageria);
    end;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao ler mensageria' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
