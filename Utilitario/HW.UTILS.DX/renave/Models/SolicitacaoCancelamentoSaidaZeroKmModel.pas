unit SolicitacaoCancelamentoSaidaZeroKmModel;

interface

uses
  System.Classes;

type
  TSolicitacaoCancelamentoSaidaZeroKmModel = class(TPersistent)
  private
    FcpfOperadorResponsavel: string;
    FdataCancelamentoSaidaEstoque: TDateTime;
    FidEstoque: Int64;
  published
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
    property dataCancelamentoSaidaEstoque: TDateTime read FdataCancelamentoSaidaEstoque write FdataCancelamentoSaidaEstoque;
    property idEstoque: Int64 read FidEstoque write FidEstoque;
  end;

implementation

end.
