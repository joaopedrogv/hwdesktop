unit KentroResponseModels;

interface

uses
  System.Classes,
  System.Generics.Collections,
  KentroModels;

type
  TErrosResponseValidacao = class(TPersistent)
  private
    Fmessage: string;
  published
    property message: string read Fmessage write Fmessage;
  end;

  TPostMensagemResponse = class(TPersistent)
  private
    Fmessage: string;
    FenqueuedId: Integer;
  published
    property message: string read Fmessage write Fmessage;
    property enqueuedId: Integer read FenqueuedId write FenqueuedId;

    class function ToObject(json: string): TPostMensagemResponse;
  end;

  TPostArquivoResponse = class(TPersistent)
  private
    Fmessage: string;
    FenqueuedId: Integer;
  published
    property message: string read Fmessage write Fmessage;
    property enqueuedId: Integer read FenqueuedId write FenqueuedId;

    class function ToObject(json: string): TPostArquivoResponse;
  end;

  TPostMensagemArquivoResponse = class(TPersistent)
  private
    Fmessage: string;
    FenqueuedId: Integer;
  published
    property message: string read Fmessage write Fmessage;
    property enqueuedId: Integer read FenqueuedId write FenqueuedId;

    class function ToObject(json: string): TPostMensagemArquivoResponse;
  end;

  TPostUploadArquivoResponse = class(TPersistent)
  private
    Fmessage: string;
    FmimeType: string;
    FfileId: Integer;
  published
    property message: string read Fmessage write Fmessage;
    property mimeType: string read FmimeType write FmimeType;
    property fileId: Integer read FfileId write FfileId;

    class function ToObject(json: string): TPostUploadArquivoResponse;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  HW.Json,
  System.JSON,
  REST.Json;


{ TPostMensagemResponse }

class function TPostMensagemResponse.ToObject(
  json: string): TPostMensagemResponse;
var
  jsonObj: TJSONObject;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostMensagemResponse>(json);
  Result := TJsonHw.ToObject<TPostMensagemResponse>(json);
end;

{ TPostUploadArquivoResponse }

class function TPostUploadArquivoResponse.ToObject(
  json: string): TPostUploadArquivoResponse;
var
  jsonObj: TJSONObject;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostUploadArquivoResponse>(json);
  Result := TJsonHw.ToObject<TPostUploadArquivoResponse>(json);
end;

{ TPostArquivoResponse }

class function TPostArquivoResponse.ToObject(
  json: string): TPostArquivoResponse;
var
  jsonObj: TJSONObject;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostArquivoResponse>(json);
  Result := TJsonHw.ToObject<TPostArquivoResponse>(json);
end;

{ TPostMensagemArquivoResponse }

class function TPostMensagemArquivoResponse.ToObject(
  json: string): TPostMensagemArquivoResponse;
var
  jsonObj: TJSONObject;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostMensagemArquivoResponse>(json);
  Result := TJsonHw.ToObject<TPostMensagemArquivoResponse>(json);
end;

end.
