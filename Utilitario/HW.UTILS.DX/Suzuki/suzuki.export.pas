unit suzuki.export;

interface

implementation

uses
  UseCaseAutenticacao,
  UseCaseVendaVeiculos;

procedure suzuki_autenticacao(paramsList: WideString); stdcall;
begin
  var useCase := TUseCaseAutenticacao.Create(paramsList);
  try
    useCase.Run(True);
  finally
    useCase.Free;
  end;
end;

procedure suzuki_vendaveiculos(paramsList: WideString; ids: array of Integer); stdcall;
var
  autenticado: Boolean;
begin
  var autenticacao := TUseCaseAutenticacao.Create(paramsList);
  try
    autenticado := autenticacao.Run(False);

    if (autenticado) then
    begin
      var useCase := TUseCaseVendaVeiculos.Create(paramsList);
      try
        useCase.Run(ids);
      finally
        useCase.Free;
      end;
    end;

  finally
    autenticacao.Free;
  end;
end;

exports
  suzuki_autenticacao,
  suzuki_vendaveiculos;

end.
