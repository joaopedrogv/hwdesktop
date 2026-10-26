unit ConfiguracaoNFSeModelUnit;

interface

uses
  TipoComunsUnit,
  StringNullableUnit,
  NFSeTypesUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit,
  CertificadoDigitalConfigUnit,
  WebServiceDFeModelUnit;

type
  OpcoesDiscriminacaoModel = record
  private
    FSemObsOS: Boolean;
    FDComptIgualDataAtual: Boolean;
    FLineBreaker: string;
  public
    class function Create( ASemObsOS, ADComptIgualDataAtual: Boolean; const ALineBreaker: string): OpcoesDiscriminacaoModel; static;
    property SemObsOS: Boolean read FSemObsOS;
    property DComptIgualDataAtual: Boolean read FDComptIgualDataAtual;
    property LineBreaker: string read FLineBreaker;
  end;

  OpcoesImpressaoModel = record
  private
    FLayoutNacional: Boolean;
    FPrefeitura: string;
  public
    class function Create( ALayoutNacional: Boolean; const APrefeitura: string ): OpcoesImpressaoModel; static;
    property LayoutNacional: Boolean read FLayoutNacional write FLayoutNacional;
    property Prefeitura: string read FPrefeitura;
  end;

  // Talvez esse modelo deva ir pra pasta de configuracoes, e sua composicao também
  ConfiguracaoNFSeModel = record
  private
    FSerie: string;
    FInibirValTrib: Boolean;
    FPreferirAliqSNaoIbpt: Boolean;
    FEnviarInscricaoMunicipal: Boolean;
    FConvenioSistemaNacionalAtivo: Boolean;
    FIncentivoCultural: Boolean;
    FAgruparPorCTribNac: Boolean;
    FCMunEmitente: Integer;
    FRegApTribSN: RegimeApuracaoSNEnum;
    FRegEsTrib: Integer;
    FOpInternaId: StringNullable;
    FOpSimpNac: OptanteSNEnum;
    FPTotTribSN: CurrencyNullable;
    FCertificado: CertificadoDigitalConfig;
    FWebService: WebServiceDFeModel;
    FLayoutNFSe: LayoutNFSeEnum;
    FOpcoesDiscriminacao: OpcoesDiscriminacaoModel;
    FOpcoesImpressao: OpcoesImpressaoModel;
    FDataDesativacaoLegado: DateTimeNullable;
    FUsarMensageriaAI: Boolean;
  public
    class function Create(
      const Serie: string;
      InibirValTrib: Boolean;
      EnviarInscricaoMunicipal: Boolean;
      ConvenioSistemaNacionalAtivo: Boolean;
      PreferirAliqSNaoIbpt: Boolean;
      IncentivoCultural: Boolean;
      AgruparPorCTribNac: Boolean;
      CMunEmitente: Integer;
      RegApTribSN: RegimeApuracaoSNEnum;
      RegEsTrib: Integer;
      const OpInternaId: StringNullable;
      OpSimpNac: OptanteSNEnum;
      const PTotTribSN: CurrencyNullable;
      LayoutNFSe: LayoutNFSeEnum;
      const Certificado: CertificadoDigitalConfig;
      const WebService: WebServiceDFeModel;
      const OpcoesDiscriminacao: OpcoesDiscriminacaoModel;
      const OpcoesImpressao: OpcoesImpressaoModel;
      const DataDesativacaoLegado: DateTimeNullable;
      UsarMensageriaAI: Boolean
    ): ConfiguracaoNFSeModel; static;

    property Serie: string read FSerie;
    property InibirValTrib: Boolean read FInibirValTrib;
    property PreferirAliqSNaoIbpt: Boolean read FPreferirAliqSNaoIbpt;
    property EnviarInscricaoMunicipal: Boolean read FEnviarInscricaoMunicipal;
    property ConvenioSistemaNacionalAtivo: Boolean read FConvenioSistemaNacionalAtivo;
    property IncentivoCultural: Boolean read FIncentivoCultural;
    property AgruparPorCTribNac: Boolean read FAgruparPorCTribNac;
    property CMunEmitente: Integer read FCMunEmitente;
    property RegApTribSN: RegimeApuracaoSNEnum read FRegApTribSN;
    property RegEsTrib: Integer read FRegEsTrib;
    property OpInternaId: StringNullable read FOpInternaId;
    property OpSimpNac: OptanteSNEnum read FOpSimpNac;
    property PTotTribSN: CurrencyNullable read FPTotTribSN;
    property LayoutNFSe: LayoutNFSeEnum read FLayoutNFSe;
    property Certificado: CertificadoDigitalConfig read FCertificado;
    property WebService: WebServiceDFeModel read FWebService;
    property OpcoesDiscriminacao: OpcoesDiscriminacaoModel read FOpcoesDiscriminacao;
    property OpcoesImpressao: OpcoesImpressaoModel read FOpcoesImpressao;
    property DataDesativacaoLegado: DateTimeNullable read FDataDesativacaoLegado;
    property UsarMensageriaAI: Boolean read FUsarMensageriaAI;
  end;

implementation

{ ConfiguracaoNFSeModel }

class function ConfiguracaoNFSeModel.Create(
  const Serie: string;
  InibirValTrib: Boolean;
  EnviarInscricaoMunicipal: Boolean;
  ConvenioSistemaNacionalAtivo: Boolean;
  PreferirAliqSNaoIbpt: Boolean;
  IncentivoCultural: Boolean;
  AgruparPorCTribNac: Boolean;
  CMunEmitente: Integer;
  RegApTribSN: RegimeApuracaoSNEnum;
  RegEsTrib: Integer;
  const OpInternaId: StringNullable;
  OpSimpNac: OptanteSNEnum;
  const PTotTribSN: CurrencyNullable;
  LayoutNFSe: LayoutNFSeEnum;
  const Certificado: CertificadoDigitalConfig;
  const WebService: WebServiceDFeModel;
  const OpcoesDiscriminacao: OpcoesDiscriminacaoModel;
  const OpcoesImpressao: OpcoesImpressaoModel;
  const DataDesativacaoLegado: DateTimeNullable;
  UsarMensageriaAI: Boolean
): ConfiguracaoNFSeModel;
begin
  Result.FSerie := Serie;
  Result.FInibirValTrib := InibirValTrib;
  Result.FEnviarInscricaoMunicipal := EnviarInscricaoMunicipal;
  Result.FConvenioSistemaNacionalAtivo := ConvenioSistemaNacionalAtivo;
  Result.FPreferirAliqSNaoIbpt := PreferirAliqSNaoIbpt;
  Result.FIncentivoCultural := IncentivoCultural;
  Result.FAgruparPorCTribNac := AgruparPorCTribNac;
  Result.FCMunEmitente := CMunEmitente;
  Result.FRegApTribSN := RegApTribSN;
  Result.FRegEsTrib := RegEsTrib;
  Result.FOpInternaId := OpInternaId;
  Result.FOpSimpNac := OpSimpNac;
  Result.FLayoutNFSe := LayoutNFSe;
  Result.FPTotTribSN := PTotTribSN;
  Result.FCertificado := Certificado;
  Result.FWebService := WebService;
  Result.FOpcoesDiscriminacao := OpcoesDiscriminacao;
  Result.FOpcoesImpressao := OpcoesImpressao;
  Result.FDataDesativacaoLegado := DataDesativacaoLegado;
  Result.FUsarMensageriaAI := UsarMensageriaAI;
end;

{ OpcoesDiscriminacaoModel }

class function OpcoesDiscriminacaoModel.Create(ASemObsOS, ADComptIgualDataAtual: Boolean; const ALineBreaker: string): OpcoesDiscriminacaoModel;
begin
  Result.FSemObsOS := ASemObsOS;
  Result.FDComptIgualDataAtual := ADComptIgualDataAtual;
  Result.FLineBreaker := ALineBreaker;
end;

{ OpcoesImpressaoModel }

class function OpcoesImpressaoModel.Create( ALayoutNacional: Boolean; const APrefeitura: string ): OpcoesImpressaoModel;
begin
  Result.FLayoutNacional := ALayoutNacional;
  Result.FPrefeitura := APrefeitura;
end;

end.
