unit UseCaseEnviarMensagem;

interface

uses
  BaseUseCaseKentro;

type

  TUseCaseEnviarMensagem = class(TUseCaseBaseKentro)
  public
    function Run(cod_empresa: Integer; fone: string; mensagem: string): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  KentroRepo,
  ApiKentro,
  KentroModels,
  hw_utils;

{ TUseCaseEnviarMensagem }

function TUseCaseEnviarMensagem.Run(cod_empresa: Integer; fone: string; mensagem: string): Boolean;
var
  mensagemKentro: TMensagemKentro;
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

    mensagemKentro := TMensagemKentro.Create;
    mensagemKentro.queueId := conf.queueId;
    mensagemKentro.apiKey := conf.chave;
    mensagemKentro.number := trim(fone);
    mensagemKentro.text := trim(mensagem);

    var dados := api.PostMensagem(mensagemKentro);
    if dados.message.ToUpper = 'SUCCESS' then
      Result := True
    else
      ShowErro('Erro ao enviar mensagem' + sLineBreak + sLineBreak + dados.message);
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowErro('Erro ao enviar mensagem' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
