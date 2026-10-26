unit SolicitacaoDevolucaoMontadoraZeroKmModel;

interface

uses
  System.Classes;

type
  TSolicitacaoDevolucaoMontadoraZeroKmModel = class(TPersistent)
  private
    FchaveNotaFiscal: string;
    FcpfOperadorResponsavel: string;
    FdataDevolucao: TDateTime;
    FidEstoque: Int64;
    FmotivoDevolucaoMontadora: string;
  published
    property chaveNotaFiscal: string read FchaveNotaFiscal write FchaveNotaFiscal;
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
    property dataDevolucao: TDateTime read FdataDevolucao write FdataDevolucao;
    property idEstoque: Int64 read FidEstoque write FidEstoque;
    property motivoDevolucaoMontadora: string read FmotivoDevolucaoMontadora write FmotivoDevolucaoMontadora;
  end;

implementation

end.
