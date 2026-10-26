unit ApiHwCloud;

interface

uses
  HwCloudRepo,
  BaseApiHwCloud,
  BaseSingleton,
//  HwCloudModels,
  HwCloudResponseModels,
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.DateUtils,
  Winapi.Windows,
  Vcl.Forms,
  HwCloudModels,
  Neon.Core.Types,
  Neon.Core.Persistence,
  Neon.Core.Persistence.JSON;

type

  TApiHwCloud = class(TBaseApiHwCloud)
  public
    function CadEmpresa(
      payload: TCadEmpresa): TResponse;
    function CadPessoa(
      payload: TCadPessoaCI): TResponse; overload;
    function CadPessoa(
      payload: TCadPessoaCE): TResponse; overload;
    function CadUsuarioSenha(
      payload: TCadUsuarioSenha): TResponse; overload;
    function CadPlataformaUsuarioPorCliente(
      payload: TCadContato): TResponse;
    function LerMensageria(
      payload: TLerMensageria): TLerMensageriaResponse;
    function CadMensageriaSemTemplateSemAnexo(
      payload: TCadMensageriaSemTemplateSemAnexo): TMensageriaResponse;
    function CadMensageriaSemTemplateComAnexo(
      payload: TCadMensageriaSemTemplateComAnexo): TMensageriaResponse;
    function CadMensageriaComTemplateSemAnexo(
      payload: TCadMensageriaComTemplateSemAnexo): TMensageriaResponse;
    function CadMensageriaComTemplateComAnexo(
      payload: TCadMensageriaComTemplateComAnexo): TMensageriaResponse;
    function UpdateMensageria(
      payload: TUpdateMensageria): TMensageriaResponse;
    function BuscarConfig(
      payload: TBuscarConfig): TConfigResponse;
    function BuscarCustos(
      payload: TBuscarCusto): TCustoResponse;
    function logsHwCloud(Atext: string; Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0): Boolean;
  end;

  TApiHwCloudSingleton = TSingleton<TApiHwCloud>;

var
  api: TApiHwCloud;

implementation

uses
  System.Net.HttpClientComponent,
  hw_utils,
  hw_win_utils,
  hw_jsondx,
  SHFolder,
  System.TypInfo, Neon.Core.Serializers.RTL, System.JSON;

{ TApiHwCloud }

function TApiHwCloud.logsHwCloud(Atext, Afilename: string; Asingleline: Boolean;
  AtimeStart: TDateTime): Boolean;
var
  Afile: TextFile;
  Adir, Alogname, Atimestr: string;
  logHwCloud: string;
begin
  try
    logHwCloud := IniConf.ReadStr('Sistema', 'LoghwCloudAPI');
  except
    logHwCloud := 'S';
  end;

  if IndexText(logHwCloud, ['S', 'D']) < 0 then
    Exit;

  try
    Atimestr := '';
    if AtimeStart > 0 then
    begin
      if (Now - AtimeStart) >= 1  then
      begin
        Atimestr := IntToStr(Trunc(Now - AtimeStart));
        AtimeStart := (Now - AtimeStart) - Trunc(Now - AtimeStart);
        Atimestr := Atimestr + ' dia(s) ' + FormatDateTime('hh:mm:ss', AtimeStart);
      end
      else
        Atimestr := FormatDateTime('hh:mm:ss', Now);
    end;

    Alogname := ExtractFileName(Afilename);
    if logHwCloud = 'S' then //Simplificado, Unico arquivo, com o nome da classe
      if Pos('.', Afilename) > 0 then
        System.Delete(Afilename, Pos('.', Afilename), Length(Afilename));

    Adir := ExtractFilePath(Application.ExeName) + 'loghwcloud\' +
            FormatDateTime('YYYY-MM-DD', Date) + '\';

    ForceDirectories(ExtractFilePath(Adir));

    Afilename := Adir + '\' + Afilename + '.log';

    AssignFile(Afile, Afilename);
    if FileExists(Afilename) then
      Append(Afile)
    else
      Rewrite(Afile);
    if not Asingleline then
    begin
      if Atimestr <> '' then
        Writeln(Afile, Format('/*[%s] {%s} (%s)*/', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atimestr]))
      else
        Writeln(Afile, Format('/*[%s] {%s}*/', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname]));
      Writeln(Afile, Atext);
    end
    else if Atimestr <> '' then
      Writeln(Afile, Format('/*[%s] {%s} (%s)*/ %s', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atimestr, Atext]))
    else
      Writeln(Afile, Format('/*[%s] {%s}*/ %s', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atext]));
    CloseFile(Afile);

  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;


function TApiHwCloud.UpdateMensageria(
  payload: TUpdateMensageria): TMensageriaResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.UpdateMensageria - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TMensageriaResponse.Create;
    with Call(TReq.New('tarefa_mensageria', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.UpdateMensageria - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.UpdateMensageria Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.UpdateMensageria - end', 'HwCloud');
  end;
end;

function TApiHwCloud.BuscarConfig(
  payload: TBuscarConfig): TConfigResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.BuscarConfig - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TConfigResponse.Create;
    with Call(TReq.New('cfg_apibot', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.BuscarConfig - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TConfigResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.BuscarConfig Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TConfigResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.BuscarConfig - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadEmpresa(payload: TCadEmpresa): TResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadEmpresa - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TResponse.Create;
    with Call(TReq.New('exec_tarefa', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadEmpresa - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadEmpresa Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadEmpresa - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadPessoa(payload: TCadPessoaCI): TResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadPessoa - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TResponse.Create;
    with Call(TReq.New('exec_tarefa', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadPessoa - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadPessoa Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadPessoa - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadPessoa(payload: TCadPessoaCE): TResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadPessoa - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TResponse.Create;
    with Call(TReq.New('exec_tarefa', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadPessoa - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadPessoa Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadPessoa - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadPlataformaUsuarioPorCliente(payload: TCadContato): TResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadPlataformaUsuarioPorCliente - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TResponse.Create;
    with Call(TReq.New('exec_tarefa', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadPlataformaUsuarioPorCliente - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadPlataformaUsuarioPorCliente Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadPlataformaUsuarioPorCliente - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadUsuarioSenha(payload: TCadUsuarioSenha): TResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadUsuarioSenha - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TResponse.Create;
    with Call(TReq.New('exec_tarefa', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadUsuarioSenha - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadUsuarioSenha Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadUsuarioSenha - end', 'HwCloud');
  end;
end;

function TApiHwCloud.BuscarCustos(payload: TBuscarCusto): TCustoResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.BuscarCustos - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TCustoResponse.Create;
    with Call(TReq.New('custos_apibot', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.BuscarCustos - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TCustoResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.BuscarCustos Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TCustoResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.BuscarCustos - end', 'HwCloud');
  end;
end;

function TApiHwCloud.LerMensageria(
  payload: TLerMensageria): TLerMensageriaResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.LerMensageria - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TLerMensageriaResponse.Create;
    with Call(TReq.New('ler_mensageria', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.LerMensageria - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TLerMensageriaResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.LerMensageria Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TLerMensageriaResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.LerMensageria - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadMensageriaSemTemplateSemAnexo(
  payload: TCadMensageriaSemTemplateSemAnexo): TMensageriaResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadMensageriaSemTemplateSemAnexo - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TMensageriaResponse.Create;
    with Call(TReq.New('tarefa_mensageria', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadMensageriaSemTemplateSemAnexo - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadMensageriaSemTemplateSemAnexo Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadMensageriaSemTemplateSemAnexo - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadMensageriaSemTemplateComAnexo(
  payload: TCadMensageriaSemTemplateComAnexo): TMensageriaResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadMensageriaSemTemplateComAnexo - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TMensageriaResponse.Create;
    with Call(TReq.New('tarefa_mensageria', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadMensageriaSemTemplateComAnexo - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadMensageriaSemTemplateComAnexo Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadMensageriaSemTemplateComAnexo - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadMensageriaComTemplateSemAnexo(
  payload: TCadMensageriaComTemplateSemAnexo): TMensageriaResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadMensageriaComTemplateSemAnexo - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TMensageriaResponse.Create;
    with Call(TReq.New('tarefa_mensageria', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadMensageriaComTemplateSemAnexo - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadMensageriaComTemplateSemAnexo Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadMensageriaComTemplateSemAnexo - end', 'HwCloud');
  end;
end;

function TApiHwCloud.CadMensageriaComTemplateComAnexo(
  payload: TCadMensageriaComTemplateComAnexo): TMensageriaResponse;
begin
  try
    Result := nil;

    logsHwCloud(Self.ClassName + '.CadMensageriaComTemplateComAnexo - Request' + TJsonUtilsDX.Serialize(payload), 'HwCloud');

    Result := TMensageriaResponse.Create;
    with Call(TReq.New('tarefa_mensageria', '', TJsonUtilsDX.Serialize(payload)), ReqMethod.rmPost) do
    begin
      logsHwCloud(Self.ClassName + '.CadMensageriaComTemplateComAnexo - Response ' + data, 'HwCloud');

      if isSuccess then
      begin
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.CadMensageriaComTemplateComAnexo Code: %d Data: %s', [code, data]);
        Result := TJsonUtilsDX.Deseerialize<TMensageriaResponse>(data);
      end;
    end;
  finally
    logsHwCloud(Self.ClassName + '.CadMensageriaComTemplateComAnexo - end', 'HwCloud');
  end;
end;

end.
