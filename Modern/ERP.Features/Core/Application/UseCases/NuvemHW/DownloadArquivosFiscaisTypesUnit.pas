unit DownloadArquivosFiscaisTypesUnit;

interface

type
  /// <summary>
  ///   Nao estamos mais utilizando o Caso de uso que usa esse Modelo
  /// </summary>
  DownloadArquivosFiscaisOutPut = record
  private
    FCalculadora: string;
    FNcmsFuturos: string;
    FNcmsHistoricos: string;
    FNcmsVigentes: string;
  public
    class function Create(
      const Calculadora: string;
      const NcmsFuturos: string;
      const NcmsHistoricos: string;
      const NcmsVigentes: string
    ): DownloadArquivosFiscaisOutPut; static;

    property Calculadora: string read FCalculadora write FCalculadora;
    property NcmsFuturos: string read FNcmsFuturos write FNcmsFuturos;
    property NcmsHistoricos: string read FNcmsHistoricos write FNcmsHistoricos;
    property NcmsVigentes: string read FNcmsVigentes write FNcmsVigentes;
  end;

implementation

{ DownloadArquivosFiscaisOutPut }

class function DownloadArquivosFiscaisOutPut.Create(const Calculadora, NcmsFuturos, NcmsHistoricos,
  NcmsVigentes: string): DownloadArquivosFiscaisOutPut;
begin
  Result.FCalculadora := Calculadora;
  Result.FNcmsFuturos := NcmsFuturos;
  Result.FNcmsHistoricos := NcmsHistoricos;
  Result.FNcmsVigentes := NcmsVigentes;
end;

end.
