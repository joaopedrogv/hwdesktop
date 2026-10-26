unit UseCaseCadMensageriaComTemplateComAnexo;

interface

uses
  BaseUseCaseHwCloud, System.Classes;

type
  TUseCaseCadMensageriaComTemplateComAnexo = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pContatoAvulso: Boolean;
      pCodUsuario: Integer;
      pAssunto: WideString;
      pMensagem: WideString;
      pTemplate: WideString;
      pCodCarta: Integer;
      pCodAplicativo: Integer;
      pAplicativo: WideString;
      pCodPlataforma: Integer;
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
  System.JSON,
  System.Zip,
  HwCloudRepo,
  ApiHwCloud,
  HwCloudModels,
  hw_utils,
  hw_win_utils,
  config_sistema_class,
  REST.Client,
  REST.Types,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.Net.Mime,
  System.Generics.Collections;

{ TUseCaseCadMensageriaComTemplateComAnexo }

function TUseCaseCadMensageriaComTemplateComAnexo.Run(
  pContatoAvulso: Boolean;
  pCodUsuario: Integer;
  pAssunto: WideString;
  pMensagem: WideString;
  pTemplate: WideString;
  pCodCarta: Integer;
  pCodAplicativo: Integer;
  pAplicativo: WideString;
  pCodPlataforma: Integer;
  pPlataforma: WideString;
  pTipoCliente: WideString;
  pCodUserPlatafoma: WideString;
  pIdentificacaoBot: WideString;
  pVariaveisTemplate: array of WideString;
  pArquivos: array of WideString;
  pUnicoAnexoPorMens: Boolean): Boolean;
var
  item: TItensComAnexo;
  cadMensageria: TCadMensageriaComTemplateComAnexo;
  I: Integer;
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
      cadMensageria := TCadMensageriaComTemplateComAnexo.Create;
      cadMensageria.cnpj := conf.cnpj;
      cadMensageria.origem := 'erp';
      cadMensageria.destino := 'bot';
      cadMensageria.tipo_tarefa := 'envio_mensagem';
      cadMensageria.assunto_mensagem := pAssunto;
      cadMensageria.mensagem := '.';
      cadMensageria.perfil_pessoa := pTipoCliente;

      cadMensageria.plataforma_emp_id := pPlataforma;
      cadMensageria.cod_user_plataforma := pCodUserPlatafoma;
      if (trim(pAplicativo) = 'WHATSAPP') or (trim(pAplicativo) = 'TELEGRAM') then
        cadMensageria.ident_bot := pIdentificacaoBot;

      for I := 0 to Length(pArquivos) - 1 do
      begin
        var arquivo := getCampoPipe(pArquivos[I], 4);

        item := TItensComAnexo.Create;
        item.nome_arquivo := ExtractFileName(arquivo);
        item.mime_conteudo := GetFileMimeType(arquivo);
        item.tipo_documento := getCampoPipe(pArquivos[I], 2);
        item.num_doc := getCampoPipe(pArquivos[I], 1);
        item.valor_doc := StrToFloat(getCampoPipe(pArquivos[I], 3));
        item.data_documento := FormatDateTime('yyyy-mm-dd', Date);
        item.data_vencimento := FormatDateTime('yyyy-mm-dd', Date);
        item.conteudo_base64 := TNetEncoding.Base64.Encode(arquivo);

        cadMensageria.itens := cadMensageria.itens + [item];
      end;

      cadMensageria.template_platenvio := pTemplate;

      if pContatoAvulso then
        cadMensageria.tipo_envio := 'AVL';

      for I := 0 to Length(pVariaveisTemplate) - 1 do
        cadMensageria.variaveis_template.Add(getCampoPipe(pVariaveisTemplate[I], 1), getCampoPipe(pVariaveisTemplate[I], 2));

      var useCase := api.CadMensageriaComTemplateComAnexo(cadMensageria);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Cadastrar mensageria sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
        if not silent then
          raise Exception.Create(useCase.resposta.Trim());

      Result := repo.CadMensagem(pCodUsuario, pCodCarta, pCodAplicativo, pCodPlataforma, pAssunto, pMensagem, cadMensageria, useCase);
    finally
      if Assigned(item) then
        FreeAndNil(item);
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

