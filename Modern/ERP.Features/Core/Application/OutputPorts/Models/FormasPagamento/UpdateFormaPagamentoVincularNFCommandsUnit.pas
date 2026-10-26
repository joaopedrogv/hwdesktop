unit UpdateFormaPagamentoVincularNFCommandsUnit;

interface

uses IntegerNullableUnit;

type
  UpdateFormaPagamentoVincularNFCommand = record
  private
    FFormaPgtoId: Integer;
    FEmpresaId: Integer;
    FNumeroNF: Integer;
    FSubSerie: Integer;
    FNumDocumeto: string;
  public
    class function Create(
      AFormaPgtoId, AEmpresaId, ANumeroNF, ASubSerie: Integer;
      const ANumDocumeto: string
    ): UpdateFormaPagamentoVincularNFCommand; static;

    property FormaPgtoId: Integer read FFormaPgtoId;
    property EmpresaId: Integer read FEmpresaId;
    property NumeroNF: Integer read FNumeroNF;
    property SubSerie: Integer read FSubSerie;
    property NumDocumeto: string read FNumDocumeto;
  end;

  UpdateFormaPagamentoDesvincularNFCommand = record
  private
    FFormaPgtoId: Integer;
    FEmpresaId: Integer;
    FNumDocumeto: string;
  public
    class function Create(
      AFormaPgtoId, AEmpresaId: Integer;
      const ANumDocumeto: string
    ): UpdateFormaPagamentoDesvincularNFCommand; static;

    property FormaPgtoId: Integer read FFormaPgtoId;
    property EmpresaId: Integer read FEmpresaId;
    property NumDocumeto: string read FNumDocumeto;
  end;

implementation

{ UpdateFormaPagamentoVincularNFCommand }

class function UpdateFormaPagamentoVincularNFCommand.Create(
  AFormaPgtoId, AEmpresaId, ANumeroNF, ASubSerie: Integer;
  const ANumDocumeto: string
): UpdateFormaPagamentoVincularNFCommand;
begin
  Result.FFormaPgtoId := AFormaPgtoId;
  Result.FEmpresaId := AEmpresaId;
  Result.FNumeroNF := ANumeroNF;
  Result.FSubSerie := ASubSerie;
  Result.FNumDocumeto := ANumDocumeto;
end;

{ UpdateFormaPagamentoDesvincularNFCommand }

class function UpdateFormaPagamentoDesvincularNFCommand.Create(
  AFormaPgtoId, AEmpresaId: Integer; const ANumDocumeto: string
): UpdateFormaPagamentoDesvincularNFCommand;
begin
  Result.FFormaPgtoId := AFormaPgtoId;
  Result.FEmpresaId := AEmpresaId;
  Result.FNumDocumeto := ANumDocumeto;
end;

end.
