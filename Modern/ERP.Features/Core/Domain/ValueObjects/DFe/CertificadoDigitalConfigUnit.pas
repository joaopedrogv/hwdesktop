unit CertificadoDigitalConfigUnit;

interface

type
  CertificadoDigitalConfig = record
  private
    FCaminhoArquivo: string;
    FNumeroDeSerie: string;
    FSenha: string;
    FBase64PFX: string;
  public
    class function Create(
      const ACaminhoArquivo: string;
      const ANumeroDeSerie: string;
      const ASenha: string;
      const ABase64PFX: string
    ): CertificadoDigitalConfig; static;

    property CaminhoArquivo: string read FCaminhoArquivo;
    property NumeroDeSerie: string read FNumeroDeSerie;
    property Senha: string read FSenha;
    property Base64PFX: string read FBase64PFX;
  end;

implementation

{ CertificadoDigitalConfig }

class function CertificadoDigitalConfig.Create(
  const ACaminhoArquivo: string;
  const ANumeroDeSerie: string;
  const ASenha: string;
  const ABase64PFX: string
): CertificadoDigitalConfig;
begin
  Result.FCaminhoArquivo := ACaminhoArquivo;
  Result.FNumeroDeSerie := ANumeroDeSerie;
  Result.FSenha := ASenha;
  Result.FBase64PFX := ABase64PFX;
end;

end.
