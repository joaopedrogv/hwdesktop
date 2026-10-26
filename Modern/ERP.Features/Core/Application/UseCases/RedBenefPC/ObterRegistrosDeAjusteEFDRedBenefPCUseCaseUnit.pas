unit ObterRegistrosDeAjusteEFDRedBenefPCUseCaseUnit;

interface

uses
  Contnrs,
  ICompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit, PeriodoMultiEmpresaVOUnit,
  ObterRegistrosDeAjusteEFDRedBenefPCOutputUnit;

type
  IObterRegistrosDeAjusteEFDRedBenefPCUseCase = interface
    ['{A8AA8F53-9344-43BD-BF99-1EED9EEA2A97}']
    function Executar(const Input: PeriodoMultiEmpresaVO): ObterRegistrosDeAjusteEFDRedBenefPCOutput;
  end;

  ObterRegistrosDeAjusteEFDRedBenefPCUseCase = class(TInterfacedObject, IObterRegistrosDeAjusteEFDRedBenefPCUseCase)
  private
    FCompiladorAjustes: ICompilarRegistrosDeAjusteEFDRedBenefPCService;
  public
    constructor Create(CompiladorAjustes: ICompilarRegistrosDeAjusteEFDRedBenefPCService);

    function Executar(const Input: PeriodoMultiEmpresaVO): ObterRegistrosDeAjusteEFDRedBenefPCOutput;
  end;

implementation

uses
  SysUtils, RegistroAjusteEFDPCVOUnit;

{ ObterRegistrosDeAjusteEFDRedBenefPCUseCase }

constructor ObterRegistrosDeAjusteEFDRedBenefPCUseCase.Create(
  CompiladorAjustes: ICompilarRegistrosDeAjusteEFDRedBenefPCService);
begin
  FCompiladorAjustes := CompiladorAjustes;
end;

function ObterRegistrosDeAjusteEFDRedBenefPCUseCase.Executar(
  const Input: PeriodoMultiEmpresaVO
): ObterRegistrosDeAjusteEFDRedBenefPCOutput;
var
  resultado: CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult;
  registrosM220: RegistroAjusteEFDPCVOList;
  registrosM620: RegistroAjusteEFDPCVOList;
  I: Integer;
begin
  resultado := FCompiladorAjustes.Executar(Input);
  try
    Result := ObterRegistrosDeAjusteEFDRedBenefPCOutput.Create(
      RegistroAjusteEFDPCVOList.Create(),
      RegistroAjusteEFDPCVOList.Create()
    );
    try
      //for I := 0 to resultado.RegistrosM220.Count - 1 do
        //Result.RegistrosM220.Add(resultado.RegistrosM220.Items[I]);
      Result.RegistrosM220.Assign(resultado.RegistrosM220);
      resultado.RegistrosM220.OwnsObjects := False;

      //for I := 0 to resultado.RegistrosM620.Count - 1 do
        //Result.RegistrosM620.Add(resultado.RegistrosM620.Items[I]);
      Result.RegistrosM620.Assign(resultado.RegistrosM620);
      resultado.RegistrosM620.OwnsObjects := False;

    except
      Result.Free();
      raise;
    end;
  finally
    resultado.Free();
  end;
end;

end.
