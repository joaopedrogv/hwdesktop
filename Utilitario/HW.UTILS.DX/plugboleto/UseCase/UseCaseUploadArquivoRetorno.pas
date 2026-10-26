unit UseCaseUploadArquivoRetorno;

interface

uses
  BaseUseCasePlugBoleto,
  IdCoderMIME;

type
  TUseCaseUploadArquivoRetorno = class(TUseCaseBasePlugBoleto)
  public
    function Run(pCodConvenio: Integer; pDiretorioArquivo: string): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  PlugBoletoRepo,
  UseCaseConsultaBoletoIntegrado,
  ApiPlugBoleto,
  PlugBoletoModels,
  hw_utils,
  EncdDecd,
  System.Classes;

{ TUseCaseUploadArquivoRetorno }

function TUseCaseUploadArquivoRetorno.Run(pCodConvenio: Integer; pDiretorioArquivo: string): Boolean;
var
  arquivoDB: Conexao_OOP;
  params: TArray<string>;
  arq: TextFile;
  linha: string;
  Encoder : TIdEncoderMime;
  vStringList: TStringList;
  vapi_protocolo: string;
begin
  Result := False;
  try
    InitUseCase();

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para boletos não encontrada no Cadastro de API');

    arquivoDB      := repo.GetRetorno(pCodConvenio, pDiretorioArquivo);
    vapi_protocolo := arquivoDB.fstr('api_protocolo');

    if vapi_protocolo.Trim <> '' then
    begin
      var arquivoret := api.GetRetorno(vapi_protocolo);

      if Assigned(arquivoret) then
      begin
        if Assigned(arquivoret._dados) then
        begin
          if UpperCase(trim(arquivoret._dados.Situacao)) = 'FALHA' then
            vapi_protocolo := '';

          if UpperCase(trim(arquivoret._dados.Situacao)) <> 'FALHA' then
          begin
            if Assigned(arquivoret._dados.Titulos) then
            begin
              var vids := '';
              var vcount := 0;
              for var titulos in arquivoret._dados.Titulos  do
                if titulos.IdIntegracao.Trim <> '' then
                begin
                  vids := IfThen(vids.Trim <> '', vids + ',') + titulos.IdIntegracao;

                  vcount := vcount + 1;

                  if vcount >= 50 then
                  begin
                    var useCase := TUseCaseConsultaBoletoIntegrado.Create(Self.GetStrParamsUC, False);
                    if not useCase.AtualizaDadosRet(vids, vapi_protocolo, vcount) then
                      exit;
                    vids := '';
                    vcount := 0;
                  end;
                end;

                var useCase := TUseCaseConsultaBoletoIntegrado.Create(Self.GetStrParamsUC, False);
                if not useCase.AtualizaDadosRet(vids, vapi_protocolo, vcount) then
                  exit;
            end;

            if Assigned(arquivoret._dados.TitulosNaoConciliados) then
            begin
              if not repo.InserirAtualizarTitulosNaoConc(arquivoret._dados.TitulosNaoConciliados, pCodConvenio, vapi_protocolo) then
                exit;
            end;

            if not repo.AtualizarNumeroArquivoRet(arquivoret._dados.NumeroArquivo, pCodConvenio, vapi_protocolo) then
              exit;
          end;
        end;
      end;
    end;


    if vapi_protocolo.Trim = '' then
    begin
      vStringList := TStringList.Create;
      vStringList.Clear();

      AssignFile(arq, pDiretorioArquivo);

      Reset(arq);

      while (not eof(arq)) do
      begin
        readln(arq, linha);

        vStringList.Add(linha);
      end;
      CloseFile(arq);

      if Trim(vStringList.Text) = '' then
        raise Exception.Create('Arquivo informado sem conteúdo');

      try
        Encoder := TIdEncoderMIME.Create(Nil);
        var vConteudoArquivo := Encoder.EncodeString(vStringList.Text);

        var _dados := api.PostRetorno(vConteudoArquivo);
        if Assigned(_dados) then
        begin
          if Assigned(_dados.sucesso) then
          begin
            if _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
            begin
              if not repo.PostRetorno(_dados.sucesso, ExtractFileName(pDiretorioArquivo), vStringList.Text, pCodConvenio) then
                raise Exception.Create('Não foi possivel importar arquivo de retorno pela API. Consulte o log para mais detalhes')
            end
            else
            begin
              raise Exception.Create(_dados.sucesso._mensagem +
                ' ' + IfThen(_dados.sucesso._dados._campo.Trim <> '', _dados.sucesso._dados._campo) +
                ' ' + IfThen(_dados.sucesso._dados._erro.Trim <> '', _dados.sucesso._dados._erro));
            end;

            if _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
              if Assigned(_dados.sucesso._dados) then
              begin
                var _dadosret := _dados.sucesso._dados;

                var arquivoret := api.GetRetorno(_dadosret.protocolo);
                if Assigned(arquivoret) then
                  if Assigned(arquivoret._dados) then
                  begin
                    if Assigned(arquivoret._dados.Titulos) then
                    begin
                      for var titulos in arquivoret._dados.Titulos  do
                      begin
                        if titulos.IdIntegracao.Trim <> '' then
                        begin
                          var useCase := TUseCaseConsultaBoletoIntegrado.Create(Self.GetStrParamsUC, False);
                          if not useCase.AtualizaDadosRet(titulos.IdIntegracao, _dadosret.protocolo) then
                            exit;
                        end;
                      end;
                    end;
                    if Assigned(arquivoret._dados.TitulosNaoConciliados) then
                    begin
                      if not repo.InserirAtualizarTitulosNaoConc(arquivoret._dados.TitulosNaoConciliados, pCodConvenio, _dadosret.protocolo) then
                        exit;
                    end;

                    if not repo.AtualizarNumeroArquivoRet(arquivoret._dados.NumeroArquivo, pCodConvenio, _dadosret.protocolo) then
                      exit;
                  end;
              end;
          end
          else if Assigned(_dados.erro) then
          begin
            for var itemERRO in _dados.erro._dados do
              raise Exception.Create('Falha ao anexar arquivo de retorno' + sLineBreak + sLineBreak +
                IfThen(_dados.erro._mensagem.Trim <> '', _dados.erro._mensagem + sLineBreak, '') +
                IfThen(itemERRO._mensagem.Trim <> '', itemERRO._mensagem.Trim + sLineBreak, '') +
                IfThen(itemERRO._campo.Trim <> '', itemERRO._campo.Trim + sLineBreak, '') +
                IfThen(itemERRO._erro.Trim <> '', itemERRO._erro.Trim + sLineBreak, '') + sLineBreak +
                'Favor verificar antes de continuar');
          end;
        end;
      finally
        if Assigned(Encoder) then
          FreeAndNil(Encoder)
      end;
    end;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao anexar arquivo de retorno' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
