unit CalcularTributosAproximadosServiceUnit;

interface

uses
  SysUtils, Classes,
  IItensIbptRepositoryUnit,
  ICalcularTributosAproximadosServiceUnit, CalcularTributosAproximadosTypesUnit;

type
  CalcularTributosAproximadosService = class(TInterfacedObject, ICalcularTributosAproximadosService)
  private
    FItensIBPTRepo: IItensIbptRepository;
  public
    constructor Create(ItensIBPTRepo: IItensIbptRepository);

    function Executar(const Input: CalcularTributosAproximadosInput): CalcularTributosAproximadosResult;
  end;

implementation

uses ItemIbptEtdUnit, NumberServiceUnit, TipoComunsUnit, StringServiceUnit;

{ CalcularTributosAproximadosService }

constructor CalcularTributosAproximadosService.Create(ItensIBPTRepo: IItensIbptRepository);
begin
  FItensIBPTRepo := ItensIBPTRepo;
end;

function CalcularTributosAproximadosService.Executar(
  const Input: CalcularTributosAproximadosInput): CalcularTributosAproximadosResult;
var
  ibpt: ItemIbptEtd;
  AliqNac, AliqEst, AliqMun, AliqImp, ValNac, ValEst, ValMun, ValImp: Currency;
  I: Integer;
begin
  try try

    ibpt := nil;
    for I := 0 to High(Input.Codigos) do
      if Trim(Input.Codigos[I]) <> '' then
      begin
        ibpt := FItensIBPTRepo.ObterItemIbpt( Input.Codigos[I], Input.UF, Date(), Input.Excecao );
        if ibpt <> nil then
          Break;
      end;

    if ibpt <> nil then
    begin
      AliqNac := ibpt.Nacional;
      AliqEst := ibpt.Estadual;
      AliqMun := ibpt.Municipal;
      AliqImp := ibpt.Importado;
      ValNac := NumberService.RoundHalfUpTo2(Input.BaseCalculo * AliqNac / 100);
      ValEst := NumberService.RoundHalfUpTo2(Input.BaseCalculo * AliqEst / 100);
      ValMun := NumberService.RoundHalfUpTo2(Input.BaseCalculo * AliqMun / 100);
      ValImp := NumberService.RoundHalfUpTo2(Input.BaseCalculo * AliqImp / 100);
    end
    else
    begin
      AliqNac := 0;
      AliqEst := 0;
      AliqMun := 0;
      AliqImp := 0;
      ValNac := 0;
      ValEst := 0;
      ValMun := 0;
      ValImp := 0;
    end;

    Result := CalcularTributosAproximadosResult.Create(
      AliqNac, AliqEst, AliqMun, AliqImp, ValNac, ValEst, ValMun, ValImp
    );
  except on E: Exception do
    begin
      raise;
    end;
  end;
  finally
    ibpt.Free();
  end;
end;

end.

