unit VeiculoDadosHodometroModel;

interface

uses
  System.Classes;

type

  TVeiculoDadosHodometroModel = class(TPersistent)
  private
    FvalorHodometro: Integer;
    FdataMedicao: TDateTime;
    FveiculoId: Integer;
    Fchassi: string;
  published
    property veiculoId: Integer read FveiculoId write FveiculoId;
    property chassi: string read Fchassi write Fchassi;
    property valorHodometro: Integer read FvalorHodometro write FvalorHodometro;
    property dataMedicao: TDateTime read FdataMedicao write FdataMedicao;
  end;

implementation

end.
