// IPrepararNFSeParaEmissaoService.pas
unit IPrepararNFSeParaEmissaoServiceUnit;

interface

uses
  NFSeEtdUnit, ValidationEntityOutputUnit, ConfiguracaoNFSeModelUnit;

type
  PreparacaoNFSeResult = record
  private
    FNFSe: NFSeEtd;
    FValidacoes: ValidationEntityOutput;
  public
    class function Create(NFSe: NFSeEtd; const Validacoes: ValidationEntityOutput): PreparacaoNFSeResult; static;

    property NFSe: NFSeEtd read FNFSe;
    property Validacoes: ValidationEntityOutput read FValidacoes;
  end;

  IPrepararNFSeParaEmissaoService = interface
    ['{2C112395-60A7-4E65-8B08-89214C112AA6}']
    function Preparar(
      const NFSeId: string; EmpresaId: Integer; const Config: ConfiguracaoNFSeModel
    ): PreparacaoNFSeResult;
  end;

implementation

{ PreparacaoNFSeResult }

class function PreparacaoNFSeResult.Create(NFSe: NFSeEtd;
  const Validacoes: ValidationEntityOutput): PreparacaoNFSeResult;
begin
  Result.FNFSe := NFSe;
  Result.FValidacoes := Validacoes;
end;

end.
