unit UseCaseAutenticacao;

interface

uses
  BaseUseCaseSuzuki;

type

  TUseCaseAutenticacao = class(TUseCaseBaseSuzuki)
  public
    function Run(pExibirMens: Boolean): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  SuzukiRepo,
  ApiSuzuki,
  SuzukiModels,
  hw_utils, hw_win_utils, System.Classes;

{ TUseCaseAutenticacao }

function TUseCaseAutenticacao.Run(pExibirMens: Boolean): Boolean;
var
  autenticacao: TAutenticacao;
  vErros: TStringList;
begin
  Result := False;
  try
    InitUseCase();

    repo := TSuzukiRepoSingleton.GetInstance();
    api := TApiSuzukiSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para API Suzuki não encontrada no Cadastro de API');

    autenticacao := TAutenticacao.Create;
    autenticacao.Usuario := conf.usuario;
    autenticacao.Senha   := conf.senha;
    autenticacao.Cliente := CLIENTE;

    var _autentication := api.PostAutenticacao(autenticacao);

    if _autentication.authenticated then
    begin
      repo.AtualizarAcessToken(_autentication.accessToken);
      if pExibirMens then
        ShowAtencao('Autenticação realizada com sucesso');
      Result := True;
    end
    else
    begin
      var erros := _autentication.Errors;

      if Assigned(erros) then
        if Length(erros) > 0 then
        begin
          try
            vErros := TStringList.Create;
            vErros.Clear;

            vErros.Add(erros[0].PropertyName);
            vErros.Add('');
            vErros.Add(erros[0].ErrorMessage);
            vErros.Add('');
            vErros.Add(erros[0].ErrorCode);
            ShowErro(vErros.Text);
          finally
            if Assigned(vErros) then
              vErros.Free;
          end;
        end;
    end;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao autenticar' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
