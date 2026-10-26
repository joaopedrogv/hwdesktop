unit ApiKentro;

interface

uses
  BaseApiKentro,
  BaseSingleton,
  KentroModels,
  KentroResponseModels;

type
  TApiKentro = class(TBaseApiKentro)
  public
    function PostMensagem(payload: TMensagemKentro): TPostMensagemResponse;
    function PostArquivo(payload: TArquivoKentro): TPostArquivoResponse;
    function PostMensagemArquivo(payload: TMensagemArquivoKentro): TPostMensagemArquivoResponse;
    function PostUploadArquivo(payload: TUploadKentro): Integer;
    function logsWhatsApp(Atext: string; Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0): Boolean;
  end;

  TApiKentroSingleton = TSingleton<TApiKentro>;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  REST.Types,
  System.Net.HttpClientComponent,
  hw_utils,
  HW.Json,
  hw_win_utils,
  SHFolder, Vcl.Forms;

{ TApiKentro }

function TApiKentro.PostMensagem(
  payload: TMensagemKentro): TPostMensagemResponse;
begin
  try
    logsWhatsApp(Self.ClassName + '.PostMensagem - begin', 'whatsapp');

    Result := TPostMensagemResponse.Create;
    with Call(TReq.New('int/enqueueMessageToSend', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsWhatsApp(Self.ClassName + '.PostMensagem - Response ' + data, 'whatsapp');

      if isSuccess then
      begin
        Result := TPostMensagemResponse.ToObject(data);

        if Result.enqueuedId <= 0 then
          LogApp.Error(Self.ClassName + '.PostMensagem Code: %d Data: %s', [code, data]);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.PostMensagem Code: %d Data: %s', [code, data]);
        Result := TPostMensagemResponse.ToObject(data);
      end;
    end;
  finally
    logsWhatsApp(Self.ClassName + '.PostMensagem - end', 'whatsapp');
  end;
end;

function TApiKentro.logsWhatsApp(Atext, Afilename: string; Asingleline: Boolean;
  AtimeStart: TDateTime): Boolean;
var
  Afile: TextFile;
  Adir, Alogname, Atimestr: string;
  logwhatsapp: string;
begin
  try
     logwhatsapp := IniConf.ReadStr('Sistema', 'LogwhatsappAPI');
  except
    logwhatsapp := 'S';
  end;

  if IndexText(logwhatsapp, ['S', 'D']) < 0 then
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
    if logwhatsapp = 'S' then //Simplificado, Unico arquivo, com o nome da classe
      if Pos('.', Afilename) > 0 then
        System.Delete(Afilename, Pos('.', Afilename), Length(Afilename));

    Adir := ExtractFilePath(Application.ExeName) + 'Logwhatsapp\' +
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

function TApiKentro.PostArquivo(
  payload: TArquivoKentro): TPostArquivoResponse;
begin
  try
    logsWhatsApp(Self.ClassName + '.PostArquivo - begin', 'whatsapp');

    Result := TPostArquivoResponse.Create;
    with Call(TReq.New('int/enqueueMessageToSend', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsWhatsApp(Self.ClassName + '.PostArquivo - Response ' + data, 'whatsapp');

      if isSuccess then
      begin
        Result := TPostArquivoResponse.ToObject(data);

        if Result.enqueuedId <= 0 then
          LogApp.Error(Self.ClassName + '.PostArquivo Code: %d Data: %s', [code, data]);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.PostArquivo Code: %d Data: %s', [code, data]);
        Result := TPostArquivoResponse.ToObject(data);
      end;
    end;
  finally
    logsWhatsApp(Self.ClassName + '.PostArquivo - end', 'whatsapp');
  end;
end;

function TApiKentro.PostMensagemArquivo(
  payload: TMensagemArquivoKentro): TPostMensagemArquivoResponse;
begin
  try
    logsWhatsApp(Self.ClassName + '.PostMensagemArquivo - begin', 'whatsapp');

    Result := TPostMensagemArquivoResponse.Create;
    with Call(TReq.New('int/enqueueMessageToSend', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsWhatsApp(Self.ClassName + '.PostMensagemArquivo - Response ' + data, 'whatsapp');

      if isSuccess then
      begin
        Result := TPostMensagemArquivoResponse.ToObject(data);

        if Result.enqueuedId <= 0 then
          LogApp.Error(Self.ClassName + '.PostMensagemArquivo Code: %d Data: %s', [code, data]);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.PostMensagemArquivo Code: %d Data: %s', [code, data]);
        Result := TPostMensagemArquivoResponse.ToObject(data);
      end;
    end;
  finally
    logsWhatsApp(Self.ClassName + '.PostMensagemArquivo - end', 'whatsapp');
  end;
end;


function TApiKentro.PostUploadArquivo(
  payload: TUploadKentro): Integer;
begin
  try
    logsWhatsApp(Self.ClassName + '.PostUploadArquivo - begin', 'whatsapp');

    Result := 0;
    with Call(TReq.New('int/uploadFile', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsWhatsApp(Self.ClassName + '.PostUploadArquivo - Response ' + data, 'whatsapp');

      if isSuccess then
      begin
        var vresult := TPostUploadArquivoResponse.ToObject(data);

        Result := vresult.fileId;

        if vresult.fileId <= 0 then
          LogApp.Error(Self.ClassName + '.PostUploadArquivo Code: %d Data: %s', [code, data]);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.PostUploadArquivo Code: %d Data: %s', [code, data]);
        Result := 0;
      end;
    end;
  finally
    logsWhatsApp(Self.ClassName + '.PostUploadArquivo - end', 'whatsapp');
  end;
end;

end.
