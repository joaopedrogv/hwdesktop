unit IEmitirNFSeServiceUnit;

interface

uses
  EmitirNFSeCommandUnit, ResultadoNFSeOutputUnit, EmitirLoteNFSeCommandUnit, EmissaoLoteNFSeOutputUnit,
  ResultadoOperacaoDFeUnit;

type
  IEmitirNFSeService = interface
    ['{DF1E643E-A35E-4C61-8428-7796B2B7D5E4}']
    function Consultar(const Input: EmitirNFSeCommand): ResultadoOperacaoDFe;
    function Emitir(const Input: EmitirNFSeCommand): ResultadoOperacaoDFe; overload;
    function Emitir(const Input: EmitirLoteNFSeCommand): EmissaoLoteNFSeOutput; overload;
  end;

implementation

end.
