unit assineon.export;

interface

uses ShowDocumentsPessoaUseCase;

implementation

uses
  ConfigureAssineOnUseCase, AssineonRepo;

procedure assineon_config(paramsList: WideString); stdcall;
begin
  var useCase := TConfigureAssineOnUseCase.Create(paramsList);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

procedure assineon_show_documents(paramsList: WideString); stdcall;
begin
  var useCase := TShowDocumentsPessoaUseCase.Create(paramsList);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

exports
  assineon_config,
  assineon_show_documents;

end.
