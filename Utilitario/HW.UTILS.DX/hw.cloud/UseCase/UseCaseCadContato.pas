unit UseCaseCadContato;

interface

uses
   BaseUseCaseHwCloud, System.Classes, System.Generics.Collections;

type

  TUseCaseCadContato = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pIdContato: Integer;
      pCodCliente: Integer;
      pAtivo: Integer;
      pPlataforma: WideString;
      pCodUserPlataforma: WideString;
      pContato: WideString;
      pTipoCliente: WideString;
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

{ TUseCaseCadContato }

function TUseCaseCadContato.Run(
  pIdContato: Integer;
  pCodCliente: Integer;
  pAtivo: Integer;
  pPlataforma: WideString;
  pCodUserPlataforma: WideString;
  pContato: WideString;
  pTipoCliente: WideString;
  pTipoOp: WideString): Boolean;
var
  cadContato: TCadContato;
  dados: TArray<TDadosContato>;
  dado: TDadosContato;
  grupo: TArray<string>;
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

    var contato := repo.GetContato(pIdContato, pTipoCliente);
    if not Assigned(contato) then
      Exit;

    if (pTipoOp = 'I') and (contato.sinc_hwcloud = 'S') then
    begin
      Result := True;
      Exit;
    end;

    try
      cadContato := TCadContato.Create;
      cadContato.cnpj := conf.cnpj;
      cadContato.action := 'crud';
      cadContato.tpdados := 'usuario_pessoas_emp';
      cadContato.usa_hook := 'N';
      cadContato.tpop := pTipoOp;

      dado := TDadosContato.Create;
      dado.cdpessoa := pCodCliente.ToString();
      dado.tipo_pessoa := pTipoCliente;
      dado.plataforma_emp_id := pPlataforma;
      dado.cod_user_plataforma := pCodUserPlataforma;

      if pTipoOp = 'I' then
      begin
        SetLength(grupo, IfThen((trim(conf.cnpj) = '03530705000109') and (trim(dado.tipo_pessoa) = 'CI'), 2, 1));
        grupo[0] := 'TODOS';

        if (trim(conf.cnpj) = '03530705000109') and (trim(dado.tipo_pessoa) = 'CI') then
          grupo[1] := 'DESENVOLVIMENTO';

        dado.grupo_usuario.grupos := grupo;

        dado.user_id := pContato;
        dado.opt_in_whatscloud := 0;
        dado.envia_notificacao := 0;
        dado.ativo := pAtivo;
      end
      else
        dado.ativo := 0;

      cadContato.dados := cadContato.dados + [dado];

      var useCase := api.CadPlataformaUsuarioPorCliente(cadContato);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Cadastrar plataforma usuario por cliente sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
        if not silent then
          raise Exception.Create(useCase.resposta.Trim());

      if not repo.SincHwCloudContato(pIdContato) then
        Exit;

      Result := True;

    finally
      if Assigned(grupo) then
        grupo := nil;
      if Assigned(dado) then
        FreeAndNil(dado);
      if Assigned(cadContato) then
        FreeAndNil(cadContato);
    end;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao cadastrar plataforma usuario por cliente ' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
