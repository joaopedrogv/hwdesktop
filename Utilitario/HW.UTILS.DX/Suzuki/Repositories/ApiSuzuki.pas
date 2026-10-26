unit ApiSuzuki;

interface

uses
  SuzukiRepo,
  BaseApiSuzuki,
  BaseSingleton,
//  SuzukiModels,
  SuzukiResponseModels,
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.DateUtils,
  Winapi.Windows,
  Vcl.Forms, SuzukiModels;

type

  TApiSuzuki = class(TBaseApiSuzuki)
  public
    function PostAutenticacao(payload: TAutenticacao): TPostAutenticacaoResponse;
    function PostNotaFiscal(payload: TNotaFiscal): TPostNotaFiscalResponse;
    function logsSuzuki(Atext: string; Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0): Boolean;
  end;

  TApiSuzukiSingleton = TSingleton<TApiSuzuki>;

var
  api: TApiSuzuki;

implementation

uses
  REST.Types,
  System.Net.HttpClientComponent,
  hw_utils,
  HW.Json,
  hw_win_utils,
  SHFolder;

{ TApiSuzuki }

function TApiSuzuki.logsSuzuki(Atext, Afilename: string; Asingleline: Boolean;
  AtimeStart: TDateTime): Boolean;
var
  Afile: TextFile;
  Adir, Alogname, Atimestr: string;
  logsuzuki: string;
begin
  try
    logsuzuki := IniConf.ReadStr('Sistema', 'LogboletoAPI');
  except
    logsuzuki := 'S';
  end;

  if IndexText(logsuzuki, ['S', 'D']) < 0 then
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
    if logsuzuki = 'S' then //Simplificado, Unico arquivo, com o nome da classe
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

function TApiSuzuki.PostAutenticacao(
  payload: TAutenticacao): TPostAutenticacaoResponse;
var
  temp: string;
  I: Integer;
begin
  try
    Result := nil;

    logsSuzuki(Self.ClassName + '.PostAutenticacao - Request' + TJsonHw.ToJsonString(payload), 'suzuki');

    Result := TPostAutenticacaoResponse.Create;
    with Call(TReq.New('api/Seguranca/Autenticacao', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsSuzuki(Self.ClassName + '.PostAutenticacao - Response ' + data, 'suzuki');

      if isSuccess then
      begin
        Result := TPostAutenticacaoResponse.ToObject(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.PostAutenticacao Code: %d Data: %s', [code, data]);
        Result := TPostAutenticacaoResponse.ToObject(data);
      end;
    end;
  finally
    logsSuzuki(Self.ClassName + '.PostAutenticacao - end', 'suzuki');
  end;
end;

function TApiSuzuki.PostNotaFiscal(
  payload: TNotaFiscal): TPostNotaFiscalResponse;
var
  temp: string;
  I: Integer;
begin
  try
    Result := nil;

    logsSuzuki(Self.ClassName + '.PostNotaFiscal - Request' + TJsonHw.ToJsonString(payload), 'suzuki');

    Result := TPostNotaFiscalResponse.Create;
    with Call2(TReq.New('api/Dealer/v1/Venda', '', TJsonHw.ToJsonString(payload)), ReqMethod.rmPost) do
    begin
      logsSuzuki(Self.ClassName + '.PostNotaFiscal - Response ' + data, 'suzuki');

      if isSuccess then
      begin
        Result := TPostNotaFiscalResponse.ToObject(data);
      end
      else
      begin
        LogApp.Error(Self.ClassName + '.PostNotaFiscal Code: %d Data: %s', [code, data]);
        Result := TPostNotaFiscalResponse.ToObject(data);
      end;
    end;
  finally
    logsSuzuki(Self.ClassName + '.PostNotaFiscal - end', 'suzuki');
  end;

end;

end.
