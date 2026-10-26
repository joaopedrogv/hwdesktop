unit Hw.Integra.Api.Credito;

interface

type
  TCredito = class
  private
    FValorCorrigido: Double;
    FHistorico: String;
    FParcelaQtd: Integer;
    FEmpresaId: Integer;
    FValor: Double;
    //FCliente: TObject;
    FNossoNumeroBanco: String;
    FTipoDocumento: String;
    FDataVencimento: TDateTime;
    FCreditoId: Integer;
    FVendaId: Integer;
    FStatus: String;
    FDataQuitacao: TDateTime;
    FClienteId: Integer;
    FParcelaSeq: Integer;
    FNumeroDocumento: String;
    FVendaTipo: String;
  published
    property CreditoId: Integer read FCreditoId write FCreditoId;
    property EmpresaId: Integer read FEmpresaId write FEmpresaId;
    property ClienteId: Integer read FClienteId write FClienteId;
    property TipoDocumento: String read FTipoDocumento write FTipoDocumento;
    property Historico: String read FHistorico write FHistorico;
    property DataVencimento: TDateTime read FDataVencimento write FDataVencimento;
    property Valor: Double read FValor write FValor;// class
    property Status: String read FStatus write FStatus;
    property DataQuitacao: TDateTime read FDataQuitacao write FDataQuitacao;
    property VendaTipo: String read FVendaTipo write FVendaTipo;
    property VendaId: Integer read FVendaId write FVendaId;
    property NumeroDocumento: String read FNumeroDocumento write FNumeroDocumento;
    property ValorCorrigido: Double read FValorCorrigido write FValorCorrigido;// class
    property NossoNumeroBanco: String read FNossoNumeroBanco write FNossoNumeroBanco;
    property ParcelaSeq: Integer read FParcelaSeq write FParcelaSeq;
    property ParcelaQtd: Integer read FParcelaQtd write FParcelaQtd;
    //property Cliente: TObject read FCliente write FCliente;// class
  end;

implementation

end.
