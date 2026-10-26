unit UseCaseEnviarArquivo;

interface

uses
  BaseUseCaseKentro;

type

  TUseCaseEnviarArquivo = class(TUseCaseBaseKentro)
  public
    function Run(cod_empresa: Integer; fone: string; arquivo: string): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  hw_win_utils,
  KentroRepo,
  ApiKentro,
  KentroModels,
  hw_utils;

{ TUseCaseEnviarArquivo }

function TUseCaseEnviarArquivo.Run(cod_empresa: Integer; fone: string; arquivo: string): Boolean;
var
  uploadKentro: TUploadKentro;
  arquivoKentro: TArquivoKentro;
begin
  Result := False;

  try
    InitUseCase();

    repo := TKentroRepoSingleton.GetInstance();
    repo.CodEmpresa := cod_empresa;

    api := TApiKentroSingleton.GetInstance();

    api.Api.HideProtocol := False;

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para kentro não encontrada no Cadastro de API');

    var base64 := Base64Helper.EncodeFile(trim(arquivo));
    var tipoarq := GetFileMimeType(trim(arquivo));

    uploadKentro := TUploadKentro.Create;
    uploadKentro.queueId := conf.queueId;
    uploadKentro.apiKey := conf.chave;
    uploadKentro.mimeType := tipoarq;
    uploadKentro.fileName := ExtractFileName(arquivo);
    uploadKentro.data := base64;
    uploadKentro.saveToGallery := False;
    uploadKentro.title := '';

    var upload := api.PostUploadArquivo(uploadKentro);
    if upload <= 0 then
    begin
      Result := False;
      Exit;
    end;

    arquivoKentro := TArquivoKentro.Create;
    arquivoKentro.queueId := conf.queueId;
    arquivoKentro.apiKey := conf.chave;
    arquivoKentro.number := trim(fone);
    arquivoKentro.fileId := upload;

    var dados := api.PostArquivo(arquivoKentro);
    if dados.message.ToUpper = 'SUCCESS' then
      Result := True
    else
      ShowErro('Erro ao enviar mensagem' + sLineBreak + sLineBreak + dados.message);
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowErro('Erro ao enviar arquivo' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
