unit hw.api.cloud.dotnet45;

interface

uses
  PrintTextUseCase,
  PrintNFCeUseCase,
  PrintTermicUseCase,
  PrintPdfUseCase,
  OpenDrawerUseCase;

var
  LastError: string;

implementation

function cloud_agente_print_text(text: WideString; params: WideString): Boolean; stdcall;
begin
  var useCase := TPrintTextUseCase.Create(params);
  try
    Result := useCase.Run(text);
    LastError := useCase.LastError;
  finally
    useCase.Free;
  end;
end;

function cloud_agente_print_nfce(xmlAut, xmlCan: WideString; params: WideString): Boolean; stdcall;
begin
  var useCase := TPrintNFCeUseCase.Create(params);
  try
    Result := useCase.Run(xmlAut, xmlCan);
    LastError := useCase.LastError;
  finally
    useCase.Free;
  end;
end;

function cloud_agente_print_termic(text: WideString; params: WideString): Boolean; stdcall;
begin
  var useCase := TPrintTermicUseCase.Create(params);
  try
    Result := useCase.Run(text);
    LastError := useCase.LastError;
  finally
    useCase.Free;
  end;
end;

function cloud_agente_print_pdf(text: WideString; params: WideString): Boolean; stdcall;
begin
  var useCase := TPrintPdfUseCase.Create(params);
  try
    Result := useCase.Run(text);
    LastError := useCase.LastError;
  finally
    useCase.Free;
  end;
end;

function cloud_agente_open_drawer(params: WideString): Boolean; stdcall;
begin
  var useCase := TOpenDrawerUseCase.Create(params);
  try
    Result := useCase.Run();
    LastError := useCase.LastError;
  finally
    useCase.Free;
  end;
end;

function cloud_agente_last_error: WideString; stdcall;
begin
  Result := LastError;
end;

exports
  cloud_agente_last_error,
  cloud_agente_print_text,
  cloud_agente_print_nfce,
  cloud_agente_print_termic,
  cloud_agente_print_pdf,
  cloud_agente_open_drawer;

end.
