unit VeiculoZeroKmPendenteEntradaEstoqueModel;

interface

uses
  System.Classes;

type

  TVeiculoZeroKmPendenteEntradaEstoqueModel = class(TPersistent)
  private
    Fchassi: string;
    FdataHoraCadastro: TDateTime;
  published
    property chassi: string read Fchassi write Fchassi;
    property dataHoraCadastro: TDateTime read FdataHoraCadastro write FdataHoraCadastro;
  end;

implementation

end.
