unit Hw.Integra.Credito.Aviso;

interface

type
  TCreditoAviso = class
  private
    FCreditoId: Integer;
    FDataVencimento: TDateTime;
    FDataAviso: TDateTime;
    FEmail: string;
    FSerialHd: string;
  public
    property CreditoId: Integer read FCreditoId write FCreditoId;
    property DataAviso: TDateTime read FDataAviso write FDataAviso;
    property DataVencimento: TDateTime read FDataVencimento write FDataVencimento;
    property SerialHd: string read FSerialHd write FSerialHd;
    property Email: string read FEmail write FEmail;
  end;

implementation

end.
