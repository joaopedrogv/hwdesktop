unit ITradutorErrosRtcUnit;

interface

uses
  ValidacaoItemOutputUnit, TipoComunsUnit;

type

  ITradutorErrosRTC = interface
    ['{444E8E40-C5F4-495B-84A7-BDE93B2C3A17}']
    function Traduzir(const Validacao: ValidacaoItemOutput): string; overload;
    function Traduzir(Codigo: Integer; const Detalhe: string): string; overload;
    function Traduzir(const Validacoes: ValidacaoItensOutput): TArrayString; overload;
  end;

implementation

end.
