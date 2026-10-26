unit SalvarConfigNFSeInputUnit;

interface

uses
  TipoComunsUnit,
  StringNullableUnit,
  NFSeTypesUnit,
  CurrencyNullableUnit,
  CertificadoDigitalConfigUnit,
  WebServiceDFeModelUnit;

type
  ComunicacaoSistemaEnum = (csADN, csProvedor);

  SalvarConfigNFSeInput = record
  private        
    FEmpresaId: Integer;
    FCMunEmitente: Integer;    
    FLayoutNFSe: LayoutNFSeEnum;
    FSerie: string;
    FInibirValTrib: Boolean;
    FPreferirAliqSNaoIbpt: Boolean;
    FEnviarInscricaoMunicipal: Boolean;
    FConvenioSistemaNacionalAtivo: Boolean;
    FIncentivoCultural: Boolean;
    FAgruparPorCTribNac: Boolean;
    FRegApTribSN: RegimeApuracaoSNEnum;
    FRegEsTrib: Integer;
    FOpInternaId: StringNullable;
    FOpSimpNac: OptanteSNEnum;
    FWSFraseSecreta: string;
    FWSChaveAcesso: string;
    FWSSenha: string;
    FComunicacaoSistema: ComunicacaoSistemaEnum;
    FImpressaoSimplificada: Boolean;
    FDesativacaoModuloLegado: Boolean;
    FDComptIgualDataAtual: Boolean;
  public
    class function Create(
      EmpresaId: Integer;
      CMunEmitente: Integer;
      LayoutNFSe: LayoutNFSeEnum;
      const Serie: string;
      InibirValTrib: Boolean;
      EnviarInscricaoMunicipal: Boolean;
      ConvenioSistemaNacionalAtivo: Boolean;
      PreferirAliqSNaoIbpt: Boolean;
      IncentivoCultural: Boolean;
      AgruparPorCTribNac: Boolean;
      RegApTribSN: RegimeApuracaoSNEnum;
      RegEsTrib: Integer;
      const OpInternaId: StringNullable;
      OpSimpNac: OptanteSNEnum;
      const WSFraseSecreta: string;
      const WSChaveAcesso: string;
      const WSSenha: string;
      ComunicacaoSistema: ComunicacaoSistemaEnum;
      ImpressaoSimplificada, DesativacaoModuloLegado, DComptIgualDataAtual: Boolean
    ): SalvarConfigNFSeInput; static;

    property EmpresaId: Integer read FEmpresaId;
    property CMunEmitente: Integer read FCMunEmitente;
    property LayoutNFSe: LayoutNFSeEnum read FLayoutNFSe;
    property Serie: string read FSerie;
    property InibirValTrib: Boolean read FInibirValTrib;
    property PreferirAliqSNaoIbpt: Boolean read FPreferirAliqSNaoIbpt;
    property EnviarInscricaoMunicipal: Boolean read FEnviarInscricaoMunicipal;
    property ConvenioSistemaNacionalAtivo: Boolean read FConvenioSistemaNacionalAtivo;
    property IncentivoCultural: Boolean read FIncentivoCultural;
    property AgruparPorCTribNac: Boolean read FAgruparPorCTribNac;
    property RegApTribSN: RegimeApuracaoSNEnum read FRegApTribSN;
    property RegEsTrib: Integer read FRegEsTrib;
    property OpInternaId: StringNullable read FOpInternaId;
    property OpSimpNac: OptanteSNEnum read FOpSimpNac;
    property WSFraseSecreta: string read FWSFraseSecreta;
    property WSChaveAcesso: string read FWSChaveAcesso;
    property WSSenha: string read FWSSenha;
    property ComunicacaoSistema: ComunicacaoSistemaEnum read FComunicacaoSistema;
    property ImpressaoSimplificada: Boolean read FImpressaoSimplificada;
    property DesativacaoModuloLegado: Boolean read FDesativacaoModuloLegado;
    property DComptIgualDataAtual: Boolean read FDComptIgualDataAtual;
  end;

implementation

{ SalvarConfigNFSeInput }

class function SalvarConfigNFSeInput.Create(
  EmpresaId: Integer;
  CMunEmitente: Integer;
  LayoutNFSe: LayoutNFSeEnum;
  const Serie: string;
  InibirValTrib: Boolean;
  EnviarInscricaoMunicipal: Boolean;
  ConvenioSistemaNacionalAtivo: Boolean;
  PreferirAliqSNaoIbpt: Boolean;
  IncentivoCultural: Boolean;
  AgruparPorCTribNac: Boolean;
  RegApTribSN: RegimeApuracaoSNEnum;
  RegEsTrib: Integer;
  const OpInternaId: StringNullable;
  OpSimpNac: OptanteSNEnum;
  const WSFraseSecreta: string;
  const WSChaveAcesso: string;
  const WSSenha: string;
  ComunicacaoSistema: ComunicacaoSistemaEnum;
  ImpressaoSimplificada, DesativacaoModuloLegado, DComptIgualDataAtual: Boolean
): SalvarConfigNFSeInput;
begin
  Result.FEmpresaId := EmpresaId;
  Result.FCMunEmitente := CMunEmitente;
  Result.FLayoutNFSe := LayoutNFSe;
  Result.FSerie := Serie;
  Result.FInibirValTrib := InibirValTrib;
  Result.FEnviarInscricaoMunicipal := EnviarInscricaoMunicipal;
  Result.FConvenioSistemaNacionalAtivo := ConvenioSistemaNacionalAtivo;
  Result.FPreferirAliqSNaoIbpt := PreferirAliqSNaoIbpt;
  Result.FIncentivoCultural := IncentivoCultural;
  Result.FAgruparPorCTribNac := AgruparPorCTribNac;
  Result.FRegApTribSN := RegApTribSN;
  Result.FRegEsTrib := RegEsTrib;
  Result.FOpInternaId := OpInternaId;
  Result.FOpSimpNac := OpSimpNac;
  Result.FWSFraseSecreta := WSFraseSecreta;
  Result.FWSChaveAcesso := WSChaveAcesso;
  Result.FWSSenha := WSSenha;
  Result.FComunicacaoSistema := ComunicacaoSistema;
  Result.FImpressaoSimplificada := ImpressaoSimplificada;
  Result.FDesativacaoModuloLegado := DesativacaoModuloLegado;
  Result.FDComptIgualDataAtual := DComptIgualDataAtual;
end;

end.
