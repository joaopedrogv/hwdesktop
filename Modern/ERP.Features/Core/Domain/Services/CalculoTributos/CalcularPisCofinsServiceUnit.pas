unit CalcularPisCofinsServiceUnit;

interface

uses
  SysUtils, Classes,
  ICalcularPisCofinsServiceUnit,
  CalculoPisCofinsResultUnit,
  CalculoPisCofinsInputUnit;

type
  CalcularPisCofinsService = class(TInterfacedObject, ICalcularPisCofinsService)
  private
    function CalcularBC(const Input: CalculoPisCofinsInput): Currency;
  public
    function Executar(const Input: CalculoPisCofinsInput): CalculoPisCofinsResult;
  end;

implementation

uses NumberServiceUnit;

{ CalcularPisCofinsService }

function CalcularPisCofinsService.CalcularBC(
  const Input: CalculoPisCofinsInput): Currency;
begin
  Result := NumberService.RoundHalfUpTo2( Input.ValorLiquidoCobrado + Input.ValorIpi - Input.ValorIcms );
end;

function CalcularPisCofinsService.Executar(
  const Input: CalculoPisCofinsInput
): CalculoPisCofinsResult;
var
  cst: Integer;
  vBC, vPIS, vCOFINS, PPisOuReais, PCofinsOuReais: Currency;
begin
  cst := StrToIntDef(Trim(Input.CSTPisCofins), -1);

  case cst of
    { O Servico IAplicarRegras agora tem essa logica para decidir a incidencia ou nao, aqui somente calcula
    1,2,5:
      begin
        PPisOuReais := Input.PPisOuReais;
        PCofinsOuReais := Input.PCofinsOuReais;

        vBC := CalcularBC( Input );
        vPIS := NumberService.RoundHalfUpTo2( vBC * PPisOuReais / 100 );
        vCOFINS := NumberService.RoundHalfUpTo2( vBC * PCofinsOuReais / 100 );
      end;
    }
    3:
      begin
        PPisOuReais := Input.PPisOuReais;
        PCofinsOuReais := Input.PCofinsOuReais;

        vBC := Input.QtdeItem;
        vPIS := NumberService.RoundHalfUpTo2( vBC * PPisOuReais  );
        vCOFINS := NumberService.RoundHalfUpTo2( vBC * PCofinsOuReais );
      end;
    else
      begin
        PPisOuReais := Input.PPisOuReais;
        PCofinsOuReais := Input.PCofinsOuReais;

        vBC := CalcularBC( Input );
        vPIS := NumberService.RoundHalfUpTo2( vBC * PPisOuReais / 100 );
        vCOFINS := NumberService.RoundHalfUpTo2( vBC * PCofinsOuReais / 100 );
      end;
    {
		else
			begin
				PPisOuReais := 0;
				PCofinsOuReais := 0;
				vBC := 0;
				vPIS := 0;
				vCOFINS := 0;
			end;
    }
  end;

  Result := CalculoPisCofinsResult.Create(
    Input.CSTPisCofins, vBC,  
    PPisOuReais, vPIS, PCofinsOuReais, vCOFINS
  );
end;

end.
