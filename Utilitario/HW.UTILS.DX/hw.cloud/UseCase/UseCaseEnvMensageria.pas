unit UseCaseEnvMensageria;

interface

uses
  BaseUseCaseHwCloud, System.Classes, System.Generics.Collections, System.TypInfo,
  UseCaseCadEmpresa, UseCaseCadPessoa, UseCaseCadContato, UseCaseCadMensageria, uClasseTagMacro;

type
  TUseCaseEnvMensageria = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pParamsList: WideString;
      pCodUsuario: Integer;
      pCodCliente: Integer;
      pTipoCliente: WideString;
      pTipoOp: WideString;
      pCodAplicativo: Integer;
      pIdentificacao: WideString;
      pContato: WideString;
      pContatoAvulso: Boolean;
      pNdoc: WideString;
      pTipoDoc: WideString;
      pOrigem: WideString;
      pUnicoArquivoCompactado: Boolean;
      pGerarLinkArquivo: Boolean;
      pAnexos: WideString;
      pUnicoAnexoPorMens: Boolean): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.NetEncoding,
  System.JSON,
  HwCloudRepo,
  ApiHwCloud,
  HwCloudModels,
  hw_utils,
  hw_win_utils,
  hw_jsondx,
  config_sistema_class,
  REST.Client,
  REST.Json,
  REST.Types,
  System.Net.HttpClient,
  System.Net.URLClient,
  System.Net.HttpClientComponent,
  System.Net.Mime,
  System.Zip;

{ TUseCaseEnvMensageria }

function TUseCaseEnvMensageria.Run(
  pParamsList: WideString;
  pCodUsuario: Integer;
  pCodCliente: Integer;
  pTipoCliente: WideString;
  pTipoOp: WideString;
  pCodAplicativo: Integer;
  pIdentificacao: WideString;
  pContato: WideString;
  pContatoAvulso: Boolean;
  pNdoc: WideString;
  pTipoDoc: WideString;
  pOrigem: WideString;
  pUnicoArquivoCompactado: Boolean;
  pGerarLinkArquivo: Boolean;
  pAnexos: WideString;
  pUnicoAnexoPorMens: Boolean): Boolean;
var
  useCaseEmpresa: TUseCaseCadEmpresa;
  useCasePessoa: TUseCaseCadPessoa;
  useCaseContato: TUseCaseCadContato;
  useCaseMensageria: TUseCaseCadMensageria;
  vassunto: string;
  vmensagem: string;
  vtemplate: string;
  varquivos: TArray<WideString>;
  vvariaveis: TArray<WideString>;
  vStringListArquivos, vStringListDelArquivo: TStringList;
  vTagMacro: TTagMacro;
  vAplicativo: string;
  I: Integer;

  vUrlCompleta, vUrlAnexos, vUrl, vChave, vCNPJ, vArquivo: string;
  Zip: TZipFile;
  vLink: TArray<string>;
  HTTPClient: TNetHTTPClient;
  MultipartData: TMultipartFormData;
  Response: IHTTPResponse;
begin
  try
    try
      InitUseCase;

      vUrlCompleta := '';
      vUrlAnexos   := '';
      vUrl         := '';
      vChave       := '';
      vCNPJ        := '';
      vArquivo     := '';

      vTagMacro := TTagMacro.Create;
      repo := THwCloudRepoSingleton.GetInstance();
      api := TApiHwCloudSingleton.GetInstance();

      var conf := repo.GetConfigApi(CONF_API);

      if conf.empresaId <= 0 then
        if not silent then
          raise Exception.Create('Configuração para hwcloud não encontrada no Cadastro de API');

      vStringListArquivos   := TStringList.Create;
      vStringListDelArquivo := TStringList.Create;

      vStringListArquivos.Clear;
      vStringListDelArquivo.Clear;

      if trim(pAnexos) <> '' then
        vStringListArquivos.Text   := pAnexos;

      vAplicativo := repo.GetAplicativo(pCodAplicativo);
 
      if (pGerarLinkArquivo) and (vStringListArquivos.Count > 0) then
      begin
        SetLength(varquivos, 0);

        if vStringListArquivos.Count > 1 then
        begin
          Zip := TZipFile.Create;

          // Cria o arquivo ZIP e define o modo de compressão
          vArquivo := GetFileNameRandom('', 'zip');
          Zip.Open(vArquivo, zmWrite);
          try
            for I := 0 to vStringListArquivos.Count - 1 do
            begin
              // Adiciona o arquivo ao ZIP
              // O segundo parâmetro é o nome que o arquivo terá dentro do pacote
              Zip.Add(vStringListArquivos[I]);
            end;
          finally
            Zip.Free;
          end;

          vStringListDelArquivo.Add(vArquivo);
        end
        else
          vArquivo := vStringListArquivos[0];

        if not FileExists(vArquivo) then
        begin
          if (pGerarLinkArquivo) and (vStringListArquivos.Count > 0) then
            raise Exception.Create('Falha ao compactar anexo(s)')
          else
            raise Exception.Create('Falha ao anexar arquivo(s)');
        end
        else
        begin
          vUrl := 'https://www.hdeskpro.com.br/webapihdesk/api';
          vChave := '6LfwACkTAAAAANgr2YY8hduMMNSftVwTJIOA59IW';
          vCNPJ := '99999999999999';

          // 1. Monta a URL completa com a rota e os parâmetros de query string
          vUrlCompleta := vUrl + '/arquivos/upload?chave=' + vChave + '&cnpj=' + vCNPJ;

          // 2. Cria o cliente HTTP
          HTTPClient := TNetHTTPClient.Create(nil);
          // O TMultipartFormData gerencia os dados do arquivo que serão enviados no Body
          MultipartData := TMultipartFormData.Create;
          try
            // Configura o Timeout. No TNetHTTPClient o padrão 0 já significa sem limite (infinito)
            HTTPClient.ConnectionTimeout := 0;
            HTTPClient.ResponseTimeout := 0;

            // 3. Adiciona o arquivo físico ao multipart
            // O parâmetro 'file' é o nome do campo esperado pela API (Name do C#)
            MultipartData.AddFile('file', vArquivo);

            // 4. Executa a requisição POST enviando os dados do arquivo
            Response := HTTPClient.Post(vUrlCompleta, MultipartData);

            // 5. Exibe o resultado no console (Equivalente ao Console.WriteLine)
            if Response.StatusCode = 200 then
            begin
              vLink := TJsonUtilsDX.DeserializeStringArray(Response.ContentAsString);

              vUrlAnexos := vUrl + '/' + vLink[0];
            end
            else
              raise Exception.Create('Falha ao gerar link do(s) anexo(s)');
          finally
            MultipartData.Free;
            HTTPClient.Free;
          end;
        end;
      end
      else if ((pUnicoArquivoCompactado) and (vStringListArquivos.Count > 0))
        or ((trim(vAplicativo) = 'WHATSAPP') and (vStringListArquivos.Count > 0)) then
      begin
        SetLength(varquivos, 1);

        if vStringListArquivos.Count > 1 then
        begin
          Zip := TZipFile.Create;

          // Cria o arquivo ZIP e define o modo de compressão
          vArquivo := GetFileNameRandom('', 'zip');
          Zip.Open(vArquivo, zmWrite);
          try
            for I := 0 to vStringListArquivos.Count - 1 do
            begin
              // Adiciona o arquivo ao ZIP
              // O segundo parâmetro é o nome que o arquivo terá dentro do pacote
              Zip.Add(vStringListArquivos[I]);
            end;
          finally
            Zip.Free;
          end;

          vStringListDelArquivo.Add(vArquivo);
        end
        else
          vArquivo := vStringListArquivos[0];

        if not FileExists(vArquivo) then
        begin
          if (pUnicoArquivoCompactado) and (vStringListArquivos.Count > 0) then
            raise Exception.Create('Falha ao compactar anexo(s)')
          else
            raise Exception.Create('Falha ao anexar arquivo(s)');
        end
        else
        begin
          varquivos[0] :=
            trim(pNdoc) + '|' +
            trim(pTipoDoc) + '|' +
            '0|' +
            vArquivo + '|';
        end;
      end
      else if vStringListArquivos.Count > 0 then
      begin
        SetLength(varquivos, vStringListArquivos.Count);

        for I := 0 to vStringListArquivos.Count - 1 do
        begin
          varquivos[I] :=
            trim(pNdoc) + '|' +
            trim(pTipoDoc) + '|' +
            '0|' +
            vStringListArquivos[I] + '|';
        end;
      end;

      SetLength(vvariaveis, 0);

      useCaseEmpresa := TUseCaseCadEmpresa.Create(pParamsList);
      Result := useCaseEmpresa.Run(
        1,
        pTipoOp);

      if not Result then
        Exit;

      // Apagar contatos colaboradores
      var contatosColaboradorPlataforma :=
        repo.GetContatoColaboradoresApagar;

      for var contato in contatosColaboradorPlataforma.Contatos do
      begin
        if Assigned(contato) then
        begin
          useCaseContato := TUseCaseCadContato.Create(pParamsList);
          Result := useCaseContato.Run(
            contato.id,
            contato.cod_cliente,
            0,
            contato.plataforma,
            contato.identificador,
            contato.contato,
            contato.tipo_pessoa,
            'D');

          if Result then
          begin
            if not repo.ApagarContato(
              contato.id) then
                if not silent then
                  raise Exception.Create('Falha ao atualizar contatos');
          end;
        end;
      end;

      if pCodCliente > 0 then
      begin
        useCasePessoa := TUseCaseCadPessoa.Create(pParamsList);
        Result := useCasePessoa.Run(
          pCodCliente,
          'CE',
          1,
          pTipoOp);

        if not Result then
          Exit;

        // Apagar contatos Cliente
        var contatosClientePlataforma :=
          repo.GetContatoClienteApagar(pCodCliente);

        for var contato in contatosClientePlataforma.Contatos do
        begin
          if Assigned(contato) then
          begin
            useCaseContato := TUseCaseCadContato.Create(pParamsList);
            Result := useCaseContato.Run(
              contato.id,
              contato.cod_cliente,
              0,
              contato.plataforma,
              contato.identificador,
              contato.contato,
              contato.tipo_pessoa,
              'D');

            if not Result then
              Exit;

            if not repo.ApagarContato(
              contato.id) then
                if not silent then
                  raise Exception.Create('Falha ao atualizar contatos');
          end;
        end;
      end;

      if (pContatoAvulso) or (pCodCliente <= 0) then
      begin
        if conf.cod_tipo_contato_padrao <= 0 then
          raise Exception.Create('Código tipo de contato padrão não informado nas configurações');

        if not repo.GetTipoContato(conf.cod_tipo_contato_padrao) then
          raise Exception.Create('Código tipo de contato padrão informado nas configurações não encontrado');

        var contatosClientePlataforma :=
          repo.GetContatoClienteAvulso(
            pNdoc,
            pTipoDoc,
            pCodAplicativo,
            pIdentificacao,
            pContato,
            pOrigem,
            conf.cod_tipo_contato_padrao);

        for var contato in contatosClientePlataforma.Contatos do
        begin
          if Assigned(contato) then
          begin
            if ((trim(contato.aplicativo) = 'WHATSAPP') or (trim(contato.aplicativo) = 'WHATSAPP')) and (trim(contato.identificador_bot) = '') then
              raise Exception.Create('Identificador Bot (Plataforma) não informado: ' + #13 + #13 +
                'Aplicativo: ' + contato.aplicativo + #13 +
                'Plataforma: ' + contato.plataforma + #13 + #13 +
                'Favor verificar antes de continuar');

            if (trim(contato.identificador) = '') then
              raise Exception.Create('Identificador (Email / WhatsApp/ Telegram) não informado');

            if contato.cod_carta <= 0 then
              if not silent then
                raise Exception.Create('Modelo de notificação não encontrado');

            if not repo.VerificarModeloNotificacao(
              contato.cod_carta,
              vassunto,
              vmensagem,
              vtemplate) then
                if not silent then
                  raise Exception.Create('Modelo de notificação não encontrado');

            if (vassunto.Trim() = '') then
              if not silent then
                raise Exception.Create('Modelo de notificação sem assunto');

            if (vmensagem.Trim() = '') then
              if not silent then
                raise Exception.Create('Modelo de notificação sem mensagem');

            if contato.usar_template = 'S' then
              if (vtemplate.Trim() = '') then
                if not silent then
                  raise Exception.Create('Modelo de notificação sem template');

            vassunto := vTagMacro._TrocaTAGsMacro(
              pOrigem,
              contato.cod_carta,
              repo.CodEmpresa,
              pCodCliente,
              pNdoc,
              pTipoDoc,
              0,
              0,
              '',
              False,
              0,
              'DESCRICAO',
              contato.contato,
              contato.identificador,
              contato.aplicativo,
              contato.plataforma,
              vUrlAnexos
            );

            vmensagem := vTagMacro._TrocaTAGsMacro(
              pOrigem,
              contato.cod_carta,
              repo.CodEmpresa,
              pCodCliente,
              pNdoc,
              pTipoDoc,
              0,
              0,
              '',
              False,
              0,
              'DADOS_CARTA',
              contato.contato,
              contato.identificador,
              contato.aplicativo,
              contato.plataforma,
              vUrlAnexos
            );

            if (vtemplate.Trim() <> '') then
            begin
              vvariaveis := TArray<WideString>(
                vTagMacro.retornaVariaveisTemplate(
                  pOrigem,
                  contato.cod_carta,
                  repo.CodEmpresa,
                  pCodCliente,
                  pNdoc,
                  pTipoDoc,
                  0,
                  0,
                  '',
                  False,
                  0,
                  'DADOS_CARTA',
                  contato.contato,
                  contato.identificador,
                  contato.aplicativo,
                  contato.plataforma,
                  vUrlAnexos
                )
              );
            end;

            useCaseMensageria := TUseCaseCadMensageria.Create(pParamsList);
            Result := useCaseMensageria.Run(
              pParamsList,
              pContatoAvulso,
              pCodUsuario,
              vassunto,
              vmensagem,
              vtemplate,
              contato.cod_carta,
              contato.id_msg_aplicativo,
              contato.id_msg_plataforma,
              contato.aplicativo,
              contato.plataforma,
              contato.tipo_pessoa,
              contato.identificador,
              contato.identificador_bot,
              vvariaveis,
              varquivos,
              pUnicoAnexoPorMens);
          end;
        end;
      end
      else
      begin
        var contatosClientePlataforma :=
          repo.GetContatoClientePlataforma(
            pCodCliente,
            pNdoc,
            pTipoDoc,
            pCodAplicativo,
            pIdentificacao,
            pContato,
            pOrigem,
            conf.somente_contatos_aceitos);

        for var contato in contatosClientePlataforma.Contatos do
        begin
          if Assigned(contato) then
          begin
            useCaseContato := TUseCaseCadContato.Create(pParamsList);
            Result := useCaseContato.Run(
              contato.id,
              contato.cod_cliente,
              contato.ativo,
              contato.plataforma,
              contato.identificador,
              contato.contato,
              contato.tipo_pessoa,
              pTipoOp);

            if not Result then
              Exit;

            if ((trim(contato.aplicativo) = 'WHATSAPP') or (trim(contato.aplicativo) = 'WHATSAPP')) and (trim(contato.identificador_bot) = '') then
              raise Exception.Create('Identificador Bot (Plataforma) não encontrado: ' + #13 + #13 +
                'Aplicativo: ' + contato.aplicativo + #13 +
                'Plataforma: ' + contato.plataforma + #13 + #13 +
                'Favor verificar antes de continuar');

            if (trim(contato.identificador) = '') then
              raise Exception.Create('Identificador (Email / WhatsApp/ Telegram) não informado');

            if contato.cod_carta <= 0 then
              if not silent then
                raise Exception.Create('Modelo de notificação não encontrado');

            if not repo.VerificarModeloNotificacao(
              contato.cod_carta,
              vassunto,
              vmensagem,
              vtemplate) then
                if not silent then
                  raise Exception.Create('Modelo de notificação não encontrado');

            if (vassunto.Trim() = '') then
              if not silent then
                raise Exception.Create('Modelo de notificação sem assunto');

            if (vmensagem.Trim() = '') then
              if not silent then
                raise Exception.Create('Modelo de notificação sem mensagem');

            if contato.usar_template = 'S' then
              if (vtemplate.Trim() = '') then
                if not silent then
                  raise Exception.Create('Modelo de notificação sem template');

            vassunto := vTagMacro._TrocaTAGsMacro(
              pOrigem,
              contato.cod_carta,
              repo.CodEmpresa,
              pCodCliente,
              pNdoc,
              pTipoDoc,
              0,
              0,
              '',
              False,
              0,
              'DESCRICAO',
              contato.contato,
              contato.identificador,
              contato.aplicativo,
              contato.plataforma,
              vUrlAnexos
            );

            vmensagem := vTagMacro._TrocaTAGsMacro(
              pOrigem,
              contato.cod_carta,
              repo.CodEmpresa,
              pCodCliente,
              pNdoc,
              pTipoDoc,
              0,
              0,
              '',
              False,
              0,
              'DADOS_CARTA',
              contato.contato,
              contato.identificador,
              contato.aplicativo,
              contato.plataforma,
              vUrlAnexos
            );

            if (vtemplate.Trim() <> '') then
            begin
              vvariaveis := TArray<WideString>(
                vTagMacro.retornaVariaveisTemplate(
                  pOrigem,
                  contato.cod_carta,
                  repo.CodEmpresa,
                  pCodCliente,
                  pNdoc,
                  pTipoDoc,
                  0,
                  0,
                  '',
                  False,
                  0,
                  'DADOS_CARTA',
                  contato.contato,
                  contato.identificador,
                  contato.aplicativo,
                  contato.plataforma,
                  vUrlAnexos
                )
              );
            end;

            useCaseMensageria := TUseCaseCadMensageria.Create(pParamsList);
            Result := useCaseMensageria.Run(
              pParamsList,
              pContatoAvulso,
              pCodUsuario,
              vassunto,
              vmensagem,
              vtemplate,
              contato.cod_carta,
              contato.id_msg_aplicativo,
              contato.id_msg_plataforma,
              contato.aplicativo,
              contato.plataforma,
              contato.tipo_pessoa,
              contato.identificador,
              contato.identificador_bot,
              vvariaveis,
              varquivos,
              pUnicoAnexoPorMens);
          end;
        end;
      end;

    finally
      for I := 0 to vStringListDelArquivo.Count - 1 do
        if FileExists(vStringListDelArquivo[I]) then
          DeleteFile(vStringListDelArquivo[I]);

      if Assigned(vStringListArquivos) then
        FreeAndNil(vStringListArquivos);
      if Assigned(vStringListDelArquivo) then
        FreeAndNil(vStringListDelArquivo);
      if Assigned(vTagMacro) then
        FreeAndNil(vTagMacro);
      if Assigned(useCaseEmpresa) then
        useCaseEmpresa.Free;
      if Assigned(useCasePessoa) then
        useCasePessoa.Free;
      if Assigned(useCaseContato) then
        useCaseContato.Free;
      if Assigned(useCaseMensageria) then
        useCaseMensageria.Free;
    end;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao enviar mensagens' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
