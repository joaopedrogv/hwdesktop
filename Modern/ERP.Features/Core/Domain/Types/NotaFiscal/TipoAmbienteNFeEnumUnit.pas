unit TipoAmbienteNFeEnumUnit;
    
interface
    
type
  TipoAmbienteNFeEnum = (teNaoDefinido, teProducao, teHomologacao);

function TipoAmbienteNFeToEnum(const Value: string): TipoAmbienteNFeEnum;

implementation

uses
  SysUtils;

function TipoAmbienteNFeToEnum(const Value: string): TipoAmbienteNFeEnum;
var
  eVal: SmallInt;
begin
  eVal := StrToIntDef(Value, -1);
  case eVal of
    0..2:
      Result := TipoAmbienteNFeEnum(eVal);
    else
      Result := teNaoDefinido;
  end;
end;
    
end.