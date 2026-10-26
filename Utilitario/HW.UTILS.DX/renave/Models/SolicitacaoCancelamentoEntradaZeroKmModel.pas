unit SolicitacaoCancelamentoEntradaZeroKmModel;

interface

uses
  System.Classes;

type
  TSolicitacaoCancelamentoEntradaZeroKmModel = class(TPersistent)
  private
    FcpfOperadorResponsavel: string;
    FdataCancelamentoEntradaEstoque: TDateTime;
    FidEstoque: Int64;
  published
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
    property dataCancelamentoEntradaEstoque: TDateTime read FdataCancelamentoEntradaEstoque write FdataCancelamentoEntradaEstoque;
    property idEstoque: Int64 read FidEstoque write FidEstoque;
  end;

implementation

end.
