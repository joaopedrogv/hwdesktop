unit UseCaseCadMensageriaSemTemplateSemAnexo;

interface

uses
   BaseUseCaseHwCloud, System.Classes;

type

  TUseCaseCadMensageriaSemTemplateSemAnexo = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pContatoAvulso: Boolean;
      pCodUsuario: Integer;
      pAssunto: WideString;
      pMensagem: WideString;
      pCodCarta: Integer;
      pCodAplicativo: Integer;
      pAplicativo: WideString;
      pCodPlataforma: Integer;
      pPlataforma: WideString;
      pTipoCliente: WideString;
      pCodUserPlatafoma: WideString;
      pIdentificacaoBot: WideString): Boolean;
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
  config_sistema_class;

{ TUseCaseCadMensageriaSemTemplateSemAnexo }

function TUseCaseCadMensageriaSemTemplateSemAnexo.Run(
  pContatoAvulso: Boolean;
  pCodUsuario: Integer;
  pAssunto: WideString;
  pMensagem: WideString;
  pCodCarta: Integer;
  pCodAplicativo: Integer;
  pAplicativo: WideString;
  pCodPlataforma: Integer;
  pPlataforma: WideString;
  pTipoCliente: WideString;
  pCodUserPlatafoma: WideString;
  pIdentificacaoBot: WideString): Boolean;
var
  cadMensageria: TCadMensageriaSemTemplateSemAnexo;
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
      cadMensageria := TCadMensageriaSemTemplateSemAnexo.Create;
      cadMensageria.cnpj := conf.cnpj;
      cadMensageria.origem := 'erp';
      cadMensageria.destino := 'bot';
      cadMensageria.tipo_tarefa := 'envio_mensagem';
      cadMensageria.assunto_mensagem := pAssunto;
      cadMensageria.mensagem := pMensagem;
      cadMensageria.perfil_pessoa := pTipoCliente;

      cadMensageria.plataforma_emp_id := pPlataforma;
      cadMensageria.cod_user_plataforma := pCodUserPlatafoma;
      if (trim(pAplicativo) = 'WHATSAPP') or (trim(pAplicativo) = 'TELEGRAM') then
        cadMensageria.ident_bot := pIdentificacaoBot;

      if pContatoAvulso then
        cadMensageria.tipo_envio := 'AVL';

      var useCase := api.CadMensageriaSemTemplateSemAnexo(cadMensageria);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Cadastrar mensageria sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
        if not silent then
          raise Exception.Create(useCase.resposta.Trim());

      Result := repo.CadMensagem(pCodUsuario, pCodCarta, pCodAplicativo, pCodPlataforma, pAssunto, cadMensageria, useCase);
    finally
      if Assigned(cadMensageria) then
        FreeAndNil(cadMensageria);
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
