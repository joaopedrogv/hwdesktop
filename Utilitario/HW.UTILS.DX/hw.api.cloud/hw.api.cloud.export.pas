unit hw.api.cloud.export;

interface

implementation

uses
  UseCaseBase,
  ServiceSincUseCase,
  ServiceUrgencySincUseCase,
  NFCePostUseCase,
  PedidosGetUseCase,
  OrcamentoGetUseCase,
  ViewLogUseCase,
  ConfigServerUseCase,
  TestConnectionUseCase,
  System.StrUtils;

procedure cloud_sinc(paramsList: WideString); stdcall;
var
  useCase: TServiceSincUseCase;
begin
  if ContainsText(string(paramsList), 'urgency=true') then
  begin
    var urgency := TServiceUrgencySincUseCase.Create(paramsList);
    try
      urgency.Run;
      Exit;
    finally
      urgency.Free;
    end;
  end;

  useCase := TServiceSincUseCase.Create(paramsList);
  try

    var stop := false;
    useCase.Run;
    while useCase.countRecords > 0 do
    begin
      useCase.Run;

      if useCase.countErrors > 0 then
        Break;
    end;

  finally
    useCase.Free;
  end;
end;

procedure cloud_post_nfce_silent(paramsList: WideString); stdcall;
var
  useCase: TNFCePostUseCase;
begin
  useCase := TNFCePostUseCase.Create(paramsList);
  try
    useCase.Run();
  finally
    useCase.Free;
  end;
end;

procedure cloud_get_pedidos(paramsList: WideString); stdcall;
begin
  var useCase := TPedidosGetUseCase.Create(paramsList);
  try
    useCase.Run();
  finally
    useCase.Free;
  end;
end;

procedure cloud_get_orcamento(paramsList: WideString); stdcall;
begin
  var useCase := TOrcamentoGetUseCase.Create(paramsList);
  try
    useCase.Run();
  finally
    useCase.Free;
  end;
end;

procedure cloud_view_log(paramsList: WideString); stdcall;
begin
  var useCase := TViewLogUseCase.Create(paramsList);
  try
    useCase.Run();
  finally
    useCase.Free;
  end;
end;

procedure cloud_view_config(paramsList: WideString); stdcall;
begin
  var useCase := TConfigServerUseCase.Create(paramsList);
  try
    useCase.Run();
  finally
    useCase.Free;
  end;
end;

procedure cloud_caixa_test(paramsList: WideString); stdcall;
begin
  var useCase := TTestConnectionUseCase.Create(paramsList);
  try
    useCase.Run();
  finally
    useCase.Free;
  end;
end;

exports
  cloud_sinc,
  cloud_get_pedidos,
  cloud_get_orcamento,
  cloud_view_log,
  cloud_view_config,
  cloud_caixa_test;

end.
