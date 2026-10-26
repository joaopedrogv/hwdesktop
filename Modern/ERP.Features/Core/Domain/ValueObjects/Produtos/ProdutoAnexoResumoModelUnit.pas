unit ProdutoAnexoResumoModelUnit;

interface

uses
  DateAndTimeNullableUnit;

type
  ProdutoAnexoResumoModel = record
  private
    FQtdeNcmsRegulares: Integer;
    FQtdeNcmsCompativeisAnexo: Integer;
    FQtdeNcmsCompativeisUmParaUm: Integer;
    FQtdeNcmsCompativeisNParaUm: Integer;
    FQtdeNcmsIncompativeis: Integer;
    FQtdeNcmsInexistentes: Integer;
    FQtdeNcmsExtintos: Integer;
    FQtdeProdutosRegulares: Integer;
    FQtdeProdutosCompativeisAnexo: Integer;
    FQtdeProdutosCompativeisUmParaUm: Integer;
    FQtdeProdutosCompativeisNParaUm: Integer;
    FQtdeProdutosIncompativeis: Integer;
    FQtdeProdutosNcmInexistentes: Integer;
    FQtdeProdutosNcmExtintos: Integer;
    FPrimeiraRevisao: DateTimeNullable;
    FUltimaRevisao: DateTimeNullable;
  public
    class function Create(
      QtdeNcmsRegulares: Integer;
      QtdeNcmsCompativeisAnexo: Integer;
      QtdeNcmsCompativeisUmParaUm: Integer;
      QtdeNcmsCompativeisNParaUm: Integer;
      QtdeNcmsIncompativeis: Integer;
      QtdeNcmsInexistentes: Integer;
      QtdeNcmsExtintos: Integer;
      QtdeProdutosRegulares: Integer;
      QtdeProdutosCompativeisAnexo: Integer;
      QtdeProdutosCompativeisUmParaUm: Integer;
      QtdeProdutosCompativeisNParaUm: Integer;
      QtdeProdutosIncompativeis: Integer;
      QtdeProdutosNcmInexistentes: Integer;
      QtdeProdutosNcmExtintos: Integer;
      const PrimeiraRevisaoIbsCbs: DateTimeNullable;
      const UltimaRevisaoIbsCbs: DateTimeNullable
    ): ProdutoAnexoResumoModel; static;

    property QtdeNcmsRegulares: Integer read FQtdeNcmsRegulares;
    property QtdeNcmsCompativeisAnexo: Integer read FQtdeNcmsCompativeisAnexo;
    property QtdeNcmsCompativeisUmParaUm: Integer read FQtdeNcmsCompativeisUmParaUm;
    property QtdeNcmsCompativeisNParaUm: Integer read FQtdeNcmsCompativeisNParaUm;
    property QtdeNcmsIncompativeis: Integer read FQtdeNcmsIncompativeis;
    property QtdeNcmsInexistentes: Integer read FQtdeNcmsInexistentes;
    property QtdeNcmsExtintos: Integer read FQtdeNcmsExtintos;
    property QtdeProdutosRegulares: Integer read FQtdeProdutosRegulares;
    property QtdeProdutosCompativeisAnexo: Integer read FQtdeProdutosCompativeisAnexo;
    property QtdeProdutosCompativeisUmParaUm: Integer read FQtdeProdutosCompativeisUmParaUm;
    property QtdeProdutosCompativeisNParaUm: Integer read FQtdeProdutosCompativeisNParaUm;
    property QtdeProdutosIncompativeis: Integer read FQtdeProdutosIncompativeis;
    property QtdeProdutosNcmInexistentes: Integer read FQtdeProdutosNcmInexistentes;
    property QtdeProdutosNcmExtintos: Integer read FQtdeProdutosNcmExtintos;
    property PrimeiraRevisaoIbsCbs: DateTimeNullable read FPrimeiraRevisao;
    property UltimaRevisaoIbsCbs: DateTimeNullable read FUltimaRevisao;
  end;

implementation

{ ProdutoAnexoResumoModel }

class function ProdutoAnexoResumoModel.Create(
  QtdeNcmsRegulares: Integer;
  QtdeNcmsCompativeisAnexo: Integer;
  QtdeNcmsCompativeisUmParaUm: Integer;
  QtdeNcmsCompativeisNParaUm: Integer;
  QtdeNcmsIncompativeis: Integer;
  QtdeNcmsInexistentes: Integer;
  QtdeNcmsExtintos: Integer;
  QtdeProdutosRegulares: Integer;
  QtdeProdutosCompativeisAnexo: Integer;
  QtdeProdutosCompativeisUmParaUm: Integer;
  QtdeProdutosCompativeisNParaUm: Integer;
  QtdeProdutosIncompativeis: Integer;
  QtdeProdutosNcmInexistentes: Integer;
  QtdeProdutosNcmExtintos: Integer;
  const PrimeiraRevisaoIbsCbs: DateTimeNullable;
  const UltimaRevisaoIbsCbs: DateTimeNullable
): ProdutoAnexoResumoModel;
begin
  Result.FQtdeNcmsRegulares := QtdeNcmsRegulares;
  Result.FQtdeNcmsCompativeisAnexo := QtdeNcmsCompativeisAnexo;
  Result.FQtdeNcmsCompativeisUmParaUm := QtdeNcmsCompativeisUmParaUm;
  Result.FQtdeNcmsCompativeisNParaUm := QtdeNcmsCompativeisNParaUm;
  Result.FQtdeNcmsIncompativeis := QtdeNcmsIncompativeis;
  Result.FQtdeNcmsInexistentes := QtdeNcmsInexistentes;
  Result.FQtdeNcmsExtintos := QtdeNcmsExtintos;
  Result.FQtdeProdutosRegulares := QtdeProdutosRegulares;
  Result.FQtdeProdutosCompativeisAnexo := QtdeProdutosCompativeisAnexo;
  Result.FQtdeProdutosCompativeisUmParaUm := QtdeProdutosCompativeisUmParaUm;
  Result.FQtdeProdutosCompativeisNParaUm := QtdeProdutosCompativeisNParaUm;
  Result.FQtdeProdutosIncompativeis := QtdeProdutosIncompativeis;
  Result.FQtdeProdutosNcmInexistentes := QtdeProdutosNcmInexistentes;
  Result.FQtdeProdutosNcmExtintos := QtdeProdutosNcmExtintos;
  Result.FPrimeiraRevisao := PrimeiraRevisaoIbsCbs;
  Result.FUltimaRevisao := UltimaRevisaoIbsCbs;
end;

end.
