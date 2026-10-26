unit plugboleto.export;

interface

implementation

uses
  UseCaseCedente,
  UseCaseConta,
  UseCaseConvenio,
  UseCaseImprimirBoleto,
  UseCaseConsultaBoletoIntegrado,
  UseCaseEmitirBoletos,
  UseCaseGerarRemessa,
  UseCaseDescartarBoletos,
  UseCaseUploadArquivoRetorno, UseCaseDownloadBoletoViaUrl;

procedure plugboleto_cedente(paramsList: WideString); stdcall;
begin
  var useCase := TUseCaseCedente.Create(paramsList);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

procedure plugboleto_conta(paramsList: WideString; idconvenio: Integer); stdcall;
begin
  var useCase := TUseCaseConta.Create(paramsList);
  try
    useCase.Run(idconvenio);
  finally
    useCase.Free;
  end;
end;

procedure plugboleto_convenio(paramsList: WideString; idconvenio: Integer); stdcall;
begin
  var useCase := TUseCaseConvenio.Create(paramsList);
  try
    useCase.Run(idconvenio);
  finally
    useCase.Free;
  end;
end;

procedure plugboleto_consultar(paramsList: WideString; ids: array of Integer); stdcall;
begin
  var useCase :=  TUseCaseConsultaBoletoIntegrado.Create(paramsList, False);
  try
    useCase.Run(ids);
  finally
    useCase.Free;
  end;
end;

procedure plugboleto_emitir(paramsList: WideString; ids: array of Integer); stdcall;
begin
  var useCase := TUseCaseEmitirBoletos.Create(paramsList);
  try
    useCase.Run(ids);
  finally
    useCase.Free;
  end;
end;

procedure plugboleto_remessa(paramsList: WideString; ids: array of Integer; diretorio: WideString); stdcall;
begin
  var useCase := TUseCaseGerarRemessa.Create(paramsList);
  try
    useCase.Run(ids, diretorio);
  finally
    useCase.Free;
  end;
end;

procedure plugboleto_descartar(paramsList: WideString; ids: array of Integer); stdcall;
begin
  var useCase := TUseCaseDescartarBoletos.Create(paramsList);
  try
    useCase.Run(ids);
  finally
    useCase.Free;
  end;
end;

procedure plugboleto_imprimir(paramsList: WideString; ids: array of Integer); stdcall;
begin
  var useCase := TUseCaseImprimirBoleto.Create(paramsList);
  try
    useCase.Run(ids);
  finally
    useCase.Free;
  end;
end;

function plugboleto_download_via_url(paramsList: WideString; api_urlboleto: string): WideString; stdcall;
begin
  var useCase := TUseCaseDownloadBoletoViaUrl.Create(paramsList);
  try
    Result := useCase.Run(api_urlboleto);
  finally
    useCase.Free;
  end;
end;

procedure plugboleto_uploadretorno(paramsList: WideString; diretorioarquivo: WideString; idconvenio: Integer); stdcall;
begin
  var useCase := TUseCaseUploadArquivoRetorno.Create(paramsList);
  try
    useCase.Run(idconvenio, diretorioarquivo);
  finally
    useCase.Free;
  end;
end;

exports
  plugboleto_cedente,
  plugboleto_conta,
  plugboleto_convenio,
  plugboleto_imprimir,
  plugboleto_download_via_url,
  plugboleto_consultar,
  plugboleto_emitir,
  plugboleto_remessa,
  plugboleto_descartar,
  plugboleto_uploadretorno;

end.

// *************************** readme
// ** PDF GhostScript para conversao
// url: https://www.devmedia.com.br/manipulando-pdf-com-ghostscript/34424
