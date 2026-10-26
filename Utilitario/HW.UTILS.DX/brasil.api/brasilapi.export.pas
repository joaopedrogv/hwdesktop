unit brasilapi.export;

interface

implementation

uses
  System.SysUtils,
  GetPessoaJuridica;

function brasil_api_cnpj(cnpj: WideString): WideString; stdcall;
begin
  try
    var useCase := GetPessoaJuridicaUseCase.Create();
    try

      Result := useCase.Execute(cnpj);

    finally
      useCase.Free;
    end;

  except on E: Exception do
    Result := 'Erro=' + E.Message;
  end;
end;

exports
  brasil_api_cnpj;

end.
