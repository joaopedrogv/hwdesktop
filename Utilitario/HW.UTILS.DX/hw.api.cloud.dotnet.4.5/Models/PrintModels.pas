unit PrintModels;

interface

type

  TPrintBaseAgent = class
  private
    FAgentId: string;
  published
     property AgentId: string read FAgentId write FAgentId;
  end;

  TPrintBase = class(TPrintBaseAgent)
  private
    FNumberCopies: Integer;
    FPosprinterName: string;
    FPosprinterValue: string;
  published
     property NumberCopies: Integer read FNumberCopies write FNumberCopies;
     property PosprinterName: string read FPosprinterName write FPosprinterName;
     property PosprinterValue: string read FPosprinterValue write FPosprinterValue;
  end;

  TPrintTextModel = class(TPrintBase)
  private
    FText: string;
  published
    property Text: string read FText write FText;
  end;

  TPrintNFCeModel = class(TPrintBase)
  private
    FXMLAut: string;
    FXMLCan: string;
    FNFCeConfigName: string;
    FNFCeConfigValue: string;
    FPrintParams: string;
  published
    property XMLAut: string read FXMLAut write FXMLAut;
    property XMLCan: string read FXMLCan write FXMLCan;
    property NFCeConfigName: string read FNFCeConfigName write FNFCeConfigName;
    property NFCeConfigValue: string read FNFCeConfigValue write FNFCeConfigValue;
    property PrintParams: string read FPrintParams write FPrintParams;
  end;

  TPrintTermicModel = class(TPrintBaseAgent)
  private
    Fname: string;
    Ftext: string;
  published
    property name: string read Fname write Fname;
    property text: string read Ftext write Ftext;
  end;

  TPrintPDFModel = class(TPrintBaseAgent)
  private
    FprintName: string;
    FpdfBase64: string;
  published
    property printName: string read FprintName write FprintName;
    property pdfBase64: string read FpdfBase64 write FpdfBase64;
  end;


  TOpenDrawerModel = class(TPrintBase)
  private
    FNFCeConfigName: string;
    FNFCeConfigValue: string;
  published
    property NFCeConfigName: string read FNFCeConfigName write FNFCeConfigName;
    property NFCeConfigValue: string read FNFCeConfigValue write FNFCeConfigValue;
  end;

  TAgents = class
  private
    FId: string;
  published
    property Id: string read FId write FId;
  end;

implementation

end.
