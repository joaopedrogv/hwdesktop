unit Hw.Integra.Api.CreditoBoleto;

interface

uses
  Hw.Integra.Api.Credito,
  Hw.Integra.Api.Boleto;

type
  TCreditoBoleto = class(TCredito)
  private
    FCnpj: string;
    FBoleto: TBoleto;
  public
    property Cnpj: string read FCnpj write FCnpj;
    property Boleto: TBoleto read FBoleto write FBoleto;// class
  end;

implementation

end.
