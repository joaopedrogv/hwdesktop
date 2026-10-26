unit UseCaseEnviarMensagemArquivo;

interface

uses
  BaseUseCaseKentro;

type

  TUseCaseEnviarMensagemArquivo = class(TUseCaseBaseKentro)
  public
    function Run(cod_empresa: Integer; fone: string; mensagem: string; arquivo: string): Boolean;
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

{ TUseCaseEnviarMensagemArquivo }

function TUseCaseEnviarMensagemArquivo.Run(cod_empresa: Integer; fone, mensagem,
  arquivo: string): Boolean;
var
  uploadKentro: TUploadKentro;
  mensagemArquivoKentro: TMensagemArquivoKentro;
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

    mensagemArquivoKentro := TMensagemArquivoKentro.Create;
    mensagemArquivoKentro.queueId := conf.queueId;
    mensagemArquivoKentro.apiKey := conf.chave;
    mensagemArquivoKentro.number := trim(fone);
    mensagemArquivoKentro.fileId := upload;
    mensagemArquivoKentro.text := mensagem;

    var dados := api.PostMensagemArquivo(mensagemArquivoKentro);
    if dados.message.ToUpper = 'SUCCESS' then
      Result := True
    else
      ShowErro('Erro ao enviar mensagem' + sLineBreak + sLineBreak + dados.message);
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowErro('Erro ao enviar mensagem e arquivo' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
