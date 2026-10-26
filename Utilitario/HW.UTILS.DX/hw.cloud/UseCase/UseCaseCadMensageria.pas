unit UseCaseCadMensageria;

interface

uses
  BaseUseCaseHwCloud, System.Classes, System.Generics.Collections, System.TypInfo,
  UseCaseCadMensageriaComTemplateComAnexo, UseCaseCadMensageriaComTemplateSemAnexo,
  UseCaseCadMensageriaSemTemplateComAnexo, UseCaseCadMensageriaSemTemplateSemAnexo;

type
  TUseCaseCadMensageria = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pParamsList: WideString;
      pContatoAvulso: Boolean;
      pCodUsuario: Integer;
      pAssunto: WideString;
      pMensagem: WideString;
      pTemplate: WideString;
      pCodCarta: Integer;
      pCodAplicativo: Integer;
      pCodPlataforma: Integer;
      pAplicativo: WideString;
      pPlataforma: WideString;
      pTipoCliente: WideString;
      pCodUserPlatafoma: WideString;
      pIdentificacaoBot: WideString;
      pVariaveisTemplate: array of WideString;
      pArquivos: array of WideString;
      pUnicoAnexoPorMens: Boolean): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.NetEncoding,
  System.Net.Mime,
  System.JSON,
  HwCloudRepo,
  ApiHwCloud,
  HwCloudModels,
  hw_utils,
  hw_win_utils,
  config_sistema_class;

{ TUseCaseCadMensageria }

function TUseCaseCadMensageria.Run(
  pParamsList: WideString;
  pContatoAvulso: Boolean;
  pCodUsuario: Integer;
  pAssunto: WideString;
  pMensagem: WideString;
  pTemplate: WideString;
  pCodCarta: Integer;
  pCodAplicativo: Integer;
  pCodPlataforma: Integer;
  pAplicativo: WideString;
  pPlataforma: WideString;
  pTipoCliente: WideString;
  pCodUserPlatafoma: WideString;
  pIdentificacaoBot: WideString;
  pVariaveisTemplate: array of WideString;
  pArquivos: array of WideString;
  pUnicoAnexoPorMens: Boolean): Boolean;
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

    if Trim(pTemplate) <> '' then
    begin
      if Length(pArquivos) > 0 then
      begin
        var useCase := TUseCaseCadMensageriaComTemplateComAnexo.Create(pParamsList);
        try
          Result :=
            useCase.Run(
              pContatoAvulso,
              pCodUsuario,
              pAssunto,
              pMensagem,
              pTemplate,
              pCodCarta,
              pCodAplicativo,
              pAplicativo,
              pCodPlataforma,
              pPlataforma,
              pTipoCliente,
              pCodUserPlatafoma,
              pIdentificacaoBot,
              pVariaveisTemplate,
              pArquivos,
              pUnicoAnexoPorMens);
        finally
          useCase.Free;
        end;
      end
      else
      begin
        var useCase := TUseCaseCadMensageriaComTemplateSemAnexo.Create(pParamsList);
        try
          Result :=
            useCase.Run(
              pContatoAvulso,
              pCodUsuario,
              pAssunto,
              pMensagem,
              pTemplate,
              pCodCarta,
              pCodAplicativo,
              pAplicativo,
              pCodPlataforma,
              pPlataforma,
              pTipoCliente,
              pCodUserPlatafoma,
              pIdentificacaoBot,
              pVariaveisTemplate);
        finally
          useCase.Free;
        end;
      end;
    end
    else
    begin
      if Length(pArquivos) > 0 then
      begin
        var useCase := TUseCaseCadMensageriaSemTemplateComAnexo.Create(pParamsList);
        try
          Result :=
            useCase.Run(
              pContatoAvulso,
              pCodUsuario,
              pAssunto,
              pMensagem,
              pCodCarta,
              pCodAplicativo,
              pAplicativo,
              pCodPlataforma,
              pPlataforma,
              pTipoCliente,
              pCodUserPlatafoma,
              pIdentificacaoBot,
              pArquivos,
              pUnicoAnexoPorMens);
        finally
          useCase.Free;
        end;
      end
      else
      begin
        var useCase := TUseCaseCadMensageriaSemTemplateSemAnexo.Create(pParamsList);
        try
          Result :=
            useCase.Run(
              pContatoAvulso,
              pCodUsuario,
              pAssunto,
              pMensagem,
              pCodCarta,
              pCodAplicativo,
              pAplicativo,
              pCodPlataforma,
              pPlataforma,
              pTipoCliente,
              pCodUserPlatafoma,
              pIdentificacaoBot);
        finally
          useCase.Free;
        end;
      end;
    end;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao cadastrar mensageria' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
