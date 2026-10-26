unit DFeDLLHeader;

interface

type
  DFeDLLFeature = (dftEmitir, dftConsultar, dftCancelar, dftImprimir, dftSalvarPDF, dftEmail);
  DFeDLLFeatureSet = set of DFeDLLFeature;

  DFeDLLCallFeatureInput = record
    NFSeId: WideString;
    EmpresaId: Integer;
    Silent: Boolean;      // Nao chama nenhuma interação visual, inclusive impressão, exceto no metodo Imprimir
    Features: Cardinal;
    PdfFileName: WideString;  // vai gerar com o NFSeId.pdf, ex: E1CB7785-EB41-457A-A527-EE6CEDEC1792.pdf. Mesma coisa que GerarPDF = True
    Email: WideString;
  end;

  NFSeCallEmitirLoteInput = record
    NFSeIDs: WideString;    // Separar os IDs por ;
    EmpresaId: Integer;
    Silent: Boolean;        // Nao chama nenhuma interação visual, inclusive impressão
    Emails: WideString;     // Array separado por ; Mesma quantidade de NFSeIDs
  end;

  NFSeCallEnviarEmailInput = record
    NFSeIDs: WideString;    // Separar os IDs por ;
    Emails: WideString;     // Array separado por ; Mesma quantidade de NFSeIDs
    EmpresaId: Integer;
    Silent: Boolean;        // Nao chama nenhuma interação visual, inclusive impressão
    UnicoEmail: Boolean;    // Criar um email somente com todas as NFSe's de NFSeIDs
    AnexarPDF: Boolean;     // Anexa o PDF do DANFSe
  end;

  NFSeCallCriarAnexoslInput = record
    NFSeIDs: WideString;    // Separar os IDs por ;
    EmpresaId: Integer;
    Silent: Boolean;        // Nao chama nenhuma interação visual, inclusive impressão
    AnexarPDF: Boolean;     // Anexa o PDF do DANFSe
  end;

function FeaturesToCardinal(Features: DFeDLLFeatureSet): Cardinal; //inline;
function CardinalToFeatures(Value: Cardinal): DFeDLLFeatureSet;

{ Desnecessario com a conversao da funcao acima
const
  CF_EMITIR     = 1 shl Ord(dftEmitir);
  CF_CONSULTAR  = 1 shl Ord(dftConsultar);
  CF_CANCELAR   = 1 shl Ord(dftCancelar);
  CF_IMPRIMIR   = 1 shl Ord(dftImprimir);
  CF_SALVARPDF  = 1 shl Ord(dftSalvarPDF);
  CF_EMAIL      = 1 shl Ord(dftEmail);
}

implementation

function FeaturesToCardinal(Features: DFeDLLFeatureSet): Cardinal;
begin
  Move(Features, Result, SizeOf(Cardinal));
end;

function CardinalToFeatures(Value: Cardinal): DFeDLLFeatureSet;
begin
  Move(Value, Result, SizeOf(Cardinal));
end;

end.
