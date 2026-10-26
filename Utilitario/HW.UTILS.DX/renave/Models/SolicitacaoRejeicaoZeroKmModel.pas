unit SolicitacaoRejeicaoZeroKmModel;

interface

uses
  System.Classes;

type
  TSolicitacaoRejeicaoZeroKmModel = class(TPersistent)
  private
    Fchassi: string;
    FcpfOperadorResponsavel: string;
    FmotivoRejeicao: string;
  published
    property chassi: string read Fchassi write Fchassi;
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
    property motivoRejeicao: string read FmotivoRejeicao write FmotivoRejeicao;
  end;

  TSolicitacaoCancelamentoRejeicaoZeroKmModel = class(TPersistent)
  private
    Fchassi: string;
    FcpfOperadorResponsavel: string;
  published
    property chassi: string read Fchassi write Fchassi;
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
  end;

implementation

end.
