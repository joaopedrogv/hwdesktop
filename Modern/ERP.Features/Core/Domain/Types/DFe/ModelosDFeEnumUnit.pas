unit ModelosDFeEnumUnit;

interface

type
  ModelosDFeEnum = (mdNaoDefinido, mdNFe, mdNFCe);

  ModelosDFeEnumSet = set of ModelosDFeEnum;

  ModelosDFeEnumUtils = class
  public
    class function StrToEnum(const Codigo: string): ModelosDFeEnum; static;
  end;

implementation

uses
  StrUtils;

{ ModelosDFeEnumUtils }

class function ModelosDFeEnumUtils.StrToEnum(const Codigo: string): ModelosDFeEnum;
const
  MODELOS: array[ModelosDFeEnum] of string = ('', '55', '65');
begin
  Result := ModelosDFeEnum( IndexStr(Codigo, MODELOS) );
end;

end.
