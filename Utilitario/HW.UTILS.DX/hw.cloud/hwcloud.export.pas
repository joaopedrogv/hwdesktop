unit hwcloud.export;

interface

implementation

uses
  System.Generics.Collections,
  UseCaseCadEmpresa,
  UseCaseCadPessoa,
  UseCaseCadUsuarioSenha,
  UseCaseCadContato,
  UseCaseCadMensageria,
  UseCaseUpdateMensageria,
  UseCaseLerMensageria,
  UseCaseEnvMensageria,
  UseCaseBuscarConfig,
  UseCaseBuscarCustos,
  System.SysUtils;

function hwc_cad_empresa(
  AparamsList: WideString;
  Aativo: Integer;
  Atipoop: WideString): Boolean; stdcall;
begin
  var useCase := TUseCaseCadEmpresa.Create(AparamsList);
  try
    Result :=
      useCase.Run(
        Aativo,
        Atipoop);
  finally
    useCase.Free;
  end;
end;

function hwc_cad_pessoa(
  AparamsList: WideString;
  Acodcliente: Integer;
  Atipocliente: WideString;
  Aativo: Integer;
  Atipoop: WideString): Boolean; stdcall;
begin
  var useCase := TUseCaseCadPessoa.Create(AparamsList);
  try
    Result :=
      useCase.Run(
        Acodcliente,
        Atipocliente,
        Aativo,
        Atipoop);
  finally
    useCase.Free;
  end;
end;

function hwc_cad_usuario_senha(
  AparamsList: WideString;
  Ausuario: WideString;
  Asenha: WideString;
  Acdpessoa: WideString;
  Atipopessoa: WideString;
  Acontato: WideString;
  Atipoop: WideString): Boolean; stdcall;
begin
  var useCase := TUseCaseCadUsuarioSenha.Create(AparamsList);
  try
    Result :=
      useCase.Run(
        Ausuario,
        Asenha,
        Acdpessoa,
        Atipopessoa,
        Acontato,
        Atipoop);
  finally
    useCase.Free;
  end;
end;

function hwc_cad_contato(
  AparamsList: WideString;
  Aidcontato: Integer;
  Acodcliente: Integer;
  Aativo: Integer;
  Aplataforma: WideString;
  Acoduserplataforma: WideString;
  Acontato: WideString;
  Atipocliente: WideString;
  Atipoop: WideString): Boolean; stdcall;
begin
  var useCase := TUseCaseCadContato.Create(AparamsList);
  try
    Result :=
      useCase.Run(
        Aidcontato,
        Acodcliente,
        Aativo,
        Aplataforma,
        Acoduserplataforma,
        Acontato,
        Atipocliente,
        Atipoop);
  finally
    useCase.Free;
  end;
end;

function hwc_cad_mensageria(
  AparamsList: WideString;
  Acontatoavulso: Boolean;
  Acodusuario: Integer;
  Aassunto: WideString;
  Amensgem: WideString;
  Atemplate: WideString;
  Acodcarta: Integer;
  Acodaplicativo: Integer;
  Acodplataforma: Integer;
  Aaplicativo: WideString;
  Aplataforma: WideString;
  Atipocliente: WideString;
  Acoduserplataforma: WideString;
  Aidentbot: WideString;
  Avariaveis: array of WideString;
  Aarquivos: array of WideString;
  Aunicoanexopormens: Boolean): Boolean; stdcall;
begin
  var useCase := TUseCaseCadMensageria.Create(AparamsList);
  try
    Result :=
      useCase.Run(
        AparamsList,
        Acontatoavulso,
        Acodusuario,
        Aassunto,
        Amensgem,
        Atemplate,
        Acodcarta,
        Acodaplicativo,
        Acodplataforma,
        Aaplicativo,
        Aplataforma,
        Atipocliente,
        Acoduserplataforma,
        Aidentbot,
        Avariaveis,
        Aarquivos,
        Aunicoanexopormens);
  finally
    useCase.Free;
  end;
end;


function hwc_update_mensageria(
  AparamsList: WideString;
  AcodMensagem: Integer;
  Aorigem: WideString;
  Astatus: WideString;
  Auuid: WideString): Boolean; stdcall;
begin
  var useCase := TUseCaseUpdateMensageria.Create(AparamsList);
  try
    Result :=
      useCase.Run(
        AcodMensagem,
        Aorigem,
        Astatus,
        Auuid);
  finally
    useCase.Free;
  end;
end;

function hwc_ler_mensageria(
  AparamsList: WideString;
  AcodMensagem: Integer;
  Aplataforma: WideString;
  Auuid: WideString): Boolean; stdcall;
begin
  var useCase := TUseCaseLerMensageria.Create(AparamsList);
  try
    Result :=
      useCase.Run(
        AcodMensagem,
        Aplataforma,
        Auuid);
  finally
    useCase.Free;
  end;
end;

function hwc_env_mensageria(
  AparamsList: WideString;
  Acodusuario: Integer;
  Acodcliente: Integer;
  Atipocliente: WideString;
  Acodaplicativo: Integer;
  Aidentificacao: WideString;
  Acontato: WideString;
  Acontatoavulso: Boolean;
  Andoc: WideString;
  Atipodoc: WideString;
  Aorigem: WideString;
  Aunicoarquivocompactado: Boolean;
  Agerarlinkarquivo: Boolean;
  Aanexos: WideString;
  Aunicoanexopormens: Boolean): Boolean; stdcall;
begin
  var useCase := TUseCaseEnvMensageria.Create(AparamsList);
  try
    Result :=
      useCase.Run(
        AparamsList,
        Acodusuario,
        Acodcliente,
        Atipocliente,
        'I',
        Acodaplicativo,
        Aidentificacao,
        Acontato,
        Acontatoavulso,
        Andoc,
        Atipodoc,
        Aorigem,
        Aunicoarquivocompactado,
        Agerarlinkarquivo,
        Aanexos,
        Aunicoanexopormens);
  finally
    useCase.Free;
  end;
end;

function hwc_buscar_config(
  AparamsList: WideString): Boolean; stdcall;
begin
  var useCase := TUseCaseBuscarConfig.Create(AparamsList);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

function hwc_consultar_custo(
  AparamsList: WideString): Boolean; stdcall;
begin
  var useCase := TUseCaseConsCustos.Create(AparamsList);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

exports
  hwc_cad_empresa,
  hwc_cad_pessoa,
  hwc_cad_usuario_senha,
  hwc_cad_contato,
  hwc_cad_mensageria,
  hwc_update_mensageria,
  hwc_ler_mensageria,
  hwc_env_mensageria,
  hwc_buscar_config,
  hwc_consultar_custo;

end.
