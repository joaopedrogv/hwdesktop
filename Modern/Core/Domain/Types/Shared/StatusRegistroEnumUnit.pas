unit StatusRegistroEnumUnit;

interface

type
  StatusRegistroEnum = (saLixeira, saAtivo, saPreCadastro, saExclusaoLogica);

  StatusRegistroUtils = class
  public
    class function FromInt(Value: Integer): StatusRegistroEnum;
  end;

implementation

{ StatusRegistroUtils }

class function StatusRegistroUtils.FromInt(Value: Integer): StatusRegistroEnum;
begin
  case Value of
    0,2: Result := StatusRegistroEnum(Value);
    99 : Result := saExclusaoLogica;
  else
    Result := saAtivo;
  end;
end;

end.
