unit UseCaseCadUsuarioSenha;

interface

uses
   BaseUseCaseHwCloud, System.Classes, System.Generics.Collections;

type

  TUseCaseCadUsuarioSenha = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pUsuario: WideString;
      pSenha: WideString;
      pCdPessoa: WideString;
      pTpPessoa: WideString;
      pContato: WideString;
      pTipoOp: WideString): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.NetEncoding,
  System.Net.Mime,
  HwCloudRepo,
  ApiHwCloud,
  HwCloudModels,
  hw_utils,
  hw_win_utils,
  config_sistema_class;

{ TUseCaseCadEmpresa }

function TUseCaseCadUsuarioSenha.Run(
  pUsuario: WideString;
  pSenha: WideString;
  pCdPessoa: WideString;
  pTpPessoa: WideString;
  pContato: WideString;
  pTipoOp: WideString): Boolean;
var
  cadUsuarioSenha: TCadUsuarioSenha;
  dado: TDadosUsuarioSenha;
begin
  Result := False;

  if trim(pUsuario) = '' then
    raise Exception.Create('Usuario não informado');

  if trim(pSenha) = '' then
    raise Exception.Create('Senha não informada');

  try
    InitUseCase;

    repo := THwCloudRepoSingleton.GetInstance();
    api := TApiHwCloudSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      if not silent then
        raise Exception.Create('Configuração para hwcloud não encontrada no Cadastro de API');

    try
      cadUsuarioSenha := TCadUsuarioSenha.Create;
      cadUsuarioSenha.cnpj := conf.cnpj;
      cadUsuarioSenha.action := 'crud';
      cadUsuarioSenha.tpdados := 'usuario_senha';
      cadUsuarioSenha.tpop := pTipoOp;

      dado := TDadosUsuarioSenha.Create;
      dado.usuario := pUsuario;
      dado.senha := pSenha;
      dado.cdpessoa := pCdPessoa;
      dado.tipo_pessoa := pTpPessoa;
      dado.contato := pContato;

      cadUsuarioSenha.dados := cadUsuarioSenha.dados + [dado];

      var useCase := api.CadUsuarioSenha(cadUsuarioSenha);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Cadastrar usuario / senha sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
        if not silent then
          raise Exception.Create(useCase.resposta.Trim());

      Result := True;
    finally
      if Assigned(dado) then
        FreeAndNil(dado);
      if Assigned(cadUsuarioSenha) then
        FreeAndNil(cadUsuarioSenha);
    end;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao cadastrar usuario / senha' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
