unit UseCaseLerMensageria;

interface

uses
  BaseUseCaseHwCloud, System.Classes, System.Generics.Collections, System.TypInfo;

type
  TUseCaseLerMensageria = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pCodMens: Integer;
      pPlataforma: WideString;
      pUuid: WideString): Boolean;
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
  config_sistema_class, System.JSON;

{ TUseCaseLerMensageria }

function TUseCaseLerMensageria.Run(
  pCodMens: Integer;
  pPlataforma: WideString;
  pUuid: WideString): Boolean;
var
  lerMensageria: TLerMensageria;
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
      lerMensageria := TLerMensageria.Create;
      lerMensageria.plataforma_emp_id := pPlataforma;
      lerMensageria.resumido := True;
      lerMensageria.cnpjempresa := conf.cnpj;
      lerMensageria.destino := 'erp';
      lerMensageria.uuid := pUuid;

      var useCase := api.LerMensageria(lerMensageria);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Ler mensageria sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
      begin
        if Assigned(useCase.resposta) then
          if not silent then
            raise Exception.Create(useCase.resposta[0].obs_envio.Trim());
      end;

      Result := repo.LerMensagem(pCodMens, lerMensageria, useCase);
    finally
      if Assigned(lerMensageria) then
        FreeAndNil(lerMensageria);
    end;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao ler mensageria' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
