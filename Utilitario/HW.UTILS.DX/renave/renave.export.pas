unit renave.export;

interface

implementation

uses
  UseCaseSelectCertificate,
  UseCaseVeiculosZeroPendentes,
  UseCaseEntrarComEstoqueZero;

procedure renave_configure(paramsList: WideString); stdcall;
begin
  var useCase := TUseCaseConfigure.Create(paramsList);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

procedure renave_zero_pendentes_entrada_estoque(paramsList: WideString); stdcall;
begin
  var useCase := TUseCaseVeiculosZeroPendentes.Create(paramsList);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

procedure renave_zero_estoque_renave(paramsList: WideString); stdcall;
begin
  var useCase := TUseCaseEntrarComEstoqueZero.Create(paramsList);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

exports
  renave_configure,
  renave_zero_pendentes_entrada_estoque,
  renave_zero_estoque_renave;

end.
