unit UseCaseUpdateMensageriaAtribuirProf;

interface

uses
  BaseUseCaseHwCloud, System.Classes, System.Generics.Collections, System.TypInfo;

type
  TUseCaseUpdateMensageriaAtribuirProf = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pCodMens: Integer;
      pUuid: WideString;
      pOrigem: WideString;
      pCdpessoaProf: WideString;
      pPlatAtribuidaProf: WideString;
      pCodUserAtribuidoProf: WideString): Boolean;
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

{ TUseCaseUpdateMensageriaAtribuirProf }

function TUseCaseUpdateMensageriaAtribuirProf.Run(
  pCodMens: Integer;
  pUuid: WideString;
  pOrigem: WideString;
  pCdpessoaProf: WideString;
  pPlatAtribuidaProf: WideString;
  pCodUserAtribuidoProf: WideString): Boolean;
var
  updateMensageriaAtribuirProf: TUpdateMensageriaAtribuirProf;
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
      updateMensageriaAtribuirProf := TUpdateMensageriaAtribuirProf.Create;
      updateMensageriaAtribuirProf.cnpj := conf.cnpj;
      updateMensageriaAtribuirProf.origem := pOrigem;
      updateMensageriaAtribuirProf.cdpessoa_prof := pCdpessoaProf;
      updateMensageriaAtribuirProf.tipo_pessoa_prof := 'CI';
      updateMensageriaAtribuirProf.plat_atribuida_prof := pPlatAtribuidaProf;
      updateMensageriaAtribuirProf.cod_user_atribuido_prof := pCodUserAtribuidoProf;
      updateMensageriaAtribuirProf.uuid := pUuid;

      var useCase := api.updateMensageriaAtribuirProf(updateMensageriaAtribuirProf);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Update mensageria sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
        if not silent then
          raise Exception.Create(useCase.resposta.Trim());

      Result := repo.UpdateMensagemAtribuirProf(pCodMens, pCdpessoaProf, pPlatAtribuidaProf, pCodUserAtribuidoProf, updateMensageriaAtribuirProf, useCase);
    finally
      if Assigned(updateMensageriaAtribuirProf) then
        FreeAndNil(updateMensageriaAtribuirProf);
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
