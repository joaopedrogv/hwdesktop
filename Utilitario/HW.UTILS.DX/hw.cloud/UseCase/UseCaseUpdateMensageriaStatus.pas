unit UseCaseUpdateMensageriaStatus;

interface

uses
  BaseUseCaseHwCloud, System.Classes, System.Generics.Collections, System.TypInfo;

type
  TUseCaseUpdateMensageriaStatus = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pCodMens: Integer;
      pUuid: WideString;
      pOrigem: WideString;
      pStatus: WideString): Boolean;
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

{ TUseCaseUpdateMensageriaStatus }

function TUseCaseUpdateMensageriaStatus.Run(
  pCodMens: Integer;
  pUuid: WideString;
  pOrigem: WideString;
  pStatus: WideString): Boolean;
var
  updateMensageriaStatus: TUpdateMensageriaStatus;
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
      updateMensageriaStatus := TUpdateMensageriaStatus.Create;
      updateMensageriaStatus.cnpj := conf.cnpj;
      updateMensageriaStatus.origem := pOrigem;
      updateMensageriaStatus.status := pStatus;
      updateMensageriaStatus.uuid := pUuid;

      var useCase := api.updateMensageriaStatus(updateMensageriaStatus);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Update mensageria sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
        if not silent then
          raise Exception.Create(useCase.resposta.Trim());

      Result := repo.UpdateMensagemStatus(pCodMens, pStatus, updateMensageriaStatus, useCase);
    finally
      if Assigned(updateMensageriaStatus) then
        FreeAndNil(updateMensageriaStatus);
    end;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao atualizar mensageria' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
