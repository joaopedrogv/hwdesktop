unit ApiPlugBoleto;

interface

uses
  PlugBoletoRepo,
  BaseApiPlugBoleto,
  BaseSingleton,
  PlugBoletoModels,
  BoletoResponseModels,
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.DateUtils,
  Winapi.Windows,
  Vcl.Forms;

type

  TApiPlugBoleto = class(TBaseApiPlugBoleto)
  public
    function GetBoleto(params: TArray<string>): TGetBoletoResponse;
    function PostBoleto(payload: TArray<TBoleto>): TPostBoletoResponse;
    function DownloadlPDFBoleto(links: TArray<string>): TArray<string>;
    function PostRemessa(pIdIntegracao: TArray<string>): TPostRemessaResponse;
    function PostDescartar(pIdIntegracao: TArray<string>): TPostDescartarResponse;
    function GetRetorno(pIdIntegracao: string): TGetRetornoResponse;
    function PostRetorno(payload: string): TPostUploadRetornoResponse;
    function GetCedente(params: TArray<string>): TGetCedenteResponse;
    function PostCedente(payload: TCedente): TCedenteResponse;
    function PutCedente(payload: TCedente; id: string): TCedenteResponse;
    function GetConta(id: string; banco: string; agencia: string; conta: string): TGetContaResponse;
    function PostConta(payload: TConta): TContaResponse;
    function PutConta(payload: TConta; id: string): TContaResponse;
    function GetConvenio(id: string; numero_convenio: string): TGetConvenioResponse;
    function PostConvenio(payload: TConvenio): TConvenioResponse;
    function PutConvenio(payload: TConvenio; id: string): TConvenioResponse;
    function logsBoleto(Atext: string; Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0): Boolean;
  end;

  TApiPlugBoletoSingleton = TSingleton<TApiPlugBoleto>;

var
  api: TApiPlugBoleto;

implementation

uses
  REST.Types,
  System.Net.HttpClientComponent,
  hw_utils,
  HW.Json,
  hw_win_utils,
  SHFolder;

{ TApiPlugBoleto }

function TApiPlugBoleto.DownloadlPDFBoleto(
  links: TArray<string>): TArray<string>;
var
  netClient: TNetHTTPClient;
  fileDownload : TFileStream;
  fileName: string;
  I: Integer;
  vLink: Boolean;
  vOK: Boolean;
begin
  try
    Result := [];

    logsBoleto(Self.ClassName + '.DownloadlPDFBoleto - begin', 'boleto');

    for I := 0 to Length(links) - 1 do
      if trim(links[I]) <> '' then
        logsBoleto(Self.ClassName + '.DownloadlPDFBoleto - begin (' + links[I] + ')', 'boleto');

    vOK := True;

    repo := TPlugBoletoRepoSingleton.GetInstance();
    repo.vConfigAPI := repo.retornaConfAPI;

    netClient := TNetHTTPClient.Create(nil);
    netClient.ResponseTimeout := repo.vConfigAPI.timeout_download_boleto;
    try
      for var link in links do
      begin
        vLink := True;

        for I := 1 to repo.vConfigAPI.qtde_tentativas_download_boleto do
        begin
          try
            fileName := GetPathTemp('') + NewGuid + '.pdf';

            fileDownload := TFileStream.Create(fileName, fmCreate);
            try

              var response := netClient.Get(link, fileDownload);

              if response.StatusCode <> 200 then
                vLink := False;

              Result := Result + [fileName];

              if response.StatusCode = 200 then
              begin
                vLink := True;
                Break;
              end;
            finally
              FreeAndNil(fileDownload);
            end;
          except on E: Exception do
            begin
              if (I = 5) then
                raise Exception.Create(e.Message);
            end;
          end;
        end;

        if vOK then
          vOK := vLink;
      end;

      if not vOK then
        raise Exception.Create('Erro ao baixar boleto');
    finally
      netClient.Free;
    end;
  finally
    logsBoleto(Self.ClassName + '.DownloadlPDFBoleto - end', 'boleto');
  end;
end;

function TApiPlugBoleto.GetBoleto(
  params: TArray<string>): TGetBoletoResponse;
var
  temp: string;
  I: Integer;
begin
  try
    Result := nil;

    temp := '';
    for I := 0 to Length(params) - 1 do
      if trim(params[I]) <> '' then
        temp := temp + IfThen(trim(temp) = '', '', ',') + params[I];

    logsBoleto(Self.ClassName + '.GetBoleto - begin (' + temp + ')', 'boleto');

    with Get(TReq.New('boletos', [], params)) do
    begin
      logsBoleto(Self.ClassName + '.GetBoleto - Response ' + data, 'boleto');

      if isSuccess then
        Result := TJsonHw.ToObject< TGetBoletoResponse >(data)
      else if code = 401 then
      begin
        var response401 := TJsonHw.ToObject< TResponse401 >(data);
        if Assigned(response401) then
          raise Exception.Create(response401.ErrosToString)
        else
          raise Exception.Create(ERRO_DEFAULT);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.GetBoleto - end', 'boleto');
  end;
end;

function TApiPlugBoleto.GetCedente(
  params: TArray<string>): TGetCedenteResponse;
var
  temp: string;
  I: Integer;
begin
  try
    Result := nil;

    temp := '';
    for I := 0 to Length(params) - 1 do
      if trim(params[I]) <> '' then
        temp := temp + IfThen(trim(temp) = '', '', ',') + params[I];

    logsBoleto(Self.ClassName + '.GetCedente - begin (' + temp + ')', 'boleto');

    with Get(TReq.New('cedentes', [], params)) do
    begin
      logsBoleto(Self.ClassName + '.GetCedente - Response ' + data, 'boleto');

      if isSuccess then
        Result := TJsonHw.ToObject< TGetCedenteResponse >(data)
      else if code = 401 then
      begin
        var response401 := TJsonHw.ToObject< TResponse401 >(data);
        if Assigned(response401) then
          raise Exception.Create(response401.ErrosToString)
        else
          raise Exception.Create(ERRO_DEFAULT);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.GetCedente - end', 'boleto');
  end;
end;

function TApiPlugBoleto.GetConta(
  id: string; banco: string; agencia: string; conta: string): TGetContaResponse;
var
  vtemp: string;
begin
  try
    Result := nil;

    if id.Trim <> '' then
      logsBoleto(Self.ClassName + '.GetConta - begin (id= ' + id + ')', 'boleto')
    else if banco.Trim <> '' then
      logsBoleto(Self.ClassName + '.GetConta - begin (codigo_banco= ' + banco + ' agencia ' + agencia + ' conta= ' + conta + ')', 'boleto')
    else
      logsBoleto(Self.ClassName + '.GetConta - begin', 'boleto');

    vtemp := '';
    if id.Trim <> '' then
      vtemp := '?id=' + id.Trim
    else if ((banco.Trim <> '') or (agencia.Trim <> '') or (conta.Trim <> '')) then
    begin
      if banco.Trim <> '' then
        vtemp := vtemp + '?banco=' + banco;
      if agencia.Trim <> '' then
        vtemp := vtemp + '?agencia=' + OnlyNumber(Copy(agencia.Trim, 1, Length(agencia.Trim) - 1)).Trim.ToUpper;
      if conta.Trim <> '' then
        vtemp := vtemp + '?conta=' + OnlyNumber(Copy(conta.Trim, 1, Length(conta.Trim) - 1)).Trim.ToUpper;
    end;

    with Get(TReq.New('cedentes/contas' + vtemp, [], [])) do
    begin
      logsBoleto(Self.ClassName + '.GetConta - Response ' + data, 'boleto');

      if isSuccess then
        Result := TJsonHw.ToObject< TGetContaResponse >(data)
      else if code = 401 then
      begin
        var response401 := TJsonHw.ToObject< TResponse401 >(data);
        if Assigned(response401) then
          raise Exception.Create(response401.ErrosToString)
        else
          raise Exception.Create(ERRO_DEFAULT);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.GetConta - end', 'boleto');
  end;
end;

function TApiPlugBoleto.GetConvenio(
  id: string; numero_convenio: string): TGetConvenioResponse;
var
  vtemp: string;
begin
  try
    Result := nil;

    if id.Trim <> '' then
      logsBoleto(Self.ClassName + '.GetConvenio - begin (id= ' + id + ')' , 'boleto')
    else if numero_convenio.Trim <> '' then
      logsBoleto(Self.ClassName + '.GetConvenio - begin (numero_convenio= ' + numero_convenio + ')' , 'boleto')
    else
      logsBoleto(Self.ClassName + '.GetConvenio - begin' , 'boleto');

    vtemp := '';
    if (id.Trim <> '') then
      vtemp := '?id=' + id.Trim
    else if numero_convenio.Trim <> '' then
      vtemp := '?numero_convenio=' + numero_convenio.Trim;

    with Get(TReq.New('cedentes/contas/convenios' + vtemp, [], [])) do
    begin
      logsBoleto(Self.ClassName + '.GetConvenio - Response ' + data, 'boleto');

      if isSuccess then
        Result := TJsonHw.ToObject< TGetConvenioResponse >(data)
      else if code = 401 then
      begin
        var response401 := TJsonHw.ToObject< TResponse401 >(data);
        if Assigned(response401) then
          raise Exception.Create(response401.ErrosToString)
        else
          raise Exception.Create(ERRO_DEFAULT);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.GetConvenio - end', 'boleto');
  end;
end;

function TApiPlugBoleto.GetRetorno(
  pIdIntegracao: string): TGetRetornoResponse;
begin
  try
    Result := nil;

    logsBoleto(Self.ClassName + '.GetRetorno - begin (' + pIdIntegracao + ')', 'boleto');

    with Get(TReq.New('retornos/' + pIdIntegracao, [], [])) do
    begin
      logsBoleto(Self.ClassName + '.GetRetorno - Response ' + data, 'boleto');

      if isSuccess then
        Result := TJsonHw.ToObject<TGetRetornoResponse >(data)
      else if code = 401 then
      begin
        var response401 := TJsonHw.ToObject< TResponse401 >(data);
        if Assigned(response401) then
          raise Exception.Create(response401.ErrosToString)
        else
          raise Exception.Create(ERRO_DEFAULT);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.GetRetorno - end', 'boleto');
  end;
end;

function TApiPlugBoleto.logsBoleto(Atext, Afilename: string;
  Asingleline: Boolean = False; AtimeStart: TDateTime = 0): Boolean;
var
  Afile: TextFile;
  Adir, Alogname, Atimestr: string;
  logboleto: string;
begin
  try
     logboleto := IniConf.ReadStr('Sistema', 'LogboletoAPI');
  except
    logboleto := 'S';
  end;

  if IndexText(logboleto, ['S', 'D']) < 0 then
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
    if logboleto = 'S' then //Simplificado, Unico arquivo, com o nome da classe
      if Pos('.', Afilename) > 0 then
        System.Delete(Afilename, Pos('.', Afilename), Length(Afilename));

    Adir := ExtractFilePath(Application.ExeName) + 'logboleto\' +
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

function TApiPlugBoleto.PostBoleto(
  payload: TArray<TBoleto>): TPostBoletoResponse;
var
  temp: string;
  I: Integer;
begin
  try
    Result := nil;

    temp := '';
    for I := 0 to Length(payload) - 1 do
      temp := temp + IfThen(trim(temp) = '', '', ',') + payload[I].TituloCodigoReferencia;

    logsBoleto(Self.ClassName + '.PostBoleto - begin (' + temp + ')', 'boleto');

    logsBoleto(Self.ClassName + '.PostBoleto - Request' + TJsonHw.ToArrayJson<TBoleto>(payload), 'boleto');

    Result := TPostBoletoResponse.Create;
    with Call(TReq.New('boletos/lote', '', TJsonHw.ToArrayJson<TBoleto>(payload)), ReqMethod.rmPost) do
    begin
      logsBoleto(Self.ClassName + '.PostBoleto - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TPostBoletoResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error('TApiPlugBoleto.PostBoleto Code: %d Data: %s', [code, data]);
        Result.erro := TJsonHw.ToObject<TPostBoletoResponseErro>(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PostBoleto - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PostCedente(
  payload: TCedente): TCedenteResponse;
begin
  try
    Result := nil;

    logsBoleto(Self.ClassName + '.PostCedente - begin (' + payload.CedenteCPFCNPJ + ')', 'boleto');

    logsBoleto(Self.ClassName + '.PostCedente - Request' + TJsonHw.ToJsonString(payload), 'boleto');

    Result := TCedenteResponse.Create;
    with Call(TReq.New('cedentes', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsBoleto(Self.ClassName + '.PostCedente - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TCedenteResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PostCedente Code: %d Data: %s', [code, data]);
        Result.erro := TCedenteResponseErro.ToObject(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PostCedente - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PostConta(
  payload: TConta): TContaResponse;
begin
  try
    Result := nil;

    logsBoleto(Self.ClassName + '.PostConta - begin (' + payload.ContaNumero + payload.ContaNumeroDV + ')', 'boleto');

    logsBoleto(Self.ClassName + '.PostConta - Request' + TJsonHw.ToJsonString(payload), 'boleto');

    Result := TContaResponse.Create;
    with Call(TReq.New('cedentes/contas', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsBoleto(Self.ClassName + '.PostConta - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TContaResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PostConta Code: %d Data: %s', [code, data]);
        Result.erro := TContaResponseErro.ToObject(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PostConta - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PostConvenio(
  payload: TConvenio): TConvenioResponse;
begin
  try
    Result := nil;

    logsBoleto(Self.ClassName + '.PostConvenio - begin (' + payload.ConvenioNumero + ')', 'boleto');

    logsBoleto(Self.ClassName + '.PostConvenio - Request' + TJsonHw.ToJsonString(payload), 'boleto');

    Result := TConvenioResponse.Create;
    with Call(TReq.New('cedentes/contas/convenios', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsBoleto(Self.ClassName + '.PostConvenio - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TConvenioResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PostConvenio Code: %d Data: %s', [code, data]);
        Result.erro := TConvenioResponseErro.ToObject(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PostConvenio - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PutCedente(
  payload: TCedente; id: string): TCedenteResponse;
begin
  try
    Result := nil;

    logsBoleto(Self.ClassName + '.PutCedente - begin (' + payload.CedenteCPFCNPJ + ')', 'boleto');

    logsBoleto(Self.ClassName + '.PutCedente - Request' + TJsonHw.ToJsonString(payload), 'boleto');

    Result := TCedenteResponse.Create;
    with Call(TReq.New('cedentes/' + id, '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPUT) do
    begin
      logsBoleto(Self.ClassName + '.PutCedente - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TCedenteResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PutCedente Code: %d Data: %s', [code, data]);
        Result.erro := TCedenteResponseErro.ToObject(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PutCedente - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PutConta(
  payload: TConta; id: string): TContaResponse;
begin
  try
    Result := nil;

    logsBoleto(Self.ClassName + '.PutConta - begin (' + payload.ContaNumero + payload.ContaNumeroDV + ')', 'boleto');

    logsBoleto(Self.ClassName + '.PutConta - Request' + TJsonHw.ToJsonString(payload), 'boleto');

    Result := TContaResponse.Create;
    with Call(TReq.New('cedentes/contas/' + id, '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPUT) do
    begin
      logsBoleto(Self.ClassName + '.PutConta - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TContaResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PutConta Code: %d Data: %s', [code, data]);
        Result.erro := TContaResponseErro.ToObject(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PutConta - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PutConvenio(
  payload: TConvenio; id: string): TConvenioResponse;
begin
  try
    Result := nil;

    logsBoleto(Self.ClassName + '.PutConvenio - begin (' + payload.ConvenioNumero + ')', 'boleto');

    logsBoleto(Self.ClassName + '.PutConvenio - Request' + TJsonHw.ToJsonString(payload), 'boleto');

    Result := TConvenioResponse.Create;
    with Call(TReq.New('cedentes/contas/convenios/' + id, '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPUT) do
    begin
      logsBoleto(Self.ClassName + '.PutConvenio - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TConvenioResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PutConvenio Code: %d Data: %s', [code, data]);
        Result.erro := TConvenioResponseErro.ToObject(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PutConvenio - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PostRemessa(
  pIdIntegracao: TArray<string>): TPostRemessaResponse;
var
  temp: string;
  I: Integer;
begin
  try
    Result := nil;

    temp := '';
    for I := 0 to Length(pIdIntegracao) - 1 do
      if trim(pIdIntegracao[I]) <> ''  then
        temp := temp + IfThen(trim(temp) = '', '', ',') + pIdIntegracao[I];

    logsBoleto(Self.ClassName + '.PostRemessa - begin (' + temp + ')', 'boleto');

    Result := TPostRemessaResponse.Create;
    with Call(TReq.New('remessas/lote', [], TJsonHw.ToString(pIdIntegracao, True)), ReqMethod.rmPost) do
    begin
      logsBoleto(Self.ClassName + '.PostRemessa - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TPostRemessaResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PostRemessa Code: %d Data: %s', [code, data]);
        Result.erro := TJsonHw.ToObject<TPostRemessaResponseErro>(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PostRemessa - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PostRetorno(
  payload: string): TPostUploadRetornoResponse;
begin
  try
    Result := nil;

    logsBoleto(Self.ClassName + '.PostRetorno - begin (' + payload + ')', 'boleto');

    Result := TPostUploadRetornoResponse.Create;

    var req := TReq.New('retornos');
    req.ChangeBody('arquivo', payload, TRESTContentType.ctAPPLICATION_X_WWW_FORM_URLENCODED);
    req.Accept := '*/*';

    with Call(req, ReqMethod.rmPost) do
    begin
      logsBoleto(Self.ClassName + '.PostRetorno - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TPostUploadRetornoResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PostRetorno Code: %d Data: %s', [code, data]);
        Result.erro := TPostUploadRetornoResponseErro.ToObject(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PostRetorno - end', 'boleto');
  end;
end;

function TApiPlugBoleto.PostDescartar(
  pIdIntegracao: TArray<string>): TPostDescartarResponse;
var
  boletos: string;
  I: Integer;
begin
  try
    Result := nil;

    boletos := '';
    for I := 0 to Length(pIdIntegracao) - 1 do
      if trim(pIdIntegracao[I]) <> '' then
        boletos := boletos + IfThen(trim(boletos) = '', '', ',') + pIdIntegracao[I];

    logsBoleto(Self.ClassName + '.PostDescartar - begin (' + boletos + ')', 'boleto');

    Result := TPostDescartarResponse.Create;
    with Call(TReq.New('boletos/descarta/lote', [], TJsonHw.ToString(pIdIntegracao, True)), ReqMethod.rmPost) do
    begin
      logsBoleto(Self.ClassName + '.PostDescartar - Response ' + data, 'boleto');

      if isSuccess then
        Result.sucesso := TPostDescartarResponseSucesso.ToObject(data)
      else
      begin
        LogApp.Error(Self.ClassName + '.PostDescartar Code: %d Data: %s', [code, data]);
        Result.erro := TJsonHw.ToObject<TPostDescartarResponseErro>(data);
      end;
    end;
  finally
    logsBoleto(Self.ClassName + '.PostDescartar - end', 'boleto');
  end;
end;

end.
