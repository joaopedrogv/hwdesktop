unit UseCaseUpdateMensageria;

interface

uses
  BaseUseCaseHwCloud, System.Classes, System.Generics.Collections, System.TypInfo;

type
  TUseCaseUpdateMensageria = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pCodMens: Integer;
      pOrigem: WideString;
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

{ TUseCaseUpdateMensageria }

function TUseCaseUpdateMensageria.Run(
  pCodMens: Integer;
  pOrigem: WideString;
  pStatus: WideString;
  pUuid: WideString): Boolean;
var
  updateMensageria: TUpdateMensageria;
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
      updateMensageria := TUpdateMensageria.Create;
      updateMensageria.cnpj := conf.cnpj;
      updateMensageria.origem := pOrigem;
      updateMensageria.status := pStatus;
      updateMensageria.uuid := pUuid;

      var useCase := api.UpdateMensageria(updateMensageria);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Update mensageria sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
        if not silent then
          raise Exception.Create(useCase.resposta.Trim());

      Result := repo.UpdateMensagem(pCodMens, updateMensageria, useCase);
    finally
      if Assigned(updateMensageria) then
        FreeAndNil(updateMensageria);
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
