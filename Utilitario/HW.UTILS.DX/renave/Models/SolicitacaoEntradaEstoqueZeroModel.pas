unit SolicitacaoEntradaEstoqueZeroModel;

interface

type
  TSolicitacaoEntradaEstoqueZeroModel = class
  private
    Fchassi: string;
    FchaveNotaFiscal: string;
    FcpfOperadorResponsavel: string;
    FdataEntradaEstoque: TDateTime;
    FdataHoraMedicaoHodometro: TDateTime;
    FquilometragemHodometro: Integer;
    FvalorCompra: Double;
  published
    property chassi: string read Fchassi write Fchassi;
    property chaveNotaFiscal: string read FchaveNotaFiscal write FchaveNotaFiscal;
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
    property dataEntradaEstoque: TDateTime read FdataEntradaEstoque write FdataEntradaEstoque;
    property dataHoraMedicaoHodometro: TDateTime read FdataHoraMedicaoHodometro write FdataHoraMedicaoHodometro;
    property quilometragemHodometro: Integer read FquilometragemHodometro write FquilometragemHodometro;
    property valorCompra: Double read FvalorCompra write FvalorCompra;
  end;

implementation

end.
