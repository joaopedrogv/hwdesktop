unit BaseCalculoNaturezaEnumUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/api/model/input/basecalculo/enumeration/BaseCalculoNatureza.java

interface

type
  BaseCalculoNatureza = (bcnUnassigned, bcnBem, bcnServico);

function BaseCalculoNaturezaParaTexto(Natureza: BaseCalculoNatureza): string;

implementation

function BaseCalculoNaturezaParaTexto(Natureza: BaseCalculoNatureza): string;
begin
  case Natureza of
    bcnBem: Result := 'BEM';
    bcnServico: Result := 'SERVICO';
  else
    Result := 'null';
  end;
end;

end.
